Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6C3C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:40:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG90-0003MA-FP; Fri, 26 Jun 2026 19:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG8y-0003Ju-K6
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG8w-0003ww-Ra
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:32 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxold2463538
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=u9B+aWFdu/K
 R04GQlv2bGISTHJgmI2RL2Z3EGgzYl68=; b=Cth+vy22PB7DWjYmHk+9Qa/PZSt
 pXywqwuBiZ3mfEHmzWaiPkV2dwNXFOQ3SOUKsnhlgyU3NUTdwy9XRu0oxJG1JVdR
 NexG61DGNLdVaZZkozvqNvVn2f+Xs87l5Pz1XeqrzDxAB5V81Ru0wv/imUIJmAiV
 0mtHzOBElqCLMpz7TwI0tZlclx1FpWnOATWViiuvXFSIvVDGKacYZp6ywcYHrsu/
 hbPdJLUtkbsVdXQLQzDf/ndXfGjft6hGKvkjn5bsZN/9f+uzpLn6CbLHMqXXOVPm
 N2gUBlPZrhhQvJu1GK1wyTrje3lAZ10jD5mcnZxn9dvQdNtC66NbdsxJnMA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1p2tu0hj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30ca1f74cacso1162899eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517169; x=1783121969; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9B+aWFdu/KR04GQlv2bGISTHJgmI2RL2Z3EGgzYl68=;
 b=aVt84FFOf+trxqtNzHH+zkAwR5J4wXqkdTDsZpL4vNu3o6lZfsVziIez362E4oumfn
 D6FRJOPGl8twg1HxZ8PyDqv6em5NiDSiSV7IE8dkq5IPrsOdqFeJMUm+2OF9mdgptQUg
 srJTqjZNu91AuiuT7UgnmUWCQ6IeV7spmm368Eg9RdVq9D033u0a+ZPcjEMP0RrpNQ0C
 tfZFwOnqAwTYTRhUBjBQ1Bv+etxypTqibfraaaVB8x0jN1mkpkRTK78U+xVN8aq8/gfX
 A2cTJn/24GpdWEogAQLcfnZw+knQtPWL+aZEoCOmw68qRiTX+xqzZKhOJlhuThOo1lmv
 xFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517169; x=1783121969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u9B+aWFdu/KR04GQlv2bGISTHJgmI2RL2Z3EGgzYl68=;
 b=c62tMHtRfcJmrLVqFlqzY9+i2ujw5mz9NRKHXctRNXgpure+KZdnM0BOqMkMr2WNHU
 SBCbski3N7VJfKSUga9DGp8ziRtxHCGFg+AsFj+uc2yRO1edp2WcGB1XbcR2hu23GV0p
 BtECCwl0yMdXnp2VHzvZG8lzL39uBUbUqVDYWc5DrKTV9Oqfv15zfMKcxicVlDw/BOny
 1cB8QgvT024yHsZYpmuCwqVjtf8FcTe7GZUL8rQ6hP0uuRneOaSfLUfWmD+XnbChjkgR
 Zabu6ENgoNybckTSDec1mrsmY0xBMG0Fm1MBdO9DknyWGlgkOE+FAXvV8By5TDz6mwtl
 k6gw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoSU8zIBKj1g1sUNji0SeUjsn4+Cng+y3JpNbE99FpNKHCqtZ+Uru27Frgx3jMleYOUKdVLRpyqgw==@nongnu.org
X-Gm-Message-State: AOJu0Yx/VPKDWnOvkYdxatOziPZkAiyt0198dm9umXZerfuyTB2ReyW8
 1UXqv/gJaUxMRYxr+63bV6s6gsL2/7r5xCVKDU0SBTTImWArcOx6/PyJum2p97VjQwcvhE8SMtX
 TD8fkd/aWxpJzkG4Ya4obKY+X62eEp7CN/wMpAuWxHOLah1EninugzgU=
X-Gm-Gg: AfdE7ck0m472tGDsI678qk1c+ZqRo2tQ5qT8WEOdMWnKUos2asJVpBp9ZPw5RKGiXp3
 Sad6+JQouWJXO9kqm0xtxk8nHBcG1ZMdzJPSBD/e8Tq2rMfIFmQvSxAFeM4VjKFCOXEeiy9l4zU
 aPtQhqgl8JxW0/l+igIKoSm6Ijq6cQRRMoGIK/M11czcED2AwD3oSx7PCssAI3AH4MNrQvqaO4k
 rrJGtOR9ssOrA9kbem8OQrYePyyTv2DrdjM9Hs1WkEs/oBwu++vLiXvV+B6nDi07JRQs/UltIFd
 dMqKdQZEgofVVa+70AD3D8PeB4Al5Dc7ZvTbbfuqaCy1aRQxQX7lVoetamrfMcuu0SpxlJ9V2pQ
 6uP/ImAOEBL+yhnPTxXrVSamMbMHMHv7lcxrzFXKzkICcb06cNHutgLUd5z3x4wyYDxR7cHIHgc
 R0HGBCtg==
X-Received: by 2002:a05:7300:7245:b0:304:d92a:e60a with SMTP id
 5a478bee46e88-30c84e0249emr8968055eec.31.1782517168761; 
 Fri, 26 Jun 2026 16:39:28 -0700 (PDT)
X-Received: by 2002:a05:7300:7245:b0:304:d92a:e60a with SMTP id
 5a478bee46e88-30c84e0249emr8968016eec.31.1782517168218; 
 Fri, 26 Jun 2026 16:39:28 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:27 -0700 (PDT)
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
Subject: [PATCH v2 04/37] tests/tcg: introduce meson.build
Date: Fri, 26 Jun 2026 16:38:45 -0700
Message-ID: <20260626233918.158740-5-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX29nIFHMUam6t
 yFuOdZNoULbw+iF6gXpkHu5TZAt7FDFbUMOu3WCldhQqBIjh/BK7qJ8HfLbfYkx1kWx/Ycch5gx
 7wRKoZzl/iDZvmUQ5PEplppzLlg1iyo=
X-Proofpoint-GUID: 4zlDZPeFEFZ2RgckuawHHLrlisD_ypK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX9gSB1f/2ojBA
 GRu8U+C9vHQMIZ00noYIQjUnVBsclB9uZdXB3x7IIf5X39L9cdi5hbGvObEFOw7IBELBbv85isv
 XiVR7ny8hDrfIMsS2WfgGg3HmcQRm3p1jecq80VHhBQb5LLVn2bB+oWK861bjISlFHZSuvvUJyQ
 Is5KN1BN92127TVUkkSfeDASSSyK6KrCGEFfVo/rTvJRMi/vMXBm5rZbUmPfqoEeNTpoPRmlszV
 UzkdpOcCxO2DrcP6t2xPkQTborU3uvlasl/3pj1ZxbuUekIpRPxdjB9yfSSCGX8QhUW4RLByWhr
 By1YuyvFQWfblDwhP5dDmrqubzAo8habrELytcwRDGZPXrIdJQefOUoXSZ6wr1KYgq2oLkqKyHT
 am3w7CBb8KYMizT/yJQvJnJuUvA5DfUIgvDe3aHvhvpCU2t85MtGB+zN3JqassW1a5kslTjqQMn
 HN57BTTU0eDiyDUuaoA==
X-Proofpoint-ORIG-GUID: 4zlDZPeFEFZ2RgckuawHHLrlisD_ypK_
X-Authority-Analysis: v=2.4 cv=IM8yzAvG c=1 sm=1 tr=0 ts=6a3f0db1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=abvXrOxmeSwasVr9r6gA:9 a=bBxd6f-gb0O0v-kibOvt:22
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Every target declare its tests, and add them in global tcg_tests
dictionary, indexed by target name. See comment for full description.

We make sure that if a user repeats a test several time it won't result
in duplicated executables or tests. In next commits, we'll introduce
what's needed to deal with that.

A test is compiled from a single source file (and later, a single set of
compile flags). We make sure dependencies are correctly handled by
generating a depfile.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/meson.build     |  2 +-
 tests/tcg/meson.build | 95 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/meson.build

diff --git a/tests/meson.build b/tests/meson.build
index 9ba04bbedd3..5877d2f60b1 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -74,7 +74,7 @@ subdir('decode')
 
 if 'CONFIG_TCG' in config_all_accel
   subdir('fp')
-  subdir('tcg/plugins')
+  subdir('tcg')
 endif
 
 subdir('audio')
diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
new file mode 100644
index 00000000000..c54c503eb17
--- /dev/null
+++ b/tests/tcg/meson.build
@@ -0,0 +1,95 @@
+env = find_program('env')
+
+tcg_tests = {}
+# tcg_tests is a dictionary with following structure:
+#
+# {
+#   'name_of_target': {
+#     'cc': cross_compiler,
+#     'folder': 'folder_for_test_src_files',
+#     'qemu': emulators['qemu-...'],
+#     'tests': [
+#       {
+#         'src_file': {
+#         }
+#       },
+#       ...
+#     ]
+#   }
+# }
+#
+# Every test executable, is built only once.
+# Tests for a given src use the same executable by default, and their definition
+# is guaranteed to be unique also.
+# Default name is derived from src.
+
+# plugins come first, as we need to build the list
+subdir('plugins')
+
+# Finally, we can create all test executables and test targets
+foreach target, plan: tcg_tests
+  # Detect duplicated executables/tests, and report an error to force user to
+  # choose how to deal with it.
+  built_tests = {}
+  added_tests = {}
+
+  # return a clear error if user misspell a target entry
+  foreach key, _ : plan
+    allowed = ['cc', 'folder', 'qemu', 'tests']
+    if key not in allowed
+      error('unknown tcg test plan entry \'' + key + '\' for target ' + target +
+            ' (possible: [' + ', '.join(allowed) + '])')
+    endif
+  endforeach
+
+  cc = plan['cc']
+  folder = plan['folder']
+  qemu = plan['qemu']
+  tests = plan['tests']
+
+  foreach t : tests
+    foreach src, setup: t
+      # meson '/' operator drops left operand if right is an absolute path
+      src = folder / src
+      file = files(src)
+      exe_name = fs.stem(src)
+
+      exe_name = target + '-' + exe_name
+      test_name = exe_name
+
+      if test_name in added_tests
+        error('test ' + test_name + ' was already added: ' +
+              'specify a different \'test_name\'')
+      endif
+
+      # build executable if needed
+      if exe_name not in built_tests
+        exe = custom_target(exe_name,
+                            input: file,
+                            command: [cc, '@INPUT@',
+                                      '-o', '@OUTPUT@', '-static',
+                                      '-MMD', '-MF', '@DEPFILE@',
+                                      '-Wall', '-Werror',
+                                      '-O0', '-g', '-fno-strict-aliasing',
+                                      ],
+                            depfile: exe_name + '.d',
+                            output: exe_name + '.test',
+                            build_by_default: true)
+        built_tests += {exe_name: exe}
+      endif
+
+      depends = []
+
+      exe = built_tests[exe_name]
+      cmd = [qemu, exe]
+
+      # some tests expect QEMU env var to be set
+      cmd = ['QEMU=' + qemu.full_path(), cmd]
+
+      test(test_name, env, args: cmd,
+           depends: depends,
+           suite: ['tcg', 'tcg-' + target])
+      added_tests += {test_name: true}
+    endforeach
+  endforeach
+endforeach
-- 
2.47.3


