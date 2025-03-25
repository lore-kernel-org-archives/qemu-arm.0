Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397105njc;
        Mon, 24 Mar 2025 21:59:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4uePqg8cneSb9x4npl0qG+nDUCuD6ENnS6SU9lWonm6IJ4CwLzfBcVxCflZ7ZeQCfZV/tD/fdEPtsDQ==@linaro.org
X-Received: by 2002:a17:90b:4cc1:b0:2ff:5cb7:5e73 with SMTP id 98e67ed59e1d1-3030feebe86mr22120422a91.23.1742878782069;
        Mon, 24 Mar 2025 21:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878782; cv=none;
        d=google.com; s=arc-20240605;
        b=M5YRGbg4e87+gk8XerT8cnPIxLRYLA7p1I7PWI/Ob9OQMbRIL68K7jf+bg+6Szb3gN
         5gojDjyBS6A98J+bvj8/Z5Mv2gCflUUUE9ompPGuX/bCpo1HI/RwaKV7qtvRHFgsO+x0
         wdmegQHYaeuRvnZ1oHz+3klbT6Ux9aRJhQiGkyOalRVqfxiP9caDFqVYCGSoiUoJjZH6
         xhnte9rRIK0W2NF5dNgs5+xa1L97Zy1wzXmKSQpDsKH+oouXn+i0l7AhmdPS6uRYilD9
         2cb3n71Pi1ALWxkKeMne4bgYDZXAep8+xeWtxgxYS08nOGYUzgE4V7fH2uPzTdQbKw7N
         bA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9ozZ2STeyLcJfOi2HO38PmZ1SSe1ZJ6WASMV/GdeD4Q=;
        fh=zWoEk38XBoaxDfI2t4As0QsoUMrZx/RgtPVhNREiWME=;
        b=cLyyi4+yqa/MoqNCE/2Fx19Ei9nb0WYGwlwAZZ8mEC2GC6UxGsxnnBwpQRVFazWlJo
         F08K9aWX9jEwsfTYtzl56ekg8R+5PUWVUEIJfWzKB2n9e5t2oneOLE0ZVAAlgMtaEt9d
         wFWMeGJHP63X8LQeLQ1Dh6Kkwsxlo01Qb/ofQaBIkLr1q1wR7Abneg0hwHHbJDvp+8Vc
         sqBxXlDpIm7csHodogdIFcewVlv7Fsj9/mXnFpwM3wLGrcOoInNe+d5vEopG4gD6IzJE
         P+0B9QjrHh+1/nDUuSTvDImf0BeeHGaSgyvMuo1TRMCp7VbLfVfF+lrzpTRzJyG/qnC1
         rmqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="glaFVQl/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f5cb396sor8668511a91.2.2025.03.24.21.59.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="glaFVQl/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878781; x=1743483581; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ozZ2STeyLcJfOi2HO38PmZ1SSe1ZJ6WASMV/GdeD4Q=;
        b=glaFVQl/IL1nVMSCQB4xCQ6DmI+2oouMkAfIfe8234muLqWqVdRz7C0smBlwfYOc/R
         yG55bxLxzTSiqpJfNBE0Ql+w6jY7mNhSZH2r4RJ9Ls+z2DX/guOZ/Ow9AROMCGZc52SZ
         wu53GjhhSUrSbkWtRmLUkaYBEqYgBcPWBL4uH8wBOF8+vyOltg3AZ//6yPQBkkcSER3R
         hp19g5tvX1Bdyw8YQrnM0VcNanSGVo83yifKTcmuxzc8y/VqR1tRB4InlwKNHK+0weyx
         IPZS7mzWzfUXtTxVag7w8pExDEyYP5HdiwKGLrTV3LbwJZSKv6V9MyKene2nkXWbD80q
         OgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878781; x=1743483581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ozZ2STeyLcJfOi2HO38PmZ1SSe1ZJ6WASMV/GdeD4Q=;
        b=u2bbdUEqXWfkd+QXC2cVvQQe7lKIA1RvEylVI/Hu4M6d8Zm3DGQywEGw60id/38iFv
         vVGCuvSaQCAlTMJRFmFlt4SU9aOEAntrA/9liApYMErooEla0pk0jyunSJGRS9Y3DWN8
         W8kxGMZg/J5uzBNTspBpVgwQm1O0FqnptcjnNqVHMjubYFu9z+yBmKIxFBdywy5vLoXW
         ez1sdiCwRBehj/QUPtZuxbv7fjetcAIdAFPHsaJaqkCslpEMqu3aoVsL7HXzzgi/jv+x
         MMrl3vbiFZUsjNqHwv4EjRSptRt6sM4D8v/J1ADizL9yt91W47syXuSRxuuS72xAp9HM
         E90g==
X-Forwarded-Encrypted: i=1; AJvYcCVqFfFxUHN7v4/yWiMd1xCbJ0uR430Gn15Se0LlC+luFxt266Vxk7/Rvl6YG7EbPwfsoSVrvbgwB9JmAA==@linaro.org
X-Gm-Message-State: AOJu0YzSeAq35ou0k3O0T7tiOatl+w0miq87KbSQWQArjvErc+3LLFLC
	v9lIs7Z2SpeSZgj+VLDdekGS/75h3W5dtLDY/L2Gw5mEZQAcI4sE4sHUPlqEzanQxQ==
X-Gm-Gg: ASbGncsrFlpfUgl+rW5LyAqNSIt4EwwhtdRRXju8DiL2N9xs293e+DCD71Os2aGim0P
	vLLDTZPwrUJlP/1Bf9DlblC6ZKbTQsf1+uUVvdSlyK8pa3wiAu20gh4YWWxbwuyd8qj9mGi8Dzn
	s2V8nvArrw9Gwh5bVgl+mpHQGU+hKBQ9r8gNfRxKkzRh8vbzFWv6h8a01WuGkc/vUkPGaGVMyJP
	Rgmq3NlmRkSSUVytvHr1ELusGE2o/MSX2oSia8p564YvGfUuoEYw/MOfMkAjZ7oAyLuZ6yQDXTB
	OZqhOJGsM8OveJzp4KzhV3NLBRcTSfrGTxmpg0pYkvve
X-Google-Smtp-Source: AGHT+IHRwvpXbBUqHAAs7tN3i6H3y1jGNgFgo6lUQwfrkalBcwvw/NCyZ/ABEfCgTBwu3o/ipwe1GQ==
X-Received: by 2002:a17:90b:2551:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-3030fe595c0mr27540468a91.7.1742878781525;
        Mon, 24 Mar 2025 21:59:41 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:41 -0700 (PDT)
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
Subject: [PATCH v3 21/29] target/arm/cpu: define same set of registers for aarch32 and aarch64
Date: Mon, 24 Mar 2025 21:59:06 -0700
Message-Id: <20250325045915.994760-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oiTF0VkYRNp0

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
