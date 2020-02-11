Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5358979lfp;
        Tue, 11 Feb 2020 09:44:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXsQ+1o3sw8mo1TGbNT18nh1ezNvOdcTxQKq1Y7m++vvNKvfIas6FOQ8/PTRXTNEVvH/fj
X-Received: by 2002:ae9:f50c:: with SMTP id o12mr7372600qkg.42.1581443078041;
        Tue, 11 Feb 2020 09:44:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581443078; cv=none;
        d=google.com; s=arc-20160816;
        b=hunwXXt5n10FubeR5bNwKxmh/9A5taVIKbAMzcqLu8Iq2SgDT3iWcklUkGwFFaQFxc
         n+1eHMZ5DUfggFuJpbLgKEqkbWMQE0sltm837n0w6KxPZceAPaT11y8eVfTTqFLoM43j
         T9hz+Go3odNp7Q4N3j4Yxf9yX72vWp6acF9vhnRQajsmXiGNQtMFj55YbpXTUAFayBN9
         OJvi7ZCgWIqYtDmN144dBAKooam29tR0lun+x34dqSCRHZY6VcCDEeHzv10mJcrgkk8u
         yuPV/ieUTChHpbkSKx6ekwTMOLjoMcdbK5usNICuIFAGhnq5XirI0m6fwvJ5lN7jP6P4
         Dfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=e9WDJDdjLb6cBOzgUb2FHyNTKjKf7aBhEJaTRctl1CQ=;
        b=p2HIMYyb8Si36A1L1YM6Y9zDsgpjLrE00duE4Su2TZn3YJJUSyqj1idilx9eTCqTtI
         f+8lobuDvY71vEN1ISaz9OvXOOHzSLuobkjh7psi9yGj5xmSYbUUo1RqwHw/DK88RACz
         2gHQkXFCMDfmcDv7Mo32gbVUFZd3e8kQv01FDiaHCYgNSCGD5N2u02XPK+8ut3enOsCy
         jhM01ka43aZ4QJXY84jykjnvzOmtpXTOEm4AbfLGW6+0TwncB+MW6rGafWIJQON8YCkk
         AJuFo3vMLJDpHy9takEyeJQYRN2deAAjW0CUU2uRWIDQRl/xyzIcFOfjvuobjbso5nnI
         BcrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JdxnJb19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c141si2346075qke.337.2020.02.11.09.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 09:44:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JdxnJb19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1ZaP-0000Hv-Cp
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 12:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTo-0005uj-AU
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTm-0004LN-Qm
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:48 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43984)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1ZTm-0004JA-Hn
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:46 -0500
Received: by mail-wr1-x441.google.com with SMTP id r11so10242645wrq.10
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 09:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e9WDJDdjLb6cBOzgUb2FHyNTKjKf7aBhEJaTRctl1CQ=;
 b=JdxnJb19Yx+ytvD5ScJML7HO1/01cTmA2Y+T1l7Y85KZ1ebi7R2Z4Vuux3PMFCXfew
 RP16qgznOUeFfmbLZ+o8JcEyd10U1Jl8Mzgp24R5UBlFV5gJnPzU6+Y5iTV2pBDcpHhK
 wfqOEdNcJCInSpuZhT05TOZvlLC9P9dlYNoBTmQ/ZWAQyTeknVIZYrhnxF9Jg1GDX0XA
 EivwAUzjJ2g5+QhW7AwX5p2aRRJSvSm6MXf84d1ANT1aCctRvFVkt/6LgtdPtMMGi5Vn
 Dtj1xMmLWb8a5vQRk8+kcuaBZ7W8E+dUXtvXhFNWoyPIo+D+GQ1eZXkNiOz/DQqos7H4
 5/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e9WDJDdjLb6cBOzgUb2FHyNTKjKf7aBhEJaTRctl1CQ=;
 b=WE708VhLOojNWrtBqYP6ptg53sYsKmsRkKnK4PZKz55X69mn2YO6ESDDVWUEKc+93W
 Sj2w80uwTJiANJJOW4ovRqKlZnimS3cbX9GucW9H5s03OTuSl2bdHZcFDoONvjJOINNr
 Z8N+It7fnD9uTWpR6Sr6k/hjr9oV//bNtMqB+9pwNtbsWJlAKAaoO4K5XVFh0P+ynYX1
 4NBBAAbnkVLMKg1Cv8ZfHnNbgIjPk5jIoh4b7Um8FhvcHCFYqayOhv0UqzUacELfQS8d
 +dRNca6iHiWCt1tIG2e1YC0C0UURICzcSBtuPkH+gI7rgRnsiwETGLy7BtVE+LhDoFv5
 NzXg==
X-Gm-Message-State: APjAAAUED72CxI7RXtvNHFg9R0OtAB8XlInOeTHbNb4n/zlaFWiVxcHi
 2JJkFmaa58R/s5LHgnqFyAAx+FUvkTU=
X-Received: by 2002:a5d:530e:: with SMTP id e14mr9482945wrv.250.1581442665222; 
 Tue, 11 Feb 2020 09:37:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm6109675wrq.16.2020.02.11.09.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 09:37:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/13] target/arm: Correct handling of PMCR_EL0.LC bit
Date: Tue, 11 Feb 2020 17:37:26 +0000
Message-Id: <20200211173726.22541-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200211173726.22541-1-peter.maydell@linaro.org>
References: <20200211173726.22541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ri18VMlxGjcV

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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c6758bfbeb5..1d8eafceda8 100644
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
@@ -5886,7 +5890,8 @@ static void define_pmu_regs(ARMCPU *cpu)
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

