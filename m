Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4232006lfm;
        Sun, 5 Jul 2020 10:34:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVZ9QiNZkmws9sHb3BhQ3bT9sJJJJb2eDGSd9n3407ZKW7yCzNmIzedNskyE2HCBn9trUY
X-Received: by 2002:a25:9305:: with SMTP id f5mr24721502ybo.331.1593970457772;
        Sun, 05 Jul 2020 10:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593970457; cv=none;
        d=google.com; s=arc-20160816;
        b=MDBUCxzOY6w91NYIY9aUqm6r26/ppDhr1jIpNocVrWUxvetDDFIxuQ8ldcMZJpCi9b
         OLshWUb9eK+H0NmqeRXJRJoM3yHxodtRQtI8RnxhFA+f0K6mPDPOiAqvSWORYA75hb4L
         5onCKBn9ToHMbT/auZcwzrmnTsF4f7AUZHBMTAWJUYTsXfWPFwqDNkVZsVTlxQC0Rt8n
         9GhX9APrXJ6H6gEEGfxtS9gq1ipdsBorCtoXzJzG4WyBqxJQBe6Wvhua99V2zG8Il5x2
         GRAxaFX/JY7zOVyk9fJZU2XOoRMNdDb+M2BDKx0noMe1s21Gd6n4m6PhMfjV4nerdxAs
         52pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=PuV1/W4zTy0w1hBZeJNwhkU/sfRpJmdSN3gziOQhnYw=;
        b=MIQZ/9tKLQz2s42xBx5sE0VMnbZW45Jmd1a7bDvKr3LEBxM0zPRPgjYgip1D1R7yuY
         SGRia1BIV5hzlS+MtMdSSVRy1pDf+fR2Pg7XIz0ymvrCX5o9E5LpwiiSlKpvDfBe3vod
         ujP3PnxbZAQvkYZ0wlBZXryoKrjRcV+0gxeEsY6o+JdmUpuQflhoMsM5Utr5xlpioE9G
         KQrVFxI8zbwHSFHVt+Cx17nHBLTYfQEnR+NGbMfupAAKFCpoHdA47DKt7YMcl81o42UB
         xDW0FBo1LfN6WSrKFgSu0TLSljVACKXhfUEl4gBRjO9sL9Y6IVeL78mulFQcUCJqiJ/b
         zMeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="T0/1sdk7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si18822404ybk.106.2020.07.05.10.34.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 10:34:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="T0/1sdk7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1js8Wv-0000n3-6s
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 13:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1js8Wm-0000l9-Nc; Sun, 05 Jul 2020 13:34:08 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1js8Wk-0003M0-Jb; Sun, 05 Jul 2020 13:34:08 -0400
Received: by mail-wm1-x343.google.com with SMTP id o2so39208057wmh.2;
 Sun, 05 Jul 2020 10:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PuV1/W4zTy0w1hBZeJNwhkU/sfRpJmdSN3gziOQhnYw=;
 b=T0/1sdk7SX+8+dLtkRsdSXmNpNVNstCXr/dW31W3Ma051IhpNje62Db8076i07n4++
 ibyuZHKLnh06V/ba2cqxaP6EfcIHAwVdlEOKCvkRncE1TGxerjXB+8gmZC2w9XGIVaJY
 FCwZxHZNxgHsS/8qngus1CIm96Hgr8DqBAA6dXaVXvkA70fgsPvhiNCk8bplffh3Xj3a
 eN7mNMDY9e9IqILH8pgM4bGqF6HRY0Gm24sCbO15skB2iG+9OhGzDTs9rjTZhZThEgJa
 DrpEbP1ry0rpG0hcNWS7u1cJ2tJJv/a+WFnqvkxp6APAddGzyY2SqTErWDEzWktHJ5VO
 BQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PuV1/W4zTy0w1hBZeJNwhkU/sfRpJmdSN3gziOQhnYw=;
 b=WTadNBUDYGRIYmf+Dkhh0uaX+fIMj2EaC3KNF+8reXDiPGO7rLZGZdEAdr4ZvAWtvl
 60uySyuUMCNI4SeJeRjduggLxWSRO9kVocqJ+R1HBuRJD3vXRx6I6tXy2H0viXy7oIYd
 i5EYZFne1XSvRrYSerQLNuvGd3InlRzeUXP0/lP+5OJFZSDhICIHLYQwtMhy6lnYZ35E
 dZqSzYTkJ35sp2ws8BlFkAwulFAwPxTLOutnH9GggZXxtQ8aMLTQ5XRJskx6+XmMURB5
 kk0WwmbrixuEJV4ePeGLWxcWnxF5IoW4pKLK+yp3x1wlVBePxX4ADTL1TnG1Jma5tGGP
 vBiA==
X-Gm-Message-State: AOAM533OK9VD4ePs1zoHIIG643+1cKs5F8nEcPvcKyBAzRPgiRvYcHzu
 G88gBi3bBR/NIRIanL5zvTsy87MnKdM=
X-Received: by 2002:a1c:c90d:: with SMTP id f13mr3701643wmb.185.1593970444887; 
 Sun, 05 Jul 2020 10:34:04 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id j14sm20625357wrs.75.2020.07.05.10.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 10:34:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/aspeed: Do not create and attach empty SD cards by
 default
Date: Sun,  5 Jul 2020 19:34:02 +0200
Message-Id: <20200705173402.15620-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fVNaWhOsiR2u

Since added in commit 2bea128c3d, each SDHCI is wired with a SD
card, using empty card when no block drive provided. This is not
the desired behavior. The SDHCI exposes a SD bus to plug cards
on, if no card available, it is fine to have an unplugged bus.

Avoid creating unnecessary SD card device when no block drive
provided.

Fixes: 2bea128c3d ("hw/sd/aspeed_sdhci: New device")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Eddie James <eajames@linux.ibm.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 379f9672a5..11521c4be1 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -246,11 +246,12 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
 {
         DeviceState *card;
 
-        card = qdev_new(TYPE_SD_CARD);
-        if (dinfo) {
-            qdev_prop_set_drive_err(card, "drive", blk_by_legacy_dinfo(dinfo),
-                                    &error_fatal);
+        if (!dinfo) {
+            return;
         }
+        card = qdev_new(TYPE_SD_CARD);
+        qdev_prop_set_drive_err(card, "drive", blk_by_legacy_dinfo(dinfo),
+                                &error_fatal);
         qdev_realize_and_unref(card,
                                qdev_get_child_bus(DEVICE(sdhci), "sd-bus"),
                                &error_fatal);
-- 
2.21.3

