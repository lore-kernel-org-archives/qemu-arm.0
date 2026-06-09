Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556B0CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:49:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4Ih-0006bG-WD; Tue, 09 Jun 2026 17:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Ig-0006Zr-Kz
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:47:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Ie-000807-CA
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:47:58 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4uoL3266743
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zXRYa9eexkL
 ds5llwNUpkcMtTJX5hLAOkMq50ZjGG48=; b=EbsH3vafQZ6oBAzYY0ij9KkAnlm
 GIQlEdsZuKEs2fvYQUQAYgWX1a2hXh60QC1XJvkQN4N6taIY9ttyKb2/WeDSor1J
 g5hJ5DT+A68xKfd/GcSkcxG9hzsPhUKWmHb9IlPPPWSKMgV+AOX0KPkfxpeytQX4
 zU8+5+k9zpurkFuBsyymxkhDBPgQ1UVneqs3PoivwoBoPqd3OdnHnDQOtlj26pIr
 BKoMMy2HkpXxXP8LBRduLpR/syEgg8CRmUZ3pzbW62rW8h7lCb1uhy/DGOLmrWdm
 3VhEMJ6QIXdG4BZqAPvE8TdVglpCT1FGsyJBGisv9L8T+RFGYlAjK364RJg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jujhn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:47:54 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-13709ab38a8so7309832c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041673; x=1781646473; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXRYa9eexkLds5llwNUpkcMtTJX5hLAOkMq50ZjGG48=;
 b=kRazQNzS5mJuxsc2XRHSIDgNLQBjGDJLqnDynLvUr1vnrBdhtMJ9KoZu2fn2HGqfIF
 kUsARn/oeKRmfFLxXLp6wm898NXQDVSMj7yBp+CyTD4pNpJ8PoaR/ho4nAeVViIYPOcs
 D0X40XyDeuzxOPsgekw1jjuAweHpCMIAiB8omjn5mgCdgGj6Ga0NWSt0qtnXxX0IfbM+
 ToOjF4ocQyBbzu6pVsUH9c9vqDQgmk2iRd7V1Pfl11BB8kZbqzj81bIZWv6FojOyeZL7
 ywyvwssXes5Wy6O0Kb9Grwva4RCf5HuMly6LlywI3/KdQKz3TiVa3XvkOcfnAeN+crU7
 vjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041673; x=1781646473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zXRYa9eexkLds5llwNUpkcMtTJX5hLAOkMq50ZjGG48=;
 b=hi8wlDAYPOEDsnG+gOWJ03ZstXMAdDslkDXtRTfY8NUPK/K8PeSLTVqt4Nf5qPidLH
 oGl5dV/aU1c43fUmpU2TAKEQJe1coTb0NA2rZ9ZRBleJiuYJ3wAtruS0Hlg1RY9F6nVk
 J0b5uSSFMjFS/ydbfzP7VIV3GfBm1yQ/SnRlRde1dJET6V5ucYLn8AcuZ4tcs3UWUckh
 qGcwyb8vJ3mrB3+obJsoSzFtWOBhNfaswuj7ScdV6NqZjz+KokUP0W9OLXXUoxViUn6q
 tsQLvAjGKZVexQpCl1v//tx3OIYWH0JrsKqvi5kpA6DDE8Gz9C0jUsaTdS2A/xZiNPZ5
 hfgw==
X-Forwarded-Encrypted: i=1;
 AFNElJ86yn4jqkIjjQygcIUKExSogTiEJQJbO8mAlOdM28semRLFmmVqmvAPJWukkk/I481j3NF2/QDh0g==@nongnu.org
X-Gm-Message-State: AOJu0YzMs7iR6qtIh34PG/+x3tjs9YD8sr44Sn+98bzqAGECdJ+1lEym
 Iec2hN412QTQ624rrMKOSr8qUvSQ3VjYb6lszXGM01WumCGxIpSJGxIHeURno4gZkzEN0bCZSl7
 GqAfOAMEkCXDfB2WtY+EW99D/CFBOiWLmFLf77BN4tb3tbePA4Qnmkuc=
X-Gm-Gg: Acq92OFVRwlshgaw+eu/veeCBzo5PYBVqiOFrN1keygfvrHB5+PN7vb5oGrETGUzKVe
 RcyHyJ9ntG2+1BBgZ6bBSOb+dLMyMUBB4HaAl0R2P1tFIEvX8BAGQXz0ptKRD5rIPmybv+67nkn
 4lx7OiFfXfnzu9IN5A49BNWxRIQWEPSTcABDYVQw0bZBt1m8AAKQf7RxslYQWXsVmDrMM6oIBV4
 Un/8eGo4Dy8pe6NGzrtV180bxZiJ1qbHQpDlQVDxarLVW+WJRq00b1Qf1y0p1P6pOnj2pDl0VGW
 T/DNjl9RrQiOW74dNnvTg6opOaxP4Z9mJ9m/PTThg4L+YJoAUsOLM/3SV1UBV0xcfKxLBko6bvB
 M58QXajAvi3ye5AeUdKqYfHsnoopx+suVbGSUseoPbFU7mewVYMoVEzrD+K52WKiViVsP5JQR94
 mBIJjMUShHYx9DrtyE
X-Received: by 2002:a05:7022:10c:b0:138:62a:270e with SMTP id
 a92af1059eb24-13806697d11mr12694587c88.11.1781041673401; 
 Tue, 09 Jun 2026 14:47:53 -0700 (PDT)
X-Received: by 2002:a05:7022:10c:b0:138:62a:270e with SMTP id
 a92af1059eb24-13806697d11mr12694556c88.11.1781041672917; 
 Tue, 09 Jun 2026 14:47:52 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:47:52 -0700 (PDT)
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
Subject: [PATCH 02/27] tests/tcg/multiarch/plugin/check-plugin-output.sh: take
 test output as input
Date: Tue,  9 Jun 2026 14:47:20 -0700
Message-ID: <20260609214745.772536-3-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eaWVNIQO-QHcilB8LhfwCYjv_czLdP0D
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a288a0a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BJ7t3AzVVyt49CR6OUkA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfXy/cPk8e1TrYR
 qRa/8Rqg0dKa1fcO+YAyjRQhz/6HKq8iNWOiMdBOnuHIiaVsSCV84t3Lzd8JGDCgX3esy3o/jRn
 OAQMxQKGwgfMe9mo45KMBNln/+F5zN9gXW9Z80tH5f3UTngZJ0izTOpZ4E/6Zow8RMH6JCiXNYC
 F3jX/JNH/GqaJyUoxX6MaZDIGyrFJshGhRNS37+sTunnFYpzBETY7MgjQF5FpBv4OBqO50sN5Di
 pxU/eEeFxxaI3aKeMU7c+/1fdv939u4dLArDXgR9LbZHaBtC3hP4j9eu2DtsXbiD2oPIZsIyEBW
 pqIrB6pNlEE0mrIiUzjRhHa7ysNanvVpI9yLWAiqXbi/CSmOqm4zcb75yTQ4hslKkkwXF+GjA9F
 Kie16CVdoZThGFxRj0HVpSGiiZ+myOc5LXl1LAN+vIU0EgBOgOJ7cU3JGTlBwN9BkD5L8cqfpoR
 T11FGCX0oYljYUNHkkA==
X-Proofpoint-ORIG-GUID: eaWVNIQO-QHcilB8LhfwCYjv_czLdP0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
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

Instead of executing test, just read it's output from a file. This
allows to standardize how to call check plugins scripts.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/multiarch/Makefile.target           |  3 +--
 .../multiarch/plugin/check-plugin-output.sh   | 22 ++++++-------------
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 508149d57bd..f46983cc76e 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -211,8 +211,7 @@ run-plugin-test-plugin-mem-access-with-libmem.so: \
 	PLUGIN_ARGS=$(COMMA)print-accesses=true
 run-plugin-test-plugin-mem-access-with-libmem.so: \
 	CHECK_PLUGIN_OUTPUT_COMMAND= \
-	$(SRC_PATH)/tests/tcg/multiarch/plugin/check-plugin-output.sh \
-	$(QEMU) $<
+	$(SRC_PATH)/tests/tcg/multiarch/plugin/check-plugin-output.sh $@.out
 run-plugin-test-plugin-syscall-filter-with-libsyscall.so:
 run-plugin-test-plugin-set-pc-with-libsetpc.so:
 
diff --git a/tests/tcg/multiarch/plugin/check-plugin-output.sh b/tests/tcg/multiarch/plugin/check-plugin-output.sh
index 80607f04b5d..338c9ced23e 100755
--- a/tests/tcg/multiarch/plugin/check-plugin-output.sh
+++ b/tests/tcg/multiarch/plugin/check-plugin-output.sh
@@ -1,8 +1,7 @@
 #!/usr/bin/env bash
 
-# This script runs a given executable using qemu, and compare its standard
-# output with an expected plugin output.
-# Each line of output is searched (as a regexp) in the expected plugin output.
+# This script checks that plugin_output contains line from test_output.
+# Each line of output is searched (as a regexp) in plugin_output.
 
 set -euo pipefail
 
@@ -19,18 +18,11 @@ check()
     grep "$pattern" "$file" > /dev/null || die "\"$pattern\" not found in $file"
 }
 
-[ $# -eq 3 ] || die "usage: qemu_bin exe plugin_out_file"
+[ $# -eq 2 ] || die "usage: test_output plugin_out"
 
-qemu_bin=$1; shift
-exe=$1;shift
-plugin_out=$1; shift
+test_output=$1;shift
+plugin_output=$1;shift
 
-expected()
-{
-    $qemu_bin $exe ||
-        die "running $exe failed"
-}
-
-expected | while read line; do
-    check "$plugin_out" "$line"
+cat $test_output | while read line; do
+    check "$plugin_output" "$line"
 done
-- 
2.43.0


