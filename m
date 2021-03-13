Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2250965lfg;
        Sat, 13 Mar 2021 09:07:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkAnVr8pr0N+oEIPluNF/ykgdLHlyiSpcihb0AlzDRjKDw/3O4epv5NaXZCLN3SRZRpj+N
X-Received: by 2002:a92:c0c5:: with SMTP id t5mr6628475ilf.47.1615655248769;
        Sat, 13 Mar 2021 09:07:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615655248; cv=none;
        d=google.com; s=arc-20160816;
        b=sz8gw7+WxSSSxbLJNdOIhkCiMAuEm3Ni77CzxPFuFmrmkQ+BOPS+HXcG7DjmKS6+c+
         PTovp7HbciBGPAJH0VMWhDO2iBTidADlW+l+D4sR8482+Z+FkZ5A6gL6dCH4AcB3JKra
         q0t3IOH4k2gwbzdDv4vsr5aghT/W2JFP58EQcy1sAYViDmyNaozML1cyz871SKaXXeLE
         s2iaKszkJ5w8VFMJjFeeKVqRJGTjVf7yiaBf2nX4vpYnYIri28e5CSg9U4R7YFvkEgBz
         tcEOUGj6urFEfg8RTP6gtfA5IJLEo+M7M8lcGJZmrr9EQZYFt89o3G7MtWWWbcRvRhpo
         CtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=1zohvJ6sxOOfnWcGj8WNa9DGoLyrIMi2NDlIWklnQZ0=;
        b=uAXdj8tY995Xrm40RuoT5ZF/XZ43SJgI3rcoERianGc47f/55CJJl06hhQ2C6b2JF5
         3ZNo1gZfPrLSMQlImMo4oGzZmfHetOo1BckOZZMg+aSNc25I+/xK36gE+g2ClJ62OCyR
         5PUrz2NR8EWR6mmFPOiYY7obpdXYIy5xNuFDryGOG84ChtJN7P6w2fiv/JNbEAufX4zl
         4SWc+7o0+Fx9+8ChDbZH3Rrie38xptK4qxYZ7+H+Fu3VTgpcW3Cd2MGetUWI54gQ0U7L
         VfIdjtVOXVNmwDYKSeBc75aS3kddpX5EQwMBntTysUOVDy3bMeTcNUEDE4VszuHrEK9J
         9CMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="OM6pQwt/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p31si8050009jal.19.2021.03.13.09.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Mar 2021 09:07:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="OM6pQwt/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lL7jb-000073-Tr
	for alex.bennee@linaro.org; Sat, 13 Mar 2021 12:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7dy-0003VA-SE; Sat, 13 Mar 2021 12:01:38 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7dx-0004nZ-Cp; Sat, 13 Mar 2021 12:01:38 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so16949485wmj.1; 
 Sat, 13 Mar 2021 09:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1zohvJ6sxOOfnWcGj8WNa9DGoLyrIMi2NDlIWklnQZ0=;
 b=OM6pQwt/kkccbZR3cVt4ymTr8LOkJ8w7VVGXpd73Hm4EJmFvQodROi/Q7d/R8JrxWr
 +ehjto8shw4J/qM6FSPAkFlg0rbBYX4YvpP9Kv3fwuRt7CKmBqUCTu3p29KG/xjScHQE
 6npQ4Tn2Tbn8lKFOjMElKMSsFDOwB+pDjpmq3S9lSsO1XRQehwygrTiUAEFsZFDVu4MO
 hCGEwK+n3De6xEYE3RMXlxxBSipkEQup0/J1BihMn1n3pAtwUGcrUV/zfSXIe0bxN/YI
 Uhpqv9bok9fFDcb/6M9QdKt1ziqZ0ATVLhFOzcGSIhgExZf2cCLwhAzyKQct68LJLzcV
 mdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1zohvJ6sxOOfnWcGj8WNa9DGoLyrIMi2NDlIWklnQZ0=;
 b=G9bAKyZm6OPyJDdI4bEnRZi2KiYerjyLnJJvzE00vJphq5OTmreDES/QjJ2TRSx4lK
 uQ1IdCNbQ8xj3Jr+ntsrlegYC8vqk+g+dP1mZNXSuusaRMAsaunZazCGxtv7skrpYE0j
 Eyga+li4269HN31b5HQDyz0PY013QPZRZJ4MV/qe8KJZ/mqEMCqI1S9C0N8fWj9v/+AO
 gxDVii28aCU/ymZj5QiI7/J5xelBZ02Nt0GkZ9REqw3K0wc7ypP1AUw+kKx/lFP84v6k
 9chk8OW6QCVSF0EJBCwQn4Qe6JaOm3L92plgzjxQTYficR6SE3mKCWZjHdHxmdncTklE
 gz4Q==
X-Gm-Message-State: AOAM532dn3AFeJXOy9gH2XAkYjmaLUNPcXUaIh+CZH4ALZWYRCfz+Dk2
 XRaFAmELvAH2z1iji99JcpVEsFlFft+r5Q==
X-Received: by 2002:a1c:e041:: with SMTP id x62mr18173662wmg.95.1615654893887; 
 Sat, 13 Mar 2021 09:01:33 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x13sm12537825wrt.75.2021.03.13.09.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 09:01:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/display/bcm2835_fb: Remove DeviceReset() call in
 DeviceRealize()
Date: Sat, 13 Mar 2021 18:01:31 +0100
Message-Id: <20210313170131.2116837-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I8Yb4wfMDM5M

When QDev objects have their DeviceReset handler set, they
shouldn't worry about calling it at realization stage (it
is handled by hw/core/qdev.c::device_set_realized).

Remove the pointless/confusing bcm2835_fb_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/bcm2835_fb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 2be77bdd3a0..445e8636770 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -424,8 +424,6 @@ static void bcm2835_fb_realize(DeviceState *dev, Error **errp)
     s->dma_mr = MEMORY_REGION(obj);
     address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_FB "-memory");
 
-    bcm2835_fb_reset(dev);
-
     s->con = graphic_console_init(dev, 0, &vgafb_ops, s);
     qemu_console_resize(s->con, s->config.xres, s->config.yres);
 }
-- 
2.26.2

