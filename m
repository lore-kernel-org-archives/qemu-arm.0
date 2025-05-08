Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp427451njb;
        Thu, 8 May 2025 06:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV8zwdN3QhspSy8yYdSEMtoKo1LIy4LVxHRuokC7wG+6shHnKEua9Rn2rZesUzG9lvOqhNsmL1WcXzWQA==@linaro.org
X-Google-Smtp-Source: AGHT+IEel2BFn34hx/g1HXBxoyqa56F/fLexYaXNxbSBFigAAE5uHilCAIIp41mg3M0PRmk2ka33
X-Received: by 2002:a05:6102:4b83:b0:4da:e629:58c5 with SMTP id ada2fe7eead31-4dc738a9708mr7125838137.23.1746711484367;
        Thu, 08 May 2025 06:38:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746711484; cv=pass;
        d=google.com; s=arc-20240605;
        b=TMxnV3XG21/aUANsp9/D69uIRTj6+627bAOWbE+MDnc/xAIJjbdDNl2cBQwx1eoOHs
         03vCsqttwpfkyHF0sv0tZu8hsfZUkSNRY4/xQeuK0xosNzel9AdiwJDU6+BFXGBO72nR
         HXZifOVoGf2uzbD1aEaNFWjyIoP4u68KubitK1jfBQ1XbbdxbSqeKfogbyl39S07V5Hx
         7ok6s3HirTv3za2J8p4WcmxYjznxe9AB/XiUMeSPRxB8DgmuBT2qxkRDPL1mx2H2Birh
         lvB/C5gZcIYUu9djiqgq8r72Ot51ghTvkJKJ/Nap+xJlPP+FQcW4EW9fmc7SMiUzl9Oa
         OyDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=WY7gSBXT6cR7bWSaiDRLSHPRiSnEJ0DiKBMO01arpK0=;
        fh=wT9dNJfxHd3XMB6SokS+akuNR/p5Jxqo6k9mfLAAYCs=;
        b=ddQI7R1ghXTXl9FY3RvYYY2Z9IayLux/pZvLlIIOJSLRlsPkFDO0jRim5pf0/c8E+Y
         o9czXj5Dx+QmkTr3m30pkC6/3bQEivroqThgoHv8IVe6rVQ/n9ixcUC1fuOd0xT/poH8
         Ve2ty6v5hDoJoW8aPaXziMT3+jRSSL4MwbhwM1gN+wBCG9yvVMYSYMLU5wN0Pg6BVmot
         xLpHQE0XYCNYHGTCOqmYHa0ax68agGdYCBVVFdLKAu6LWccVBPpH89MzDrvMxCpcjhrc
         QvkOHA5bxi0AlTOa29JsN+f/LfWgWZzpp5zs8EcwxIm7Vsh/OZW5V5YiP1UYne1T37gC
         qipQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E8XsAVB7;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45864-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-45864-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-45864-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ddb3513415si404368137.345.2025.05.08.06.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:38:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-45864-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E8XsAVB7;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45864-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-45864-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2676F4E5733
	for <alex.bennee@linaro.org>; Thu,  8 May 2025 13:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDB122A7FD;
	Thu,  8 May 2025 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E8XsAVB7"
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8E084D13
	for <kvm@vger.kernel.org>; Thu,  8 May 2025 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711480; cv=none; b=cANl+pnTdNGZWUaIyrX0cuO4sXombeSe6UAgzgCL7nsuBnX0ObyR1n44wkmtQQDXiHYuoh6WY9K84dbQwPU1goEmxB3pzT2FVtZ5IadU731rW+2Nt6ZrcKoM911ms4RD2mvBDAZlYhy7Wm68FJxoSG1jjC9lC6qXlGpEXLYLQcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711480; c=relaxed/simple;
	bh=BTjJ3I/zeSUs15qCjKHTCRdYiArqeKsZs21fhzK7vkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dgbnsSM/nmNTsEucsWKfwI5kxP2f4aEyv/vdiK8ZIzPWoykSVV20KreC9GuyUx+kmvsWXtThkuZ4IZPmwt6lae+JWyAAgjIhGUMGremGLTRkp1rbp7cPjJOxNJaCNJIz5fFSohkjGmq/BTsf8jWGeQnDLmvlX13ZYyqq8U1Q51w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E8XsAVB7; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22d95f0dda4so10850295ad.2
        for <kvm@vger.kernel.org>; Thu, 08 May 2025 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746711478; x=1747316278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WY7gSBXT6cR7bWSaiDRLSHPRiSnEJ0DiKBMO01arpK0=;
        b=E8XsAVB7I1IXUvU6IlevLw2DtaxxTxFe994F7MpAd9LoOTaW9RH0TNQ5uS/Ef8Jx1T
         YMSEBLslBsaxN2Z6pCez1P3W0c/8INzOz1bpfQnKMLHoR7kCI9IY4QG6fwwpETzQrOLl
         m64qMpJ44sdvIAiF08Ez2NMugIVhCFcy57iyibMPfRrw8f8hKYtohqDHJGdvR2esZW/0
         g8QEiMwaP0SUAdBqGbXV2FAKJvc8qHGajPDZknl5VpOJ2iEfnZKCFREoC78nCDsVcPvi
         HcsTvYqqhis9nbY3xGg2rXB9/29E+EwIOkaZh1F5RjO8JxkMD27mXsGyH/gqZxluG4sN
         ZjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711478; x=1747316278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WY7gSBXT6cR7bWSaiDRLSHPRiSnEJ0DiKBMO01arpK0=;
        b=VQmPJJuJ6TohpWaIRedembGyfj+ukddqObJazoebJjc4hs2kRV5xL5QqlDQlK59Ej3
         R4YL3hcvf4siuS+GZJOZ44Cbiv+0NFOk5zYNI2h8+L+XNcLYwBzX6fLD74o9VgyF6ebO
         JxOA3QO+uD9mBq+MEE6SBVdtgefb2LlyVJOe8PkpZpg4cUXGg/bn/h1DaW4pdoo1acD1
         TwC/pgPpvBqjNcfbMzAE96ABg6Yx+OOH6aKSGAlsQXz+kmLgLl8INetaqTmX2yB3PjF4
         4Cmg8O0dwKhjVw/U9PfWSylU21ghSBzZ+nyFZ5sfU5YJKReTK9LUb2l7liOQcOE6kaWY
         fLBg==
X-Forwarded-Encrypted: i=1; AJvYcCUHkQFOZgQ8u9YMx7RY/YtBAHnq9cHJWuyUt1VAiiUOq70jQcvX+PREz7/VvY/I73mWf9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Q1hZiqERRpnYVN+KXOUtHrRSqV7OBkkhJtE377CrPhwNhbVT
	/+5eJss6G+yeEawi9orfnH6BrmMyE8RNAMcrNPlURHohKDSILM1xa2so/iq3+QA=
X-Gm-Gg: ASbGnctvT5+omgDJI6dve60Fl9fiYlt26SFiKnO0KjUBNvm5MLxpOC+rPQWNvnEeI9Z
	CKStgnfiYUq1tDauB7MFwrB1RwsD5pg+YlFrw5NpToXeqpSRuEHnH4qL0vkFoQKXtf0OQSSO4DH
	QO1QhRJ81bVuYo8M7W5cP4j5EIUSj4jlouf8Y1W4lRs1mphdwoFa9GpKrIe0UDZ+mc4y4upFBEF
	sCy3PhwnsnlFySbWLMPQmm4E+46OiKl1Dsgk5k8VXSvuxWiOzLSkoojdFme1MlZXZa4gglcJ9fC
	Bv/6Pu6oOuqTQ3XJ/YgYIx6Z5mZ2tBgoSc752ESnIDT5xtAMOYx/TCDOUBLgPzc1VIiFqTSyNTb
	I6eAIwb4olho2vgMbjMAygTD/3Q==
X-Received: by 2002:a17:903:244b:b0:22e:b215:1b6 with SMTP id d9443c01a7336-22eb2150297mr51984415ad.28.1746711478628;
        Thu, 08 May 2025 06:37:58 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151ebd08sm111835505ad.104.2025.05.08.06.37.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 May 2025 06:37:58 -0700 (PDT)
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
Subject: [PATCH v4 05/27] hw/nvram/fw_cfg: Factor fw_cfg_init_mem_internal() out
Date: Thu,  8 May 2025 15:35:28 +0200
Message-ID: <20250508133550.81391-6-philmd@linaro.org>
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
X-TUID: a8dHWzWFuitM

Factor fw_cfg_init_mem_internal() out of fw_cfg_init_mem_wide().
In fw_cfg_init_mem_wide(), assert DMA arguments are provided.
Callers without DMA have to use the fw_cfg_init_mem() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nvram/fw_cfg.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 10f8f8db86f..4067324fb09 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1053,9 +1053,9 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
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
@@ -1087,10 +1087,19 @@ FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
     return s;
 }
 
+FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
+                                 hwaddr data_addr, uint32_t data_width,
+                                 hwaddr dma_addr, AddressSpace *dma_as)
+{
+    assert(dma_addr && dma_as);
+    return fw_cfg_init_mem_internal(ctl_addr, data_addr, data_addr,
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
2.47.1

