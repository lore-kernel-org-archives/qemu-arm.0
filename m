Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp791412lfp;
        Thu, 14 Jul 2022 11:28:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uaxrFIHvaQx0LTXWw1LWGjATVZgSs7AG1WJGmD0r5v19hMFutDl/s5HBQoVCFFU4rXEZBy
X-Received: by 2002:ac8:5c54:0:b0:31d:2b08:b9a with SMTP id j20-20020ac85c54000000b0031d2b080b9amr9287511qtj.281.1657823317081;
        Thu, 14 Jul 2022 11:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657823317; cv=none;
        d=google.com; s=arc-20160816;
        b=Xt1n/qTE9dt6DpekNQb7BkeuAYmXgoXFaibSZJM5SK4cOyKbR+4jrP6Ogf8VwTicPT
         0ebH42VjgDNY1ITCmQQAVUrhXH47C8JTiR/aUQZPyn2pWuv0Jn27BKEEufBcRjhaerjS
         Vy4yvn564FesF115YNxzF9PNIdm9OANTNwx/Gm9dDL8vDh+tHs71NDsjTyCnXQiv1yn7
         I54UR4D9ftJS25QkPTXUL29Gl1DN2MPLUUJ1bJgrQWYAtVFxmDrDQ0w+p1Gb29yMLnzt
         hHGUEihui/ha08D/G2wQjAGE1yDzoRWK5+ro0G1Pv5oRPeE1HKpl3p+zxrgLvpRt6Af0
         N3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
        b=rqZQ0b1VoKwfxmeXABPoADANpNPVT39A3el/QTeS1+Zm0Fb4SvIwI2jIk6DE4tPfd+
         XMEQ0Egf49JVPZJ9bWwghAFBTV3szLcyLlWt3xD5+cesXOEBh6L+4lrV5ehbFb2s7SKD
         cdBGCZ4IQ73suBcVxfihq3+kbrj53Hnh/cqoM3BoZDLX9R4B8ir56gOXNfmwGOVany9Z
         3uHOUqpoGmweXupbrMwi3kO2TgrN2yizF7pHiK+yOIozpKkwSgqGjS0ncY4zbdJthNM1
         kBejjbbnP/aiAJir6A4bgmw/B94B96apARs0/fOsrO2mOMMbuYIQProGx/E49Om+uDjU
         xjEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=tBQdneFk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020ad45bef000000b00473413b293dsi1237863qvc.503.2022.07.14.11.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=tBQdneFk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3Zk-0004Mm-GA
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3MGDQYggKCE8DByr5A9yx55x2v.t537v3B-r83454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZE-0004JF-B0
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:04 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3MGDQYggKCE8DByr5A9yx55x2v.t537v3B-r83454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZC-0007Ml-OJ
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:04 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 rm8-20020a17090b3ec800b001f07b25d636so1647582pjb.1
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=tBQdneFk1mZ3l+qSjTrc7swcXUrArsAjIK7JSlXHfs9mMU1T+GXX+1JzNeRPZUVhLZ
 8fphVp/crtIfCay4H/u7cwDF8cRdum8s1gq4LIRni/jZcdbb+Kvm2wKHBUHKNjiSfjcF
 k+v4VWkRUQFbNfdbo3DJMwxJ/LeXocq6r2qpliEyrdws0LbtQEHosChiWsdKXKEQoKEH
 steCSxWKWMDdhQ53lYADXQajyKaOo6SioTNHvxIiZn8y8Txc/Jrl/zs576JRo5W/ozxS
 r5+ALQyOia4QG4+jnef3SC0Juv18jMGKyHqaJw2tBSpZvllcjEr3O0DHjoIbOonP+gyC
 WQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=hzxdT4035tqyibr1XZmV0q55C/sLI1IIBjYE0dxU39W3CxPCrLSpAB7XmOwd4L8R5Q
 haM+ZhICohzOMvdwN6r+bmSp+88+g/hfV18Hy7rvLhPKGuS1k3bEJ8HtcTFcmIxLHpsY
 Fw9DiMVWoCVeg3xmIqwDuOWyETxNSxyiEGl15JiEm3LWul+UZ1e8BD01xBgKcMJ/U+0Z
 UxamV3z2Jnt4Kl5AURbymA5LBUbbFWV5OpiooPz4OZzl5oYIQMZMtDksMAJa5/fmqshd
 ULZb+6QdsylC11QggfIYDlBjcFysf8/kg81YDgrnhfbwEy4g15OE+3iT8Uc5fuQbdSMy
 Xg0Q==
X-Gm-Message-State: AJIora+TstLJky8tRigpmtEU9Lbj1rrhdWyZaVaP/sxAT0acMaNZDdd0
 56TO8ldNASmQuw7fJNR9CdL+eAnoyP0r7g==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:6183:0:b0:52a:c31d:11b7 with SMTP id
 v125-20020a626183000000b0052ac31d11b7mr9562442pfb.74.1657823280730; Thu, 14
 Jul 2022 11:28:00 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:27:40 -0700
In-Reply-To: <20220714182756.85664-1-wuhaotsh@google.com>
Message-Id: <20220714182756.85664-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182756.85664-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 1/8] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3MGDQYggKCE8DByr5A9yx55x2v.t537v3B-r83454x4B.58x@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 6Xtovmg9sqhn

The ACK bit in NPCM7XX SMBus module should be cleared each time it
sends out a NACK signal. This patch fixes the bug that it fails to
do so.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/npcm7xx_smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index e7e0ba66fe..f18e311556 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -270,7 +270,7 @@ static void npcm7xx_smbus_recv_byte(NPCM7xxSMBusState *s)
     if (s->st & NPCM7XX_SMBCTL1_ACK) {
         trace_npcm7xx_smbus_nack(DEVICE(s)->canonical_path);
         i2c_nack(s->bus);
-        s->st &= NPCM7XX_SMBCTL1_ACK;
+        s->st &= ~NPCM7XX_SMBCTL1_ACK;
     }
     trace_npcm7xx_smbus_recv_byte((DEVICE(s)->canonical_path), s->sda);
     npcm7xx_smbus_update_irq(s);
-- 
2.37.0.170.g444d1eabd0-goog

