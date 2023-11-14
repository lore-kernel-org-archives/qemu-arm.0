Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2083399ejc;
        Tue, 14 Nov 2023 06:40:02 -0800 (PST)
X-Received: by 2002:a17:906:ccc3:b0:9c7:6087:49a7 with SMTP id ot3-20020a170906ccc300b009c7608749a7mr7151766ejb.43.1699972802310;
        Tue, 14 Nov 2023 06:40:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972802; cv=none;
        d=google.com; s=arc-20160816;
        b=l4SXns64R7lJt2kOzAQwf+ouxtiE4k3BMGPRllfxABAW7dwvUFfpNxWOAjm6s64Smu
         K7a+EBn23dW9Wh2AIx9dB4z1llpeR0oCFSbmJsYhy/OBvjh5W/9SQtlW4i6u2W0gEUwv
         c1+gqLBKpAn4T55nqQ2I/d35RwFm/3PWDdU9TANer2HZQwCfR2jFa5VKNqi7CANirK3c
         7dQa839y3SdRkvYA38Wc9k7oumqD5OjQVAeVatOX4KOciAkEh/HgPGPHKHNi6piUeriI
         HjxkqHfs1SWZZXyynQ4OJJ88IFnr5Ih/Pf3325WnuXrB1LcA1b2gr2TGqw6pNcIcuUKt
         IfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vfmEPJkfg9xcA7W0yB07+uhlzLrR51RZZmvLOIuALj0=;
        fh=1nz8wG6UuYay2KL0jZBUp30jkEi8Ayfk1emV35/PTDM=;
        b=n/4qXdRTIDtjKPckG+JEs7U4KvHs0kmAjehqeIkIcEPdq06kr/HcYdM2ZsG48B4T5n
         6j+ZvjK9ld8szpxhh2dhM0TYF2ezjwrRU9bUlxtPXIbBUGN4R6iQhemMHYWnsfW3b2IO
         z3YkTQNZxUSCHCPQDekYVIns6Z9bMuOlRZN5JIpBWFOHPaMvInxXRerCiiWzyfCtiH77
         xYtjBdRDjTXwkWVMdNTWSc4coL6EprnEw7dxr1eVIrpSmRjc7MT1qB+xK5YfVBbaiCRD
         24lPhoVW+/SSXWY52rYF45Jk7HqJzfVMOqNh6OXNc4zIuOfOYz+wZXr1OueyWjQQSlTb
         FUKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=slkVsnuE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 18-20020a170906209200b009b30677d149sor353799ejq.14.2023.11.14.06.40.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:40:02 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=slkVsnuE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972802; x=1700577602; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfmEPJkfg9xcA7W0yB07+uhlzLrR51RZZmvLOIuALj0=;
        b=slkVsnuE0i4H9RZHweajjKHQApEyClrJMUQNnocdPIRAM70MKGrcwJ6myazwMk31pk
         YC8+SMfTa26PLxhyP5vfzkcqmTOc2NoUrk/RUCMOKWVA+EtdLMYBdRpAANtaXjLtCFP7
         TRryPYb47F1p6/g9JxWjA589G+h5UBZ8LgC+nhLSRjpPXu9//tc0p318uXBsQRpzjLST
         TwxfCJbrZLH5GWL9H65DbOL++KTZ1LVgWYsShN0+kJ9LoZVb80mG6J1LltayUm5O4zA/
         lqhKZ6cYYtFqbNqHu9dmthRM+e0d70dc5HqpdWR5Os7pLntrpCuZ6EXQYf7IVnFRQsTP
         MZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972802; x=1700577602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfmEPJkfg9xcA7W0yB07+uhlzLrR51RZZmvLOIuALj0=;
        b=BwFt8nytHv8YgNcGE1DsiZ+tIu2oQvHu1AWO/0oOVWGW2y26u36simLqLPgzmnInCT
         jO1HKdOJsI5il7UJfG8xwl2qkIBHmH8+/NY6p2i9pRLO5a9633oxeDX4K0sxKIdtQpkw
         IR7SbdGoRpGIouP42F8QAL4t8DW7AdQ0v5kWM3WvqchDNboKXo6h5Q4vV7hyG0fDIS6n
         Wsm6FmceG8R14J0uusPzCo5FgV+LVPKR2qJNLr1AjFbqslWKhUyNmYWElO7cqZaB25eN
         MSUC3LEovwtEta118FGDixpTBdug9juR8uq2dGExhsdXOIJojZj/7O0JAIf7OlFPVEUY
         Ejgw==
X-Gm-Message-State: AOJu0YzYisgpiuCYAZ4gDxJDKGhUNKmA5rZsBuZOXqKtvVxbB5Q6npgj
	9IX5ZlPhFe+ZTbbyEb5XHPqlog5Q
X-Google-Smtp-Source: AGHT+IFr1fCG0rC/823Fjj2RnGPLFEJJu5Vypm0crh2s8xGJ38WYt9mRvWNiRlcZ2yw4Up2Qw1V1LQ==
X-Received: by 2002:aa7:d704:0:b0:53d:e0cf:cb95 with SMTP id t4-20020aa7d704000000b0053de0cfcb95mr7775616edq.21.1699972802002;
        Tue, 14 Nov 2023 06:40:02 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id r30-20020a50aade000000b005434e3d8e7bsm5309632edc.1.2023.11.14.06.39.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:40:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 v2 15/19] hw/xen: Reduce inclusion of 'cpu.h' to target-specific sources
Date: Tue, 14 Nov 2023 15:38:11 +0100
Message-ID: <20231114143816.71079-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: a1AQj2/dY8mB

We rarely need to include "cpu.h" in headers. Including it
'taint' headers to be target-specific. Here only the i386/arm
implementations requires "cpu.h", so include it there and
remove from the "hw/xen/xen-hvm-common.h" *common* header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/hw/xen/xen-hvm-common.h | 1 -
 hw/arm/xen_arm.c                | 1 +
 hw/i386/xen/xen-hvm.c           | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 8934033eaa..83ed16f425 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -4,7 +4,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 
-#include "cpu.h"
 #include "hw/pci/pci.h"
 #include "hw/hw.h"
 #include "hw/xen/xen_native.h"
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 6b0e396502..b478d74ea0 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -33,6 +33,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/xen/xen-hvm-common.h"
 #include "sysemu/tpm.h"
+#include "cpu.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 0fbe720c8f..f1c30d1384 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -22,6 +22,7 @@
 
 #include "hw/xen/xen-hvm-common.h"
 #include <xen/hvm/e820.h>
+#include "cpu.h"
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
 static MemoryRegion *framebuffer;
-- 
2.41.0
