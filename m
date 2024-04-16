Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp572172ejd;
        Tue, 16 Apr 2024 12:01:05 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX2Xw+9e1APjU6Zbg0siHmuE6DTOY4emHBGoWJc6L3WnONiJQr+3EVvAO8SFFGFfKUch3pyBBKm4rPjhsUlU4RXjeDB4U1T
X-Google-Smtp-Source: AGHT+IGZQ/oDyorqFrKs+CdhZRIc6Kh6TY/Ubc8/VUK06j2ys2Ah34212Wk1QVTeZUXgHPnBlrSy
X-Received: by 2002:a17:902:d883:b0:1e2:bf94:487 with SMTP id b3-20020a170902d88300b001e2bf940487mr13186706plz.57.1713294064981;
        Tue, 16 Apr 2024 12:01:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713294064; cv=pass;
        d=google.com; s=arc-20160816;
        b=OTsf8WDpl8fCQ9oYOuTKfOVYxMTju+uSgX6Kisv/fwSmUSafoYH/bsBnsauixxXJdH
         UK617qqeYCyoul1rfEGgmnjFPex+s61Yf9BixlBBrIAcSz6BSaTvIivyvbZ39x1n1tZU
         XTskUtWsOWlpKmwNVH0ePuEFKRsClyGTqc0iyzxTzHZYA4VoMRTyNunBc6PXfRulG0/r
         unnffONOhg81GnkSHvyLd7FPx2TsWrOaKDJ3j8rwKYtA4m9jUTVFyC6yiNTL958VkiSK
         IhE3Xyg1gscgkyNCOPLeijHqIfx48tmm6uob/W/oRBYpCqCZg5SYLYMSFovaPNpX3n9B
         xvog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=UuGQRWMqmr6ruVhTw3v1+AueGwovFmnNusAak3fPiJU=;
        fh=7CeX/8CdAz+UP/fy/MNDyGJRu/QbfzPVWJi+vnUg78c=;
        b=wDS4je4NStOofXcM8MblXmnSLlyXdOgIsAR8ZzN89Di9BkgKZ9birK1/6wa+jjLxDL
         mZPDZP3lkN0Blj6Gca/CDNPSsrwGG00ByMh85lLVTa1qeqXc6wFIx/792nLJoQxgTpC7
         QzJ/3nc2n+aNnWf/ZysjikHRHqb3YSvC6tkK/ImsYERGE/y5TfeRyGt0KPVPSMWqZKfb
         bLZZGe6T+SD4mQ5pTKqXxEJU+cf1V3UxkgMmgftv9btY3OD3Twlph6JiqwyVCz8tZimY
         zU5ddF7kl4qcfTQInu/4bLM95jBnLiteBXDjrcPnSSMXyW3kvkym7A+JS87r21E5IAi0
         /VLQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqETOtcv;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14860-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-14860-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-14860-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id y10-20020a170902caca00b001e28d13fbf3si10117825pld.37.2024.04.16.12.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 12:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14860-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqETOtcv;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14860-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-14860-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 863182829F1
	for <alex.bennee@linaro.org>; Tue, 16 Apr 2024 19:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C6F13777B;
	Tue, 16 Apr 2024 19:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqETOtcv"
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B8D13473F
	for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 19:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294059; cv=none; b=jqBtj2J6oOMiLWZ7YLhaEe/mH4HDGW5wmeBkYmht9B5aptL+iIGoMz3VtN1w1it6G0wvYjNKBpYBNb0KI0PCon5fcmPPrisbbJQgzS0L6lVZuN+0bmgUEhVSKETih4KhNFzZHrk1vNLgsDkqsum/f7eNyGRJ05RL3tQAS7boXIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294059; c=relaxed/simple;
	bh=rMcTD0LEHby8jL8jilQsu6UDinvXj3I/MOn9cbEDiHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ky8nhwT0SfPR9A84XnnBcRas1J4+eGMOcOD9QmPx2qLyIJWTLGIv95ziIBjwe1o5bmJ9c9eE2Ou5QiCHhvAAFXZ/zBwlYIDaGaRKzZiMEUEXaFHw+D/bKVm/eQqN+tCzXR+rghq/yKBYrJDHEvadhBJ/VHKQYCCccvip3MX9YYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqETOtcv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-518e2283bd3so4238752e87.1
        for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 12:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713294056; x=1713898856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuGQRWMqmr6ruVhTw3v1+AueGwovFmnNusAak3fPiJU=;
        b=kqETOtcvEJcJY58VfYr199Z7Us1qhhUQkEYpC0jnetcm/y777H0hsIKSFqINcorgKQ
         ABWikjlT+m5K01r28VVSA9wJk/NYYSmpnpfmT7b48gYeTEqsp3hLTK3/347+S2Ziow56
         h/6q/YVCEqVtRzASjUjdStraoZ6dmCF6Pl3F+hNyLsenRciiessxNzYWyX80zWxamAdO
         cU040tE7A/dPiMSpBDXSnk37a2oACbktu1uWkxvAtZI26C0VYJwmqJbofWo/WNPdtx0z
         bjggPB+VlOO6gQwV2cPYXAw5Wf0/gXvckcVwHu855ZRZxGweQMM+s8m1paDcEfn/+D4r
         Cj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713294056; x=1713898856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuGQRWMqmr6ruVhTw3v1+AueGwovFmnNusAak3fPiJU=;
        b=sEejTkFtLOI1NyafhDQEfB0nR/3M8NE4n7LEpnV+sE/CI20PWi5/umSLfxSJWq/jGY
         cISDcwg5OM5LUjsfJBgBQsOy3UOXKsU3EBpAovHz0bh+1BZRx9jcGY+bv1K0T4NHn6vh
         0ZJKnXl9XhZcHdRbeC2drIJ2uiwz/YUYXz7u4XTemV1E0XCwCh6bK5eqJpJnKbXj6SyS
         QaKdu6KkDR04yf0ctYCWjGTNEEocMt21nJnZqytPCAkNo9LgH1lR68j3jdl21lxonXRO
         L7m4WPUsONlhvgHsU6ZiwmXrU71NaXSjmYWsho6a8qasNoYo215jVLOaHkqi6EiGlBHj
         tvkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU+JPPhePchp1ptf/SBTzkM54tL07SHEo8vj66slNfKDQ2ZntE+0F08ZN7De3knmGtjj+oiX9f197FRHXZ9fdBcRy0
X-Gm-Message-State: AOJu0YyojaJd0qHlgM51U4cwy/yNZWt9nRCUOC1/6n9VigsDJB/JK59G
	8afs8jI9aqbjWB2SO7cwCmocY2Kd+k3zf+uQv8jsub5xmoTIt0OrKg7S2qAE8cE=
X-Received: by 2002:a05:6512:158d:b0:518:c59b:4fa9 with SMTP id bp13-20020a056512158d00b00518c59b4fa9mr8481593lfb.50.1713294056253;
        Tue, 16 Apr 2024 12:00:56 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
        by smtp.gmail.com with ESMTPSA id g17-20020a170906349100b00a4e2dc1283asm7167171ejb.50.2024.04.16.12.00.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Apr 2024 12:00:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v4 11/22] hw/smbios: Remove 'uuid_encoded' argument from smbios_set_defaults()
Date: Tue, 16 Apr 2024 20:59:27 +0200
Message-ID: <20240416185939.37984-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qgIGNCWOqBTi

'uuid_encoded' is always true, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/firmware/smbios.h | 3 +--
 hw/arm/virt.c                | 3 +--
 hw/i386/fw_cfg.c             | 2 +-
 hw/loongarch/virt.c          | 2 +-
 hw/riscv/virt.c              | 2 +-
 hw/smbios/smbios.c           | 6 ++----
 6 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 8d3fb2fb3b..f066ab7262 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -331,8 +331,7 @@ void smbios_add_usr_blob_size(size_t size);
 void smbios_entry_add(QemuOpts *opts, Error **errp);
 void smbios_set_cpuid(uint32_t version, uint32_t features);
 void smbios_set_defaults(const char *manufacturer, const char *product,
-                         const char *version,
-                         bool uuid_encoded);
+                         const char *version);
 void smbios_set_default_processor_family(uint16_t processor_family);
 uint8_t *smbios_get_table_legacy(size_t *length, Error **errp);
 void smbios_get_tables(MachineState *ms,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a9a913aead..a55ef916cb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1650,8 +1650,7 @@ static void virt_build_smbios(VirtMachineState *vms)
     }
 
     smbios_set_defaults("QEMU", product,
-                        vmc->smbios_old_sys_ver ? "1.0" : mc->name,
-                        true);
+                        vmc->smbios_old_sys_ver ? "1.0" : mc->name);
 
     /* build the array of physical mem area from base_memmap */
     mem_array.address = vms->memmap[VIRT_MEM].base;
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index f7c2501161..ecc4047a4b 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -63,7 +63,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
 
     if (pcmc->smbios_defaults) {
         /* These values are guest ABI, do not change */
-        smbios_set_defaults("QEMU", mc->desc, mc->name, true);
+        smbios_set_defaults("QEMU", mc->desc, mc->name);
     }
 
     /* tell smbios about cpuid version and features */
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 441d764843..00d3005e54 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -355,7 +355,7 @@ static void virt_build_smbios(LoongArchMachineState *lams)
         return;
     }
 
-    smbios_set_defaults("QEMU", product, mc->name, true);
+    smbios_set_defaults("QEMU", product, mc->name);
 
     smbios_get_tables(ms, SMBIOS_ENTRY_POINT_TYPE_64,
                       NULL, 0,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d171e74f7b..1ed9b0552e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1277,7 +1277,7 @@ static void virt_build_smbios(RISCVVirtState *s)
         product = "KVM Virtual Machine";
     }
 
-    smbios_set_defaults("QEMU", product, mc->name, true);
+    smbios_set_defaults("QEMU", product, mc->name);
 
     if (riscv_is_32bit(&s->soc[0])) {
         smbios_set_default_processor_family(0x200);
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index eed5787b15..8261eb716f 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -30,7 +30,7 @@
 #include "hw/pci/pci_device.h"
 #include "smbios_build.h"
 
-static bool smbios_uuid_encoded = true;
+static const bool smbios_uuid_encoded = true;
 /*
  * SMBIOS tables provided by user with '-smbios file=<foo>' option
  */
@@ -1017,11 +1017,9 @@ void smbios_set_default_processor_family(uint16_t processor_family)
 }
 
 void smbios_set_defaults(const char *manufacturer, const char *product,
-                         const char *version,
-                         bool uuid_encoded)
+                         const char *version)
 {
     smbios_have_defaults = true;
-    smbios_uuid_encoded = uuid_encoded;
 
     SMBIOS_SET_DEFAULT(smbios_type1.manufacturer, manufacturer);
     SMBIOS_SET_DEFAULT(smbios_type1.product, product);
-- 
2.41.0

