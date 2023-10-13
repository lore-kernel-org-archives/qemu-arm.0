Received: by 2002:a05:7022:2383:b0:6d:30c6:dd9e with SMTP id bz3csp1169648dlb;
        Fri, 13 Oct 2023 01:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd0SqBkDIsqcbiZl560a32cdxx8Mp8+Hbv4Uh8l6vMYLfGAK4FAPoZSkuFgxwjcMkt7/aB
X-Received: by 2002:a05:6102:5788:b0:457:6ed7:da93 with SMTP id dh8-20020a056102578800b004576ed7da93mr16792988vsb.19.1697187160335;
        Fri, 13 Oct 2023 01:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697187160; cv=none;
        d=google.com; s=arc-20160816;
        b=LGOw5cSr61vJExZkwZTTAWTvEzYeS5fd8qkBx78V1SegQNm+OAeYhOIfyU36p6X6mT
         APRResFeShx7ZH2v/Y52hCuo8dJ1XMGJaaOuY6lUJ9hJ1C1F6tu2UTzc45kz0U5FGHlv
         oJ6ZjkTzzXH8+KHnuUB2XPbyvd9WNnyKyPAIlhtRnf+N0LD5WW4a4Hh7BS8JfGM5yT8L
         7ru6ufMykqzNxWmgCdPWlY35Ag+OIKRt3jB05Z70m0lfdX/TtlHXWcX83a7AK+b2f0DO
         +pSf24eFIyqSPA+OkCh/RFvcmQEi3gt0HuqwTlpABGCTzGVFPDhueh3viyUPkKXw+FHQ
         E23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EYUOeNNLdvO0RoLiodk1PXET5SEaKx9SVV6ucdM+jZA=;
        fh=DhIIDuGHzuSRtvIWO6SOlKGfPO7MJymmCP6tUCSl7OM=;
        b=pWtAS2nALBFPq/C/HmbQKUrmf4U3/MBq0zLidjSRxBuos9ptLPRKqwNxrC3pASVWoL
         42UwEpr7869UjRcJ4bW5LgZbENYrRUfa+fOAvj/y22fuN++AtcpMxqwOODRjrPLWpJrQ
         sXuo5I0MClEMaNLj2X2S1JjkGzFXUF3mjuh8ZS2nqmM9MlNEw9XG6+iYCRrySYtUbK0E
         AK1Dxq0bFgjK0G2n+OOsHPUK+zhfzVXhT6ph5ooyyWED+ETrh04Po7ElE0CuMKDfszng
         FQVn4apV5iczC6I3neCzb9s3tOv/io4yH6N4mMihsEaOOAcSi4vu6RuCBV+lR8mpPRTf
         7t3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOLvnf+p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a29-20020a0ca99d000000b00656de90313asi862192qvb.539.2023.10.13.01.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:52:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOLvnf+p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrDr0-0002nk-Bd; Fri, 13 Oct 2023 04:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDqm-0001eC-0c
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:48:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDqk-0001Ac-6X
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:48:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32d80ae19f8so1513536f8f.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697186929; x=1697791729; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYUOeNNLdvO0RoLiodk1PXET5SEaKx9SVV6ucdM+jZA=;
 b=HOLvnf+pZmXQzjNeF8DeNBJ9Svf22zsA48V+u5siAQ0b8fErLzJvXpSsU9uq1jFZoe
 ibUo5BaAMmzDp6Gs8ZFTy5HjXLZb0986gDCAmL6CyXH1ubXvnkbecBkx7Xzer92ErqiQ
 8AXSXidthHyS2o+MPTfWij6tQTKmq2C61M68zOXj+Av34p+Qa8uWpXpVHc8i5FNywlfm
 x6pjIlM0eZlESrumBQI7twiJx4Za5sApjStOIn8OpzXbr1BU2j9n6WkcQrvONV6IKeiV
 HC79CTsOihd5ZUXCl5YTZeuTFVvCuwL0gC0+TFnuSjZPZCqc3ZKlwuMkgDc4xEVSX0l3
 P+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697186929; x=1697791729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EYUOeNNLdvO0RoLiodk1PXET5SEaKx9SVV6ucdM+jZA=;
 b=qOmYBIMgg0wHyDuDU+uJ2ZlArMGCRLi8QZjqxrRpRFAZMIWhIXCCvKVdBCvAComA2U
 yWnkR5LsWMLCAxJBkeVXknx/4GwyT184Z/HSYQo2eSjSvBAQ1oS6ShV/LTAhnrIzBNT7
 nhyS67UeqFZrlcJ8TgW/UXPNbu9ndMhhzQyS1e5uFi1oBi3lEVEn3bHuz7CI8BcBnPCh
 fDX90ITW3OilzBtH/4V1Sxw9CLw3qzZRKNc7fgJMhQtscGLK7AA15ng25JCUZHzR9QrA
 8tD1leGtLKpBqxBvh4GkQszYb+ygkTY95CXn8FZhxsiA+rtFAb5kgh5D19TBTdnoJpZe
 Fx/Q==
X-Gm-Message-State: AOJu0Yxo5Y3dsve0LnsE3BsI4eYbAefTCGb128R7+jW+nrhOWxWpeUfp
 kvFmbOI1jQZr5VvVY2G4V+AQbA==
X-Received: by 2002:a05:6000:144a:b0:32d:82f7:e79 with SMTP id
 v10-20020a056000144a00b0032d82f70e79mr8273638wrx.15.1697186928835; 
 Fri, 13 Oct 2023 01:48:48 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d678a000000b0032d9f32b96csm569185wru.62.2023.10.13.01.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:48:48 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq)
Subject: [RFC PATCH v3 57/78] hw/net: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 11:46:25 +0300
Message-Id: <84a6d743b5ff71c323cee718412e2a67084b9237.1697186560.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
References: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: uTV8Gn54q6Up

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/net/cadence_gem.c     | 4 ++--
 hw/net/can/can_sja1000.c | 4 ++--
 hw/net/igb_core.c        | 2 +-
 hw/net/igbvf.c           | 2 +-
 hw/net/imx_fec.c         | 2 +-
 hw/net/net_rx_pkt.c      | 2 +-
 hw/net/pcnet.c           | 2 +-
 hw/net/rtl8139.c         | 6 ++++--
 hw/net/xilinx_ethlite.c  | 2 +-
 9 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index f445d8bb5e..a59991af5b 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -834,10 +834,10 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
                 qemu_log_mask(LOG_UNIMP, "TCP compare offsets"
                               "unimplemented - assuming UDP\n");
                 offset += 8;
-                /* Fallthrough */
+                fallthrough;
             case 2: /* skip the IP header */
                 offset += 20;
-                /* Fallthrough */
+                fallthrough;
             case 1: /* Count from after the ethertype */
                 offset += 14;
                 break;
diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 73201f9139..14052b2700 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -544,7 +544,7 @@ void can_sja_mem_write(CanSJA1000State *s, hwaddr addr, uint64_t val,
             break;
         case 16: /* RX frame information addr16-28. */
             s->status_pel |= (1 << 5); /* Set transmit status. */
-            /* fallthrough */
+            fallthrough;
         case 17 ... 28:
             if (s->mode & 0x01) { /* Reset mode */
                 if (addr < 24) {
@@ -642,7 +642,7 @@ void can_sja_mem_write(CanSJA1000State *s, hwaddr addr, uint64_t val,
             break;
         case 10:
             s->status_bas |= (1 << 5); /* Set transmit status. */
-            /* fallthrough */
+            fallthrough;
         case 11 ... 19:
             if ((s->control & 0x01) == 0) { /* Operation mode */
                 s->tx_buff[addr - 10] = val; /* Store to TX buffer directly. */
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index f6a5e2327b..1117f7cb59 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1419,7 +1419,7 @@ igb_build_rx_metadata_common(IGBCore *core,
             if (!csum_valid) {
                 *status_flags |= E1000_RXDEXT_STATERR_TCPE;
             }
-            /* fall through */
+            fallthrough;
         case ETH_L4_HDR_PROTO_TCP:
             *status_flags |= E1000_RXD_STAT_TCPCS;
             break;
diff --git a/hw/net/igbvf.c b/hw/net/igbvf.c
index d55e1e8a6a..ff68a4f3c5 100644
--- a/hw/net/igbvf.c
+++ b/hw/net/igbvf.c
@@ -188,7 +188,7 @@ static hwaddr vf_to_pf_addr(hwaddr addr, uint16_t vfn, bool write)
         if (write) {
             return HWADDR_MAX;
         }
-        /* fallthrough */
+        fallthrough;
     case 0x34E8: /* PBTWAC */
     case 0x24E8: /* PBRWAC */
         return addr;
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 5d1f1f104c..a7e8b06d48 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -918,7 +918,7 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
                           TYPE_IMX_FEC, __func__);
             return;
         }
-        /* fall through */
+        fallthrough;
     case ENET_TDAR:
         if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
             s->regs[index] = ENET_TDAR_TDAR;
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 32e5f3f9cf..52e2432c9b 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -605,7 +605,7 @@ bool net_rx_pkt_validate_l4_csum(struct NetRxPkt *pkt, bool *csum_valid)
             trace_net_rx_pkt_l4_csum_validate_udp_with_no_checksum();
             return false;
         }
-        /* fall through */
+        fallthrough;
     case ETH_L4_HDR_PROTO_TCP:
         csum = _net_rx_pkt_calc_l4_csum(pkt);
         *csum_valid = ((csum == 0) || (csum == 0xFFFF));
diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index 02828ae716..a32174ef93 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -1502,7 +1502,7 @@ static void pcnet_bcr_writew(PCNetState *s, uint32_t rap, uint32_t val)
 #ifdef PCNET_DEBUG
        printf("BCR_SWS=0x%04x\n", val);
 #endif
-        /* fall through */
+       fallthrough;
     case BCR_LNKST:
     case BCR_LED1:
     case BCR_LED2:
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 4525fda383..42f19618b1 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -2447,8 +2447,10 @@ static uint32_t rtl8139_TxStatus_TxAddr_read(RTL8139State *s, uint32_t regs[],
     }
 
     switch (size) {
-    case 1: /* fall through */
-    case 2: /* fall through */
+    case 1:
+        fallthrough;
+    case 2:
+        fallthrough;
     case 4:
         ret = (regs[reg] >> offset * 8) & (((uint64_t)1 << (size * 8)) - 1);
         DPRINTF("TxStatus/TxAddr[%d] read addr=0x%x size=0x%x val=0x%08x\n",
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 89f4f3b254..5ae4032ec2 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -151,7 +151,7 @@ eth_write(void *opaque, hwaddr addr,
             if (!(value & CTRL_S)) {
                 qemu_flush_queued_packets(qemu_get_queue(s->nic));
             }
-            /* fall through */
+            fallthrough;
         case R_TX_LEN0:
         case R_TX_LEN1:
         case R_TX_GIE0:
-- 
2.39.2

