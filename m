Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279085njc;
        Thu, 20 Mar 2025 15:30:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0qp4pVXjKy0h/61Wt1RHWFBZSKSwUVpe4ETyQJN2eDu1xV7AskGF+mvDWGhHmzA+3bZdjvrYKguwo4Q==@linaro.org
X-Received: by 2002:a17:902:d488:b0:224:1005:7280 with SMTP id d9443c01a7336-22780e121e4mr16300125ad.38.1742509834270;
        Thu, 20 Mar 2025 15:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509834; cv=none;
        d=google.com; s=arc-20240605;
        b=lre4oGlE/cEEeq9AlzrRJkTBi08WqOK8iTIC1PIij5W+jDsdKu2ssCbW0+OwF9ObVv
         OJDGPMu9rtvXFuOPLPkSnYFM7ZRyB+ImRzssSNaPhq8xSaRLYWZNkUANl4i8BbHGC1ZN
         0d3Ebp7WC9DwdeE/deJp4YvvUJ5PhNUsT0IwUQn19/kuXktiW6XjKv4Nq2CUk6RZnvpZ
         haFC5Xm42Tdp81oRfSvDwHfdb77XqaOYY4LSkifWoGAPD5PbECkeTfl2pKc48UNxC6q4
         4J1aZw0TJ13zAqvVIBMycyKFEQRXWDJC2QnIrCQzsETKIYoLXczHsK8JrLMVH51euaAV
         vFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9ozZ2STeyLcJfOi2HO38PmZ1SSe1ZJ6WASMV/GdeD4Q=;
        fh=iryHRABNQnrRUrJTfJBKhtjBE6JumH3SZIUKA+Mhg0o=;
        b=ImWOHFZSZsbINR3qhSCRLAytFhaeKPlFNLv2878teRPWlSwah2wIdT4CxMeN/wUmui
         pnEd6FrMOppoCjuAhCRpl+0ecHLMEc1gLRxfkYMfeFjFHEb5G9vujDXeiDX4mCY3ynZj
         uqRh4JJ7AWlCCwkDN61OHw7Ix2g2YHqcIev8OEypuO0vCGVEH70fntUmOiwOkHpcD/vP
         llElnXo/cj3qgCERw8Ek1iOc2rUK0YwHZnZU7oxt1r2pLDFlnoKN/90RZEYlBNxC+KS8
         WriiSVgX4Say2HvLxU8t6IZLT3AqeBReyO5ZPMeIVnt/zlUP+D6wr/rGq+ufyn7dD0i7
         vnXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFOiNiEG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f5bee4sor2903515ad.9.2025.03.20.15.30.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFOiNiEG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509834; x=1743114634; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ozZ2STeyLcJfOi2HO38PmZ1SSe1ZJ6WASMV/GdeD4Q=;
        b=zFOiNiEG6z1Jvz2010yV06N0kfOHJ2JscnUUf2wHMlCJ9JPZC/mYhuo7ziUtgXxl6z
         MvEeKKAPVqeKfDMOwCS26Mh2B8oHjpJ3ztd+uUb1lAHFZnUSaTy5lvoKvG7SbBqL61/y
         w5MqesGcO0RawgpgvLA81zT061yk7im+utu+K3MU7rYxwCmd2XROafCKDi+XFgG/Y29e
         xWN2+WLbEy+mYDNoQdj/LxezlynZncbbWYnhPjLqN+QXCD7L787A9NaIaitBHiPHJyBB
         pupYRn+F9Lrc67OmWWDyt0nGAeSRlPE2R6mO017FJoAzzzfvIG0e/r05MGQQdVDuvKG9
         OqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509834; x=1743114634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ozZ2STeyLcJfOi2HO38PmZ1SSe1ZJ6WASMV/GdeD4Q=;
        b=OYT5zLehN6FQceXxWAa5/revBwQXB8rk9s9EBPXcWhVYPEkml0fJrvV+jvHkIRd61d
         x1kaMTNun56Ju0mKR8glWnXfWD8J8zBqXJ6l4NTFT0tbt/ISRiwM+1uzosji4ibin91L
         6ZlbK8IiQeEwRZZIS6lyUgMRwUBOJm+LtRYgxtTlWvOI4KU5lg9VeWeWd7z412mqKCHz
         uPDRxM5F5ae4lKz8BIS+yr+GyRlobGK9+5X7LzFUw6QIWcvJ1cz22td/LhWK6ZHnTHHV
         Jp6jeEVu2LTupB7ew2n//mX+TbCyz7otykD+0smuQaztHE6yFAZ7Q6YssNDVd7SNr5hk
         /TpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpcgS4oWFUFgSL1yVB8IkCA8yBPmuK0kyKlUCZjJ+dYC9iOEB3GdDioIHVXhVd+2q/CZE5iP/UDF4W/w==@linaro.org
X-Gm-Message-State: AOJu0Yx0z6DowBfi7TCdwMDYBX6XwIDwrUekzO7E9owcgSsOi8vL2S0m
	jBUsdMHPEnCe9xw7atTT4F3tWkaJaKpJC4FCRUvZCMYoKuMavAGhPOvkPkgpApxYzL8DefW57jR
	UdlE=
X-Gm-Gg: ASbGncvpalzS86tFZOstpSI+rCxgRNLzqEu/LpyC8vCp35NT/1N6C7zgSSl4msPZtjf
	FYpVJ2vW7REwa78rD/egLO/dSMy0yej/PQi4jBZn4TVB0USLWCuqfuzoMPw/uA/+w+oZmoJawX7
	YDAXbpRTFMYMfhGbnxQON1+9zM+gGdov4NPsr19XE4Au/26D3fX4RiyALiL52OoeC9tm7ma/Co5
	jRoyP8XXneR0RP6h2pc050EomCEqyT+cEID3bpg4GZpUrLcKKlhYvqNGejoFT9F9FovXWZE/TqW
	9CKmXJjPI08Rc/nhuOZ1zduyxWroqcQHITislaXGJV5P
X-Google-Smtp-Source: AGHT+IHe6GBkn4KwpLvaTmmjJDIDMzLP05ORVKokysmKy53aE2ukm/kc/ZOTuWlwBaafsA2wQaDJ1Q==
X-Received: by 2002:a17:902:ea04:b0:224:1294:1d26 with SMTP id d9443c01a7336-22780c7afa2mr10974305ad.13.1742509833662;
        Thu, 20 Mar 2025 15:30:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:33 -0700 (PDT)
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
Subject: [PATCH v2 22/30] target/arm/cpu: define same set of registers for aarch32 and aarch64
Date: Thu, 20 Mar 2025 15:29:54 -0700
Message-Id: <20250320223002.2915728-23-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FKSR6eWpiR+4

To eliminate TARGET_AARCH64, we need to make various definitions common
between 32 and 64 bit Arm targets.
Added registers are used only by aarch64 code, and the only impact is on
the size of CPUARMState, and added zarray
(ARMVectorReg zarray[ARM_MAX_VQ * 16]) member (+64KB)

It could be eventually possible to allocate this array only for aarch64
emulation, but I'm not sure it's worth the hassle to save a few KB per
vcpu. Running qemu-system takes already several hundreds of MB of
(resident) memory, and qemu-user takes dozens of MB of (resident) memory
anyway.

As part of this, we define ARM_MAX_VQ once for aarch32 and aarch64,
which will affect zregs field for aarch32.
This field is used for MVE and SVE implementations. MVE implementation
is clipping index value to 0 or 1 for zregs[*].d[],
so we should not touch the rest of data in this case anyway.

This change is safe regarding migration, because aarch64 registers still
have the same size, and for aarch32, only zregs is modified.
Migration code explicitly specify a size of 2 for env.vfp.zregs[0].d,
VMSTATE_UINT64_SUB_ARRAY(env.vfp.zregs[0].d, ARMCPU, 0, 2). So extending
the storage size has no impact.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cc975175c61..b1c3e463267 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -169,17 +169,12 @@ typedef struct ARMGenericTimer {
  * Align the data for use with TCG host vector operations.
  */
 
-#ifdef TARGET_AARCH64
-# define ARM_MAX_VQ    16
-#else
-# define ARM_MAX_VQ    1
-#endif
+#define ARM_MAX_VQ    16
 
 typedef struct ARMVectorReg {
     uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
 } ARMVectorReg;
 
-#ifdef TARGET_AARCH64
 /* In AArch32 mode, predicate registers do not exist at all.  */
 typedef struct ARMPredicateReg {
     uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
@@ -189,7 +184,6 @@ typedef struct ARMPredicateReg {
 typedef struct ARMPACKey {
     uint64_t lo, hi;
 } ARMPACKey;
-#endif
 
 /* See the commentary above the TBFLAG field definitions.  */
 typedef struct CPUARMTBFlags {
@@ -660,13 +654,11 @@ typedef struct CPUArchState {
     struct {
         ARMVectorReg zregs[32];
 
-#ifdef TARGET_AARCH64
         /* Store FFR as pregs[16] to make it easier to treat as any other.  */
 #define FFR_PRED_NUM 16
         ARMPredicateReg pregs[17];
         /* Scratch space for aa64 sve predicate temporary.  */
         ARMPredicateReg preg_tmp;
-#endif
 
         /* We store these fpcsr fields separately for convenience.  */
         uint32_t qc[4] QEMU_ALIGNED(16);
@@ -711,7 +703,6 @@ typedef struct CPUArchState {
         uint32_t cregs[16];
     } iwmmxt;
 
-#ifdef TARGET_AARCH64
     struct {
         ARMPACKey apia;
         ARMPACKey apib;
@@ -743,7 +734,6 @@ typedef struct CPUArchState {
      * to keep the offsets into the rest of the structure smaller.
      */
     ARMVectorReg zarray[ARM_MAX_VQ * 16];
-#endif
 
     struct CPUBreakpoint *cpu_breakpoint[16];
     struct CPUWatchpoint *cpu_watchpoint[16];
-- 
2.39.5
