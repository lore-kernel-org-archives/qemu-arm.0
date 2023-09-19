Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3844692ejb;
        Tue, 19 Sep 2023 13:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNHVbgw5//zf3Xh3dloVmqN+r3n8DCkWUBGv5iGSM0u9zK/sSbo0q5k57ZqQe/e5LazFgY
X-Received: by 2002:a0c:e042:0:b0:651:75f2:dfb7 with SMTP id y2-20020a0ce042000000b0065175f2dfb7mr403040qvk.59.1695153898291;
        Tue, 19 Sep 2023 13:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695153898; cv=none;
        d=google.com; s=arc-20160816;
        b=eEoyMBMXJasCYz4E1mvHH/f+gTI7ZdRuZFTwg1pgUbR+yxOgdtKApVcuwI9jnE6x6A
         AHyBETvVFbo+dYXtiSX55GLqkUXTd/HvVjlusfR2v+tSuLRueJ3SFQWjYP89rnGGDu08
         sKwDx8a19Bjbv481F+3QEeRGrKY2Uf8BvWNpccgdmpwRBI6+ptmmgfDIt0yJ7qaDWRxg
         2KR/4bflTp/ipLC+5YCVrafN5xB5bJYg2yfV1BjQQlHokFh6Sli9u9XFPR/+jsosPyBF
         fpfyIK2RmMX51fAm5Pr+yTXv0yMarM2qY0jWTSE5cKnPYn1VXE+uTc0A8au/BfLu+Xmj
         HQUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=NObwuov3ZRdtGHX72FWq7XIeEMuZCIm45IOHrfEILS4=;
        fh=rqW8fspY+jkdnllEY/nhhmwU/Ez30a3FOJ93N6rRdoo=;
        b=f3QtpweC21SyLXERVS1/awhEYoa4ItXDIf14Orwo71SNRfaI8M0XRxPT21UrVNCodd
         P2XtjVlSt+mLZQX9ZeYOuc8S36L2TXVyMu0O9R0+UQRjPxjH0Qg8NsOpBgoTuJ8siZi0
         magodCUcWVlAnAvS1F73nw6FxlPYdTgqlH9R+hJiSNsVW50Xj69TT5Bf2CQuReWoRdYw
         p5kJh5jvZ0wgetSq3i6z2+1EydfLpLt8uYrrhOTIPbenwZNm5szxX/nLELYwbKNYBQ0v
         FX2+Qg4J60HRx53JYZ6WVJ5Hg0HHtP1mFm5jLNswzZIE27myXD8FayaSpPVsaxfDzBS1
         kf4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ZX+4Uh8L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a0ce409000000b006563961f6e3si3431168qvl.213.2023.09.19.13.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 13:04:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ZX+4Uh8L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qigxH-0005co-V3; Tue, 19 Sep 2023 16:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JOEJZQwKCD0mZahgdrsdeZmfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--nabihestefan.bounces.google.com>)
 id 1qieza-0005Dt-FA
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:58:35 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JOEJZQwKCD0mZahgdrsdeZmfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--nabihestefan.bounces.google.com>)
 id 1qiez2-00012j-S3
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:58:33 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d8153284d6eso6524339276.3
 for <qemu-arm@nongnu.org>; Tue, 19 Sep 2023 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695146276; x=1695751076; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=NObwuov3ZRdtGHX72FWq7XIeEMuZCIm45IOHrfEILS4=;
 b=ZX+4Uh8LzkIxzS6jW59YTkKy/OB1ITli1Uc96/IY2fatAaDJ71TAxq3jbPfaHomwQp
 GMQVqicN/CzQiQVjTdi1oNtww7K7sX0WsZqvSfqeA0obFamk6BLK/MiOC/VZpym0R5Ng
 9vyguiJM4F5oAaVSjTbLpYZR+cgqCFgFksiDnaE6dNRbO4GRMUnS2jLqbYdtiREPp9w4
 bNccZdyLgHQcdr288xVxWmMOKfHTWkP0QGg7MOHmbXqdx6PRdQcLVzd9O/93uuED/rL1
 QgStqt8t2KOh4QLu5hl52Goa5sl66Dw4w+u+5kAMiLI3XMI+2NSwYchKpLy6H6W1VVaX
 OEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695146276; x=1695751076;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NObwuov3ZRdtGHX72FWq7XIeEMuZCIm45IOHrfEILS4=;
 b=jDgZ9UIUrz1NqKmuCldrk2Dk5SuH929kPv+BkXFnNTgUB1gURd8+cQZGf50Uo45ZCv
 BoMFIwO5j3H7T6EfwrihnHcK8LdAFUaF9n/i0kOzYC+xKmOfAVKAWT4SjrobCiW3oo5B
 ZIJJOQIt+fjPV5WMocKQEvzyerUrKNOE1YCZuf28z6yQHKW1L4Xr2zyZ7VaxNrtwVlHm
 Mu2bOEbKWJqzAGCWFsu+KiD8j62Ylfs+HBVY6ZEj8ehqMoueLjpOmIh+pG7OK7iKuI+C
 ThQdspFptRS4B0Il2kaZMi3ZqJMSwhoV+Lg1TD2Y5J8X7ngjUA1Han3YhSRBXFKMm3KB
 FMLg==
X-Gm-Message-State: AOJu0YyrUmAJdXfUjIiZHe/8MT5r1Dt5RkrVsK0+dEaQkrZcOWIa0Ad3
 6DiI+nNJzCyLBJ8kMeWbpfp4OCKMRQFw1vOCta0=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:db07:0:b0:d81:78ec:c403 with SMTP
 id g7-20020a25db07000000b00d8178ecc403mr5328ybf.12.1695146276243; Tue, 19 Sep
 2023 10:57:56 -0700 (PDT)
Date: Tue, 19 Sep 2023 17:57:20 +0000
In-Reply-To: <20230919175725.3413108-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20230919175725.3413108-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230919175725.3413108-10-nabihestefan@google.com>
Subject: [PATCH 09/14] include/hw/net: Implemented Classes and Masks for GMAC
 Descriptors
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, Avi.Fishman@nuvoton.com, 
 Nabih Estefan Diaz <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3JOEJZQwKCD0mZahgdrsdeZmfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Sep 2023 16:04:14 -0400
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
X-TUID: /D48FbhVZcsG

From: Nabih Estefan Diaz <nabihestefan@google.com>

 - Implemeted classes for GMAC Receive and Transmit Descriptors
 - Implemented Masks for said descriptors

Signed-off-by: Nabih Estefan Diaz <nabihestefan@google.com>
---
 include/hw/net/npcm_gmac.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/hw/net/npcm_gmac.h b/include/hw/net/npcm_gmac.h
index 03529db1d6..067928fe0b 100644
--- a/include/hw/net/npcm_gmac.h
+++ b/include/hw/net/npcm_gmac.h
@@ -38,12 +38,19 @@ struct NPCMGMACRxDesc {
 /* RDES2 and RDES3 are buffer address pointers */
 /* Owner: 0 = software, 1 = gmac */
 #define RX_DESC_RDES0_OWNER_MASK BIT(31)
+<<<<<<< HEAD
 /* Owner*/
 #define RX_DESC_RDES0_OWNER_SHIFT 31
 /* Destination Address Filter Fail */
 #define RX_DESC_RDES0_DEST_ADDR_FILT_FAIL_MASK BIT(30)
 /* Frame length*/
 #define RX_DESC_RDES0_FRAME_LEN_MASK(word) extract32(word, 16, 29)
+=======
+/* Destination Address Filter Fail */
+#define RX_DESC_RDES0_DEST_ADDR_FILT_FAIL_MASK BIT(30)
+/* Frame length*/
+#define RX_DESC_RDES0_FRAME_LEN_MASK extract32(rdes0, 16, 29)
+>>>>>>> f17fd3e311 (include/hw/net: Implemented Classes and Masks for GMAC Descriptors)
 /* Error Summary */
 #define RX_DESC_RDES0_ERR_SUMM_MASK BIT(15)
 /* Descriptor Error */
@@ -84,11 +91,17 @@ struct NPCMGMACRxDesc {
 /* Second Address Chained */
 #define RX_DESC_RDES1_SEC_ADDR_CHND_MASK BIT(24)
 /* Receive Buffer 2 Size */
+<<<<<<< HEAD
 #define RX_DESC_RDES1_BFFR2_SZ_SHIFT 11
 #define RX_DESC_RDES1_BFFR2_SZ_MASK(word) extract32(word, \
     RX_DESC_RDES1_BFFR2_SZ_SHIFT, 10 + RX_DESC_RDES1_BFFR2_SZ_SHIFT)
 /* Receive Buffer 1 Size */
 #define RX_DESC_RDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 10)
+=======
+#define RX_DESC_RDES1_BFFR2_SZ_MASK extract32(rdes1, 11, 21)
+/* Receive Buffer 1 Size */
+#define RX_DESC_RDES1_BFFR1_SZ_MASK extract32(rdes1, 0, 10)
+>>>>>>> f17fd3e311 (include/hw/net: Implemented Classes and Masks for GMAC Descriptors)
 
 
 struct NPCMGMACTxDesc {
@@ -125,7 +138,11 @@ struct NPCMGMACTxDesc {
 /* VLAN Frame */
 #define TX_DESC_TDES0_VLAN_FRM_MASK BIT(7)
 /* Collision Count */
+<<<<<<< HEAD
 #define TX_DESC_TDES0_COLL_CNT_MASK(word) extract32(word, 3, 6)
+=======
+#define TX_DESC_TDES0_COLL_CNT_MASK extract32(tdes0, 3, 6)
+>>>>>>> f17fd3e311 (include/hw/net: Implemented Classes and Masks for GMAC Descriptors)
 /* Excessive Deferral */
 #define TX_DESC_TDES0_EXCS_DEF_MASK BIT(2)
 /* Underflow Error */
@@ -140,7 +157,11 @@ struct NPCMGMACTxDesc {
 /* Last Segment */
 #define TX_DESC_TDES1_FIRST_SEG_MASK BIT(29)
 /* Checksum Insertion Control */
+<<<<<<< HEAD
 #define TX_DESC_TDES1_CHKSM_INS_CTRL_MASK(word) extract32(word, 27, 28)
+=======
+#define TX_DESC_TDES1_CHKSM_INS_CTRL_MASK extract32(tdes1, 27, 28)
+>>>>>>> f17fd3e311 (include/hw/net: Implemented Classes and Masks for GMAC Descriptors)
 /* Disable Cyclic Redundancy Check */
 #define TX_DESC_TDES1_DIS_CDC_MASK BIT(26)
 /* Transmit End of Ring */
@@ -148,9 +169,15 @@ struct NPCMGMACTxDesc {
 /* Secondary Address Chained */
 #define TX_DESC_TDES1_SEC_ADDR_CHND_MASK BIT(24)
 /* Transmit Buffer 2 Size */
+<<<<<<< HEAD
 #define TX_DESC_TDES1_BFFR2_SZ_MASK(word) extract32(word, 11, 21)
 /* Transmit Buffer 1 Size */
 #define TX_DESC_TDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 10)
+=======
+#define TX_DESC_TDES1_BFFR2_SZ_MASK extract32(tdes1, 11, 21)
+/* Transmit Buffer 1 Size */
+#define TX_DESC_TDES1_BFFR1_SZ_MASK extract32(tdes1, 0, 10)
+>>>>>>> f17fd3e311 (include/hw/net: Implemented Classes and Masks for GMAC Descriptors)
 
 typedef struct NPCMGMACState {
     SysBusDevice parent;
-- 
2.42.0.459.ge4e396fd5e-goog

