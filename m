Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279037njc;
        Thu, 20 Mar 2025 15:30:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDWpW4abQfITXKCLnJRGuXv1C2EX+jaZAktXUyN+zMto3D1tmgr7ePfDA1fRsOkYYl9P6naj9SzQZoGQ==@linaro.org
X-Received: by 2002:a17:902:db0a:b0:224:de2:7fd0 with SMTP id d9443c01a7336-22780da5a37mr17078725ad.25.1742509830614;
        Thu, 20 Mar 2025 15:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509830; cv=none;
        d=google.com; s=arc-20240605;
        b=AkvulSYeraKmqEy0pfmAM21YnKCREXvG/BWykuj4dEIahiQJz8iU0yzxulrnL3A7gP
         uUjBsMGXEMSpis+go/34gbiIsCPynoKNo++pglnMUVDS8FkOYpz4coamJkO4OWwtKQQ0
         53JJhXOQrQQGPt8YmV8ZReTwaCQs0GIn7bIII9YSlwgy+I3MrFe7tMpWYirEEK/OqRdZ
         BADjPfagPKWqhXgrCqrwBOrVE7QnoXVcVGZsRy7Sahua1Gt6Ygtfs0vd+FSRWd4nYu6a
         NUbcwOic5ypjT6P5Cl3jx26AZ8iwfPjU3OVN5Br+7foi0s7JwPbN6nyID/9UIyckoU2G
         TSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UwN1XbujsuD3V7J/Bz3fRu7KgVCb0BPWWPB+rJlSEhI=;
        fh=/aqDyXD/U8mH8wrmlje8+/z7gK+hcuwnM2C5lVVDV0Y=;
        b=MNkfM8Bw8NJ78TkLtinGWwEHtFy8VlISe2+/3WwkCyamegqRSEzr7xmV25OUGnsj6d
         LWIVh8VUNIqvSJIzC0Qh18jRTurJfGY55cbQSHv13bERT+O9RR6H/fwfo6C23gFLiXQt
         HlNEWJkQKRfKyRjapzwIho6EACdNYc5h4mSTxMWYkFCFzjh16rUH0411nOzCZfqa2MGG
         6Spg6DgAhJCqev/LAS9wCmWHzHIA3tx+AnfDnAWXe1rj52tiHXGl/DOvm1mtAfCaFC41
         wYCAgKB8TfwvEKy2jU5sFESMnhCYl5+FJnHlO7FqjyZt9QtTgBtu1OONJs8hRH/n4RsS
         tJWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d3b3nZkF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f0ad8asor3868285ad.8.2025.03.20.15.30.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d3b3nZkF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509830; x=1743114630; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwN1XbujsuD3V7J/Bz3fRu7KgVCb0BPWWPB+rJlSEhI=;
        b=d3b3nZkF4CRL60sLioEsXP7xx78UNzTruhd3nHK7oAWPxcxOW+UO+MvnMEuKjlvNxI
         Eoye+XQD8Dj7QI30yny0o91JdeWb6Oq3DWocaVqDQuuyIpIB+deiFpux+dK/OaUNXgA7
         yKp0wr/iQrZO/Z1P9FffehtnmYVocqKsgHr+2BVBtjymuQkwFKZ9gOxHZOdfkBl3GNcd
         QouvyDIQ5kblnOgI+QcFbkQL7W9d7atzStM26SguepOg2AbRWs3Od5wkivOKw0ec27w3
         6IOj1BI6YwKWRW1FvxvwOzoLw8UYQj8tgJbbOnB0dr/f+t/uYZJwLB+4ypAtHF1nlqai
         UFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509830; x=1743114630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwN1XbujsuD3V7J/Bz3fRu7KgVCb0BPWWPB+rJlSEhI=;
        b=TBbQYPIxMovl26Akvi1ZM9o823TQODRjTe4jXhQmZyHaAddOjauaVc4CjUnozuXpwu
         YOL+THw5i9cm+RInKXqrcIEhb6pG9Hp/IrzVVhp04VlYv8aCZN/mZgwM7w+ybL3/KwPp
         YKrWUNNzveOqgAGmtaUIEhYcbuAA6GaGyB+iQV8CrUKbnA1zN9Woc1W8OpJrPZa8F/N6
         8ppzp8wTH8hE8xZbLuE7VDFpmJTWjmmnK+l4/9R6d4sXwSHLj8H5TZQ1evgZpo7gDBpM
         GGdD1Yx0xCvh3XXiQDJROFkQ3sQ6s86XRRunPns+/TPhXLL//ww6+2tW5SpdHNUbatLF
         oSlw==
X-Forwarded-Encrypted: i=1; AJvYcCVBiObhU+MJse5fNT00Wh5gW/hLzCbbuevOfePzkstP/uzC5IiTvo9kIavNG0leRXuRXn6G7wMh4H0kaA==@linaro.org
X-Gm-Message-State: AOJu0Ywr/VF98tk8jAY0iqr/l0umwh+7S9ycbQpSCh1Qr6QD1qlKi0iC
	BiIGnDB+wJ0Nj7WYyCearxAma833Js/FvtYa9kFm8nRl2NUVPFLfYLIom9YRJ0TTEVFZq8Vehse
	+r8s=
X-Gm-Gg: ASbGncuOJSJlSHb9xsYFWsVKWaBYXt71bVJdR674SoPpuYtVSRrvSFqkevtGxDIVRQl
	nGhjusADwg1lKwiFNAOtMSbimlbTbEm+wP/IQTCCK1CRhbbe5CeZ6UnA/jL0SWH4dDxmNpUzId0
	54ur+m5+ZG2ZbHgV2NdiorIQ9AOnrOZkscHboVynDiBowkJHUbrZmjh5xoFHBhySM8QVV4F5Lkh
	bp6REkjT5AHYK5iNSNKFC0OG94vYoefgzPdgvDMMfHutK6NgI64xV5i2uUwRXZqM7llP09XBYIW
	EponuLkABRMQpUfm/grSVJcOFm6eaL+3qhAFnJG/LUXz
X-Google-Smtp-Source: AGHT+IFPlM9uNBTWNlrUQZHTXtzAV3hq70Es3JgASaflDsGAiltKwjCQjn1OTnh83OLfKZfNwL1qmw==
X-Received: by 2002:a17:902:f687:b0:216:3466:7414 with SMTP id d9443c01a7336-22780e25bd4mr13499905ad.44.1742509830242;
        Thu, 20 Mar 2025 15:30:30 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 18/30] accel/kvm: move KVM_HAVE_MCE_INJECTION define to kvm-all.c
Date: Thu, 20 Mar 2025 15:29:50 -0700
Message-Id: <20250320223002.2915728-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4Tqxh2YInpkM

This define is used only in accel/kvm/kvm-all.c, so we push directly the
definition there. Add more visibility to kvm_arch_on_sigbus_vcpu() to
allow removing this define from any header.

The architectures defining KVM_HAVE_MCE_INJECTION are i386, x86_64 and
aarch64.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/kvm.h | 2 --
 target/arm/cpu.h     | 4 ----
 target/i386/cpu.h    | 2 --
 accel/kvm/kvm-all.c  | 5 +++++
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index 716c7dcdf6b..b690dda1370 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -392,9 +392,7 @@ bool kvm_vcpu_id_is_valid(int vcpu_id);
 /* Returns VCPU ID to be used on KVM_CREATE_VCPU ioctl() */
 unsigned long kvm_arch_vcpu_id(CPUState *cpu);
 
-#ifdef KVM_HAVE_MCE_INJECTION
 void kvm_arch_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
-#endif
 
 void kvm_arch_init_irq_routing(KVMState *s);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ea9956395ca..a8a1a8faf6b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -33,10 +33,6 @@
 #include "target/arm/multiprocessing.h"
 #include "target/arm/gtimer.h"
 
-#ifdef TARGET_AARCH64
-#define KVM_HAVE_MCE_INJECTION 1
-#endif
-
 #define EXCP_UDEF            1   /* undefined instruction */
 #define EXCP_SWI             2   /* software interrupt */
 #define EXCP_PREFETCH_ABORT  3
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 049bdd1a893..44ee263d8f1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -35,8 +35,6 @@
 
 #define XEN_NR_VIRQS 24
 
-#define KVM_HAVE_MCE_INJECTION 1
-
 /* support for self modifying code even if the modified instruction is
    close to the modifying instruction */
 #define TARGET_HAS_PRECISE_SMC
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0723a3933bb..7c5d1a98bc4 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -57,6 +57,11 @@
 #include <sys/eventfd.h>
 #endif
 
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+# define KVM_HAVE_MCE_INJECTION 1
+#endif
+
+
 /* KVM uses PAGE_SIZE in its definition of KVM_COALESCED_MMIO_MAX. We
  * need to use the real host PAGE_SIZE, as that's what KVM will use.
  */
-- 
2.39.5
