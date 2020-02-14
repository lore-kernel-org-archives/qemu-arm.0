Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2202585lfp;
        Fri, 14 Feb 2020 09:55:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOlrcm97pPVilMb4m2yw154pDLHMk8Uixrp1HaE2SQA3WMcJSoa4gIC8rLAsQF9WqoXboW
X-Received: by 2002:ad4:5888:: with SMTP id dz8mr3295277qvb.204.1581702934964;
        Fri, 14 Feb 2020 09:55:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581702934; cv=none;
        d=google.com; s=arc-20160816;
        b=wNnOvDeFRSadKGyqlF88ohwaBi/HS8kJhEG+ewtlpIt/r+foxauQCn0meiyz9S4rpM
         ccunJDo5GJkS7Derg/5okq0oFH60MGD6Vd88y3tRGPtjhYp0gF/pxj+QkvoshR3yAFCE
         Sspb+PZ6Jd4EkxiHMzj/0izWHxfBnLWDtg4aYigfgYgQrFr+WorenDgdItGa00+qNo3c
         fekccJcA7wHOp3q1/gnEqTqYLW85RLTm5RpFI/H+mcj7AZ0HEJOhvggEs17+kqI6w34u
         3PUGnf2s76zdwCfiMXYOYK00PIN26bZAfivnw0E2471LrlxJmgxn0z5hdRX/69Q+KDYm
         chTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vPNGprCOMcg0mBZ7UWesyY+l4Nq3dOFKdfD9K6E8o5Y=;
        b=YgYMQ3ZWzxFJ80/KanUyk7f9XK0j8pajx0JD5uYLkKyxqIq8tZKIlittwJQSdQMZ7w
         demllPCwIDk7XqOIi8xSa+vQZcU1pAb4oygaJ55N9XP6pk3u/J7zhD4KBQKiTGT8xLwW
         m3SlKaqTIEE+VGWzsRAaGSAHSVy4nSfmbDALb8bEtdMB570xETWph7b+iF1g7Kbf9Jp8
         dzI6XPDx7NXYUVpIOtU42WBbsTul0nNH5Rtul9dTQMU5nYSxBk0Ilk4fW7YrDG3QcMMQ
         eXY1/t0REfQXpO+/h6NVXqaLWwCooT3jv/XaKcgJgRR1bEAWViva0I5wy7GM3NyT25v4
         j3Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="fZ/DlAqo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14si3206822qkl.94.2020.02.14.09.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:55:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="fZ/DlAqo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2fBe-0006pg-DY
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7x-00069H-OM
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7w-00015S-JG
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:45 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55847)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7w-0000zx-CA
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:44 -0500
Received: by mail-wm1-x343.google.com with SMTP id q9so10829653wmj.5
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vPNGprCOMcg0mBZ7UWesyY+l4Nq3dOFKdfD9K6E8o5Y=;
 b=fZ/DlAqoLG6noh2KEyBpJOnoWSqe8nLugbokpyEiB+RCEud6RDqwBJCWa18Ygo+zVv
 uj9B2KfA18hBmI6o920dald9AxfPdUOBAbACJ9uQS50xzdbSgppAC5tkCd7DaTJAeGEf
 vi3UJEVAnBEgFl4MNTED9oz9Q082DrPCdSlOmwv9rxhSN8BsjEn5GjhIYHVPMsKi8Q83
 nlyzFqPINTUTmDr0u6ctzxOThfZNP6m8509ELEYHBOwxsfmwufDugNGVHQWR8n4XGmud
 dzVmazI9r2+v7Jp1hcPsYEUoIRRw6PR9IGNRn+mkBFMxmEghGDA6IYssaOyHNtXkF4PK
 tsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vPNGprCOMcg0mBZ7UWesyY+l4Nq3dOFKdfD9K6E8o5Y=;
 b=R08Q4ZzBiy8taf+cZXNZxvvkN/s+9Fk/4IOsre7YdF3FFcEIeq0DMC2odxZUxs4XBU
 BLKIstSlKSjCCDcOEZKUao5p1SECxeiG4DKDg7G0Okws4ZddmCPL2jxRffyla2XF86p/
 DjbZbPl5xCqqlWxQZHmaV7cgn5nQisIwrm6bltkJNxk2NKDpVeHdLdh847Dk2tuDPAYv
 utjkBtHueEa9XUsdTFpWwLR4h5z44x1qQKuMfA6qdZOseFiPAKAzWi7qlHxs0nWhp7SZ
 8vJm3Ov1fO7hyBlBx+Y9mVd6a3vzZnzX0nOXUqJNBqRcIKv43ciPnox1MPAr2Il/i2SZ
 w6jA==
X-Gm-Message-State: APjAAAX86I+DV1meP4vp8TsN9hudqzfPQytnLQ7ZEoGYGwK3kKi8pKvd
 +WQ3Kw788ox1gR3W6+4zVD0E49MLn4E=
X-Received: by 2002:a05:600c:294:: with SMTP id
 20mr5973217wmk.135.1581702702178; 
 Fri, 14 Feb 2020 09:51:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/21] target/arm: Correct handling of PMCR_EL0.LC bit
Date: Fri, 14 Feb 2020 17:51:12 +0000
Message-Id: <20200214175116.9164-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3wCtsgYnjxME

The LC bit in the PMCR_EL0 register is supposed to be:
 * read/write
 * RES1 on an AArch64-only implementation
 * an architecturally UNKNOWN value on reset
(and use of LC==0 by software is deprecated).

We were implementing it incorrectly as read-only always zero,
though we do have all the code needed to test it and behave
accordingly.

Instead make it a read-write bit which resets to 1 always, which
satisfies all the architectural requirements above.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2ebfa6c6545..468e4e89848 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1023,6 +1023,11 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMCRC   0x4
 #define PMCRP   0x2
 #define PMCRE   0x1
+/*
+ * Mask of PMCR bits writeable by guest (not including WO bits like C, P,
+ * which can be written as 1 to trigger behaviour but which stay RAZ).
+ */
+#define PMCR_WRITEABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
 
 #define PMXEVTYPER_P          0x80000000
 #define PMXEVTYPER_U          0x40000000
@@ -1577,9 +1582,8 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
     }
 
-    /* only the DP, X, D and E bits are writable */
-    env->cp15.c9_pmcr &= ~0x39;
-    env->cp15.c9_pmcr |= (value & 0x39);
+    env->cp15.c9_pmcr &= ~PMCR_WRITEABLE_MASK;
+    env->cp15.c9_pmcr |= (value & PMCR_WRITEABLE_MASK);
 
     pmu_op_finish(env);
 }
@@ -6370,7 +6374,8 @@ static void define_pmu_regs(ARMCPU *cpu)
         .access = PL0_RW, .accessfn = pmreg_access,
         .type = ARM_CP_IO,
         .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
-        .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT),
+        .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT) |
+                      PMCRLC,
         .writefn = pmcr_write, .raw_writefn = raw_write,
     };
     define_one_arm_cp_reg(cpu, &pmcr);
-- 
2.20.1

