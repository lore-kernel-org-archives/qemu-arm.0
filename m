Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C21D1266D
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 06:11:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQg4e-0005hG-DS; Wed, 03 Dec 2025 01:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg4T-0005Rm-AJ
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:40 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg4L-000125-RB
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:35 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42e2e3c0dccso1963411f8f.2
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 22:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764742227; x=1765347027; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JVXB3iRjkS/JqWijITJpgknPo95A88NyGKC2Fvc8rOY=;
 b=d7gmmpL8KutWywFMZBw+T1uxQfOvoPExh5YzzW49dNyb/QVRyZrjeu+hGRmxnqACSb
 zyhabj/VE6unwwkv3vyc+vWtp9BFxUwPlLx+qDliyDI5A4947J0PsqaCnOSw6EXIDk1M
 hJGPYRVG6nMjAtVZmdA4I3kaAJSjH43ycUFyY0V1LPxd3qQur7d8RIxYceNxSDYiEuUB
 6mmozPyutCsgOqmnI5Oo1lNwskDI8EEcmoJefsmFDXqgT8C26e/DZfKTEiPl2J5XgdDi
 c20a2DTTSThqfUg+DumpWZHldL5rhlVe3UozRgBw0aX/vdNiVecO8puJou9rsqHXQAnw
 Sv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764742227; x=1765347027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JVXB3iRjkS/JqWijITJpgknPo95A88NyGKC2Fvc8rOY=;
 b=eNhwxIOD8NU2EffeEIJDFrRGcJvPepkLI1/1n+oBxJ16hJYYQdN1mkZ0gqC6msZj2J
 55cmRM75fZIEjEfwP2kkFfvK7vXdmqS+iGsAyB8ofVR1giz63qUYPiuRkxSdusEt5VkH
 iCYtw78A+OJ5ZwagIoy9nD+WGR64QpkJCCydib7ZRVG/EDxePfd24iLqpVGt3xMFbNhB
 MPmXPxXgFwYDoOnqqZkCzRp0wfd0X2R7Gq3k0r5nGtseD9xCzFLhKnB7B2wa0y8sNr+i
 Uq/guPYD9+gx0r1J+HYXM6cYiZu/J4UgReSLAisa+WWhSxvcoDur+jL3g2NdONRhRvi6
 t9YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Q9SYtzqc2nK3LlTeHxeRNrYCLph1Hg++0p8DmTy2cpBllZ8NHY6x6ZGi2eJXqRQwJU3Dotr5Hg==@nongnu.org
X-Gm-Message-State: AOJu0YyRhC+jv4bNCMzTuoJnS3ZJunY3OtPZ8+Y3Sa+l8HLAP2P1cIKc
 Q9zb36/W/bdLjy4LlQOC1irsv8R2Z6iUx3Nelm73OiK7inGvkTWlM9yS1nOyK2DRn3k=
X-Gm-Gg: ASbGncubZZ4WrbA0OAIpplI9FN8Oj4V0wf5VLkmkbAX1MQmRpBi5Hamz1Ef3Pl+o3oD
 z6zrCU0J6SrkOpEqKkGo8WSo0W9SZGQIahs4AVpXJQvj2zSTdK9H9oF9luuz8I0/zKsKAHe5FD9
 0Ro9h2aqIANHEDAv/C0rpNlEMuVZzoEVQQ8/ZImAs0Ays3iuiHhXeaGSqF3Yi1j6NDf14XthJgr
 E3UyQrHgJH3UcjFoQj5NE9ciSfzTfag4oXBbvUB+0j86K38+7LTu6k37HyNatrXn7uPmcCg+rpb
 h1QV7k0UnVXNCj0rZ904rJuKKwO7zr6tom8IP2Z0OLZUEJYtqF5acZ7+Rlk2hR8a2DkrSvg6Lpa
 hWV4TqFIzaZZe0rxukOjiVNV5wDEyisg9h/qUR0G44fXSgBqzcmDvtf9mpMYYhkaOfdD1x4QBQc
 Jlyodp3WPwAv7uh1kBGKboVn+xo6REx76GvhWOzNSfn3XksfSta+9RtGBjQ9K0
X-Google-Smtp-Source: AGHT+IHwBGOUJJmGg47LMcX4Itx+dFea8UbTf5C3SnGsCjzHfNNw9xAGFgYsn7layyaV9ofxhYknRg==
X-Received: by 2002:a05:6000:2504:b0:42b:4177:7135 with SMTP id
 ffacd0b85a97d-42f731a2fc1mr770032f8f.41.1764742227111; 
 Tue, 02 Dec 2025 22:10:27 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c3c8csm44612355f8f.2.2025.12.02.22.10.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Dec 2025 22:10:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH-for-11.0 v6 06/13] hw/nvram/fw_cfg: Factor
 fw_cfg_init_io_internal() out
Date: Wed,  3 Dec 2025 07:09:34 +0100
Message-ID: <20251203060942.57851-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203060942.57851-1-philmd@linaro.org>
References: <20251203060942.57851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Factor fw_cfg_init_io_internal() out of fw_cfg_init_io_dma().
In fw_cfg_init_io_dma(), assert DMA arguments are provided.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nvram/fw_cfg.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 34d7d107678..2699e593860 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1019,8 +1019,9 @@ static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
     qemu_add_machine_init_done_notifier(&s->machine_ready);
 }
 
-FWCfgState *fw_cfg_init_io_dma(MemoryRegion *iomem, uint32_t iobase,
-                               uint32_t dma_iobase, AddressSpace *dma_as)
+static FWCfgState *fw_cfg_init_io_internal(MemoryRegion *iomem,
+                                           uint32_t iobase, uint32_t dma_iobase,
+                                           AddressSpace *dma_as)
 {
     DeviceState *dev;
     SysBusDevice *sbd;
@@ -1053,6 +1054,13 @@ FWCfgState *fw_cfg_init_io_dma(MemoryRegion *iomem, uint32_t iobase,
     return s;
 }
 
+FWCfgState *fw_cfg_init_io_dma(MemoryRegion *iomem, uint32_t iobase,
+                               uint32_t dma_iobase, AddressSpace *dma_as)
+{
+    assert(dma_iobase);
+    return fw_cfg_init_io_internal(iomem, iobase, dma_iobase, dma_as);
+}
+
 static FWCfgState *fw_cfg_init_mem_internal(hwaddr ctl_addr,
                                             hwaddr data_addr, uint32_t data_width,
                                             hwaddr dma_addr, AddressSpace *dma_as)
-- 
2.51.0


