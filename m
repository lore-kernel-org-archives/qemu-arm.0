Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3455792ejb;
        Mon, 19 Dec 2022 04:57:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7s6WyyCAQhcvjvzYngNbeX+J/D8IxORsSlE7pp6R3lGRsJHVKlJAio41MAX6b1UMu2HDPz
X-Received: by 2002:ac8:6bc9:0:b0:3a7:f46b:7a82 with SMTP id b9-20020ac86bc9000000b003a7f46b7a82mr53996201qtt.21.1671454672707;
        Mon, 19 Dec 2022 04:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671454672; cv=none;
        d=google.com; s=arc-20160816;
        b=rEpHqSHLExhAIVCvq2lCHPTvxiH1IQxBFcDJSctgez8KzXtrzRFyhFGc3ph3Jdn+mK
         It5Ab3QOWQTciG3VlB2z9d6a2dZArz0i5qdk9yUEZ1B/QFq086vOyRZavBnWFujr8OQ9
         hm3P7hi8Si7pgEva1IgQDkfTdRCrz/1CBfcUX2N+Kp2sBGPgkYcLXT9b6VA8FcavxqQL
         uX3of9hNCA3OmR0qLaam3+wvWDHHpkP0P9nG1IlZiV0aLUH1pIVKeYT3df8z90oyEqbF
         O+msT7b6IC2HD0tmOGyR7ClupHxJwie6WCjEMMjEFaz5DBIf0FCg/dQhbDlaZtiqfQoR
         YRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=yTpaUx1+vDyWi6zSx2mxz5JAauTiU5OQgCyk8kTsRLM=;
        b=gM5KEZjTTjf/muzqMiYN/E6+VEIbj/xtG1wS4BQeRDTiLwXKX+XjIqGNP0YeuqcmW2
         NggE7GmfFJLEMob/tYdCHnBIejdWsBSRklgAjNubmC3VPho9fKcZ90yiPc9Tt0OAz6tZ
         bz3LMQp131ege32U+KpmxfZWwH+g/ft6/f7oj9hJeceDLVKEmtmE+PtBxEe7GH7iHTUF
         9jAGdtyY5tvGjvK7E9ZjDzNshyuzgDgRCOIY+10QDzsgLud7ypvkSjgYXW5gHnWLrzlC
         /YkeubE+xZsdezx95b8BjxFYPk3rKybjkX1zq0XkgZJxb+pm0UYYq/qFVvMgAb56vRZz
         Cu/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jMOEPIrw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u28-20020a37ab1c000000b006e2c12e0307si3986677qke.358.2022.12.19.04.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 04:57:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jMOEPIrw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7Fhy-0000uC-PH; Mon, 19 Dec 2022 07:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3sl-gYwgKCBcF9BFGx2x3BB381.zB9D19H-xE9ABA3AH.BE3@flex--smostafa.bounces.google.com>)
 id 1p7Fhw-0000ta-Uf
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 07:57:28 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3sl-gYwgKCBcF9BFGx2x3BB381.zB9D19H-xE9ABA3AH.BE3@flex--smostafa.bounces.google.com>)
 id 1p7Fhv-0005z4-4v
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 07:57:28 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 o5-20020a05600c510500b003cfca1a327fso5117317wms.8
 for <qemu-arm@nongnu.org>; Mon, 19 Dec 2022 04:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yTpaUx1+vDyWi6zSx2mxz5JAauTiU5OQgCyk8kTsRLM=;
 b=jMOEPIrwqPdA/yjJUJbD4wg0iA1S+bdNeUwEu2tq1tvRwe/SP3EkC9+1IXXDQSlq9e
 yFplkkkc2nxTR5z/TIFvAM5XKjnSL9+kxtwPn1KLWmTw2w0vWuMvIrXpB1p9edDLeveE
 wdhMROYvDkwPXHrSi+pD/EQyhqvWS/1u6khRGf1j/eGpuOYB2zXJBGGQjIhf4Wv7pVrP
 sspSC6FUXM6C1C3K5crXHPcP+V03LEVxLAcpIIg7NY6btDT3VhuuVyI5T1rH6Kl/Oigc
 SaQ7x+fN33FxXwIazCcbGw2I+sfPOhNQBqOI4dIAo8BkMN/sZDxycdTABC+pKzfhiTn6
 FCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yTpaUx1+vDyWi6zSx2mxz5JAauTiU5OQgCyk8kTsRLM=;
 b=Ju1oAqHrgJ8gItEohGgLMT+zgl2FG4ghRGKBr+1+XttoVajQckjyLV5Mi8p/103dVi
 8cIurG4TkLplmNND9c5OsNkfxOkYAdTmub5BBVvCl9y7CppwiFTWInAe2FHlEHANO14W
 UGju1M+ISPUaQjrTfe/7OgtOr9nT5AxLiOv+9Ft7loldAfSPW9amhf+D4UHfs7Cab2UC
 LeEOBsj7qAJcZOlIGXzGIAreUFOEKVJWsKiN55OiPZ0Q7puWI7QarVLsgoYSKPn8DdlH
 Mr2703FAZ5tSbhghCrIFwJnoZiyJCSPdpukzEtBmmqJ8T3s7w2dAbL8DImutYaXtnx0O
 jMOw==
X-Gm-Message-State: AFqh2kq49mQxJOM61WLZAEDt5kZChyrSbK+sKH0wH1p2LkihLw2fN1Em
 nr2jpj8TBxYZZMOpPS8oAbMz52YzjfGWZg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:5567:b0:3d0:6b97:7968 with SMTP
 id ja7-20020a05600c556700b003d06b977968mr658356wmb.25.1671454642495; Mon, 19
 Dec 2022 04:57:22 -0800 (PST)
Date: Mon, 19 Dec 2022 12:57:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221219125720.1369027-1-smostafa@google.com>
Subject: [PATCH] hw/arm/smmuv3: Add GBPA register
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3sl-gYwgKCBcF9BFGx2x3BB381.zB9D19H-xE9ABA3AH.BE3@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: ryIBu8WIsA02

GBPA register can be used to globally abort all
transactions.

Only UPDATE and ABORT bits are considered in this patch.

It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
be zero(Do not abort incoming transactions).

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h |  4 ++++
 hw/arm/smmuv3.c          | 14 ++++++++++++++
 include/hw/arm/smmuv3.h  |  1 +
 3 files changed, 19 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index bce161870f..71f70141e8 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -79,6 +79,10 @@ REG32(CR0ACK,              0x24)
 REG32(CR1,                 0x28)
 REG32(CR2,                 0x2c)
 REG32(STATUSR,             0x40)
+REG32(GBPA,                0x44)
+    FIELD(GBPA, ABORT,        20, 1)
+    FIELD(GBPA, UPDATE,       31, 1)
+
 REG32(IRQ_CTRL,            0x50)
     FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
     FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 955b89c8d5..2843bc3da9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -285,6 +285,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->gerror = 0;
     s->gerrorn = 0;
     s->statusr = 0;
+    s->gbpa = 0;
 }
 
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
@@ -663,6 +664,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto epilogue;
     }
 
+    if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
+        status = SMMU_TRANS_ABORT;
+        goto epilogue;
+    }
+
     cfg = smmuv3_get_config(sdev, &event);
     if (!cfg) {
         status = SMMU_TRANS_ERROR;
@@ -1170,6 +1176,10 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
     case A_GERROR_IRQ_CFG2:
         s->gerror_irq_cfg2 = data;
         return MEMTX_OK;
+    case A_GBPA:
+        /* Ignore update bit as write is synchronous. */
+        s->gbpa = data & ~R_GBPA_UPDATE_MASK;
+        return MEMTX_OK;
     case A_STRTAB_BASE: /* 64b */
         s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
         return MEMTX_OK;
@@ -1318,6 +1328,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
     case A_STATUSR:
         *data = s->statusr;
         return MEMTX_OK;
+    case A_GBPA:
+        *data = s->gbpa;
+        return MEMTX_OK;
     case A_IRQ_CTRL:
     case A_IRQ_CTRL_ACK:
         *data = s->irq_ctrl;
@@ -1495,6 +1508,7 @@ static const VMStateDescription vmstate_smmuv3 = {
         VMSTATE_UINT32_ARRAY(cr, SMMUv3State, 3),
         VMSTATE_UINT32(cr0ack, SMMUv3State),
         VMSTATE_UINT32(statusr, SMMUv3State),
+        VMSTATE_UINT32(gbpa, SMMUv3State),
         VMSTATE_UINT32(irq_ctrl, SMMUv3State),
         VMSTATE_UINT32(gerror, SMMUv3State),
         VMSTATE_UINT32(gerrorn, SMMUv3State),
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index f1921fdf9e..9899fa1860 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -46,6 +46,7 @@ struct SMMUv3State {
     uint32_t cr[3];
     uint32_t cr0ack;
     uint32_t statusr;
+    uint32_t gbpa;
     uint32_t irq_ctrl;
     uint32_t gerror;
     uint32_t gerrorn;
-- 
2.39.0.314.g84b9a713c41-goog

