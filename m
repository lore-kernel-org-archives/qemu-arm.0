Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD4AE9A04A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:52:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt5MK-00041q-HH; Thu, 19 Feb 2026 09:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5M4-0003mF-0b
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:50:19 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5Lw-00086w-7h
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:50:07 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4376c0bffc1so840436f8f.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771512599; x=1772117399; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iL3C1pS7IifBgrlCFYdscA+wkLZ194nZOqF5fMNffCY=;
 b=fJtEUs3RFT98gZhP+hCD3U7s+IMmcRtQAx70RUprMCjCxokltcDbpLJwwXblDkvL1L
 RVGQNJxqw2KOAx7yIIztbaGaGXJwHjGsIYCryBmLYSVioeMiYWJNeb3/q/iZAzcfyGug
 +vstlCPpKl+yZAE0V+g2wg1WsZuyK/AOA36I+6w6VpKKzAQVqcjnN268iQaGZgkJq2NY
 gOVQOwAfIa2zxnKq00d0D/0iFzwqQLpLjUNZBB+68WTQim6qvIL/s/ED6rsO8sgqpc+A
 tx99lSNlYwaa9trK5iZuNFVFqmUVd7df3OvGTCCRqBCdu86PHzZm7Pez5cqgP+HKIS7d
 HpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771512599; x=1772117399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iL3C1pS7IifBgrlCFYdscA+wkLZ194nZOqF5fMNffCY=;
 b=c1nFYMiLxrrGRmaD2ymXLYV+GSx7tcpoqSu/05xHkZr9IiIVeNjSDDQHO9VqXvJcfD
 BDJhFWNweFDlCEXb7qwSappIg4NdVEoVRb4gABJDThTwqWFUB/qQFojby3PqsUzErdkr
 ja4D7R0vO9ZtPBvIXXpfpznAJJpBrCSzi9XPXz7RG5ZCM3qQtiM3KpyiVc+Ah2pIHpi1
 deyg4wchq4Xyo/5/+ioBe7tqSdyXY5xGz066eOVQV0ooWdL5J8E5DrEjJB5Zbv1ZXZ7l
 Z+nMwjzG5zO82QFXFay5hDHJAY0mC9XFeqNTjdSwqWvKNG9kbDm7ah3kN77SGwqmElBy
 5HnA==
X-Gm-Message-State: AOJu0Yyujn5nx+8OADX1RRCNF4L1cxjbbqX24wLofFYek6MOXLvPMI3/
 XwZ9rqN6FwSS73CkpZPTVtGKE0MUtUcp0cygTvT0tRIa8mfTZzNGjREB
X-Gm-Gg: AZuq6aK4sunyqCelpnlhj5R22jRKfs0Tf3MzHa+denChpAEGiwTYmxiBQurXyFDOqO6
 eqs2E+KqjVJdSd88+Xd+f03NZOhlu/AEH2RPpram5alq5gbIepI6uPhz3so8jxOUc++tpzKLY+2
 kES0xk/luONuerSxlKL/NNGhSmBd3DExNYHr8lBFKXNUJ3vMpI/iXtuJJKHfTDlyngbtLBmay+Q
 SI0p3h43P2KtfGOuho8RNE7R3G063nfoG18mXob7PYVIl2NpVQgPM2dUjFtcmdPC7K+SIvSWMQS
 h0HePzAbWtIjgwA1s3DNXEQsSaDoz+Uh4y+o+QmVlTJo2hNonL77PQa1VFO2jmHQbc1hIXob8Mt
 MsPeU4RNWLv9TDCR83dMMKn3/ffr7RbdsUEUZCHsnACz1Riz65tj2Cl3GqO767LompE+82ZanR1
 Osmu8/bu8qjkyxelq9qChlAHH7DkElfqMwlfnoz+63oUF1eIwwBP90a1bXDwa15vSizQZQ
X-Received: by 2002:a05:6000:2585:b0:432:8504:8d5b with SMTP id
 ffacd0b85a97d-4395fd5c21emr5062564f8f.50.1771512598429; 
 Thu, 19 Feb 2026 06:49:58 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d82sm50163087f8f.31.2026.02.19.06.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:49:58 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v2 32/33] hw/pci-host: add gsi-irqs property array
Date: Thu, 19 Feb 2026 15:49:00 +0100
Message-ID: <20260219144901.3317747-14-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219144901.3317747-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
 <20260219144901.3317747-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Add a new gsi-irqs array property to the GPEX PCI host controller.
This enables them to be configured on realize callback.

This is required to init GPEX PCI host from a static configuration,
such as Hardware device tree.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/pci-host/gpex.c         | 6 ++++++
 include/hw/pci-host/gpex.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index e66784ce51..6125b2c319 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -148,6 +148,10 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
         s->irq[i].irq_num = -1;
     }
 
+    for (i = 0; i < s->gsi_irq_num; i++) {
+        gpex_set_irq_num(s, i, s->gsi_irqs[i]);
+    }
+
     pci->bus = pci_register_root_bus(dev, "pcie.0", gpex_set_irq,
                                      gpex_swizzle_map_irq_fn,
                                      s, &s->io_mmio, &s->io_ioport, 0,
@@ -190,6 +194,8 @@ static const Property gpex_host_properties[] = {
     DEFINE_PROP_SIZE(PCI_HOST_ABOVE_4G_MMIO_SIZE, GPEXHost,
                      gpex_cfg.mmio64.size, 0),
     DEFINE_PROP_UINT8("num-irqs", GPEXHost, num_irqs, PCI_NUM_PINS),
+    DEFINE_PROP_ARRAY("gsi-irqs", GPEXHost, gsi_irq_num,
+                      gsi_irqs, qdev_prop_uint32, uint32_t),
 };
 
 static void gpex_host_class_init(ObjectClass *klass, const void *data)
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 1da9c85bce..f8e9874756 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -64,6 +64,9 @@ struct GPEXHost {
     GPEXIrq *irq;
     uint8_t num_irqs;
 
+    uint32_t *gsi_irqs;
+    uint32_t gsi_irq_num;
+
     bool allow_unmapped_accesses;
 
     struct GPEXConfig gpex_cfg;
-- 
2.43.0


