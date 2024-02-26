Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1762653ejf;
        Sun, 25 Feb 2024 16:05:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUd+1fC24wFzO7luqGvgr5x0MLp56tv80NaCMA1Bp5654UQJKAoQYFZhUjt58bKC9DiIBacLO+BCceRQHX8USFyGGOgHFxt
X-Google-Smtp-Source: AGHT+IHe6o1bF0blfcSjDslngEM44qW84jg0PEVUhJ6DaFWTSi3Qhj1cq0eP5b0rfCMAkpGqoV5O
X-Received: by 2002:a05:6871:4d3:b0:21e:9b56:737f with SMTP id n19-20020a05687104d300b0021e9b56737fmr5697743oai.19.1708905939395;
        Sun, 25 Feb 2024 16:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708905939; cv=none;
        d=google.com; s=arc-20160816;
        b=m4ivumkvrLcHSFlVQUN85ks0GzByQOgJsa+XpLZxPRmtkGjX5YMqyqCN9ZpWetQDJV
         iTpDUqsQUWOvTJAb71qn+37TfkkdIGajnMYy1XQ/+OFQyZVcGb7uV/6BnVfqX9W4PQDd
         0C7GRE+pkpiqImsI0f9DY5Ciwjgfm63jgRPuRVwEGvkCWx0IqOtxR06/p9s4EaxiIXbi
         oopiyACOEAmc6416ue2iDQLE1176WJjJqudJ/V3rWCqW/wGv+lsksvH1ipTvUzheq4AE
         d8rvoORIGtnxPe6TPddk60SnKyHg8nlseqQvLxwPZfHl1oCUbuNZr5wkKYMQ/zHqgn4W
         UdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=Nt3U3cg6lijmBYvtR3jrvzFPUcRJFNme9lzohXkR3JTXKGjLBRvT9Xz7vRacdaMzB8
         qtrkKehBhT4Krf1vEb1+CjKB3hLx0tMaRp0v+IDRgd1RbFukE0My15xO1lrFkbACKZs9
         RLdULf5Qcxq9Fqe/VseSUSdMoW7MHXEHTgLhkaQ+OUrb8/vzc33+FhJuj73R9DlTVT9G
         bZgQzb9HA9RyBqdxvevAIrb+sGAhMW0om9dsgpjLqoZAv3kGZDhCJzLH81QI7ckclRJx
         k4whPk2fvonClUzEJFEDcqNh33/pvFeXrh876eaXX+RDD2S1M42HFd8MjggF5+Fazo+T
         z18w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UEwvAeE6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v24-20020a05620a091800b00787a82752b1si3941754qkv.506.2024.02.25.16.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 16:05:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UEwvAeE6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1reOTw-0007WZ-Jf; Sun, 25 Feb 2024 19:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1reOSz-0006k0-TN; Sun, 25 Feb 2024 19:03:33 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1reOSy-0000S3-6U; Sun, 25 Feb 2024 19:03:33 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-608ed07bdc5so4861397b3.3; 
 Sun, 25 Feb 2024 16:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708905810; x=1709510610; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
 b=UEwvAeE6aQI6kpIZFQAY+xKRvaESmzdWaAql7r4K+BMVZ6c/AotJdCuOwJ7jqK9Jtc
 R8Seon8x8W9y1WAGnYXZu7sXDRbHJE/5+TGOLbHqTDFU5ZVQma5sNO3picwDRPW8aYTa
 v/pzEAnU73BBWVvunu21N5pjFLQ0qy2USVjj9DHkvciD2abYuTj1Coa3rlyLolk5FyJ3
 St8tscRWLzwPC9OhbNE/UC5U+s5zjXQNZZy6G/owiOjXIzHi8fHLRk95IJD2cjqCJjC9
 B4yBeKe+6oBNuy0t3Wm6kaBXoTwJgUqAkH6zwK+8Qtqo7pvaZNwxoAOmtCkX/LroxU8F
 y+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708905810; x=1709510610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
 b=f9qRcCc0mv/X3HV6fbig0Asp7DgV0hunhq7UFmdGuyftNtuVJEym5itaesIkmXmZBn
 d3Cs8yfvhWeFwwwdlBSngT7hugKDhONQGPSouB7j8Zs6G9n/AeR/dhEjGw0Ch+5SYiR/
 P/wVvAT/ITfAnntnUtUufU2HbdDsfsUTcqYZ3ai7OeeFZ+QgjINwsIlYB+CQSZy3Tq91
 ScoSvZV7Gv5y7+ANsKTU1Gigd3lnZNCcGHqyZufKozFPqkIwREqo7FWjflCnf1JuR5vZ
 7L6JPoOFAcNHGUHOWaPIDZ9RDrZM8N2tRkPf9B1L7i/E/k/fpGXH4oSPw+UkcaInvU1v
 gsIQ==
X-Gm-Message-State: AOJu0YyKr3wbczNtkZuT7z+3c02KuBMyDPmqp3WZa0K0cfBDGN29TVKc
 szLJzwBPmPmw4xBanVhj93viARNz44C1g4fq83rcwwqaIm/xyYzlAl7e3iawlElKLA==
X-Received: by 2002:a81:698b:0:b0:608:2a4f:89a4 with SMTP id
 e133-20020a81698b000000b006082a4f89a4mr5289734ywc.37.1708905810573; 
 Sun, 25 Feb 2024 16:03:30 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a818312000000b00607bfa1913csm938171ywf.114.2024.02.25.16.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 16:03:30 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v6 23/41] Add GENET register structs. Part 4
Date: Sun, 25 Feb 2024 18:02:41 -0600
Message-Id: <20240226000259.2752893-24-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U5gkCpTMIiJb

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

