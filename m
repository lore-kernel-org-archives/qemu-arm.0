Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDA2C44500
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:40:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG8y-0003Jr-BU; Fri, 26 Jun 2026 19:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG8w-0003IS-Li
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG8t-0003vI-Pr
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:30 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxEej2462813
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=bfrRstQ4m5xXMKyFG1IHoq
 SVqXjU/zji+djk5WjdFMc=; b=Q0aYUykc5RGtEG9mn1ROwm66yCcpScY9kFwTlB
 GjBj1Ai8iDW1lhIBW+kpLJDqsEOZLJ6ezbWlLokD+8pnNsdlQkxes8bC0VI4GkuD
 PpvbQdD3MfdZiyWP/vAYm59Flc9On+QlUsD2chLb7cxsAYWB6wgfDnBGTE0qN2Xb
 CYLSVifoA+DBkACln8q9GwXWA1KIbtkLdKSZru5bG0AweiOQCW+M7iJGUjcdsUdr
 4UGcBE84u8YS4R7pYe5xjZcXHnxlBiDtpkByY9Obqm0ZMB3dLHdmti7oEkGuWT16
 Md6ZCzKC2UkWm1fYg5MrwvIBTjdsTOAVP8GfGd0kC9Ihw2qA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1p2tu0h8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:24 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-138156c0492so433588c88.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517163; x=1783121963; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bfrRstQ4m5xXMKyFG1IHoqSVqXjU/zji+djk5WjdFMc=;
 b=bYBGKx0Ilt+z+goGnGj7MOVji5IeOYiy+arr6H+aLxyGYRv372HEmesRfOhz/aT1Li
 +leZfhL3YfjGa0bt0cLdb+tttGb6Zzg0m3Aac7z8ikBZn+agOweQS7LbtoAqL3VXdtvD
 KCKOOJC51mhg/LLcgiJbOm4miDRAoNQYxbtRN0KBLYHgDhiPOYVYhUzPWztpZqZeXRy2
 U14D+mI2PPe1wJrTHEsKZwm6EX0DM1YnI+uECGe7wM9chmWo5rNmBTGS6Kp7YGNrzSqA
 yNO2Gk7W286IFnRo9KBI5RL8oZdaqu5Gt5xQBm2ej3UMyhU8FUEkzC7T+dIHP1UKClA3
 x/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517163; x=1783121963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bfrRstQ4m5xXMKyFG1IHoqSVqXjU/zji+djk5WjdFMc=;
 b=HhS+7+4cAr2LdAl/jW7JdyNUtn5blhCFwgEAC38yTK3/wL7GiT0aQR/XnFRelvBAlO
 1Il78GbsY2AxMhxrCrURaZkXc/8c2OEvN3nt+zKknoDSkW2Er9oKRFjS15xSQ811oY2R
 kVu54+72dxJrWMfZva9nud+hHkMKhwbDkH6n0HhObGzIiLGk0T3cBaeIxbHRQR1qq23+
 PBFDiSrv3Yy2wkQzNXAvWr/RsQIvoayjOcUta6oN239+0/2Hri78fN+xmCWxJ9GgbUvb
 cUAk2siuSLqlSgZpuRZXcw3+Qg4oKFd48AQtsoz4kXBWnm4rVoZTIbEDmbdSeqp51+Uu
 oohg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqIK16JXE90tGupxB03Kz+v2TOgNUslO4y3P5Y25xvb+6uLeMIvB68Y5fH0CFPdfDbSrPkyOtvPqw==@nongnu.org
X-Gm-Message-State: AOJu0YwSIzqhZV3slQvKEqO5PxwaUenR/KBX+6m14jXsE7KAw6GVRl/0
 h1CsSnPF4/mJDj5o4Tqwtpq+hbQHi8qoq6CzONO4RwsZ0PAm542FgROMtc0Qfuo3JpSjX28X5GP
 X4v9hf1gGIfANQnwYG/UT1sCAaVMwwoElVW9E/JfmCGEpPSJ5uMdhWsg=
X-Gm-Gg: AfdE7cmsrMhgFXtsXyCqRPJDZ8W2VsPoSugb5dyyoHkhdZNjj3mPx57RvFL4o0dikZe
 phHZscdnuoZcHgNWmUx88ybVzeOmQuIvLY+s3hKoVyorLBcaMoG0r+T3OFEZRncv83a1Y5W41Z5
 lNd9BeCsJbIOdApmAzPgJoIES6Qa5Fn2PVzM3SDRLInJ9q4+Ae4KlU/q4iAMMrRxaNE1/t/iCdF
 zX2hEgKt8pTeNRfShvZMP5iPDqaK4cqDIN+5T0IHRXVK5J5Etap25PdFo6aOtX5qtVTpMKXnmi1
 /PGcEiUaMAexRai9l/QFscGwhViwIxDgtpXyUkiU590NPux6gIOiBnCwOWyJNlq7XbzfaP1pEUK
 65LMao07RUBnvnA7yMvg4LGm0ug1cVi69d552uaiqlY/52xfCOKXDNk/Zwp2QedfIFDq50ChUmR
 ax6ZgHlQ==
X-Received: by 2002:a05:7301:9f13:b0:2f5:5dd3:1fd8 with SMTP id
 5a478bee46e88-30c84b9dcc0mr8016579eec.8.1782517163024; 
 Fri, 26 Jun 2026 16:39:23 -0700 (PDT)
X-Received: by 2002:a05:7301:9f13:b0:2f5:5dd3:1fd8 with SMTP id
 5a478bee46e88-30c84b9dcc0mr8016549eec.8.1782517162439; 
 Fri, 26 Jun 2026 16:39:22 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Thomas Huth <thuth@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v2 00/37] tests/tcg: run tests with meson
Date: Fri, 26 Jun 2026 16:38:41 -0700
Message-ID: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfXzfzRrSAHnwta
 wIj8lBgeUY8TwwJ22wUc5+5BUj05+odvoDHS2aZQ0kbSx55dS3ln3nCmSNM8sSKjQYQWW5jSF+T
 BWUSLpMJgKVVA8CsSwnUUNuL74cUJZc=
X-Proofpoint-GUID: ukOenhWFD84-sBzz25VS81hLw6Q6dF6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX7X1fZ/4e+q9c
 Z7iga7q5tk6NYuLFMJeM0FMtB/uU551vfuldVnRc8AfSkkQFKtydQUaSmgj1+XGNVmAMzaXKrtB
 rLPUgNah0rAW6ngVFxQBkaOQOz3sfLViLcpFaY43D/zZgkRqFfWntAUtR3g2/ue2nTCUtyWlKT2
 yxXUMSkmBKsR3vJjKS4ezfv1YXlWRTKseqZzOVIw8Ybl06/AhGB10qT2aEOH0Vv5dyG2DdweMCE
 +GKF5hcCgt4I9LBF7XgYI+25lToQ3l6GvgR72azUvH2nb5zQEmNH8RPhcW/WCCOzNZe38DQLSyw
 304Xfi8xXnN9CneXQnTw0Akxqvf2aF9eHFzywoPTOYdj8J3RGO9HVICm7f/aN5wVSsS8p8b2+/c
 C9Pct7cas1x1YW9hCr7QJsa5l+s8Tev6tRgZZqgFyqH6+vHlceluUaC0LQnd42dwY1fCHHWTzp0
 0u0yWTx1UWyLlc01QKA==
X-Proofpoint-ORIG-GUID: ukOenhWFD84-sBzz25VS81hLw6Q6dF6Q
X-Authority-Analysis: v=2.4 cv=IM8yzAvG c=1 sm=1 tr=0 ts=6a3f0dac cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=l9dzDIMX34EMjvzPqbMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260197
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This series is an experiment to replace TCG tests makefiles with meson, with the
goal of having something more readable and maintainable in the long term.
Also it closes the gap that tcg tests had with the rest of tests, by integrating
them with meson directly.

It covers all existing tests for aarch64 architecture, including
user/system/multiarch-user/multiarch-system. I'll carry the effort to port all
other architectures once we agree on a base. We agreed with Alex to not merge
anything before all arch are covered.

It implements all requirements listed on original thread [1].

[1] https://lore.kernel.org/qemu-devel/87wlwfsay4.fsf@draig.linaro.org/

We also have for free:
- correct and complete dependencies for any test, including:
  scripts, c.inc, headers, reference files and binaries/plugins.
- catch test declaration issues at configure time vs test time.
- proper data types for variables instead of string expansion with make.
- we now build tests binaries by default with 'all' target.
- hopefully, better readability to your taste.

Main ideas for the current design are:
- make arch files as simple and explicit as possible. If it conflicts,
  always pick explicit, as long as we don't expose meson details.
  remove any kind of "skip, override, filter" logic.
- never expose custom_target and meson details in arch files.
- catch any spelling mistake on test or any dependency.
- keep complexity contained in tests/tcg/meson.build.

Usage:

```
make check-tcg
make check-tcg-aarch64-linux-user
make check-tcg-aarch64-softmmu
make tcg-tests

from build folder:
./pyvenv/bin/meson test --list --suite tcg
ninja clean
./pyvenv/bin/meson test aarch64-softmmu-asid2 --verbose
```

v2:
--

- s/mispell/misspell
- moved comment about why we remove 'lib' prefix for plugins
- if user declare a wrong entry in a dictionary, list possible keys
- build tests by default (with 'all' target), as long as cross compiler is
  natively installed, to avoid triggering a container build.
- reword some comments based on reviewers feedback
- always declare all tests and avoid "per config" errors (no 'if' in arch files)
- move compiler feature and gdb version checks directly in tests/tcg/meson.build
- add support for cross containers
- add top target 'tcg-tests' to rebuild all tests

Pierrick Bouvier (37):
  tests/tcg/multiarch/system/memory.c: remove unused variable
  tests/tcg/multiarch/plugin/check-plugin-output.sh: take test output as
    input
  tests/tcg/multiarch/plugin: rename check-plugin-output to
    regex-compare
  tests/tcg: introduce meson.build
  tests/tcg/meson.build: introduce exe_name
  tests/tcg/meson.build: introduce test_name
  tests/tcg/meson.build: introduce cflags
  tests/tcg/meson.build: introduce qemu_args
  tests/tcg/meson.build: introduce env_var
  tests/tcg/plugins: build list of test_plugins
  tests/tcg/meson.build: introduce plugin_test
  tests/tcg/meson.build: test gdb support and introduce gdb_arch
  tests/tcg/meson.build: introduce gdb_test
  tests/tcg/meson.build: add default flag for testing compiler support
  tests/tcg/meson.build: introduce wrapper
  tests/tcg/meson.build: introduce expected_output
  tests/tcg/meson.build: add wrapper run_and_check_forbidden_output
  tests/tcg/meson.build: add wrapper run_with_input
  tests/tcg/meson.build: add wrapper record_replay
  tests/tcg/meson.build: add wrapper check_plugin_output
  tests/tcg/aarch64: add user tests
  tests/tcg/aarch64: add system tests
  tests/tcg/multiarch: declare user tests
  tests/tcg/aarch64: add multiarch user tests
  tests/tcg/multiarch: declare system tests
  tests/tcg/aarch64: add multiarch system tests
  tests/tcg/meson.build: add generic plugin tests
  tests/tcg/meson.build: add logic to skip tests
  tests/tcg/meson.build: introduce cc_feat and cc_feat_cflags
  tests/tcg/meson.build: introduce gdb_feat and gdb_feat_version
  tests/tcg/meson.build: move gdb_arch support check
  tests/tcg/aarch64: delegate cc_feat and gdb_feat
  tests/tcg/meson.build: let test infrastructure detect compiler
  tests/docker/docker.py: return error code if probe fails
  tests/tcg/meson.build: introduce cc_dockerfile
  tests/tcg/aarch64: add container support
  tests/tcg/meson.build: add top-level 'tcg-tests' target

 tests/docker/docker.py                        |   1 +
 tests/meson.build                             |   2 +-
 tests/tcg/aarch64/meson.build                 | 193 +++++++++
 tests/tcg/aarch64/system/meson.build          | 101 +++++
 tests/tcg/meson.build                         | 402 ++++++++++++++++++
 tests/tcg/multiarch/Makefile.target           |   3 +-
 tests/tcg/multiarch/meson.build               | 149 +++++++
 .../multiarch/plugin/check-plugin-output.sh   |  36 --
 tests/tcg/multiarch/plugin/regex-compare.sh   |  28 ++
 tests/tcg/multiarch/sha1.ref                  |   1 +
 tests/tcg/multiarch/system/memory.c           |   3 +-
 tests/tcg/multiarch/system/meson.build        |  53 +++
 tests/tcg/plugins/meson.build                 |  11 +-
 tests/tcg/scripts/check_plugin_output.sh      |  19 +
 tests/tcg/scripts/record_replay.sh            |  16 +
 .../scripts/run_and_check_forbidden_output.sh |  19 +
 tests/tcg/scripts/run_and_diff.sh             |  15 +
 tests/tcg/scripts/run_with_input.sh           |  12 +
 18 files changed, 1019 insertions(+), 45 deletions(-)
 create mode 100644 tests/tcg/aarch64/meson.build
 create mode 100644 tests/tcg/aarch64/system/meson.build
 create mode 100644 tests/tcg/meson.build
 create mode 100644 tests/tcg/multiarch/meson.build
 delete mode 100755 tests/tcg/multiarch/plugin/check-plugin-output.sh
 create mode 100755 tests/tcg/multiarch/plugin/regex-compare.sh
 create mode 100644 tests/tcg/multiarch/sha1.ref
 create mode 100644 tests/tcg/multiarch/system/meson.build
 create mode 100755 tests/tcg/scripts/check_plugin_output.sh
 create mode 100755 tests/tcg/scripts/record_replay.sh
 create mode 100755 tests/tcg/scripts/run_and_check_forbidden_output.sh
 create mode 100755 tests/tcg/scripts/run_and_diff.sh
 create mode 100755 tests/tcg/scripts/run_with_input.sh

-- 
2.47.3


