Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2044460ejb;
        Thu, 7 Dec 2023 18:33:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGFjUQhyZNsHWaHCD4f9GVt/kaiNaKwIal3pqjvFccSOiBKPecPefNVNURboV/baBQa1B0
X-Received: by 2002:a05:620a:4d86:b0:77d:bdc4:486 with SMTP id uw6-20020a05620a4d8600b0077dbdc40486mr1938222qkn.55.1702002830661;
        Thu, 07 Dec 2023 18:33:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702002830; cv=none;
        d=google.com; s=arc-20160816;
        b=UZQkc2UgH+2oyiGLjk/lKy7I+CMj5NbwvDPJ9EIsJVFArnT9/J8yeFNLnpCHIb2Z4y
         DACVAm3owkrkHywDw3Hd9Q0UPvnub5FgJ3uymyoGvRqS3wo1G+IJ3kJfU8WV9V4UKEFu
         DVVKtsFTGwaKR/itFRXxi7BkT0QP5oNdHyoh/q8r1IG8gj53kXTNXKQ6kJq6VP5M3ePp
         UcKAmNv+fD4nExYZoexGdNIe9MEBn3Go1faPQOk23BrGfVlaqXZDQIU929vxJuMUyWTT
         TM+d/yRkWM10nTEZ9tGPRyAk60OYCWtLY7P2Mz+1mnRQIwpfGNYi8QzPqBS9xi97jlSQ
         kEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=dmHFPBrfGeo5zj2X35kSl94UjVQSH2dOVy7CRz9MvbK+PJJGTxI/6PqeJBZlX3MvZx
         BdH4t02bIYi7sz1ODZHnT5DcLjREsT23gXGRRToJt3fCGU99B/SKtM6x6159mOTf/HoH
         8IYpdml6ATsed09ulLXJJdXECrL7OenWAgyikd/LjzdDFxom9Tpzc5caUlqlUL1rmJOX
         VJJV96AYOQAiJKhCla5itmFUZSYSfgYxchMPRwMWtR7zi++hUrrr4fYgyOqUBO578mAH
         R2q4OvKDCmR4KrGYCFmOKHK/9j8hnnAJ1sFX0JR7PwmwGltWg6Jw7DFTlTlZRNcxtXYl
         WsAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGcayJ2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05620a258a00b0077d6c50a665si1132637qko.214.2023.12.07.18.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:33:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGcayJ2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBQgF-0005R1-GR; Thu, 07 Dec 2023 21:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQgC-0005DH-Aw; Thu, 07 Dec 2023 21:33:29 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQgA-0002bS-Ll; Thu, 07 Dec 2023 21:33:28 -0500
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c9f62fca3bso20106651fa.0; 
 Thu, 07 Dec 2023 18:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002803; x=1702607603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
 b=WGcayJ2x31Xs1m36jAFECj4W2GMZgRep0UBIJ01ec8PrKBKbjrhYSC32YDVzKBJJ4R
 5w4wV/G6pmq+aomNwtXQIAgjFUX/76PPGPa/VRqf2h+8Mm6lUAcHMCb42bwm3nP+4QLa
 +R2jsx1L7SBK+TqSo9f5N4qLg7BAygxp53b9PgJBpkiVg57Xt+GujqAZc2aOADxlDrxY
 gKhKFjku0ar1VRyUfd6lAHRG4DOHbvnDgn2npl/Wnv5WYKHVqFQB+mgjbnUSpxKlLZ3p
 u4DeE9ECovHIRlAP/2gx3iZUG1uLI5Tmid/PVYksTeI0QJWtEqz9B7TfQ8CuC/X3kl81
 55lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002803; x=1702607603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
 b=Pq/96h5OBsWTIqDY+GUoRxZTXOk9zY+MkDNC4xZr8viDuL90ddQVCO88OO2xn2kE3c
 uTsk/r17mvigBdr9WZfH4pBIsYqsmBhuPXeSoi4JgMp4et3T5/pS3Zr00PV1Fax1jCQm
 FHFfy0Hja6o2GrbakPh5E825NYZWRZ/W6aJupcvyuJFYFf9rYwh3hpJg0XcIx6eqImz2
 hUjmbs672NyhCR0Uu4kzjrP56myhsc0vSKVzKJqMLFjRBxIYFXZ/VoOu2I2bhmz1M4a+
 ckCzU3TGIYrzI5B0y6AP3f7r8yReoyHSmnDaaOcYU4ZRQeWW0a5BYPInvStMo1VNDWXc
 Cg7A==
X-Gm-Message-State: AOJu0YxCBwHnKQgLTH6km841VKx/BVCwD2iHJ3otIpZ6wyF4xCobaaMx
 XzRi2eGa9rUEVnkP1gj2bXac/rVBimnXjg==
X-Received: by 2002:a2e:9990:0:b0:2ca:68:acf6 with SMTP id
 w16-20020a2e9990000000b002ca0068acf6mr1977133lji.88.1702002803520; 
 Thu, 07 Dec 2023 18:33:23 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:33:22 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 26/45] Add GENET register structs. Part 4
Date: Thu,  7 Dec 2023 20:31:26 -0600
Message-Id: <20231208023145.1385775-27-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x230.google.com
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
X-TUID: C+O18r+YayKe

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 include/hw/net/bcm2838_genet.h | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index 1bd004785a..94c2f3ebca 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -25,6 +25,12 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
 #define BCM2838_GENET_HFB_FILTER_CNT      48
 #define BCM2838_GENET_HFB_FILTER_SIZE     128
 
+#define BCM2838_GENET_PHY_AUX_CTL_MISC  0x7
+#define BCM2838_GENET_PHY_AUX_CTL_REGS_SIZE 8
+
+#define BCM2838_GENET_PHY_EXP_SHD_BLOCKS_CNT 256
+#define BCM2838_GENET_PHY_EXP_SHD_REGS_CNT   256
+
 typedef struct {
     uint32_t rev_ctrl;
     uint32_t port_ctrl;
@@ -273,6 +279,34 @@ typedef struct {
     uint16_t rdb_data;
 } BCM2838GenetPhyRegs;
 
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
+} BCM2838GenetPhyShdRegs;
+
+typedef struct {
+    uint16_t auxctl;
+    uint16_t reserved_1_6[BCM2838_GENET_PHY_AUX_CTL_REGS_SIZE - 2];
+    uint16_t misc;
+} BCM2838GenetPhyAuxShdRegs;
+
+typedef struct {
+    uint16_t regs[BCM2838_GENET_PHY_EXP_SHD_BLOCKS_CNT]
+                 [BCM2838_GENET_PHY_EXP_SHD_REGS_CNT];
+} BCM2838GenetPhyExpShdRegs;
+
 struct BCM2838GenetState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -284,6 +318,9 @@ struct BCM2838GenetState {
 
     BCM2838GenetRegs regs;
     BCM2838GenetPhyRegs phy_regs;
+    BCM2838GenetPhyShdRegs phy_shd_regs;
+    BCM2838GenetPhyAuxShdRegs phy_aux_ctl_shd_regs;
+    BCM2838GenetPhyExpShdRegs phy_exp_shd_regs;
 
     qemu_irq irq_default;
     qemu_irq irq_prio;
-- 
2.34.1

