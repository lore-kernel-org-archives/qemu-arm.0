Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207334wrv;
        Fri, 26 Jul 2019 10:51:18 -0700 (PDT)
X-Received: by 2002:a63:d23:: with SMTP id c35mr91879694pgl.376.1564163478414;
        Fri, 26 Jul 2019 10:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163478; cv=none;
        d=google.com; s=arc-20160816;
        b=op7WWYx2X4EZGcV/AObOuV9V0xT/CJn/VrMp6Oc4lnGZcQrj7cEDpRboHuy+LG3xpv
         06ZbWyUer3TPVPL28MxY6Xk9i2mjcExX4FJkVgQdNMUcqMdLBbJ68XhBmZuISKn4TV3s
         Rze+HfG2IOsBFauTcjI66b/L1l+Lv/OvMuiMWTWZrcf/yk0s9cr5Q8b7loMPXm8n43yD
         +iC7T52T58TRvSUdceyzFEkHoPtIHBzsCUAqIM73N2rcY/V4JrTZRmnUp2GfJqoMvxKR
         +iDnf+okZHmNNfrVYVNj7AVPF717kFBNAHBUCJgYhYYwKRrZPxB7QfpOUmWLydeJYPa2
         qarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=hWnZNwWI4tI65PwmLTIEUSuYbSd9btmA82x5Eaqyf6M=;
        b=dP1gAl1z2ezt1+1dJ8KNKCVVBTUl8HnqcPeMd0Yx2Y3a48v0n53ahgPv/Nu0PF2mRu
         BMHgNf46eitKpI5YWSTlYRWyc/SXR8ffDiv2Fp8R5yaMt0nsyCyBItlNaOp9M1qfDpj0
         uaRvJZr8A/ilmuOjs4zmi2kWSo/sn6PDKllD2RNjkDJdXY6oaM6Y+7jD8MTaYY1vFX+O
         2UOL6NZ3EKV260+wf50RVWI4pvLaaEaju2L61ilvlRfxocUK00cN7URh2c/ZMolKviNa
         iRByQ1pwn8Uu8WxmVjdzPWaNL+GCXlOX4vNRrCZe4QpWBn0ig9Sh2RZ2ALUGhK9eEIGu
         HOzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=biC6MyaV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v2sor65831269plz.40.2019.07.26.10.51.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=biC6MyaV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hWnZNwWI4tI65PwmLTIEUSuYbSd9btmA82x5Eaqyf6M=;
        b=biC6MyaVGYFUU+cB3fOZf2CH56rijwNd+mbIDwMD/XMxGqHlYgByj4Xxk0GTWLZGkk
         C8vjr7X8hcWBwDmMYCPejSm1uI3kVaitNj3XhzKz6bPydefsq9J7Ih54rvv3rubBE+QM
         86np2g8e+Dy3H1875Gs/DddVboAbbaL7FsPI5gM/2zqQPbXmsvr0ToaYymCxFjkPL1ag
         I6dNr4ipNEpDbDlVwa79TTrvB8gURN3C0DIbZiBWGcocBwO2Eie+I5Kklnoyg4X9p1pA
         NeOPc/Ya1lLfInbFUL37f1cZfALcblvODxlEGoIGuyOOjQdLxfa2c2VfelqdLBFp29Nf
         tofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hWnZNwWI4tI65PwmLTIEUSuYbSd9btmA82x5Eaqyf6M=;
        b=gbuD1YV2oqxu6WJBwOtK+DG02V8OWKSFE6hGNHWyHvB8+eu7PBpODyOq+TNFzb0uCc
         NJRKBvskvpr2pQsY0fkmSNFYNhVkUqkR1MoyJWrbtIbFjmQ0acvHl9/y3mYGzG1hx7mk
         dgD0sB3keATS3qNGrioNFZLYOsXLgbvgC12yhxHCk7IUTtHGDZCHGmkRoKDSdAOk/ba7
         Goxjcm+/759KYfMvxJg2ZkQq/n5HriLMkfbXn/vNNfAPbF5QFSzV5MvZgBNtmSeDLkLf
         fUCEQtQTLO82lOdL4xVnpavJjME9xAIhHH1Pi/ABlgmuBtu+3CYtTh33ZQRXbI9/I0QL
         Czbw==
X-Gm-Message-State: APjAAAXUdRhbBobTVURKGdzbkkWIcFaHvzRYAyRhXDVDKoSKp/Gyk1jl
	R+zzw+/d2zY9tPt5a6RHIGt7TPfOZqGwuw==
X-Google-Smtp-Source: APXvYqw8IAKElZE3Lyhhe9Co2Ud0b/NaCL0HySttIbbORMxzrCKhZz+6hKqM8IA6SbXHXqxKM+0NnQ==
X-Received: by 2002:a17:902:8207:: with SMTP id x7mr97754983pln.63.1564163478040;
        Fri, 26 Jul 2019 10:51:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 37/67] target/arm: Convert Unallocated memory hint
Date: Fri, 26 Jul 2019 10:50:02 -0700
Message-Id: <20190726175032.6769-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: HWuF1kOdub8K

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 8 --------
 target/arm/a32-uncond.decode | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5366741d7b..87cbadc6cb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10227,14 +10227,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             return;
         }
-        if (((insn & 0x0f700000) == 0x04100000) ||
-            ((insn & 0x0f700010) == 0x06100000)) {
-            if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
-                goto illegal_op;
-            }
-            return; /* v7MP: Unallocated memory hint: must NOP */
-        }
-
         if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index aed381cb8e..afa95bf7aa 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -64,3 +64,11 @@ PLI              1111 0100 -101 ---- 1111 ---- ---- ----    # (imm, lit) 7
 PLD              1111 0111 -101 ---- 1111 ----- -- 0 ----   # (register) 5te
 PLDW             1111 0111 -001 ---- 1111 ----- -- 0 ----   # (register) 7mp
 PLI              1111 0110 -101 ---- 1111 ----- -- 0 ----   # (register) 7
+
+# Unallocated memory hints
+#
+# Since these are v7MP nops, and PLDW is v7MP and implemented as nop,
+# (ab)use the PLDW helper.
+
+PLDW             1111 0100 -001 ---- ---- ---- ---- ----
+PLDW             1111 0110 -001 ---- ---- ---- ---0 ----
-- 
2.17.1
