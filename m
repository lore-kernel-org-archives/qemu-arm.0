Received: by 2002:a17:906:b794:b0:9b6:5cec:e61e with SMTP id dt20csp20685ejb;
        Wed, 18 Oct 2023 11:14:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExFW6JQbrbTIHWH72dIw50TrldiRpfr4A4oUd4uqCS/Vl/xpamF7N46kXis3yxmKta8NQD
X-Received: by 2002:ad4:4ea9:0:b0:66d:6311:f91f with SMTP id ed9-20020ad44ea9000000b0066d6311f91fmr25536qvb.45.1697652878402;
        Wed, 18 Oct 2023 11:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697652878; cv=none;
        d=google.com; s=arc-20160816;
        b=SdujjzD2AHtph33S4lAVK/Slx7UXYYYACWsikYjM1kYpBKoxVyz2heiPWb/jZcxMyu
         2bn3kZKheFjf/omJN28M8bxu7+c4VqX7XlaMmNyhm3soYNwZuvmprtqzKgzRGy7VDKs5
         uBsp03jZL2ZSuY3A55Zz2S81ab5cue4PIxbPtYTqDVGNnE6fDuzepdsZ1LmP2RceqfMz
         eCXa5TU7/XAEsAISq3HJry578zQIRoV/h/27QvjeABKJJHmQEwiWS7k2NcFnD+T6Eaqh
         DPKDVSc+6/l6lTSPmqgcp6AlRKvOnKzleF1IHQwsw3YoR+XM/9QSwDUU+uE8k8gnrrzv
         CHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=91WhEPxiGWHEutI8OwgUgFSNTWB+7FPKM8cUC/rSni8=;
        fh=8TcdNm2PUOSTOLTAPwKw1HRZgze8qTDV0WK6iGCckjQ=;
        b=LfNHcTVWUsQzoiirWYUAcuAXsO7yKmSARySJh/j+t/4V7lIX5/ol3tTWEGjwhSiVxy
         dEa6TmCbom/b/7hImC5XnFvlfG76qXktBOKEqKpfQCq23hCqlkWmppph2bwjkxfYYFRv
         pe4p2j5VRn/j7OKUegAF36lytaLk3YMjzlgsFfzSxksiJFhOG7BjpH3hklpSz3G8EpvG
         EirJuBbGGFiIbp5XOVxmKmOG3EW4ySi2XUZhtTLOVlbYACp5bCL2yISI1cUSDGlaSdUR
         cZxSj36vbt9iGuIW72jFxgcf/Sh7nFr3s7PMtAyp/GTvxn/JzZ7rYnHms9q0P0Dzi1Zl
         PSzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=hMIfqUuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19-20020ac85e53000000b004181244b348si314217qtx.432.2023.10.18.11.14.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:14:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=hMIfqUuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtB1i-0006dp-OR; Wed, 18 Oct 2023 14:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-B8wZQwKCCkSFGNMJXYJKFSLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--nabihestefan.bounces.google.com>)
 id 1qtB1g-0006aa-Tq
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:12:12 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-B8wZQwKCCkSFGNMJXYJKFSLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--nabihestefan.bounces.google.com>)
 id 1qtB1e-0008BU-QJ
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:12:12 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5a824ef7a83so83762087b3.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697652729; x=1698257529; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=91WhEPxiGWHEutI8OwgUgFSNTWB+7FPKM8cUC/rSni8=;
 b=hMIfqUuk7EUN5PSe2S75c4gWd5UPfNMbwMuNQn4XQaVAHz77rO8FC7vtLkU9zqGZcb
 6jT6kGyKW1GbpKp6IUNApIEM/wpSrXk06TigTUC9Y/jdrQE4S+lF5iVqhX42mcT0u2xJ
 ZYZ+cyIdkQSedNwlmqVLeO6xfbdVmBIukijC/1kTWIDi8mnCiEC60/uHGZhMt5omBRFH
 B8QQZaQgjJmUwrPLEx3K7soS12V7oBPreDvDi8Sre8sloDE5MsRN2/hm+mJ5cu8dbIpg
 y86SFB3s5y3qAD3Um1WJnwCW24/cKgSzN1d+pzc8JiJZXWQ5yyuQMzAkHgPPrSCaF/2C
 r17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697652729; x=1698257529;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=91WhEPxiGWHEutI8OwgUgFSNTWB+7FPKM8cUC/rSni8=;
 b=p+AH4FgY8FS4f2YsfH1dGoz29lJsEb+7xB0emijvkQXw1ohzJ2WcAESPJPMi0QNMDn
 ZyzLaZXDpBqAGaaOiZt7oSA9ZhfvB7sy1IXuEftZZREv3BcUQ0LlON7zkjlq6UtYwybi
 cnvFkKWuSCUrgeD66Y5S/L2lszyTCdfq2eKKc96C3RWg+BaXrUNnGqrh9fH1aztaaTjU
 RVDiWzw8KA7xuFvTHjB8hVMr0fP5dH1wSZX/0Macrz4RHasBx6r5pviZGYk7AF2sCVy7
 OZcRqy47fHIzr65KhdITWk6Q/p/TkXfz25Isuf8eSAXoe5rA7lQcisqBk2dh8rxvlNDQ
 0arw==
X-Gm-Message-State: AOJu0YzBM9knntTmro8Cyp/LXYziN4C4k+fDBsrgFgD3jI6H23r5di7K
 xT5pvkzkAthwNZu7bu+vUXpUuwC91Pf6PO58EOM=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:480d:0:b0:5a8:d81f:f5e7 with SMTP
 id v13-20020a81480d000000b005a8d81ff5e7mr669ywa.8.1697652728843; Wed, 18 Oct
 2023 11:12:08 -0700 (PDT)
Date: Wed, 18 Oct 2023 18:11:49 +0000
In-Reply-To: <20231018181152.745496-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231018181152.745496-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231018181152.745496-9-nabihestefan@google.com>
Subject: [PATCH 08/11] hw/net: General GMAC Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3-B8wZQwKCCkSFGNMJXYJKFSLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: neJdf9HQ3azG

From: Nabih Estefan Diaz <nabihestefan@google.com>

- General GMAC Register handling
- GMAC IRQ Handling
- Added traces in some methods for debugging
- Lots of declarations for accessing information on GMAC Descriptors (npcm_gmac.h file)

NOTE: With code on this state, the GMAC can boot-up properly and will show up in the ifconfig command on the BMC

Signed-off-by: Nabih Estefan Diaz <nabihestefan@google.com>
---
 hw/net/npcm_gmac.c         |  26 -----
 include/hw/net/npcm_gmac.h | 198 ++++++++++++++++++++++++++++++++++---
 2 files changed, 184 insertions(+), 40 deletions(-)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index 6f8109e0ee..220955346c 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -305,22 +305,6 @@ static void npcm_gmac_write(void *opaque, hwaddr offset,
         break;
 
     case A_NPCM_GMAC_MAC_CONFIG:
-        prev = gmac->regs[offset / sizeof(uint32_t)];
-        gmac->regs[offset / sizeof(uint32_t)] = v;
-
-        /* If transmit is being enabled for first time, update desc addr */
-        if (~(prev & NPCM_GMAC_MAC_CONFIG_TX_EN) &
-             (v & NPCM_GMAC_MAC_CONFIG_TX_EN)) {
-            gmac->regs[R_NPCM_DMA_HOST_TX_DESC] =
-                gmac->regs[R_NPCM_DMA_TX_BASE_ADDR];
-        }
-
-        /* If receive is being enabled for first time, update desc addr */
-        if (~(prev & NPCM_GMAC_MAC_CONFIG_RX_EN) &
-             (v & NPCM_GMAC_MAC_CONFIG_RX_EN)) {
-            gmac->regs[R_NPCM_DMA_HOST_RX_DESC] =
-                gmac->regs[R_NPCM_DMA_RX_BASE_ADDR];
-        }
         break;
 
     case A_NPCM_GMAC_MII_ADDR:
@@ -371,16 +355,6 @@ static void npcm_gmac_write(void *opaque, hwaddr offset,
                           "%s: Write of read-only bits of reg: offset: 0x%04"
                            HWADDR_PRIx ", value: 0x%04" PRIx64 "\n",
                            DEVICE(gmac)->canonical_path, offset, v);
-        } else {
-            /* for W1c bits, implement W1C */
-            gmac->regs[offset / sizeof(uint32_t)] &=
-                ~NPCM_DMA_STATUS_W1C_MASK(v);
-            if (v & NPCM_DMA_STATUS_NIS_BITS) {
-                gmac->regs[offset / sizeof(uint32_t)] &= ~NPCM_DMA_STATUS_NIS;
-            }
-            if (v & NPCM_DMA_STATUS_AIS_BITS) {
-                gmac->regs[offset / sizeof(uint32_t)] &= ~NPCM_DMA_STATUS_AIS;
-            }
         }
         break;
 
diff --git a/include/hw/net/npcm_gmac.h b/include/hw/net/npcm_gmac.h
index e5729e83ea..c97eb6fe6e 100644
--- a/include/hw/net/npcm_gmac.h
+++ b/include/hw/net/npcm_gmac.h
@@ -34,13 +34,15 @@ struct NPCMGMACRxDesc {
 };
 
 /* NPCMGMACRxDesc.flags values */
-/* RDES2 and RDES3 are buffer address pointers */
-/* Owner: 0 = software, 1 = gmac */
-#define RX_DESC_RDES0_OWNER_MASK BIT(31)
+/* RDES2 and RDES3 are buffer addresses */
+/* Owner: 0 = software, 1 = dma */
+#define RX_DESC_RDES0_OWN BIT(31)
 /* Destination Address Filter Fail */
-#define RX_DESC_RDES0_DEST_ADDR_FILT_FAIL_MASK BIT(30)
-/* Frame length*/
-#define RX_DESC_RDES0_FRAME_LEN_MASK(word) extract32(word, 16, 29)
+#define RX_DESC_RDES0_DEST_ADDR_FILT_FAIL BIT(30)
+/* Frame length */
+#define RX_DESC_RDES0_FRAME_LEN_MASK(word) extract32(word, 16, 14)
+/* Frame length Shift*/
+#define RX_DESC_RDES0_FRAME_LEN_SHIFT 16
 /* Error Summary */
 #define RX_DESC_RDES0_ERR_SUMM_MASK BIT(15)
 /* Descriptor Error */
@@ -83,9 +85,9 @@ struct NPCMGMACRxDesc {
 /* Receive Buffer 2 Size */
 #define RX_DESC_RDES1_BFFR2_SZ_SHIFT 11
 #define RX_DESC_RDES1_BFFR2_SZ_MASK(word) extract32(word, \
-    RX_DESC_RDES1_BFFR2_SZ_SHIFT, 10 + RX_DESC_RDES1_BFFR2_SZ_SHIFT)
+    RX_DESC_RDES1_BFFR2_SZ_SHIFT, 11)
 /* Receive Buffer 1 Size */
-#define RX_DESC_RDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 10)
+#define RX_DESC_RDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 11)
 
 
 struct NPCMGMACTxDesc {
@@ -96,9 +98,9 @@ struct NPCMGMACTxDesc {
 };
 
 /* NPCMGMACTxDesc.flags values */
-/* TDES2 and TDES3 are buffer address pointers */
+/* TDES2 and TDES3 are buffer addresses */
 /* Owner: 0 = software, 1 = gmac */
-#define TX_DESC_TDES0_OWNER_MASK BIT(31)
+#define TX_DESC_TDES0_OWN BIT(31)
 /* Tx Time Stamp Status */
 #define TX_DESC_TDES0_TTSS_MASK BIT(17)
 /* IP Header Error */
@@ -122,7 +124,7 @@ struct NPCMGMACTxDesc {
 /* VLAN Frame */
 #define TX_DESC_TDES0_VLAN_FRM_MASK BIT(7)
 /* Collision Count */
-#define TX_DESC_TDES0_COLL_CNT_MASK(word) extract32(word, 3, 6)
+#define TX_DESC_TDES0_COLL_CNT_MASK(word) extract32(word, 3, 4)
 /* Excessive Deferral */
 #define TX_DESC_TDES0_EXCS_DEF_MASK BIT(2)
 /* Underflow Error */
@@ -137,7 +139,7 @@ struct NPCMGMACTxDesc {
 /* Last Segment */
 #define TX_DESC_TDES1_FIRST_SEG_MASK BIT(29)
 /* Checksum Insertion Control */
-#define TX_DESC_TDES1_CHKSM_INS_CTRL_MASK(word) extract32(word, 27, 28)
+#define TX_DESC_TDES1_CHKSM_INS_CTRL_MASK(word) extract32(word, 27, 2)
 /* Disable Cyclic Redundancy Check */
 #define TX_DESC_TDES1_DIS_CDC_MASK BIT(26)
 /* Transmit End of Ring */
@@ -145,9 +147,9 @@ struct NPCMGMACTxDesc {
 /* Secondary Address Chained */
 #define TX_DESC_TDES1_SEC_ADDR_CHND_MASK BIT(24)
 /* Transmit Buffer 2 Size */
-#define TX_DESC_TDES1_BFFR2_SZ_MASK(word) extract32(word, 11, 21)
+#define TX_DESC_TDES1_BFFR2_SZ_MASK(word) extract32(word, 11, 11)
 /* Transmit Buffer 1 Size */
-#define TX_DESC_TDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 10)
+#define TX_DESC_TDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 11)
 
 typedef struct NPCMGMACState {
     SysBusDevice parent;
@@ -165,4 +167,172 @@ typedef struct NPCMGMACState {
 #define TYPE_NPCM_GMAC "npcm-gmac"
 OBJECT_DECLARE_SIMPLE_TYPE(NPCMGMACState, NPCM_GMAC)
 
+/* Mask for RO bits in Status */
+#define NPCM_DMA_STATUS_RO_MASK(word) (word & 0xfffe0000)
+/* Mask for RO bits in Status */
+#define NPCM_DMA_STATUS_W1C_MASK(word) (word & 0x1e7ff)
+
+/* Transmit Process State */
+#define NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT 20
+/* Transmit States */
+#define NPCM_DMA_STATUS_TX_STOPPED_STATE \
+    (0b000 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
+#define NPCM_DMA_STATUS_TX_RUNNING_FETCHING_STATE \
+    (0b001 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
+#define NPCM_DMA_STATUS_TX_RUNNING_WAITING_STATE \
+    (0b010 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
+#define NPCM_DMA_STATUS_TX_RUNNING_READ_STATE \
+    (0b011 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
+#define NPCM_DMA_STATUS_TX_SUSPENDED_STATE \
+    (0b110 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
+#define NPCM_DMA_STATUS_TX_RUNNING_CLOSING_STATE \
+    (0b111 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
+/* Transmit Process State */
+#define NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT 17
+/* Receive States */
+#define NPCM_DMA_STATUS_RX_STOPPED_STATE \
+    (0b000 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
+#define NPCM_DMA_STATUS_RX_RUNNING_FETCHING_STATE \
+    (0b001 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
+#define NPCM_DMA_STATUS_RX_RUNNING_WAITING_STATE \
+    (0b011 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
+#define NPCM_DMA_STATUS_RX_SUSPENDED_STATE \
+    (0b100 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
+#define NPCM_DMA_STATUS_RX_RUNNING_CLOSING_STATE \
+    (0b101 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
+#define NPCM_DMA_STATUS_RX_RUNNING_TRANSFERRING_STATE \
+    (0b111 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
+
+
+/* Early Receive Interrupt */
+#define NPCM_DMA_STATUS_ERI BIT(14)
+/* Fatal Bus Error Interrupt */
+#define NPCM_DMA_STATUS_FBI BIT(13)
+/* Early transmit Interrupt */
+#define NPCM_DMA_STATUS_ETI BIT(10)
+/* Receive Watchdog Timout */
+#define NPCM_DMA_STATUS_RWT BIT(9)
+/* Receive Process Stopped */
+#define NPCM_DMA_STATUS_RPS BIT(8)
+/* Receive Buffer Unavailable */
+#define NPCM_DMA_STATUS_RU BIT(7)
+/* Receive Interrupt */
+#define NPCM_DMA_STATUS_RI BIT(6)
+/* Transmit Underflow */
+#define NPCM_DMA_STATUS_UNF BIT(5)
+/* Receive Overflow */
+#define NPCM_DMA_STATUS_OVF BIT(4)
+/* Transmit Jabber Timeout */
+#define NPCM_DMA_STATUS_TJT BIT(3)
+/* Transmit Buffer Unavailable */
+#define NPCM_DMA_STATUS_TU BIT(2)
+/* Transmit Process Stopped */
+#define NPCM_DMA_STATUS_TPS BIT(1)
+/* Transmit Interrupt */
+#define NPCM_DMA_STATUS_TI BIT(0)
+
+/* Normal Interrupt Summary */
+#define NPCM_DMA_STATUS_NIS BIT(16)
+/* Interrupts enabled by NIE */
+#define NPCM_DMA_STATUS_NIS_BITS (NPCM_DMA_STATUS_TI | \
+                                  NPCM_DMA_STATUS_TU | \
+                                  NPCM_DMA_STATUS_RI | \
+                                  NPCM_DMA_STATUS_ERI)
+/* Abnormal Interrupt Summary */
+#define NPCM_DMA_STATUS_AIS BIT(15)
+/* Interrupts enabled by AIE */
+#define NPCM_DMA_STATUS_AIS_BITS (NPCM_DMA_STATUS_TPS | \
+                                  NPCM_DMA_STATUS_TJT | \
+                                  NPCM_DMA_STATUS_OVF | \
+                                  NPCM_DMA_STATUS_UNF | \
+                                  NPCM_DMA_STATUS_RU  | \
+                                  NPCM_DMA_STATUS_RPS | \
+                                  NPCM_DMA_STATUS_RWT | \
+                                  NPCM_DMA_STATUS_ETI | \
+                                  NPCM_DMA_STATUS_FBI)
+
+/* Early Receive Interrupt Enable */
+#define NPCM_DMA_INTR_ENAB_ERE BIT(14)
+/* Fatal Bus Error Interrupt Enable */
+#define NPCM_DMA_INTR_ENAB_FBE BIT(13)
+/* Early transmit Interrupt Enable */
+#define NPCM_DMA_INTR_ENAB_ETE BIT(10)
+/* Receive Watchdog Timout Enable */
+#define NPCM_DMA_INTR_ENAB_RWE BIT(9)
+/* Receive Process Stopped Enable */
+#define NPCM_DMA_INTR_ENAB_RSE BIT(8)
+/* Receive Buffer Unavailable Enable */
+#define NPCM_DMA_INTR_ENAB_RUE BIT(7)
+/* Receive Interrupt Enable */
+#define NPCM_DMA_INTR_ENAB_RIE BIT(6)
+/* Transmit Underflow Enable */
+#define NPCM_DMA_INTR_ENAB_UNE BIT(5)
+/* Receive Overflow Enable */
+#define NPCM_DMA_INTR_ENAB_OVE BIT(4)
+/* Transmit Jabber Timeout Enable */
+#define NPCM_DMA_INTR_ENAB_TJE BIT(3)
+/* Transmit Buffer Unavailable Enable */
+#define NPCM_DMA_INTR_ENAB_TUE BIT(2)
+/* Transmit Process Stopped Enable */
+#define NPCM_DMA_INTR_ENAB_TSE BIT(1)
+/* Transmit Interrupt Enable */
+#define NPCM_DMA_INTR_ENAB_TIE BIT(0)
+
+/* Normal Interrupt Summary Enable */
+#define NPCM_DMA_INTR_ENAB_NIE BIT(16)
+/* Interrupts enabled by NIE Enable */
+#define NPCM_DMA_INTR_ENAB_NIE_BITS (NPCM_DMA_INTR_ENAB_TIE | \
+                                     NPCM_DMA_INTR_ENAB_TUE | \
+                                     NPCM_DMA_INTR_ENAB_RIE | \
+                                     NPCM_DMA_INTR_ENAB_ERE)
+/* Abnormal Interrupt Summary Enable */
+#define NPCM_DMA_INTR_ENAB_AIE BIT(15)
+/* Interrupts enabled by AIE Enable */
+#define NPCM_DMA_INTR_ENAB_AIE_BITS (NPCM_DMA_INTR_ENAB_TSE | \
+                                     NPCM_DMA_INTR_ENAB_TJE | \
+                                     NPCM_DMA_INTR_ENAB_OVE | \
+                                     NPCM_DMA_INTR_ENAB_UNE | \
+                                     NPCM_DMA_INTR_ENAB_RUE | \
+                                     NPCM_DMA_INTR_ENAB_RSE | \
+                                     NPCM_DMA_INTR_ENAB_RWE | \
+                                     NPCM_DMA_INTR_ENAB_ETE | \
+                                     NPCM_DMA_INTR_ENAB_FBE)
+
+/* Flushing Disabled */
+#define NPCM_DMA_CONTROL_FLUSH_MASK BIT(24)
+/* Start/stop Transmit */
+#define NPCM_DMA_CONTROL_START_STOP_TX BIT(13)
+/* Next receive descriptor start address */
+#define NPCM_DMA_HOST_RX_DESC_MASK(word) ((uint32_t) (word) & ~3u)
+/* Next transmit descriptor start address */
+#define NPCM_DMA_HOST_TX_DESC_MASK(word) ((uint32_t) (word) & ~3u)
+
+/* Receive enable */
+#define NPCM_GMAC_MAC_CONFIG_RX_EN BIT(2)
+/* Transmit enable */
+#define NPCM_GMAC_MAC_CONFIG_TX_EN BIT(3)
+
+/* Frame Receive All */
+#define NPCM_GMAC_FRAME_FILTER_REC_ALL_MASK BIT(31)
+/* Frame HPF Filter*/
+#define NPCM_GMAC_FRAME_FILTER_HPF_MASK BIT(10)
+/* Frame SAF Filter*/
+#define NPCM_GMAC_FRAME_FILTER_SAF_MASK BIT(9)
+/* Frame SAIF Filter*/
+#define NPCM_GMAC_FRAME_FILTER_SAIF_MASK BIT(8)
+/* Frame PCF Filter*/
+#define NPCM_GMAC_FRAME_FILTER_PCF_MASK BIT(word) extract32((word), 6, 2)
+/* Frame DBF Filter*/
+#define NPCM_GMAC_FRAME_FILTER_DBF_MASK BIT(5)
+/* Frame PM Filter*/
+#define NPCM_GMAC_FRAME_FILTER_PM_MASK BIT(4)
+/* Frame DAIF Filter*/
+#define NPCM_GMAC_FRAME_FILTER_DAIF_MASK BIT(3)
+/* Frame HMC Filter*/
+#define NPCM_GMAC_FRAME_FILTER_HMC_MASK BIT(2)
+/* Frame HUC Filter*/
+#define NPCM_GMAC_FRAME_FILTER_HUC_MASK BIT(1)
+/* Frame PR Filter*/
+#define NPCM_GMAC_FRAME_FILTER_PR_MASK BIT(0)
+
 #endif /* NPCM_GMAC_H */
-- 
2.42.0.655.g421f12c284-goog

