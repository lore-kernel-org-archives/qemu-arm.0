Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp4905041lfc;
        Wed, 28 Jul 2021 11:18:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRkq93SbBOx4uGZpAoBZfN6foJp1EPzm9dt2kmVJk3CqALN9qNkJYKOJnoaiZV1yugN9xh
X-Received: by 2002:a67:79c8:: with SMTP id u191mr1307099vsc.35.1627496312982;
        Wed, 28 Jul 2021 11:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627496312; cv=none;
        d=google.com; s=arc-20160816;
        b=WDkhf6HQfIwVt1xgDDC1CZm/lv6IPfSvBsMZlk4J25LvzZI2Fh5htWR806Fs3xrWPQ
         12k2Umo/WW1/euqZfq+FWjAGDFztVFi8i94afpsAmD/lRSaR9yI07DRXww6oAm+nuCXf
         FG2S0uSVX/rprnx8YBw1wZk5wC8vdqleH9FysiGP5WQYpK/vyaF1lsHcvBRNffh25tuY
         J1dRQgfWepw0xjC7Z/20edelkqgByHF7EhbRa5SMOy9R9h3K4jG5uI6p0LGXQEPXfaa/
         rN7bIE+6DF8yA+odJKDNWfw4oa1VdQ5l1GxmnhGnd0SsM6ibaBWOb+tKXw7CuCXdZqnj
         ovrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5i0w3FlnQcOgLRKzBoRNyImyhfiPU5ZjX8yICvUvUkE=;
        b=rgejSwTnbSyBo76hdlfOeAyOx7xNM2rHGEqSLPMTU0TeGY4UKwIlr6GT6bwZssHquY
         qpOh5cRHaaZmDo70qSjSqYhpK8GiKpLiv4LTv4O01epw7/+Rtl06v9KqR4Eor8fBiSZ2
         y2u6DFcgjZNxhciGW3Pn4sBv6NVnWOSGIjl0xxvrBbtfLb2vrweyqZ9lkjMaL5kKkuEd
         0MtH8mdbZHKHws/QQMm3Thoku2X1BBo6CY5f+GRr8X817ZKywQwLLkhhg7fHntXszy1O
         Gw3SViEkaKIZ9O71HsKJN1fBmGWqyAVya29ZKfoTYSGniP+0I5lcd9pXQSGqVJYXiK44
         pVvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZaeBtspz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22si332055vsf.46.2021.07.28.11.18.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jul 2021 11:18:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZaeBtspz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m8o8W-0004d6-88
	for alex.bennee@linaro.org; Wed, 28 Jul 2021 14:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8o7r-0002lT-Pi; Wed, 28 Jul 2021 14:17:51 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8o7q-0005NW-2T; Wed, 28 Jul 2021 14:17:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id n12so3695626wrr.2;
 Wed, 28 Jul 2021 11:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5i0w3FlnQcOgLRKzBoRNyImyhfiPU5ZjX8yICvUvUkE=;
 b=ZaeBtspzj6iIdvkpcIjr63oqg+TVdJfpdhoFCRWh65JrCVKct5oRb4r1qmqDSRjvqG
 sjPIq1sALHWcMAnOA3T/Mz0IzJJe3GI48mPUINNBat3jhDH6mdsFYcecNHNNp3aBDBt4
 PTepUbsRoQ5kYLA+4uWfo5aC3scYFgNQVtDbqwzN5fcX2sOcOclqa6uaNTD7W1CnIvZ0
 mG5qOG1GES9NHRpw2pgTe004ERgkB2wv2qRIA0IzkqEFEFV9AK1xJQWjofdHU9kIwQvw
 Yh6II7/pmuW4+e12DiqE3b69rTJBiK8rD5wqhyAykYyT0OXYy/tDSMv9YKXTE/IiFXAh
 mcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5i0w3FlnQcOgLRKzBoRNyImyhfiPU5ZjX8yICvUvUkE=;
 b=EiICWPQ3eXMLcJU6xwbFH0RqQ0PrQbKzHPitcd7XaomfAK4AK+uibmBCQ2HdMfTJJC
 cZhqS2INod+7INy97txdW10SbUKWYvsIvgwjuz8PqJupGIJse/I7lPVAOxlQhnS317i3
 P5A/aPAWLGtESVjug++kj+EeoLSyD1T5Y2GK1FG1hdqps+bqV9hxfCu/9a94xJLLCzmo
 Jn1foZI8qT4dJdhqPsEDyRm2p7r7SADaR2p6GOoTsBn+w4HcVeo7sHg4q0J5sXQbALVo
 mQ0qvrF7UyQ7+dtlyz3N+VcEibGvirWWgAQwlQiY/IXPKWpgp1YZ1h228UY5wgVooYym
 uBLw==
X-Gm-Message-State: AOAM531EvjoJfpAWr8pqxipuSraH7ASYkxFJKL34CYGOVg0TAZyyS+EL
 cZxkgvikQPHuk4eqBEQ7yL6EjuWP6KBp5w==
X-Received: by 2002:adf:d086:: with SMTP id y6mr684960wrh.247.1627496267637;
 Wed, 28 Jul 2021 11:17:47 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 h9sm627332wrw.38.2021.07.28.11.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:17:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 3/3] hw/sd/sdcard: Rename Write Protect Group variables
Date: Wed, 28 Jul 2021 20:17:28 +0200
Message-Id: <20210728181728.2012952-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728181728.2012952-1-f4bug@amsat.org>
References: <20210728181728.2012952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xSKWIqY8bdnt

'wp_groups' holds a bitmap, rename it as 'wp_group_bmap'.
'wpgrps_size' is the bitmap size (in bits), rename it as
'wp_group_bits'.

Patch created mechanically using:

  $ sed -i -e s/wp_groups/wp_group_bmap/ \
           -e s/wpgrps_size/wp_group_bits/ hw/sd/sd.c

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 273af75c1be..75dcd3f7f65 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -116,8 +116,8 @@ struct SDState {
     int32_t state;    /* current card state, one of SDCardStates */
     uint32_t vhs;
     bool wp_switch;
-    unsigned long *wp_groups;
-    int32_t wpgrps_size;
+    unsigned long *wp_group_bmap;
+    int32_t wp_group_bits;
     uint64_t size;
     uint32_t blk_len;
     uint32_t multi_blk_cnt;
@@ -567,10 +567,10 @@ static void sd_reset(DeviceState *dev)
     sd_set_cardstatus(sd);
     sd_set_sdstatus(sd);
 
-    g_free(sd->wp_groups);
+    g_free(sd->wp_group_bmap);
     sd->wp_switch = sd->blk ? !blk_is_writable(sd->blk) : false;
-    sd->wpgrps_size = sect;
-    sd->wp_groups = bitmap_new(sd->wpgrps_size);
+    sd->wp_group_bits = sect;
+    sd->wp_group_bmap = bitmap_new(sd->wp_group_bits);
     memset(sd->function_group, 0, sizeof(sd->function_group));
     sd->erase_start = INVALID_ADDRESS;
     sd->erase_end = INVALID_ADDRESS;
@@ -673,7 +673,7 @@ static const VMStateDescription sd_vmstate = {
         VMSTATE_UINT32(card_status, SDState),
         VMSTATE_PARTIAL_BUFFER(sd_status, SDState, 1),
         VMSTATE_UINT32(vhs, SDState),
-        VMSTATE_BITMAP(wp_groups, SDState, 0, wpgrps_size),
+        VMSTATE_BITMAP(wp_group_bmap, SDState, 0, wp_group_bits),
         VMSTATE_UINT32(blk_len, SDState),
         VMSTATE_UINT32(multi_blk_cnt, SDState),
         VMSTATE_UINT32(erase_start, SDState),
@@ -803,8 +803,8 @@ static void sd_erase(SDState *sd)
         if (sdsc) {
             /* Only SDSC cards support write protect groups */
             wpnum = sd_addr_to_wpnum(erase_addr);
-            assert(wpnum < sd->wpgrps_size);
-            if (test_bit(wpnum, sd->wp_groups)) {
+            assert(wpnum < sd->wp_group_bits);
+            if (test_bit(wpnum, sd->wp_group_bmap)) {
                 sd->card_status |= WP_ERASE_SKIP;
                 continue;
             }
@@ -820,7 +820,7 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
 
     wpnum = sd_addr_to_wpnum(addr);
 
-    for (i = 0; i < 32 && wpnum < sd->wpgrps_size - 1;
+    for (i = 0; i < 32 && wpnum < sd->wp_group_bits - 1;
                 i++, wpnum++, addr += WPGROUP_SIZE) {
         if (addr >= sd->size) {
             /*
@@ -829,7 +829,7 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
              */
             continue;
         }
-        if (test_bit(wpnum, sd->wp_groups)) {
+        if (test_bit(wpnum, sd->wp_group_bmap)) {
             ret |= (1 << i);
         }
     }
@@ -869,7 +869,7 @@ static void sd_function_switch(SDState *sd, uint32_t arg)
 
 static inline bool sd_wp_addr(SDState *sd, uint64_t addr)
 {
-    return test_bit(sd_addr_to_wpnum(addr), sd->wp_groups);
+    return test_bit(sd_addr_to_wpnum(addr), sd->wp_group_bmap);
 }
 
 static void sd_lock_command(SDState *sd)
@@ -897,7 +897,7 @@ static void sd_lock_command(SDState *sd)
             sd->card_status |= LOCK_UNLOCK_FAILED;
             return;
         }
-        bitmap_zero(sd->wp_groups, sd->wpgrps_size);
+        bitmap_zero(sd->wp_group_bmap, sd->wp_group_bits);
         sd->csd[14] &= ~0x10;
         sd->card_status &= ~CARD_IS_LOCKED;
         sd->pwd_len = 0;
@@ -1348,7 +1348,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
             }
 
             sd->state = sd_programming_state;
-            set_bit(sd_addr_to_wpnum(addr), sd->wp_groups);
+            set_bit(sd_addr_to_wpnum(addr), sd->wp_group_bmap);
             /* Bzzzzzzztt .... Operation complete.  */
             sd->state = sd_transfer_state;
             return sd_r1b;
@@ -1370,7 +1370,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
             }
 
             sd->state = sd_programming_state;
-            clear_bit(sd_addr_to_wpnum(addr), sd->wp_groups);
+            clear_bit(sd_addr_to_wpnum(addr), sd->wp_group_bmap);
             /* Bzzzzzzztt .... Operation complete.  */
             sd->state = sd_transfer_state;
             return sd_r1b;
-- 
2.31.1

