Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5072553ejc;
        Thu, 31 Aug 2023 06:00:07 -0700 (PDT)
X-Received: by 2002:adf:de83:0:b0:31a:d5fa:d710 with SMTP id w3-20020adfde83000000b0031ad5fad710mr3793623wrl.2.1693486807751;
        Thu, 31 Aug 2023 06:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486807; cv=none;
        d=google.com; s=arc-20160816;
        b=s6o713OUDFB6kP9kfr8P2wTL2fOV2aE4bT+2ibEzeAQyMe8Sa+RCGfaxarYLP+fIlg
         CDTNBDRZfoZKmd1AJa9Wm0Uckv5oflYXHfrl1lXp/0jhuUZctov/h38ykW6jLCM399gu
         l//+47KEhmSS/a2nV7eipgrm1vXyTUhYhXNudYWQ6X3Vrmze2cPioW+oBr+dMI4WZdhN
         2VXtKzw+Bvc1XPNeJ7AUVoB9L9q+qjVZCS3oQ15RC0j6L5hvGTOijRPfHqzwgtDhvvzH
         dF+NMy5dFFg67plWtJo4x0dpeMZjjzIoOuejgrodjDp0mNcFWA5MunfjG1KgmtYuWkT/
         KLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RBqrh3+OwbRO0FKJwz0pOQZiq7Hglu3XVSiWyrHauk4=;
        fh=W7c4U4W3/8gWLrb98VKeqowzGk5A+4yUlqQlX7h+jUQ=;
        b=w5ACT9G8DvhSIwKVynpi2T2vZafPO/xz+hqKzYNRWdpoIPw6t65dy9+uV+MCbaEHUn
         yzEGCL2Ml06erbVnn0C8p2s4CCABSZBWqu+ktZ1ZfGp5auDjj2BTNN4LV9Pfn9RwHK3F
         xbxF1XMkKN86okM1HjA4/weh/mk27aliCCG4Y8/cQDq19qSqL8TOauUNp/1h7K4p/zcf
         rZ7S/arxB9IlciMo+8hDVDSQG/4BWTMg4uXAMh5JNMia+mSa94q7BCUSFP/hbA0FUiZX
         LbzC/BYCsR4AzhrTpvWESRAoFN4nPeUeYXu74Z6YdUzXNtm/4sa6dklPK9BBXqjNgbuH
         JPXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aupARbEk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u29-20020adfa19d000000b003144087acbdsor217922wru.10.2023.08.31.06.00.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Aug 2023 06:00:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aupARbEk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693486807; x=1694091607; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBqrh3+OwbRO0FKJwz0pOQZiq7Hglu3XVSiWyrHauk4=;
        b=aupARbEkaTV0ahX66PgLNyngXZ3dIS/hA2v1dKXV4ryzX+iCLwMKynahVQSNndsbg1
         WNQf7606u/qr+kXvMkwD9hhucl79InQzTKUSUh3C5eZAICKvueva5Tb2vP3jxd0lmOWI
         vp86aTwVAb0Ve/TPE9FQePZHlnHpNfFVHredBHOkV3huSYZJbJvLxAplJD9HO27jNzJH
         YPfMb2hXzMVC/zNoYScFQ1Cq1ke0uHLDLUG30urx+nP+AK43vrh0on7oqZ5eNYn25uT8
         hFAniEeFFFO6YT+E8ZSOmbioBZeo8IbPhE0fb2RKadS1XSBe8Q/MO04hzX3/6X4FWmno
         +f9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693486807; x=1694091607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBqrh3+OwbRO0FKJwz0pOQZiq7Hglu3XVSiWyrHauk4=;
        b=LLlvEio57i5FOzdQ4Yzc16vIx4ZUqPOEUq2dgwE6h0szeAl9gapYBfQkz/ChZpBWGu
         2H3F3TGJIJ8AmyKKcTqL24tckPIvTvt9XhDnJvy17nrHB30qZBDWXsAd8mzXXMR0N6hp
         A2Nfi64t1sxuEjgMPtpYFaYTSJE7XOsQPDy8BNuGs3HiOpKF4hShw14p6epOI4yEDwO4
         A3bDbzlt1QUsOCVR3u9pDmYe0l0eseKf65uUklPSXEyOA9Edwb8Ri4vXWtTDg0aVJ+5K
         4equR+QYpNApr/tD3/rE7FkIfMWj0MaXNpw6+PzumO14OPsP8TwfBWy3M7aueHI5iQA0
         Bz+Q==
X-Gm-Message-State: AOJu0YwtHOe/gGQp8DyZWzcJUOWeD/fRZDx4vZ88GY9qj23RDCEmiO7p
	nxug9276rcD0qyuQ2tST1ANG8my4
X-Google-Smtp-Source: AGHT+IHFtn1g4oVr4OxUDyOHvfLkdRRms95A80KEEeJytluOw9x87dJtzVPYJS4DW6y4OFRSEbfikw==
X-Received: by 2002:adf:e5cf:0:b0:317:e542:80a8 with SMTP id a15-20020adfe5cf000000b00317e54280a8mr3780210wrn.15.1693486807461;
        Thu, 31 Aug 2023 06:00:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.245])
        by smtp.gmail.com with ESMTPSA id i16-20020adffc10000000b0031c5ee51638sm2147619wrr.109.2023.08.31.06.00.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 31 Aug 2023 06:00:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Sergio Lopez <slp@redhat.com>,
	kvm@vger.kernel.org
Subject: [PULL 33/41] hw/i386: Remove unuseful kvmclock_create() stub
Date: Thu, 31 Aug 2023 14:56:35 +0200
Message-ID: <20230831125646.67855-34-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NJIwgR8XS86L

We shouldn't call kvmclock_create() when KVM is not available
or disabled:
 - check for kvm_enabled() before calling it
 - assert KVM is enabled once called
Since the call is elided when KVM is not available, we can
remove the stub (it is never compiled).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230620083228.88796-2-philmd@linaro.org>
---
 include/hw/kvm/clock.h | 10 ----------
 hw/i386/kvm/clock.c    |  4 +++-
 hw/i386/microvm.c      |  4 +++-
 hw/i386/pc_piix.c      |  2 +-
 hw/i386/pc_q35.c       |  4 +++-
 5 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/include/hw/kvm/clock.h b/include/hw/kvm/clock.h
index 7994071c4f..3efe0a871c 100644
--- a/include/hw/kvm/clock.h
+++ b/include/hw/kvm/clock.h
@@ -13,16 +13,6 @@
 #ifndef HW_KVM_CLOCK_H
 #define HW_KVM_CLOCK_H
 
-#ifdef CONFIG_KVM
-
 void kvmclock_create(bool create_always);
 
-#else /* CONFIG_KVM */
-
-static inline void kvmclock_create(bool create_always)
-{
-}
-
-#endif /* !CONFIG_KVM */
-
 #endif
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index df70b4a033..0824c6d313 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -332,8 +332,10 @@ void kvmclock_create(bool create_always)
 {
     X86CPU *cpu = X86_CPU(first_cpu);
 
-    if (!kvm_enabled() || !kvm_has_adjust_clock())
+    assert(kvm_enabled());
+    if (!kvm_has_adjust_clock()) {
         return;
+    }
 
     if (create_always ||
         cpu->env.features[FEAT_KVM] & ((1ULL << KVM_FEATURE_CLOCKSOURCE) |
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 7227a2156c..6b762bc18e 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -180,7 +180,9 @@ static void microvm_devices_init(MicrovmMachineState *mms)
         x86ms->ioapic2 = ioapic_init_secondary(gsi_state);
     }
 
-    kvmclock_create(true);
+    if (kvm_enabled()) {
+        kvmclock_create(true);
+    }
 
     mms->virtio_irq_base = 5;
     mms->virtio_num_transports = 8;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ce1ac95274..3de8e0d741 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -192,7 +192,7 @@ static void pc_init1(MachineState *machine,
     pc_machine_init_sgx_epc(pcms);
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
-    if (pcmc->kvmclock_enabled) {
+    if (kvm_enabled() && pcmc->kvmclock_enabled) {
         kvmclock_create(pcmc->kvmclock_create_always);
     }
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 37c4814bed..a95c5d046e 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -183,7 +183,9 @@ static void pc_q35_init(MachineState *machine)
     pc_machine_init_sgx_epc(pcms);
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
-    kvmclock_create(pcmc->kvmclock_create_always);
+    if (kvm_enabled()) {
+        kvmclock_create(pcmc->kvmclock_create_always);
+    }
 
     /* pci enabled */
     if (pcmc->pci_enabled) {
-- 
2.41.0
