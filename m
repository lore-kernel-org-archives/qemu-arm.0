Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp464512lfu;
        Sat, 30 Apr 2022 22:50:38 -0700 (PDT)
X-Received: by 2002:a17:902:900c:b0:15c:f94a:849c with SMTP id a12-20020a170902900c00b0015cf94a849cmr6221344plp.48.1651384238672;
        Sat, 30 Apr 2022 22:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651384238; cv=none;
        d=google.com; s=arc-20160816;
        b=bj7SohGf3p3a1pk6gzSB9958cPNFwG2yUP9EuX5vZ9z5H3jHIzOyuDw3IRakDW2Ioj
         CgoPbh7cO5URs3/7LtUxIhxTKX0I/GnsLghdsdx5dcHyW49zxKY+lR3I+ReabqmpAgER
         IDTDEb9wAm4oifBCRc0Erh2XAbFrmrlDHdu6jFwM60ta/R5X4PAYvA5pmLky3n9+JkI+
         w2Vzxrut+Ll0WRvGeRvFfKmx3j9D2/5Ww8mSGCzfwjiRSJiB1Snpev/1UnCH/AlX3X2v
         mgvL80tiM9PJcvCJBeKUYSgzYPRezeh++4dQVHK7CjS3q/XA+Qqd/rUlVlPv0CaNcpEy
         jatw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M9JbA/4mJJzCg1BoSjOe8spAl/jM5dv9tZGOFooq9Lk=;
        b=OwERkCxIqLFB+O0gLFbv8diD04eV4tAkNO73nOtj7hbc0hgMXZGUR9vC+QpMZJ61tH
         kXWTRdxFXKMwAtyKk9nfcEKR95NTpGVy2X1dHLlZ7q0FDHgMR6kH1yVLR8fl2cm6GcmE
         nsQ7CI8KrvoJLQl97MPPUn6bnLBlnIfjyzv/nrkG7AZiXatiEUanFgdk63BS8w6fvWNd
         rlr9lDSTT5vxeAqpfboLvh79LWnnm4TL1mNtZvnyOpgI36OOmQp0WXJxwNL7aOePAZsd
         9y4ihkybzeG1M2X8Z6s6kkbl9Rh9xER5ycVGKVWrDTBozUxr/Sa7pvvFDm+RovlLuwgB
         DRoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GDlZxwms;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c26-20020aa78e1a000000b0050a8eb0157dsor5810518pfr.83.2022.04.30.22.50.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 30 Apr 2022 22:50:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GDlZxwms;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M9JbA/4mJJzCg1BoSjOe8spAl/jM5dv9tZGOFooq9Lk=;
        b=GDlZxwmsilH0VCieHvbKqLSaZdinDddfExXGJxEUWq5g7Zr/2y+r80sk/zwG8pKSqS
         OyaX+S1i9GhnPI6EZgGiDQCIe24Ufy5AINb+xHSEyGYy6d7W3jRRGnQknmfYnEZScOio
         oxBGonrBLlItUZaNqJ+7a6GVvTHrsW4bKjIycYzp2LLnYSIHoWNbIvdY91Zau38fOXcH
         KWi94hGD4aebMckYUodO54+FTlK5KaJ1mke2fEAPjRepyghWxeDD+Kv0MmATkE2iVDqp
         yus36Ubs6Vmelm5WRlHRg7swomitCn0BwA+B5kL8EI2SJgoNIpOSn+u6VSfwOaj0qkVE
         a9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M9JbA/4mJJzCg1BoSjOe8spAl/jM5dv9tZGOFooq9Lk=;
        b=fn4BhGinJXx/coDEWwlkGV1mVVgh94hOPjRYbgtzwBm26A2nsT4Ao91CX9IOHFRhFo
         MCqPm56vOPF8HkCncktvXFNd7YwZfmuOl2BNWgSZjfSWh84VOloxJ4TR3+TB5LYpcvxq
         NhaJTkJaC/PRpJMsCCLpxquqsZl2yOWY6WTOdkoFVk36PN1uLwHXoc701cKxazMKycBu
         NHktcsW+rA9TtNahdipj6mSXx6NyVvuqCqR74xY7yhT113pPo4ygpW6jMsWDujv6Wciw
         Fb31mhbb9qHhlNlVsEbzzAbaoG3smaZoTJ74VMXXetquXVjjOoqu+I+skjCzB8Nn9fCQ
         Ljrg==
X-Gm-Message-State: AOAM532P84MlW9qWwgkRWABgtOc6vK+K2QJIkfdGk9Y3N8TEjLDDkfap
	valZaYZxPdSWysunu+xPdry46wyy
X-Google-Smtp-Source: ABdhPJy7MaCH11IthoWLLviubSAZWgFmmvf+NeSA3psJdYNqkfnfWfYK7q0WCYspGtPsRAwnoYfohQ==
X-Received: by 2002:a05:6a00:21c8:b0:4c4:4bd:dc17 with SMTP id t8-20020a056a0021c800b004c404bddc17mr6117099pfj.57.1651384238220;
        Sat, 30 Apr 2022 22:50:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.142.129])
        by smtp.gmail.com with ESMTPSA id cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 22:50:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 08/45] target/arm: Name CPState type
Date: Sat, 30 Apr 2022 22:49:50 -0700
Message-Id: <20220501055028.646596-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +ZMJ5s1nnDhV

Give this enum a name and use in ARMCPRegInfo,
add_cpreg_to_hashtable and define_one_arm_cp_reg_with_opaque.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 6 +++---
 target/arm/helper.c | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 858c5da57d..4179a8cdd5 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -114,11 +114,11 @@ enum {
  * Note that we rely on the values of these enums as we iterate through
  * the various states in some places.
  */
-enum {
+typedef enum {
     ARM_CP_STATE_AA32 = 0,
     ARM_CP_STATE_AA64 = 1,
     ARM_CP_STATE_BOTH = 2,
-};
+} CPState;
 
 /*
  * ARM CP register secure state flags.  These flags identify security state
@@ -260,7 +260,7 @@ struct ARMCPRegInfo {
     uint8_t opc1;
     uint8_t opc2;
     /* Execution state in which this register is visible: ARM_CP_STATE_* */
-    int state;
+    CPState state;
     /* Register type: ARM_CP_* bits/values */
     int type;
     /* Access rights: PL*_[RW] */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a19e04bb0b..d560a6a6a9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8502,7 +8502,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 }
 
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
-                                   void *opaque, int state, int secstate,
+                                   void *opaque, CPState state, int secstate,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
@@ -8662,13 +8662,15 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
      * bits; the ARM_CP_64BIT* flag applies only to the AArch32 view of
      * the register, if any.
      */
-    int crm, opc1, opc2, state;
+    int crm, opc1, opc2;
     int crmmin = (r->crm == CP_ANY) ? 0 : r->crm;
     int crmmax = (r->crm == CP_ANY) ? 15 : r->crm;
     int opc1min = (r->opc1 == CP_ANY) ? 0 : r->opc1;
     int opc1max = (r->opc1 == CP_ANY) ? 7 : r->opc1;
     int opc2min = (r->opc2 == CP_ANY) ? 0 : r->opc2;
     int opc2max = (r->opc2 == CP_ANY) ? 7 : r->opc2;
+    CPState state;
+
     /* 64 bit registers have only CRm and Opc1 fields */
     assert(!((r->type & ARM_CP_64BIT) && (r->opc2 || r->crn)));
     /* op0 only exists in the AArch64 encodings */
-- 
2.34.1
