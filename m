Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp594597ejb;
        Wed, 26 Jul 2023 07:39:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHCtIXvthTB1DGQ9E9rg1Z4yoOSixFNDRbNy+mmw/yYfuvjAuYml269B8rYRN++9F5inDge
X-Received: by 2002:a05:620a:1923:b0:768:2f20:b336 with SMTP id bj35-20020a05620a192300b007682f20b336mr2645240qkb.58.1690382377911;
        Wed, 26 Jul 2023 07:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690382377; cv=none;
        d=google.com; s=arc-20160816;
        b=q8mxltryD4+Sg8bXFwsQDJr6fssOOq3yK9ZnTydV2Q15ebgLArS+5jhg6VFosrPBq9
         wtP6a8cN2Ko0gAsJyYVCqbJGcfzHLVox2+Lm5FY4IPk+z/1sc8hhbHJEtI8AfYftew+k
         5J1sD1irwdiH75EpAerR72oxNOWXZKmA/ACgxWFlqLcNL4VKuXgpqvhKSZgOKJV4XSSl
         041wD3Mc95cxaehuGTk9dt4r87Q4N1/zBFxa/hpwn0+6iVkdKfbAPGHYerPzmnJevXOx
         xtlnFlJoZW6eu2QZwQpLbjDgND22yg3Cce9nQx6ptjdHTs2J/k0JZ6mvoN+PCIF1gw1o
         4T5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iPdZTmCIrme/QnBBrjhsf79S6kax7iTDj/A1vih6UL4=;
        fh=f5jt6gD4kTKAQV2ukO6ZfXPs+EJm4Q1+uDtHV6gcJRE=;
        b=VbeNTzM9TZiRAhAc+UUJqB/EQYkpAbYzoqtifYifZz744sSl3dBcz0DF4i59mL9uZi
         rOWEcWJ0pr1DYLvWlwG+l8rHpYdvGLa8TJv+lecXuFoMqCdOkTBaONINSxrcgjSLH8fs
         ZUc+nOyFwe+gtRDpwLGruKqtk2KazLiJcK8xmQn0+e+yz2MPht+Up87+NN5G1chFuXMT
         w06Qx3jdHkbkJll/KJsBR0GuwLD/vW0XftavNugp3g5avf9MrcqM7rmQyGGRdwah7L80
         /XY2cF408qdtl9x1v6Dggp93ikU3lwmMuzWHW4+qgyQiriv0zAnNAsdZsE9aWzzar1X+
         tcSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=fEA2UYx3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020ac87d46000000b00403a3002ce8si8057810qtb.339.2023.07.26.07.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 07:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=fEA2UYx3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOeWt-00037R-To; Wed, 26 Jul 2023 09:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWc-0002qh-Ku; Wed, 26 Jul 2023 09:25:59 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWY-0003MQ-Sm; Wed, 26 Jul 2023 09:25:57 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so10542485e87.2; 
 Wed, 26 Jul 2023 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690377951; x=1690982751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPdZTmCIrme/QnBBrjhsf79S6kax7iTDj/A1vih6UL4=;
 b=fEA2UYx3WYfc9uiFlYtPoirlX4vSiNQ6QT7WdVAl883FuzrAYouLFSr8Tq/tpKVzkb
 zdZPYNNDdMV/5HK1PKTVO+KDbM1rdA4Vbh3i7XC7q6NXW8NpDjN/YHP2HQPtQcyptvkT
 +LHCnJPz/G1nMzFMqaTT2yKdxkc/WmUbth1p6bmIhuMCG8sNwFDkt8qthDiCxlfjcCBV
 B67iFdARn8tBcPYF78LiyoKfLAKSTFLPofA9jW4BwzCQpUgC80wXy4xrhKMQ4EzC5o33
 shzo73mCOok6k5DOE5blk+EWlm/buIH6v4KzY+T7pvRTm8jOElZExMsIZtDXILgbrYkf
 QoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377951; x=1690982751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iPdZTmCIrme/QnBBrjhsf79S6kax7iTDj/A1vih6UL4=;
 b=dibgVlvSEJJVRFZcMN0eeLJsScnxxsBSXEmImOOeuFRhnPQ9Qk81HZafpEZ0lsDX8d
 g2FMlRb8MDgvuEnP7F2yly5tQBu/O+DoFYdGVm3JYRI1zlVgzowYOkrtSWlJ+3P7te4y
 fevPw0dOtjD+oWoGLZIemcky7XmnzmHFPgcVBl9NkS2tuH/xx69Ff+6gWTSeuVO0LvqU
 i7y4xYr6UrSKaapc1qknsGLngALTATDLHhttl/4TFdlaoFREcSq05DlyCGP2hkSTY0Lc
 tXinGnQ4b3yVqueqmGb7I8lVxOc/bI6Tedg69I+W1+bwd89Qp4a9F9x6kRrbP6gILV5l
 pvtA==
X-Gm-Message-State: ABy/qLabLz6Rl1hAg3e1G6eOoquIXqoU1EadDX89loXXi0hdqsShJWpm
 OGmyoflwcUyxmx+6gqAwVnJBGspo+fA=
X-Received: by 2002:a05:6512:6c4:b0:4fd:faa2:884c with SMTP id
 u4-20020a05651206c400b004fdfaa2884cmr1457804lff.29.1690377951103; 
 Wed, 26 Jul 2023 06:25:51 -0700 (PDT)
Received: from sergevik-thinkpad.localdomain ([213.197.136.186])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a19f516000000b004fe0c3d8bb4sm565079lfb.84.2023.07.26.06.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:25:50 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 26/44] Add GENET register structs. Part 4
Date: Wed, 26 Jul 2023 16:24:54 +0300
Message-Id: <20230726132512.149618-27-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=serg.oker@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: UgMqEwYRGWU8

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 include/hw/net/bcm2838_genet.h | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index 4cf70a17d3..4b549ed431 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -25,6 +25,15 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
 #define BCM2838_GENET_HFB_FILTER_CNT      48
 #define BCM2838_GENET_HFB_FILTER_SIZE     128
 
+#define BCM2838_GENET_PHY_AUX_CTL_MISC  0x7
+#define BCM2838_GENET_PHY_AUX_CTL_REGS_SIZE 8
+
+#define SIZEOF_FIELD(type, field)      sizeof(((type*) 0)->field)
+#define BCM2838_GENET_PHY_EXP_SHD_BLOCKS_CNT \
+    (1u << (8 * SIZEOF_FIELD(BCM2838GenetPhyExpSel, block_id)))
+#define BCM2838_GENET_PHY_EXP_SHD_REGS_CNT \
+    (1u << (8 * SIZEOF_FIELD(BCM2838GenetPhyExpSel, reg_id)))
+
 typedef union {
     uint32_t value;
     struct {
@@ -568,6 +577,34 @@ typedef struct {
     uint16_t rdb_data;
 } __attribute__((__packed__)) BCM2838GenetPhyRegs;
 
+typedef struct {
+    uint16_t reserved_0_2[3];
+    uint16_t clk_ctl;
+    uint16_t scr2;
+    uint16_t scr3;
+    uint16_t reserved_6_9[4];
+    uint16_t apd;
+    uint16_t rgmii_mode;
+    uint16_t reserved_12;
+    uint16_t leds1;
+    uint16_t reserved_14_18[5];
+    uint16_t _100fx_ctrl;
+    uint16_t ssd;
+    uint16_t reserved_21_30[10];
+    uint16_t mode;
+} __attribute__((__packed__)) BCM2838GenetPhyShdRegs;
+
+typedef struct {
+    uint16_t auxctl;
+    uint16_t reserved_1_6[BCM2838_GENET_PHY_AUX_CTL_REGS_SIZE - 2];
+    uint16_t misc;
+} __attribute__((__packed__)) BCM2838GenetPhyAuxShdRegs;
+
+typedef struct {
+    uint16_t regs[BCM2838_GENET_PHY_EXP_SHD_BLOCKS_CNT]
+                 [BCM2838_GENET_PHY_EXP_SHD_REGS_CNT];
+} __attribute__((__packed__)) BCM2838GenetPhyExpShdRegs;
+
 struct BCM2838GenetState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -579,6 +616,9 @@ struct BCM2838GenetState {
 
     BCM2838GenetRegs regs;
     BCM2838GenetPhyRegs phy_regs;
+    BCM2838GenetPhyShdRegs phy_shd_regs;
+    BCM2838GenetPhyAuxShdRegs phy_aux_ctl_shd_regs;
+    BCM2838GenetPhyExpShdRegs phy_exp_shd_regs;
 
     qemu_irq irq_default;
     qemu_irq irq_prio;
-- 
2.34.1

