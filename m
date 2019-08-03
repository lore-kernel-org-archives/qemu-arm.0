Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200892wrv;
        Sat, 3 Aug 2019 11:48:09 -0700 (PDT)
X-Received: by 2002:a17:90a:9b08:: with SMTP id f8mr10557124pjp.103.1564858089029;
        Sat, 03 Aug 2019 11:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858089; cv=none;
        d=google.com; s=arc-20160816;
        b=nAw9bZj58Kx1A5ePq6At369yCNjRkM56GUxwaep9idEcwYXykhWBpPazMAfCeygdgz
         ACT31Eh7kRjJpYAqj4uX7iYXBhOM/fO3RCsvLUDbRmR39iCeLDK45lBhkkszg+PgqvWD
         usMA3I5GLkDiOwuDUY1av60PeWLgzl2U6XCp6yqcxKnNUpz7fyCUR2N1oXJS+oNtlkcX
         Ri1tO+4cI9UFYFm9FNeX0BG1EFsgXK3gEET8Ng6AfbgetOxLghYXd8vvAkcuOeMIl8aa
         NR7Orpgm2RthfU4FgYV9IHhNbDIf5AQUyyMgtetW0KgBcGcar5MwIPfZYrU8YQouqHSF
         mUjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hV2eslCkM9+11E22XGBDo1tPxuDz+vxwGvc3iXR5Q+U=;
        b=yFgEg6Axz0YBACoLeu+K11ShnDaNmqj0VTtKyMYaJrTSD8TSvZHM/4/VS1EBT39SCt
         zljtfO8gd/3yb/AXdG4afcOWTl68EEP1xIHyiqtvBFouGvTaA/1rnazXpcX1jLEft+81
         VOnf/qSGQ68K1P4XWSlY1vcW/p34RMxtw8tcwppU5Y4cHlajxjw/Yf0E0IlFIVFXc5Me
         GSU54HEnkmjt+uKRIQL2/Yh2zzAQXZBS3nO6spKtki8aOBOg4qAua8Io0NicUR0pM8bH
         nyQxs44O4A+h26cFL2YyMi/WYsgslzGA7H77O9izv7ZNPvEyOO3on77NRd+TphBvagSd
         rv/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zeuwLZaL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z64sor60189782pfz.10.2019.08.03.11.48.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zeuwLZaL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hV2eslCkM9+11E22XGBDo1tPxuDz+vxwGvc3iXR5Q+U=;
        b=zeuwLZaLsuKqWvo0H7Lao3Xmq/IJ/PIq5u1FH0Yo7+Ni0P3R68YJHjwxjMrTtuaWjv
         6UIrxJop+hOjmQMKQmGyUtp6T3hEuNYSt7wzQQZMeD4Whyg71621DfHr+ZDL3FNabgcM
         Ei6YZ1Qjm2qvwsPMXDbAodapGHrzDuKJ3WFjUAlA8hwRKF4hZoqaVeY8Cy4Zf5EQD70Q
         toso8YjoLAGaQ0ePImuSya6uKEGRuNX4Z83FoB9B2hX682K7shVPM9hj7y+Jn0ZN4wQE
         8sVIe+ORce9HBYoAAavsZ0O0+Lb03HwTAA2v7x85Sf2HmI6PUWezWG7TUkVOBoRkMEhK
         GWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hV2eslCkM9+11E22XGBDo1tPxuDz+vxwGvc3iXR5Q+U=;
        b=ApdbE7D9ohdxfE9vzelx6MgBzfYz3GNfoERPLYowaU1ORARqpL6zLtDMK29zu22g9W
         rGYgSDWDh5RJo7kR8S0/ZtQ/rD6JP93Hk2wlMGV9MIQRDHPv82IzE0/8s9JxsLaz/3TJ
         dFN+uh9DMz6UX/IohAatUye/apVXYjsCh3Y58Lt+ZNNgO0ReSoI5MND1p8zOkuWE3/Fa
         der9Tl6R9zXHV1InaE9cphENOMNhVbyj+6v30lRuoY//Fputcnz/v+pwXfZcRrVIq7iR
         saKxUoY6DCTYfU+jdwwkHyxccu8ZzsQo7r8sQrXbfas5+IiZdlFQDsCEC1Vh7Ib7PySL
         D8eg==
X-Gm-Message-State: APjAAAXk9rtmI1vwoqWa+Va7pLn9LrA1AeRdXrjf7youHFe570nhafiC
	CJ5tl85Fbriq+XAf6SvuJ7extrmG
X-Google-Smtp-Source: APXvYqw50D1tcuFilG+lYYxJAjSIostRpVb5BrDCxdOpOTlicOOpTPm5TWnKVhKHX8m23N4E7EEppA==
X-Received: by 2002:a62:8246:: with SMTP id w67mr67312952pfd.226.1564858088554;
        Sat, 03 Aug 2019 11:48:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 05/34] target/arm: Install ASIDs for EL2
Date: Sat,  3 Aug 2019 11:47:31 -0700
Message-Id: <20190803184800.8221-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZohDBZqvn3+g

The VMID is the ASID for the 2nd stage page lookup.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c0dc76ed41..65e3ffbb43 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3452,17 +3452,23 @@ static void vmsa_ttbr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
+    int vmid;
 
-    /* Accesses to VTTBR may change the VMID so we must flush the TLB.  */
-    if (raw_read(env, ri) != value) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_S12NSE1 |
-                            ARMMMUIdxBit_S12NSE0 |
-                            ARMMMUIdxBit_S2NS);
-        raw_write(env, ri, value);
-    }
+    raw_write(env, ri, value);
+
+    /*
+     * TODO: with ARMv8.1-VMID16, aarch64 must examine VTCR.VS
+     * (re-evaluating with changes to VTCR) then use bits [63:48].
+     */
+    vmid = extract64(value, 48, 8);
+
+    /*
+     * A change in VMID to the stage2 page table (S2NS) invalidates
+     * the combined stage 1&2 tlbs (S12NSE1 and S12NSE0).
+     */
+    tlb_set_asid_for_mmuidx(cs, vmid, ARMMMUIdxBit_S2NS,
+                            ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0);
 }
 
 static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
-- 
2.17.1
