Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3CACD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:50:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JK-00077g-Dr; Tue, 09 Jun 2026 17:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4J4-0006jw-2f
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Iy-00084p-Ae
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:18 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4Z9n3232133
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eUbpfzKMn3M
 1pSmJidUcLzHiTy/DIgyN8fNCCWmXYX8=; b=bqAW8rXJRj8GhAkDQ2h9K1R+jZH
 p82TcYSO+z7MiEimxwhle+94HJPsPxMaUSpmi28y2czWFKmFv9KySlif5oVB7HNj
 WgF935UhEfZWjdVaC2LFxiuMY7STwuQdNuwuJBxm67SLizLiwfEuA7Vv5uSX10sm
 mWVhJYHS1cB3iVxom2sOlq8fI/7cqCEu/qz7zJw4RrjZoWELLigE9en59zxhoAQJ
 BXf6leY/ZI2dnxOhZvEurSikeM9bCjNlyhb7toegsSLCag9/7mR61K119ewjPXcg
 Wn6hr9y634awp5b4DVcrUtzFFnf6AtPfRdKk0UlXSxC7yJkanOFk63ZvBRQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeevb2h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-138155294c4so36903c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041683; x=1781646483; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUbpfzKMn3M1pSmJidUcLzHiTy/DIgyN8fNCCWmXYX8=;
 b=UO4Oicop9EHNdSA+dYrX7zkQXNPAiB7cpahMhgVnr6nGygm8dmo9yUIptAWo6hYzgR
 5M+ybakU2SMxVAMaBKk3tN9yXEBbTdeKuiO4dEA3a1582gAc/9GfXZKX3YvRBXBLNNT2
 dYlUC8VPEFyLEYTtt1M6jfTSI4PSJC0jNPBNcTqwM30xpdSl9lQzEeGKeHa286+Y34ij
 mdV3xDXsvuM+3HTqEng/qfhiqiq6cF4KdIkqJYXcBSJombEr/Kqo+vELwdiJ7oZp0ezz
 s5xXY/PhkOD9b2WvPfSh78tJkzegInZ8FGuZdJLiNSRmvXABTjX/mkJ/MYoyfM8tj7mR
 nYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041683; x=1781646483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eUbpfzKMn3M1pSmJidUcLzHiTy/DIgyN8fNCCWmXYX8=;
 b=mvmU49l9GqAY6+seVvuQB8i+9KlAqSClNQYx1FpvetFHeuuCNdvWxTBU701t83gdYc
 LrzhoOKEeHkf1jnyMXOcc0iMdn9IkKKpDJlfGIc0S/vMTrXimqj9upWQ5CNIoZk4zaLI
 pscWDXfc5FFSpYEaxFywKBVLbohubTRe8r78XKFTIUxN0RWCbDoNlkkj+5vfBSJdz/jI
 x+yUsrfnP1rLy5gEedO0k7q/6QUiWj5yaV++/PHPJxcx4zaXP1y34lCgBpsR71iHUc0U
 aGr8zSRSmuy9VyiMF4R0PQ3IlFmGmh8r+T/LLd0tJzeLBqeAQs/UjezFf+CsOr4IM72F
 ++XQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+xxUKFdCzMvAOpDo/n+eOpV5s9hZ4c31TuVu3kRNaSMaN5tqzfj5hUzwfrhmAhWhCbQtJ873gj3g==@nongnu.org
X-Gm-Message-State: AOJu0Yx9pzgLNY+bBvEMuoty3mDwlWy6SyY9C6y7MkwLWoPxGKsbQj7d
 2FFJmiQpUBLKmchpQuRS7AidA2Jy3UsT55GTJQ6ZLr7xwWTJSPiCLbbvRnvedwM2H/y0lZKovF3
 OuPXIzQYFAmKiNXga21Jqef5cOROAs7YdW/1CHHBsRkBy4ZV+8P0NLxE=
X-Gm-Gg: Acq92OGqxorlVhvnWP8zvCtSik6Idhyn5ubUs1DjUulljH45X0Zc0MxJRdEbEfT3VCR
 lRSSY3SGel906uZxbJHz36ZHmqxndv2fS18RZhRsYMwW0JuHa3eP5q92SAGlhNyLK8KPgD9Ensr
 uPTBTXjKW5BdCcvxniTkCgVv6sBcMExiaMUa2ljw8FoUz8DpYnToO/VWlbYOv/w0hCDsqAvCdsQ
 GJz5uAFAfBzY13CpV8TCmH95h4wpDsBJxXFKI2vDN3X0W/hq+AiyrgnYx6oN6UiV6PvRYm8mlP/
 n2dfomPwTrEKlypGslKyGBoRpfAjkAr7y2X8xgAgAcTNzPwwzr3zSdjkVtrl/1+oj7yxmu6/+4E
 2oHZRl37NO122IsFKuixk1AnkZzj030vw2MJ71Pvl+AEjMgufARyl9VKd3LKZY0EqGB7dPezJMW
 fs9/03UV7IX6iCKT9B
X-Received: by 2002:a05:7022:2595:b0:135:3025:be5c with SMTP id
 a92af1059eb24-13831bb3d63mr3561213c88.27.1781041683048; 
 Tue, 09 Jun 2026 14:48:03 -0700 (PDT)
X-Received: by 2002:a05:7022:2595:b0:135:3025:be5c with SMTP id
 a92af1059eb24-13831bb3d63mr3561194c88.27.1781041682534; 
 Tue, 09 Jun 2026 14:48:02 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:01 -0700 (PDT)
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
Subject: [PATCH 10/27] tests/tcg/plugins: build list of test_plugins
Date: Tue,  9 Jun 2026 14:47:28 -0700
Message-ID: <20260609214745.772536-11-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a288a13 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=mwllZrKobXNPg8A7wcwA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfX7srbRLhK3zJT
 5u9DD9DSapNVws0/IrUoYeSBhg3RDrKqBnbzKKlLTNW9a7iEstTUL79Jmj4DU3EQfctrDCAvnAR
 Kx3gl56UJ0+/P3JjHjVUix/EH73aOeCCTNsKGu2KR9R+oPmfssZd/ulv4OXAhHdh8sT6DYIpsmc
 +Cp60tzBy2jeYddoOzg2gIy643RJQ8aMCiGp2RzSu/4DtRLDqpedt6QboEAePDTOIn4UeRCx3Ax
 PHT6y83SBHCRn9dXvkJ+x32VQx3+W95r2MpBgImS4NkHbP2JPl6pf6k2ThrOLX8seMh6lsmywz4
 Zk4/8uhgNjx4aTOkz38katE4HfTANG9j8iLFfwagXx6Nino8OSm6eehHw/0xvBB6eKZ8VBQHDMd
 iVbMI/GR+uTbdCv560OhY6xedLsCsOtMb/lCEFwLvn7PiPq8BLGXWarcIOpQmRLZDEdB+2t8cY9
 xuMQGcaAZtVxzV9S5DQ==
X-Proofpoint-ORIG-GUID: uf1uCxH7Uj4sMB_Ha3fM-jjcDGe3EI8r
X-Proofpoint-GUID: uf1uCxH7Uj4sMB_Ha3fM-jjcDGe3EI8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090204
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

We previously had list of test_plugins sources, but not the target
themselves. Create this list, so tests can then reference a plugin by
its name from there.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build         |  1 +
 tests/tcg/plugins/meson.build | 11 +++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index b6a375e9eee..5cd80f3c030 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -30,6 +30,7 @@ tcg_tests = {}
 # Default name is derived from src if 'exe_name' and 'test_name' are omitted.
 
 # plugins come first, as we need to build the list
+test_plugins = {}
 subdir('plugins')
 
 # Finally, we can create all test executables and test targets
diff --git a/tests/tcg/plugins/meson.build b/tests/tcg/plugins/meson.build
index d7f8f0ae0ad..2abc317d1e7 100644
--- a/tests/tcg/plugins/meson.build
+++ b/tests/tcg/plugins/meson.build
@@ -1,4 +1,4 @@
-test_plugins = [
+test_plugins_src = [
 'bb.c',
 'discons.c',
 'empty.c',
@@ -14,9 +14,12 @@ test_plugins = [
 
 t = []
 if get_option('plugins')
-  foreach i : test_plugins
-    t += shared_module(fs.stem(i), files(i),
-                       dependencies: plugins_deps)
+  foreach i : test_plugins_src
+    name = fs.stem(i)
+    plugin = shared_module(name, files(i),
+                           dependencies: plugins_deps)
+    t += plugin
+    test_plugins += {name: plugin}
   endforeach
 endif
 if t.length() > 0
-- 
2.43.0


