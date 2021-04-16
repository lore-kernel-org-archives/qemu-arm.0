Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp725616lfr;
        Fri, 16 Apr 2021 14:02:44 -0700 (PDT)
X-Received: by 2002:a63:2165:: with SMTP id s37mr816834pgm.155.1618606964725;
        Fri, 16 Apr 2021 14:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618606964; cv=none;
        d=google.com; s=arc-20160816;
        b=iQV0qyCJNkN1FHgF7TyHjBJNPyNLNSSWtvvS7lkqqZ2o1oK9esXV/LjBSvB+6xxf0Z
         yeYQswdSCbMkK8N7CMd0bUOmJsY4TKDkDAdfwO0v77ivrWTLZ+tTANKtjsVqLkftd9Qa
         OX7bQ93EHXVTV3qw8973LWYy38UuYy5K+LadtZpQiduk1sjJergp9iPiY/Hh8ndhNEz5
         VS595q942qxOhmNtAj4JfaQUnLo3FF2PfU5HOWdvOVxcEzj9p74x4Qu++0Lq3ejxPFW7
         6Z4qH4ZRevjoyBrx+XVUkJFl73DZMLyO9akRD7pouaG+4UUbDQZt85JYhdJBlwhYTZ2j
         9oxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=q1Vt8UmYtOZ5Zzksw1iaCjMqU/oXmihF2abTUk6CpYQ=;
        b=whx9FVCvmgQulfvu0i7iwjF787WxyWPHfqf5c3lsI1OEo3gajCBtxljKMdv4ugzXjT
         7U7FOoQaqtmleUNXPDdrkHjAm6iPLMNkfYokQRUZlIVJ/bJ/2H5w2vVCep3iD+bOofHT
         p/UKzobu917Qc2yovlc2x/RIvl9k1vpYHEcvlLCu24IiMdmd+8iyKfrjChWKuc35pFEN
         I6Ofr6JS4IjPe/aqDNI0YyP1DLwCb7/ml0hgrB1lVvDrf5lFry5aozykZyQNRcGEtJ1U
         CZRLezPEurH2UjgN7ETCZMiWkHN5HPvQeqwxziAyG011Mrx4dOcAp/hwXrBbNSlJBJ//
         CM+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WTZX/2ij";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n18sor4237943pjo.21.2021.04.16.14.02.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Apr 2021 14:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WTZX/2ij";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q1Vt8UmYtOZ5Zzksw1iaCjMqU/oXmihF2abTUk6CpYQ=;
        b=WTZX/2ijU82WfMVX/lh+aXZDtZSe2ttLeK4Uy1TpcYW1pruMrGF/bU5FkoxAA4dDk7
         sIW1mb+IR5JvdM+EFfojpuNwA3e0va5YXntX/c491fv2T0n00K8FExBA2AHwD7gcys9v
         WsRvG7VKarqhW4vPHV+1/73XHqB+gmnroNv8WJIRKEWr/gDS3yBxxQOFTcEc6uaclb7M
         Sd7e5U6JJGA3yi3vtliZ+ek9hyyDcncqYCLaTSj0qcYQlsgMh6MG4g/c7BydRuDKzNQ/
         e9TSApZEKV8JIE0rFeKhR0W3psV06O+J2+LgEav85tWKwatJ8HWamQkZQMKepluw5ISi
         0HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q1Vt8UmYtOZ5Zzksw1iaCjMqU/oXmihF2abTUk6CpYQ=;
        b=QhLKlbdHUH1I5tQf3M5HgBBLGyGsfjg8xt1EDliG7vqdWaS+t79xjoj5tcEGAC+klc
         OzPlB+BXRg5Owmbh4iPMZPW/gNqNRsK6phPWpdS3G+mV5MythDtly91cueAlWBxnUX0t
         7R5X+NlnzPaUWtoR8inY0tcHKncTPqoDl1ZuE+dOdaplwY6AQNPOpuBtIHkkGPyAV9sn
         EnO6ZIvuMd7gJvsScmXQUx5ViDlENHjo/+AnCndticqgQSD8GrBhuozfkUHynxo3hPZQ
         yrO6Vo4OIJQzeDWqZHAtHGm/LI20e66KdIdaW+g+6trg/HiqB3ua+aDSOKwg8TlQzzxE
         3vVQ==
X-Gm-Message-State: AOAM530NKzLCvQBZ/GOYgSJ5R7BPzFEBCM74BpmZ5/yGIOMQ6vwtsxTo
	iVvvI2die99RddQl2i9SWKBTphGqQ5h2B9P1
X-Google-Smtp-Source: ABdhPJwbMbucjVwG9gmHZ+/FqJW/O+4DEEh3NPqp2TGcQaRVQ6cn2BSve6GGip4N3NyC2VlnwWLwsQ==
X-Received: by 2002:a17:90a:bb94:: with SMTP id v20mr11421140pjr.144.1618606964240;
        Fri, 16 Apr 2021 14:02:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.131.83])
        by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 14:02:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 01/81] target/arm: Add ID_AA64ZFR0 fields and isar_feature_aa64_sve2
Date: Fri, 16 Apr 2021 14:01:20 -0700
Message-Id: <20210416210240.1591291-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tA4YRqjANC7y

Will be used for SVE2 isa subset enablement.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Do not read zfr0 from kvm unless sve is available.
---
 target/arm/cpu.h    | 16 ++++++++++++++++
 target/arm/helper.c |  3 +--
 target/arm/kvm64.c  | 11 +++++++++++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 616b393253..a6e1fa6333 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -947,6 +947,7 @@ struct ARMCPU {
         uint64_t id_aa64mmfr2;
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
+        uint64_t id_aa64zfr0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
@@ -2034,6 +2035,16 @@ FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
 FIELD(ID_AA64DFR0, MTPMU, 48, 4)
 
+FIELD(ID_AA64ZFR0, SVEVER, 0, 4)
+FIELD(ID_AA64ZFR0, AES, 4, 4)
+FIELD(ID_AA64ZFR0, BITPERM, 16, 4)
+FIELD(ID_AA64ZFR0, BFLOAT16, 20, 4)
+FIELD(ID_AA64ZFR0, SHA3, 32, 4)
+FIELD(ID_AA64ZFR0, SM4, 40, 4)
+FIELD(ID_AA64ZFR0, I8MM, 44, 4)
+FIELD(ID_AA64ZFR0, F32MM, 52, 4)
+FIELD(ID_AA64ZFR0, F64MM, 56, 4)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
@@ -4215,6 +4226,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cd92a22689..ec8d477516 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7561,8 +7561,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              /* At present, only SVEver == 0 is defined anyway.  */
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64zfr0 },
             { .name = "ID_AA64PFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db9..e8729b53fd 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -567,6 +567,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
                               ARM64_SYS_REG(3, 0, 0, 7, 2));
 
+        /*
+         * Before v5.1, KVM did not support SVE and did not expose
+         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
+         * not expose the register to "user" requests like this
+         * unless the host supports SVE.
+         */
+        if (isar_feature_aa64_sve(&ahcf->isar)) {
+            err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
+                                  ARM64_SYS_REG(3, 0, 0, 4, 4));
+        }
+
         /*
          * Note that if AArch32 support is not present in the host,
          * the AArch32 sysregs are present to be read, but will
-- 
2.25.1
