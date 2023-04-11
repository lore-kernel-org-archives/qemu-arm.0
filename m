Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp187184ejc;
        Mon, 10 Apr 2023 18:16:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350aoS2m5zE7GePQTPB0wN1PSqP81FuHu6Q/4rS/Mzv4m0zVarv16nTLIF1aKGV37qGouV9sD
X-Received: by 2002:ad4:5c65:0:b0:5ea:a3f0:9fb1 with SMTP id i5-20020ad45c65000000b005eaa3f09fb1mr12446128qvh.36.1681175776457;
        Mon, 10 Apr 2023 18:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175776; cv=none;
        d=google.com; s=arc-20160816;
        b=H68iXfPEscdemHiExS0I+BQTHedSwG0rAZ2ZNvyUtT+II4wowRT5nULAE72WzpZk1n
         ZV8cV6vIKhBQm7wyFySTB15Zbuh31ToVabS7w4VGaSAQhxDoHaEWuH8Q3EHP9NPRNHBO
         kcclWzK46BW3xI9CgX2wcFP96My+UjCRNMkc/d4e5In3W6Vb5IwMuyCA/cyt/C8nSqzJ
         qtPfHNr/rkEVTFHXmMujOK+GTAq4U1ej4w/nuuS6aP9O6VrHSl49364RfJqqkMlENGvx
         xGfXwCkYJt50OvNSMemwwtnsRJSWdv6jF0Te2/B9Km59R3YQ0RpuIsqbA9n6TsfwLWXq
         zf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pgPa5sFpfmtXQ6QYSfFyNkO0K0o+o8ysnES6ma8G0mI=;
        b=FzNr8XTBYJ/866k9d9WrfjIrA90zVrXHzxxWNjmJ+bzk6IAgksYByrv0ZsLduVHAfX
         jr6wBc4JrqewRPg8ziPP4VpzAOmGueJJuqV2iOGp559UrSqjEWFnCyMnuThiN2FAVKjx
         U+Q8G/QGQ8nITj9QXS4pJ+l/Tai9nXR6aJBtaR9fzvUs3wnPFTf7HwqNivdlCeMCOSaT
         VusOVQMwbA+zMr7XhkfLnHeX+E/nyJrsI16Bg/+/5udhPROVYK+2fnfkcy0p9XaFzle3
         2H85C0lejVc5o4k3LEgn+bEllXOoFdgeJlqU3xi7D0+3K7wck+KAYuDKiHMiZT67o1o7
         H0Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hZM0A86j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a056214194400b0056e9b9ee479si8827831qvk.243.2023.04.10.18.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hZM0A86j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2Wv-0006Rb-CM; Mon, 10 Apr 2023 21:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wj-0005Zg-It
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:10:29 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wd-0001yA-Ha
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:10:29 -0400
Received: by mail-pj1-x102a.google.com with SMTP id g3so7607593pja.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgPa5sFpfmtXQ6QYSfFyNkO0K0o+o8ysnES6ma8G0mI=;
 b=hZM0A86joJdjO8KqnAdnB4fJTOdEuM0XToARjEgsXc3gy31s7RfKEZWaIjWCwfPFk8
 x2hmzOGarVvzU79aGB8kfGtamT2xzbzw1tz38Ssq8AYxiWt7e01b37UtqrBV6WoRwvCb
 oNX1iVczEUvx8A6cv2RpkUV02Wtc1ArRq0ru04fruM6499NrDk3g5P855ne3GmPlNme0
 DXYsHTXwhdFNGz+/M2kmYIFMDjQCP4zA0lMyme43AeMlPT788HiQydD9qov359O55FNC
 2F6q8fRxgQLi48FvDuaJCiTwllU9mFZEN5aPLqw19jrvvMYljMWWLcbMn5uaqWyB51hS
 UItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgPa5sFpfmtXQ6QYSfFyNkO0K0o+o8ysnES6ma8G0mI=;
 b=VFh64l9IDRyo9vrAJ1gbPNIakD7GhdEWhrZ90kB6ZkNlBsd9xPnrBmwbGM2amZjolP
 F+yr4gU67bPe0tLdHvXWcmUAcMSjP/BNMQ1roxujYr1QSWQVyzbrm8IJo84nQVJ6DDOX
 vgJ9AqX1ZLD4aVOB6zropW4pco5bB0bFVrTv3MFxQtYjRslu7mf5D7vnVvSgCS4V+KNM
 7IeknmKySkOuXuBTU7AQSI8/wM/7JdV+N7nAurvSkoBt2wV+a9XKYwZ7gz6omqRlKHUF
 dlpSHgkcnNgklXnuCiE4eP33WrVKfBgJ1F6O9qp2vUSZFhU+wrK4WACBvFV/1fFcXsZx
 BXbw==
X-Gm-Message-State: AAQBX9d1+Nd7SapIxy0GRS/sCduXdcrKIb+SmkSH0GvJrzqRjWsI/B5h
 xkf8Hh1Gt09e2gnudt/uIFcyXpF3tcNRV0RfJZ7Uag==
X-Received: by 2002:a17:902:c952:b0:1a0:53b3:ee87 with SMTP id
 i18-20020a170902c95200b001a053b3ee87mr11512158pla.62.1681175422384; 
 Mon, 10 Apr 2023 18:10:22 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 52/54] tcg/riscv: Simplify constraints on qemu_ld/st
Date: Mon, 10 Apr 2023 18:05:10 -0700
Message-Id: <20230411010512.5375-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: JeCaRaFC5NJa

The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h |  2 --
 tcg/riscv/tcg-target-con-str.h |  1 -
 tcg/riscv/tcg-target.c.inc     | 16 +++-------------
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index c11710d117..1a8b8e9f2b 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -10,11 +10,9 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
-C_O0_I2(LZ, L)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
 C_O0_I4(rZ, rZ, rZ, rZ)
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
index 425ea8902e..35f04ddda9 100644
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
 
@@ -1653,10 +1643,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
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

