Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2655236ejm;
        Wed, 3 May 2023 00:14:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ42Dwxbw1A4TFS8kmYgEz9QF342oQ/VlAQXpFD/5m+vhokmN9atmKbYFrqJfgr+4LNzIaqA
X-Received: by 2002:ad4:594d:0:b0:5ef:4233:ee8b with SMTP id eo13-20020ad4594d000000b005ef4233ee8bmr8022239qvb.2.1683098088809;
        Wed, 03 May 2023 00:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098088; cv=none;
        d=google.com; s=arc-20160816;
        b=hqHZ0xAvUGHUeDP9gr8Ybg0FGOZcQqoW/MsT4AYJwemfaaO57EpPff9brOgbLnVQm6
         iY7YO/avw3m8qJZjnDGgPnZfKrKrXoKeT6ytRoMnIWi1HjvPZj1PIBAvdixFM3fKSRgV
         5Uao5noyfw2ihsa55rcfBXDNqZhKa28qtQ4ZzzZU2tEOKPNAWeygHXgtlzvTFyiJY3Sk
         IDoBERoxdf2GfV8OatjGtT+OmBvLBI4ymaLOhZjHtp2hsf5Ze56qcvMWouUU+o81DUsl
         pu2syQe/AHGn1uBRAhIwEZ5gFhlig4qh5x4g4QGoMZxFru9Idvz5rcHe6UUnbJJeDDkO
         WLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4FwbXCfJhxIqyab8rUpzADm0cxrqrrSpiPKuK+rasgY=;
        b=Z0zeVAQQNn+Ceok+aSfH+7E6Sbfv/XIaeItP0WMZviUTsufoIW/AIP42NekR/WHuqL
         xrKkRBM0BSeIzzc1OomSDZe8nHKAqUJI9ZIGAprr0mJjEyBi0Vv4pOG6xLfu1juMTmes
         ffbKpuuRz1lhHYw018pwuQCm4lhp7Y7RgkEggcG3OkX8hQK7U2XFmyept4CSCPZrPRB3
         1x9wYnr5bNGZOnCbPDcBvVXnJ19ptSEtKQar4jklzMWa3yWxMDor11VXt2D7FcOY/u4F
         sgxWLSrnlJorCjTTCzTuLLpfcrY3gPOTsU0J0aRbCrER2EsYHSEL/VCm5pD9eU1YdxEB
         H6gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AsrThbgD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz14-20020a0562140e6e00b00614484dc1b0si12701050qvb.615.2023.05.03.00.14.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:14:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AsrThbgD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Vd-0000ZU-Am; Wed, 03 May 2023 03:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UT-0006V2-27
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:29 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UC-0003EF-Kl
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f4000ec6ecso62805e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097270; x=1685689270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4FwbXCfJhxIqyab8rUpzADm0cxrqrrSpiPKuK+rasgY=;
 b=AsrThbgD3jqbj6W/Oja+FHUfPCTsS0zEHjZFGvSy/wgUt4sjUcm6OGOS/EjYIMFJ/P
 H87Stm0dPepxdkWarOAT673BjrWBINiuk5Q8pYV9ZvZm6iupcXQWm3BYwWQtoSRgZS8j
 QApVIrdP5oQ8QWKULcR2TunUiaxwzoZi/O55pIFa+pQ4wmwNRoced1YxOJrM3A8oSqDe
 JtXCqWVPryvpCv7hIwdiBgKFN9X25+jXVD5mMA3xMebinqfkXL5HR55cO4OzCVRQ37Mz
 naAk7DVcDJ+okZljCc7xFG1u4V+SbwB28bZEjEzVYORqgR7mWL/yOY/RRfd8glisdaO+
 QmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097270; x=1685689270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4FwbXCfJhxIqyab8rUpzADm0cxrqrrSpiPKuK+rasgY=;
 b=UnSxI6mhn8wwcrR3yMdfRiOWCFjX2vn5YI6+imv+7Ulw7PhR2jtmu1FNitf7tDHDCw
 eALalUHUcDa7HZR/DlbkbvmvQGumergRr5wV8xxnY8q0Uhr5xQ/U63JhokBcuwM6sOav
 gH1DkgVtd3bBn8rN0seAq964SSrYOinEftxiO4ZxMhW8jwphLGkQFwOQoA2eSMDQhQ0s
 fZyOezQJ1HKniaRxnMHgKbxPiBEphwyGDafcSR7V5BGtiI1M95J+QoVDlvz7qh/9WHv7
 ZqnOJmMBlZq3qEkPUAlaOuBo+xez6VC3YUG4DAPo0owSWmKtuTD+OW2n3AS0jKFzyJIM
 2kog==
X-Gm-Message-State: AC+VfDxUKJ2u8ynVxHFHeQAqgDdnKlQk1CMd6RVk6SNVJrCqipk+xu9I
 SknOcIDso9+2/q0EH+SCDB5rEejJQt5gUJ8AwiMe7w==
X-Received: by 2002:a05:600c:2195:b0:3f3:295c:58fc with SMTP id
 e21-20020a05600c219500b003f3295c58fcmr11395266wme.39.1683097270545; 
 Wed, 03 May 2023 00:01:10 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 52/54] tcg/riscv: Simplify constraints on qemu_ld/st
Date: Wed,  3 May 2023 07:57:27 +0100
Message-Id: <20230503065729.1745843-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1z2yRxjZq7X6

The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h |  2 --
 tcg/riscv/tcg-target-con-str.h |  1 -
 tcg/riscv/tcg-target.c.inc     | 16 +++-------------
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index d4cff673b0..d88888d3ac 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -10,10 +10,8 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
-C_O0_I2(LZ, L)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O1_I1(r, L)
 C_O1_I1(r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
index 8d8afaee53..6f1cfb976c 100644
--- a/tcg/riscv/tcg-target-con-str.h
+++ b/tcg/riscv/tcg-target-con-str.h
@@ -9,7 +9,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c22d1e35ac..d12b824d8c 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -125,17 +125,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define TCG_CT_CONST_N12   0x400
 #define TCG_CT_CONST_M12   0x800
 
-#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
-/*
- * For softmmu, we need to avoid conflicts with the first 5
- * argument registers to call the helper.  Some of these are
- * also used for the tlb lookup.
- */
-#ifdef CONFIG_SOFTMMU
-#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
-#else
-#define SOFTMMU_RESERVE_REGS  0
-#endif
+#define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
 
 #define sextreg  sextract64
 
@@ -1600,10 +1590,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(r, L);
+        return C_O1_I1(r, r);
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        return C_O0_I2(LZ, L);
+        return C_O0_I2(rZ, r);
 
     default:
         g_assert_not_reached();
-- 
2.34.1

