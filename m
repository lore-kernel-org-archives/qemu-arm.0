Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2387218ejb;
        Sun, 3 Dec 2023 16:32:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHO46gAXcnqgd4xsQNt0tIUzuQk7mk3FSoO2zMxVj7XUI3oDq7TqrgK5MEWeMyzxEFlARIK
X-Received: by 2002:a05:6808:120d:b0:3b8:b063:825b with SMTP id a13-20020a056808120d00b003b8b063825bmr3851815oil.93.1701649944571;
        Sun, 03 Dec 2023 16:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701649944; cv=none;
        d=google.com; s=arc-20160816;
        b=DvAQjOCOUrCRKxLPJesLhRwbtGHfk8Jy3IGWYrHjUKvKoTbeXmFv1YYzjQSfEjNPa+
         HW1WsAPBwilhID55Z0P/DiHykAkoKKueuvEO/h7kz3Wb+Ka4CwbRf2PL+edZALSFMRaU
         WaC9RZc9437bt35WTWNsXBfhF/dLS0Uqudw/kdUozNWyafeIdn7JJp0jm7S85U8NbR//
         YQZ03//Zlzha5VQKuXKgtT+QSPoMnS9Y7wxBbyCiiueywQdkfvwKurNUjKOFIfvQhTya
         s5BlD7e3TzjQ/OC9tngEUQ7kwxZs++44jRz5J/cXszKzOEDiTHd06yR4EhWXlrgrrFDX
         RHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=ZP0w6KByKETLq7BDPKK4ajttHce+7H0z53kNqPZke2O5vH98EfZfY+JXHBttfyCPQS
         rboCLAcD/vKu01k2u3+/g0WIy1Eby1tBgmg4IouKBGrwuj2nt/der/oUGbHEJI8tosIJ
         aCZHantO0daejaliVXNfymq4kRYHasbJB907gM1KvxzNf1qihsSYQmNqCAXTuqckSwiJ
         It6QVWXejCCaw9bVzsjvPsrI2XtcC4DPeV/n0g7VAWMqJ3l3l6vPMxarSCNzZwwc7HFR
         rdN0bOIEj9VJWK4AZEzUrffV8CE+RB7Sh/4zLn7Zl1iLI8iAeWMOUsFPfOukpo6Q/Gz9
         OwQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=P414SIW9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a05620a13ea00b0077eff54828bsi3720306qkl.302.2023.12.03.16.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:32:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=P414SIW9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9wny-00051M-30; Sun, 03 Dec 2023 19:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wni-0004dy-5D; Sun, 03 Dec 2023 19:27:07 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnZ-0000DI-Jj; Sun, 03 Dec 2023 19:27:02 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5c85e8fdd2dso43017297b3.2; 
 Sun, 03 Dec 2023 16:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701649616; x=1702254416; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
 b=P414SIW9YttPRZKXhOpVjIzqplXOdexDmKjWiwm/EGuWv7wk11BHpcxxTJy81tBnfa
 PlNNBJkqjm11ncIvGKdE1vNljCuvfXm+4dDQEXlsWF/UxzkbX0mdEKdJHJtenYui+zqh
 8xRPKui4f6/vAi0Ey2inXaC3V4bGwUWxWZbaDIvtDdUSMW9ZWXb6/7EEUj8usN5ge3mX
 vn08zKStwfMXtMLhPpTIUTN9Iu7U4LbGafQf0F+m9Gg4olJC0fsyEFvtZvrUgm+YhIwI
 hOm432YdZBhHXXNFL1Bue2YaaF35MFl/XT6gJPkEYW3oB73QHMRua7bw8f4pffXNyr90
 GEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649616; x=1702254416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
 b=bTlMdPV/8BXbKLJJJW9OQxsa9+fxrIhoqmdu2NbZ+ovv3abwBK4fEFcNzR8e940dnj
 e80dk+YrJoj7V1lpcM49e5sma+n+rB4Smo+cnoLqCUm6QDaT8p0ymF5DuRz+fxfZ9qnx
 l46fYvgN9KiFkdKpTdkFSb27+OwqI1BbF9bGHkEJcq3Egzq2Gl1YIpJsT0/1Ml8wNiII
 i1v3UbRBJryCrhKYjC3iXfolOLGO9zZcb8niFqkXse2wL7/XNvDgNSzDJkENcarjOQoF
 k4MA+OZqCVaeYsNyx8UHmkzKx7Hc/Iyy/g3qOk02S4GVyDriupHtrFefkLt4Bqo0d9Wk
 eGXQ==
X-Gm-Message-State: AOJu0YwFisyDG3yZEd9PVUBEqt/Sv0Zi03KADIIyNbNY/CJlkvShdP/V
 qwfj+Qq2MMlSkpwV1awmgpIZyQ7l2sojPw==
X-Received: by 2002:a81:6d47:0:b0:5d3:bf64:5e23 with SMTP id
 i68-20020a816d47000000b005d3bf645e23mr2123503ywc.29.1701649615819; 
 Sun, 03 Dec 2023 16:26:55 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a0de242000000b005d3e6ce07e7sm2443187ywe.6.2023.12.03.16.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:26:55 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 26/45] Add GENET register structs. Part 4
Date: Sun,  3 Dec 2023 18:26:00 -0600
Message-Id: <20231204002619.1367044-27-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9KpKsT5Jf2dq

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

