Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp42069njc;
        Thu, 10 Apr 2025 14:00:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7bUQPtBQ2EiNakcfIkhuIfNc41t1lDq1rAy1kS8TmvBtK8pgSpBUfyA3Qf130PNsFBI66i7HDdDGGlw==@linaro.org
X-Received: by 2002:a17:902:d591:b0:224:c76:5e57 with SMTP id d9443c01a7336-22bea4ef9e9mr3717825ad.39.1744318838514;
        Thu, 10 Apr 2025 14:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744318838; cv=none;
        d=google.com; s=arc-20240605;
        b=X8xWNgxoT36zurqbHiHOd6tvXFfkSDXL2NwU/yyHGikYc8oJZSwFqwe98jz3P45Xu8
         PMyLVrjrPrtcIPcqGEoeC7rGUFbIIM8j4dmUnoOFyMuskZTcXWFwqY4K3wm+vFe2gUQZ
         JO70UYa5OPWa+Q3ATA2ET6tjxLFJr5Jcw/4nsyGZ7mHoAExmARzic/rMKhTCcgFshZyK
         RZa88gPNy3aG9uyZ0QlY/4CZjzvPScP3yQPiR5eUo0LGQt/r4v5yuu1lKqM3SLgNCcs3
         zj91XCQaTFHjjj4bhsmH8P48zWYEs7lgwRiZSg3qKfCC4QlNJM4HVt09SckToalHpNV3
         i12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PmeV86UWNxMTSPkNU4LeBxv7d2QnrBx0YubZlLs/qhU=;
        fh=TjXIt0U85OVWf9WetxWvP/JAh5SQ2I15Pbflc22sh1k=;
        b=EDZQORbkD3Sytik8ezIKRsRj6jU3ZanwqoDKK0g0gWKwl5nl9RqSOLNCRk8lBEAyiz
         Eq0zzeYQjkpdp6BTj0RIznxLQaxgqUrnUtyHvJ63eJ0+0Y6f2qYYfqL8FJUt0/m6vdKm
         ZlHNeZWX6Mi1faJTsxoSi4OgajC2OXYAYnfCDzLX/3Wr23QpmLLYvbcZp3Ita1cU3ZeS
         BeVRFBKk4KDCIi1OX6n0ORV9pziRBTRSM64ybHbXONA/PVsOEU1w/Me6Kz4PWasgi/Cy
         TGt22npgENFT1nP4uNVYUIp8N9QHtUAGWOTf/ZYrCTTpWDr2qjyrhuk5MmBiwhlvYOXS
         Ynvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UrobCFqQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7a3b058sor40692815ad.1.2025.04.10.14.00.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Apr 2025 14:00:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UrobCFqQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744318838; x=1744923638; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmeV86UWNxMTSPkNU4LeBxv7d2QnrBx0YubZlLs/qhU=;
        b=UrobCFqQvmn4TuDayqu3vF//H+3Ss/zAWxegc3gNtKzxnfpLYZYRt2AEaCwfqJJaKz
         LNnmA9uZZ7kywIGR1V2TMIrYtJWeTIh9hkhuNOteT8O58NJVpE/CntM2Qm65Ok5hGDJv
         w4MaxrbpDvtCNI1XKxa/vxnCdw3NxdkFC1OkJ7VHo3g/AXpoD9muG8BaJmPjQQ1Wxne9
         DD3A+CF8aWOtEifPScioo5UQD527bhNqaI7eY+BSJONuvP8plVV8mRD2j5mJNSb5gRSi
         BvUi74PvKX+qwz+5hyQ4JTgnOnpGNnroOGdX8xD1W4Wut285GXmv/Ep9SChbQfsgJk9D
         EzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318838; x=1744923638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmeV86UWNxMTSPkNU4LeBxv7d2QnrBx0YubZlLs/qhU=;
        b=Kbw6qAvW06dyM079bjT7NoaPf/CUR0E81j4herD3dmXdq/Ug+aLiOzFxAdlDGkJMjK
         B1OPjRmlJyO4Rb6+HB6//0e7O7ZenESt2xFo5lsN9dgQHaNsYm0acTeFWGrpWvsU187d
         Vu/yoxBejvBjXVZ5tQd4VeJxwldBd1JRiArOweq7SYRUuRjFtEx7MrYLVPH4PEnJ5fzY
         13vG/CbhFLwnqZ3yCQJRqbQFXO7/GqKbj4fM7phsHdd2CgEWye7IGS7gTpseZrtc26pc
         PYE6Wg+gKcfNXOri0Ghf1zqjZjbGHl+3eV4ZqEj7amszA5aROruQRmpPL9fstQscI4fJ
         re3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHypdV/q3WDyQg0XzUF5yI+fgUrKWnrKsU7WrNMzhaS1FYeEUv70EzrQQrRzNitpUW2bn/CTgqbi21Jw==@linaro.org
X-Gm-Message-State: AOJu0YzG1GIrUkxYAdp3u0fWZPqV1TkfJHNFZd9YWOHtm1ALoISVRoh0
	q00SEGtsFvCJu+VvCsd+uLKjIuQgbx9bIZf52Iou3G61XHLfEAkZRlOSpD0HMcBJjg==
X-Gm-Gg: ASbGncsRqkZ+10I93NBWehjvxOfA/KYuEuEUAKV/nWS23IRGzInjpN8S5zE6CYFZlK/
	+sIITlYDkuzlzuuagLGLeGijBZQqF7LwHehtGKguWElDclFbBYcqVSPOoWEIajxTTkq0OTpJRj4
	dFOK2XTWaNnPfOM5tCTqWbsaxWKvD2rUxSUKlOjld0WvrjX/UfirmMJX1x8j/nAtMONPKIxF97U
	nzXH3w3+qNLN7BBPsX+voU8X4dzkg9UCloPm4PeWegqNDAgkzVJ/5Z1UIeXx4uNFutg0FYsAHRC
	PcLyWcJ4vtd9fzYu6vxtKmrqc23AEW0PnlHGUiRxtU4Ub4cWaFk=
X-Google-Smtp-Source: AGHT+IH9ApjVDIlbHEiORAEkYyrDKhJ0F9TX9kzkMWvWD3E2WfGbbgaIrvceXWKN9jCNTc4t82oH1Q==
X-Received: by 2002:a17:902:e5cf:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22bea4efe58mr4867695ad.40.1744318838103;
        Thu, 10 Apr 2025 14:00:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f82a3sm12431b3a.90.2025.04.10.14.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:00:37 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	philmd@linaro.org,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	Yannis Bolliger <yannis.bolliger@protonmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 3/4] target/arm/ptw: extract arm_cpu_get_phys_page
Date: Thu, 10 Apr 2025 14:00:21 -0700
Message-Id: <20250410210022.809905-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
References: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ewAl152UKB2y

Allow to call that function easily several times in next commit.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 754ef0d3a25..6ea39ee5755 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3629,23 +3629,17 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
                              memop, result, fi);
 }
 
-hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
-                                         MemTxAttrs *attrs)
+static hwaddr arm_cpu_get_phys_page(CPUARMState *env, vaddr addr,
+                                    MemTxAttrs *attrs, ARMMMUIdx mmu_idx)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    ARMSecuritySpace ss = arm_mmu_idx_to_security_space(env, mmu_idx);
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
-        .in_space = ss,
+        .in_space = arm_mmu_idx_to_security_space(env, mmu_idx),
         .in_debug = true,
     };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    bool ret;
-
-    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
+    bool ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
@@ -3653,3 +3647,13 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     }
     return res.f.phys_addr;
 }
+
+hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
+                                         MemTxAttrs *attrs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+
+    return arm_cpu_get_phys_page(env, addr, attrs, mmu_idx);
+}
-- 
2.39.5
