Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp646047lfk;
        Fri, 3 Dec 2021 13:32:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCeYKKWuNcGBEO+LvrZyVLirY56p6y9yu27dNGXbnI+gGMkaal/Z1lvqHt8rzvP/ns9fvq
X-Received: by 2002:a25:cb42:: with SMTP id b63mr4394381ybg.231.1638567178418;
        Fri, 03 Dec 2021 13:32:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638567178; cv=none;
        d=google.com; s=arc-20160816;
        b=sSdaM28FvOzNWYqQtTL9OlPa8//gkyxzoT4UojBqctiKnu2Vrfbv9DZeCYL6UsfZwO
         +TiQmCkHPEQgDQAAY5buml+VRfUtkaSbVOndKZvfc63j/24nsVXX+TekDtn/jocMNWQN
         fih8SZpAmJ8MoK7cehsCigLYbvFTiwSdoWTFOX7BtSTCz2k6Mpa7xQdDL8sFbanw99Rs
         qOj9l5AdcJYpLfFDfZ8gHK9ixNpPm5AwcczZgQdBJkz3V7rRT9IkmVG+DAlUGHnsVWEl
         lGAz0yCaY/59s9+TpjzDSCZD7De37vXoIRrL8qc0x6c35gxw/vkZQIf9vpZDPwyo/dYc
         8MjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=kDkgNdL4NfNYupV3ZzxBLZNlPS6gY+g/aREor8CAFlw=;
        b=cle0tSp2HMbfesY9nSH85jqnZ7v3X1Z3FP3eXvJNwn7tq4QjR3Bw1V97iLzpG77JNt
         o02gQPF232OCmRTCGeYlkRytnwwIVqzz4BZNzcC/NHH93cxdGB0/mVULpMANY2zA7eRz
         RnyyJ0iG83Edg3KX1YlTUQzqP03cEKC46FbLdt7JcCzhU+Vjq2E3HolIIu3Ei4CyrYE1
         u6eOQrMMPwrWuHJlx4IKRsZ1Ct9u5j8LXgQjvLXg12Ho6tAeLaymSueLvasFpHNvQYUH
         Zoq2337+aMgsKLKc+1Z1Cv2/eAmNtQ4maRpggdZaUgEsdbMwRfxHyHQ+MR94x6NnASZh
         X8kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=tUu7pokn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j65si5781066ybj.211.2021.12.03.13.32.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Dec 2021 13:32:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=tUu7pokn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mtGAr-0006gP-RN
	for alex.bennee@linaro.org; Fri, 03 Dec 2021 16:32:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vYuqYQcKCJIH09FGD02AA270.yA8C08G-wD89A929G.AD2@flex--venture.bounces.google.com>)
 id 1mtGAd-0006eo-Sm
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 16:32:45 -0500
Received: from [2607:f8b0:4864:20::349] (port=53014
 helo=mail-ot1-x349.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vYuqYQcKCJIH09FGD02AA270.yA8C08G-wD89A929G.AD2@flex--venture.bounces.google.com>)
 id 1mtGAc-0003hb-B0
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 16:32:43 -0500
Received: by mail-ot1-x349.google.com with SMTP id
 t17-20020a0568301e3100b0055c78bc02a2so1976783otr.19
 for <qemu-arm@nongnu.org>; Fri, 03 Dec 2021 13:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=kDkgNdL4NfNYupV3ZzxBLZNlPS6gY+g/aREor8CAFlw=;
 b=tUu7poknx/lnk+nK7SbkSn+IoXQRi1T2tvTQSk79H/FlutqcKPNGVKfspjXWxgFMJo
 Iw31u4hMkYnqznkB8uzTHwd+YyPZDWu2zwKJ77AoJkwu9nFp4PbOa1ABoSvpZ98fHgsy
 qAz9zf8p7Nwoqwg0/FsvIuTvf8pSUUKC8w0QKWwiWU3AXaeE7sNSsJ6mYcdzu4wtFdzc
 ujyAQWt7Nqjdkvb1qlyNnXRKJAFMzdIAcfLzFkh3RuKz+LlSWtQWHADQKHpn+8KLYi2A
 r7H5HUKTPToy0PMnnW8c+66WHpvt28xrncu+G7FxIbfvBL/TfBGLZ6zj3YKZkU7lDnEs
 3xjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=kDkgNdL4NfNYupV3ZzxBLZNlPS6gY+g/aREor8CAFlw=;
 b=d6hLyUGe/ZeYwE8KJTCDHHWyG9Pan5PPP/ds1B4OpX/mkk054CSZUiUKOTejjaREr5
 MQaNvfJeVv2PyluDbkf80QDp3cDtytBNBy2MuEYf4I6doyw6xVb/seB91xhxTD7XCYJP
 YTbIutqpnqDoe3o8nR6GkIRC1o5nyhGZ7R242WIX/WGPElMolVjsL39qjFYmPJ3wpqww
 2CYUOdU4//A2ya13hOQXHDJM9TczRIuzqPq/3VMOygjSDHxeMQdKCExbOZG7bZNCvf+G
 GiJQPef6CjYh6v84vORt3+Py7wgRXahPC0tdFRn3l36ewb1fBUuct/qeIMf898IuKE4Q
 OXuw==
X-Gm-Message-State: AOAM532iQc3jAyawvNwGVqu4gmr4nWS0tMZhPuI0zTpcVGU/zBf3qf4X
 cvQLTaAqfWP+XAGBgRR13o7h7AOSbT7J
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:7a5a:6b8a:761a:5dd9])
 (user=venture job=sendgmr) by 2002:a25:e090:: with SMTP id
 x138mr24159503ybg.501.1638566845470; Fri, 03 Dec 2021 13:27:25 -0800 (PST)
Date: Fri,  3 Dec 2021 13:27:14 -0800
Message-Id: <20211203212714.1714362-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
Subject: [PATCH] hw/net: npcm7xx_emc fix missing queue_flush
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, hskinnemoen@google.com, 
 kfting@nuvoton.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::349
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::349;
 envelope-from=3vYuqYQcKCJIH09FGD02AA270.yA8C08G-wD89A929G.AD2@flex--venture.bounces.google.com;
 helo=mail-ot1-x349.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: zb9uiwZ77HDc

The rx_active boolean change to true should always trigger a try_read
call that flushes the queue.

Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/net/npcm7xx_emc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 7c892f820f..97522e6388 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -581,13 +581,6 @@ static ssize_t emc_receive(NetClientState *nc, const uint8_t *buf, size_t len1)
     return len;
 }
 
-static void emc_try_receive_next_packet(NPCM7xxEMCState *emc)
-{
-    if (emc_can_receive(qemu_get_queue(emc->nic))) {
-        qemu_flush_queued_packets(qemu_get_queue(emc->nic));
-    }
-}
-
 static uint64_t npcm7xx_emc_read(void *opaque, hwaddr offset, unsigned size)
 {
     NPCM7xxEMCState *emc = opaque;
@@ -704,6 +697,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
         }
         if (value & REG_MCMDR_RXON) {
             emc->rx_active = true;
+            qemu_flush_queued_packets(qemu_get_queue(emc->nic));
         } else {
             emc_halt_rx(emc, 0);
         }
@@ -740,7 +734,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
     case REG_RSDR:
         if (emc->regs[REG_MCMDR] & REG_MCMDR_RXON) {
             emc->rx_active = true;
-            emc_try_receive_next_packet(emc);
+            qemu_flush_queued_packets(qemu_get_queue(emc->nic));
         }
         break;
     case REG_MIIDA:
-- 
2.34.1.400.ga245620fadb-goog

