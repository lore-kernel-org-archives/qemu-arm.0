Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561F9CD8CA8
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:48:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4Ik-0006co-Bh; Tue, 09 Jun 2026 17:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Ii-0006bZ-Ci
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Ig-00081R-9o
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:00 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4K9R3230220
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=nTbgljNMQ9Y
 jQjV9PiuA+KKFUINzblNmPx/UU1UN0dw=; b=E5dVultiH+i+XQYZW0A3G7BGjOi
 54g7PPLBxr/UADin7n9r9NSuvThjeUD2j6YOqmJqeRIOfCRHOA+xJiUC0BUhoBYB
 tqS4Kr8IXwgQw0wCtDEM/w5gIpovljiBJmpzcdcAOCMOQ9hVgEjrNpY4/DTiP4DQ
 QtmRo6GiZgDV8xY3wsX5i+tyOn0Nk0VGBa9urjAzLFGSF90bmpOqCWX9UerDU1IB
 nWi/b/gQzJMGqroCbtD6SArwPrzGC8zXYzUMC6N6DIFJmfdJt3GSptWu3ezOsR2x
 WJNmSeevAU0QF2Y7B9G22Vt0kdh+/aaaZ784Zrq2psmbe1ZxLCisPPz4o8A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgkxpg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:47:56 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-1383975f18bso51254c88.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041676; x=1781646476; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nTbgljNMQ9YjQjV9PiuA+KKFUINzblNmPx/UU1UN0dw=;
 b=hfBk9JkwQFg1/HZhV22hYa3xtHzUfxkdQjJpUNG2pGlYhvBGUqqAx2bufAKewUSUkI
 N65/N+wiHUOvT6aFS3hfWbM3EQZhf5W2OJnqgTOBT8QfTZvVKoSEmaDflo7ws8xP6IMP
 63e3wIWfI+u7HLCk8Gba8r2UhgY2wNNGkCBviUSHcny+rT7A3lhVZAa2RhWya1lNDmz2
 l41F6KTD6QyTV7KkqSOfsdWFvobyTryyZjrAzP1ecE70oxEp/akQC77QMZmWBrGL/qks
 1Dxnm6C9ZUIwYO3Ub+ZHDY9fquD/UbQkwmdN9jsAIn3uh+6+Xg00S0UswMYuuWLnz31o
 CfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041676; x=1781646476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nTbgljNMQ9YjQjV9PiuA+KKFUINzblNmPx/UU1UN0dw=;
 b=QMfw+7gMFMjUTvIy1xWc4RH5dXjxCSQUAHZ+3ILwlhO+Dag6Cfi5Kha26aXkCNHrsL
 12n2LyEirOyBlPqvsY420g+fyuiyhrStf7MVLSh6MNShn2HZTmRvaPJgZR7fzdnvOJRa
 8hfvo4mbhe4jdhIvRuHKu7bCU1lZalmAUVNCfXVPQURGEGhv4y52TRPKt+vY9FklTrEY
 rSBMliEJ0873LjmjJJDx/lv/aOWba2R4Bs3EuhkB4lw1weG6+SdpBVV0PiS1YffZ/RmI
 e3uatmMczlFzvl3Q7bWmjSa2Jpi7v291tMVPymQHypHBWoT5WP+M4iBe6euD863+r3H8
 AoTg==
X-Forwarded-Encrypted: i=1;
 AFNElJ85lF52O5l+enRW3LNH6oK06+4n5swfs7N8zhr0K6FvmBlw44sK0TmmKqJTtn4ok7l32wV3vQz8rA==@nongnu.org
X-Gm-Message-State: AOJu0YycaS1JgF5xAIG1eGbQMr8j59zFzVABisnXfSLRPvdHH9Id/f53
 s5Qcsalz6g6yHAl+U/RWgS0Z9LkRVOCxKMerRC4iJDQYRCiZudwvI2vW4D1S+moTv3VbGobCKBA
 DBJBZx0dXXMsmC2gKkJgfMo8rKeF30I1QHAP6Fs/UDid3eNryEcsn8gA=
X-Gm-Gg: Acq92OGEiYhYicmoWhvOdwfsZLHs06JIkarAxi7uXlvYxZXZJEMkVXx8rkDKz6aWwTa
 YXiPmA4khqGnW5duv5O/UI9YVJCpjGUYWfOIGMZHDsBFvffWFqnXMosCa36XoZh36pipy9aeAzI
 UUu7RbC8ttMHffIIDwpzWIsi3GG+35L9PnAqJJ0A6scbg5+AH/HUKxm8yGGOR96nqOr9NWUdm0/
 TGJXFE8i2TjwXSlZMXw7EjbxezE2YAwR+2MjCnxDsdBHezRJa7hLSIQqeA8e6v84TQTwXgLnhGD
 iQJz7S2hfT6rmuDTtqCu4LswggwLqZ8j9fcUyz7vAvXPxYiu6cJc3mslScEL5Eukwp23Tidygo9
 nnVgvFaFQ9frRJfssZFmA/TTHeEZ/ozcQ+T+hJi4NoYBx02qcrNwJ6cLQoD+59x6Etm0XzN3Aka
 eT4o4bS2YDMgOexbq2
X-Received: by 2002:a05:701b:454a:20b0:137:f532:e342 with SMTP id
 a92af1059eb24-13831a57485mr2179833c88.7.1781041675994; 
 Tue, 09 Jun 2026 14:47:55 -0700 (PDT)
X-Received: by 2002:a05:701b:454a:20b0:137:f532:e342 with SMTP id
 a92af1059eb24-13831a57485mr2179809c88.7.1781041675329; 
 Tue, 09 Jun 2026 14:47:55 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:47:54 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 04/27] tests/tcg: introduce meson.build
Date: Tue,  9 Jun 2026 14:47:22 -0700
Message-ID: <20260609214745.772536-5-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfX192ykf2qsOo3
 jFKFJvXlTAEIRf+rS2OnExNBmrC757zDBba6Q67YTDvqTv/Z14RK8x4VKOBi2N5mkHLaLDCE9J1
 w7IbFIJjXf7TZbYCcFAqWCWue8m1dtGYGV7RXv8fNrGlgExCFBAGAtCzf67lk0VuCPlFzBxbDq0
 OFZFB0dOOgWof2NY+6Gqd7gmHM9BstS6pg0+kdEevBoH0shDesYncUg8dcGvymFnUU/cG5EhaXx
 vVWossK4eLLLJZHLWIJP2lfqvviLrvDD9rvxOexZOmOmWwqbAEf7pvFf7wTfOMkvmd+lFYOGZLK
 39EaIyIarX7SjV5wz5lNZqltmK0WQP4ljHKBUAShtYbL3ERG7ahYSaASMeJa+F3R/0gbE9Bggza
 9nEek9JD0dla0v7vnihYL8aaprzqlY7BHvG6J5yzSAu9j7AYeaSBqDH4yAW8XHgf8muYDuXLbMn
 8kR0RI7/9VQwBVBGV2A==
X-Proofpoint-ORIG-GUID: Kc58VdRAHw3V6SMSDBYwuYenMe-4aTfx
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a288a0c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=v_12uhcQQg0w4xMxk_YA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: Kc58VdRAHw3V6SMSDBYwuYenMe-4aTfx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090204
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
 tests/tcg/meson.build | 94 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 1 deletion(-)
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
index 00000000000..72d1a9f8986
--- /dev/null
+++ b/tests/tcg/meson.build
@@ -0,0 +1,94 @@
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
+  # return a clear error if user mispell a target entry
+  foreach key, _ : plan
+    if key not in ['cc', 'folder', 'qemu', 'tests']
+      error('unknown tcg test plan entry \'' + key + '\' for target ' + target)
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
+      test = fs.name(file)
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
+                            build_by_default: false)
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
2.43.0


