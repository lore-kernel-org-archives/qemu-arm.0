Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B48D116F3
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 06:12:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQg43-0005AW-VN; Wed, 03 Dec 2025 01:10:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg41-00058y-QX
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:09 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg3y-0000y7-N6
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:09 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42e2e2eccd2so2390085f8f.1
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 22:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764742205; x=1765347005; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AUczG/p4f5yoluuGUkVYvQx6mSQhYMxYgU12rhZJcv0=;
 b=OyB7u95WC1p08b2iWJa/gwYrnhtr6EZ/LD3OBLkjT45Mm0PM/5nUybP+vAhhzpdjjk
 UuEWEVIunpLmIn/WHnbjYbfIQbDpbSzBxWQaEEdKiq5x/MtBFHvkYk4bN03XyMs+O6i7
 RDPYYPA4e/nhysntzDbKWaolA0y46kmRPznJkCTR0cNsBS/d/ySXp5IhC8S2LJpSK7Re
 ViQmOTSGN2C6bFFwLbEUwcHsXSLVUG125+dlM6wccTMiFHJJ+ZMhlJuewjE2DVRhayAu
 Jx0jLDHu7cIIhiQoGcPxW+Peulw2hSe2hDegLHvV+Pm0zO6/VWjUiGvASUMRkVDuz/Rn
 3QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764742205; x=1765347005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AUczG/p4f5yoluuGUkVYvQx6mSQhYMxYgU12rhZJcv0=;
 b=A9kw7oN510a3dHHh2Zao8mA0ZJaWqH9GqAkANLG/JfLYrTL5WkDCaLIOYT9mieQOWy
 vZMAxntkRO8NtHVmES7HL1Fh7qHV+qdd889l0MmxjVpcBSpJRREQtqqxDp7odgiMuFSz
 ZcCU5r6+rdcQX3xQv5C0t2AVtr/AR9EV/xDFv1sRuwus997nwR6JtFLaKUqFLT4pnqyR
 5ofj8xa5PhbZjS4DwKNyvTYaEUdiQHql9OO0hNdkVQr40rcjhgUKp8xNieAKuFJGo80P
 ST0JOeYM3yQK7no16SleFnJtlqGVm+U5Do/Pb+C3OPV2epLorlX3afeSKi06Dv3h00oN
 vs6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6MHLC16YNzp5ZIkiO/9hF3ALZf7Mfyk7NI6yIbk4HHOdOn+lSaQ2cKe3Ye/l30Pu1yiD5ygOdcg==@nongnu.org
X-Gm-Message-State: AOJu0YzsZWwhcSDxmUYMvKsi6g4+gZ98l+9LKIh48N327BkONzBixJZ3
 dxLNS0RWQps4v7x1exRn/peg1V4OUuftDduEmV8Bl948Y50ZT2hD0pdahgdEZD7aeTv1lKJIuFC
 r1Q2z3nA=
X-Gm-Gg: ASbGncuG5c6de+97Jfuy48fO8D0DpnSq1x9AIkKfq3uzSTcT6jqd5GAcNUtK8E0SmXY
 crEAKBBcDswrYXz7IAQ064BTpagav0PdKLm/ii3JyBMnK4k+BH2CNpEgdow1kVDFoWLZhJOLbpI
 9SQrLw6ZGph2Fr4WO5cIAy3JkY7GJPfyttSnmQ2+j97XgrVRtKvggETv4Ty4uBaIwQpyVny/SxY
 w9H2bkvptSOllDjpVtjsdVfkqTT1Vz0WYJQ3mBvUlBaEPS5Fr1h4BEnCHyCYaYidpdpV4/Bqojd
 2v5PSpZEaP9NE7QleZ9Gh6ea7RnILaIy5v/3PG1gHWM+wcXrBnBuXjGFMBHO9G8E5S0kI7YOLRv
 dDSvznBZgbHOsSg63sGydMeVkFXtN2y4ccrKT/In9dnIHSmraBB2+/xJP+mgEvXkBbVnayQcete
 vayFer191Io4MjPienTRhvNOaf2fjYImfcs5mG6o9wTGWIxkKkyEOVfQuBvJdm
X-Google-Smtp-Source: AGHT+IE22k9yxCvZOYe9YhjyN+DdWq4PFkHWWGEu8Y8vIYjFFLKFYQp0V3g9ZFALoeQ4/kScq0zoog==
X-Received: by 2002:a05:6000:40cc:b0:42b:2e39:6d58 with SMTP id
 ffacd0b85a97d-42f731bc534mr726343f8f.51.1764742205225; 
 Tue, 02 Dec 2025 22:10:05 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c304csm36722072f8f.8.2025.12.02.22.10.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Dec 2025 22:10:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH-for-11.0 v6 03/13] hw/nvram/fw_cfg: Factor
 fw_cfg_init_mem_internal() out
Date: Wed,  3 Dec 2025 07:09:31 +0100
Message-ID: <20251203060942.57851-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203060942.57851-1-philmd@linaro.org>
References: <20251203060942.57851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Factor fw_cfg_init_mem_internal() out of fw_cfg_init_mem_wide().
In fw_cfg_init_mem_wide(), assert DMA arguments are provided.
Callers without DMA have to use the fw_cfg_init_mem() helper.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/nvram/fw_cfg.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 2b8715679fe..c65deeb7c38 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1054,9 +1054,9 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
     return s;
 }
 
-FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
-                                 hwaddr data_addr, uint32_t data_width,
-                                 hwaddr dma_addr, AddressSpace *dma_as)
+static FWCfgState *fw_cfg_init_mem_internal(hwaddr ctl_addr,
+                                            hwaddr data_addr, uint32_t data_width,
+                                            hwaddr dma_addr, AddressSpace *dma_as)
 {
     DeviceState *dev;
     SysBusDevice *sbd;
@@ -1088,10 +1088,19 @@ FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
     return s;
 }
 
+FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
+                                 hwaddr data_addr, uint32_t data_width,
+                                 hwaddr dma_addr, AddressSpace *dma_as)
+{
+    assert(dma_addr && dma_as);
+    return fw_cfg_init_mem_internal(ctl_addr, data_addr, data_width,
+                                    dma_addr, dma_as);
+}
+
 FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
                                   unsigned data_width)
 {
-    return fw_cfg_init_mem_wide(ctl_addr, data_addr, data_width, 0, NULL);
+    return fw_cfg_init_mem_internal(ctl_addr, data_addr, data_width, 0, NULL);
 }
 
 
-- 
2.51.0


