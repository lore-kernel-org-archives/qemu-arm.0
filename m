Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E81CCD1BF
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:10:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCNBR-00056K-NO; Fri, 24 Oct 2025 15:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNBI-00054h-ND
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:10:32 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNBH-0005yP-0A
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:10:32 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4710022571cso25458375e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333029; x=1761937829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfFJAb/KcoEMKci+o785xcZsNgBjcX1J9BbfpmwSLMI=;
 b=VmufCYqd1efBaAb38BREtu2GEJlFpuByifre4YKtIvxB93VpvtNQ3p+XyvedwNqX3j
 d//YKh1Tgf+fdBrO6jwggyyNqyTfgVJ5phAkiGiyVGr8KM+X+Xdv+JX0j21HfTLD21N+
 c/5Dr5VsdZIRaJjho0sNROCk230PnheiJMkqk2Gm+0rnsQCojls8dj9xz5oDQ9XaLtg9
 PXXiFaqXvtymyCeQBnbTDhcmEjpJh4BcxPBVnq5rVHb4Wr/ny4gUFeULaHiTxz3QsF73
 IUGm+aYsCZkup3fPP8pdXQpI8+wK2YLEmaiAxjYP9AiUzYluVzew/H8xVNjuuVGMXQCW
 0tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333029; x=1761937829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfFJAb/KcoEMKci+o785xcZsNgBjcX1J9BbfpmwSLMI=;
 b=MUmt3m+l/ia+cPUQWY0SwMQk60YfT6bowN49/QW8fzHFRu0ASwOCDcbyXU8kFhtson
 +P899qO5TvnDFI9WSGl52Wk7Q8W3JT8a+Qc/voUQMpfk88sEipTPPJL+9xUhc2sKdYAR
 uSARmf1B1MWXDWZZgSj4JFlkSmkobtymcLWJZE+T29zkv8ItSGoaG+xiA6uXvIt6yxBV
 hGaBjaOCjSAUND/4wLstY/8g2gmfA7CdrI8t+c6DewPVYwgqbllxGsbtMfNXlQlDgMRU
 zd9Y+uPwANGF9fW7tnpLDOCN0hdsuPbYs5MzKoeTIoQN7qzWWjF6ysB+5JeKBl1vH7nQ
 02vQ==
X-Gm-Message-State: AOJu0YyGRQjDSsJiJeCeOnp/oH49jiwJf542cprtCjbNux9oDibA1l/g
 DErTz1vqJ1uIJQdxBSpkRApvtb5cQqs1FraJA9vJCCquQEy3a6CA2aQB5cC52x6mM3I=
X-Gm-Gg: ASbGncuojCrBfyhISKk2viZVHz6yhwFLCH2oqWO01nXDlqOjGDzaOW7lzEEFN9c0Px4
 nDxbSc+DRzTMfgQp+v8wsODn54AB4r638vHhigSJGDOo0P6cbRT3Ph5OKZVwYlSoJhYp/Zte7wJ
 l3dBWs7BG/IYdK7VDQ/jsfh/K+lR0xPYB/eB03RZuAsKjGpqgvpx25c5xa1yaFuuWFgeLb0sNC/
 SOxY3Wse9Ir+HPzzgeRI+bbK0wpyh07Q4J0G2eCFOHvVOnwo1moKO9KUtdpA5dFoSJGRCZuU0jI
 aAVa6Z3ZIzdfjPysKPk0ckP+fcKOCZgwHHzSakhMaR0ZNoaovOWhhpLBLpXJP1J+Xm3AP55VGH7
 EM0Iv/V6YONoZuFLeowrZb9QV2EaCwU+4tv/pRR21YXi3Ab5lX/HXZUriAwc8l6Xw0L5R4wHnEi
 zNk/gxKAXsSBPElNQuOnX8GlIdGq71Kp6OdH7ECDomaVulDe4jLg==
X-Google-Smtp-Source: AGHT+IG/meHJkaNRhIs7e4BzP8Y0pKzZddPA0lObwZfKmDDtc5JNXAo708iuGM3repkxV4qyozv+mQ==
X-Received: by 2002:a05:600c:811b:b0:471:14b1:da13 with SMTP id
 5b1f17b1804b1-4711787dcfbmr208223115e9.14.1761333029128; 
 Fri, 24 Oct 2025 12:10:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4298b9963ccsm9027464f8f.7.2025.10.24.12.10.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:10:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 04/27] hw/i386/microvm: Use proper SysBus accessors
Date: Fri, 24 Oct 2025 21:03:51 +0200
Message-ID: <20251024190416.8803-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

SysBusDevice::mmio[] is kind of internal. Use the proper
sysbus_mmio_get_region() accessor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/microvm-dt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index cb27dfd732e..d7f49bc1b5f 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -71,7 +71,8 @@ static void dt_add_virtio(MicrovmMachineState *mms, VirtIOMMIOProxy *mmio)
         return;
     }
 
-    hwaddr base = dev->mmio[0].addr;
+    MemoryRegion *mr = sysbus_mmio_get_region(dev, 0);
+    hwaddr base = mr->addr;
     hwaddr size = 512;
     unsigned index = (base - VIRTIO_MMIO_BASE) / size;
     uint32_t irq = mms->virtio_irq_base + index;
@@ -150,7 +151,8 @@ static void dt_add_pcie(MicrovmMachineState *mms)
 
 static void dt_add_ioapic(MicrovmMachineState *mms, SysBusDevice *dev)
 {
-    hwaddr base = dev->mmio[0].addr;
+    MemoryRegion *mr = sysbus_mmio_get_region(dev, 0);
+    hwaddr base = mr->addr;
     char *nodename;
     uint32_t ph;
     int index;
-- 
2.51.0


