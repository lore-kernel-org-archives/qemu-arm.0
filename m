Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp44896ejs;
        Mon, 8 Jan 2024 14:29:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzPX+bKmThbYtyIuUKVGYD0WVHxqRAEbqHRwvEqJHYVeDnugqtgSB/4ZH25UdJ5WUltiP1
X-Received: by 2002:a05:6214:1302:b0:67a:96c7:4c90 with SMTP id pn2-20020a056214130200b0067a96c74c90mr5491477qvb.38.1704752962161;
        Mon, 08 Jan 2024 14:29:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704752962; cv=none;
        d=google.com; s=arc-20160816;
        b=W7qnoTFVzHKG5U2nFAeIMJugndTdWsKSy+FbwHu4j9Ge3R4UDitUUcvZNZmkldL0DL
         WRqNiGfqXduf5diJWNzaWol5TjzTxCD6ErPyyGFuglYgjNP4H8hL+TVCQ+CGf0iMsn2j
         Qhuh5U06luM9P8i3oc6Ao1hHiWCV6GWrnuGg4yah1BDjfG9RoT6ZBaxafv/m5388SWrr
         d/eM9cgy2hG/nS4lat+frR+war1aSQtla846rS0TSt0m6pDyEi76t4x/5u/d7uOFmd/b
         5LxmP1r2IjxGJtgC2VbhdOuqoed417kQ9KeNzFZ3nMeWaFtF8Zx2PqB37B04Me2HHJwt
         LdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=tej3cWvS+UWc/eQTZOfAEg9WDZ/VnqiSSVvVLWXewJo=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=JN9MEL0I3NTAyMtmgZyF9eAstKsFdEnyFW5+y+GI47Vio775OFTIoCDNsx18o5D1EV
         hRIJwvPidyBI5OfaWJPTDabfPZTwkT7xjSf6NZJLM0dYWZ7r6zy8STw521kJUIMvpy1y
         mlvmU9+yKjD1tfUzCQfyvI+u0tFy4FVbA4ogCmmbDB4w2uMrj3buHRieVosGcaEqMNAg
         G7Rym8L9aD2/uYsrE0FHb0BRYXokLi8cqyNNTeKVg/m09CeDz5Ip1/j6LUchdtoDarfh
         U8GbViW6hASF7hRAs/BrYcE4TiD3+3KH4GJwhHhP/EsmS02OBA0Y6v8gIsDc41QyTtTy
         eBbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2wQzjgt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sq20-20020a05620a4ad400b00781a46d4c1esi686508qkn.10.2024.01.08.14.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 14:29:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2wQzjgt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMy6N-0006tI-53; Mon, 08 Jan 2024 17:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <383acZQwKCIYxklsro23opkxqyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--nabihestefan.bounces.google.com>)
 id 1rMy6J-0006rc-UG
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 17:28:07 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <383acZQwKCIYxklsro23opkxqyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--nabihestefan.bounces.google.com>)
 id 1rMy6I-00048l-8o
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 17:28:07 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5efe82b835fso38692907b3.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 14:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704752884; x=1705357684; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tej3cWvS+UWc/eQTZOfAEg9WDZ/VnqiSSVvVLWXewJo=;
 b=2wQzjgt8fPXFwJxQhvHiqNpBWEhsZZkb0DDKafXfRgeiyRb+pSns39d+gTDlXaUgM9
 tk0fshMApsQOKR6SllP7ttXeUdzTfrMauUDRrVYydW/YtdoJ7bAjltNfMNwmlgWFCfFJ
 8m6T+m/eNJsymib9tMVaeSH1l12eXfhM+Mm7+pFtdiEnfMfJsnilb3F2Z8MtUi0k9pR4
 z2StibHk8I53HR1gWLNrgtCwwPTwDRh/OdkFusvBFCNH2I0Aa4lz0cUaBsToW7/abmvJ
 MWAieYfIgViEg9hRZr5WvL8hJmOWWCV25rusU6Hne3iycB2Z7UaRZB2+EeKWhIrm1iTA
 zwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704752884; x=1705357684;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tej3cWvS+UWc/eQTZOfAEg9WDZ/VnqiSSVvVLWXewJo=;
 b=tBp1oEibBqXJs6gt9HAMFnM9nr7PZ3IzF9snXMUWj5jB63293fqp2MwOxNxiU6Sf7s
 Cxe/dhCIwMPloadILPEixR6a0wCEuRHuci6/ZIKFc68lS1ZjudyW9VdQVjdhE5v1epgn
 N5DgfYmZA10vvhxdesCV2lNxNmGnS60Ax769qQM9KkqJyLUJdKX2l5YVR1zbXN13uwXB
 psnKnxetEKaAblQkEU1t0gtwRr8fYp0B8rOshQG1fiwWHxFp/+i8U28Ibex1HNgi4B7A
 1yW5Bod4to1af3weCBCSoFwr5gWTXWIetWPGB7wr3Wg5dksjrZQGgeQiEd83kBYUrlSG
 asug==
X-Gm-Message-State: AOJu0YxBokWrxyT9fp0sg6kcHwVXMyDtOjfNHd5bls2ilGZ3UDD47UBB
 ERtcW6b9Y8ONZYc7QY5xPORbu77w7CDOmZFiBHcqcc0Uzg==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:bb0b:0:b0:dbd:4683:21da with SMTP
 id z11-20020a25bb0b000000b00dbd468321damr1799602ybg.8.1704752883996; Mon, 08
 Jan 2024 14:28:03 -0800 (PST)
Date: Mon,  8 Jan 2024 22:27:44 +0000
In-Reply-To: <20240108222747.2453106-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240108222747.2453106-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20240108222747.2453106-8-nabihestefan@google.com>
Subject: [PATCH v10 07/10] include/hw/net: GMAC IRQ Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=383acZQwKCIYxklsro23opkxqyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6Q73P8SkHXxN

From: Nabih Estefan Diaz <nabihestefan@google.com>

Implement Update IRQ Method for GMAC functionality.

Added relevant trace-events

Change-Id: I7a2d3cd3f493278bcd0cf483233c1e05c37488b7
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 hw/net/npcm_gmac.c  | 40 ++++++++++++++++++++++++++++++++++++++++
 hw/net/trace-events |  1 +
 2 files changed, 41 insertions(+)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index 98b3c33c94..44c4ffaff4 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -149,6 +149,46 @@ static bool gmac_can_receive(NetClientState *nc)
     return true;
 }
 
+/*
+ * Function that updates the GMAC IRQ
+ * It find the logical OR of the enabled bits for NIS (if enabled)
+ * It find the logical OR of the enabled bits for AIS (if enabled)
+ */
+static void gmac_update_irq(NPCMGMACState *gmac)
+{
+    /*
+     * Check if the normal interrupts summary is enabled
+     * if so, add the bits for the summary that are enabled
+     */
+    if (gmac->regs[R_NPCM_DMA_INTR_ENA] & gmac->regs[R_NPCM_DMA_STATUS] &
+        (NPCM_DMA_INTR_ENAB_NIE_BITS)) {
+        gmac->regs[R_NPCM_DMA_STATUS] |=  NPCM_DMA_STATUS_NIS;
+    }
+    /*
+     * Check if the abnormal interrupts summary is enabled
+     * if so, add the bits for the summary that are enabled
+     */
+    if (gmac->regs[R_NPCM_DMA_INTR_ENA] & gmac->regs[R_NPCM_DMA_STATUS] &
+        (NPCM_DMA_INTR_ENAB_AIE_BITS)) {
+        gmac->regs[R_NPCM_DMA_STATUS] |=  NPCM_DMA_STATUS_AIS;
+    }
+
+    /* Get the logical OR of both normal and abnormal interrupts */
+    int level = !!((gmac->regs[R_NPCM_DMA_STATUS] &
+                    gmac->regs[R_NPCM_DMA_INTR_ENA] &
+                    NPCM_DMA_STATUS_NIS) |
+                   (gmac->regs[R_NPCM_DMA_STATUS] &
+                   gmac->regs[R_NPCM_DMA_INTR_ENA] &
+                   NPCM_DMA_STATUS_AIS));
+
+    /* Set the IRQ */
+    trace_npcm_gmac_update_irq(DEVICE(gmac)->canonical_path,
+                               gmac->regs[R_NPCM_DMA_STATUS],
+                               gmac->regs[R_NPCM_DMA_INTR_ENA],
+                               level);
+    qemu_set_irq(gmac->irq, level);
+}
+
 static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
 {
     /* Placeholder. Function will be filled in following patches */
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 33514548b8..56057de47f 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -473,6 +473,7 @@ npcm_gmac_reg_write(const char *name, uint64_t offset, uint32_t value) "%s: offs
 npcm_gmac_mdio_access(const char *name, uint8_t is_write, uint8_t pa, uint8_t gr, uint16_t val) "%s: is_write: %" PRIu8 " pa: %" PRIu8 " gr: %" PRIu8 " val: 0x%04" PRIx16
 npcm_gmac_reset(const char *name, uint16_t value) "%s: phy_regs[0][1]: 0x%04" PRIx16
 npcm_gmac_set_link(bool active) "Set link: active=%u"
+npcm_gmac_update_irq(const char *name, uint32_t status, uint32_t intr_en, int level) "%s: Status Reg: 0x%04" PRIX32 " Interrupt Enable Reg: 0x%04" PRIX32 " IRQ Set: %d"
 
 # npcm_pcs.c
 npcm_pcs_reg_read(const char *name, uint16_t indirect_access_baes, uint64_t offset, uint16_t value) "%s: IND: 0x%02" PRIx16 " offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
-- 
2.43.0.472.g3155946c3a-goog

