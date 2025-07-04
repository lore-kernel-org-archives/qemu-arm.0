Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1264657dyc;
        Fri, 4 Jul 2025 07:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxaE5hfGTMoQKqPkJ+V97Py8eoZxwKKqkkLFtCRXFM7+RRuDwv0C/FPV87EqBSJ0NueJmCbA0da2D9gA==@linaro.org
X-Google-Smtp-Source: AGHT+IHeDJ7o94fe7xpK8CjFlOOPL+ADB01xA/NfhMEU7voKct1IrvNjHadFtQwDHw3maoOUELzP
X-Received: by 2002:a05:622a:1f8c:b0:494:78d5:baea with SMTP id d75a77b69052e-4a99686acecmr42991341cf.51.1751640447778;
        Fri, 04 Jul 2025 07:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640447; cv=none;
        d=google.com; s=arc-20240605;
        b=Ah0v4cDSv/xtM2F7KnzaicU8+1p649IszxNEf5bWXx6FImL3L362iZVZH5y9A3vONd
         5lg4HAGTRMnDkEY0N7b6bFqGXvHKclK2VsAq/W8gH/paJe0ucfB++ALy5y5EjiEYmOcA
         DJy8OBL2xwe6aAL6d1KPniKEcEXnaH79ILfqZPdvy/TXSCOdaEwxAevknCu2vfGUr56n
         bKCOgvl2d4eN2uXfGpsBZCMi3XtHMq6c7naydYED8zjyqmRFkAM1fGpJFvogzjmBObnQ
         6FXW4lJDF2+YI8NQZVhH+/YB91qlvPO4qvQmu/VRXnyccDJEFtlc1ccbqbbxpWYrjmBM
         9ThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/y6ae8MFtHgdri3B/hfnDJLsIID9R8RxmBlWT9Y9/4M=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=gEelo8hCJ9b/GvGwb8qSgGDQExQupSypTpwqYtDRpNGBgLG9n9ZASWQMS3Oh9DCZEF
         hu1XzcjGViTGxiILUZwcPAW6kTDnLN83BJHMbeTnmq8pFCNSJl7QtuHh3qnf5clp3Fkg
         yhjUFMybyiDGbMizNmOr8R4+VRY+k0jrUrOKZd2RQ0CN2Ljd5yfwokB95QFgGBFdpT4R
         YAK3BsMiAS/BMBGKU6WhrMZ0iBXBRlVENA5hg1EoMEp1sANxiIkzQ9WkvD1LtNcyX1vP
         BubGDq1V9bXbXtEpxMogbiay1U3atFA+VKG+WbDMOskQn8JGrrdNL+rrPiYBbstFoh3A
         KgtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEJZEzQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994aefdcfsi21241281cf.445.2025.07.04.07.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEJZEzQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhZM-00044G-L1; Fri, 04 Jul 2025 10:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPP-0002vY-BB
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:29:03 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPM-0001go-4y
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:58 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2f3dab2a2a9so901320fac.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639335; x=1752244135; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/y6ae8MFtHgdri3B/hfnDJLsIID9R8RxmBlWT9Y9/4M=;
 b=xEJZEzQ+2ractfUc8ROuAGifbDV7hDlHIF57lACNxDpOUVxSKkp9qKKwJBQkRlgbNL
 enefb9WquFXVhAM8uE7cM601okabF0Wj3Bp/bmmZViIvohkE6/JpmPpz6wlwMuR90Gt2
 5zcmiu+9Ym8KRdc9yk5SiZIdPXhzuQa1tjtdR5iTuUkLGoKfMob5Ib8sCDAIzx+xgAnH
 RIfWK+vcbRLrhl9PGWGagIfp0q1BFtgjkptzRM34CaMPFr+Z0i6G6WZ7MyY5EnvD/Ijl
 MYZJOx0d9mv6Y4FL0p2vizaToei16xrComXw5wRU4W6X/kx12nWqnbkM8Q/RFfoB3Fhs
 rh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639335; x=1752244135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/y6ae8MFtHgdri3B/hfnDJLsIID9R8RxmBlWT9Y9/4M=;
 b=BPf7O4312wv9CX1h61mkNHDsGB/R/mQKqvcyZtYucydMnx1e6sjKZftDox7IaedJbj
 iR1hNtCzRaT1KkxGpyPBD+kvSllCqZvf45Cs258hzuyJze3zbUPbuf+TJcXN2EdbQMh9
 zZJ39Tpipd4iic94e8KGel0xawTYiFvckEUDpF05qjgBUg88rPgerAWLD73Weg4kHvSR
 2dphyVbPLxMEw0DLt7fCye7HqA75tYDSCDiAsxMdlDpB86RCSz2WZhpZqdetc62JnbKM
 N5k/8Tkbe3eTPUgHVmSgVIRBcumB/E6fIqn/1QausCD45hZqxThx2WlujEmgg6KU8ocJ
 /yFw==
X-Gm-Message-State: AOJu0YzuHK8D8BMRQDdzVGlIprPsnlW2INtO0aq5eQ6YcPT0tCkdLF+Z
 FchbA4Dadn+DIoMFKnv5h7iTMyDHK4hiqtr9RPxOfBYBA4aGeQFXZYvs6FTLTWL7ssPN8U4CJhE
 +MZ8luf0=
X-Gm-Gg: ASbGnctnc4sF9OkNxbfGyYzzw+Onu4B2LDSXq97Rc+4EUmuJYGCCBYVkEPzWEoMAFCb
 oc4i1Jzbmf9ZSrLus+7o/v92W+EA5n+Wn/nFgESGTb+cTf0PRE0fQ24btadAv2iidoLXtQcZklW
 +oiVJlDbrc4YthCoXEkudWmWvu6WifZgPRifvXkP0Csh8Sb+SgDub9/CRQIRcBUrPVEfqU4u6Tj
 zaCpRVFSLh35lNc4G8uOJzsyHLNA6abmUDFUr4EsHTZGPwMzg0VNA76LGu+280O38N1z2rc0hCp
 b/sgat4AR+uC2xTRn3QVf4z52Cy1olIvj/j8O9gQ9MWGicvjA/+spmT7BbuOl14f8idCiIcBVpX
 5GVHe/qckYo8RnCcoOZ0pTjDTS4IgDdETsx92tkwnj3VrfSin
X-Received: by 2002:a05:6870:79e:b0:28c:8476:dd76 with SMTP id
 586e51a60fabf-2f796cae8d2mr2117805fac.29.1751639334864; 
 Fri, 04 Jul 2025 07:28:54 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:28:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 096/108] target/arm: Move ld1qq and st1qq primitives to
 sve_ldst_internal.h
Date: Fri,  4 Jul 2025 08:20:59 -0600
Message-ID: <20250704142112.1018902-97-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KzHwPeVR451r

Move from sme_helper.c to the shared header.
Add a comment noting the lack of atomicity.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_ldst_internal.h | 63 ++++++++++++++++++++++++++++++
 target/arm/tcg/sme_helper.c        | 44 +++------------------
 2 files changed, 69 insertions(+), 38 deletions(-)

diff --git a/target/arm/tcg/sve_ldst_internal.h b/target/arm/tcg/sve_ldst_internal.h
index e87beba435..c67cda9d3b 100644
--- a/target/arm/tcg/sve_ldst_internal.h
+++ b/target/arm/tcg/sve_ldst_internal.h
@@ -141,6 +141,69 @@ DO_LD_PRIM_3(ld1dqu_le, ld1dd_le)
 #define sve_st1dq_be_tlb   sve_st1dd_be_tlb
 #define sve_st1dq_le_tlb   sve_st1dd_le_tlb
 
+/*
+ * The ARMVectorReg elements are stored in host-endian 64-bit units.
+ * For 128-bit quantities, the sequence defined by the Elem[] pseudocode
+ * corresponds to storing the two 64-bit pieces in little-endian order.
+ */
+/* FIXME: Nothing in this file makes any effort at atomicity. */
+
+static inline void sve_ld1qq_be_host(void *vd, intptr_t reg_off, void *host)
+{
+    sve_ld1dd_be_host(vd, reg_off + 8, host);
+    sve_ld1dd_be_host(vd, reg_off, host + 8);
+}
+
+static inline void sve_ld1qq_le_host(void *vd, intptr_t reg_off, void *host)
+{
+    sve_ld1dd_le_host(vd, reg_off, host);
+    sve_ld1dd_le_host(vd, reg_off + 8, host + 8);
+}
+
+static inline void
+sve_ld1qq_be_tlb(CPUARMState *env, void *vd, intptr_t reg_off,
+                 target_ulong addr, uintptr_t ra)
+{
+    sve_ld1dd_be_tlb(env, vd, reg_off + 8, addr, ra);
+    sve_ld1dd_be_tlb(env, vd, reg_off, addr + 8, ra);
+}
+
+static inline void
+sve_ld1qq_le_tlb(CPUARMState *env, void *vd, intptr_t reg_off,
+                 target_ulong addr, uintptr_t ra)
+{
+    sve_ld1dd_le_tlb(env, vd, reg_off, addr, ra);
+    sve_ld1dd_le_tlb(env, vd, reg_off + 8, addr + 8, ra);
+}
+
+static inline void sve_st1qq_be_host(void *vd, intptr_t reg_off, void *host)
+{
+    sve_st1dd_be_host(vd, reg_off + 8, host);
+    sve_st1dd_be_host(vd, reg_off, host + 8);
+}
+
+static inline void sve_st1qq_le_host(void *vd, intptr_t reg_off, void *host)
+{
+    sve_st1dd_le_host(vd, reg_off, host);
+    sve_st1dd_le_host(vd, reg_off + 8, host + 8);
+}
+
+static inline void
+sve_st1qq_be_tlb(CPUARMState *env, void *vd, intptr_t reg_off,
+                 target_ulong addr, uintptr_t ra)
+{
+    sve_st1dd_be_tlb(env, vd, reg_off + 8, addr, ra);
+    sve_st1dd_be_tlb(env, vd, reg_off, addr + 8, ra);
+}
+
+static inline void
+sve_st1qq_le_tlb(CPUARMState *env, void *vd, intptr_t reg_off,
+                 target_ulong addr, uintptr_t ra)
+{
+    sve_st1dd_le_tlb(env, vd, reg_off, addr, ra);
+    sve_st1dd_le_tlb(env, vd, reg_off + 8, addr + 8, ra);
+}
+
 #undef DO_LD_TLB
 #undef DO_ST_TLB
 #undef DO_LD_HOST
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index c1166e4ffa..df16bb2f9c 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -415,54 +415,22 @@ static inline void sme_##NAME##_v_tlb(CPUARMState *env, void *za,           \
     TLB(env, useronly_clean_ptr(addr), val, ra);                            \
 }
 
-/*
- * The ARMVectorReg elements are stored in host-endian 64-bit units.
- * For 128-bit quantities, the sequence defined by the Elem[] pseudocode
- * corresponds to storing the two 64-bit pieces in little-endian order.
- */
-#define DO_LDQ(HNAME, VNAME, BE, HOST, TLB)                                 \
-static inline void HNAME##_host(void *za, intptr_t off, void *host)         \
-{                                                                           \
-    uint64_t val0 = HOST(host), val1 = HOST(host + 8);                      \
-    uint64_t *ptr = za + off;                                               \
-    ptr[0] = BE ? val1 : val0, ptr[1] = BE ? val0 : val1;                   \
-}                                                                           \
+#define DO_LDQ(HNAME, VNAME) \
 static inline void VNAME##_v_host(void *za, intptr_t off, void *host)       \
 {                                                                           \
     HNAME##_host(za, tile_vslice_offset(off), host);                        \
 }                                                                           \
-static inline void HNAME##_tlb(CPUARMState *env, void *za, intptr_t off,    \
-                               target_ulong addr, uintptr_t ra)             \
-{                                                                           \
-    uint64_t val0 = TLB(env, useronly_clean_ptr(addr), ra);                 \
-    uint64_t val1 = TLB(env, useronly_clean_ptr(addr + 8), ra);             \
-    uint64_t *ptr = za + off;                                               \
-    ptr[0] = BE ? val1 : val0, ptr[1] = BE ? val0 : val1;                   \
-}                                                                           \
 static inline void VNAME##_v_tlb(CPUARMState *env, void *za, intptr_t off,  \
                                target_ulong addr, uintptr_t ra)             \
 {                                                                           \
     HNAME##_tlb(env, za, tile_vslice_offset(off), addr, ra);                \
 }
 
-#define DO_STQ(HNAME, VNAME, BE, HOST, TLB)                                 \
-static inline void HNAME##_host(void *za, intptr_t off, void *host)         \
-{                                                                           \
-    uint64_t *ptr = za + off;                                               \
-    HOST(host, ptr[BE]);                                                    \
-    HOST(host + 8, ptr[!BE]);                                               \
-}                                                                           \
+#define DO_STQ(HNAME, VNAME) \
 static inline void VNAME##_v_host(void *za, intptr_t off, void *host)       \
 {                                                                           \
     HNAME##_host(za, tile_vslice_offset(off), host);                        \
 }                                                                           \
-static inline void HNAME##_tlb(CPUARMState *env, void *za, intptr_t off,    \
-                               target_ulong addr, uintptr_t ra)             \
-{                                                                           \
-    uint64_t *ptr = za + off;                                               \
-    TLB(env, useronly_clean_ptr(addr), ptr[BE], ra);                        \
-    TLB(env, useronly_clean_ptr(addr + 8), ptr[!BE], ra);                   \
-}                                                                           \
 static inline void VNAME##_v_tlb(CPUARMState *env, void *za, intptr_t off,  \
                                target_ulong addr, uintptr_t ra)             \
 {                                                                           \
@@ -477,8 +445,8 @@ DO_LD(ld1s_le, uint32_t, ldl_le_p, cpu_ldl_le_data_ra)
 DO_LD(ld1d_be, uint64_t, ldq_be_p, cpu_ldq_be_data_ra)
 DO_LD(ld1d_le, uint64_t, ldq_le_p, cpu_ldq_le_data_ra)
 
-DO_LDQ(sve_ld1qq_be, sme_ld1q_be, 1, ldq_be_p, cpu_ldq_be_data_ra)
-DO_LDQ(sve_ld1qq_le, sme_ld1q_le, 0, ldq_le_p, cpu_ldq_le_data_ra)
+DO_LDQ(sve_ld1qq_be, sme_ld1q_be)
+DO_LDQ(sve_ld1qq_le, sme_ld1q_le)
 
 DO_ST(st1b, uint8_t, stb_p, cpu_stb_data_ra)
 DO_ST(st1h_be, uint16_t, stw_be_p, cpu_stw_be_data_ra)
@@ -488,8 +456,8 @@ DO_ST(st1s_le, uint32_t, stl_le_p, cpu_stl_le_data_ra)
 DO_ST(st1d_be, uint64_t, stq_be_p, cpu_stq_be_data_ra)
 DO_ST(st1d_le, uint64_t, stq_le_p, cpu_stq_le_data_ra)
 
-DO_STQ(sve_st1qq_be, sme_st1q_be, 1, stq_be_p, cpu_stq_be_data_ra)
-DO_STQ(sve_st1qq_le, sme_st1q_le, 0, stq_le_p, cpu_stq_le_data_ra)
+DO_STQ(sve_st1qq_be, sme_st1q_be)
+DO_STQ(sve_st1qq_le, sme_st1q_le)
 
 #undef DO_LD
 #undef DO_ST
-- 
2.43.0

