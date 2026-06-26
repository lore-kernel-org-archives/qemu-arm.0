Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CFBC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:42:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9c-0003wf-T5; Fri, 26 Jun 2026 19:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9a-0003qv-UE
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9Y-00046E-Hr
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:10 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMx7t9795222
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=UJ+cVaqbPXu
 plliSMo/9+5gqb3mnPIqNSIZ9WfkbUxY=; b=AYIPDnxHo/iA4rymeQseXFgag89
 kTp1DmNdTYWncNUJmO2axNsWUQZ5+aYdW/yGMoD/ON0eJbzQi3MoBsR19Bh0rNF6
 pc8dH1+9yGFOgcXgH0si/XDgVvMOPORDSG42VNMssaikh5wPyumC2qSJ8SGFOIWN
 kPxyYV07vbvcNEmf1Uc7DKCY2/S6XP7y+UicFOoIIypq3FuJqUhHPKQlCD0wSch4
 P5iixbp+vepmBOB4Lma5jwqDPcX6uT7AvNjRddFFDQeB+q0KdNMKrfqPb788QW2b
 lxrQfQwVpWEpe4HG1l+REhRw3OPCoogihznCpzYRHv4XodnULkl/SBBnmtA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ups9kkw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30bcb065bfdso1769303eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517196; x=1783121996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJ+cVaqbPXuplliSMo/9+5gqb3mnPIqNSIZ9WfkbUxY=;
 b=jwbhs/hNyEX6UDVRmTGXRaqBX9IIoRNu1bZjzW/of9V7STMmTgN6tfv5xMGNEw1tTu
 8TwWfouW2jIR1jW0rZOcK0BdjWDOGpbi5PgyyquzEUCrkAZrCNhVNxrsrmUfIuQRuZ5e
 oG72DKygIwShZNnyl/EM1P+Ig3TSM0VpzjyaY2CPbqJz6QLhzShDGq9m1L6bPQtVuYDA
 tjhYcmsHX7IJDa/CKu1zK0KHqNeLzloPOoia4/7lYj86v/5g7Ss4CFxy+oM7f5VUIfVe
 d2i/BY98bfV1aXSmMKDm+TWmiV+336ZyGyhS8frPrNyooIStbc05AYaOSuJ0riU6iRuK
 wU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517196; x=1783121996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UJ+cVaqbPXuplliSMo/9+5gqb3mnPIqNSIZ9WfkbUxY=;
 b=YeUOP80J0vyyO7K0bP9xjMS5P8ZDRejeD9Xus32M8/Ae+vIMWCMxHvkSjmIKXp1Dqj
 j/CyYEzIc8WvqLLhLy7f+tQeM116jzPJ5lKNI1rP9QQCfjaQQYrRBkfXkrQ17VXU2vzA
 ESRA1HYi9pw/1uQYC77RtX1n2zqu0yOsKd5WugTm+ibBG1Ls7P7t0jz4y6Mj0pk5t4Cj
 D8GLXlJ5lAr2IXmdqN8BVPeMUNzEqB7TEbVMDZ4YsyxkpQb3AuRPdd02HkJtQVQxiwu8
 DC8OZpaxXdBl3E/m0Ox5jzi6toZ0XTypowAz5i4NRZwgZInY5iGM0T8duN2euiBnS/BX
 RF7w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq6P4z+/PoBeUHH9eG7HtEqOk7s3sjydfYJB0+Sxd8cGbnI8AlIh27VJNbWkgfYSsepq2NKhc78nw==@nongnu.org
X-Gm-Message-State: AOJu0YzgTWgm5qe9HTWiobAGtDL9HBSObZE/2QDYiN60gbU9g/haeSbJ
 U7Cfg+idmiRjXq7IA98p0V3S6uDLm3MRMk2bjist6J9O7Pj5l6gafRwzMdwmtLPNgzuUfvQv127
 sVMAouAmQ06xWdszJbJpN7KvD1LCzxQcOW1obbCb5tlX4gozuB64AqPs=
X-Gm-Gg: AfdE7clW/4f1m7p+8Hf7i0FVefKXobK8Sp3EzrQzCnTKOz68e/1ulikGC7dOuKEWZO8
 O6IgcFIU+Xy6Tdyh8Qu/iucqC750/LbUPyGwBUei64ApeOuuvTwme3qFgS8s8S6MX+7sQLj2W83
 xbyUePGpd9mUNp5PcGG7Of9gs4o/miN16EAU+I0r12pcOUsFS4Ocy9ny+It7eTLsCQW7g1y3PT8
 05d19y6FuVV8Hq6uicvO3fKt8vmJssnoz9AfB4hBCw5eKL0RwyeUu0hVQYU+vGvVIEbAUAYKP9Z
 rgts2rf21N2dyleRmxmaTC7gGyXRaaZ/yewb9O6b4V5EhCXleG8gHsT298V8ogJDeE0ZCTZXP2k
 4G3QGhnx9/IBAP1AGJ69nYlmGWwaUMfxLrQu374VWpGt+eRMjGDCc3ejIWYtJ0l7evk5r8ycaAQ
 2k4za6IQ==
X-Received: by 2002:a05:7300:e8a9:b0:304:bce8:fa30 with SMTP id
 5a478bee46e88-30c84b2c0c8mr8745872eec.5.1782517196295; 
 Fri, 26 Jun 2026 16:39:56 -0700 (PDT)
X-Received: by 2002:a05:7300:e8a9:b0:304:bce8:fa30 with SMTP id
 5a478bee46e88-30c84b2c0c8mr8745855eec.5.1782517195738; 
 Fri, 26 Jun 2026 16:39:55 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:54 -0700 (PDT)
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
Subject: [PATCH v2 23/37] tests/tcg/multiarch: declare user tests
Date: Fri, 26 Jun 2026 16:39:04 -0700
Message-ID: <20260626233918.158740-24-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX5F6YzK7wTcEZ
 S5t/Z8YV0mo6tCMmN10vSLBfGsTJdNKlTlTW/hk36VN1s/q2lfI8TkEwMg6EqbrA4b0+KTrwmPa
 73g0YSzA+3AAzjVISgOIXVLVWgvmQ2ic6HSnxrhlxOa5LYQiL+cvNI/kwUxEIF3Edm/JqXBk/cQ
 4X+5cDK2zoezduct5C2YnqxRTHWXb+5fq2+6M4QqT7QQtij1dYcEBMcrOSfJRCC10P3WyP1Hw30
 PqCZ4x5AQ64QBN9ox2hBtzgmb6LurJYYz14APwZKPd9L1eUbbehgUqAD2TB6uWEhdPflw1UXxAg
 SwKkuR4P2STljHt0oL+CKac0CdHuxXzxDuVIYtcyhQtVYO3GpcFLy2xPaZu4Z3NjRoBSiOI4DOC
 6UYPH9VFSqYLD/oHaJ9+OKm33pjHXEjFNpNGYp009wz2SNm9Opg9TbfyiiV4ZCjIAGSrS9rfoAh
 b6NW18xvZ/8EN1iaYPA==
X-Proofpoint-GUID: xnO8RzMCXbpT-ugWJhgRjS88M8TUMXsN
X-Proofpoint-ORIG-GUID: xnO8RzMCXbpT-ugWJhgRjS88M8TUMXsN
X-Authority-Analysis: v=2.4 cv=R6kz39RX c=1 sm=1 tr=0 ts=6a3f0dcd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=mDV3o1hIAAAA:8
 a=EUspDBNiAAAA:8 a=a29YhttJ29ErjWDLLsgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX0vU7ufOpsVb5
 FHy2kipFaa3NtKubIVT7JIGoCz8RDTnVnGrEIkpX1XDtExP8Byg91BU1NXv545u9ft9hGVg6dVu
 49ndGEZidSogTdf7yNkGZiFkvH6uhQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260197
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

At this point, those tests are just declared and not used yet.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build           |   7 ++
 tests/tcg/multiarch/meson.build | 147 ++++++++++++++++++++++++++++++++
 tests/tcg/multiarch/sha1.ref    |   1 +
 3 files changed, 155 insertions(+)
 create mode 100644 tests/tcg/multiarch/meson.build
 create mode 100644 tests/tcg/multiarch/sha1.ref

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 0036203a311..f8234ccf393 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -68,12 +68,19 @@ endif
 # plugins come first, as we need to build the list
 test_plugins = {}
 subdir('plugins')
+# multiarch comes second, so it can be referenced by other arch after
+subdir('multiarch')
 
 # Now let's go through all architectures
 subdir('aarch64')
 
 # Finally, we can create all test executables and test targets
 foreach target, plan: tcg_tests
+  if target.startswith('multiarch-')
+    # those tests are included by architecture files if needed
+    continue
+  endif
+
   # Detect duplicated executables/tests, and report an error to force user to
   # choose how to deal with it.
   built_tests = {}
diff --git a/tests/tcg/multiarch/meson.build b/tests/tcg/multiarch/meson.build
new file mode 100644
index 00000000000..99af41b3fcc
--- /dev/null
+++ b/tests/tcg/multiarch/meson.build
@@ -0,0 +1,147 @@
+tests = []
+
+float_helpers = files('libs/float_helpers.c')[0]
+float_cflags = [float_helpers, '-lm']
+
+# GCC versions 12/13/14/15 at least incorrectly complain about
+# "'SHA1Transform' reading 64 bytes from a region of size 0"; see the gcc bug
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106709
+# Since this is just a standard piece of library code we've borrowed for a
+# TCG test case, suppress the warning rather than trying to modify the
+# code to work around the compiler.
+sha1_cflags = ['-Wno-stringop-overread', '-Wno-unknown-warning-option']
+
+# multiarch src path are written to be included from any other arch folder,
+# so all arch can directly add those tests without any modification.
+multiarch = meson.current_source_dir()
+
+tests += {
+  multiarch/'catch-syscalls.c': {},
+  multiarch/'float_convd.c': {
+    'cflags': float_cflags,
+    'expected_output': 'float_convd.ref',
+  },
+  multiarch/'float_convs.c': {
+    'cflags': float_cflags,
+    'expected_output': 'float_convs.ref',
+  },
+  multiarch/'float_madds.c': {
+    'cflags': float_cflags,
+    'expected_output': 'float_madds.ref',
+  },
+  multiarch/'fnmsub.c': {'cflags': ['-lm']},
+  multiarch/'follow-fork-mode.c': {},
+  multiarch/'late-attach.c': {},
+  multiarch/'munmap-pthread.c': {'cflags': ['-lpthread']},
+  multiarch/'overflow.c': {},
+  multiarch/'prot-none.c': {},
+  multiarch/'segfault.c': {},
+  multiarch/'sha1.c': {
+    'cflags': sha1_cflags,
+    'expected_output': multiarch/'sha1.ref'
+  },
+  multiarch/'sha512.c': {},
+  multiarch/'sigbus.c': {},
+  multiarch/'signals.c': {'cflags': ['-lrt', '-lpthread']},
+  multiarch/'sigreturn-sigmask.c': {'cflags': ['-lpthread']},
+  multiarch/'tb-link.c': {'cflags': ['-lpthread']},
+  multiarch/'test-mmap.c': {},
+  multiarch/'testthread.c': {'cflags': ['-lpthread']},
+  multiarch/'threadcount.c': {'cflags': ['-lpthread']},
+}
+
+# Linux tests
+tests += {
+  multiarch/'linux/linux-madvise.c': {},
+  multiarch/'linux/linux-shmat-maps.c': {},
+  multiarch/'linux/linux-shmat-null.c': {},
+  multiarch/'linux/linux-sigrtminmax.c': {},
+  multiarch/'linux/linux-test.c': {},
+  multiarch/'linux/test-vma.c': {},
+}
+
+# GDB tests
+tests += {
+  multiarch/'sha1.c': {
+    'gdb_test': ['--test', files('gdbstub/sha1.py')],
+  },
+}
+tests += {
+  multiarch/'sha1.c': {
+    'test_name': 'qxfer-auxv-read',
+    'gdb_test': ['--test', files('gdbstub/test-qxfer-auxv-read.py')],
+  },
+}
+tests += {
+  multiarch/'sha1.c': {
+    'test_name': 'proc-mappings',
+    'gdb_test': ['--test', files('gdbstub/test-proc-mappings.py')],
+  },
+}
+tests += {
+  multiarch/'segfault.c': {
+    'test_name': 'qxfer-siginfo-read',
+    'gdb_test': ['--test', files('gdbstub/test-qxfer-siginfo-read.py')],
+  },
+  multiarch/'testthread.c': {
+    'test_name': 'thread-breakpoint',
+    'gdb_test': ['--test', files('gdbstub/test-thread-breakpoint.py')],
+  },
+  multiarch/'sha512.c': {
+    'test_name': 'registers',
+    'gdb_test': ['--test', files('gdbstub/registers.py')],
+  },
+  multiarch/'prot-none.c': {
+    'gdb_test': ['--test', files('gdbstub/prot-none.py')],
+    'env_var': 'PROT_NONE_PY=1',
+  },
+  multiarch/'catch-syscalls.c': {
+    'gdb_test': ['--test', files('gdbstub/catch-syscalls.py')],
+  },
+  multiarch/'late-attach.c': {
+    'gdb_test': ['--no-suspend', '--test', files('gdbstub/late-attach.py')],
+    'env_var': 'LATE_ATTACH_PY=1',
+  },
+}
+
+tests += {
+  multiarch/'follow-fork-mode.c': {
+    'test_name': 'follow-fork-mode-child',
+    'gdb_test': ['--test', files('gdbstub/follow-fork-mode-child.py')],
+  },
+}
+tests += {
+  multiarch/'follow-fork-mode.c': {
+    'test_name': 'follow-fork-mode-parent',
+    'gdb_test': ['--test', files('gdbstub/follow-fork-mode-parent.py')],
+  },
+}
+
+# Specific plugin tests
+# Test plugin memory access instrumentation
+tests += {
+  multiarch/'plugin/test-plugin-mem-access.c': {
+    'plugin_test': {
+      'plugin': 'mem',
+      'args': ['print-accesses=true']
+    },
+    'wrapper': [prog_check_plugin_output,
+                find_program('plugin/regex-compare.sh')],
+  },
+  multiarch/'plugin/test-plugin-set-pc.c': {
+    'plugin_test': {
+      'plugin': 'setpc',
+    }
+  },
+  multiarch/'test-plugin-syscall-filter.c': {
+    'plugin_test': {
+      'plugin': 'syscall',
+    }
+  },
+}
+
+tcg_tests += {
+  'multiarch-linux-user': {
+    'tests': tests
+  }
+}
diff --git a/tests/tcg/multiarch/sha1.ref b/tests/tcg/multiarch/sha1.ref
new file mode 100644
index 00000000000..4a8a114634f
--- /dev/null
+++ b/tests/tcg/multiarch/sha1.ref
@@ -0,0 +1 @@
+SHA1=15dd99a1991e0b3826fede3deffc1feba42278e6
-- 
2.47.3


