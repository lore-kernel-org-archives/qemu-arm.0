Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4185370njd;
        Thu, 3 Apr 2025 08:19:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7hf9vr5uYqjvdJADhKPOgNPIr+euinc1JSenBlxu1pP1ZN58zfkwzIEEEzKxnHnklQ8yQC7E59z2YlQ==@linaro.org
X-Received: by 2002:a5d:6da2:0:b0:39c:12ce:67e with SMTP id ffacd0b85a97d-39c2f9510a6mr2666556f8f.41.1743693559574;
        Thu, 03 Apr 2025 08:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693559; cv=none;
        d=google.com; s=arc-20240605;
        b=UGue3roQRfna5Vyx2QDNwn5atOnuq29bOoo/WGeIRMf4Fbi2o4gmFNR7y9u26BcgsQ
         QSqA+xpGtbxfD4fZW0D2KNpk7s3XLTan3M3t9FGuoWwhYHmosuaWQsM9NqYNcrRGUSjK
         Ma6H2iG27/g9R7OXfWEXtS69QXJd8Mz0MAM6LKOvztkD+4Yb6zGH25Hfu9i/QjBU/KxK
         RhXAnrzB0jSC6xkHd+aFO7YN+i1TMyFN1cUTIAfVYMDsk4xGVtfPZviKAX77ODbtni0X
         vqeibqSN+jJ07N6kBpO+usV7tdAyomGl2PAP8QoelnITwAH2WoE29GLXTF2S3GV3aGFw
         2hKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TkNWzS/5Q0X1wok5s6TRzd+7v9TwGIUutsDTBjTDsAk=;
        fh=XFLLM71ioDK0r7YtsV4y/eDhVCyyRwQABNuiv+ZYmWg=;
        b=IcYVKJqNl7JQOEh1dm9g5BxcioKjWATfMc13faxw9tedFXAl5HF2Kg9b369nZnXES1
         Ye+oJFtHp7Gtd2SBZKeZios+tr8K98E081b+1R9QNCMK3kNp+EnPK5nh7r7awazZXZVh
         O5LA3uXtt7lB/tOOwb6fKV/e4Ubcu/2sBbdjmtpadjB1X5SJCbL38PYGpM5u8PjLC7xu
         MQpxIUf08hqN7qmg46mp1QJLKhar4RaAV3jTigX7r/EPaTxa4iFIoWQ1/yZKBlZ6l8g5
         CoMDoDB/0UhOzsem5oMOtMLCcULpMnaiCDdcdXAS47fW704EZFlWjNNScacqvfgAqPk0
         HK2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+eIbsHg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c3020f736sor531770f8f.8.2025.04.03.08.19.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+eIbsHg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693559; x=1744298359; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkNWzS/5Q0X1wok5s6TRzd+7v9TwGIUutsDTBjTDsAk=;
        b=g+eIbsHglayXfPB/ym5CDYgkyrK0r+Y4dU8/iuD1HeO7yMgskoYd+iARs4ycQUwffq
         n6rBPz6ryh+CkAEWTLoKXSts6voYR/ub+YqN9W9U8Be6aHyOOWrlMy69YRSqTBwPUSXf
         7Ed+zNQJcXX5xMAMxE7xw2TQ7a53H9rJhMyW9BnYwzw1bmMMAKvSLNrUjjUIs4qfG5V7
         NCYa+l1/NwjhaabeTiHnCbkquC+g43C/AlW1bqaFD9VG0LmOJcA6L50imvw9mPGUxtx3
         i/SgYaQcKaaBhPt2OH6qBpxbCaBOzWeWE+hd5VmMkzR85xXsewYaq40n8ruzCNBeG3Ei
         3QbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693559; x=1744298359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkNWzS/5Q0X1wok5s6TRzd+7v9TwGIUutsDTBjTDsAk=;
        b=hsXQcPHHBgbR2ZJSjxrPbA0MDuZ/WlKjXESwDCq6FaRk9oGtZJK95GuE5bvDuYrc9A
         vNS+OPUl6rbmRXrcZcXRGHktpVtyeurPNoTk6QBYW4hLUngNcAbpvGxsnsyvMtA4F4RL
         yWnPRGy5ICg8dnpByF30cNraJuJsimkbmov9TSn1aos9yWa02jDV31f1csmNZ/SdwsDM
         UEP6vl29Ypvz96+Ccee3Mzy2WW75gIP3KJXQJaA77hRelOye0dnMg6ilTkc2cAVF79Hd
         o+Jfjpnu3FiQfGwTDLhy2M76xanGudCTZAAaiECh5h/ir/wLwKW1BTq2GfqRHBb0NJfz
         NdWw==
X-Forwarded-Encrypted: i=1; AJvYcCXvZURbBzNd321LWqUEqiq4NangX1iXNywJbSF4pcjM+9Vyf9tq3Wrj6qYTej8EN41HMDhzSrgR/DjFnw==@linaro.org
X-Gm-Message-State: AOJu0Yxez7maL27uU8ckz0FCLguUoZzJHEe3MuTpq6Yp2uvjVmPV9n8H
	BZQENG2R8HSy5vDJi2orcP9oiPBVI+lKx/dwwI5XYoG45AjnVxkqQTaaXOGNfXZzBg==
X-Gm-Gg: ASbGncsYaf9ACgCslfx3fwV3l689Bt2U12h0BB3UeuJ9+SG+16NG3jgqAgHXTQveDqH
	G6Z+Wk811F8Ax4Es/5lONTbm6tbY0vCtZwAtDDV8B9DLabYAkq38XCgYTnv4EmgjdlWvioz5tMO
	Dt/UpsxzsaRZFAfDx5M7yCEWgLa6ycNATk99l/kCPKehh1uq3X1qKj0bs5PqNymC4q/vy2mZg8v
	G1WgtersNAClkSNSXMwsqwn+1CiPg0zajfcILkbEy8IoVWZirxUrAyhWEFh47m6cuEdmwrNA8c3
	ABYU9zEk0DPfQG60gpak4eHxYyqPSAnYC/PBCYMWfdEA9On2bopgziAtxA4RHNLdfHQM0eJb6uC
	DDsBZ/lBfTJsAV7Z5Bak07G754b8pSg==
X-Google-Smtp-Source: AGHT+IH9Gt8qY01Hxqjy+L8vfzdPwKRObYb9XyNG+k0b+HEZ0c+CExk2RCPwjhCk7SDaHusGD8ysFg==
X-Received: by 2002:a05:6000:4211:b0:39c:1f04:a646 with SMTP id ffacd0b85a97d-39c2f8cfe62mr2784406f8f.13.1743693559057;
        Thu, 03 Apr 2025 08:19:19 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7225sm2065828f8f.26.2025.04.03.08.19.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:19:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Udo Steinberg <udo@hypervisor.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: [PATCH-for-10.0? v2 07/14] hw/intc/gicv3_its: Do not check its_class_name() for NULL
Date: Thu,  3 Apr 2025 17:18:22 +0200
Message-ID: <20250403151829.44858-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M1odD7MdEqia

Since commit cc5e719e2c8 ("kvm: require KVM_CAP_SIGNAL_MSI"),
its_class_name() single implementation doesn't return NULL
anymore. Update the prototype docstring, and remove the
pointless checks.

Reported-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/intc/arm_gicv3_its_common.h | 2 +-
 hw/arm/virt-acpi-build.c               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 7dc712b38d2..3c7b543b018 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -128,7 +128,7 @@ struct GICv3ITSCommonClass {
  * Return the ITS class name to use depending on whether KVM acceleration
  * and KVM CAP_SIGNAL_MSI are supported
  *
- * Returns: class name to use or NULL
+ * Returns: class name to use
  */
 const char *its_class_name(void);
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3ac8f8e1786..9b7fc99f170 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -741,7 +741,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                                           memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
 
-        if (its_class_name() && !vmc->no_its) {
+        if (!vmc->no_its) {
             /*
              * ACPI spec, Revision 6.0 Errata A
              * (original 6.0 definition has invalid Length)
@@ -973,7 +973,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
                           vms->oem_table_id);
     }
 
-    if (its_class_name() && !vmc->no_its) {
+    if (!vmc->no_its) {
         acpi_add_table(table_offsets, tables_blob);
         build_iort(tables_blob, tables->linker, vms);
     }
-- 
2.47.1
