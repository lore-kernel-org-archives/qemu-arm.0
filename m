Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B64D1266D
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 06:11:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQg4g-0005nw-EM; Wed, 03 Dec 2025 01:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg4W-0005Se-Os
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:43 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg4T-00012r-7r
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:38 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso26710385e9.2
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 22:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764742234; x=1765347034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NmzdRNy+XVrnKgfA7Np3tADI6SbGw+r+ug99GdFxAXA=;
 b=h8mfNrtSzAGk+R50v6+ZsAAGFSEf53GVAX5lTIxjFQsZIgiSiZYdx3uVYpIabSXAgQ
 q2H96XyNsLshx+hhq/IFdvYHpFXjT4BeFr0f26PH6umYlLFRgYccQU1cTfZeCdbdUcVB
 Lmz4debdB08X2ehsokoeRhtNPo75XQDnnT/9Do3OkD9zhRbl95IilbBvUbjORzMW3iue
 SQXqVbDcuj1xEEYKrz/JUeYN4fSsTjaBlef8QxxGvEdSs7wCBnFAnIgrDPDp5+mXUg7a
 8YcrIRgB++WQ93Xq1pVlVcVJMe0T87NCbzhJa7FCxDL8JinixpvuOirQ/yj7Ga5PSicL
 zKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764742234; x=1765347034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NmzdRNy+XVrnKgfA7Np3tADI6SbGw+r+ug99GdFxAXA=;
 b=WFTtia+OoBuzdk4d1HPuw2OrkrkUiv9fIh+mhmcFZSpotIzAeX5EJz1Egn5D0mBFg6
 TQtW/vHULjBtt20ujrCUCJKXh3vHUB9n6Ik4jWCIJr0VNTkMRdPOmaTKHYXNCbYHNA3/
 nzkIXEczXPeVJ3OLtm1sIvUqkdScObyrtqeZhfEuj7awreKRgVVqon+J8bQ19rZZnRr5
 RiE+40GA0183rkQYs4IFLhTTznQpcPJsQbpwZiwVqjw02Q9t7tvIwOXAljvFs/Vp5KuL
 hry5Aj2TZ28g5lM4eCRvDSB1A6fItffbukFLl7Ls37G3CMdaelVWHPujXtz1fe+ECK1m
 jl/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbCvIdAregG5cb9VzxIYPG1PgzaPNYKZgmOL59bo0p8/jUnH0aBIuRQpS3rZV7rJMPRaFRV8J/WA==@nongnu.org
X-Gm-Message-State: AOJu0YzmrGZCnyeNi4hFZkRuF5dPweUbleUelW+oZgWEUyfrTkfhQ1sG
 b3tN2vrJt0aItkiPU8rD0DlYmBuy7/iwpB+s4GL/nRdswJucweJEwEBxf8CLYAlkPL0=
X-Gm-Gg: ASbGnctNyw4KnVCm5EfGIWsKMBakqpLPTeIjGuGciRbgXjY8VeYrOSUzDNqAzIregBe
 b69OIXlyw6POadeEXojrupVFOgv44wtR3aPJY5HNoJ7Qc1YXx5ihj+lHH+S20HzoWRODeh+3Qx+
 vmrcHuB+ZiHoLntaKddq31T0UrQai/+7LMi1cZiapkC89ST3Uy05Xjq2EqUOcoBphQQaqVgyfqN
 vxp/4hME0vsPLpbcu+Rp1NFfMkW0GdjkBJCQc0OftC/ugEg6BNpwcdFXCBhEk6C6T2HoesYWDv2
 KV7pc0QFUxwJL7eCMh17RYH6wc073n49doRB40wigiBEA13gO723oXLpA1ts4aQ7qUz6Cf1vCdd
 O3ZgTJMB1UzrN5TzK4W8Wu1C6KZZf6NVoqjxhiCJ5DuuDh5HbGJw6W1gSEjmE5TLbK+RCaj1Cda
 djgmdYmbJms4p+ionXzzJHYvdIIMEYpBAFFEr/RIr5aXmDEFmC5lRRY2+8m9Bo
X-Google-Smtp-Source: AGHT+IEPApft5PGZWsFPz//8A8cqjaVIx5m13oFIf9W/WuBW9rwX9Y+20LttgbfbDUMnp9zRiB+bCw==
X-Received: by 2002:a05:600c:1f0d:b0:477:952d:fc00 with SMTP id
 5b1f17b1804b1-4792aef32d7mr9426015e9.12.1764742234286; 
 Tue, 02 Dec 2025 22:10:34 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5d6277sm37152129f8f.17.2025.12.02.22.10.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Dec 2025 22:10:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH-for-11.0 v6 07/13] hw/nvram/fw_cfg: Add fw_cfg_init_io_nodma()
 helper
Date: Wed,  3 Dec 2025 07:09:35 +0100
Message-ID: <20251203060942.57851-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203060942.57851-1-philmd@linaro.org>
References: <20251203060942.57851-1-philmd@linaro.org>
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

Calling fw_cfg_init_io_nodma(...) is more explicit
than fw_cfg_init_io_dma(..., 0, NULL).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/nvram/fw_cfg.h | 1 +
 hw/nvram/fw_cfg.c         | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 7348cbfbc34..a2b8f7fa864 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -305,6 +305,7 @@ bool fw_cfg_add_file_from_generator(FWCfgState *s,
                                     Object *parent, const char *part,
                                     const char *filename, Error **errp);
 
+FWCfgState *fw_cfg_init_io_nodma(MemoryRegion *io, uint32_t iobase);
 FWCfgState *fw_cfg_init_io_dma(MemoryRegion *io, uint32_t iobase,
                                uint32_t dma_iobase, AddressSpace *dma_as);
 FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 2699e593860..079c28f9212 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1054,6 +1054,11 @@ static FWCfgState *fw_cfg_init_io_internal(MemoryRegion *iomem,
     return s;
 }
 
+FWCfgState *fw_cfg_init_io_nodma(MemoryRegion *iomem, uint32_t iobase)
+{
+    return fw_cfg_init_io_internal(iomem, iobase, 0, NULL);
+}
+
 FWCfgState *fw_cfg_init_io_dma(MemoryRegion *iomem, uint32_t iobase,
                                uint32_t dma_iobase, AddressSpace *dma_as)
 {
-- 
2.51.0


