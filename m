Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp428866njb;
        Thu, 8 May 2025 06:40:16 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWvlqdCNkKwEy0eZc7G/CHmfDnugyxzNdsj0IkZfxs3RrN7P/nnCvzuWGXh3Jqqp3nl7HbIlb1npF4tmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGOt3l33Oz9ODovvaC6a6jJlXrsx5EjQAXyTbglQybGHP6soMcPWisKtGm4005pKygj8RXp
X-Received: by 2002:a05:6402:354b:b0:5f6:21a4:61d5 with SMTP id 4fb4d7f45d1cf-5fbe9e4055cmr6714275a12.17.1746711616653;
        Thu, 08 May 2025 06:40:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746711616; cv=pass;
        d=google.com; s=arc-20240605;
        b=dddCx97uGBR6qNeMiaSlbkswGmXcHm7LFOnFwAl84Dn4UwDqX7+FXv0zcllQ8xSuzK
         04gMwJ06QFMUqAmANxTvKs7DamJyR6jl8lZvxoJkS9hc8FqYxNZD9vBh6o3aAgNR4S/5
         RwDW5ZjDGi95Ya02y/+PoaZnA3Z1Hn6ers74yBdM8d7RiwifLF/KK4ByUejJZxDudQCQ
         +m+xNlzlAlylMfszGmKcqr86MHkYr8MSbTL37Vwr1mWrfxCwDe1bM1/BYmZRsVznQ/8M
         zg3+PJhM+n0gffRg0QXIl7Ke8ai4y8jSiQiY3ZzWdMvQsveKx4IzQBf6ucrFHauA66v3
         QVzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=p8Pwvw+j4e5J09FPHtAsan2JUEBLBE3y7JNJd5PTK2A=;
        fh=mx2bMSX2cwBLtzhHk79hT39/x8tXT69TUZdZ4wsptRc=;
        b=Ck/hAoEj/z7KSEEFSCd7wXzuqZT6k2C2HfPgP1NOGukn8UAVdGK8UZLl5co3C0p2kU
         NDM6Nv0+DzIx8XHLqc+BBpjX2PqPRi0nfoMcJgc2MrEMulCHg7vQ7dW+sNDKuq7ArWc8
         +/U+ewn+BDT2MZJJ8uoDKHB6wjAspqdvMCqvvSoCFS64F/9NVd19BuYaLZ3bb7GxX+PD
         Jj/+T3IFqO1FNAgdrK2nhJkihdBRe7neHP1uoASmzHaHi4jwYKEoOajpOgRwRGgoHSUe
         pc94XkkmBSt/AVAY/tzvdnsBL6hBsSITcEOcWyA0oeKHgl6dnihSLgP6CLr5du9ps47C
         cJDg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=untv0Jxm;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45870-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-45870-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-45870-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5fa77bcb9bcsi10259617a12.487.2025.05.08.06.40.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:40:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-45870-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=untv0Jxm;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45870-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-45870-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEFD21BC0141
	for <alex.bennee@linaro.org>; Thu,  8 May 2025 13:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E7422A4CA;
	Thu,  8 May 2025 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="untv0Jxm"
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409BE84D13
	for <kvm@vger.kernel.org>; Thu,  8 May 2025 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711611; cv=none; b=CyERctI9O9VHHRfH/Grm7NzhLdTc1kzAOyT9pscaFK7kenKWbXvJEPyVhzRFDxPE4kNz9TKO8H46OqQIHD+nGxVZgKjB8EyU/FZr76GPXFdT7CD7DIpKm7I3FkZKNHfCj7ZBnCJe1o66EPwGV4xcun8eFtsiopKcmWF4jYyZ3iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711611; c=relaxed/simple;
	bh=+jypoLN8eT3LPlOHE7eM3AKU31p+pkhCBzwwyXQQpXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hIH4Pq4tAJaN5SiUWyFb1GyhcziR+BsLCGk2QqgRaLl/6HZLO/2HfAdHE7xC2/n84hl/3kOzS2wTnpDz1k7jD4C9Mt/YtJ6kBDmWRn6YzDdjrXxdS8dQQnISD90gmvKkr6F7HCI5nsyVCt8f8hYGywcqxgdkhKsal9NXTBaNPOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=untv0Jxm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22fa47d6578so6843655ad.2
        for <kvm@vger.kernel.org>; Thu, 08 May 2025 06:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746711609; x=1747316409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8Pwvw+j4e5J09FPHtAsan2JUEBLBE3y7JNJd5PTK2A=;
        b=untv0JxmUxzN3LyJNkY5MuO/lYl/ClShaYVn7phbyHIIsK2Gqn95XWlEw3QXjxzJAw
         TFDGOWHw21bjBlAuPog72flcHk7wBN3debDPz0UxYhfh5+suGOPU0MFGu3o/L/xFM0Nz
         sf9XcAr0xFeMAovk0+EpT1+QXJQyittpIJAPh9ptvj8mBzSCn31KKXNZfYLoWx2o81+R
         9tbVPPtJUba8bZSR0OsUoSPIGAsNTBSXZueuoyyt+16ee4N5T7Aay4vk4ReMzaHXINfd
         iz/0uHnAG7DkYg75+gloCB40TjJeO9piDnHW+NNbtK8Ac7ZTnbZajwBA95s4MKCANU7n
         TmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711609; x=1747316409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8Pwvw+j4e5J09FPHtAsan2JUEBLBE3y7JNJd5PTK2A=;
        b=COGDd6QddGqzeNHnxUTgeZJUBZ+O36td3+gFmUx3k6YcqoWldt0i/a64qBtcLFKkfX
         qSl0qI+VKnBCIfC2jMIBEmjCWFog/dSGJeBxs4x4Gbn1dMa6RnD4cnu3Tc0zSEwG/q3I
         2NKO+zaQi3rPN3R1WRRBVjg7J0/Yai1dlZMQ5a1sEsUQZWfU8XHObkJNn1CgF5CWzMYO
         29ZyH0+x3Ar+zE5RbD/PFiip3HexxrrZRQxRKNmEsErUt5shJwg1OCQzWODRgPkoyq9s
         v+Aq3r/WPf47yGcw16KhRBr8bZdyn0KlO2gp7MjOjIKc9WOKvbQVS/OSVRM8tFzmxbMv
         cdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0w6V/iJeP9Mp2vWTvl7CZ3UbNjQyKwSODyv5ku07mDkbp0OIxOsBz/pu1P7VkuNg68+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHVNZP5243CTZnCZMF6GqOtFh2mE/jqPSaNnS6B1SqbbCGwShH
	aRBR9K3gJgW1TdSby9eXETjEilPdLpuygtsbYROFHMRi4gZ64b0/bW8OPFQ/mvY=
X-Gm-Gg: ASbGnctOg2Zd5y0ZJlKHDrcdXYNjkv/F5YIkWbfSBQs2xQdnHQP/Xj632H3MAAtEXmI
	4xRzN0uJ2vuTVhWyv6VZG2vSt7fiInMRcCWs3VFeYkn4E0vjAWzt0+WqlDAJ/Vc91CNW5eD8KPx
	lWr+0Ik+FCFt8l2vNJ4uxiwUyyOMspC1AH/4LE9krRlFCeYG7lYww04gdADFCFSKZ2j9xYJrUDx
	HPWB8msMxh5XO4nZcJ4XwY7xzthc5n5JZmOKUaHJIEgTtE+5G0PqKgtKs+eDBcvhA2pCo3hyKng
	P/em3QanHdDuAgrWex7wp6gBL45KGWGcMVNtMkDbt2y0OvcgbvLetuzaY3a4VDhKMOIXDWzTPc5
	8/TS691/AktiqSeM=
X-Received: by 2002:a17:902:d50d:b0:221:78a1:27fb with SMTP id d9443c01a7336-22e5ea38b30mr113474455ad.11.1746711609535;
        Thu, 08 May 2025 06:40:09 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b62502sm11305764a12.32.2025.05.08.06.39.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 May 2025 06:40:09 -0700 (PDT)
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
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 11/27] hw/i386/pc: Remove pc_compat_2_6[] array
Date: Thu,  8 May 2025 15:35:34 +0200
Message-ID: <20250508133550.81391-12-philmd@linaro.org>
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
X-TUID: KXjUeI8waTYC

The pc_compat_2_6[] array was only used by the pc-q35-2.6
and pc-i440fx-2.6 machines, which got removed. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/i386/pc.h | 3 ---
 hw/i386/pc.c         | 8 --------
 2 files changed, 11 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index a3de3e9560d..4fb2033bc54 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -292,9 +292,6 @@ extern const size_t pc_compat_2_8_len;
 extern GlobalProperty pc_compat_2_7[];
 extern const size_t pc_compat_2_7_len;
 
-extern GlobalProperty pc_compat_2_6[];
-extern const size_t pc_compat_2_6_len;
-
 #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
     static void pc_machine_##suffix##_class_init(ObjectClass *oc, \
                                                  const void *data) \
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 4e6fe68e2e0..65a11ea8f99 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -251,14 +251,6 @@ GlobalProperty pc_compat_2_7[] = {
 };
 const size_t pc_compat_2_7_len = G_N_ELEMENTS(pc_compat_2_7);
 
-GlobalProperty pc_compat_2_6[] = {
-    { TYPE_X86_CPU, "cpuid-0xb", "off" },
-    { "vmxnet3", "romfile", "" },
-    { TYPE_X86_CPU, "fill-mtrr-mask", "off" },
-    { "apic-common", "legacy-instance-id", "on", }
-};
-const size_t pc_compat_2_6_len = G_N_ELEMENTS(pc_compat_2_6);
-
 /*
  * @PC_FW_DATA:
  * Size of the chunk of memory at the top of RAM for the BIOS ACPI tables
-- 
2.47.1

