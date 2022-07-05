Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4177666lft;
        Tue, 5 Jul 2022 12:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u9AI3V1iBad1ruvwVO33tWW6tLgmJnYh8BAGhLDLxHHDAqStIjQJ1+NvliTZyByJtYZsS8
X-Received: by 2002:a05:620a:3725:b0:6af:4f5e:de00 with SMTP id de37-20020a05620a372500b006af4f5ede00mr25229335qkb.754.1657048498920;
        Tue, 05 Jul 2022 12:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657048498; cv=none;
        d=google.com; s=arc-20160816;
        b=W5h2xvh+WW+4DBCamQhmPGnHkwbMLjcDnCNG8bKSiBkGKv0FI9pn98iNhsfZaA/Qdk
         3Q9vupMvq1jvdSBH9/Xz3XO27Ses2UkZsrXp1a8erXYozNHo/B2iPeO3BxQomAsef7sw
         Pz9QpXLCrVAZIGT82ulX9L4QrTH7k2lZZKqCgAZCQF6Tz5cDlPgy5g5AvkevlzIx4u8M
         IY2la7p1xy23DjNHneVx/AmrxQQORSWRDxyjAKJ3DEXAmRRde2fsWhxRtI1QJP7/o6Wl
         vu4lejNMGykxZWnFQp2xdGGbbx8t8P8uHdHH+I3eZElZoW7GBY8zACLdewPTa79xD6UB
         Wduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=KdzNLlPtoOQAR1V/yBPdUewvspHqmLHfngwqSvHO/IY=;
        b=Bha5M+kKflwtApLr/WyzIf7jfF0WXxLQEhz4K1L8fWaR7tgIp72HnSNd/iazt+0Ibk
         AeRL4wqSfj5opvLAd41FUHynQxRBzf8PFzhlbfVeAH08VhvYXe5jlh8ZhDG6NMhtzk3u
         bg/aBqK1WWtEc6yiSCsQnJICBoU5Jcgzoe8vTyKu6uyB4/MB7yUSPP64FW3oBFcv2xYe
         3MxlXjsmYWe7tnr/MhyXoIFzp97t1tQ/bo0OXiLnW5gI72iu6F2Mb91FsX7EvDlIVos0
         qQUaVq4FP7ur0lWGDc7kJTkfpFEgTJc/aNFVfiITrBzY/+J0w9aY9J76BLXW9W4KBZxO
         qGSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=NBPHSLO2;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=r+tRlxgv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020a05620a069400b006af0fc579a0si16027229qkh.282.2022.07.05.12.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 12:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=NBPHSLO2;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=r+tRlxgv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8o0e-0001yY-0w
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 15:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8nzx-0001CK-S7; Tue, 05 Jul 2022 15:14:13 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:58487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8nzw-000167-Dj; Tue, 05 Jul 2022 15:14:13 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id ACAC358032F;
 Tue,  5 Jul 2022 15:14:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 05 Jul 2022 15:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657048451; x=1657052051; bh=Kd
 zNLlPtoOQAR1V/yBPdUewvspHqmLHfngwqSvHO/IY=; b=NBPHSLO28DDlUrCmrA
 OgyjdMI/awvN+z0wz6Sukokri3btOm0OmLfz1mwvtHZKIktfSX8wmXZJwO2e25Mu
 YN+wK/y1FevB/Tm2ZW3rdNpAyaCO2rtCJAZwpVK/kY7dXho7WGeBIZguZmbZIeDu
 Hmd0EOvOMmYjcg97wE06tX8xK1YuYBW+O4+ZQ9S/JZ6KnkDwIXIzqw/kMCQSy4x/
 XM+BDKHCBBGlF3jHWHz6SdprMiAEBgDhGUd7CKOnKFBN3D4z9xRfZBjoSAsGpXus
 ZeoVBmbLFkLgpHJFkMRSWB/sA+Nlg5t8w/UcLWawV8FAymCMT9dtE7Y0vCrpdc45
 iwKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1657048451; x=1657052051; bh=Kdz
 NLlPtoOQAR1V/yBPdUewvspHqmLHfngwqSvHO/IY=; b=r+tRlxgvi8TP15MZq/k
 sN757KMBgt4TFZOz7uFziZ7VjYRsD3zpfhPHvI8iCZuOXtyzunX5WLNz0RyoNzVZ
 tC/r09l1wlEsWY4Pe8lsp/IYgbalaUsrFxFdrcthy113rcbkn7m+QEwenhJoo3u+
 lf+T8sEdtOW7RF76c+ZWpqZm0XUBy63GcaCMYQIbVRNhFbvxxov5mWjUH8FJQVS8
 QkOYutKcfPspthnrYdlpB0yhI8iIRAWEmmH4kJBHblPypheYlxp381nQg12TvV5h
 g8843NeheCS7GT2LIXfygoMSgY4QczVMBcWi2Woln4uEGLC84mjEc7ZE10cIJuCF
 vLw==
X-ME-Sender: <xms:g43EYuZx3ZL-vfBpSXxDXMPReEhKqio_X4aLLLaBYRDsPBnzJQtFSQ>
 <xme:g43EYhY_nDicev2kNbcuiUsOOU8dgXWBkUZ4aUkVjoCpmkf1fekyZ_T1Vwr2-F5qQ
 CKdQKt9fSGmjyI8w1I>
X-ME-Received: <xmr:g43EYo_43K4M-GNLPxFNqx0y84LTxIgrb-0gRrllGchdCtqU31a8sRoDAy6sTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudegtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvg
 htvghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffr
 rghtthgvrhhnpeetlefgueelfeffffefkeeigffhjeeugfdtgfetieegkedvfeffveeike
 dvleetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:g43EYgq7HWYqTGVCZTcVLBS0h1FAEtzWCmZ_3ACquIqwV5r_6x8eiA>
 <xmx:g43EYppjL4ZkhUtcPSXCtJPVI-5lQP6zA_lX9_7aGSZqWdzKMO3JjQ>
 <xmx:g43EYuRgiJSO8_v818qlVjB0FlT8i0l02sqOrbd5FXYPWWg2WL4aDA>
 <xmx:g43EYiBecMdQhmDlQe3ofck45amcY0Isj34fak4GO16XorPoGhZQsw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 15:14:11 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] aspeed: Make aspeed_board_init_flashes public
Date: Tue,  5 Jul 2022 12:13:55 -0700
Message-Id: <20220705191400.41632-5-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705191400.41632-1-peter@pjd.dev>
References: <20220705191400.41632-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: QM0KmW2+xLJI

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c             | 2 +-
 include/hw/arm/aspeed_soc.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cc395f988c..b2486a9e78 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -262,7 +262,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
     rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
 }
 
-static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
+void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       unsigned int count, int unit0)
 {
     int i;
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 68e907cd64..8389200b2d 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -184,5 +184,7 @@ void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
 void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
                                    const char *name, hwaddr addr,
                                    uint64_t size);
+void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
+                               unsigned int count, int unit0);
 
 #endif /* ASPEED_SOC_H */
-- 
2.37.0

