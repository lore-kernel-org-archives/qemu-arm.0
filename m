Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp585087lfk;
        Fri, 13 Aug 2021 16:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDTmFpDqD1a9bfImFGuwnto+nxsttAZWzbwuAgpCRaXhKwSgfqdJdYeDtvehbcL29FaDs6
X-Received: by 2002:a02:7a14:: with SMTP id a20mr4499566jac.27.1628897687442;
        Fri, 13 Aug 2021 16:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628897687; cv=none;
        d=google.com; s=arc-20160816;
        b=spOyybwRFmzbOV29RA0DQKJax4SuUjsEgiBFHZ+VqTRGOUeH6GjuRbbtGKvuKIMevv
         rrYZbgsEae3lT9NU+j3kcszVRx0mXy6yHy2Hfkinzzx1WIgQ+683Rk3f4C9neEE1rLEA
         FJG2JYtF7D80hb6QLPi5eAZIdKXxCDD/z+JvYde2VfpyfZslOaVKh3+zFeLdk+S9WXe6
         9ohGuLbni1fgqipZJheBG2jjC0m8lG9GLyJmw7iSgV08vLJYEhFAKxSY+UEbXkA2UQ4l
         VwON/lnJtfMjVBPFODmP4xK61FV2k/zKPYPvynVBtbyJvcUPsoGaM8yKtcxr0KjEfYD7
         q4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=kZSaVNBvegFVl84P08rxmdcoUBFyrFrB0RMDEqBNAig=;
        b=sVCUhwVDZmgHfR0J8dUWOhtdAYlA+6hPAOLQTbMCRRQx43p7swPgryByx/iDhxTxxq
         lhDeJ9eW7/S/+dN1zMHilZiqAsg2TPpuldOlj482f/OqnccmAmc+VDqiJmbUOuMyocPK
         GcQzsJmFbHE1G4l5164kDN46dTXq2GDKk4WJ4JvRyZSzgh2oy+3uU6SM/QyxGadWBjgF
         Cpkupwp6Pn0mu1EypcFMH9agWsF0v9JtFce/NUZORvFwkxRSGCDJMXcnD/DNVyS0PCJf
         bBBMsEmQXNVt4ygsL9cvjauP7rUf//bHbOeKuAuaU4UHkLLLXDANt3+SxmuoiCNdYD3Y
         97Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=K2sqYcsw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si2870417ild.0.2021.08.13.16.34.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 16:34:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=K2sqYcsw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:35462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEghK-0003bS-Mn
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 19:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hQEXYQgKCPIqobUinmbaiiafY.WigkYgo-Ulghihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh6-0003ZW-IT
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 19:34:32 -0400
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:55037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hQEXYQgKCPIqobUinmbaiiafY.WigkYgo-Ulghihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh4-0005tO-GH
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 19:34:32 -0400
Received: by mail-qt1-x84a.google.com with SMTP id
 u16-20020a05622a14d0b029028ca201eab9so7374751qtx.21
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 16:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=kZSaVNBvegFVl84P08rxmdcoUBFyrFrB0RMDEqBNAig=;
 b=K2sqYcswLHSYD24jd3am+/LWeUcnGPdwnkzS+9YHfV8Tnak6OmleOMe+WHJzciDJFs
 5oe1JEyxtw2lFo4Euf9ROtf1ERr/xyIvCAB732MXg+Huw+v6st3uKIJ6fT842E4VWgy9
 dRWC6vtALW/QWF37gLVfjd3TOU6C6Ncn+uQoZTw2w4AyhsNUfJ06ub4voA6XwdsVROZ+
 j8UfMuWjtwIfhCW67NyJgTaKg7IPtqmcEuRqanzKEDAYrrKndbeZ2IA82InIdr4SkZq1
 EhhJMxA3/qmkRRZpCt4anEab4zAE855cyhfbQHchtdM8EwI55RBStcb5lA4Hh6myZpVk
 bZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=kZSaVNBvegFVl84P08rxmdcoUBFyrFrB0RMDEqBNAig=;
 b=ondZnHy7at5A+loT+51p1ggy2snsiyvGCC4QkIrj4BY/chz1FNQUTI6/lldFt6f6X8
 J8F2r2RLyODD40EzJVkMxEZtNtZAvxEGkeF0hFXEHmVDrJNciLMyb3KAgXuNIxRDnPAa
 aO/mmwPvF5Gpp9EYz7H5tutlGT6ph4m4kCLQJw1KdGEWa/oJJh8o/kFX/kU0Kecgc60u
 mQWJAsRgZlfOixh1L9M6g3ZB5USqRVSyCAr9AVG6ssW2Y1a/ieFQeR0jwbIRUi+oY1zf
 UY37NouMCRgiLRwxv7GDgTzJTG9Zi4wXy5Exn7339pH/gf6WzJu6g9cNGqHmO2hblbkl
 eMkQ==
X-Gm-Message-State: AOAM530eJ1pZq8FR3WWH3VqnfkOpusfZHNpfGdnq+vh+0+5meN9ymnw+
 +e++v9jqCi2PD3n0onvHCTe2ZojG5R4qkw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6214:1633:: with SMTP id
 e19mr1217790qvw.57.1628897669073; Fri, 13 Aug 2021 16:34:29 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:47 -0700
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
Message-Id: <20210813233353.2099459-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 1/7] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3hQEXYQgKCPIqobUinmbaiiafY.WigkYgo-Ulghihaho.ila@flex--wuhaotsh.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KI59gCuHYU8t

The ACK bit in NPCM7XX SMBus module should be cleared each time it
sends out a NACK signal. This patch fixes the bug that it fails to
do so.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
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
2.33.0.rc1.237.g0d66db33f3-goog

