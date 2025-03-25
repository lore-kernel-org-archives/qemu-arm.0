Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397074njc;
        Mon, 24 Mar 2025 21:59:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1jWA+xh9zQc2dFpdyEpn3L5LF0xwIZ1aL+GAIGa/Q0+oKShU7hi5wjZV67KOLPS4rgejRnS57cz6ckg==@linaro.org
X-Received: by 2002:a17:902:f70c:b0:224:c76:5e57 with SMTP id d9443c01a7336-22780e02a4emr275534575ad.39.1742878778413;
        Mon, 24 Mar 2025 21:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878778; cv=none;
        d=google.com; s=arc-20240605;
        b=OSphjKBs9xGkcMZQF7zpumypdUiMMk1K0BBVGogQgueysh60f5VVSKFZ5cDQs/qT27
         YRSla8gUksxm70l4FwPNLHF35KJ6XGec6sCNOWXrjkcWU9haD8Kf/oZ4nrHc19tOhcDz
         ++vfkjAtIawkqoLQG4y++fFB28teebJslM+VMB7R2bZEmO6Eivt6t81qoUJPTDkq5m6+
         cJ/sx+3jdE+GH1ViHO03tIysk6EKRjaZwTguetgOo7XyzFcrryRpv/gaZ46p7lfys2GR
         aYGWLZslLv2F/EwgM65IEJVSGKDPI7KRIO1tipWb5F1H2FCBCa39RDkgQ74PRVPrS+fC
         kp4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pS3gEZRMWOaWak1qsS38oc8ZE/M7wQ+w6QdzWBH2Aio=;
        fh=m6uWYhPhcGP3MsxzBlJAj6bXHxa9koe7COW8N8GQX90=;
        b=BEFJIVIjxcUsMN71VAN5QI6gIdYKh++iNOu9+MNUmkiXsVvPaCe0dAzPz8kXNu+cjp
         lzE/EG8DE3mSxrMsNLTYXkEWFHv8Lzxh+HD2nRSydJZEmlfE4o48bRjJbCLL+A5kJ0CO
         kiLShHhzS3v4C1vK26z33MaJmtdGN4OEe7ietxZymJR5HLyEXo7ULndFxtCFfyXA89Md
         U7sczUms886U/fRRC2nbkH+H7C2HJZmxhOvqe3mi9ot57S89Jo0SCgGJeGohr4tXSttc
         gnpURMDVmNOQmLilv24fRL997ksrPHaCFl+tti5xynjvcBSoskUHjsy1KziIzgcZnQFS
         A1Bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EQKj+e9e;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811dd59asor71278965ad.16.2025.03.24.21.59.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EQKj+e9e;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878778; x=1743483578; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pS3gEZRMWOaWak1qsS38oc8ZE/M7wQ+w6QdzWBH2Aio=;
        b=EQKj+e9e/Rjbkad7YVvpwPfywBTXizuWeMaNIfEi5r17R/z4PrP2ll5MjoYVBRRpXZ
         7FeYIeYVgcOL3JlZ953Xj1f2sn5j0zbrGZzkRkiyWKokbYecb8WN1JZv3/+OMAwBtlZs
         exbBVvT8trrpUGBmtpcwo9e0vrJICkI40j3WNSgTwXNfEM3WBzhhh17ptj1ng19dyk/Q
         q+DK34hCSVrA15qLNuui7AFjECwbTPZQFYZxEm+w3PWMAseh8kzNJmnG4XRtPON60xxo
         x1h6lI7KTx7hzpfEpAdCK7Xl3JtSlL+M9cPg2hARcq6RP5HA323yW+QX+8x7XxX9+Idd
         lkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878778; x=1743483578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pS3gEZRMWOaWak1qsS38oc8ZE/M7wQ+w6QdzWBH2Aio=;
        b=Z4TN/xLbbkrahmSza+Kgm1S2TCxddpnTjsCbM16rQAsKYCvtxDFBax6dVKDmek6vWe
         9CSGaZg3pIZXUY1CwO6MM8EGbllEUW0DP0AZnKBZv2qKnZ1nZUj43zyh6qAz0azpzkMc
         Bky9Ms7/7d4TGNCph1D6jU3dnhkYyHfJIMLBNFpXHoXaC0w5JsiAGs00qQDk3RHV8ASV
         dDF4igmU1J3d18svlfZCqjsCk3gdjPz1oxxOReveRlP5CcSR+IqC95NDO1269UqfzM8R
         jYGdfP1nA9sPG7LihDBdjpz50KChxC1UfW4kqCG7+MOMr5ULRQdYdMhaP2RQyo6uuKrR
         oCpw==
X-Forwarded-Encrypted: i=1; AJvYcCUpVnHMrz19Xed6PkrJC3237F0yz2WNby8gG/+JHU1bLdHsgEGSjvbl3VF8WGNB+C/FPZchMYudzhAGQQ==@linaro.org
X-Gm-Message-State: AOJu0YxcTc8ufP0KfHAgHOBYTxiqm3xTKkDFOm96YjKSTL9PqQESmyPA
	TFs6ShU19h+CtwmOcEMjmTITR1K0R4VATEb0HfZ8F/XwGibWtii0Q7WjPLp4sXstgg==
X-Gm-Gg: ASbGncsh4JChaawTZZCNAO1oxozEhUKU/gpRHpPURZ9imxPn9YBYc+OLdIWahIjMlet
	YrtjHPQDrg8bh1DfPsoTimAFW0kxxd9Mpvr3/4ZHDv+A5TA2cdH/iKaeDYnyyTylmOcBxP3+ydH
	D+cp0Zx/qZR4jCD0wwsqxSdZciMfxu7ZYx/MM7B4wl6HD0IJ8RITYWuJIiebG6sU4RInkww3+CI
	MuUjxQnrcNrtq4THI+DKISpRB3QP4SZrN6bmR9wZ73ZAYsFEGIFfkjVvPih3IoEiig1KQzJKRuv
	dTjpUEi8KeGgpu/b84tAEkOlbm5rP5ZOsKrWuBMRSGsy
X-Google-Smtp-Source: AGHT+IFSJ7fSgpYAHJW7th72zltx6rj97RlW4Khdsq0ywa9MEQR0n3b7F9efClc0LuL5kNihOGXTUg==
X-Received: by 2002:a17:902:f64e:b0:220:c067:7be0 with SMTP id d9443c01a7336-22780c50a94mr237157895ad.6.1742878777836;
        Mon, 24 Mar 2025 21:59:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:37 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 17/29] accel/kvm: move KVM_HAVE_MCE_INJECTION define to kvm-all.c
Date: Mon, 24 Mar 2025 21:59:02 -0700
Message-Id: <20250325045915.994760-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FkTSKveTjfEy

This define is used only in accel/kvm/kvm-all.c, so we push directly the
definition there. Add more visibility to kvm_arch_on_sigbus_vcpu() to
allow removing this define from any header.

The architectures defining KVM_HAVE_MCE_INJECTION are i386, x86_64 and
aarch64.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
