Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF10C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:42:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9e-0003zh-W3; Fri, 26 Jun 2026 19:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9c-0003wZ-TK
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9a-00046u-RF
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:12 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxHVW2487285
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=RGb70iN/S6g
 59wLpkAbDsbdKWagfh72V6KAHtz9T2U8=; b=NhULt1Y19y0fAw0F4So6XrVZJjQ
 5Ni7wIExNIn5TiJKOUZdpKJ28zF9/73C3ynz70WLqLuzm2UuXNKhhuwjhRATiAAT
 qwARV2pZitD9gAYS0WMmiAaS34BRaTPCxWgSSArOFi2e1BnEZilkyb4DB+sdaNHm
 GwLzArWKJ3Yzo7Uvu9f6f8RVR8NgqRbhOZYXAkvXqt3XlXb1xaw9DWF20JTrINFs
 Eb7kMmwuqsGGFlTRZvOMDAZrkOqjN8L/IpSXMLPwB0tRv9sbyyiFGXKrH6L7Yy9E
 7iUUNGbeHs3O9sso/+9+Fne+7WoZMhPde3wUictDoMLVDM5Z2H4RwKwNpQQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1wsds4v6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30ba395b047so4488181eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517199; x=1783121999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RGb70iN/S6g59wLpkAbDsbdKWagfh72V6KAHtz9T2U8=;
 b=FwERqmnbdQthK1rga3XI9C+LUUOXzhuYIX4PKEsRRay7HCRQ2NIvlVMpdg5UJbutmk
 Nhq7hV/3bp7oyKmRYVLQ3Su+V+77BHx3Fb7iA7Yp5ou6rGzEHTS7j2F9VhlWV9ONWcad
 9DmoZB/YdAPVk/4LvvtgmQ21pWEcKNUfcI/X7jLHRMm0hTIpH6LPsjUd25ESOTvBrWgN
 +o1FGUgMRXFGmgPwPJD3EaoEUcyuY728f5KUpmq1qCqlsVvjMP0ItIF05xHTtYYybmUn
 L970fS/IHWzLkOk1rnqnl0U9ux51ALPtWcUgqb7hRROm99SOg5nmZ9FHfs+hmn9BO/l0
 eLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517199; x=1783121999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RGb70iN/S6g59wLpkAbDsbdKWagfh72V6KAHtz9T2U8=;
 b=MNt+jLMdedj/dd6Kj/Jp9xuAOl/nJn6uAIAuYrykDyk/aullkpbOOvplgvmwCMp0zM
 7KF+o5Sk1wIptqgfOD4aHVpWNAlJvq7n/eOgfYem6on+O+ldGq57v6XF29ulUg5NwfJ8
 WqfQRniwfZ2e4TEDtT2oWmmezv5i26zmhXNLHQjcViFDX7LE5qKhtim86DH4GIkuwaSs
 XEFmttUWz1UnNDCfF8oG1ZlYNm9pe7oIKTpEyNgu3NgI6/AZlIrCIkMQIRp98ydwv6yg
 XtYm5afkwq9lTGgqGltPvHnI3jtWRHuiNM1Wtk/XWjh6jRbwxyJ4dA51GByrV8ugQCqd
 NtYw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpfZLdiwxvqW0tX8L2phOQzslyxKEDlnO/SHqdzTtOSASD5KwMdqvqQ14Uz2v979GRg4BB9PGHI8A==@nongnu.org
X-Gm-Message-State: AOJu0Yys8XgAtp2NiyQDBy9iJ/KRaEmaWrQvCN5ByHEW+whAsca/N4Qw
 TE8ieC3F5Emh9lflQ9S3oQ9MIzK9f1xbC+NvCkt6GQcxXGaYDoUrbbTqQxd5JUfb5jzDM+TD/iM
 RjA8o2Hhpl8cCTOl6Ffgeey2SDrjBYm8jBLkYfjquNkCOSSdbgODrw1M=
X-Gm-Gg: AfdE7ckjUnGSMQVS2v2B9o0K0X0cN1ZlwWcUwX70olRoghhZz4IoiLIM8D+3Vyin5Ay
 yDoQK6moyXqV5gRDxnaO3SWJ0vY8yfDS5PzL8e7TNuKQSv8t0Tw3VtH5t3zf3CdRCrM6UBslEZT
 uG5bC1V+tAjlUbYxCQrhX+OKeIbXJwRhgjgbl0tYAyTt+n8JFDB14Me1nQfvBcIV29ebn4Lc+iB
 HsHHXe1NhFU2AI4zD7LO/6B9jHxZY4S/lz1H5dmGeOkg2k6RcFrhCUkCbg3qbFiYqhaPLs2BQZN
 ReONLp2zQvk8XkICa6DnWZ6vkV6ZZVQpbxrSEQ2/zBTYQ8TaXUUXKtQslz9gFb7VTfPlvJKSCs+
 a+/ukpmsUdzNaWtuz79DKP0SwHA5cp1JMSHvFtsiBy9p0R1/o3lESw7+/kCeJmbClwN8zgFlO6X
 F0GM/CyA==
X-Received: by 2002:a05:7300:7c17:b0:2f1:6252:f8fe with SMTP id
 5a478bee46e88-30c84b94259mr8612978eec.3.1782517198920; 
 Fri, 26 Jun 2026 16:39:58 -0700 (PDT)
X-Received: by 2002:a05:7300:7c17:b0:2f1:6252:f8fe with SMTP id
 5a478bee46e88-30c84b94259mr8612952eec.3.1782517198464; 
 Fri, 26 Jun 2026 16:39:58 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:58 -0700 (PDT)
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
Subject: [PATCH v2 25/37] tests/tcg/multiarch: declare system tests
Date: Fri, 26 Jun 2026 16:39:06 -0700
Message-ID: <20260626233918.158740-26-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RNyD2Yi+ c=1 sm=1 tr=0 ts=6a3f0dcf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8vYM-gic8w0O4C_0kjEA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: wot2U9ycAWJoYatZOr_ODbBWuTWnGPHt
X-Proofpoint-GUID: wot2U9ycAWJoYatZOr_ODbBWuTWnGPHt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX7+gRqdnJdZds
 5bJndOCf0ohjAa3d5UOV6EjYwTgZXs9ZHqeGISHFmiw7vgovVrbL2P44G388IiwFcSFE1BZonyG
 nYY0kVZoxCJbQN/Mi908/M+wBb9yEW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX8a4h7pL2aR/c
 aBpRn4ALLTB9ZcWPqZXGwvgRtOSb4eM2CUsCBT8ZL2YvOkmrMJAyNfwUkfNATIAls7N0nlV9CiS
 PXZM+MZWiZBeWHYEIJwlTnNEAU/zQKN0D5wx9rJ7isNrp+FOe1XPupw1uB3db5TrKDMs1GKAVFZ
 vi/WjU81QV8LpPYIwpFrtdZw20FEEbONqAo79KLQKyhD6zH5DCUqL2/oIDqfLqia+tdqHrv0/Hk
 u+UcmN+foWLod3DDwQOwjGZaSObohJm9hEySgDaFKj4uov74rSCEyohZq4HXXau/FMxSdke1ROG
 PBwMuVQR91fLnqRXomOWuQuZtrJeWxuZXaT1yyJ0W7oaNvlTrbZ2Tu1cnyW/1bVe2ZxnE1SBJ8Q
 si/BE5HlELe4rD1wNz5GlMvkPxEKOZdhK+gvUqStg38AnxWEFR7SqOoW2aAB7ISXY215H8SndPK
 3HDB1BryZ5w0++ycOGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
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

We now declare all multiarch system tests.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/multiarch/meson.build        |  2 +
 tests/tcg/multiarch/system/meson.build | 53 ++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 tests/tcg/multiarch/system/meson.build

diff --git a/tests/tcg/multiarch/meson.build b/tests/tcg/multiarch/meson.build
index 99af41b3fcc..508fdb585b7 100644
--- a/tests/tcg/multiarch/meson.build
+++ b/tests/tcg/multiarch/meson.build
@@ -1,3 +1,5 @@
+subdir('system')
+
 tests = []
 
 float_helpers = files('libs/float_helpers.c')[0]
diff --git a/tests/tcg/multiarch/system/meson.build b/tests/tcg/multiarch/system/meson.build
new file mode 100644
index 00000000000..f71c12db38e
--- /dev/null
+++ b/tests/tcg/multiarch/system/meson.build
@@ -0,0 +1,53 @@
+tests = []
+
+# multiarch src path are written to be included from any other arch folder,
+# so all arch can directly add those tests.
+multiarch = meson.current_source_dir()
+
+tests += {
+  multiarch/'hello.c': {},
+  multiarch/'interrupt.c': {},
+  multiarch/'memory.c': {},
+}
+
+tests += {
+  multiarch/'memory.c': {
+    'gdb_test': ['--test', files('../gdbstub/memory.py')]
+  },
+  multiarch/'interrupt.c': {
+    'gdb_test': ['--test', files('../gdbstub/interrupt.py')]
+  },
+  multiarch/'hello.c': {
+    'test_name': 'untimely-packet',
+    'gdb_test': ['--gdb-args',  '-ex \'set debug remote 1\'',
+                 '--output', '/dev/stdout',
+                 '--stderr', '/dev/stdout'],
+    'wrapper': [prog_run_and_check_forbidden_output,
+                'Packet instead of Ack, ignoring it']
+  }
+}
+
+tests += {
+  multiarch/'memory.c': {
+    'test_name': 'registers',
+    'gdb_test': ['--test', files('../gdbstub/registers.py')]
+  }
+}
+
+tests += {
+  multiarch/'memory.c': {
+    'test_name': 'memory-access',
+    'plugin_test': {
+      'plugin': 'mem',
+      'args': ['region-summary=true'],
+    },
+    'wrapper': [prog_check_plugin_output,
+                find_program('./validate-memory-counts.py')]
+  }
+}
+
+tcg_tests += {
+  'multiarch-softmmu': {
+    'tests': tests
+  }
+}
-- 
2.47.3


