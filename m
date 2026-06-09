Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A45CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:52:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JL-00079F-EJ; Tue, 09 Jun 2026 17:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JC-0006ti-1e
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4J5-0008B4-3N
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:28 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4hBP3229304
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/3dP12Uvx72
 2B/DNL3VVlAYoH8B4D2AzjDRtgYlQmFM=; b=LGFGxaPnRGKYcZunB4QnU2JZBH0
 LVchmFu8rdBfKJhzvxs/MSolfQDUE0rFl0prHFLP6UBtRFVqUTTZEY6DIy/v2DEK
 udc7rmymYBbBFHhFbM2Cg/14p6tm7Frs7QYAzGn17brv//ZhHRL0DuDxHOZAuBk9
 PSHJE8P2LEh2TszmaPRYSchtuC/q9ear1vzdgqLWT2XCClPaoxabImTGFeYNrxLc
 dF/6ZRZgrrm6BXEKH00mxFCRCLfPmY+c27OLjWjVYCdL6G4D6ItJBc7bttArGSip
 DwVA8SGxu3XkmjPwAwRbibVcAHYfK4rWESNqVlHCJ7tiaKlIM/3XYBjpU7Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkg2f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:11 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-1361d52b3a0so7022441c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041691; x=1781646491; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3dP12Uvx722B/DNL3VVlAYoH8B4D2AzjDRtgYlQmFM=;
 b=X/kDRfwXcMbm+aiKthqGLzyYAm4Bbkp2Onf25FoycZYChYXHCQAeN/jms3UNhQbXM6
 /106HWSiZf03/gXBt7htAxT+cGFD9DfMJzZZ4pk134GRBYbQocCY9WIZ9rQgInZdzWiC
 bTdhBnQO7cmbz3xC4mzXm+302syuiZY/TL3RSRDs+yrgYXlqGWY7Sair5Kxr3zNLUBJO
 g0KCF2CyCxT8brHAlqbqoAcuSd0Jqy1zo2YvN/pm6AxMftON9dUNR6GduI/zkBtklnN2
 fgSbMjdklPgbCyY0OhygKuw7ajnv4W+GqN6rnlBEko+hSxioJNeNls85UtERtfBcrMZV
 KLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041691; x=1781646491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/3dP12Uvx722B/DNL3VVlAYoH8B4D2AzjDRtgYlQmFM=;
 b=LoXddiekR/GurWbD8E/QoFByEZmH2mkNY6OD4lEKndtcqodc5NzkLNOdpFgHKnrzoR
 eXv7X0TnxKqPlIPuLmmUMjlSVI44bBuvV58SO5PqQ2/vIhSCeKqUnYEVYJ2yh7oHRO3f
 3sJAn2CvaCMpORPR3GXUSDEvlBLtVChpMff9vWafAHVxCoMYIOs1rhg96g7pssJ9oaeE
 rq/dQ2kfffUV1sp5f69aGeSE5TU6p91+wf0NTEucUGgwHyOuynXmTHWgE3N4Cio++u1k
 46PgL3JQaW4h4RGMzq9YxbNYje9XMpqGgVJKf2m9Vg3C8n55mWBttOJ6nr3b1Ew4QQAV
 cXiw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8GJin6ipWmCIAbMXrJn9MU1abchYvSeIim4hhEao3SxT7iLOFstjtiFaExmR1AJOzKB770uOSMDA==@nongnu.org
X-Gm-Message-State: AOJu0YzSj+IYpf3zVA8LyArAkOOCOeR97UcxEC3cF9ZMSOgkN7hnUVQ6
 e8lK+IRJSsAXvx5hHZ6+HjcKh6rVf5J3XN5nHtD86HqYLwVY5DNMXB80pdQIeSLA7z7c/ijKC05
 OlJzeFu0WNvpkKDLowc+PS4qcjyoclkz185GVFkTQd40O0t02DhI5UKE=
X-Gm-Gg: Acq92OG0+x5plLjMhm0aq6DOUlh0l1Zej0LMvfMJxSLbQ9qWiNbdXZ+aIit3qO7NkV1
 wleHI8CgIoAvQazvTtqp/tbFJoWVTv3sFU+OS3ko2fktnQVfhqyoFVDIRtlPF/6ffnR85xpdXXt
 zNX+H/52EobGQ7/Lq5wlVZ0GJYL3Cq3ui0ReYDftsWy8KN4ICkU5n/sbZEuUm/ky5US0MSPTVVQ
 hHYGefBwfoxRdYnpJCc1rUPPMxcQtbhyDO6ExB6SOUtes4N0hvO90EC4WCUgEfQ6LHMQvmNXmeV
 wpNsXtJZR0+HWEGAulg6KUBzhHuf1+jSLSuyn1el71l8HGlhWBlk51TL9XOtJCHj3m6bguMN9PQ
 upUtZlXolg7Y8W432p6G5v+NahiH9AR/ot9j5CxgqEtb+8tvUo0jBoAccZNIMc3lnViKKO0KxtY
 tj2RC6+gsKDXUDkJwZ
X-Received: by 2002:a05:7022:618c:b0:138:717:9ae0 with SMTP id
 a92af1059eb24-13807179f75mr11560811c88.12.1781041691062; 
 Tue, 09 Jun 2026 14:48:11 -0700 (PDT)
X-Received: by 2002:a05:7022:618c:b0:138:717:9ae0 with SMTP id
 a92af1059eb24-13807179f75mr11560783c88.12.1781041690525; 
 Tue, 09 Jun 2026 14:48:10 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:09 -0700 (PDT)
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
Subject: [PATCH 17/27] tests/tcg/meson.build: add wrapper
 run_and_check_forbidden_output
Date: Tue,  9 Jun 2026 14:47:35 -0700
Message-ID: <20260609214745.772536-18-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNSBTYWx0ZWRfXxf5IRAVc1BLW
 ukxX4zJ8d6k6JCR8uhLtIEOiZF24WJeHwwUL/XYX9CBv65uRnxOAB8hu/pWzhHAkT4wqHVkgsA8
 YkkGi3cfBZoi3x+yfynd/sPBRQHX6rziphYnV0frAwNMbeEuw1IZEq0BH46PWRWfgzvi928WDzc
 vYXmwAFwEEypzYiLTK0Y66WxyexR0jB8YMdypSTrX3qgBCbu6sGUicY1QeLm3Gk5yXrvh8ia1I/
 Y4K5YILEV0MH1cv/v1DPWHszL18vOX/gUj+zjk0yfgYol9UoJI4T1o3rTaNV7tLE5LgM2nTXM7j
 7JGoaiQYiVkHeGeasNLhclq53IZgrZ47hMZbUHBL7g7pM4QnpDYk3VsKwewusjbAAii/w05vV72
 rBVnh8Sqln8AbcDvKymbRGAWcRhblOGlAOcfbqiIWV9fytz3x9lEHqvnJRK7/X/JeMQv5i7C5xI
 j/6IkCI2He3q9Ng40Rg==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a288a1b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=fCjPhq1eeATGNm5uL08A:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: KHzVeyqJIgTprxqs1GB2hoUMajQqKitH
X-Proofpoint-ORIG-GUID: KHzVeyqJIgTprxqs1GB2hoUMajQqKitH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090205
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

One of our test requires to make sure output does not contain a specific
string. An example is system multiarch test run-gdbstub-untimely-packet.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build                         |  3 +++
 .../scripts/run_and_check_forbidden_output.sh | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100755 tests/tcg/scripts/run_and_check_forbidden_output.sh

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 3d2c0d6583b..f379449e582 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -8,6 +8,9 @@ endif
 gdb = find_program(gdb_progs, required: false)
 prog_gdb_test = find_program('../guest-debug/run-test.py')
 prog_run_and_diff = find_program('./scripts/run_and_diff.sh')
+prog_run_and_check_forbidden_output = find_program(
+  './scripts/run_and_check_forbidden_output.sh'
+)
 
 tcg_tests = {}
 # tcg_tests is a dictionary with following structure:
diff --git a/tests/tcg/scripts/run_and_check_forbidden_output.sh b/tests/tcg/scripts/run_and_check_forbidden_output.sh
new file mode 100755
index 00000000000..4486ca8ef83
--- /dev/null
+++ b/tests/tcg/scripts/run_and_check_forbidden_output.sh
@@ -0,0 +1,19 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+set -euo pipefail
+
+if [ $# -lt 2 ]; then
+    echo "run_and_check_forbidden_output: 'forbidden string' cmd [args]..." 1>&2
+    exit 1
+fi
+forbidden="$1";shift
+output=$("$@" 2>&1)
+set -x
+if ! echo "$output" | grep -Fi "$forbidden"
+then
+    echo "output does not contain forbidden string: $forbidden"
+    exit 0
+fi
+echo "found forbidden string: $forbidden" 1>&2
+exit 1
-- 
2.43.0


