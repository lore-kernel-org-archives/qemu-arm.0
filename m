Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2E3C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:41:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9T-0003a7-7i; Fri, 26 Jun 2026 19:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9R-0003YZ-Fp
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9P-00043f-Kp
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:01 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMx4jR2487021
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=G4I/lx0WkC3
 n0Bu26oW6ayHVqjbHuBk7Z59IPQ1LOSg=; b=Bdiu+nww/Gl4QDLcgaXzSeUuLmp
 BA2LU0IqSBLIC3zBCu7P7okRmPPcEiRyh1BusvkwbWXNKQIX8Wgh7eQ+5UHOV/zc
 1EhQvd5JFLYJYYHWkcrGP9OoOeC6QdZnrdbcpgQiTpWD9UDQ41FhZfEgaLTpiGU8
 tJ0mnD4BwqwpgoXJD5nVTjvvploN/gKBUhGBlOSWmDHamcsKqHSbUu84xZn+MEDg
 j6UzGe8/x1AgN8nwlCBY+BaTEgqB2W8EzJUNERhktHFZ2YyAyBaFp9uZz/osHUX7
 Pt+4ZAVuB0HOv/rwJJe1848gKV6pZiHyxLdS3yKWta6g5KjlZchHDw+KFWw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1wsds4ug-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30bccca5620so2091385eec.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517188; x=1783121988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G4I/lx0WkC3n0Bu26oW6ayHVqjbHuBk7Z59IPQ1LOSg=;
 b=TtIVoNniqtvVBsyghgK4lq4O4jfBeQ0CGNkaLqCviyBCnncRwpL5aeeDzZR9Y+s6QO
 IkuNJjmbmpDpKBSKfMA+rcoVeWE5EpHlIeCeqrE6ct1BGthde8lor1+cnkL+4d8qTEe6
 U2KN1M4ekWrV04bFZEjhMlaErxuhz2BC/Yv48q2ucWI7xKJ1bcWzIOR4PIXrp3iEW7gR
 AcCJ/mNK7xYgVk22MXGRfnU6n+Bm4qf/qYmyhBcLBtHoq/EyjmRMljb2BTVExMANUz4y
 59aNRcGPeghmR697+UN5DDNBWFMlz+VXf2VKzxZcCH5p8lL+ZWmUUnxoW2adtw26mw2q
 oBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517188; x=1783121988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G4I/lx0WkC3n0Bu26oW6ayHVqjbHuBk7Z59IPQ1LOSg=;
 b=PZnHu8lIXtyi5xkyISzu4MoRVAd1x1aXmch0KIssTeUcPcoUFCnAXCCxm7rBE6Bf6u
 3cNdytVGEDyjVFAS9HW1P4duN1YY5a5uRXreD4IqNnryHm5d2PvM8E7iRh3CtDyemqT+
 /tVLRKUoojJARrKDYH+qPWJJl5/NdNgXWNwILm5KstXusP2yjgWIhHXFYQ3c7zkpS40e
 8yyP0V/Y11lwFYfqkYjZGX78zdnUUXRDJI9cs4PjErJILy7An8C9m78M3fQnuSopV+PZ
 TC0VbmMkPC5gxnCc6sntyT4c0WXAj+sMdphHU6/TpUjsC16WHnqfOdBXGW6UJ5hVxJFL
 YGSA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrxdNC5Cv1AtN4D21PKZ795RTfCPvUuniDfwBMg97wIhpuHRH6H0aPAziAw4i5HEb1MlOQZzL9nbQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx/cHKpDIvBbMK1JtpNJin/SXWtjI/VJyXy9tnMPLTE3Yrusa/M
 nuvM6E93qgFsLtRWHFlNnfdpNlM9BCuQ80QR53g1k24QBhK3v4NIXGpbINwFbuKhGk/ck75Ot/7
 tz2O8419f2w9gBQ2991/D9KN6VL4NKf4yzZhgjXzfCE//1Xuu9h038pY=
X-Gm-Gg: AfdE7ck8R8D3ZFnjkpIuF6AZr1k/RJvvf8NQPoHxBQqqVuoBesBiJwMq4Ll/xKcMp9q
 LEESu5k0RXCawOHMw1kVhT53TRXdUlnd+KXzu1g+UwKl4AwIGBQhspBzB6JMnrF1zZpVoKjTFUD
 LVt5ms5fngoTISqpW0PUO0rtguLTw+750Dn7nXs9RlsDOryt3kPXXXcf/qzdwNFUx6XiKJGv+CT
 N3RbpjtmJ1sfnitGUQ5S531p+i5HCg4tAEMTqS/DkPFHp46TaK0ZXoaKV4DSYxuChXfuN6ziffu
 pF2bKGHq+zRsWCRslgqRjKax7JB7s531+2O+okslT3KSrl6pBgXcJZ7J8SLv9vGawfr9hzR6Jgk
 /XkNFX7bkAQsVpgW/Wf1dCAszzd298o6QbNLak9VhfB2nKKN+ygmxlKqYkX/zCVBRZzh0yT9Py5
 iZSZfLqA==
X-Received: by 2002:a05:7300:6902:b0:2e0:1f09:d924 with SMTP id
 5a478bee46e88-30c84cf3f8cmr9178773eec.5.1782517187725; 
 Fri, 26 Jun 2026 16:39:47 -0700 (PDT)
X-Received: by 2002:a05:7300:6902:b0:2e0:1f09:d924 with SMTP id
 5a478bee46e88-30c84cf3f8cmr9178742eec.5.1782517187182; 
 Fri, 26 Jun 2026 16:39:47 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:46 -0700 (PDT)
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
Subject: [PATCH v2 17/37] tests/tcg/meson.build: add wrapper
 run_and_check_forbidden_output
Date: Fri, 26 Jun 2026 16:38:58 -0700
Message-ID: <20260626233918.158740-18-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RNyD2Yi+ c=1 sm=1 tr=0 ts=6a3f0dc4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=fCjPhq1eeATGNm5uL08A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: azJ487dRgBf1nND2qtzlSLpy2z1TVPAx
X-Proofpoint-GUID: azJ487dRgBf1nND2qtzlSLpy2z1TVPAx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX3NNuowwZO8jT
 2rzTp0lBcyvDO70vUj5LmnziEcZTZHzXi4JG2mNkVdzFgQHykGmqV+O+hj1d+kYOfol4UvbCUoJ
 vLEF8uUy4c4Y5o2a04uRZedEHtVW1Js=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfXzZ0VbS+aVjyS
 iC0whOUJCxF3w0RaSFD2ix2PBPfp0YWtoBY16xvC8xjY5yYjda6Z91AN3xv6DByk5M87be2eTb3
 VkAgLkV1IcQgFJkf3F8SFxwNmiKH23EW5iZwgL/lwGrrhyEr5a/FWm9XpijpuKUClzVGpgkVs4/
 mikf3PqhV94L/eftqY7N2QIImj5k3uueOL6EBpnItK2kQLUV/ysB2y9vQ7Q6dASLjQY6B3VkGEn
 LLpydE4TRKit187flNW2fk799XLJTdkRzomAm3GU4jhckQJRduXlMPPxHi5UqwsNpmjKN5t5neQ
 nTYK3j3QRXg5LwNzuSH+EcSsmuQrTV0KsJo3SU+H7w5HiNxquMV9E8m2f1GsDB5JTXegNjpHJGP
 R11HhlknXEC88CmOR6GzCmv2tKvwTXDoIvlRQVaY5Wzixpz6lgXf2YW2pUFsfFMS4Co5cVgsVOJ
 cX0yHDgen+w5NzsG0Bg==
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

One of our test requires to make sure output does not contain a specific
string. An example is system multiarch test run-gdbstub-untimely-packet.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build                         |  3 +++
 .../scripts/run_and_check_forbidden_output.sh | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100755 tests/tcg/scripts/run_and_check_forbidden_output.sh

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index f052e731de6..130f8a83c54 100644
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
2.47.3


