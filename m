Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498024ejd;
        Fri, 19 Apr 2024 08:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6WJKkJ53eOhhVp/p3sLiXsh76PniJ8vx6jixWk0Fo1V0tL2q3jGFTKjZ76Rr5H7WZmxUxFuqDasITxJAUR14aw5B7/u9t
X-Received: by 2002:a05:600c:1c9b:b0:416:4641:5947 with SMTP id k27-20020a05600c1c9b00b0041646415947mr2231086wms.34.1713542395730;
        Fri, 19 Apr 2024 08:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542395; cv=none;
        d=google.com; s=arc-20160816;
        b=hbnQSsfwwDeSFkEqW/4wHY39T2eD4v74+icwQcIUjbYG64mWnFX4fxJzcdCRXPgfJU
         sZgaNKpzptW3V83akf5g9IxG0pyw3PTur+u4LJylcLxSk/hV3co4ued0dNz2ppGZAIWB
         gx70I6KhW9g1k1UTFIfKTXj4MUAU4nvcTHRfj9MtV4mSWZywBvZ2wUzltLn7k64w3NfQ
         3Arb9Qgm9w0XTbZqNd5hrGBqCsFKn8QaSn8NKeCVqcjm3okzvjdWz9hGTvSTrASaGgUb
         kwbYi5eQOW8u6NYi5jg1ZJPJKk/Hm1gvEBKs5H+mQe9sbJBl1ITa26HG4OXh0viGxMjF
         YvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6nYDbfiehTdxZ4oKQVaAYQN5jvjqz012O7hP4xktYbg=;
        fh=aUkJSj5F10s1hPH/ReDL9XIrK4/2ws7H3TExfTSUA5E=;
        b=wLWEJvR/eGIbRKqApgweadISHRlXHEW7zHrNOrmK9RpTvTO/66Gc8qLC+SgQBqN2Cw
         j2BPXkmc4O5uWYfZdIIpIweD5CDnZ0LiS2805YBMnxvE7N9mo7qpaaVizEdK2xzFd2pm
         GbW/HrTSek7DzXukg2zjjdPWZrKCtkPla9M3b4TXOF9cFOyJO3PSaIMZSu/pcmVxAI7l
         f1z/6fnnEa/bH4EkEr7ettvYKXpJspckoiXPvYeC9OhODAsPzQOcB5rgkXCspd6y7kj0
         3jDJQVZIK4KHv9ytMdEFoV3vE1ei/7HixdqpQR1NhHjt4N/5iPjVqO1xfaC6N9Qmc9iw
         4qCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r93Al6Tc;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g16-20020adfa490000000b00341d977bd66sor2041934wrb.2.2024.04.19.08.59.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r93Al6Tc;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542395; x=1714147195; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nYDbfiehTdxZ4oKQVaAYQN5jvjqz012O7hP4xktYbg=;
        b=r93Al6Tc7Gt7uQ3Dknu55lxGMaidPyMWpOd6K1NbPzwxOn5gwzTP9ETg6GupLD965z
         bne3la80nGpPBZI/bFNX7oKq9UvTQDpQPrx47PihmaanSiqcDrUZwkosBQeg8oK15Y12
         9zicX7O9pGupC0VM5nC45inu5op8RWIkNNPSfKfW+faCGne722KVzL8z0KyTFmBJjhHf
         QUlUCyagFaTV+BVwGWdXyMaVj/pzBXqHXvc2jX2CuiKN0ZZP8EWInHV+0F+Z+o21KOZR
         XUONEeg9CMYf5zUogtpu8enLJ+sxP8KncyiIrfI1QTZYHIpSapYomPMVwYs26eN8CUGa
         ek7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542395; x=1714147195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nYDbfiehTdxZ4oKQVaAYQN5jvjqz012O7hP4xktYbg=;
        b=wDRh+6kTyffg2ZUO1vXSx8FJcXynq9vna52ygDRucDPaRYDpNzZa88sEClHly23SFD
         dB01Vf2RCSG8nxAVgVN/erFr2ue/4eb9htuMYxO+JyQFEwp0wrgGR8Fq4BlTt22DZgcQ
         TBgBE97IfRlRV34FBSApr3CCWiFPX8cr2sLFogZ8pfo/J+EQOapcCSLKAiO3ApA4ZypC
         /mQ4DX/MTPHaKJO6TkluG7RLbOmRWazhNlGhKo2RMvl8seWYMyqLf2lolri3O9vAALyF
         qQLAhHqvHxiKtp3JKOcCAOPVLUgEm8mRqiBVJ4rIy6kzhoel/9v8IScqOImgxma/vWAo
         O1Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUF8KvCY9Cb9C8rTDkKzo7yeHNUJSyHoIvIpQaIdcr3xFCX2bB6EJYwXQ4io0D5JSJxHBEufAH+yj1C+fSahXn5u5qveHI2
X-Gm-Message-State: AOJu0YxuKlJ3j/3VYbnHqRo1fLQtCzPP9aARl3FUnADgk6IzuUDv/JY8
	yGjZqHcsmxU0MyciUXdi3Mr1bolgj4hdODyk6l+jKh5ilQi/6Q74ACwOA8hohg5CMTCQisGeZJm
	lm3A=
X-Google-Smtp-Source: AGHT+IENd+TeX2PBr9ChBBd+ruacRcP4c4TYBzXGQ3ipRL9oc1orolv3f+o8CLX8XZE/mgXca1Ufaw==
X-Received: by 2002:a5d:6da8:0:b0:343:7032:7283 with SMTP id u8-20020a5d6da8000000b0034370327283mr2695209wrs.8.1713542395421;
        Fri, 19 Apr 2024 08:59:55 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:55 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 13/22] hw/arm/boot: Register Linux BSS section for confidential guests
Date: Fri, 19 Apr 2024 16:57:01 +0100
Message-ID: <20240419155709.318866-15-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HwPZX0CKbwQc

Although the BSS section is not currently part of the kernel blob, it
needs to be registered as guest RAM for confidential guest support,
because the kernel needs to access it before it is able to setup its RAM
regions.

It would be tempting to simply add the BSS as part of the ROM blob (ie
pass kernel_size as max_len argument to rom_add_blob()) and let the ROM
loader notifier deal with the full image size generically, but that
would add zero-initialization of the BSS region by the loader, which
adds a significant overhead. For a 40MB kernel with a 17MB BSS, I
measured an average boot time regression of 2.8ms on a fast desktop,
5.7% of the QEMU setup time). On a slower host, the regression could be
much larger.

Instead, add a special case to initialize the kernel's BSS IPA range.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: new
---
 target/arm/kvm_arm.h |  5 +++++
 hw/arm/boot.c        | 11 +++++++++++
 target/arm/kvm-rme.c | 10 ++++++++++
 3 files changed, 26 insertions(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 47777386b0..4b787dd628 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -218,6 +218,7 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
 int kvm_arm_rme_init(MachineState *ms);
 int kvm_arm_rme_vm_type(MachineState *ms);
+void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size);
 
 bool kvm_arm_rme_enabled(void);
 int kvm_arm_rme_vcpu_init(CPUState *cs);
@@ -243,6 +244,10 @@ static inline bool kvm_arm_sve_supported(void)
     return false;
 }
 
+static inline void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
+{
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 84ea6a807a..9f522e332b 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -26,6 +26,7 @@
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "kvm_arm.h"
 
 /* Kernel boot protocol is specified in the kernel docs
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
@@ -850,6 +851,7 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
 {
     hwaddr kernel_load_offset = KERNEL64_LOAD_ADDR;
     uint64_t kernel_size = 0;
+    uint64_t page_size;
     uint8_t *buffer;
     int size;
 
@@ -916,6 +918,15 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
     *entry = mem_base + kernel_load_offset;
     rom_add_blob_fixed_as(filename, buffer, size, *entry, as);
 
+    /*
+     * Register the kernel BSS as realm resource, so the kernel can use it right
+     * away. Align up to skip the last page, which still contains kernel
+     * data.
+     */
+    page_size = qemu_real_host_page_size();
+    kvm_arm_rme_init_guest_ram(QEMU_ALIGN_UP(*entry + size, page_size),
+                               QEMU_ALIGN_DOWN(kernel_size - size, page_size));
+
     g_free(buffer);
 
     return kernel_size;
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index bee6694d6d..b2ad10ef6d 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -203,6 +203,16 @@ int kvm_arm_rme_init(MachineState *ms)
     return 0;
 }
 
+/*
+ * kvm_arm_rme_init_guest_ram - Initialize a Realm IPA range
+ */
+void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
+{
+    if (rme_guest) {
+        rme_add_ram_region(base, size, /* populate */ false);
+    }
+}
+
 int kvm_arm_rme_vcpu_init(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.44.0
