Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1245689eja;
        Fri, 1 Mar 2024 10:33:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWI7lfTwI/78svhTtyemwtlpxDF01cBzI3SlbeLQ6HCYiB858SvSP4ybDN/C/3e+hDYvvIgZ3PbpHAlF/8RLDvvMUjuwxEt
X-Google-Smtp-Source: AGHT+IFr3l/ELsxkzXx4mV0Cz/D17LM0YaY0vxB8kmr4ABnmosl5AmiDVz0/W+JIMHoW8a0m3tt5
X-Received: by 2002:ad4:4590:0:b0:68f:9ec7:2afb with SMTP id x16-20020ad44590000000b0068f9ec72afbmr2815983qvu.0.1709318021228;
        Fri, 01 Mar 2024 10:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709318021; cv=none;
        d=google.com; s=arc-20160816;
        b=0baXeZmuG00XOZoI9vLS35rgXscRSZabzOLkXGSHYBJUfFSqUl/Nth7PwRqKiDbPYD
         7XSPkbAnehOS/KdHbh1mrbFhrdcz7FCOXbmPaZwZz6ii1btEYIJ+uvIl+zIMrzsrmYSa
         SR2h0Yy1dWGIw6VM4PLtbs51L2DxQrDfrL+45nQOjKN5YFpYBYV38GCG4OHl/rbWSBnL
         X93vt4AN30rPSd2VYS+4kutvlz2+pO7EDe4PkLhkc4hN6WpMKKTqj7+Wzku9tmh3wrgh
         pwtMsrT/0MQ6TjXJK6KwhbSchTck0zL0GfpUpoLN5Cuut439rf3Uy2NXwtkiwbDguy4R
         F8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vW+yQ7fC5/gtJ1ZucfqHiSEvlgkB6rWP3jPeBXaxNb0=;
        fh=x4yV6W++5EDM2T8pvDWfrYghCgb7XqbEnMjseNXnlds=;
        b=WlyAh2cp0GC0qUjQ7e0g1T6Qt4snVwXZorLFN6rjngcumA3Pn5taEaftVhufyC3oEz
         LG5pSD3ImqfDVijtY16K2DZCVYFMu2c1OXdfD5qQZoddPHERbiTQGYnP4BCfvg6AAcCO
         w6Ppznf9aOJnmI71gBRsSEwU2hilVkNQp/cx5aZXGmyupKhqXPCNal4yzpR8RsJbq+14
         LRAlIR1GnQl63JAwTRrguw+6r8MkQIVusAiwvZ5sJ8wT5M/hCnUexvb6mlRvF8jsJ+yF
         BK1HYAziiaEl/ij+mEGnel+tVfX320PBgxKjQ++764L/qTtOR9r86aRS1FMGl5chZcb6
         AGfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JLoz1I6A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a0562141c0c00b0068f5322184dsi4217697qvc.354.2024.03.01.10.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 10:33:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JLoz1I6A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg7gR-0006SX-QD; Fri, 01 Mar 2024 13:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gK-0006PS-4u
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:29 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gF-0008Jw-K2
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:27 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-412a14299a4so17920795e9.1
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 10:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709317942; x=1709922742; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vW+yQ7fC5/gtJ1ZucfqHiSEvlgkB6rWP3jPeBXaxNb0=;
 b=JLoz1I6AG+0qpUWT/EX1Y4CFcs0ZXgZtvj7mfpdQo8+Ncb1pj9ABk4G/dkZsVQrR4E
 3qD4azI82NF0hjjQe0VgWQjqDsHcz72Cu1/SVKdDUb51ZKin6cZ+/DfKbBh/2TEFNBHl
 iIHuq6AbjwS6Sj/1Sm9JX1viKi4t5HlKB+BgIxoOlvul0FNMkL88401RwG7t1Loabo9D
 Fao4j3eJLA6ZurGUavCJDG666A5Z8tAV/dbySZ5hGPNhn+F7i+JBaKHSMgSa6zmBvBsi
 QGQ0drOiqvQdWvIzakjI5bSttm1g1RUv13aL9ggnmRtDOkHrOzBUQpWkK2Y4jb5akYdG
 ZydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709317942; x=1709922742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vW+yQ7fC5/gtJ1ZucfqHiSEvlgkB6rWP3jPeBXaxNb0=;
 b=GOFRc/NqJxZuxmHS3z9QtMTW99oPSoRvw9T9Wc3w2PTesFFsFwkfg/vDWIYSsQVvjB
 jltAX7XhbFeqIvx/LoNVzUDuyDbNFeg4sswzTWaStzc2QUkRy9IKkC5st/nnPCIc6SF5
 uwOUaNnUdTMhjvw7j18Q1eecHiVZOnQNtKrL5hBzjCI0C89f2Ay5lpCLvsnI1syUXRuR
 +HnjP0XYt0W6YA4MCTMa4m8rhBsiu9VveskczdwSEq1Z4YauuISoxX0YHp+WRpsr6dBY
 /tgbvONIlXab6rDKa5YEmt9oq12wKPSvR+ehubkBnVCuESu4ZxnKowCn3+T4YAZL1hWW
 lD8Q==
X-Gm-Message-State: AOJu0YziC6AoOu+g2gIqXllytBFFGRcM1msh7a9jWe3iQrINjr+HRKJW
 m+WMvAbi5ARQUBaiqU1Pv/sYOEGqV7yJNyW0m/arpqLjNJ4drNflwZS1ygr8dCmJLS+8igXkDZl
 i
X-Received: by 2002:a05:600c:35d5:b0:412:ad64:cc64 with SMTP id
 r21-20020a05600c35d500b00412ad64cc64mr2174371wmq.1.1709317941622; 
 Fri, 01 Mar 2024 10:32:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u2-20020adfeb42000000b0033b483d1abcsm5158934wrn.53.2024.03.01.10.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 10:32:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 1/8] target/arm: Move some register related defines to
 internals.h
Date: Fri,  1 Mar 2024 18:32:12 +0000
Message-Id: <20240301183219.2424889-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301183219.2424889-1-peter.maydell@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: GjtHzu5nRY8y

cpu.h has a lot of #defines relating to CPU register fields.
Most of these aren't actually used outside target/arm code,
so there's no point in cluttering up the cpu.h file with them.
Move some easy ones to internals.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I want to add some more CNTHCTL_* values, and don't really
want to put more into cpu.h. There's obviously more that could
be moved here, but I don't want to get into doing too much
all at once. I pondered having a different file for these,
but probably we'd end up pulling it in everywhere we do
internals.h.
---
 target/arm/cpu.h       | 128 -----------------------------------------
 target/arm/internals.h | 128 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+), 128 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 63f31e0d984..3cbfd4f9a74 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -141,11 +141,6 @@ typedef struct ARMGenericTimer {
     uint64_t ctl; /* Timer Control register */
 } ARMGenericTimer;
 
-#define VTCR_NSW (1u << 29)
-#define VTCR_NSA (1u << 30)
-#define VSTCR_SW VTCR_NSW
-#define VSTCR_SA VTCR_NSA
-
 /* Define a maximum sized vector register.
  * For 32-bit, this is a 128-bit NEON/AdvSIMD register.
  * For 64-bit, this is a 2048-bit SVE register.
@@ -1382,73 +1377,6 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
 #define SCTLR_TIDCP   (1ULL << 63) /* FEAT_TIDCP1 */
 
-/* Bit definitions for CPACR (AArch32 only) */
-FIELD(CPACR, CP10, 20, 2)
-FIELD(CPACR, CP11, 22, 2)
-FIELD(CPACR, TRCDIS, 28, 1)    /* matches CPACR_EL1.TTA */
-FIELD(CPACR, D32DIS, 30, 1)    /* up to v7; RAZ in v8 */
-FIELD(CPACR, ASEDIS, 31, 1)
-
-/* Bit definitions for CPACR_EL1 (AArch64 only) */
-FIELD(CPACR_EL1, ZEN, 16, 2)
-FIELD(CPACR_EL1, FPEN, 20, 2)
-FIELD(CPACR_EL1, SMEN, 24, 2)
-FIELD(CPACR_EL1, TTA, 28, 1)   /* matches CPACR.TRCDIS */
-
-/* Bit definitions for HCPTR (AArch32 only) */
-FIELD(HCPTR, TCP10, 10, 1)
-FIELD(HCPTR, TCP11, 11, 1)
-FIELD(HCPTR, TASE, 15, 1)
-FIELD(HCPTR, TTA, 20, 1)
-FIELD(HCPTR, TAM, 30, 1)       /* matches CPTR_EL2.TAM */
-FIELD(HCPTR, TCPAC, 31, 1)     /* matches CPTR_EL2.TCPAC */
-
-/* Bit definitions for CPTR_EL2 (AArch64 only) */
-FIELD(CPTR_EL2, TZ, 8, 1)      /* !E2H */
-FIELD(CPTR_EL2, TFP, 10, 1)    /* !E2H, matches HCPTR.TCP10 */
-FIELD(CPTR_EL2, TSM, 12, 1)    /* !E2H */
-FIELD(CPTR_EL2, ZEN, 16, 2)    /* E2H */
-FIELD(CPTR_EL2, FPEN, 20, 2)   /* E2H */
-FIELD(CPTR_EL2, SMEN, 24, 2)   /* E2H */
-FIELD(CPTR_EL2, TTA, 28, 1)
-FIELD(CPTR_EL2, TAM, 30, 1)    /* matches HCPTR.TAM */
-FIELD(CPTR_EL2, TCPAC, 31, 1)  /* matches HCPTR.TCPAC */
-
-/* Bit definitions for CPTR_EL3 (AArch64 only) */
-FIELD(CPTR_EL3, EZ, 8, 1)
-FIELD(CPTR_EL3, TFP, 10, 1)
-FIELD(CPTR_EL3, ESM, 12, 1)
-FIELD(CPTR_EL3, TTA, 20, 1)
-FIELD(CPTR_EL3, TAM, 30, 1)
-FIELD(CPTR_EL3, TCPAC, 31, 1)
-
-#define MDCR_MTPME    (1U << 28)
-#define MDCR_TDCC     (1U << 27)
-#define MDCR_HLP      (1U << 26)  /* MDCR_EL2 */
-#define MDCR_SCCD     (1U << 23)  /* MDCR_EL3 */
-#define MDCR_HCCD     (1U << 23)  /* MDCR_EL2 */
-#define MDCR_EPMAD    (1U << 21)
-#define MDCR_EDAD     (1U << 20)
-#define MDCR_TTRF     (1U << 19)
-#define MDCR_STE      (1U << 18)  /* MDCR_EL3 */
-#define MDCR_SPME     (1U << 17)  /* MDCR_EL3 */
-#define MDCR_HPMD     (1U << 17)  /* MDCR_EL2 */
-#define MDCR_SDD      (1U << 16)
-#define MDCR_SPD      (3U << 14)
-#define MDCR_TDRA     (1U << 11)
-#define MDCR_TDOSA    (1U << 10)
-#define MDCR_TDA      (1U << 9)
-#define MDCR_TDE      (1U << 8)
-#define MDCR_HPME     (1U << 7)
-#define MDCR_TPM      (1U << 6)
-#define MDCR_TPMCR    (1U << 5)
-#define MDCR_HPMN     (0x1fU)
-
-/* Not all of the MDCR_EL3 bits are present in the 32-bit SDCR */
-#define SDCR_VALID_MASK (MDCR_MTPME | MDCR_TDCC | MDCR_SCCD | \
-                         MDCR_EPMAD | MDCR_EDAD | MDCR_TTRF | \
-                         MDCR_STE | MDCR_SPME | MDCR_SPD)
-
 #define CPSR_M (0x1fU)
 #define CPSR_T (1U << 5)
 #define CPSR_F (1U << 6)
@@ -1495,41 +1423,6 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define XPSR_NZCV CPSR_NZCV
 #define XPSR_IT CPSR_IT
 
-#define TTBCR_N      (7U << 0) /* TTBCR.EAE==0 */
-#define TTBCR_T0SZ   (7U << 0) /* TTBCR.EAE==1 */
-#define TTBCR_PD0    (1U << 4)
-#define TTBCR_PD1    (1U << 5)
-#define TTBCR_EPD0   (1U << 7)
-#define TTBCR_IRGN0  (3U << 8)
-#define TTBCR_ORGN0  (3U << 10)
-#define TTBCR_SH0    (3U << 12)
-#define TTBCR_T1SZ   (3U << 16)
-#define TTBCR_A1     (1U << 22)
-#define TTBCR_EPD1   (1U << 23)
-#define TTBCR_IRGN1  (3U << 24)
-#define TTBCR_ORGN1  (3U << 26)
-#define TTBCR_SH1    (1U << 28)
-#define TTBCR_EAE    (1U << 31)
-
-FIELD(VTCR, T0SZ, 0, 6)
-FIELD(VTCR, SL0, 6, 2)
-FIELD(VTCR, IRGN0, 8, 2)
-FIELD(VTCR, ORGN0, 10, 2)
-FIELD(VTCR, SH0, 12, 2)
-FIELD(VTCR, TG0, 14, 2)
-FIELD(VTCR, PS, 16, 3)
-FIELD(VTCR, VS, 19, 1)
-FIELD(VTCR, HA, 21, 1)
-FIELD(VTCR, HD, 22, 1)
-FIELD(VTCR, HWU59, 25, 1)
-FIELD(VTCR, HWU60, 26, 1)
-FIELD(VTCR, HWU61, 27, 1)
-FIELD(VTCR, HWU62, 28, 1)
-FIELD(VTCR, NSW, 29, 1)
-FIELD(VTCR, NSA, 30, 1)
-FIELD(VTCR, DS, 32, 1)
-FIELD(VTCR, SL2, 33, 1)
-
 /* Bit definitions for ARMv8 SPSR (PSTATE) format.
  * Only these are valid when in AArch64 mode; in
  * AArch32 mode SPSRs are basically CPSR-format.
@@ -1737,21 +1630,6 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_TWEDEN    (1ULL << 59)
 #define HCR_TWEDEL    MAKE_64BIT_MASK(60, 4)
 
-#define HCRX_ENAS0    (1ULL << 0)
-#define HCRX_ENALS    (1ULL << 1)
-#define HCRX_ENASR    (1ULL << 2)
-#define HCRX_FNXS     (1ULL << 3)
-#define HCRX_FGTNXS   (1ULL << 4)
-#define HCRX_SMPME    (1ULL << 5)
-#define HCRX_TALLINT  (1ULL << 6)
-#define HCRX_VINMI    (1ULL << 7)
-#define HCRX_VFNMI    (1ULL << 8)
-#define HCRX_CMOW     (1ULL << 9)
-#define HCRX_MCE2     (1ULL << 10)
-#define HCRX_MSCEN    (1ULL << 11)
-
-#define HPFAR_NS      (1ULL << 63)
-
 #define SCR_NS                (1ULL << 0)
 #define SCR_IRQ               (1ULL << 1)
 #define SCR_FIQ               (1ULL << 2)
@@ -1790,12 +1668,6 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_GPF               (1ULL << 48)
 #define SCR_NSE               (1ULL << 62)
 
-#define HSTR_TTEE (1 << 16)
-#define HSTR_TJDBX (1 << 17)
-
-#define CNTHCTL_CNTVMASK      (1 << 18)
-#define CNTHCTL_CNTPMASK      (1 << 19)
-
 /* Return the current FPSCR value.  */
 uint32_t vfp_get_fpscr(CPUARMState *env);
 void vfp_set_fpscr(CPUARMState *env, uint32_t val);
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 50bff445494..c93acb270cc 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -99,6 +99,134 @@ FIELD(DBGWCR, WT, 20, 1)
 FIELD(DBGWCR, MASK, 24, 5)
 FIELD(DBGWCR, SSCE, 29, 1)
 
+#define VTCR_NSW (1u << 29)
+#define VTCR_NSA (1u << 30)
+#define VSTCR_SW VTCR_NSW
+#define VSTCR_SA VTCR_NSA
+
+/* Bit definitions for CPACR (AArch32 only) */
+FIELD(CPACR, CP10, 20, 2)
+FIELD(CPACR, CP11, 22, 2)
+FIELD(CPACR, TRCDIS, 28, 1)    /* matches CPACR_EL1.TTA */
+FIELD(CPACR, D32DIS, 30, 1)    /* up to v7; RAZ in v8 */
+FIELD(CPACR, ASEDIS, 31, 1)
+
+/* Bit definitions for CPACR_EL1 (AArch64 only) */
+FIELD(CPACR_EL1, ZEN, 16, 2)
+FIELD(CPACR_EL1, FPEN, 20, 2)
+FIELD(CPACR_EL1, SMEN, 24, 2)
+FIELD(CPACR_EL1, TTA, 28, 1)   /* matches CPACR.TRCDIS */
+
+/* Bit definitions for HCPTR (AArch32 only) */
+FIELD(HCPTR, TCP10, 10, 1)
+FIELD(HCPTR, TCP11, 11, 1)
+FIELD(HCPTR, TASE, 15, 1)
+FIELD(HCPTR, TTA, 20, 1)
+FIELD(HCPTR, TAM, 30, 1)       /* matches CPTR_EL2.TAM */
+FIELD(HCPTR, TCPAC, 31, 1)     /* matches CPTR_EL2.TCPAC */
+
+/* Bit definitions for CPTR_EL2 (AArch64 only) */
+FIELD(CPTR_EL2, TZ, 8, 1)      /* !E2H */
+FIELD(CPTR_EL2, TFP, 10, 1)    /* !E2H, matches HCPTR.TCP10 */
+FIELD(CPTR_EL2, TSM, 12, 1)    /* !E2H */
+FIELD(CPTR_EL2, ZEN, 16, 2)    /* E2H */
+FIELD(CPTR_EL2, FPEN, 20, 2)   /* E2H */
+FIELD(CPTR_EL2, SMEN, 24, 2)   /* E2H */
+FIELD(CPTR_EL2, TTA, 28, 1)
+FIELD(CPTR_EL2, TAM, 30, 1)    /* matches HCPTR.TAM */
+FIELD(CPTR_EL2, TCPAC, 31, 1)  /* matches HCPTR.TCPAC */
+
+/* Bit definitions for CPTR_EL3 (AArch64 only) */
+FIELD(CPTR_EL3, EZ, 8, 1)
+FIELD(CPTR_EL3, TFP, 10, 1)
+FIELD(CPTR_EL3, ESM, 12, 1)
+FIELD(CPTR_EL3, TTA, 20, 1)
+FIELD(CPTR_EL3, TAM, 30, 1)
+FIELD(CPTR_EL3, TCPAC, 31, 1)
+
+#define MDCR_MTPME    (1U << 28)
+#define MDCR_TDCC     (1U << 27)
+#define MDCR_HLP      (1U << 26)  /* MDCR_EL2 */
+#define MDCR_SCCD     (1U << 23)  /* MDCR_EL3 */
+#define MDCR_HCCD     (1U << 23)  /* MDCR_EL2 */
+#define MDCR_EPMAD    (1U << 21)
+#define MDCR_EDAD     (1U << 20)
+#define MDCR_TTRF     (1U << 19)
+#define MDCR_STE      (1U << 18)  /* MDCR_EL3 */
+#define MDCR_SPME     (1U << 17)  /* MDCR_EL3 */
+#define MDCR_HPMD     (1U << 17)  /* MDCR_EL2 */
+#define MDCR_SDD      (1U << 16)
+#define MDCR_SPD      (3U << 14)
+#define MDCR_TDRA     (1U << 11)
+#define MDCR_TDOSA    (1U << 10)
+#define MDCR_TDA      (1U << 9)
+#define MDCR_TDE      (1U << 8)
+#define MDCR_HPME     (1U << 7)
+#define MDCR_TPM      (1U << 6)
+#define MDCR_TPMCR    (1U << 5)
+#define MDCR_HPMN     (0x1fU)
+
+/* Not all of the MDCR_EL3 bits are present in the 32-bit SDCR */
+#define SDCR_VALID_MASK (MDCR_MTPME | MDCR_TDCC | MDCR_SCCD | \
+                         MDCR_EPMAD | MDCR_EDAD | MDCR_TTRF | \
+                         MDCR_STE | MDCR_SPME | MDCR_SPD)
+
+#define TTBCR_N      (7U << 0) /* TTBCR.EAE==0 */
+#define TTBCR_T0SZ   (7U << 0) /* TTBCR.EAE==1 */
+#define TTBCR_PD0    (1U << 4)
+#define TTBCR_PD1    (1U << 5)
+#define TTBCR_EPD0   (1U << 7)
+#define TTBCR_IRGN0  (3U << 8)
+#define TTBCR_ORGN0  (3U << 10)
+#define TTBCR_SH0    (3U << 12)
+#define TTBCR_T1SZ   (3U << 16)
+#define TTBCR_A1     (1U << 22)
+#define TTBCR_EPD1   (1U << 23)
+#define TTBCR_IRGN1  (3U << 24)
+#define TTBCR_ORGN1  (3U << 26)
+#define TTBCR_SH1    (1U << 28)
+#define TTBCR_EAE    (1U << 31)
+
+FIELD(VTCR, T0SZ, 0, 6)
+FIELD(VTCR, SL0, 6, 2)
+FIELD(VTCR, IRGN0, 8, 2)
+FIELD(VTCR, ORGN0, 10, 2)
+FIELD(VTCR, SH0, 12, 2)
+FIELD(VTCR, TG0, 14, 2)
+FIELD(VTCR, PS, 16, 3)
+FIELD(VTCR, VS, 19, 1)
+FIELD(VTCR, HA, 21, 1)
+FIELD(VTCR, HD, 22, 1)
+FIELD(VTCR, HWU59, 25, 1)
+FIELD(VTCR, HWU60, 26, 1)
+FIELD(VTCR, HWU61, 27, 1)
+FIELD(VTCR, HWU62, 28, 1)
+FIELD(VTCR, NSW, 29, 1)
+FIELD(VTCR, NSA, 30, 1)
+FIELD(VTCR, DS, 32, 1)
+FIELD(VTCR, SL2, 33, 1)
+
+#define HCRX_ENAS0    (1ULL << 0)
+#define HCRX_ENALS    (1ULL << 1)
+#define HCRX_ENASR    (1ULL << 2)
+#define HCRX_FNXS     (1ULL << 3)
+#define HCRX_FGTNXS   (1ULL << 4)
+#define HCRX_SMPME    (1ULL << 5)
+#define HCRX_TALLINT  (1ULL << 6)
+#define HCRX_VINMI    (1ULL << 7)
+#define HCRX_VFNMI    (1ULL << 8)
+#define HCRX_CMOW     (1ULL << 9)
+#define HCRX_MCE2     (1ULL << 10)
+#define HCRX_MSCEN    (1ULL << 11)
+
+#define HPFAR_NS      (1ULL << 63)
+
+#define HSTR_TTEE (1 << 16)
+#define HSTR_TJDBX (1 << 17)
+
+#define CNTHCTL_CNTVMASK      (1 << 18)
+#define CNTHCTL_CNTPMASK      (1 << 19)
+
 /* We use a few fake FSR values for internal purposes in M profile.
  * M profile cores don't have A/R format FSRs, but currently our
  * get_phys_addr() code assumes A/R profile and reports failures via
-- 
2.34.1

