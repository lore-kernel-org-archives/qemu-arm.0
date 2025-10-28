Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D81CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:36:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDoXh-0000ZZ-Ag; Tue, 28 Oct 2025 14:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoXb-0000R5-6f
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:35:33 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoXL-0004ai-As
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:35:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so3272522f8f.3
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761676510; x=1762281310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbV20QgyIxlspSHe3slsxqgoOZCxZe5hmrWfCx1z6jY=;
 b=ht6gfUrVraJDYYa0CBatWamXOspZgpNax59eNF+2RDl1ryGeVu5+1fxwbJitjTO8oH
 nvlqmWC4cTjwkl+iJ0+L0VrutYFHeEcnmd+Nog2c2JdTzscJlKUyMvR8pkuLjlLXkPUk
 kw9O1aug88IGRZ7wEqlVpIFPzkLNSxw6AFSeyIdIaymdsfKB9VyaV/K8G4aVht3TaGz/
 xRe75ZrKr/T+rqTI8jJgdkOXDlvnPoRjB11YdSDnLYwQ2bXd4mprMIALTqxrs78htQTP
 nCzw/haCNywpdTQS+/o+nWgX5YAQqjSqvYvST7G1CaeJiEvdLBhKQfFATDPsSdHFGSgf
 fiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676510; x=1762281310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vbV20QgyIxlspSHe3slsxqgoOZCxZe5hmrWfCx1z6jY=;
 b=Ca6t3acbZ2vq3xFaWZBNOGK6UfFYVY+BYf8JBZyM4h2t9vkwYi7Kvpc0HQKzNxea4J
 ASc5ma65K0zs/1mYfG6NvJ4DwKQczx4MXbcJ+9TWaFgcRFm4mZAOdg1KB5SVcX/WMmD9
 ncTKlL2B5pF4CXcA8Td1cDSS+QOz489R/L7ZYh51UFHDm84k9A5qmC7bVcWvdrRRq2Jp
 RO5BTzPjFxA3L5socTdgMCrbTUNFthOaFqw/WzNbAu+W2UP6uzIMFBkLADJkM4S8Ctvn
 EsMpDKHjiT008tfEe1k4C+fgMwDrJ4O0/MuPCM+qcPYTlo/1batzUJlUpy08xhM0rNTl
 nUNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWirMmLYXCGkcgub+XQWKtlhQ8OMNa3r6cpPe4T23FO3FOv1vsf35h/OmzwLwN5/Mu7jNQhsQc7Dg==@nongnu.org
X-Gm-Message-State: AOJu0YzA2sgvdQrKHwoOX/2JQX7aT1R5R7KcoPou2LdI3Yt6Ejn8VR2P
 XjlmwpCREnOXJATsq7uOEFcKK0hjuJ21tkjujILDdpXq9+/snzw6dDJPqBzKbR+qw2I=
X-Gm-Gg: ASbGnct8ea238zA5HBf3BCkexApOaSptXnpvtCUkX+nlJr47CsXttosAPcJ9eOBI2X9
 qEeUneNH0eSAzhHPmJ5WdqOrwulIg83oRqAVBXnDKv3Kp2BY160PHDbGoWo8Tm71PoF7XP3wbIe
 fpsoBhqb3Z4xfHEUhk3PJsd2GrVCp22VWZ5LBgJ7wTZTMxRTVsiojv4XLVG3d8Zzp7tjG1YclQR
 E/5RgzpXkzx/uEPSrAt2EdND0BP3XAG6O1UDA9aCPEGuxlBSHWGe0y0tcZrMBNsR9i4c8qn50IM
 EIgpmZVfah80fmTQG9xQboMyd+mF5GUrPLgne1QxhNbCfy+Hp8KLFszS9ZGPtCivlWmbsD1sh+s
 Jdf069BG0BBuaKh4IIUoWfBAGlyWV3TTz1HDyrigmUN89BjfiX5zZ3mduTT//rXat8RhZvdfh0S
 f9nppBTGCvk3uM96lzlGafbCC3s/tBaGrJg5rlvfF1aLsD/zQ8Dw==
X-Google-Smtp-Source: AGHT+IFZvJ9NpojrZnUC56Rkdt1ACx7aQJVJlyE1/s6DyXLlTiXnLMfxQJUA3nNkIlmy15bezLbfdw==
X-Received: by 2002:a05:6000:2082:b0:3e0:c28a:abbb with SMTP id
 ffacd0b85a97d-429aef77d9bmr77676f8f.13.1761676510363; 
 Tue, 28 Oct 2025 11:35:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db9d1sm21375687f8f.35.2025.10.28.11.35.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:35:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 19/25] hw/pci-bridge: Use memory_region_get_address()
Date: Tue, 28 Oct 2025 19:12:53 +0100
Message-ID: <20251028181300.41475-20-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

MemoryRegion::addr is private data of MemoryRegion, use
memory_region_get_address() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-bridge/pci_expander_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index aa55749954a..0cb94fca9c0 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -161,7 +161,7 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
         MemoryRegion *mr = sysbus_mmio_get_region(main_host_sbd, 0);
 
         return g_strdup_printf(HWADDR_FMT_plx ",%x",
-                               mr->addr, position + 1);
+                               memory_region_get_address(mr), position + 1);
     }
     if (main_host_sbd->num_pio > 0) {
         return g_strdup_printf("i%04x,%x",
-- 
2.51.0


