Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018ADCD8CA8
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:49:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4J8-0006qY-SH; Tue, 09 Jun 2026 17:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Iw-0006fx-Gw
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Iu-00084T-Tp
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:14 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4w6p3266800
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=uezoR3BkJ4+
 T8uRdVffETCeEc+kHGXZaY2hX29AcaEg=; b=dOzABGiXil/xcpjqOEVGRPejxUa
 uyVL2eBnxQ6PxZrWME3pLeo2vpik/SMR/JwCQlD07fBrk3n0Y0c0e9FEo/CEHUqO
 7VpPV1EVU23HfemlWEXSM5/IdEtubMjUhsuywiTtfquaBaCkE0cGeCOz3n7EGT6H
 kHkm/x/4QICcei6pBfajeq1QBj4j2ZTVt/QWJBln6Lw0yRAJramKUhynmUuz3W5J
 CGY7cHI+HzMYnnZAWRz+uQzrgRLks7S6Zg83uZBeu59FkWwcILGQFNjqlaZ7gh/T
 NQZHki5MS45tuHiH93HBRVoLV0AalDyAcLQpcssl1e6XKjbG8uSJzq1hwPw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jujjp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:01 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-137e49e896aso4250041c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041681; x=1781646481; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uezoR3BkJ4+T8uRdVffETCeEc+kHGXZaY2hX29AcaEg=;
 b=NBE/rD/hgD4uE+ae319HnQTpvC/zd3IF76zyChh1enEgrz+C6s8cXSxB2ruyM96hKg
 eh4OXm7sgljc+ZPNDrsue631dmdSpB/ZYwZrmFREf/wb5/z8OwmRMbYW+8AP/UdcK0J4
 Kgx0+vfWR61cyIQDYcFTYm8u3yOdN0MCR6HxaFPQJVq8vdOKNGomS5RhxFps5CjxjZw+
 lgaTfDMDvSBxSm4BObi04rgRPbwROM9sgqdoHyxb1SA8eV7lVbyQGijIrdHWM1yMQ+bE
 nBpFNb9lMHuqqqdLFi4nWoSc8+nWrc0sgfWjTil9E7BSO2jA7hD9cOmidwEnJJ9hvEtE
 zcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041681; x=1781646481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uezoR3BkJ4+T8uRdVffETCeEc+kHGXZaY2hX29AcaEg=;
 b=ABi5hmQOVCXwRP0A/3TMWrOwdDY7rApt0XlKR+uzJe7noMKzQws2V7F1goT37WA3WN
 pvaHQaVxk7bNuU65epmeiYG7c2lM4eweCz8t3dwIOdEz/JaN3Z8gFF1T4NE7pKGkyLop
 uPo0D+DZ26f0k/KaGQ8RhI+Q6au97r9CqWXfdKAdFD/ijIiMEGdA71y1Vp2r+GEgO58Q
 sFyyA03+QyaN5KzrZ4fLA/US5CYuEFB6SL3JQVN3YrWgQlr+w+oJyRP1MOkTieqJrJ4L
 u3eUbQsnX/AVeVZuBRlHe/7Ta7caglBst371ciflFB40dCjKfeKj+zcs7STZKxMlGT+s
 Hj1w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+P/lf/UtOBHxVue4eRNsNq6IutNSk4mPp5UYnBLoEEicybJuq0Q7bJQ6F+z2GREpL5cKsCuN5XHQ==@nongnu.org
X-Gm-Message-State: AOJu0YwNukDK6Zsm0xDuhCD2mOlrhtXrEzY1Yu14SXlX0cu8tWBvw9F3
 XBXXb/WL7uwpVhnnjUbHDzHqg3UnUjclZVZZryfNbdndcS4dbUFBQtAX8qFgfhOhype+zmtcc9I
 jcSypFHUSG6NJduCeNNVxp1msnAtU+81sP3CYkapxcjQqOLuCtf+CCBM=
X-Gm-Gg: Acq92OFAKLkmsVu5b2CNF20bqG3BSrqwfdID91GUPNjYWJRgtPT1aG/Tqv/C8YYL1aY
 +gzGGvLxg8cHqaml5mgDHfz+w48vNmMaLFaeF3GBPAzY+4yp+lYRbXKxqAHNYY9bYf9hMmb6Vbd
 rxAwEAuyU3JD5eh+HtaIpmUXvyBwNJ9N+OKgwSNSDWia4fp4GN1FI4XwVV9dVC2NtqbDLR9V155
 jab1PMOAttUySPf1IQFHRVtVGu771SWncwRPgRs0/5os+EsM8rtyyAM0BxHhvepZ89SxRylUtpW
 W2z1RKQt0TDcW4CxIGglgkr7zK2gMIWEw5zbDXogvELG3K1QIFeVY9gL7gOOv/T6eQk5OZkuK2T
 3LyW0UiGAGJctnTSuN6zjbUrmZA8Grzt7DOmpJWWa5d0PP7RR2KsPPAqFKHCo1eMm4lOlL5EmlP
 wOCI0yxKcUx/G34shi
X-Received: by 2002:a05:7022:327:b0:133:39b9:9720 with SMTP id
 a92af1059eb24-13807d7f8a8mr10475835c88.16.1781041680717; 
 Tue, 09 Jun 2026 14:48:00 -0700 (PDT)
X-Received: by 2002:a05:7022:327:b0:133:39b9:9720 with SMTP id
 a92af1059eb24-13807d7f8a8mr10475821c88.16.1781041680152; 
 Tue, 09 Jun 2026 14:48:00 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:47:59 -0700 (PDT)
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
Subject: [PATCH 08/27] tests/tcg/meson.build: introduce qemu_args
Date: Tue,  9 Jun 2026 14:47:26 -0700
Message-ID: <20260609214745.772536-9-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IZ6053ehG_vDW2dVLHCzRs6ulbuonDJq
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a288a11 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mjsBmtCu2CUIJ0Z8OpQA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfX6Ce2pUXG45ZB
 nzjkGKyzeYDTkVfPseB2+9dO7jrOGK8NFshuFHPbKZOe1YurVSho3p7DcR4Hc0kkp5S/ZBs1Bd9
 pOGqEbOKsjKHyZjHqkWxhDH8G0K6BgbmE+KruJJXZAeS6An6Z5TbOOHDAW8MPYre6NU6UGxAIr/
 wkqaHKqTu020cpvUYzI7x9sKBAuRVCpy3tqFUTmSdWucwcNKDDyT6y7Qjd/MXdgMost9BifChoA
 luDL9ZqJg3A/VbSPXIUwfWlYrG+/loYgAyCRO5L0MpUCbMasxR3I7kj309rW0BeKkKMTPFrJOHx
 XI1Tq3HSINCr6bV0hA9ZI9+ewqX1RyZAZmvP/Bs6Zcj5zrtqzLt6Y0qngzXfh9cVPZvSiob+YHG
 FaE/J9nC06RmeZnITsB2L7Bjtx7yvVFBg8euOQsodjGvxLgrmeczvsbbXusKJk8fFOGZZIOeyVd
 J0kA2Hx4DTSP2eGMnQA==
X-Proofpoint-ORIG-GUID: IZ6053ehG_vDW2dVLHCzRs6ulbuonDJq
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

We add possibility to use custom arguments when calling qemu for a test.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index ad56fdf4ab5..28a7e529c7e 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -14,6 +14,7 @@ tcg_tests = {}
 #           'exe_name': ['provide an alternative binary name'],
 #           'test_name': ['provide an alternative test name'],
 #           'cflags': ['cflags to compile test', ...],
+#           'qemu_args': ['qemu command line flags', ...],
 #         }
 #       },
 #       ...
@@ -53,7 +54,7 @@ foreach target, plan: tcg_tests
     foreach src, setup: t
       # return a clear error if user mispell a setup entry
       foreach key, _ : setup
-        if key not in ['cflags',
+        if key not in ['cflags', 'qemu_args',
                        'exe_name', 'test_name',
                        ]
           error('unknown tcg setup entry \'' + key + '\' for test ' + src)
@@ -108,9 +109,13 @@ foreach target, plan: tcg_tests
       endif
 
       depends = []
+      qemu_args = []
+      if 'qemu_args' in setup
+        qemu_args = setup['qemu_args']
+      endif
 
       exe = built_tests[exe_name]
-      cmd = [qemu, exe]
+      cmd = [qemu, qemu_args, exe]
 
       # some tests expect QEMU env var to be set
       cmd = ['QEMU=' + qemu.full_path(), cmd]
-- 
2.43.0


