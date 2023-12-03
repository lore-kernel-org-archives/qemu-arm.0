Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2370233ejb;
        Sun, 3 Dec 2023 15:43:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPf34OZ7O5S2qwu0z1peUm1ZQ2lm6/FArZoIzuCcuyO/94de3Aof4R1itn03Il0Z02CSH0
X-Received: by 2002:a05:620a:123a:b0:77d:c2bb:fa7f with SMTP id v26-20020a05620a123a00b0077dc2bbfa7fmr16558943qkj.2.1701647038373;
        Sun, 03 Dec 2023 15:43:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701647038; cv=none;
        d=google.com; s=arc-20160816;
        b=QZl5WiBcIFTui8A05qz8/OYa019uPLT6AfhNhGWjiL3V+p7gIJdvKuusg4rDtqhs86
         iJWQ8HDSDbLdZgPdULrAipaVawvK/uGGJ7ooaQ5KMtxSXKzEirSs/MGoQMwWEm2AIc5j
         NNV9bNakFrMi+YbFrPuaSM7C7yY0u7583ZEbI5CD05I5PbC6U/vp6mBrOElCfjexJkI7
         jC68m+4QlxMj9WWhasV4uNe40YT3+l7IL/gC7cyh74UMAP/E4F4Mchg0X+ZgaPFwLbyS
         D5xGJD6BYgLru2J/hy30g87dp0ocpftwjoNgSZCXr+5CNDXg7KqX4cOvshSJrQjIS9BJ
         80sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=S+MjvlAwqKfoT0F1k1GN9Lxvq2+aDnWHeitsq6Hsg5w+eUI/0ICuLx9F2Qkxv0WQad
         a76ecgQeGMP455ac9Og7bpeNjVsWNl4RX5wPURVVsBCCKgrBQMOVjBSSCFVX/xioV7cL
         pBXB/bQ6wnFroXPzM+eaXfEhQCQPCF9OF/zru/N8sXv4YoH47j0vQH/HXhZfo2F/iHEX
         L6qP9/MRP0GXf43JGyrzEZ4RdMWAEPdabw+uymlnpN2vg9wt8avGE+U3Kpnz4DHaf8s7
         rT4737vWwurD2w1P/fAEkP0500F4fViiHL87+yZE0NwM5NC9Lc+lRyslBdnx1osopq/v
         aiuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LTsSf1DY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az7-20020a05620a170700b0077d6baddf8csi8959640qkb.246.2023.12.03.15.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:43:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LTsSf1DY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9w6w-0007Ec-8Q; Sun, 03 Dec 2023 18:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6r-00079z-7r; Sun, 03 Dec 2023 18:42:49 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6p-0002nl-NK; Sun, 03 Dec 2023 18:42:48 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-59b5484fbe6so43978697b3.1; 
 Sun, 03 Dec 2023 15:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701646965; x=1702251765; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
 b=LTsSf1DYSUvNG+IJ2emVXzrwsAa12GRy8fisqj3xjLhfnrNkFL+qhMeNKO9Uj0M06l
 5ZZQPuJ9Uz+/f7XzqLhaCu3HShXpog1HHUvS8YQz64ol+ASEjtrtJHvn4ADXQMkX/Myo
 +SIRLnrrsZ/kJgr6rIdfqiQxsiL9RdtsK1VdLZYgcEAd8pwICYb9cADlP/kPKrdCi7di
 iF8bhpU5svc6Vafp161hyY7KWWT4+v4/vwjiTbtETQkdmefLGCMk3AxQoUOdvoq9uaxe
 S51LemVKUECdQXJ8lF8Igi5Xe3qQ3cgV3avjaDlKPDUstV9sQlp1fcSdBcpncNLv4J/l
 Befg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646965; x=1702251765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m35zG+ajLJL60pM6bIM9adMNO13lGgmKjK7XnKNpmk8=;
 b=MKOTwWvaflVr09VDaf1lhgypiwAljdnEkCotiVYbgro5kS8LpAbKvwHL5h7jE15r26
 Q5iuBrNwFyxnNW+2Ah6Ndz+T3JCG4Uu3iOZk1kLBjJ9PViK+9IICjbyZ0o63gVpo33Ns
 jWw3uBNtPHmqxhg/gwTS9MnLwMGYfykajxS54gB82TdIJcN/jZW0h75RGP73tcmEXoKY
 IWIdcSPh5mdZoFKXDuxsPIi4IGxR67AzLutMpP+6efDAFN1d0VRootYOXYgOosiFNf5P
 G+wDH6jFSvvMVUIFZCLtcploKIrlEVAMsR6uHm/IPg8Q+rztPx1FDa3AW197POeH9H1L
 l5lQ==
X-Gm-Message-State: AOJu0YxGWfdoEGtC0xCMu2Eu6N/XBWmASP3OnW2/gaH5cGAfKQwNsUv/
 Lwk9LioKLRmvJ+4FUQoIJvfcECZV4v+JEg==
X-Received: by 2002:a81:5b06:0:b0:5bf:f907:e07c with SMTP id
 p6-20020a815b06000000b005bff907e07cmr3498387ywb.33.1701646965234; 
 Sun, 03 Dec 2023 15:42:45 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c126-20020a0dda84000000b005d718fff165sm1536299ywe.78.2023.12.03.15.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 15:42:45 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 26/45] Add GENET register structs. Part 4
Date: Sun,  3 Dec 2023 17:41:54 -0600
Message-Id: <20231203234213.1366214-27-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1133.google.com
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
X-TUID: on42IUkIOY++

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

