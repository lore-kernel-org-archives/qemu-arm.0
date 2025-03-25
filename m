Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397092njc;
        Mon, 24 Mar 2025 21:59:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUy9+qEWUXp6XYKLWem0zEK9hKFEfRrxgv/rhqJtDaeUd3hJYI2BBkSaNxKqtYPsWZEprNNehCtZfsLyg==@linaro.org
X-Received: by 2002:a17:903:1c6:b0:221:8568:c00f with SMTP id d9443c01a7336-2265e24eddcmr309471125ad.0.1742878781206;
        Mon, 24 Mar 2025 21:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878781; cv=none;
        d=google.com; s=arc-20240605;
        b=kpVDjGYVLYepievR6ThRUN7dIqXvMM7G3DJ+aFtdyAla7cwG6qqyoM894ujTiCURIp
         8N2vYJAagHUHjuc+VGlasKWHnxS8yTMRur5xMocN+8ww89DzvVhx3LAagNFz8XyvIxlf
         ag1Q3wNHABaOQ5tjv27cKx3m4XkjDlzGQK98Y7wOxrGb41A13TQYQyHGd0elGNMJcLqc
         2+z0lF6l4oQ41TcpPNtDBFtmDLBZBB1W6bAnek+/2svEwlHB7jpxS/FmIRw8uu7MEGPy
         M1GhV9iXU7ryUtgfS00GSkNWDJ0we9OYXFZ/87yDd0blNHARlClLlgI6H0X7XaWb3cls
         LIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H6JY17RXIOhpi9WGu5PHvZc/K1MBVjPo3G9pvjwYgCU=;
        fh=o1U+n/kZQc1+KzYXQzu3nI4zW7qNR2ajULPW5TdVRVQ=;
        b=Kq5QZ2mlUfIn9RJMsmqv22i0pg0u3cqgcezNDKyiiVNje0fv9B3wl6TTYcFvI69LM5
         bedcyV99gj9Xv4PaZqr+T3aduGCofSTzsVGZ9HHe11jkOopf3+59BDizOmBM+CIW1XsU
         CXl4FYBMqyx8eTBDeFwrZHjRv0UDv5TtMAieO6HnLohm/meQZT0c/OAnYjSJs/5UUakv
         Czt8wzT5NKbv1XIlDmXG2uMt2m1p3/Cbtt//vlcAPdZ3tMZIpsODqb5ORBPQNV1pp1XO
         jz40KZehjjdspv1Zk9vgxJUl6zJIH5zGN9cKWUZkk9ANwN/DurbOWYpNod3HYEq+Tpfx
         rwrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EFGD7QLj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2264b343be5sor75969885ad.3.2025.03.24.21.59.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EFGD7QLj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878781; x=1743483581; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6JY17RXIOhpi9WGu5PHvZc/K1MBVjPo3G9pvjwYgCU=;
        b=EFGD7QLj6Wc3w9PXYfMsbGxI3gRrQbwtgnlmYgvfv1SaCK5IJ9mrEIkaQtq6eRWc1g
         99M3e+tJCt4Yn3rWImDsdATMtIBR6+2AWQFRcSbP59reh2TH2uMq4Tc9MazvuQO9I3qo
         Vlh3b4xS40OGOJsak6LJMJIf/u0DnvWpZ510+8KhynZXC+DwYcRyoDjv/+xu5MiCrUrl
         3Z3dOMVGZoWaGw+Tho/wpSknGAidP/pnN2s+2lZOacMYHuhqdiAOXoZ4LlD5yecXsv75
         qp6pymyPQE3tgTAKuZRz8vxRHh8GELTg7jDmLxOgZE2s7PFqmnMUrM+wvye8feekfO6r
         WblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878781; x=1743483581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6JY17RXIOhpi9WGu5PHvZc/K1MBVjPo3G9pvjwYgCU=;
        b=hxKN6J1R2XpauZaZHy+o6p5Gj0yLd8RynUWw1ArAybhipKkWDY78e5m78xblR7l2wT
         /3sY8/3d1DAq7KquV0VCIUk/QhYvZJKC+zan5glYlbG6tNwC20J/2AphR2oTHMa06EHv
         KKIToEnwz9PK4R+xViZLUK8hTD44h2ODnjGOL32z5qy86b90NuKan9hSfbez8+C/dv2I
         7Q9ErpiUSxptY8sms4dt/7JiAz9PLMmL4YPAQIlptn74IiF615NRBFyBeCQdCfT7y0Ti
         DSan5FWtQTKhs/CgEJECQjwFhy8XIGEGcb3b6g5LyspQ2dhs4z5qTcSMJgxDHFTiNID3
         DlqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYPyFMlXjUnSTeZWvARNfP93Sl9Ltgc3MYZs1Ienpwk/19rfWK0SjtpA3DcjqszKKCiY2cZI4DZq8nIg==@linaro.org
X-Gm-Message-State: AOJu0YwaesjqfevSKoumCyK8Rg0g6U70ACGjfGQjgAuJYcwBs6OCj7oR
	+/JnBWmUt1RqH6+nmz3uWa+6zVfWdqWqdSVgpU6TP0hKtIMk2gPZ1LchU9oO337U8A==
X-Gm-Gg: ASbGncuUyIIi3wT2jIyybiYnVjw1XKi27kfIeoJSNYjnu4Mu04ACYpHzP8qqoa9SSgz
	GZTdbVaAyOfflaECFWCCnALRiPyvOw1036Hm3QALgrotZL8TdQVE6XvbujffGgRrLJ4ZbSjqiZd
	nIAtPcbTDmqztQmcfQyQLPI78YQP8hMgs2gKow9xuU4NcIIRfh/3xtFioMTqG9Ck+0fbb+uouxP
	GQ7N6umAyFfuUO+kFLIgkAw2OQaPN4eUKWxCJUXSMDh86B6xrRMVGuoYI1EqzC2edGEQZEowk0N
	x8js5Jt1CektzPF7D1LaqFbjYCD5zO96AqgdUAlJHru/
X-Google-Smtp-Source: AGHT+IFyGbABiDoMVDJJuBiMI7scP0+bHtemckn6LiZHb/NiiRx62CqF94ZOcat0iRmwrJR2/o4N8A==
X-Received: by 2002:a17:90b:1848:b0:2ea:8aac:6ac1 with SMTP id 98e67ed59e1d1-3030f3efb95mr26168707a91.15.1742878780601;
        Mon, 24 Mar 2025 21:59:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:40 -0700 (PDT)
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
Subject: [PATCH v3 20/29] target/arm/cpu: flags2 is always uint64_t
Date: Mon, 24 Mar 2025 21:59:05 -0700
Message-Id: <20250325045915.994760-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wJSRdVkWufhJ

Do not rely on target dependent type, but use a fixed type instead.
Since the original type is unsigned, it should be safe to extend its
size without any side effect.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h        | 10 ++++------
 target/arm/tcg/hflags.c |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ab7412772bc..cc975175c61 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -194,7 +194,7 @@ typedef struct ARMPACKey {
 /* See the commentary above the TBFLAG field definitions.  */
 typedef struct CPUARMTBFlags {
     uint32_t flags;
-    target_ulong flags2;
+    uint64_t flags2;
 } CPUARMTBFlags;
 
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
@@ -2968,11 +2968,9 @@ uint64_t arm_sctlr(CPUARMState *env, int el);
  * We collect these two parts in CPUARMTBFlags where they are named
  * flags and flags2 respectively.
  *
- * The flags that are shared between all execution modes, TBFLAG_ANY,
- * are stored in flags.  The flags that are specific to a given mode
- * are stores in flags2.  Since cs_base is sized on the configured
- * address size, flags2 always has 64-bits for A64, and a minimum of
- * 32-bits for A32 and M32.
+ * The flags that are shared between all execution modes, TBFLAG_ANY, are stored
+ * in flags. The flags that are specific to a given mode are stored in flags2.
+ * flags2 always has 64-bits, even though only 32-bits are used for A32 and M32.
  *
  * The bits for 32-bit A-profile and M-profile partially overlap:
  *
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 8d79b8b7ae1..e51d9f7b159 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -506,8 +506,8 @@ void assert_hflags_rebuild_correctly(CPUARMState *env)
 
     if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
         fprintf(stderr, "TCG hflags mismatch "
-                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
-                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
+                        "(current:(0x%08x,0x%016" PRIx64 ")"
+                        " rebuilt:(0x%08x,0x%016" PRIx64 ")\n",
                 c.flags, c.flags2, r.flags, r.flags2);
         abort();
     }
-- 
2.39.5
