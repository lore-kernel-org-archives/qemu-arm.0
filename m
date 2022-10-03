Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp177414ocb;
        Mon, 3 Oct 2022 10:48:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5xQSe+OAT9qfwzlcXoYPV7wC4vGCuMv+Esh0xqMpb4c+2QUCEio2bPI4m6VzOrKX7Kp2rL
X-Received: by 2002:a05:622a:1c7:b0:35d:4a61:f2c7 with SMTP id t7-20020a05622a01c700b0035d4a61f2c7mr16371689qtw.578.1664819334545;
        Mon, 03 Oct 2022 10:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664819334; cv=none;
        d=google.com; s=arc-20160816;
        b=UCtvAbRVVusdteN+uC5ckT5soWo6ErDGV5panfbo01GnO14P5xHYoJuiQ956NRR8Ya
         Yhvw6wR7D9z5lYX9qPViMjiK6LorvtpRC/sLDL5jPIFT6vQ3peaxOUssAoERMHzJko6i
         1qrRru71y+nrib+Z5jCtSm338vJgq6loPzXvZvLEOrckLq8DWxeFmu4HoXwy/ajkovJE
         UW4oXpO8SwrjSZQgDKjhVbrUTW2XNpd+XAUsQ835rfph4Cnjq8l9zbwS5uTiN4dG7Lsc
         I8lehqHHPRdhC/oXEA/qcl2HW6YiuObZfO6HfaRbHvODR5GzN/M6/kRq73j0yk0Fik2R
         1Vmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=sxJXfZ008cDPK0oNi+eJPi7CzUgpg2BylU6cUpmEcCk=;
        b=BmVxFCTC67g/SQ75t1XucYs6I54jqtjbDjGK8bJA0XPVgKlbNITOPR73JREYjqU5g2
         a280+BHP/JCCOSxwXoSYtivaQWQ2rSlMab1/D+nOJ26KjXhHlf4CJFteknBglRUDUK4n
         QUX9eaZxmO8bp6aWIX39TGSQpGUJSiVqLLWrVR8pc7TaV9fMpOeDg9lPgWzLY8tTi0ZG
         yJVE4d5BgWFcQ5OHHuuhaxI5/pxt1wpxGcpFcPlqadbzsULAV/c23P4t/7zcwpBAsvAQ
         U47Y+vqdj5+4M5vRetSCRd3n2QMqqpKEaKkRYRQcIeZcBwQPSUH0nAdOa0oufIf/4S3o
         /a1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=W1lfgmCX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n22-20020a05620a295600b006cf7d65b5b6si4682534qkp.553.2022.10.03.10.48.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 10:48:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=W1lfgmCX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofPYi-00047e-R5
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 13:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CB47YwcKClEEx6CDAxz77z4x.v759x5D-wxEx4676z6D.7Az@flex--venture.bounces.google.com>)
 id 1ofPOW-0000Ea-TM
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 13:38:21 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:33706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CB47YwcKClEEx6CDAxz77z4x.v759x5D-wxEx4676z6D.7Az@flex--venture.bounces.google.com>)
 id 1ofPOU-0003Sz-RH
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 13:38:20 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 e8-20020a5b0cc8000000b006bca0fa3ab6so10829587ybr.0
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 10:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=sxJXfZ008cDPK0oNi+eJPi7CzUgpg2BylU6cUpmEcCk=;
 b=W1lfgmCX6wFAMMmHKdZX9gS8g90mvFSmZ4Z4HFp5heQZJzuKnaPC68xZZROFqPFGFa
 /j2YeSexGq3uoUqSeBAyMH+P0+8+Mdf0rg/7bFDXtGcwRDgyjYp8LO6Yi2BrklZ/BGbr
 WNwC9tMhcCxZHQyLbiWHuMlCNoIa9OYfw8BiaitCx3ZRfA59hWN8XtaQG0jE0YWJ1gWe
 PxSST4fn1mu6kH/q/bakRi4rv25DChwOZGexXplBQ3XEPNm1TQmB3+D/mmdp2NKpwHYj
 E5ODV+M/q1XhPb8IxOI6FHBn7kjRD4/65CW4uIcV0NB0Optv4utWMXHpyu5HnMLoSqBy
 QQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=sxJXfZ008cDPK0oNi+eJPi7CzUgpg2BylU6cUpmEcCk=;
 b=JLhc+EoGOstFooIzlTm+0VINYiR/G9J4nZrCWrftfG4wzO1eZr24zTxNeyOTzaA9rG
 Yigg0FmFB/P0Uo3bzViRh4tLQPR3vn4aKc7fRytxqEHv8UBXL/XwOnonGOPitks6GFp7
 pL4axGwrx6a0UlNJwuz82ee1pQ56eaRX2Do7nItJ4MrIqbGUvQTZNV/WGUnI0Dt5aGT+
 zj7TdDFSUoAmN746ewmEhhpF7HyL/d2BDrv78bzIG/rVCPsyRPA1keJZ2ls7MnHjzuXY
 uRb9+vq1dCUHIQHVnYecFchyBhbIprP+m2dJQaqYOZP+cRJ2iuXwmgBHAPLx+j37NbYM
 JJIw==
X-Gm-Message-State: ACrzQf3opeYVGcEuw+EzTczIH4ABmyEAMqzxRT+wOXgwr7hO5iwL/OUA
 HuOPaIRQ3yiuZlaqkiaWqXitFFiEuOLk
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:39ac:b4b:8b32:a988])
 (user=venture job=sendgmr) by 2002:a25:b812:0:b0:6af:662c:9fa with SMTP id
 v18-20020a25b812000000b006af662c09famr20069572ybj.224.1664818696120; Mon, 03
 Oct 2022 10:38:16 -0700 (PDT)
Date: Mon,  3 Oct 2022 10:38:10 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221003173810.1933849-1-venture@google.com>
Subject: [PATCH v2] hw/net: npcm7xx_emc: set MAC in register space
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, jasowang@redhat.com, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3CB47YwcKClEEx6CDAxz77z4x.v759x5D-wxEx4676z6D.7Az@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: FqcYOwnoDvix

The MAC address set from Qemu wasn't being saved into the register space.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
v2: only set the registers from qemu on reset
    once registers set, only read and write to them
---
 hw/net/npcm7xx_emc.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 7c86bb52e5..a33f8c7b23 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -112,6 +112,16 @@ static void emc_reset(NPCM7xxEMCState *emc)
 
     emc->tx_active = false;
     emc->rx_active = false;
+
+    /* Set the MAC address in the register space. */
+    uint32_t value = (emc->conf.macaddr.a[0] << 24) |
+        (emc->conf.macaddr.a[1] << 16) |
+        (emc->conf.macaddr.a[2] << 8) |
+        emc->conf.macaddr.a[3];
+    emc->regs[REG_CAMM_BASE] = value;
+
+    value = (emc->conf.macaddr.a[4] << 24) | (emc->conf.macaddr.a[5] << 16);
+    emc->regs[REG_CAML_BASE] = value;
 }
 
 static void npcm7xx_emc_reset(DeviceState *dev)
@@ -432,13 +442,25 @@ static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8_t *buf,
         }
     case ETH_PKT_UCAST: {
         bool matches;
+        uint32_t value;
+        struct MACAddr mac;
         if (emc->regs[REG_CAMCMR] & REG_CAMCMR_AUP) {
             return true;
         }
+
+        value = emc->regs[REG_CAMM_BASE];
+        mac.a[0] = value >> 24;
+        mac.a[1] = value >> 16;
+        mac.a[2] = value >> 8;
+        mac.a[3] = value >> 0;
+        value = emc->regs[REG_CAML_BASE];
+        mac.a[4] = value >> 24;
+        mac.a[5] = value >> 16;
+
         matches = ((emc->regs[REG_CAMCMR] & REG_CAMCMR_ECMP) &&
                    /* We only support one CAM register, CAM0. */
                    (emc->regs[REG_CAMEN] & (1 << 0)) &&
-                   memcmp(buf, emc->conf.macaddr.a, ETH_ALEN) == 0);
+                   memcmp(buf, mac.a, ETH_ALEN) == 0);
         if (emc->regs[REG_CAMCMR] & REG_CAMCMR_CCAM) {
             *fail_reason = "MACADDR matched, comparison complemented";
             return !matches;
@@ -661,15 +683,9 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
         break;
     case REG_CAMM_BASE + 0:
         emc->regs[reg] = value;
-        emc->conf.macaddr.a[0] = value >> 24;
-        emc->conf.macaddr.a[1] = value >> 16;
-        emc->conf.macaddr.a[2] = value >> 8;
-        emc->conf.macaddr.a[3] = value >> 0;
         break;
     case REG_CAML_BASE + 0:
         emc->regs[reg] = value;
-        emc->conf.macaddr.a[4] = value >> 24;
-        emc->conf.macaddr.a[5] = value >> 16;
         break;
     case REG_MCMDR: {
         uint32_t prev;
-- 
2.38.0.rc1.362.ged0d419d3c-goog

