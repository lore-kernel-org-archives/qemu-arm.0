Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp427007njb;
        Thu, 8 May 2025 06:37:25 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWaW1OT3rqrzkE7y8MSqbaqIsbiyhck5M1w3yARxWVqUIylUH4g99Iers+veD78V09QprDhSWMU2m5pLA==@linaro.org
X-Google-Smtp-Source: AGHT+IGZkv6ZULe1V6Q6qRgJ0u3rFyxDLwTMs3FgfgmSqY8c7izPlxfjEQUC7oNY9tBWCGJi5pF3
X-Received: by 2002:a05:6602:1546:b0:864:4a66:f4df with SMTP id ca18e2360f4ac-86755046e4fmr497157039f.6.1746711445466;
        Thu, 08 May 2025 06:37:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746711445; cv=pass;
        d=google.com; s=arc-20240605;
        b=iw026Q8XfEEZMrDKLCUjvfcnfbrNmIW8ok/jupY2UGbjOuRU0zLExXBjviDMRW1R83
         qlxqBYbyvQdKxVQbsLdmQtVxqFNkt6QYUeJJxbmwHlRjxFBbsDUsFelfK1SumodbquVs
         ubxH6huzbmIYZBues5pR43ciyGVkJnDvCrbJyqgKa+KNhwhvXnWQ/kWsGpb6i+zeR/wN
         h386KlpWDpVrSPuHbwxFLIxy1R/LLtfxMMvpKaIkawqXctx+sJqf+Ee0sQjbofV9R3VT
         BLz5sl6nEsVPCuZs/5mY+3UP04E2xGF2ERFtb6g3YVPAm2d7UlACve9Hm/dIvdAuWm84
         On2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=5TBd8qqudhdD0Z8zjZ7s78pINlfboYf1Urx2r0CkJAA=;
        fh=S/FqLe2vHDLn14zC0EHFFUTQ6ME90dFNedR60yh+yhQ=;
        b=HhqS0azXmRkvoupFAj+zZ0672ABaB/1EXUowi5KqMHXX9ZzvUt+5/0f5Fwj+sodTDi
         4oOgVRXN8+fR+/Oiqyp/07SWQMTSCFJLjit0o7+yOUsrcFX+j4sdgO15t7cy8t0MQcY8
         LsdCG/P7rf0Df9aLlIznaLEgiuGvm1ETB5HjqqUjUjCsnn0pW64BexIeoTBBGPL0lwL3
         yDhflIuArB4h4Xgg7x4ShOWwpcI77/4SZH5/3IhsRrB/8hLgji+vI492lrI4+E63tiTY
         NM+adfOpw+t5HWSQZgCIhWxaIZNLktwOS8l6kJGsTOorXIzoiVJ6NtU85RHv5eOyvVGm
         l1iA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMF6b0WH;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45862-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-45862-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-45862-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id ca18e2360f4ac-864aa3141acsi1544530339f.49.2025.05.08.06.37.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:37:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-45862-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMF6b0WH;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45862-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-45862-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DCA14E5081
	for <alex.bennee@linaro.org>; Thu,  8 May 2025 13:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CF2227B88;
	Thu,  8 May 2025 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMF6b0WH"
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343674B1E6D
	for <kvm@vger.kernel.org>; Thu,  8 May 2025 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711440; cv=none; b=aWyDvpFlMex25GozlGkfVLj54G/9iEA7RSYN6xkdWorY6a0U64FetDC6RPnZOwdiqljPRXEongmsjqWnCEJuwaeK/VcqhFYm9JzPZ/aWjZq2ei8xzLHhf6fwPCEAy0+/TY4k7Yn59FYtZMFkbWE9E810358mmzsrq9DR8YOd/Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711440; c=relaxed/simple;
	bh=Ip+XC1IM4OppH/75D6wFI5DlA7RTCE1tphZa9V1sEeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lr4Y7EXjA1Su05QDxE0aA1HUudTD1RtF+dtRgrYV7RxDgOON1DyR4EU53lUqycdQcPE+sBgjY/olFnSg7BSDeOICVUjnx7AhWPyuIC5qIRt+UQdLb4dJaKb/ac6HgwpXu36N45BWjjYfJz4Ag0GCByZAm7XjoFYAcLBUGG4yV8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMF6b0WH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e8461d872so10227155ad.3
        for <kvm@vger.kernel.org>; Thu, 08 May 2025 06:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746711435; x=1747316235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TBd8qqudhdD0Z8zjZ7s78pINlfboYf1Urx2r0CkJAA=;
        b=XMF6b0WHLk5EGQ2/xv1m1ad0a5mamPUpJiI7ZFHBjeafcPFCBI0wIlRvMQBxJubNR2
         UHCPl7/sOKcHoAJid/j7+GpjAEEjB7OJY3Wv6iuEjcCdb7WCJJawE+Qb2eVdmsZPoLbn
         6WbgNPC+MFajR5krYtopsFi84NL3vCeUYpcg/ddf/HyvTxKofcoL4PXcgsxSvHgZATrJ
         7FLWaFzeVxAje9dxcndvHSHZNfwSF71Amp0aNSwZ8ckwpMTiRkp9KlZnxMlpgfpdWMAZ
         LsQFxAX2hc+5oSSl3MFTOu2I7nOWmaDRDmd85pZvdqhn1TLfvq+y0uqSh54sTAxkIkhE
         XO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711435; x=1747316235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TBd8qqudhdD0Z8zjZ7s78pINlfboYf1Urx2r0CkJAA=;
        b=BpKj23T6zlqeh7K2Tkr0X2kj6sEG0BxFLV23JofixkxGrsZWzt36s7XMbI1Q17Ribf
         2CpKP7Tx4V6yOJqsbVcep91XG97E70uwqk085sg5xNyQQuKJFOStOQ5DJ+ce7ypsm6tV
         OOBox/AG8BJdEHuSN4eUAKgntql3u+mmdWqmmvjLRLqHxqeDiiEGPSU5ml4qwUK6OPQt
         0dHRH+YNZfmClkYnuNxFhvDvRZtT+CR7p4Ur7YEIYjyTm/X3Tj/qitx5mqmyymcTNodu
         NStbKY+lVZuYGdOCKz68EltJFV0IuI+nFZJcxKsc3uIqTBKaWaXoJ1X8YpaZciZGbJo7
         VstA==
X-Forwarded-Encrypted: i=1; AJvYcCXqev9DYsc6g2Qq1Vp1iTWChtUgyRzhNfLEybJbUWWM2z8Yjhob/iWkzpFhcpAgzdWA4UY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWG0GZlZTnGZGcfa/dJCt5ghkVKAJpa92eXmA/6ja9vZP416/5
	yCHzev8xRLiKaALw8PdVg8JN0R39ZRjClTpweF651PirYmNtx0hIgFSWbFPgm8w=
X-Gm-Gg: ASbGncvMWp00k2oSXeiiQ/fIPjJ2M0IEqtM/m0o+dkV0D/rgLn6I78du4/4FcaN0gpu
	FjdC9NHvOXbMeFea4WtG43vUR/gQY8A7rjv1TXemDnpIebjhJfNyhUChCETURvNJfrE73muvjSr
	10edukB26UPcTZT/sbeBN2/HbBKrLlAnJuEqTwbDvkDqt3Wrh9cFnm03Ouew9J4E+p6xRQAeId+
	c5y3frqAE1y7CMWMD1H69dxvJ/LaIdZgJFVY6mMZzuR5YWceEsrDPedNGrLXTdm0ILNrhf3L0B3
	gSNRgD2ZPxCg1k1Pt2/8jXU23M3U1e3fXV5SgbuVeCjGOAys/boY28igBpkxwNn8MMMe9fVGeYR
	4UOqYvnxdWlzMauVN6JRbUg+How==
X-Received: by 2002:a17:903:440c:b0:226:5dbf:373f with SMTP id d9443c01a7336-22e8560ce56mr54655525ad.10.1746711435370;
        Thu, 08 May 2025 06:37:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fb4asm111932715ad.113.2025.05.08.06.37.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 May 2025 06:37:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	Sergio Lopez <slp@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yi Liu <yi.l.liu@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-riscv@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Amit Shah <amit@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Helge Deller <deller@gmx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ani Sinha <anisinha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 03/27] hw/nvram/fw_cfg: Rename fw_cfg_init_mem() with '_nodma' suffix
Date: Thu,  8 May 2025 15:35:26 +0200
Message-ID: <20250508133550.81391-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YwSyiUfHNAsC

Rename fw_cfg_init_mem() as fw_cfg_init_mem_nodma()
to distinct with the DMA version (currently named
fw_cfg_init_mem_wide).

Suggested-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/nvram/fw_cfg.h | 3 ++-
 hw/hppa/machine.c         | 2 +-
 hw/nvram/fw_cfg.c         | 7 +++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index d41b9328fd1..d5161a79436 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -307,7 +307,8 @@ bool fw_cfg_add_file_from_generator(FWCfgState *s,
 
 FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
                                 AddressSpace *dma_as);
-FWCfgState *fw_cfg_init_mem(hwaddr ctl_addr, hwaddr data_addr);
+FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
+                                  unsigned data_width);
 FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
                                  hwaddr data_addr, uint32_t data_width,
                                  hwaddr dma_addr, AddressSpace *dma_as);
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index dacedc5409c..0d768cb90b0 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -201,7 +201,7 @@ static FWCfgState *create_fw_cfg(MachineState *ms, PCIBus *pci_bus,
     int btlb_entries = HPPA_BTLB_ENTRIES(&cpu[0]->env);
     int len;
 
-    fw_cfg = fw_cfg_init_mem(addr, addr + 4);
+    fw_cfg = fw_cfg_init_mem_nodma(addr, addr + 4, 1);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, ms->smp.cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, HPPA_MAX_CPUS);
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, ms->ram_size);
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 54cfa07d3f5..10f8f8db86f 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1087,11 +1087,10 @@ FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
     return s;
 }
 
-FWCfgState *fw_cfg_init_mem(hwaddr ctl_addr, hwaddr data_addr)
+FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
+                                  unsigned data_width)
 {
-    return fw_cfg_init_mem_wide(ctl_addr, data_addr,
-                                fw_cfg_data_mem_ops.valid.max_access_size,
-                                0, NULL);
+    return fw_cfg_init_mem_wide(ctl_addr, data_addr, data_width, 0, NULL);
 }
 
 
-- 
2.47.1

