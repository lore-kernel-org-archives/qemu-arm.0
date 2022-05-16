Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1791124lfj;
        Sun, 15 May 2022 23:24:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIeUGTXEn58Rdoeg3l1wAaHx9PjVZMQ9w8YF/mTvCa1sL6PmS/1NOxH04oDLPXsG5VTW6t
X-Received: by 2002:a37:63c1:0:b0:6a0:f9eb:dda4 with SMTP id x184-20020a3763c1000000b006a0f9ebdda4mr11470567qkb.334.1652682247792;
        Sun, 15 May 2022 23:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652682247; cv=none;
        d=google.com; s=arc-20160816;
        b=ie5zzAwQc7NYCZg7mIwqeK1vIuB8HQuZFUacpKDXyCjnisWWbgsnyhq7X2TAr5cvxl
         eY9nstq/fbT1ttPLsT3QNs9coHLW269l1Cbib3nkhQdqXP/u7VEzFdm+LwYl67NSeFre
         oPYHrcSe2cShX2juhBhjMXuadk9yxwOPsAR66n469YJG41U0efHEg6PZRrVHue4WSlFr
         3SQunuww8670qoTzgJp1lvP0XhIJscPE6dvVlHFmaTA2Rr6VTzxQ35smjG3vspAt7q9B
         48KnSMR39Y30b28RoibsWJqzTKNLSMVt9LjQBMOXyZW6mADRS78b/szUxlYg/McgpIdX
         0O3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x4FXEitBRDcPcuntXgCai+9tBY2HrXWzc+iu8zmQfKE=;
        b=hR8iIVhTFqzoY06EO7d8GFwuYx4lB68bY6TFmgZtPUmsn/BCLKkqBUZKE25BV1+dQj
         TXSafxd08wfCQN1NUyRnlWYoDU+xT6DDdHq3NBzLIc+HGnivsxGKXULiIFLjhD2I26r3
         vY5qekQlaf4LTjGibI6Le2I1RCyFs8Rakle75ZTKjiguDCEU/jCUzFZnumRQwu07F/y8
         stFtJeNUG+pcyecSp7w4NYth6DBsXa/SLqJ0aZtkBVGAll0EYD91bq0bai6/Fd9HZlfP
         oO/aFeWLCTLM/EvWB3mSYGDkKv+yp+LehuM1rjz01dpE9Zscu14PzmES9q5wRnOPuv/V
         RXqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=BajbWczb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n126-20020a37bd84000000b0069fb862b796si5378032qkf.410.2022.05.15.23.24.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 May 2022 23:24:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=BajbWczb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqU9H-00076V-9W
	for alex.bennee@linaro.org; Mon, 16 May 2022 02:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU8u-00074O-JP
 for qemu-arm@nongnu.org; Mon, 16 May 2022 02:23:44 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:56658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU8s-0007Oi-LE
 for qemu-arm@nongnu.org; Mon, 16 May 2022 02:23:44 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24FJR9pa027184
 for <qemu-arm@nongnu.org>; Sun, 15 May 2022 23:23:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=x4FXEitBRDcPcuntXgCai+9tBY2HrXWzc+iu8zmQfKE=;
 b=BajbWczbaut8DgTgRjLXODOFpyDpejY41h9ntFHVvxt/3FtwytLoRNl//DqsWjBJRum+
 DUKKkEbvEtS6yDjGhJFqHIE70S1SXYOIdwUjwySMGu8NyfdVF9LhlqRKdWhcV9C4VElO
 8HNyffh1gKRd09KoWF9Evv+YrYsuIPe1r+g= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g2a4nqanw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 15 May 2022 23:23:41 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 15 May 2022 23:23:39 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 1373B64DCAC8; Sun, 15 May 2022 23:23:30 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <irischenlj@fb.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <clg@kaod.org>, <zev@bewilderbeest.net>,
 <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>
Subject: [PATCH v2 3/5] hw: aspeed: Ensure AST1030 respects uart-default
Date: Sun, 15 May 2022 23:23:26 -0700
Message-ID: <20220516062328.298336-4-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220516062328.298336-1-pdel@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: rhvSwU9dyxx2swMLDuHogfUu44lH26_k
X-Proofpoint-ORIG-GUID: rhvSwU9dyxx2swMLDuHogfUu44lH26_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=6135bb9a91=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: svdJ/UOmt8YH

The AST1030 machine initialization was not respecting the Aspeed SoC
property "uart-default", which specifies which UART should be connected t=
o
the first serial device, it was just always connecting UART5. This doesn'=
t
change any behavior, because the default value for "uart-default" is UART=
5,
but it makes it possible to override this in new machine definitions usin=
g
the AST1030.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast10x0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index bb8177e86c..faafb800f3 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -215,9 +215,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->armv7m),
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_=
kcs_4));
=20
-    /* UART5 - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
+    /* UART - attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default),
                    38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
=20
     /* Timer */
--=20
2.30.2

