# Copyright 2016 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

FROM libfuzzer/base-fuzzer

MAINTAINER aizatsky@google.com

ENV PROJECT "nss"

RUN apt-get install -y mercurial zlib1g-dev
RUN mkdir -p /src/nss
RUN cd /src/nss && hg clone https://hg.mozilla.org/projects/nspr
RUN cd /src/nss && hg clone https://hg.mozilla.org/projects/nss
VOLUME /src/nss

ENV FUZZERS "/work/nss/asn1_algorithmid_fuzzer \
  /work/nss/asn1_any_fuzzer \
  /work/nss/asn1_bitstring_fuzzer \
  /work/nss/asn1_bmpstring_fuzzer \
  /work/nss/asn1_boolean_fuzzer \
  /work/nss/asn1_generalizedtime_fuzzer \
  /work/nss/asn1_ia5string_fuzzer \
  /work/nss/asn1_integer_fuzzer \
  /work/nss/asn1_null_fuzzer \
  /work/nss/asn1_objectid_fuzzer \
  /work/nss/asn1_octetstring_fuzzer \
  /work/nss/asn1_utctime_fuzzer \
  /work/nss/asn1_utf8string_fuzzer \
  /work/nss/cert_certificate_fuzzer \
  /work/nss/seckey_privatekeyinfo_fuzzer"

ADD fuzzers/asn1_algorithmid_fuzzer.cc /src/nss/
ADD fuzzers/asn1_any_fuzzer.cc /src/nss/
ADD fuzzers/asn1_bitstring_fuzzer.cc /src/nss/
ADD fuzzers/asn1_bmpstring_fuzzer.cc /src/nss/
ADD fuzzers/asn1_boolean_fuzzer.cc /src/nss/
ADD fuzzers/asn1_fuzzer_template.h /src/nss/
ADD fuzzers/asn1_generalizedtime_fuzzer.cc /src/nss/
ADD fuzzers/asn1_ia5string_fuzzer.cc /src/nss/
ADD fuzzers/asn1_integer_fuzzer.cc /src/nss/
ADD fuzzers/asn1_null_fuzzer.cc /src/nss/
ADD fuzzers/asn1_objectid_fuzzer.cc /src/nss/
ADD fuzzers/asn1_octetstring_fuzzer.cc /src/nss/
ADD fuzzers/asn1_utctime_fuzzer.cc /src/nss/
ADD fuzzers/asn1_utf8string_fuzzer.cc /src/nss/
ADD fuzzers/cert_certificate_fuzzer.cc /src/nss/
ADD fuzzers/seckey_privatekeyinfo_fuzzer.cc /src/nss/

ADD build.sh /src/scripts/
CMD /src/scripts/build.sh
