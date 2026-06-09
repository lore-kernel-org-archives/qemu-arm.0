Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B50CD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:49:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JM-0007AN-5F; Tue, 09 Jun 2026 17:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JD-0006xG-6X
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4J6-0008CU-2x
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:30 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4een3167679
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wJRVYYDL9J5
 awLnVNWgque9y4f2f+h6eDXpG+UPbSkY=; b=oM1wxGUfTw4o39cntGHEKd4ZwoT
 t97KMLCdhWQEgcXSzFwyk/o5Ykd/7z0cXhVP1A7xUEzKKrZfz0b/u0M/+RhyzIsn
 ZfuD0yXRt42Ba75Pfz5FoX230IXOSedL2tbJzTmuc7yczewtib+JaPhM0EbWkT4N
 N5vo+fiQcd53oGStEsR9YwzLxVesCeV7iqmJTVZSD+svBZhiQPV7y8jgKrV0k8Rj
 qHI9AxqUOJo6H6jmQ+K6gLpdK+uSyl7OiksKXoeGc8uLrbU85A9zGX5BrnPfjhde
 hYswB+lg8nlclzY0j+GizgE1nNeVQ/lIuaO4Itytn1DYNZrd5yQqWsdYbLQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenrc0df-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1370417c0bfso5658645c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041692; x=1781646492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJRVYYDL9J5awLnVNWgque9y4f2f+h6eDXpG+UPbSkY=;
 b=QW14ThPKonk50txPgc1svzYeOwSpBZQsBir5jHJi7tmFC2B8tD80PAajNtgeblT8z9
 FWppI+lO9M3ZQo3y5zyrT3ML8kPk30T0BwNWSvoZnJiurRA4XKBMWk15mSiUaPMqkBqD
 adKA3fwMoBMlc7ePughLoAzL5NFjcqhKsSVejiJDxB22INYKwsaDGOd3GUv2Y8oYzIs4
 RyPUbj3Uimnr8Q1Bg+iU/ic7uuIbpL4AIcHeefvH1e/fu2enQf5EN9CQoa3DgpVkXc2G
 4bCTnM7Fkduj5BsNa2iQiB+QokxFJAle5Y/8cJUsxkawlt6NjLwkdrUbMk6KR6Y/9orc
 Zo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041692; x=1781646492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wJRVYYDL9J5awLnVNWgque9y4f2f+h6eDXpG+UPbSkY=;
 b=l/B+zMh7PE+4MYAKCUrBaRksLAuznLmCp5q/lrJ2ol90ggQSO/4G4k5VqkgCfFXXw2
 7DWgPMHf+cbyzOY0iXKnuUUIkcuDOp+EhO9RY+wSEP+FZmYfJh6I4D0wF9Vf4rUdkmGb
 mLhbniA8eSdhtQi+oQ53mCu2onktexBxXJ1Gtb3/dzXMWC3apHngZzJ9o8aYEuRuJGCU
 e10SzPSbu0bR6vjTFTNb/AEBbQvL9L0R5EwvurO3iz0bsNk5FvtMnFGUBbjT446dsfNR
 bUv2HZATPjH/O0r0eR8bcwNZ0bm4efSn1CszYW99QAwMfexeyp+zijL1j/NddtUxiSpC
 i0iA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/c4ZC/FPoa/tg3SuzN9wGPifpClRHlw8YKPFSaPKTY9/GEOXzMMh/84UN6xV426STZhCtzYTj3QQ==@nongnu.org
X-Gm-Message-State: AOJu0YwDCumGxgdqI84cWcoq3ch318GNc6rVArXqMw/5Ln/82tiQIiTG
 xptdSMnPKaNGwwOLLPEtfT+fLOVrQHX0JGgIjXoFLBidCBwiGpS5Dl/VA9JQf9ydD0gygKbWu1N
 whe/GuQMOOTMYX7buk8ewFmK5He1eIPVjiSHdwOg508r6HuvitUtth+g=
X-Gm-Gg: Acq92OGLq/+rQCamdpHCr8W/c05EfbMZ1EyWVEweHc++EOtlQDi2PfchKBptOdHqmY1
 OldjJWnXVgbm/AIn23Qm0L1xXYhUG9SkvxCype2eY1Rvcjd8avbIWrESwGWinjBZbSV2ZIaWHuw
 9VW5tPxzqysxNT/VXrc1hfp7kVGrroZqGGPKip1U+x4RLlwmN6fbH5kPsOPzXJw17F926FHpUST
 PyKJvziqU16fNuWLMhS3+DhatDJvNMJ/lfsJC2B5ydDj6NsjlaZ7K7cMsNaltIqoZagCiwxVy06
 08pWKx+6KHf48EBrfqPZF67n1kpNu1RELFXqSUWlnsy2gbM2jwyLR7AJnAqx3a+5BscanpJrazN
 MhzJsE9Qo2FxHoZedXMXojPgwMRZlSBM4qmXStCNwBxyHLqx9iIJr5A7oe3nNRpl7Sk+9nB9Ulx
 zf/pN7BTfHtgevoRfm
X-Received: by 2002:a05:7022:207:b0:136:4bbe:9523 with SMTP id
 a92af1059eb24-13807d3698bmr9681169c88.8.1781041691859; 
 Tue, 09 Jun 2026 14:48:11 -0700 (PDT)
X-Received: by 2002:a05:7022:207:b0:136:4bbe:9523 with SMTP id
 a92af1059eb24-13807d3698bmr9681139c88.8.1781041691368; 
 Tue, 09 Jun 2026 14:48:11 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:10 -0700 (PDT)
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
Subject: [PATCH 18/27] tests/tcg/meson.build: add wrapper run_with_input
Date: Tue,  9 Jun 2026 14:47:36 -0700
Message-ID: <20260609214745.772536-19-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 66DgmMl46ST7TjhPGivomrONDxTEfsgc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfX6Db91KriElNu
 FStcNBwfLLuYj8aGGSX2S55AazcmFkcAfSNXEJPgYQ76zhr/NzwxqBiJISEwG9nRDQNLbb7rF52
 VxE1ZQkEf65AR/UMRkHyHTzXsKARQMcQSg6QICBhCXSWTxQps0Vo0rFn/E33E9Gn5KXqn6OSn7j
 NuBecZS8bdYuj0rDm6VvvLS+Ab0yM9jlQpeViMGS+HTHKQrJxSdzDAcLRmgqjajWE3T5/ynXuAF
 zye4gD8vRXLxY2PfBR9U8W2Pq8SsOJKB+cyyszU8tXFCdQVuUXEkvyJpsdgW57LXjEFA+zCXR8S
 ZCv1hEoJ1zvrozteIksX+UrQBy4D9qpbIqqHKxyTk56oY9sXwnSDVggSHckHHr9bu0XeZK0DSFN
 V15QEQUFU36BLXshRsPAJ0YHEI4jvL+DUG6tT/s6KHu+wcpi+mb+1maC/heJji/2CYEnZb+Z8mu
 Hcl7FUviVW28AOLoV8Q==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a288a1c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=xR2A3ow12ysiLA1IkLQA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 66DgmMl46ST7TjhPGivomrONDxTEfsgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
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

Semihosting console tests require console interaction, and were flagged
as manual because of this. This wrapper automates interaction, by
sending a specific string on stdin.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build               |  1 +
 tests/tcg/scripts/run_with_input.sh | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100755 tests/tcg/scripts/run_with_input.sh

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index f379449e582..7201a7809e1 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -8,6 +8,7 @@ endif
 gdb = find_program(gdb_progs, required: false)
 prog_gdb_test = find_program('../guest-debug/run-test.py')
 prog_run_and_diff = find_program('./scripts/run_and_diff.sh')
+prog_run_with_input = find_program('./scripts/run_with_input.sh')
 prog_run_and_check_forbidden_output = find_program(
   './scripts/run_and_check_forbidden_output.sh'
 )
diff --git a/tests/tcg/scripts/run_with_input.sh b/tests/tcg/scripts/run_with_input.sh
new file mode 100755
index 00000000000..3d280547c3a
--- /dev/null
+++ b/tests/tcg/scripts/run_with_input.sh
@@ -0,0 +1,12 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+set -euo pipefail
+
+if [ $# -lt 2 ]; then
+    echo "run_with_input: input_string cmd [args]..." 1>&2
+    exit 1
+fi
+input="$1";shift
+set -x
+echo "$input" | "$@"
-- 
2.43.0


