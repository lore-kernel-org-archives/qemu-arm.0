Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp214744ejb;
        Wed, 31 May 2023 23:39:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7nY2imv19A6KkNED+2X+9Vc1UJ1CTu+5N6dIxoq0Vpi1Lz/LsMfJQFJGY1kd5DI4n4Z9kk
X-Received: by 2002:a05:620a:2547:b0:75b:23a1:d8c5 with SMTP id s7-20020a05620a254700b0075b23a1d8c5mr1142504qko.9.1685601563099;
        Wed, 31 May 2023 23:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685601563; cv=none;
        d=google.com; s=arc-20160816;
        b=S5wXGff+UL3PZUgXQi+bxwG1IqsIu8OsMmgC+BO5AQOdiC62kgIrR4dkw6p4CyNd4f
         3rGg79C23PFU4kIewRvbMheShcYEqDm3LHhpfxu1VxNV+rxURk7uo2xSZHYazwaTYFox
         6FPVojJALuVEcqO6PEwFOYjrtK/Hofjl/trS2d3L3QFGf9EU17ziARM6m36U7WMZz0JT
         3YL6uKFki52PpzCCmlL7n6uYQR/cNIV9rLLAdSamwB0RsPKYqRHcjdNiJeVfW1oZHW/f
         auKcwKI1uiLVXAWPDgXU79iQ5ZC0vvSGU0lACIjORSbRzt9DyJfw5eLd9CvDO4joOWX6
         5Uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=8kHTvhN0l69CZaUNhfKgCyTlKWI6yf352gSFf/8Oc80=;
        b=P3mYFvXttPB14t5RqqIp9Hip0Lo4Xkzz8EfDOtsRgJB0sDXrqR3NF21wlaqa0VgoT/
         XcwgZ65W5EUDnPtrO7mWLOvypuU6eHzr5HQKQeV1m/GDUEZf6dYBfbd4AVdT8mgqUaxE
         d8eWa/k6dYGAxJp9kErO6Y8P579nk1Fl7cDGOdqEYKwD1g439ftonkTzaG+DQn8FLQlJ
         V61J++/bBPBJvtyPgLhkQmazimXwvFvpSp2lqydkQ1WZMyo2rISW9CV6u30XHHaugUyl
         WBqjGAURoSjuNI+dgBCMHGBv91rbevBgpfB386VM0iMDX4h/ciAi++YVvRo3nEo0LQ7T
         38Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020a05620a038200b0074cdcea5d2dsi9110911qkm.324.2023.05.31.23.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 23:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4bxN-0002Qg-Hb; Thu, 01 Jun 2023 02:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q4bxH-0002BH-1q; Thu, 01 Jun 2023 02:38:39 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q4bxF-0004gB-4C; Thu, 01 Jun 2023 02:38:38 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwCXXdPhPXhk18A8AQ--.34485S2;
 Thu, 01 Jun 2023 14:42:41 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwD3JV_iPHhkoIgAAA--.5009S4;
 Thu, 01 Jun 2023 14:38:30 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rad@semihalf.com,
	peter.maydell@linaro.org
Cc: quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH v2 1/1] hw/arm/sbsa-ref: add XHCI controller on PCIe
Date: Thu,  1 Jun 2023 14:37:37 +0800
Message-Id: <20230601063737.464751-2-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601063737.464751-1-wangyuquan1236@phytium.com.cn>
References: <20230601063737.464751-1-wangyuquan1236@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwD3JV_iPHhkoIgAAA--.5009S4
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQARAWR3nCkCLwAAsa
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoW7JryDXF1UZw1UuF1ftr4kCrg_yoWxKrX_Gr
 WfXwn5Wr4qyr9ru3sayF4DCry09w1FgrsFg3Z7WFW2ya4UAF1rWrZ7t3sYvF15WrWUWF4f
 Aa15ArW3tF4UujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=209.97.181.73;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: u6tEzle+aoxL

The current sbsa-ref cannot use EHCI controller which is only
able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
Hence, this add an XHCI on PCIe to provide a usb controller with 64-bit
DMA capablity.

Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
---
 hw/arm/sbsa-ref.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index de21200ff9..a33cd80d69 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -668,6 +668,8 @@ static void create_pcie(SBSAMachineState *sms)
 
     pci_create_simple(pci->bus, -1, "bochs-display");
 
+    pci_create_simple(pci->bus, -1, "qemu-xhci");
+
     create_smmu(sms, pci->bus);
 }
 
-- 
2.34.1

