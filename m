Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4CAD1266D
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 06:11:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQg56-000737-Kn; Wed, 03 Dec 2025 01:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg53-0006vH-WF
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:11:14 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg51-0001At-7E
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:11:13 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477b1cc8fb4so38702765e9.1
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 22:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764742270; x=1765347070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=46vnfSxGy1j6e0vUyHlJU/9mdbC6bpVvSwQgBjgZ5ZI=;
 b=k/nyHj2BkUlWnN/gtgSqGWn1h5p9lff32E6voN4cOhTAZ23X+EeV8gMnTcAUMACf11
 odwG3vuiQMNfh71PaXByCOAuFjrmrxcQ6K6eQcpUOJuUpUDCfO9ZahXKFygVyS7usykZ
 tJysK+K/idmCFUu+JU/OmJGoDCF+GiBlF1i4qPTRHpuzN3ZxKCnlFm+W0J6GoGfOkp+2
 iE4Ho0QEExouA8kqINtS2owyB3H3/Iv6q/rSHN9d4X4kuBUvsDtGJuuKAri0g+y/iatS
 cmbQPOmRxPkGH4LK8CiIcZznGmjRsdjqvMUqvWsBEdhr+Eg8I9xMy2BxtK7KD7EyAG90
 4bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764742270; x=1765347070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=46vnfSxGy1j6e0vUyHlJU/9mdbC6bpVvSwQgBjgZ5ZI=;
 b=caEHuBk5WxACksMI/SWIFcbQpT5R4rVEZxgmu73yALMLs/LfOX6g7REVUq8pwxI6Tb
 ux/O4Bc1ajIbBxDhWy7bMR/2dbqWeXld4V2fs/JWfIMkMHX7Oi0ddj2SpKpKbK3rhaJp
 J1aQcjqEOcijOmFeMXKnPA6nxcgzt39/Ss0UdufWLcwj9+84054j+egdM1Ubxh04AJ9v
 KV6md1rMIQvpBPyiaYHuuNhixfPB3L5OHewJorYXMc23ScYB2M1LhLzkUBocoMmEpEQS
 20ti7D7BbBi1C1WHsDw6EdpmiyDOXoh8HzLO+/QFhsPWsKyLcm4p9iZBMbdLSfTm12GT
 NS4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvi7TLIWSIU4/+qGDAgcnsE0yRDaPs7votZ/9NziY1LiopIna8PvI+zPDl1y9RqQhl+8bTkD+t9w==@nongnu.org
X-Gm-Message-State: AOJu0YxL6zcqhmGyVRz1YbKfrdkY7Qr2iMoBtbXHI3Rr2PVKs+v6L1JA
 LLXM8yl0H32QmlCDhif7T8oXL/ndouriPl0IrpUYzlVeTKXpoaf9eDwUYr4JHBlhG9U=
X-Gm-Gg: ASbGncvUp88AugCOrKitK94lGExo5r23qF0sAL9X4zdhQv+CopUwHokWSOQJQS1pMHj
 tQMqiRDL37Ci9Vn1ezd6dzG40UILGQX5jP1TFgWOlqmolLbQ60Rm/cNjtXiQnUfe+hijuBoqB2N
 cY6G/xnhOM8lw5iIB7Z22AYmMOYnUHaFjnrCgUwXy6Q9TRTWD0PC1D5BX6MCsvUT8taHLNryU4Y
 9jF8h3agfrSTgtERhAOI7FTe/Y2rKBLJhnHzIJUDEqhS2DuUkoopJdYhzqpTR79tM3+aF7q+E+7
 fqFbrZPMSkf5E4xmttDefO8lEIZlbvseWkW3EHLQ2AiaC+YVx+XPfaqSQ0ron5NVFj9GuwcYdjI
 bmRBEw1dQ+VPUWv6muUjGKzyUR+xwGSNQaytjk0NEYMqp46zY27vSA0PiXAgo7062s6g9CCFqdy
 lJef8TYnuQwHKK/VkvaR4d3EvBffcBNg3bS0YYe3BW+ulR4jOHDpu0jHZZv4Zj
X-Google-Smtp-Source: AGHT+IGzIDwCTKOLlr77oNq8MxfixjC7xfMHSOwbndl59QPqIUvmZvz3PAzc9CbmGpRB+GWaMuMioA==
X-Received: by 2002:a05:6000:612:b0:42b:5603:3ce6 with SMTP id
 ffacd0b85a97d-42f73173debmr899975f8f.18.1764742269796; 
 Tue, 02 Dec 2025 22:11:09 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5d618csm36471747f8f.14.2025.12.02.22.11.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Dec 2025 22:11:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-11.0 v6 12/13] hw/i386: Assume fw_cfg DMA is always enabled
Date: Wed,  3 Dec 2025 07:09:40 +0100
Message-ID: <20251203060942.57851-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203060942.57851-1-philmd@linaro.org>
References: <20251203060942.57851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

Now all calls of x86 machines to fw_cfg_init_io_dma() pass DMA
arguments, so the FWCfgState (FWCfgIoState) created by x86 machines
enables DMA by default.

Then 'linuxboot.bin' isn't used anymore, and it will be removed in the
next commit.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/fw_cfg.c     | 1 +
 hw/i386/x86-common.c | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index bf38338fb47..528862d2e33 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -226,6 +226,7 @@ void fw_cfg_add_acpi_dsdt(Aml *scope, FWCfgState *fw_cfg)
      * of the i/o region used is FW_CFG_CTL_SIZE; And the DMA control
      * register is located at FW_CFG_DMA_IO_BASE + 4
      */
+    assert(fw_cfg_dma_enabled(fw_cfg));
     io_size = ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr_t);
 
     aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
index 1ee55382dab..e8dc4d903bd 100644
--- a/hw/i386/x86-common.c
+++ b/hw/i386/x86-common.c
@@ -1002,10 +1002,8 @@ void x86_load_linux(X86MachineState *x86ms,
     }
 
     option_rom[nb_option_roms].bootindex = 0;
-    option_rom[nb_option_roms].name = "linuxboot.bin";
-    if (fw_cfg_dma_enabled(fw_cfg)) {
-        option_rom[nb_option_roms].name = "linuxboot_dma.bin";
-    }
+    assert(fw_cfg_dma_enabled(fw_cfg));
+    option_rom[nb_option_roms].name = "linuxboot_dma.bin";
     nb_option_roms++;
 }
 
-- 
2.51.0


