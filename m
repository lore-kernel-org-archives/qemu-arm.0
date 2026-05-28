Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17D1CD6E45
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 05:19:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wST7b-0001qZ-QP; Thu, 28 May 2026 01:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7Z-0001o6-7X
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7X-0003iX-OF
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:28 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64RKl7vs1225016
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mW02At9GZIh
 mN3wHob7Y+/EGWd7GCXXW6PT9xjXaHUU=; b=VvDCB7ZO6XdfCkvVWxb0IzXBcBK
 +hx70ErazWNLFQM3LGZpLFAjjMHx/ueGvbr35LbLGJVHYfgKljjTz6m5dnBR8+bk
 n77egaGqj/aw5CoCGtW8+Lyei1AaTV3Gnl74GuWsuA4hYpwCrTY2mg3MijVe2buO
 GhU4vdjJE1JaEGaIxhlgAJwwAB0S1iVVUjL8MYGhFJt+opAIL5T8ixjqyqnnuaSS
 HARzmCXC/6dpfP71Ekj5nADAEfopxWbK4GNZC9n82nNUgckniMz2y0R4CKdyd9Pi
 nggQOBlm/euJHKz5KI+aY4lnhiNfz+sgzhhHsxQYGdU2u/0rPWQjNii+cqw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1se5h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2fe1cf409a1so2034491eec.1
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 22:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779945436; x=1780550236; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mW02At9GZIhmN3wHob7Y+/EGWd7GCXXW6PT9xjXaHUU=;
 b=SMeTXymOFKamtxyrURrMm5CVJN0sZMRZxKJXVxDZMwe1WHzRH+ZCdlcJei/0jzgRve
 kDnOz6h4BxKQpUoLnO3RUP4rXZGz7zz6AVnBicYelFwcGQcV5oBJM3fL2mtsBRvTGLrg
 0Yw3ZReQqOTrordJ1e+LZNKIk8fRAGbGl0FxrS4g8GCUkYSzKPX2XCJna1HSr5d/mhhV
 SpWRDXtL0NzDw75sQFdwW/RPAHepWa04svT61mbHKksAJ1Xkl1/HMBxjj2SwZAVphqPg
 Wl0mrchElj5q6C0gEjAwe4kQ4ssR+yQw+4m/wnsNkpjTXroRuZ4WRSCaRwqQSv6JJn3s
 1xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779945436; x=1780550236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mW02At9GZIhmN3wHob7Y+/EGWd7GCXXW6PT9xjXaHUU=;
 b=IuNF68JYUABiA1P9ircH5x2CD4B9ndLNqVHV4a5Nw/dcuG5XK5eRNkGleixg4c5csu
 /wZA4vyV6Z9ba6xPW+A4j80XtkwWYDtL0j/yJW1MYwboRZiyhl4Iy/IC4fmfQmtp1tS1
 EP/1S5oXf4nOaplHp8wpc/nVrFAa58I3ftiF3wjqhc5eQRePji3ia9O7uD+mFikTsA0F
 JlPoJsgje/9jFYZGildj4kodtiTzK4JkwTW9exF+gpewAZIsdZ2Hgvy6LV6XRf6FMqBQ
 VhrJ9RHZh5wTeSlDQbv9ZmA5Eiq0lKUM1Fn/757DxYJ1NepMOB0s4KGjDT8CLkbEur0i
 Azcw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8BMscMPGi5Xa+H+3LjETBoysSpO4d+0nZf0CRWgUOwhw+6C0ayUxtmlGDbqRE7VNU+Nt4KXUp7OQ==@nongnu.org
X-Gm-Message-State: AOJu0YwxODOxyAFt0fjk7qw1Mwuajuin3QgezVT4J/89Pl7W40m5kyju
 pdFAokkF9cIoOCZ3Zqufm7hHzzVJ54ZqkBsjisIisnrF6T6btmUYeAIU2y5JQDYlWw1YsXBOWzd
 KneFv9sSKvvfpaFFItQvn4wvmj462bf8hlq23fOs2vn/0PKzhHPZgC7Q=
X-Gm-Gg: Acq92OFXs+VL2UsEKYlg3T1yEkyefBevsZTCsZeNk0H0IgcycPMuiUXjlNirLdDmBpE
 xwlBE/6kAsMJPhgoa07ZiF/GF43TEtTazWo9nHyjPExqBnSKxikWkDRblO1Kw/of6P9HC5t3Ppy
 SVuxEX/5LmAOa+sM5jY6zooh9r1730zXcmWwVO/f+d/SoDsD6n58ZYkZe/w8NcXnIZms1ZtSuMc
 r/0ykyr8GmNi8Nnh7BmZYHrMn5cSpl+6nlCrVbYBFUQNk+iTxfYNpk1ckYAiLp/7m9yg8V8onzj
 +nMhlcEh1HeWHWwfvRdEPTNZRXEqQRypqjTJY2cdg/DMImG2H/AzdC7Z8xpw/yFXERMXFuhhgNM
 Dj3FDfI6oPeozm2ui04lc4KJS828ETInSiAFqq/uoQ5vNqGBdcicKOpRUcbKaZUP5BzkutHuRrZ
 ivLL3ceGEXJmBJTQq2
X-Received: by 2002:a05:693c:8353:b0:304:630d:e4ec with SMTP id
 5a478bee46e88-304630debb6mr5170839eec.28.1779945435761; 
 Wed, 27 May 2026 22:17:15 -0700 (PDT)
X-Received: by 2002:a05:693c:8353:b0:304:630d:e4ec with SMTP id
 5a478bee46e88-304630debb6mr5170804eec.28.1779945435238; 
 Wed, 27 May 2026 22:17:15 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304b984d9b5sm4094607eec.7.2026.05.27.22.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 22:17:14 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Helge Deller <deller@gmx.de>, Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Alex Williamson <alex@shazbot.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wang <jasowang@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Xu <peterx@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 04/10] target/arm: deduplicate accel/accel-target.c
Date: Thu, 28 May 2026 05:16:36 +0000
Message-ID: <20260528051642.115721-5-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a17cfdc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=HcmkyxhYFGsMxTulTOoA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 7tqMjZNeEJvFuQup1Un8g_KC13QsIigx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA0OSBTYWx0ZWRfX6JwD+nqsnloM
 gL7AVtEyHfIa1cIrY7nk1uD4yGHdLotESxL13F9PTBFHydh7cez2QtSh1uddobiD+id4n0treSw
 pNV8+7cjjiomQMlJLl3ZSWmWb/KH8V4q/cV3uJ2y2rR+n9/rToVwZSc78MlGUu6u3Jvp8qq0II6
 6yiFXaahsWLa5mI+lUdE8VsJV86VhzER7uZRAZVO5daSlIJfVyCzRQqXNncQXZvcaPXNmWqE8op
 6+M78wNZAXV+49gDpRwZNOfqMx4izc61inzTWWmBBh04G0BRBi9PYc13BhVhBnM/fUuMAXJr+OP
 0VKETMR5axBjVEQ68d34yUUyWGyNbl3ajRrGMlQAY9V43cy6GZCGWql5KfLLw2HosF40Sz0F3qp
 R68JKQlXT7sHhyioVZAgvpfjzO77oyuYBys7JsPjtetUBxam4PsIai3eWpz+Ktqx9ZJ/QqQXc4D
 FAzMv9BbgefQFaL1PZg==
X-Proofpoint-GUID: 7tqMjZNeEJvFuQup1Un8g_KC13QsIigx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280049
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

We still need to duplicate it between user and system.

Without this, a single-binary with arm and aarch64 targets aborts with:
```
Registering `accel-arm-cpu' which already exists
Aborted
```

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 158ff07654f..d63d60fd93e 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -13,12 +13,12 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
 ))
 
-arm_ss.add(accel_target_c)
-
 arm_common_ss.add(files(
   'mmuidx.c',
 ))
-arm_common_user_system_ss.add(files(
+arm_common_user_system_ss.add(
+  accel_target_c,
+  files(
   'cpregs-gcs.c',
   'cpregs-pmu.c',
   'cpu-max.c',
-- 
2.47.3


