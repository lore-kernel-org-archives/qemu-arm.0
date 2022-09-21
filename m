Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2768331ejy;
        Wed, 21 Sep 2022 16:47:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7F5UHmndMDRrMevzU6a0IZWSwouIfweUCHRxxY42HQKQS/HaloY2K5jTTJhbhcosc+/dAs
X-Received: by 2002:a05:6214:23c7:b0:492:2ada:11d7 with SMTP id hr7-20020a05621423c700b004922ada11d7mr532070qvb.116.1663804052915;
        Wed, 21 Sep 2022 16:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663804052; cv=none;
        d=google.com; s=arc-20160816;
        b=veVUpl9kgWehP24trVHfl9NdNQNATbzjSKRUZwzEfnoSW7xrDe4w2Yoaq/QBMAc8Eh
         kh5iHGGYVt+13g/K2OYxq0tgES6dRlnweR6EndvJEiHmG6riHh3oJs8miJhdM6Y0SC/k
         +CWvs59UD+YD1tbEqYbhl4qUdplwH+xVDX4LTYMIZNQfdSb4YqNQj1ceXwJaxLWxjZyr
         9dwIwTeihCRd9ZOUygENM5wqYoLp9TkUILVaOUUYyfktoNoCjA53mVGhR3s3gAfab02K
         L8gSJyflIsOuTtllgiLUeXAiVC/+zxfydAe1sPK4w3hDZ3WSSKvscr8WnHfvsxSa8Fhr
         RgUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=9tiIReuaymRKZMv5ofYH6sbg0oQrV3s+sRPgy/cw9LQ=;
        b=IiGC6uhJBrkcZRJX7g07nsdOcay0I8qiFpsfL9vWahuUowDaVB6rO55npW7wXJ16ht
         +OHTHMmDUnne2vztN5ZAgwMnfNu7ZJKPxL85Vn0EiCr8ZleinBAtfqhKm4M54JCcxiho
         P4ApdJAp6rUBhyuXRT/VxKWdpsITN98/HjEh8CVONWTB0LrzYXaAP48wzvKqt+oR2BOf
         UgmWs1rnnmhnBlh2QGhj731+B3npRQiDbMVE2mOVXcMoTq02DB7LB9a3n9zrVKhdPnqk
         eOSXpDev6G/WOdqwDq7Il+GctuTGyvAME/11b/+69LGCGzMJyUx425kqAGZ9FGGsHbcd
         qftg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=l99SFjWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20-20020a05620a249400b006ce5f59def1si2506670qkn.389.2022.09.21.16.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Sep 2022 16:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=l99SFjWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:35898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ob9RD-0006YD-EL
	for alex.bennee@linaro.org; Wed, 21 Sep 2022 19:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3aqIrYwcKCH0wfouvsfhpphmf.dpnrfnv-bsnopohov.psh@flex--venture.bounces.google.com>)
 id 1ob9Qe-0006XP-L9
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 19:46:56 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:55046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3aqIrYwcKCH0wfouvsfhpphmf.dpnrfnv-bsnopohov.psh@flex--venture.bounces.google.com>)
 id 1ob9Qd-0002cj-5L
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 19:46:56 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 b18-20020a253412000000b006b0177978eeso6609978yba.21
 for <qemu-arm@nongnu.org>; Wed, 21 Sep 2022 16:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=9tiIReuaymRKZMv5ofYH6sbg0oQrV3s+sRPgy/cw9LQ=;
 b=l99SFjWSaAothBVKntzAfERVNRHY/Th2RCcgcmq4zf/tJWFJ1a7rTXW9gN/uyYy1cB
 B1VTeYagMBROpdCTkW80EzC1XZoP4lKgR5SNM8VsHqdoa2c6oc6jrCQUTCPTzdzB1W7n
 38FD/WkdNya1o6OKGJ1/5F65MfICzA7l3IRW9FVzgS8h9a9tNshU6g2ZsEnW2O0vAvmG
 HOcBzLWZ07H4bxMGOq2ejg82WR2JZKT0C8PRWTPaePsSMsp5Ov3pD8fzof3dPkbwCf7/
 w3salKDyNSFOE9MtqK8pBH1MYCUJPYuLA2VVXp+5JJ03EKbi4BeJdqZDMasYdm5m0MvX
 D2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=9tiIReuaymRKZMv5ofYH6sbg0oQrV3s+sRPgy/cw9LQ=;
 b=xTpjktCPXrHvYXFkAYbs37ftJ7BHdNsy+nlXO8AGjSmkiMKGxdDnQN77kgrtEs/Beh
 I9PrxeQ6q3rPnaYKM1ZHb44m61VXYPcKtdfh6WgqZ4SZ9l9dewcNUFUj2nVb2Xtom5Sy
 QcJO8XLYHsV+mJmbUNLInEGSeDPAsmA8NwveAoq/rBcULRpztcbe0/rtvptXfWz4HHYL
 3ndMY8Ule9xmrbUvJmeZ7F24nJPCImIH8ZYuCRwfmBge2DbFy63OFtBdXjuqQpYiI8ca
 W5izfTCO2+TF8EF5C86XZZlS156WM3NxgUeUMX0J23ZmLd/iAWzOx7z/eJDLhIP9y4j+
 XKrw==
X-Gm-Message-State: ACrzQf2UF4Kbv14zK/b6AG+aLGlvvFsFt2Ytyt2XwChjkAGCIKc8W4j2
 UfYIibj/Vfu+1SMw/vXBXo3LWuraGPm3
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:cdb2:c21d:9e12:1a22])
 (user=venture job=sendgmr) by 2002:a81:118c:0:b0:346:f0d9:bf51 with SMTP id
 134-20020a81118c000000b00346f0d9bf51mr685723ywr.288.1663804010758; Wed, 21
 Sep 2022 16:46:50 -0700 (PDT)
Date: Wed, 21 Sep 2022 16:46:46 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220921234646.949273-1-venture@google.com>
Subject: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3aqIrYwcKCH0wfouvsfhpphmf.dpnrfnv-bsnopohov.psh@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: W715f91cVhmd

The MAC address set from Qemu wasn't being saved into the register space.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/net/npcm7xx_emc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 7c86bb52e5..6be1008529 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -96,6 +96,9 @@ static const char *emc_reg_name(int regno)
 #undef REG
 }
 
+static void npcm7xx_emc_write(void *opaque, hwaddr offset,
+                              uint64_t v, unsigned size);
+
 static void emc_reset(NPCM7xxEMCState *emc)
 {
     trace_npcm7xx_emc_reset(emc->emc_num);
@@ -112,6 +115,18 @@ static void emc_reset(NPCM7xxEMCState *emc)
 
     emc->tx_active = false;
     emc->rx_active = false;
+
+    /* Set the MAC address in the register space. */
+    uint32_t value = (emc->conf.macaddr.a[0] << 24) |
+        (emc->conf.macaddr.a[1] << 16) |
+        (emc->conf.macaddr.a[2] << 8) |
+        emc->conf.macaddr.a[3];
+    npcm7xx_emc_write(emc, REG_CAMM_BASE * sizeof(uint32_t), value,
+                      sizeof(uint32_t));
+
+    value = (emc->conf.macaddr.a[4] << 24) | (emc->conf.macaddr.a[5] << 16);
+    npcm7xx_emc_write(emc, REG_CAML_BASE * sizeof(uint32_t), value,
+                      sizeof(uint32_t));
 }
 
 static void npcm7xx_emc_reset(DeviceState *dev)
-- 
2.37.3.998.g577e59143f-goog

