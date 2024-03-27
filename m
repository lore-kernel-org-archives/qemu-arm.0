Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp344673ejv;
        Wed, 27 Mar 2024 02:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXT1l5PfF9eQqhKCeQt2rt6xPZCDnJ3YUCW0e0Osa9oEb+CmQ2eTgsaY6MYYlNkDrlSPdkHYNswDmp0q2xtkQHXk956JZVe
X-Google-Smtp-Source: AGHT+IF9KH8xaF2iSU2dJbtRbPF2/mChg6c3CyBiHbe5o6Mi6Tl63L/gnoW9vQsEvl4bMd7e3adh
X-Received: by 2002:ac8:590f:0:b0:431:39ae:f843 with SMTP id 15-20020ac8590f000000b0043139aef843mr672510qty.8.1711533203200;
        Wed, 27 Mar 2024 02:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711533203; cv=none;
        d=google.com; s=arc-20160816;
        b=jfE88NBovSpOMpWCbmn3GCb4jlPYLkdpQgnfyA7YzE60NmL6I+9Sk/XEOuT29egTAM
         TmRGK8A3FD9+9tnVusQxBBxH6GKm6hYqp71RmLPjcVe6QOiBR9jhadCksiy6sCJVNEqN
         5Ew1bkna7GmgGzkQ233RknA9QPti/W8eyYZW5jSdxkc8ydmIP+m1lIgXqW0wRH8OfVrw
         kfoP33qC2NEVvt/zfDsVKM5F0BGQEU2xZ4LI2mLjKmBLBSLa9ES+XRzw68KGtSohWIS+
         T/GLtK8JPq9D25Xuq5EGoR5IzUr+1L2eQF/7yYdqk3f7EUDRw/zhy5LNHhupPIblzzZm
         R3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PbL9DbUU/VwqkR1vuLb4yIgDr+6Vr1z3If7UjhII6YI=;
        fh=0P2Q14Ou5PE/Iu5/yK0zc8RynXSDeov01FDiW/XFfK0=;
        b=cLXdp3HsZXCOXrt5N+U5gecO6EtniwSi2V1BbkPVXMhgkTMLEe/q5Nhme/B0MMjWeZ
         Qzi9OWd8tq0nRMf/ak2Wk2omoJy3Z8YgBXGkBTGTdAAb9SQAV41AhhDAVI6UZy6aqmbF
         ejDqIOZ3lwn5WG3oQC8KLReI+Rv3DBDlDS27MbOCrA2TJ+cjZ+17KDamP04PBOHVp95A
         p7q/YLlCF3rUmhVY1yYHsmQMH5+FP2yhpDUJ3KRzmJsPL+WFYoapnq0Ho/ZZdLOIda+I
         MU6RXINaZEg4dhaaXWpvIcAIMttNdxVLC38aZnBhwnhEWSvvTpDCrTXQPcP12KL1z3C4
         Dtww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oshKLjFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020ac87f91000000b004313fb72cd0si8996066qtj.354.2024.03.27.02.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2024 02:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oshKLjFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpPxW-0004Sk-Sw; Wed, 27 Mar 2024 05:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rpPxU-00048F-EV
 for qemu-arm@nongnu.org; Wed, 27 Mar 2024 05:52:36 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rpPxN-0006np-Vm
 for qemu-arm@nongnu.org; Wed, 27 Mar 2024 05:52:31 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a466a27d30aso799557566b.1
 for <qemu-arm@nongnu.org>; Wed, 27 Mar 2024 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711533148; x=1712137948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbL9DbUU/VwqkR1vuLb4yIgDr+6Vr1z3If7UjhII6YI=;
 b=oshKLjFLYApqxWaVs1GZ40igalfXY7g+8FwJhTvrmvj7zFS+DOyxqJicvcr9o741z+
 K/zMyEI2i3nB7tdgSKfOJ1jqs37eh6Vo8WrWp0lBBDtA3HGv6t3rFpZ7sfJ6xqamJ1tY
 BoOHNjhBIcji2bv/Xld3uIXlqs1YSTpDPMosq2RqhhY6BXTi+QfbVTJjlWFbQr+2nxnk
 hR9wwlthGTa3ClUIONVmMZAOb56ZJ7lb3c1W6V8V8yAEuIzOW+j8fr40p/CNE5Qfp6Tl
 e1XXaUUdSU/kG+xW+msvmT/MuO9JqpFtHC7GOzChFPLYy6fI7hy1qNb+/nutF5zUfEKg
 e6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711533148; x=1712137948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbL9DbUU/VwqkR1vuLb4yIgDr+6Vr1z3If7UjhII6YI=;
 b=WnOcIVTRyOGBgmwlD4exUUJNsa0kyeDCjUpRY4+FqYqfOCfGQmCkKvljgdDOeh8EXi
 +B7wtdAqkPLhPUi4cW1e3ynxI2+sPHxaBSeAofGniRPyESgISpoaiGHm/rygz0CtmRrQ
 7epWkf5v/I2uNj7V+/5IOZukgxmKx/qNCAI1VPK0cpmaZgasj1eqs04tFjpPxSVyoAne
 RwlKPXW7PugPU1uhSshQwB3qy+7OboHiwX6yK8DnZlfkWTRBtcpEId4K4WbSdV4idz9J
 zizvVQUXbSozv6w6kUmno8OqY4QoU2lccvLBJwJrvTCdPGskvNknEaGqgqOcMfntHZpy
 f+oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWms+5m3ZwHdJO1NjIHzYa5QeWMO/drgR24f1lovYAD17PIHGtN71ByTIejDXAs/FU94ko45HZRCP//PCKlKsgnkwJc
X-Gm-Message-State: AOJu0YxKsGdfUuyT6FgEaTAvfAdXC+YZZMsdbuDxzO0uW+2hMCN5/p1g
 taj7M1/w2W1G/njO+hyxoGz3YhJP+qaj8kQBQ2F9uK0QY3OY/+lAHVWbkr4Zz/k=
X-Received: by 2002:a17:906:2998:b0:a49:dfe7:834f with SMTP id
 x24-20020a170906299800b00a49dfe7834fmr492717eje.59.1711533148505; 
 Wed, 27 Mar 2024 02:52:28 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.205.175])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170906504a00b00a4735e440e1sm5219836ejk.97.2024.03.27.02.52.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Mar 2024 02:52:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, devel@lists.libvirt.org,
 Zhao Liu <zhao1.liu@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH-for-9.1 v2 10/21] hw/smbios: Remove 'uuid_encoded' argument
 from smbios_set_defaults()
Date: Wed, 27 Mar 2024 10:51:12 +0100
Message-ID: <20240327095124.73639-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240327095124.73639-1-philmd@linaro.org>
References: <20240327095124.73639-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xSMPBeKt+Aa/

'uuid_encoded' is always NULL, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

