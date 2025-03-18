Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694631njb;
        Mon, 17 Mar 2025 21:51:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEv94ZAFrTIGgcf7mljQhcWuwDid5pxvJWCaP6wcffxnQB4L9Q/2iq29z3TfAw0PuWRPJbjqdcqX/FZA==@linaro.org
X-Received: by 2002:a05:6a20:9c92:b0:1f5:6680:82b6 with SMTP id adf61e73a8af0-1fa461552c5mr3160053637.38.1742273502945;
        Mon, 17 Mar 2025 21:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273502; cv=none;
        d=google.com; s=arc-20240605;
        b=WMGjkL/ez0fQ4Q7OnxsJfJo1udzsYl6R0+SrkiUO5Aq63YpvLGtmOX08vjytr3Fuuc
         1UxBVVLoAAwkc2CRiBGbfKpRpRJz71TEIRWLa9lzYFrBVw0cZkIOO2kiwTFke7Z1ejBl
         aC5CmnhhxPON4lgyzn5mDKD0x5bvIf+xF74LzzI9mUNWQ956prlEYWDMCXgjBV0/Zb3e
         XA/G546naMZWs7+PY5xypp1Sypq4bp6hp6VGXMD/Ss0nTOqftao+ATl0szF9v3X50fgX
         QH9S/DZCprzmIhYHhhE/2761VvbrCVRDvPKD489ggGck3aDGySwn/zuQqHjnAoV8uQug
         fjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wWxuqDn4s8YGDZbkaUM66zf0LxM3gMsyBA+i/Ql3r9I=;
        fh=DA1yiCwS2ZeelBf+1UPJlstICwETmgZcOToCs+IVT3c=;
        b=XgeKKwnl/6NTZy6d4BtKhuTXovmN4ziSQPNzIf9rfBL0VG4WcRj9sG9CripWs29QxE
         ZnxXoJYvuo6cG5Zybj5oDy9n57Osz/h2IMl+2lAQH+YXiDjNr5vlUy5mtgZ8nLKe1T3D
         HKZBMWh2PrXWL5WdovNgiX3++NZtxL+xHZR0jLL8jR/B6QrlXrDleAIkPmkYIl0aVRQF
         B7SYnJr6U7X1W/G8WUSmLnC+uzWiEJ3sJ4uyFiiTxgWEzr30eJDvM9P1sGCgPo0cIrg7
         lxQfpfH4nr9jPMgzK/V0CIOfTrZiQXJRG3x6h8qUsGP28ViycT66ZaYPcAFmTpfcaSNS
         qxFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i11eq/rx";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af56ea82b28sor7629551a12.8.2025.03.17.21.51.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i11eq/rx";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273502; x=1742878302; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWxuqDn4s8YGDZbkaUM66zf0LxM3gMsyBA+i/Ql3r9I=;
        b=i11eq/rxp5n5pKMkOxjv5zh66XVwhfHFkxfIRITGarmYyi0TJE0EKRw/q/UPa/4hUE
         +Y/URnqPRyUpcF/lT3tflFJyKsGdy94oo2lNK6W0dpnJEFGSEvOdqgnzmW5uUp5Y2PDM
         paILCIXovbh9pxZ5bYuAoaFyevD21O7NOEiBbKAHZHL+8bpWQw+NKAIfAlFKkxK9iC8/
         bJiANHmmvel+s+u/2W1ppZ8FVh4P0PLGDl3pV8x2xRY9eGxcSnYmA6hK+FHOOg+dbuCs
         nGqPMa+H4iMih37HvbEu9R48rFKBoeb5z8r4UqqIuIzI5R/ora91nja9eQMMJAlrzpO0
         /V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273502; x=1742878302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWxuqDn4s8YGDZbkaUM66zf0LxM3gMsyBA+i/Ql3r9I=;
        b=Qse7IwE6HGHmL+DR/8iPav6eFLGsQTa/pfntjTbcMUbDvjCEgfnp7qVcfbVsXJ0qha
         4UIfipeiF94nC2QnbnEDRuCaJtdZvGyb9+S1JykZmsXn2kkQSXZbMsnHs1lwZsSCV2Ri
         SBtSkJvjw6cioh6woytAcK3PPSaUaKbJ8/DiudjMxk/e2FlMt2i8cp8doKZr9RNaNoma
         pOVOw+3b+nl5zhWwrJgKWlkIx773+NmmkpamhmmrtkHrKTkDrw97mzHxZ6rwu2bbgWzf
         QZ9ZUrC3CwSdiAYpczpnSH7lCj6UPPLKlWj8M3yGvLKOt7C3Nu2+xXk6V1Nm6QU/GScl
         WC4w==
X-Forwarded-Encrypted: i=1; AJvYcCWwi3NebUNwtg815DmtFSCZ/K9w97AJWqxf5pffA6oAv1wgBFzVniH+sisxDkU9SQRf1D2LrnVV8p8dkQ==@linaro.org
X-Gm-Message-State: AOJu0YxOzdhHEFoGbKjBrotmXZaWvR13J3V+PBZlr0A7CEyxg/upbqiL
	Bhyoafs0bmktYe+LJSiOiemwQKETA+4H/2Qf9OzcK6k+b/Xk2W1scj34iOCWIE8/uYzklwM5Xm0
	6I/M=
X-Gm-Gg: ASbGncsXLk2/q1MQxUak3YUvMZNCnKbqpTbNoeVc5PeRxa8xvJiIgQeBC06DZjHZV/8
	XxqUVTaGWjH2FaWXQGnvop0/dKy/uGlSxBwzu3YprLcKioXXAyPy0K22rb8ZvrcsqftgI/71cqv
	DBdzo4GA9H8SnzUXuWD58psRSMUhdZolfZOZxAUxlIM0rr5CVI9j2/YdM8I+YzXFuzrzYCvhTIK
	XLUk3BP3dRHbx9cDs7Yy3MlAPQC0dd2pwKEJIGS9p3ej5MWtROw4A9uO5rdBy6DasQbi6Z9Oic5
	l1xsmszlunI/T8nNJ6qcqYZ1oyRvfb3b4nvrmYzMm/Bc
X-Google-Smtp-Source: AGHT+IFe64voSZsfhB6tCQvZ6JsS5YIy++Gra9YOoX3NHYIjPdoV//u+oQg4+pI0ZxYcfpZboB2sWw==
X-Received: by 2002:a05:6a20:9c92:b0:1f5:6680:82b6 with SMTP id adf61e73a8af0-1fa461552c5mr3160029637.38.1742273502551;
        Mon, 17 Mar 2025 21:51:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:42 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 10/13] target/arm/cpu: define same set of registers for aarch32 and aarch64
Date: Mon, 17 Mar 2025 21:51:22 -0700
Message-Id: <20250318045125.759259-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +fArFlhTNMzy

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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 00f78d64bd8..51b6428cfec 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -175,7 +175,6 @@ typedef struct ARMVectorReg {
     uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
 } ARMVectorReg;
 
-#ifdef TARGET_AARCH64
 /* In AArch32 mode, predicate registers do not exist at all.  */
 typedef struct ARMPredicateReg {
     uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
@@ -185,7 +184,6 @@ typedef struct ARMPredicateReg {
 typedef struct ARMPACKey {
     uint64_t lo, hi;
 } ARMPACKey;
-#endif
 
 /* See the commentary above the TBFLAG field definitions.  */
 typedef struct CPUARMTBFlags {
@@ -656,13 +654,11 @@ typedef struct CPUArchState {
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
@@ -707,7 +703,6 @@ typedef struct CPUArchState {
         uint32_t cregs[16];
     } iwmmxt;
 
-#ifdef TARGET_AARCH64
     struct {
         ARMPACKey apia;
         ARMPACKey apib;
@@ -739,7 +734,6 @@ typedef struct CPUArchState {
      * to keep the offsets into the rest of the structure smaller.
      */
     ARMVectorReg zarray[ARM_MAX_VQ * 16];
-#endif
 
     struct CPUBreakpoint *cpu_breakpoint[16];
     struct CPUWatchpoint *cpu_watchpoint[16];
-- 
2.39.5
