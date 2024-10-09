Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532066njl;
        Tue, 8 Oct 2024 17:05:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+tvGSc2MRbb/FnzKCLLBDnFrzQ0s0kbF58kAcwbVNRCHJK04akh1u+DhhBLiC/2jrzfpYmmIjwZrfig==@linaro.org
X-Received: by 2002:a17:902:e811:b0:20c:620e:a90 with SMTP id d9443c01a7336-20c637390ebmr11066835ad.26.1728432308456;
        Tue, 08 Oct 2024 17:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432308; cv=none;
        d=google.com; s=arc-20240605;
        b=K3Ne/OC9bndiwex6OJN3IcqAO3XLuk/JqfRanmwvsUSS/av3mtN1JLy3Sls7MjHrpl
         PhvxQpx48M/DoKQWS1IocyjxB1ZzzMtV8T0riP9fSiJ+6eNbTSASM6tPSqp3GHDeAQfY
         Kw6Yuej5sSenrfVabCHTLfExgLNG7s7JVx7sfQHx5Fw5LP0mw7GdHWnV/ypgVmrC/0/w
         JXRvfs1d1xiMUiWm0+Z6/rPxO4VAQ0WFdQ2eyNqtd9JTN5oeE/IR+9KX8YoE+JKnoCIF
         pQmx46gbvfPWWO4uXnVAiVuPc/yEy6rm0+bvWKzgskEznFk7qJddjDswer3uR4Ngr+yk
         p/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=I928rOfU7rFS4/uAexBKDkmn1Lv4VMSl/VKyNRV9wmg=;
        fh=27+uvCRBDLjyfWAOuLo63/sn45K0C2VLjcYYukXO5V4=;
        b=brjbkbGX/P9W0D2LMq6cUTq4mC3d0ky/Z0bdBkHxzFKSVdMQBl20hcnfrYBY8+R4mu
         bwWcLxljLp5RIwGiSBoauUVdmBbGNYi7CB073KUjoepMLwW5CRkURXjNKcU3F/0Au/AS
         bpZ670F0jDzvBwkz3wHedQnVS+i6cPaP9XAlL+tAQp941re6X4JppHnRESly/R8lIWbB
         ZDEVygpXBEnSERVQJebYHw4re6yyr1UJ9vIimADewiF3ipctiVKGLjd+3iBQH4ptnTv2
         xQIB6VoVEDLtRQzzocUMTyqwMzevss3QWh5CvB1FCtpdMBJID3mAiDGcEdGAmLoGl9iz
         4yig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Aa5yvH3J;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138ef5dasor46552025ad.9.2024.10.08.17.05.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Aa5yvH3J;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432308; x=1729037108; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I928rOfU7rFS4/uAexBKDkmn1Lv4VMSl/VKyNRV9wmg=;
        b=Aa5yvH3JdOI/DYwqjSModrX2AQumc+SnTMlwQwp3SfPhbv8nNOCDYA/WhOt7ZbCJd2
         m33sjQkTjXyJ4B1jBEEJlSB7NBHgCH50Vww6yx4UhCTZH8EqJPlS/FMV2iuhouDkAO/v
         RjlPZkvQ09VpdWg3fL4ptYNgvRyKqzPh/fvlIE1J/DYeeQJC8tkIS2/BgxuJwLak2OH0
         iAfezUaU9Z2MIDnu9eIO2kTvtRLReXeFex4wfHtsw9gJUcfUX9Hk7/U+HxzYboBNrq0V
         wyGoUxsT4hkELGkV1uXnkmPlCb0T9ATv/ST4OevQpwekXd2m8UWyXmmrvB1qieGEmpKq
         xUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432308; x=1729037108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I928rOfU7rFS4/uAexBKDkmn1Lv4VMSl/VKyNRV9wmg=;
        b=S8W9LZd7DU5eiTLFFYiO/mJBTnURfprmJGGPOigHv4+Rns/4XGTvXApt/NXqJK8Abl
         BeuspeKu5e2fGPBkUHrXAK1eVNFbXG4ONpg687GSnifuNCJKH9p9eDDmcus1jolzSv4Z
         iarH4GThcPvKXjtlyZd/0+gDlX1F6B3BzSWmUv6bjDLMfT1fRUYuOvc4B/cQ/6un8uVb
         ONTed11OLDBG3lK6s8nRoOCqMYEEFBKez3KkNLAOkVwEjNlB/fFArWEk0rj7tVVRudHl
         ZPa1q9m0144nFlizgjRKuduSbh+lh8iX5Kp0rRH1uJKPrTICVMSrHzZBMntKr1QZliqv
         nd2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7ninAumThhlHC8R1Q+tZ858Iw+m1JR83sJuLAdci4BhJB0/prHQAVZ1HWDJfQCUkdDSEKMrehpWpYVg==@linaro.org
X-Gm-Message-State: AOJu0YwYP4Ogp02wOvHSXC9/6rQVYhhV7817CUhyxzUOTPV3oJ5i3B0y
	UlPEC2gep/Rp3EXTtqJDqIFMLNKG4aRxE4vfZpQa04hqLmtkZLdhoZ+BZk/GI+ZyGruUYqirw/0
	5n50=
X-Google-Smtp-Source: AGHT+IFMRMcxUNXCHul99WM0nOEYQH8Nd6y4x6kBohzqFF7CIBlmB9qDX2IdxPxzJUxR3zV7HkR2Wg==
X-Received: by 2002:a17:902:da8d:b0:20b:7be8:8ecf with SMTP id d9443c01a7336-20c6379030emr10548965ad.53.1728432307943;
        Tue, 08 Oct 2024 17:05:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 13/20] target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
Date: Tue,  8 Oct 2024 17:04:46 -0700
Message-ID: <20241009000453.315652-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qu8j/ExjTlE/

Zero is the safe do-nothing value for callers to use.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 3 ++-
 target/arm/helper.c    | 9 +++++----
 target/arm/ptw.c       | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2b16579fa5..a6088d551c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1461,6 +1461,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
+ * @memop: memory operation feeding this access, or 0 for none
  * @mmu_idx: MMU index indicating required translation regime
  * @space: security space for the access
  * @result: set on translation success.
@@ -1470,7 +1471,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  * a Granule Protection Check on the resulting address.
  */
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type,
+                                    MMUAccessType access_type, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f77b40734..0a731a38e8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3599,11 +3599,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     GetPhysAddrResult res = {};
 
     /*
-     * I_MXTJT: Granule protection checks are not performed on the final address
-     * of a successful translation.
+     * I_MXTJT: Granule protection checks are not performed on the final
+     * address of a successful translation.  This is a translation not a
+     * memory reference, so "memop = none = 0".
      */
-    ret = get_phys_addr_with_space_nogpc(env, value, access_type, mmu_idx, ss,
-                                         &res, &fi);
+    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
+                                         mmu_idx, ss, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 373095a339..9af86da597 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3559,7 +3559,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
 }
 
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type,
+                                    MMUAccessType access_type, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
-- 
2.43.0
