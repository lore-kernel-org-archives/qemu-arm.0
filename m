Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454D2CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:50:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JM-0007AI-3G; Tue, 09 Jun 2026 17:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JC-0006th-1U
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4J2-000882-RA
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:26 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K57sh3231126
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eB9gQJ/zqc2
 gdrM6hrfSlTTB/7IAR6F05AkQt04CkDg=; b=CXK00vSYW2JOdwH+a7nKx/MUXua
 /AGsua1e81SCPJ9Prd5dm3zcX7fvU5usTYhu3zWxXN3iggpxPWATrHc99djoB/TU
 Keh39tjknWegEqmQeat7x2zYInC7lvBSEPy2hfeL9gSEb623E31yN4+vaEUDPhxs
 RIGhm3HMO/rmEK3cYjxNLDaxzJs6TQE1GP38ERP1AlGDCWXBnVY/VWc64li0tqSW
 NRRGNUAo7g1k6RQrh/YbapTr5H/2nBJ24WEEt26NxUi+V7kiuvKRhKQDYXfjXU2Y
 Q5tIMlyk5H/T9ROgCKBHDx7CGhkmES6FT2D4O3QxMCbls6aRAE7HA0XdSVQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkg27-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:09 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-13815cb1507so9024890c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041689; x=1781646489; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eB9gQJ/zqc2gdrM6hrfSlTTB/7IAR6F05AkQt04CkDg=;
 b=SKD5qqf3ICjM2CWLuDxJ8g0LC7tJc2slEa62O1BXP47o+aA4jd5abMsiNmoUj4z0uC
 0sdlpYRJrEaW9ctVVSvWktbgDWXJkvnmPXD6g93nM5mQpHTIGPHf/XaYj+EjG5IuR+35
 CjucUtJn/DJthdlHGK+5ZYF8UKJazhgcHrrUb+lg5WBavBCHh3ZfbFymWoFBAV0dtfIt
 3xqK3DTaq0KSu13WDGIr1AGwfEp07GMpb1/mSlWs8ZrSardP3MPGVHZ1TQYF6fS79WNY
 o3unASQxSOUeZIIKT07q8+4exu8B2CZa1Kx5cHft1IL0uNyrLvfjLnFj8hW1eEwACi1r
 6Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041689; x=1781646489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eB9gQJ/zqc2gdrM6hrfSlTTB/7IAR6F05AkQt04CkDg=;
 b=V8LV/P3iXHBhaJV7cnsmfIAx9Sq1hgR1kfRlABaZm/M6iEhRMlI4p6gphT1SEG0Fw/
 cdSHVBznS+FurDOTvJc9ziJKwfNSe3+98RHiwtjXSngW8dMSQJ/U2NNGjkN/NTGVZ3iJ
 EM1JW0QfB0hcqyL6KfgsiFPh//Zr2gOZNEJzWuILR3y4VHUD2dd9F2GNSPk4aA24IO7j
 YxOjX3VXKh85IL3J+Pet/ILA/cUSohyOna1A+VfTezkvgGjS/zOgoO7F/osjzxal/UTe
 b7M4IqSm3F+RvT5h+Gb1Q6D9c7vVbwtU3lriyNxVNnQ6kCLBNwwsuecDH3GWNzNeG9T+
 3IWQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9XUyQg7Y9YJhWbdP5pm86VZjezHxmFbn9jIr3v9CHyW4Z3bBbWxeKI2BdvVzYAacLUtwepsiS4lA==@nongnu.org
X-Gm-Message-State: AOJu0Ywi/DlifHdP0H4M2YExYciVyeuFJBG/WP8Q1jrowTvU/2kySmds
 W4bDPZS2gIP/wJsLduabyTcwAjWdIob5flg9XpdnaHLg9zdkVu6V3ebAkP4Jwemo0Fh0PSNYez9
 yyN1zC7unxWRG4O3HABVEPu7fc4G8b65o6pqtky5EQLSTWA7knK9sTg8=
X-Gm-Gg: Acq92OEbUL2j/IS2F+ZSEp62nCjKnqwh/1J4Eb8xj+9M9D9El8STSNLYF5sUnzuxRZ4
 pIirZmxdkX3lJxNT+J2bUmiXEUWQrz2cUTG3uki53uvjNm0eGuxJ+sJbqzv/YQqETYDKhTD0C8T
 1DPVEu+RqmSKeu9cVtCFhZboPSFNyTTrVcuKFwpL+qfpYr4l2Rpz4reEylhh9O4n4VYD5FYKfpD
 RvUYzyvG71JGL7mplJ6KTrx5iuqhUHeQa87kZMTmPveuvOLN5WgHHy6AhY9BLwlTh5YDndefEWp
 fFzY8vLzUiyvP2f1InRPZnJ0m3dPipk5uEb6c0HCGWWPGLBY34YeMLyvF+nS5fXeVJ5yGh65tpI
 0Pkcem6TOd67nb73PFRNchl8aJ8OJ6HcoqnXdgO5q81YiUlJrgOM1Ydq4UWJdUBwc9qRYqx2jFV
 AQ0eBSvyBAZPivnbmR
X-Received: by 2002:a05:7022:f50d:b0:138:14dd:16c6 with SMTP id
 a92af1059eb24-13814ec5acamr5581102c88.34.1781041688806; 
 Tue, 09 Jun 2026 14:48:08 -0700 (PDT)
X-Received: by 2002:a05:7022:f50d:b0:138:14dd:16c6 with SMTP id
 a92af1059eb24-13814ec5acamr5581079c88.34.1781041688195; 
 Tue, 09 Jun 2026 14:48:08 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:07 -0700 (PDT)
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
Subject: [PATCH 15/27] tests/tcg/meson.build: introduce wrapper
Date: Tue,  9 Jun 2026 14:47:33 -0700
Message-ID: <20260609214745.772536-16-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNSBTYWx0ZWRfXxmegzq2Uf6Tq
 LJQRWCOZaZFQ+NoRZmAJ0RjE2d3o2U6QrN7p4JDSrd6hmcGU+HlGNBedSUHJhw40O+i9AaOvs9v
 8yqw0yC/M/uWYJhX34phqwNrK/jdIK5LNBa72PNxVIY1ZznE/4k6aoorRK7NQfvImZSf7l+/Lia
 Hgq5exfzKBg6DWKekkaV+4z94PhDVavbBaBH2sWFk3X7bxyCQDAcd2XzZNgUj9o3wp3QzAyG7Nt
 rt5i2jUe0DwNuznH2khwy49SyBZ6bRTu+06wNVadSwqKqTjtc6Uk7nDEy+HfwykDR7LAXFQi04K
 DBUnwFFtaEu858E9wZMvYq1f9bDy6P4ykuzflQ8McWXN6ODnrLK2Wp3rmBxHuCKCIYAqShnrV84
 MB0pAAPfJm2CShjanF6glYmmHsKprxz/8I9gm4l6Gi8iNhIIrSjVlglowi7o63exRgJhGZBbq0t
 GhMLpQceOxSxqJGTbBQ==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a288a19 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OYW684dsqC6DhUYTEDsA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: -F-xCHnB7WZ5hCz_b9diH06Yldfhw8_D
X-Proofpoint-ORIG-GUID: -F-xCHnB7WZ5hCz_b9diH06Yldfhw8_D
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

We add possibility to wrap a test command through a given script. This
can be used to provide any kind of ad-hoc check for specific tests.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index aca59933d71..5380a360830 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -26,6 +26,7 @@ tcg_tests = {}
 #           'qemu_args': ['qemu command line flags', ...],
 #           'gdb_test': ['gdb test args'],
 #           'env_var': ['VAR=value', ...],
+#           'wrapper': [program_to_launch_test, 'args'...],
 #           'plugin_test': {
 #             'plugin': 'plugin_name',
 #             'args': ['plugin_args', ...],
@@ -85,7 +86,7 @@ foreach target, plan: tcg_tests
       foreach key, _ : setup
         if key not in ['cflags', 'qemu_args', 'gdb_test',
                        'exe_name', 'test_name', 'env_var', 'plugin_test',
-                       ]
+                       'wrapper']
           error('unknown tcg setup entry \'' + key + '\' for test ' + src)
         endif
       endforeach
@@ -196,6 +197,10 @@ foreach target, plan: tcg_tests
               ]
       endif
 
+      if 'wrapper' in setup
+        cmd = [setup['wrapper'], cmd]
+      endif
+
       # some tests expect QEMU env var to be set
       cmd = ['QEMU=' + qemu.full_path(), cmd]
 
-- 
2.43.0


