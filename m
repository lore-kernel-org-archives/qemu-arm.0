Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207869wrv;
        Fri, 26 Jul 2019 10:51:50 -0700 (PDT)
X-Received: by 2002:a63:903:: with SMTP id 3mr27085201pgj.371.1564163510041;
        Fri, 26 Jul 2019 10:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163510; cv=none;
        d=google.com; s=arc-20160816;
        b=gn3e3iEn5Jbi6/Wr5ZzGHkc0QvrDEXhfJByaq0Kd75Y5ZB5rCFrvCAtHY1TTTLbixf
         k7yuIL/8sEvjee6PPFfRCa3AHbidSAStOkl8FM5DJ9lA5SNno486wIL2rw63lNq0HIRr
         Q6+zU+vDxclKVP1kfo8A7XJU8vJMn/N3BN8KTc+GHHfBmEXmrKhcJgpDGZgCqTd+qjvP
         1LQHT/NVaX6VeH21nPU2j5V5GWI0oyGPXUDE/L2QNrIJ/6el/quLoD+1pWRdkXJYSwV1
         gE6SzMUzixDy9x+mxlBu7iLKioB7Qj/4pntD0TB27OMGVDCg0uXb8INcpwchMmSu30Oc
         jKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=gABFvmxEEZWzDc6dniX7CF33hz80PTh6Y9giG8B8d38=;
        b=WAOykz2iSZDuZXrWrNNAJNHAuQIOQDqkXRQMh1KamjZdI+HElMg/u/UuhCUuQFGOB0
         M+OnudMtsaxCLoBcZP2OV/PR0XPentnGrKzEFjiGK19n0FXy47EZnBRqiyq1IJWf43og
         NAEqQKOQtH99wWQtpyRZVOPyPMXImdw/1rfoUDN0KH15cxZShboBxSCUTJSvDN9oYcV4
         y48otv2lYPj93dIFOlp3dGnwODZvrdZTUovvQBWmMts8j9tm7wAKjC6hlfaIEa1f6hLu
         vMcGd1ZFIbuJZTf886szzbYNs+HaZFa0qijxOSZiSnyA/TeQknEh8r5aK9XqD3LGcGzY
         PY0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qWfwn4vf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p1sor66249935pjr.9.2019.07.26.10.51.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qWfwn4vf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gABFvmxEEZWzDc6dniX7CF33hz80PTh6Y9giG8B8d38=;
        b=qWfwn4vfzazKS9Qyhqn1gfCLRpl+xcxrytxChp9uBWzRbPB5/opktJPXVxkR+DovQV
         +Rbmq5T3LVD8szGFnO2/bLdiim6hk2L6ZEYt9sujp+9dGixaS+12xmyCPzumlrlRz2dO
         8qNeiPUzn/1Ufuc/AEi4zeO5YFHcZwn0E6EBFSkmucRNvGr/NY45c8IYLMq+6/RkYiZu
         iASZPLDLsGBC+/odukewMUBxulL7ShkJ7Cm/aGvI41PeMO7Afhgmc0WlJYygAF+2uxZf
         /E/vxM8auJYL5LSXWJQ1yA4GP/Gmq45MbwUkMSbOyYcaBCemPgbtUt6gF5xuO/t2pTMT
         eBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gABFvmxEEZWzDc6dniX7CF33hz80PTh6Y9giG8B8d38=;
        b=NsbQQBtH0GRyrcBwDNNGwvYGkGHzM+8vkZX1QTtdwgSO+zbdaV317Bffx0UZ9rtQPb
         v5UqcL9dZLTxTlhaYkpgDbzsXggBXuYfYAM/H7oqU05nin2MKYn6f6xfcvHPaYJXMPQW
         Q53gzofrCt6zy1K4qqwvScz6MhB+9pngP/R/sBb9EoHwfnc1CmzOoqwQjMcujNUbuvtm
         yyjsLWVIGsCu0rDGt+rf4D7Q9xg+29wOhuYbUuhFLh7qyjS9VI0TpGtQo2VhGUePiY6m
         sjpMWgoLDOhg3ijs64oymUtU4ybY2r5uJZvM8RM50L9jNlXXr/8Nn40HiOxkkjjh6GlY
         kRNg==
X-Gm-Message-State: APjAAAUKyNuQ4VXJB3fJxQ0kDyry+OqZl0Ck6DMpNEfUG/nGVZmGGDzC
	W0GwgTokhBVrvmLI/+ZMfMU9wV/EYsc4mA==
X-Google-Smtp-Source: APXvYqy59ngLkDCCAKE3jPs2qqnIZC7CjhGJmxPGhEjhbM6AxXraPsf0fWYBNSWOiczXgELd3IYFgA==
X-Received: by 2002:a17:90a:cb87:: with SMTP id a7mr102378917pju.130.1564163509596;
        Fri, 26 Jul 2019 10:51:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 63/67] target/arm: Convert T16, Unconditional branch
Date: Fri, 26 Jul 2019 10:50:28 -0700
Message-Id: <20190726175032.6769-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: LvqlmlfzdUMX

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 9 ++-------
 target/arm/t16.decode  | 6 ++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f1cab437e0..480515a0a9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10639,7 +10639,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -10683,12 +10682,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             gen_bx(s, tmp);
             break;
         }
-        /* unconditional branch */
-        val = s->pc_read;
-        offset = ((int32_t)insn << 21) >> 21;
-        val += offset << 1;
-        gen_jmp(s, val);
-        break;
+        /* unconditional branch, in decodetree */
+        goto illegal_op;
 
     case 15:
         /* thumb_insn_is_16bit() ensures we can't get here for
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index c18d146a84..457f2f4178 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -268,3 +268,9 @@ LDM             1011 110 ......... \
   SVC           1101 1111 imm:8                 &i
   B_cond_thumb  1101 cond:4 ........            &ci imm=%imm8_0x2
 }
+
+# Unconditional Branch
+
+%imm11_0x2      0:s11 !function=times_2
+
+B               11100 ...........               &i imm=%imm11_0x2
-- 
2.17.1
