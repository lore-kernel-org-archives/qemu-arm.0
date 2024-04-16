Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp387112ejd;
        Tue, 16 Apr 2024 06:57:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIqVah+Hw9u6HBNQZUkCnmzgAYA0ZpMj0QtvKiw4DugW4gWhv3soN7SbNw04MSBp57DvG+DTt9SVPrbA6mAKKnLzCkhD3k
X-Google-Smtp-Source: AGHT+IHOYV4/BW/Jba80SR1jLNbu55eOOS+Ie6nlwJPZNis3FicAa2fQ89XLHcszHU5phSb/Xzy0
X-Received: by 2002:a05:6102:149e:b0:474:d24c:4e50 with SMTP id d30-20020a056102149e00b00474d24c4e50mr15130532vsv.31.1713275826052;
        Tue, 16 Apr 2024 06:57:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713275826; cv=none;
        d=google.com; s=arc-20160816;
        b=tuyWS1A3BARm0zSTWsQ6srUYQ9HRbw8717Hh+GKSnxMV3ymtFJbTFQYtdsge2lfHIL
         L7F+1a33XKr5u+eYn7HDsx6LVIgi3hHjPgbX5GihwFSJnCzYlXnYmfdcnuu583pd8Bo8
         ZMXreK2Ko94jYqYZYvMkImtdPUhqSUmZgWg2RtQg9wISA2V4gGifDdxQK4sywUaeVtT/
         WwOgVd++Ij1abTdYTdPC3ihzMjU5+yQZWyDK1SuJbjUGWi2bWtYuciNbV30Mvl4w77Kl
         MfbOn4UWIbF/frqEqgifp172ShL+PUqeiz/WSih+v6uKeuinNPvP9XXD4m/38J2E3jjK
         JH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UuGQRWMqmr6ruVhTw3v1+AueGwovFmnNusAak3fPiJU=;
        fh=4W+tTt/b0/ang4/afEdXvDSxpxcHReiij1z+lXKgWEo=;
        b=v3gCnKRUTfLC294VkmCbcLuq2oX+U0Mi+pNVkqqdATx8gf7zLWOSl04+x4FH5wDleG
         W2pdTtPO3gGgUN0GDKRtCFZyOkUKgLVmkWmo9OtZ3MijOSf89PhYsBWLrVHzPAdZRE9l
         XlMTfl5TlofFoIXe/W/3idhz23FS4/u/gvZOJ4yvvLz1awn5bsbH0q8VwloWUbhOK+J0
         5ncymVhFHiCKPOVAR/GdW0yZ3URoxRwtykFVb+46LAjpsTBP18hbQ2nM6ySAHJ5D3fEK
         vmvkjiTAKxt5ExY6+WsWXbDmtcu4zBlfzetlEkRmdcu5HLUossd0iDnrTaRBzQ9xJll9
         QY+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKE+BoUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a05621405cb00b0069b205e9c9fsi12245824qvz.547.2024.04.16.06.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 06:57:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKE+BoUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwjGP-0003F9-8k; Tue, 16 Apr 2024 09:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjGF-0002oj-To
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 09:54:12 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjGC-0001qu-6d
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 09:54:11 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso5769959a12.2
 for <qemu-arm@nongnu.org>; Tue, 16 Apr 2024 06:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713275646; x=1713880446; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UuGQRWMqmr6ruVhTw3v1+AueGwovFmnNusAak3fPiJU=;
 b=eKE+BoUebL5WjsIkKju9B9igNMd8zk94zRmWT9YlQ1bQcklpByc2mQ3Jpghr+bumm4
 4PGzTW8yFFL+PfGYZstYO6J8J9Vwx0gvo4gQxFnc+b85dVAP2t8QRGFFNjXp6z6wrAdM
 KGLn3RMrMIyly+hpWHDC7lgJZvB6gBKqT7HePnN+RYWHKqkFPwBJaUClmV4N+LitzM0i
 OU+w4V4Y1bmZK14aDs4Y/Wv0WzREcXOn4ABoUSAeKKhQVQOupzZ/Z/sMezmMnnOJinrT
 Br8KKSzKqwmlwc0dv8Pgr5h9yAf1QDABmvNxUjq9zFMaZpQ4dg5111OVp8vMHCusTMO9
 Z2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713275646; x=1713880446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UuGQRWMqmr6ruVhTw3v1+AueGwovFmnNusAak3fPiJU=;
 b=gD36Kzcmxn+hHk3mZ6E2y+J8cs9Zzmc8DxO6QQfpfSASD7ygfXMesVy9/c+pDvihzy
 KROklmnSvbSTYKpZLS+POF/tUmWrkTs6s7xZ7MkLdTfSm1yo35XV1qUYU9IRdfSkWVl4
 gBHcxIwz+zCegxeMJven+ehiEkOD6lgWKsDjYtXSpT1WeSyIlBTouy2TuKhW65ol13Pw
 VxgKcglxReWsHqo6ZPTE5FQ6bEM2PGqjCFWJFz80JknU0KirUfsTFnwmR1iMwvAOSpHw
 upg2C/JzK8aMxI6XXkkBlqYDrjoxOLcEs5hj45DtrJz3y6DKwoiI6uUsB6MGqwBCvVdb
 Eggg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX51x9Qq51jnMt0xpHSTq17mgE3PBDtLWj6HwsvLBHDwbc6mjN2/3V8LGEyGR8PnyIMsYNJziVUns0BYyCQjvoQ1Fc8
X-Gm-Message-State: AOJu0Yz6KuNhf2DDP2NMCZE/Kj0iBuTmTUUnWwaQIYMJkokClnhz1hOy
 Lm1shR/7I5RHbsmxA7+SFyOGd2iY5zmkSrSjMDGfx/WH4I3pHlD8vmgMNOqRFEw=
X-Received: by 2002:a50:d55d:0:b0:566:d333:45e8 with SMTP id
 f29-20020a50d55d000000b00566d33345e8mr8949322edj.20.1713275646553; 
 Tue, 16 Apr 2024 06:54:06 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 ee42-20020a056402292a00b005701550ddc5sm3802566edb.90.2024.04.16.06.54.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 06:54:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org
Subject: [PATCH v3 11/22] hw/smbios: Remove 'uuid_encoded' argument from
 smbios_set_defaults()
Date: Tue, 16 Apr 2024 15:52:40 +0200
Message-ID: <20240416135252.8384-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416135252.8384-1-philmd@linaro.org>
References: <20240416135252.8384-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tlziOLkTDbZa

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

