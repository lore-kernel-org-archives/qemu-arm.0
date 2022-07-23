Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp824907lfp;
        Sat, 23 Jul 2022 04:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1trdYTnyZ1mFYDIFOq4c/+FagtBqSFjymdE/Q6D24eYGClhy4sW9Nf4zJvX6e6KszT3htdo
X-Received: by 2002:a05:622a:28c:b0:31b:f536:942b with SMTP id z12-20020a05622a028c00b0031bf536942bmr3591251qtw.654.1658574886352;
        Sat, 23 Jul 2022 04:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658574886; cv=none;
        d=google.com; s=arc-20160816;
        b=Np5NcvnLO2kpEAM2LkDJvq5YW7mbMQ48spmHOUVhSDGpJLLjui/pptUR2Lwb8fM4+E
         3rUhrjpt2ctx1umVhZuzvrphOALHNzuy7qZF5jSNYBgLvfbBAORm0HSmhWf0Wx1PVQnD
         pEXT6mnZ3s+S7nJ8PCu8XdeYRUNbgipSXRnb1CAcsgOIIgE4VM8J5ObjLISWkH0qoFgS
         7ll6UnAcUWfHTqpD1BPLyWl43MDD+2OufiVRdq9Lqyy62llRvCLXeM3lDQzCBe7Eddxy
         tlmB+s8wZJY6kRWtHBLdhY41KTsKNHJyPPmdWhc8dARZzmL9qkfjrN5Gp5bvQnqgHo5T
         AHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mZbsZ5nxUwKc8ecMbjho1fA96zs7BB6R0qVsKXJQ2+Y=;
        b=BV21fQ1/6YGJOevbRkrek30U+9IAAe3YgWEY4qsqRbuUzS/KdN4CBkK0fCaJ25Dmrl
         KWJosqFo/AuZ8ncFGeCKh9oxIHtRWVF5mt56R+bP4pvHpSnuunmAMLnkY0IFpmW7eD8/
         GfFzbP7TmkFihlnMZR6Zz6fHF/4NRSAx532DL7jTqafNuULEmBiNQwDiqvpwpG28NpxS
         JgvfGb4BdPJo1d+kn8t8ucvEpDqH9/6gEDNWRBGYOrLk3B/HRNNoysSWqPBfw0gbdDPY
         u/FGl6A741Jqqkc2D8Wu5LlJWpp1BZFRYYvTTMC5VNE65vg3DX7ARoRy9ryq50ju4r+L
         PmXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XPZovT7p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020a0562140c8d00b004736f7f7bc4si4605855qvr.536.2022.07.23.04.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jul 2022 04:14:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XPZovT7p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oFD5p-0004Yz-Su
	for alex.bennee@linaro.org; Sat, 23 Jul 2022 07:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alanjian85@gmail.com>)
 id 1oFD40-0003qv-Nr; Sat, 23 Jul 2022 07:12:52 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alanjian85@gmail.com>)
 id 1oFD3y-0002qX-PJ; Sat, 23 Jul 2022 07:12:52 -0400
Received: by mail-pj1-x1033.google.com with SMTP id ru18so491949pjb.0;
 Sat, 23 Jul 2022 04:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mZbsZ5nxUwKc8ecMbjho1fA96zs7BB6R0qVsKXJQ2+Y=;
 b=XPZovT7ptXvO8uhcN8z01o7i3PjqwKw6Y5rpkRbKN6b2/2gy1PDOBy/SX2WwWpzrdD
 emSFBRLjTQAZYDRodZM2noea/+Sdb/cY4rcaYjcFSATifm8/zcJnZupLSylmzCXKQ13K
 7DkErAWrcymFKOv/netliMzcSX3lKTlrbZ1TWBVyQjM9B0wZNcF1y6s4g7BJhAVoCeyp
 DKi4VNY/TmD/C90epm3wlo0QxDolODbcBWCeEtjEoJJ0FQ6Mk9fsudC2O5y/4mLPz1Rg
 HU3JoyPPfhRbMMVDr6cvR4bP5T0+qxzaFQWg0fjjiMxOQ5YaL45qdNLKwl0WgZOkXsuT
 MueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mZbsZ5nxUwKc8ecMbjho1fA96zs7BB6R0qVsKXJQ2+Y=;
 b=zquGvblTshrUGhbOlzl/4Vg4xerF+26BKmbJmaZLJWf+fknOqGS4IqJozY7VbvC2qk
 TfOb2dya3iO0AYPwEgtC6UGE2TmMFav271uxlpkokfldqW1oQxxomWogNt9xulyOAtNI
 RFXfHaU6XNP1UDdtZ92NLFnZHg0N+bLuOJ9DHYh0i2NS5XjYbqgXPOi6xsAGbcIjZ3kX
 tWukmA2TSdMWXEHDRYvy+ii3CQCKx5SAA4/2KD5VapD1mJcnKMzCBh/v+J6RbFbDR+xD
 HekV63Lvea8+dhItIZh1Blhva/XXwM8aMpDntY8r12rYhDBNeiNuQx3TXxG7v2Y8q7cV
 ccSw==
X-Gm-Message-State: AJIora9/uLs21Rojb2/NiXCDZYkg/qYYBKjzEdRihBNXKjd5dbh1wVQC
 UQKp4xGusAeJDa7aUDwtDslM/VbIwEM=
X-Received: by 2002:a17:902:f60f:b0:16b:d172:4014 with SMTP id
 n15-20020a170902f60f00b0016bd1724014mr4059074plg.147.1658574765669; 
 Sat, 23 Jul 2022 04:12:45 -0700 (PDT)
Received: from alanjian85-Vostro-5490.. (36-227-58-102.dynamic-ip.hinet.net.
 [36.227.58.102]) by smtp.gmail.com with ESMTPSA id
 d24-20020a63f258000000b004168945bdf4sm4869501pgk.66.2022.07.23.04.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 04:12:45 -0700 (PDT)
From: alanjian85 <alanjian85@gmail.com>
X-Google-Original-From: alanjian85 <alanjian85@outlook.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	alanjian85 <alanjian85@outlook.com>
Subject: [PATCH] hw/display/bcm2835_fb: Fix framebuffer allocation address
Date: Sat, 23 Jul 2022 19:12:28 +0800
Message-Id: <20220723111228.8611-1-alanjian85@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=alanjian85@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GyhSeuuB2leR

This patch fixes the dedicated framebuffer mailbox interface(marked as
deprecated in official docs, but can still be fixed for emulation purposes)
by removing unneeded offset to make it works like buffer allocate tag in
bcm2835_property interface[1], some baremetal applications like the
Screen01/Screen02 examples from Baking Pi tutorial[2] didn't work
before this patch.

[1] https://github.com/qemu/qemu/blob/master/hw/misc/bcm2835_property.c#L158
[2] https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen01.html

Signed-off-by: alanjian85 <alanjian85@outlook.com>
---
 hw/display/bcm2835_fb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 088fc3d51c..a05277674f 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -279,8 +279,7 @@ static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
     newconf.xoffset = ldl_le_phys(&s->dma_as, value + 24);
     newconf.yoffset = ldl_le_phys(&s->dma_as, value + 28);
 
-    newconf.base = s->vcram_base | (value & 0xc0000000);
-    newconf.base += BCM2835_FB_OFFSET;
+    newconf.base = s->vcram_base + BCM2835_FB_OFFSET;
 
     /* Copy fields which we don't want to change from the existing config */
     newconf.pixo = s->config.pixo;
-- 
2.34.1

