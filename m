Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2675417lfv;
        Mon, 1 Nov 2021 16:25:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGtigGaQl5zlR9QBlC6OXp8XRxsLqtBYxdAdUcjGkSOSGU6JbsZGjQJ4GOQahwkqQ0oZ1w
X-Received: by 2002:aca:bec1:: with SMTP id o184mr1737156oif.43.1635809105785;
        Mon, 01 Nov 2021 16:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635809105; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMbNZOjW7V97CKpt+vO1utq3byn2nuUIeTnUI4u38rcm/ebDg7VDEkykb5NsEJy1TY
         8tvPjW73CjEtNQjiBRsH2bgoaDUP55ZRaAO5m2Os41HCWEhv0ORF3CGEezhciDU9Fg9G
         9mTfrUJ4+0ondmhN3K+ef+XE1xm/8u8SEM0JqqvnrlRlVMd66vNI8Cc/9dVxfo3MGlS2
         xOpdXHbCQFoGW1cB+AoUhtQuF+E8rU9+WECYySL0uZFiW5Qz4uxM4x41t9SURAe2PrMT
         qp79aQRGlpIYpi9y9i0ScOxBhYw4Aza6BUaX279iRwx/XBZENsMhhlWmbj+xJSMUq9uB
         /8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=XzmzLTw129AfoXJexFTDBkJFYclTTe0/WMWRnSEgR+o=;
        b=zVXEqxPDaoujdb07ytiinGdLnQuMXL1qr2y78TvjQaNFw4J5p1jrtEK/QfgkbcU/Qh
         PuK0y8W8Zso6U3TWlixudDB/Hrb+vSRhC9SMG47DkTAY97ZIUgim9uNMRM9SG21t7PBG
         8iT2c+BHmuilfSin4bcHg/3iNl5G79Uksd79V6Te0AJGtPHJwAcZgs9Dc2pQ7e9fHj5D
         BLR4ex63w8q0LlAIIA7uFpvq2vj/Dc75829Y8fB30BieZPrIjF6+/FnAPCxJIVRrXhUW
         QZk9TGkrB+QPH88nfIZVzB9O3X1l+O2phABiOF7+iQYhs6OnRDQUuSPRto8nipUGkhPv
         LwRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=cV4lkirV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si19155597oob.71.2021.11.01.16.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 16:25:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=cV4lkirV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhgfn-0001lQ-3t
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 19:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DXeAYQgKCBACAxq498xw44w1u.s426u2A-q72343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1mhgen-0001jB-Ph
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 19:24:01 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:40709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DXeAYQgKCBACAxq498xw44w1u.s426u2A-q72343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1mhgel-0002v2-RE
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 19:24:01 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 s22-20020a056a0008d600b00480fea2e96cso2904680pfu.7
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 16:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=XzmzLTw129AfoXJexFTDBkJFYclTTe0/WMWRnSEgR+o=;
 b=cV4lkirVsBCQabmzo/ALBPhmjaSB5+HRLGedyUZrUKTHBXinsTLN4Tb+Qlmfq8z2hi
 gfbMytI81qzq8/FKkoDBuuBwjCBCYtwfj05A/7zgGlYu8UUxXQwU7swhNhm08ffK59qN
 mK13wtnomVrzApfnuPkZPKKo6Ip+aPZwUZW6YF6jMi8MMhUuuV7uh1W/CQFhgisQQc4u
 i9XoLMXK4hsbc+xV+V8RsznI5MMUhqXzz6pQ5PzlkErcoBuV2cEMsojtNDEfaFefir8M
 QAjtPqsrAVW9036CiQ7PQtWKNpZM7yDUGGSG7gfSqlmqdKgGU3tjkPam1HXWCmHNJhwD
 gWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XzmzLTw129AfoXJexFTDBkJFYclTTe0/WMWRnSEgR+o=;
 b=eNCnn6eRIsqvEOHcChTkFRFQIjxEKpAXDjh/UViWNk9uFJEawtCDrjwujmsW8DFcOH
 d3p39VxgmYDfzYeSsGglUx8/HiTLjh/m2O9q0GPJE36JzzrPrrgcC7NZ0foSykdRxK5t
 5Q1weB1DuMifsqgPfiULFC5LUxVEBqtSBA4leenSC97wS6qIT77wWJGWRbxoMyGMkGjh
 En775kdZC5OlR0WRzrKgUdhTIbTKjKZ9KyaSfQYULAseucKdaVr+hG7x6KqHKG2tM6nd
 caA4hq/8MaMJ2twK6WD6QyuRAlULwTssr3bq8FcPngSIRnEyBk63LGj2ca8n4yzotTVj
 sOLw==
X-Gm-Message-State: AOAM5334sRYkW3KK5OJrDW/KtbgjPpKzPov0R21A4TqMH+1PE/VV35wd
 XCGPL6Bo1aLRm8oxJ6wITQezsOxjE6owVw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:d2cf:b0:141:b347:df9d with SMTP
 id n15-20020a170902d2cf00b00141b347df9dmr20630352plc.37.1635809037724; Mon,
 01 Nov 2021 16:23:57 -0700 (PDT)
Date: Mon,  1 Nov 2021 16:23:41 -0700
In-Reply-To: <20211101232346.1070813-1-wuhaotsh@google.com>
Message-Id: <20211101232346.1070813-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211101232346.1070813-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 1/6] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3DXeAYQgKCBACAxq498xw44w1u.s426u2A-q72343w3A.47w@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
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
X-TUID: YyegKfE/GMDV

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
2.33.1.1089.g2158813163f-goog

