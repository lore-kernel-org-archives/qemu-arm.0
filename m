Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp678316lfk;
        Fri, 3 Dec 2021 14:16:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2FSHlnRr6OEYOgdQTG66Ejs0WdVG1fU6PuoMZHUUrvJa5oxJxg10MJmagHx1U8gK6AJth
X-Received: by 2002:a67:1dc5:: with SMTP id d188mr4848362vsd.34.1638569784708;
        Fri, 03 Dec 2021 14:16:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638569784; cv=none;
        d=google.com; s=arc-20160816;
        b=auGI9Aq1z+K1yNJw8PHpioam1VwH4JWZ36dzWz8+mlwuz5GW7aRh2OM8/tGAV/4s51
         +DyzqBnNP+tXqEIxVDLqqM2UFw9mRBjKf4P1MhrR67PBB3xxZLrMIuDPCecPnIxRW1lW
         67j0Wfo39SnA2APqqhuicYyvWj3AZHdCuPVldFWBWTOKzLu7al94Z/62iKcI+meB6bSA
         JcfEektgnC6WaOzkx1C4635MMm4k1hK+byIUOZeT27CP2m/R9yKL7U4N4MapVoJ2mBiD
         11dai4R8il5PZWXigKysyDDMfNkCaJdfTtMTVTTo8hp7cJQ5SvT9+jxWdazIZLRFVYHm
         MsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=DptKPBtVqulkRZwb4bxvQuevNljfMMf/j/w293um1mM=;
        b=ku0B8OgOEp+7DQ84qcDZfu6jesl3Y+/oM4ddazziNfVuIVW/91b/4P6XuIoXrgVkmo
         P29sn0Sl0DEjJLB/tv3/qy3y1ZmtnNGEWC1jJWFXjVODL9ZuLSOJLqEh1J8/jLF7IKvW
         OB0aBLfYnpQtQIJ4Kd3QgdoObZUfGVOdXeQvRSu1ixmPnoQ7l/bPgrQfoZgQnOqioA2p
         35wlICCkP+Dy7qUbT3xJPeaHV/Mc5Qga7zHwOP/yr5hEurkLq5tTKuupQZeRNV26TQ9I
         rwzgboKAmZs93GwfvrjNqrjBg/GFvek8P19on66Z7t3eyRpyFZysuOlp37mJgDjSsc5S
         FnDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PnQ9CBH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2si3715104vsl.752.2021.12.03.14.16.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Dec 2021 14:16:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PnQ9CBH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:40612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mtGqu-0006qK-49
	for alex.bennee@linaro.org; Fri, 03 Dec 2021 17:16:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wZWqYQcKCKofOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1mtGqe-0006pz-IN
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 17:16:08 -0500
Received: from [2607:f8b0:4864:20::c49] (port=47852
 helo=mail-oo1-xc49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wZWqYQcKCKofOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1mtGqQ-0003yf-4V
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 17:16:07 -0500
Received: by mail-oo1-xc49.google.com with SMTP id
 y123-20020a4a4581000000b002c282d3ab49so3272026ooa.14
 for <qemu-arm@nongnu.org>; Fri, 03 Dec 2021 14:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=DptKPBtVqulkRZwb4bxvQuevNljfMMf/j/w293um1mM=;
 b=PnQ9CBH+4dRC6T58i0FF2tAOVJVR9mjl5b1wvXU68ZFgFoMxAlb9glW9BNKxrRwFiB
 iUMtVJv8YDO+nXz4Hs9655gwiX5whn5hdNQdVePsaXaZNGR7MDRgjaYn09jL52sGRT64
 opXGamPG+JSxE3z+RB+tbIZMcLaILeLqTE3H6eYjm0lEdsIyavvZczfTDBUWMfkUZXoh
 hpd1CovuXupBRb61ig78XoFF968uqhN0HiM6vHAwVrfpJHdWHZ+iEW8K8WKtuh39kPbn
 /hsKq0yXbPymkZS+6xZyVhhZfGamhQpXo/CzwRFf7RZM/1Y7xmXzEu8IMXyuMAtlfedQ
 Wk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=DptKPBtVqulkRZwb4bxvQuevNljfMMf/j/w293um1mM=;
 b=Un0IvQbcoA1KDm8agU2CSi5ivjTJZcDedbzvffYuuaCe9lDUqELIzQ1J0F10S4r9IW
 YDQrp5jrG20pDN87WBIvE4Y3+r0vru8nHQpwVoiXZbAEdSj2wdWhvEc/ykqvWUBZwnad
 S297MFWKtBLIINNq9DuSUb6qUUErTuI6h3oyNQBBuboEhHA5oJfReuoJbW+DjzcsWtMN
 PCdqa/H4a4VG9KfByEMZsZCki3coLCv9tegfDOkz4ojv48B/i/EuxWsUWNCukfWsbWjF
 hL7m+7wpUBmaEfHvTHRee+cHcFW0iFsO4qpDgXMhr2mnGY2+4BdqwPX9IbOGdYbw0t61
 6DAQ==
X-Gm-Message-State: AOAM530v2T9OQwQ0hPETmZVPiDYYxRKG+nhrg6aCeH6PTuJK6sXiiB9B
 0EMBdCUApobx0eyZpGFUThXtZ5m6tC5n
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:7a5a:6b8a:761a:5dd9])
 (user=venture job=sendgmr) by 2002:a17:90b:17cf:: with SMTP id
 me15mr17228792pjb.125.1638569409918; Fri, 03 Dec 2021 14:10:09 -0800 (PST)
Date: Fri,  3 Dec 2021 14:10:02 -0800
Message-Id: <20211203221002.1719306-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
Subject: [PATCH v2] hw/net: npcm7xx_emc fix missing queue_flush
From: Patrick Venture <venture@google.com>
To: f4bug@amsat.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, hskinnemoen@google.com, 
 kfting@nuvoton.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c49;
 envelope-from=3wZWqYQcKCKofOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com;
 helo=mail-oo1-xc49.google.com
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
X-TUID: IU0O8CryWajL

The rx_active boolean change to true should always trigger a try_read
call that flushes the queue.

Signed-off-by: Patrick Venture <venture@google.com>
---
v2: introduced helper method to encapsulate rx activation and queue flush.
---
 hw/net/npcm7xx_emc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 7c892f820f..545b2b7410 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -284,6 +284,12 @@ static void emc_halt_rx(NPCM7xxEMCState *emc, uint32_t mista_flag)
     emc_set_mista(emc, mista_flag);
 }
 
+static void emc_enable_rx_and_flush(NPCM7xxEMCState *emc)
+{
+    emc->rx_active = true;
+    qemu_flush_queued_packets(qemu_get_queue(emc->nic));
+}
+
 static void emc_set_next_tx_descriptor(NPCM7xxEMCState *emc,
                                        const NPCM7xxEMCTxDesc *tx_desc,
                                        uint32_t desc_addr)
@@ -581,13 +587,6 @@ static ssize_t emc_receive(NetClientState *nc, const uint8_t *buf, size_t len1)
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
@@ -703,7 +702,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
             emc->regs[REG_MGSTA] |= REG_MGSTA_RXHA;
         }
         if (value & REG_MCMDR_RXON) {
-            emc->rx_active = true;
+            emc_enable_rx_and_flush(emc);
         } else {
             emc_halt_rx(emc, 0);
         }
@@ -739,8 +738,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
         break;
     case REG_RSDR:
         if (emc->regs[REG_MCMDR] & REG_MCMDR_RXON) {
-            emc->rx_active = true;
-            emc_try_receive_next_packet(emc);
+            emc_enable_rx_and_flush(emc);
         }
         break;
     case REG_MIIDA:
-- 
2.34.1.400.ga245620fadb-goog

