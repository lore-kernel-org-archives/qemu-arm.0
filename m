Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B7BCD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:49:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JA-0006rm-AS; Tue, 09 Jun 2026 17:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Iv-0006es-1V
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4It-00083k-AD
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:12 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4i2K3229341
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=aMpA1Zh64s8
 KexCk2V7o804331/kR5xrcpeFiGqPvno=; b=Of/pyJXsae0ZE6wUEAw2WKQl3jc
 PJi0w3+N5kl961PIlHmYmYFOgnwXrntI9mTFnoXybprR7BQbRFj5b14JZd7BXQf0
 9K0mKz0XSSxZGBYxWtm2WAGzwYCIc0w2KgwHAWY7WYw7inAH2SRUhnynpTOxBao/
 SHoLI7DDHmCadlEAFkjkhRgfWpsXU8vl7NU9YHI4r5haqvjC0cm2RlsT33IwODxB
 WheIoY+hHP+O8jt2UQ3txKQTXeGsXjOOnLMVCOPDCU4E5F//FDrqrBepMvJblXPf
 jZlQNO+/qST3FXnTTdRPAM9uvppH24Mt+aKvK5d31IJ9qx4tqMr1Pb/AIBQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkg15-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:47:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304ee7d1368so5980360eec.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041679; x=1781646479; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMpA1Zh64s8KexCk2V7o804331/kR5xrcpeFiGqPvno=;
 b=eR/JKI5D5U8Bx1yRpFnK9YxQCVyOMYPdSfyiGD0i8SNoEW5Y6cGzxMlokt1uEG4c3+
 Q0JyRn56hyfG1jId7C/ldHh9NOyWKdw64Nqor+y8+TSNPYxv4Bw4twUIRpEB/PDTolIX
 Sdou4MLs5+H0CXpbfc5RZo9JOQyx7KDQbEe07UAc37naVuCRIcCRuOPPMu1JTkaXLPFI
 bUpjY2DnVXT7I5dyRag8RasoqOvsqzWwvgccFGJf3R4kUjEUkdELRW7cgUEmkHHDXh6b
 0uYzzEnROJqyMuyuh8krUJXKw5FTZyeprcQ68cTTfMWy4p5MSg3K1So+G8wOb3u1PPgD
 /ASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041679; x=1781646479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aMpA1Zh64s8KexCk2V7o804331/kR5xrcpeFiGqPvno=;
 b=Tz4wb4XByryLxokPLO96WXgiJx/n8ypEphkyeOGJy+zdtK/qNVg/bnS8nrzI+etxyk
 iJOJBUGgHSKSo0THvbI/DtH2Mrm0I8Ns9qxIlMNMpU8Lsp99FHt3Go33f6XZ4oqKikGi
 UWmh1MdmeGgv2jkilwtWuOx8y+bXNM2tS9RwhwmlloACEqQRI3dE7B7JDOicBco2mkiE
 YnZKMSBBAhHlUfY2wzeWacZo7LVj5fGITJlx6Ch9X+eGNOAi57BBzfJ1EyfOqdgm9qra
 kzKnDUzbpgL+bfVk2wocRgswKVHsOd5GhZmNTS+NVIDf09WdvulMHii5I6TKSOC0lwxG
 kB1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9oAL+hrr3TviRUapmDAfjbrplWUPl806Etnhisn7MEWrTV1PJCI/haOTy9hq92+zhmgWNabGIiQQ==@nongnu.org
X-Gm-Message-State: AOJu0YxVpYXblFNsUEet9YKXgH3OAgkovnhlqqNj7UswpIYTWwduPWB+
 yw28HcUzNCk92xFXLXnnrBWstKIhfd+LCA5UvHAXjfsoH5ROBC4d+vymbxqFyhLssqCpNvyGdWS
 cBKlI0qi8Gnc+8YTz1GYD+MJRLkQuIQ2SgUG8oIHM/DUJ/QdXzqvnVaA=
X-Gm-Gg: Acq92OGGmTub6LHWJTkk/ztAF9+17T2guk+RjdqRqoubNYrVbdPYHzqeqXboZbgRK13
 /1RfSTUiltbrhOZOOddv0LoeKAJnl9xbjx7AoxNa7XrLH//+GYwPkvF0qO6n6QA+GX2k1PNp4dy
 e6j3Q5Pu/IzJHqyJMnfKFSg5YuA8wFMVZBhnELHX2ywCj/rtZY5vfOMeuwqh/OdVYhoIjMeMn+T
 N0lduOZVg1uHlRgB3+64WpnOk5Sii8nuFF5uVMqImg2Su531MbvY5e0TIGRgS0WoAo3O9VbKeWQ
 QBBGlxEXiJuV0eGWuRWTR0Whmjl7GzFgO0JXmG0SQcwn9UPg53jTfc9WRDbxtM32RS+iQnCNF3l
 7gUIALUBqVQjlHV08Q2DGVgkskAKGLYgTcsoopAYCK8qH9jsBgN9EG21RYeHUf4dAz24IiTj4WH
 9TzKu6RAyaizfAmN58
X-Received: by 2002:a05:7022:ef18:b0:136:89f7:a2aa with SMTP id
 a92af1059eb24-1380670b248mr10296487c88.28.1781041678329; 
 Tue, 09 Jun 2026 14:47:58 -0700 (PDT)
X-Received: by 2002:a05:7022:ef18:b0:136:89f7:a2aa with SMTP id
 a92af1059eb24-1380670b248mr10296474c88.28.1781041677819; 
 Tue, 09 Jun 2026 14:47:57 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:47:57 -0700 (PDT)
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
Subject: [PATCH 06/27] tests/tcg/meson.build: introduce test_name
Date: Tue,  9 Jun 2026 14:47:24 -0700
Message-ID: <20260609214745.772536-7-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfXxRKFTB4Dh2rx
 rCJr8ZYGyYGaVIwgv9NIzfZL06QO955jGSUgpYClcf0pF+thDOMPIzNjcFKSBLo9+2igZrr6WXt
 cACakbcVOB8TlbYgyzagXbCm2cJ8n/kHjGO55EU0aAKGPh7iAUhyY4LrTM0cfq15rrjrLUmXxuC
 /+nOgsvliyHF0NgHU2anY6BYFZNWCVeDCeloTwT4K13QKMjOuqOOSJbgKoW/BjHxr4tRPfBdpyC
 L/2yhoi0Ldikzbc61P253td0fWNjNAGlwceIcAPPXBwKOoI/YvXbccI8aoDFRq0DrPSZc16ue+v
 Rg3WdhJvgO5ttvc66l4hn6LMl9uBaaXRBJooxPXLCQSvJGFEDdIgxiYJdZ/ufkvWYdLNvxGfRHW
 eildSlwAzrN1XGDlLYwzAmwaZnUDlI6v/reQW5EYPVQJymBLpiqq3nVpO2nXMxSq0hCqiCG/snc
 tayWLQj6javL+7FiSiQ==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a288a0f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FnD13UrixhZlOC8LVz4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: MATOeq2_9D2qNZzt3nfIPtfUawkwSD9M
X-Proofpoint-ORIG-GUID: MATOeq2_9D2qNZzt3nfIPtfUawkwSD9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
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

We add possibility to duplicate a test for a given src. This allows to
declare several tests that still share the same executable, thus saving
space and compile time.

A side note to mention that meson perfectly supports declaring several
tests with the same name. However, we prevent that to force dev to
clarify what is the intent of each individual test.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 2c6d85c586a..bb0184732fd 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -12,6 +12,7 @@ tcg_tests = {}
 #       {
 #         'src_file': {
 #           'exe_name': ['provide an alternative binary name'],
+#           'test_name': ['provide an alternative test name'],
 #         }
 #       },
 #       ...
@@ -21,8 +22,8 @@ tcg_tests = {}
 #
 # Every test executable, identified by 'exe_name' is built only once.
 # Tests for a given src use the same executable by default, and their definition
-# is guaranteed to be unique also.
-# Default name is derived from src if 'exe_name' is omitted.
+# is guaranteed to be unique also. They can be duplicated by setting 'test_name'.
+# Default name is derived from src if 'exe_name' and 'test_name' are omitted.
 
 # plugins come first, as we need to build the list
 subdir('plugins')
@@ -51,7 +52,7 @@ foreach target, plan: tcg_tests
       # return a clear error if user mispell a setup entry
       foreach key, _ : setup
         if key not in [
-                       'exe_name',
+                       'exe_name', 'test_name',
                        ]
           error('unknown tcg setup entry \'' + key + '\' for test ' + src)
         endif
@@ -66,8 +67,13 @@ foreach target, plan: tcg_tests
         exe_name = setup['exe_name']
       endif
 
-      exe_name = target + '-' + exe_name
       test_name = exe_name
+      if 'test_name' in setup
+        test_name = setup['test_name']
+      endif
+
+      exe_name = target + '-' + exe_name
+      test_name = target + '-' + test_name
 
       if test_name in added_tests
         error('test ' + test_name + ' was already added: ' +
-- 
2.43.0


