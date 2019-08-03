Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201226wrv;
        Sat, 3 Aug 2019 11:48:43 -0700 (PDT)
X-Received: by 2002:aa7:9dcd:: with SMTP id g13mr67167491pfq.204.1564858122971;
        Sat, 03 Aug 2019 11:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858122; cv=none;
        d=google.com; s=arc-20160816;
        b=iLfZFKlpKzGWEltCpvY1GsIcIjB+0PtGBc+e7sQMLu0dTmqhPAHD3Vo/DX6azE5zd0
         oJyDYv4P/4/89ItmuffK8Jd6HEzTNnRBDO2Wku4VC2owy0Oz9lwJ846WmfA7glP+LIl2
         m+TtNkKzgoWzJo2YMz+MpUhFUiUQNePbCqhAGVmIzt/RmzDyYXOlEZYiV7eQstY3s8yK
         88yB3nYDqB3Qc27VqhNhJBFa7icgKCxzBXYEewfO7SdHGKUb+FADNorlWxmMBnsfNH70
         h0yJUxQoh8pa3HBxgJhiBJSxQOz/LeBiap0dnTc7nLghbM9g2dD8gVPh85qLEC/RJth0
         P7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VZbb1rzI4zahnAL11h/DzkD7ar6WwiCPlhOLpT3N7ho=;
        b=cbQVX7Mn0HimnLmruIT/5Z/wxys8FOFPkbJ+2FxlX8ICZSpzbvnPw8ExPJUy4KxiZr
         n4rTT1QiyGlmeCHTjFd0xpQunCS5KIODmHQn4t1ZEAhO/1xwMfd3wUAHgSiC2XNDoLit
         H0knAbcIEqekyo1+iDEwsSTFio4/qGd6Ec+8DfO0adN0q1v2H6+5KBKer+5mtb+MtqHa
         Gvgj8KTu6I8naaKphmmAl2vLYhLP4/WhJhscROODZkxE2AsAqifXYJr0bcICg3F8bLR9
         246BIaDLx89s2sF3G15PVZZo7+e0AF2MpFWA43Ul/rqvoKwMdPC+Z9DWBi+q+FPgWyrC
         kpJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUMdfYty;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r11sor14663295pjb.8.2019.08.03.11.48.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUMdfYty;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZbb1rzI4zahnAL11h/DzkD7ar6WwiCPlhOLpT3N7ho=;
        b=XUMdfYtyP/dN0NvjiEKzLhQ81PX1aEG6yfDSVTntnAkC0mjiaPutVEuE/iwMSdBaoI
         W2BAVieKDVGUWnETHBzDpm1ZmGfk/R32ANvpX6bxCan8Oz3rTCsduFiqbjm7V8wqU8/b
         bMpmDhcVV6F2wWxm9nc7j2Bn/Ofi/Zs7IjN9iW/QZAMI2nSs5Wx6sAVyRWuS0BaY5UXm
         WQA5op6gMyyi/s9Nb5FAhiwqXDqXfizNoVCq7fWlZCVe/TUh3wfRLSGOd2CkAbw8Rm8S
         rFZi2TjdomMmBQLXmyScAFfk/5j0NKU2Smfhj+o1qrw/6SRBWfVSw12ecq7VZLD5gkW6
         wutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZbb1rzI4zahnAL11h/DzkD7ar6WwiCPlhOLpT3N7ho=;
        b=s0OSnZMc9Q+1SJh9nxWr9oGRikCcdY25SFnL4AI9zIaY8EJ4g9Dblgz6HvhdtPdcjF
         K166eb4l7DA0VVXVj6UjmsfbU1c1U8k88lxVuijKVpOHrru7PeUD7OgBBAGLUHlTD7fg
         3HIGSdsRwQV5QwUutsRKKip7+7w9XnMBMDosStKQd6l6xKUazfr1hn5SoeV1OGqPdfiI
         zmXfRdTkFJQ/EillUKDMT9CXYcQsMv3scqUOcYASmM4PiW2bP93ZINMWBrmhHhNHKblA
         ZiIiA9RB/jW28bve1LofHyizQ1BPLSzHSbj2DY3XV9ilhUuZcpmRmmp9fCpwZP6T/B1m
         77ng==
X-Gm-Message-State: APjAAAUtOF85fXOcsp7A5i0Y053LwHRn0ZHdQUfuLvL3AXKadh29EviJ
	9juqSraCY3Rgy0UG/EuQHesBKlp4
X-Google-Smtp-Source: APXvYqw7VsRRz+iBeE+9ZkwpQ3Zibt84S6Mpe2vBhl6+hXjcwsWUD8EUrwYhDFR18aHpFlkHDuvpsg==
X-Received: by 2002:a17:90a:8a0b:: with SMTP id w11mr10351911pjn.125.1564858122529;
        Sat, 03 Aug 2019 11:48:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 34/34] target/arm: generate a custom MIDR for -cpu max
Date: Sat,  3 Aug 2019 11:48:00 -0700
Message-Id: <20190803184800.8221-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fM5qzQcBfUgd

From: Alex Bennée <alex.bennee@linaro.org>

While most features are now detected by probing the ID_* registers
kernels can (and do) use MIDR_EL1 for working out of they have to
apply errata. This can trip up warnings in the kernel as it tries to
work out if it should apply workarounds to features that don't
actually exist in the reported CPU type.

Avoid this problem by synthesising our own MIDR value.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20190726113950.7499-1-alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h   |  6 ++++++
 target/arm/cpu64.c | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d7c5a123a3..6e4c97d398 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1605,6 +1605,12 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
 /*
  * System register ID fields.
  */
+FIELD(MIDR_EL1, REVISION, 0, 4)
+FIELD(MIDR_EL1, PARTNUM, 4, 12)
+FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
+FIELD(MIDR_EL1, VARIANT, 20, 4)
+FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)
+
 FIELD(ID_ISAR0, SWAP, 0, 4)
 FIELD(ID_ISAR0, BITCOUNT, 4, 4)
 FIELD(ID_ISAR0, BITFIELD, 8, 4)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b1bb394c6d..3a1e98a18e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -296,6 +296,25 @@ static void aarch64_max_initfn(Object *obj)
         uint32_t u;
         aarch64_a57_initfn(obj);
 
+        /*
+         * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
+         * one and try to apply errata workarounds or use impdef features we
+         * don't provide.
+         * An IMPLEMENTER field of 0 means "reserved for software use";
+         * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
+         * to see which features are present";
+         * the VARIANT, PARTNUM and REVISION fields are all implementation
+         * defined and we choose to define PARTNUM just in case guest
+         * code needs to distinguish this QEMU CPU from other software
+         * implementations, though this shouldn't be needed.
+         */
+        t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
+        t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
+        t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
+        t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
+        t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
+        cpu->midr = t;
+
         t = cpu->isar.id_aa64isar0;
         t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
         t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
-- 
2.17.1
