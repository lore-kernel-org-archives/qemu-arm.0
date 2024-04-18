Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1806516ejd;
        Thu, 18 Apr 2024 08:21:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULSd3ZdfTObgXlG3GkgNZJeur7sa85ZQqqKo4bwClaKAkt+YQYC9oe8GPTffYj0MxBQKifgU7Th8m9Tq+hxwtFCZNRpnzA
X-Google-Smtp-Source: AGHT+IH0B00gYYH1MeQtDP/q+Qr+7y8ogFsXuXaM03EWvRHy189mizqPWGh5pRaPhRyBcm1vvRED
X-Received: by 2002:a0c:ef01:0:b0:69b:251a:2ff3 with SMTP id t1-20020a0cef01000000b0069b251a2ff3mr3130848qvr.40.1713453689633;
        Thu, 18 Apr 2024 08:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713453689; cv=none;
        d=google.com; s=arc-20160816;
        b=MaQ/U1IqybNHlmiNABCIsMPyiJeSoLjmO0K/WBkrl+2c9f5eSEtwxQvN+PG66cLfmG
         YUwxIR1CQlZZhNaG6pOUYtcM9TCSYGtnXEwP1m38e/RHytpZSkoG6Q3rzX4E3v4sz5dD
         OLm9vLFs/50NEw2VZrdy9V5i7wpEKK16VvB8dxvdSmDwDUcYqpcWoT1/D1UUM4k44gGf
         kPLLs40SUCBzAQH1RPnd83KolHnpiurP0E+Zcgg9mRzXO0eZXZNHCGQrDQPqcTHizBCl
         okY99H4OEjwkxkDz0247jbgduYuMscpbXYf2LRTdowh7Pr2VdG7GDhxlxCZyq5Pnhw52
         5hGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=n5QqC5TWO216H4QGIIquQv5JWDc3hZs2/K7GnFUQidw=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=OHglslHuC5PRDaZFkdvG3XvS+hbycVD30w8kYgfc+m0Zde/TjzkfL8oCVx9MmmI7Py
         Ufq7I73xyApM+j72iiwhfOUNptWNqM9e+QJUxsUq5ky7TnKqrHEdEJgCs0xoRDnyJNN+
         RR67demrrGKwuNi0WNtA9q1lRZNw2923JMyfxqf1BM/r1MDeX/VwPU/coCKDb1NqeaIy
         vwcX7yOoovbfH5SfH6R1hMLKGn1RQir9GBFuPfXEPxOPK6PYYQ3OWXSM1nNyQovtRU1a
         Dp1O9d2TZCiX428OmSoKVMAc49CtoIS+XOGwmyKr4lrbFKMX8lZCgcE/7bDJlhcJa2Nj
         03AA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJbHDLDz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020a0562141d0600b0069b4856b1b0si1794076qvd.186.2024.04.18.08.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Apr 2024 08:21:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJbHDLDz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxTYw-0003Jz-IY; Thu, 18 Apr 2024 11:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxTYm-0003Gr-97
 for qemu-arm@nongnu.org; Thu, 18 Apr 2024 11:20:24 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxTYg-0004WK-RV
 for qemu-arm@nongnu.org; Thu, 18 Apr 2024 11:20:23 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-418ee2fcd6dso4251125e9.3
 for <qemu-arm@nongnu.org>; Thu, 18 Apr 2024 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713453607; x=1714058407; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n5QqC5TWO216H4QGIIquQv5JWDc3hZs2/K7GnFUQidw=;
 b=tJbHDLDzekKvLlrsVrfslFFmTYSs9///PV69aSjxXU93sJcqKOF0p7NU+UMydnMJgN
 NpoCbUDIDKhee9eJ/8LX7Ym4hZ5JjhvfZOLb7a/k+jfLZZTbQdKRHZMTht7amcbsgyzJ
 IHmYeZ6FeUajjWKZBZAmu3uc9xpoa48SP/a3CLo56z0OEAXsYQfX+TQJvFJkM8gHVVTt
 JoIGNs6bWagbCROrPg4j0TKTGfJ2agIAsMLfnMC/2q6Kb4I4/t0UspfLxOBbjCCeaguQ
 swOEUT+xq+tvaaEd+rMhKeRM+r6c8g3ewqYqlpgC6obaDUBWpWRObsdPVbqO6KGoUHRr
 oRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713453607; x=1714058407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n5QqC5TWO216H4QGIIquQv5JWDc3hZs2/K7GnFUQidw=;
 b=SKUc/2FbI40sGIwanqUfwCR0bihtkMuzUbn1vWvuY7e+DCUqhTOI0Zqzw4296PeRi6
 2Rtf2GsSIXmwCz0kW6erysc4Di1g5CSEZPoirUr9wsSJARkUeX/JLDxn0cA5rhJ9OCSG
 ubMnLbhgChjrP66gEJ7YmLxKo6+gkpZEO7hN06SesX/pqFACR6H5YGJ8cvdrIc/OspC0
 JDgJArv2L8GWmwj6P4MP6Fg7UycjpFmY/HN3lxwXRyl00+Tf5fx3sKCUchYhK/WU9g9I
 zeEYFhdxnQPN7rAvGmCTfwWzlor7zmrR+c4JaMtO02UbfxstWSk4X9vqUBdTbhN2GF1F
 U7eA==
X-Gm-Message-State: AOJu0YzkXru6kcLWjiBoH2F9qKErdAnsInH0OrpazPfshmioN5dZhXWb
 wnAwS6/wQIV+Mz8SxD3DXhwyGtzAhfkzHbPyZ4YUDrs8fdKIypiZgcwZ+OI6sz/xO1kOcK/uTG5
 x
X-Received: by 2002:a05:600c:1906:b0:417:c5cc:77a7 with SMTP id
 j6-20020a05600c190600b00417c5cc77a7mr2216901wmq.13.1713453607195; 
 Thu, 18 Apr 2024 08:20:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b004162d06768bsm6886839wmo.21.2024.04.18.08.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 08:20:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/5] target/arm: Enable FEAT_ETS2 for -cpu max
Date: Thu, 18 Apr 2024 16:20:02 +0100
Message-Id: <20240418152004.2106516-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418152004.2106516-1-peter.maydell@linaro.org>
References: <20240418152004.2106516-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: b9BhIIV+r08Y

FEAT_ETS2 is a tighter set of guarantees about memory ordering
involving translation table walks than the old FEAT_ETS; FEAT_ETS has
been retired from the Arm ARM and the old ID_AA64MMFR1.ETS == 1
now gives no greater guarantees than ETS == 0.

FEAT_ETS2 requires:
 * the virtual address of a load or store that appears in program
   order after a DSB cannot be translated until after the DSB
   completes (section B2.10.9)
 * TLB maintenance operations that only affect translations without
   execute permission are guaranteed complete after a DSB
   (R_BLDZX)
 * if a memory access RW2 is ordered-before memory access RW2,
   then RW1 is also ordered-before any translation table walk
   generated by RW2 that generates a Translation, Address size
   or Access flag fault (R_NNFPF, I_CLGHP)

As with FEAT_ETS, QEMU is already compliant, because we do not
reorder translation table walk memory accesses relative to other
memory accesses, and we always guarantee to have finished TLB
maintenance as soon as the TLB op is done.

Update the documentation to list FEAT_ETS2 instead of the
no-longer-existent FEAT_ETS, and update the 'max' CPU ID registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 2 +-
 target/arm/tcg/cpu32.c        | 2 +-
 target/arm/tcg/cpu64.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 958c69f3799..de39110692b 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -49,7 +49,7 @@ the following architecture extensions:
 - FEAT_EL2 (Support for execution at EL2)
 - FEAT_EL3 (Support for execution at EL3)
 - FEAT_EPAC (Enhanced pointer authentication)
-- FEAT_ETS (Enhanced Translation Synchronization)
+- FEAT_ETS2 (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index de8f2be9416..b5a60682fa6 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -67,7 +67,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_mmfr5;
-    t = FIELD_DP32(t, ID_MMFR5, ETS, 1);          /* FEAT_ETS */
+    t = FIELD_DP32(t, ID_MMFR5, ETS, 2);          /* FEAT_ETS2 */
     cpu->isar.id_mmfr5 = t;
 
     t = cpu->isar.id_pfr0;
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 4445c5a212b..da15182595b 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1195,7 +1195,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
     t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 3);      /* FEAT_PAN3 */
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
-    t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 1);      /* FEAT_ETS */
+    t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 2);      /* FEAT_ETS2 */
     t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
     t = FIELD_DP64(t, ID_AA64MMFR1, TIDCP1, 1);   /* FEAT_TIDCP1 */
     cpu->isar.id_aa64mmfr1 = t;
-- 
2.34.1

