Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207235wrv;
        Fri, 26 Jul 2019 10:51:11 -0700 (PDT)
X-Received: by 2002:a63:f959:: with SMTP id q25mr92092621pgk.357.1564163471794;
        Fri, 26 Jul 2019 10:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163471; cv=none;
        d=google.com; s=arc-20160816;
        b=nBOo9lZ+QHSV6+x14olQzJV0HtLz2g7Iea3VGI3+6PS56f9k2h5DVlIihs024tuOf6
         p84o+4nbIqYj6fCr6JKQnW+hYbul8ywNUpukQMXmpuov2x+FpgmAPU/cVj77/aviI95T
         0o0ujATto30rgE4b81BlIL9Mtys8yEPkI2FB3VNa+qQnnL6mODtSrVStOwi0NeXFjT/1
         4743T3Ny+09Xjck3lnhpM+omGRVRXFyaxU/XUSrBT7gGKm4CEu2YFMB+nJ6EKlCFTqOn
         Uzvgebwb/F3CmzzD2SItY4jBMyH9j3eWxXhV+l+9iKy34ftL3xa9c3gaamtYnmmTE4ip
         tuew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=BMsZb1YBUEkHFwRh2YB1z1GO0sYcNt67hSkjhh9u9CQ=;
        b=Rde57SMaGOO/mpr6yZjm2FdXseooaxDPfi+TqLHIsVN5u4r2HdxrYJpP8HD1s4oEsP
         boed3yALlf/4JXc3izASc+DWCZy2Y0SZAujMWqjzXtQ10NCxU5jsTXUyXempVKMwYO4P
         G+1O0DkoybsTAo9nEoXAI/uaV7ikjT4gI1RLqeojSo3ZSOhtosIJPTgoN7yQF7+d4Mh7
         FQJ3X+LnmKO6LRDjwngCckKM/V1AlinP7i9HxpgM3Y8ScKELN3UYuluA5vswtk3wddwP
         FK8svJcLbFXXDy2E2eVhsf+0LZISpGuo7kOH2KX1no2GE9Ce9/koeJOzfNF5NxYQ5FC9
         3myQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mi5iMrWG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s126sor35197692pfs.37.2019.07.26.10.51.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mi5iMrWG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BMsZb1YBUEkHFwRh2YB1z1GO0sYcNt67hSkjhh9u9CQ=;
        b=mi5iMrWGCckm2qAJEelgKpFU5RQeFtlvjRdAG3uF/g8cPqEcYsYMp6Ewb2jnN9DITj
         dplcSyTTrSSmw8PjN76+0yBAlDaB36wTCEU8vkdWu3Gh5C0QLEHkbg0Y0ThX9GhW72Vc
         zvVnrhS17n6ZhckRCeolIIacRX56xk0gSJ2H7iaQYz94ET+CBR3heLseAD1tfhvgCzDe
         vgI1IOm6GLwuKwKN+Kuab0Vt27U+/VhFzsb9SOInNoLGbLePpbRVduT1rfBterlpqTPT
         /js+TS3eM/OBIf/CVTXOggaIdlBNV5C5QCvUscDp57FEw5wCKpsDD3HDvbcEA3w/zX6d
         zFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BMsZb1YBUEkHFwRh2YB1z1GO0sYcNt67hSkjhh9u9CQ=;
        b=WdB6KbEUysniIM7RSzC+ew/+OlgKBnF6EQmw5k97l/47CD4oFpUdxJ0XOc8OJV3LLO
         y0uSLxIoG37TF2Gm9gtH5t3Y46GuDBDnDgBg3WFqHoTaJEM3iu9p3mrHE1QnAa1X5PKo
         6gJV/hMFvOriqV++ct+X4EueawcYc1uslHbSCuYdhXil7+YCC/HuVWESlCC+g5LffB7C
         67yjI7W2EzkQ3PwjHpcYDHjNV9ZW/up9fnYbASsZ3QBKwUhZ1oFuguIxGN7sFArDcRYQ
         kT2LOWGs+E6smVxPUaWn15X5q9xzV3LpsnMpHNvg0qEhLcAe6RBo3XtwVTeKy7OYpZC/
         4tGw==
X-Gm-Message-State: APjAAAUMjNKr31SfkvUD3qn8KbtBa/QOcSqiRnO4t8MXbO3XE+Vo7hjx
	wjHfTsfJj7q0fJ56DRUfI4QdqlTE
X-Google-Smtp-Source: APXvYqy65xnvcqSnRRDilNXXoLqDebJO1FqFcmJG1/2CyDX/jK46jswr7yxookjamoqjHgueyRsAIw==
X-Received: by 2002:a62:2f06:: with SMTP id v6mr23655611pfv.195.1564163471371;
        Fri, 26 Jul 2019 10:51:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 31/67] target/arm: Convert SVC
Date: Fri, 26 Jul 2019 10:49:56 -0700
Message-Id: <20190726175032.6769-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: hvwEKHVfEatl

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 19 +++++++++++++------
 target/arm/a32.decode  |  4 ++++
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3f14e5c7f3..7ea118a795 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9979,6 +9979,18 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     return true;
 }
 
+/*
+ * Supervisor call
+ */
+
+static bool trans_SVC(DisasContext *s, arg_SVC *a)
+{
+    gen_set_pc_im(s, s->pc);
+    s->svc_imm = a->imm;
+    s->base.is_jmp = DISAS_SWI;
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10243,6 +10255,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         case 0x09:
         case 0xa:
         case 0xb:
+        case 0xf:
             /* All done in decodetree.  Reach here for illegal ops.  */
             goto illegal_op;
         case 0xc:
@@ -10258,12 +10271,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 goto illegal_op;
             }
             break;
-        case 0xf:
-            /* swi */
-            gen_set_pc_im(s, s->pc);
-            s->svc_imm = extract32(insn, 0, 24);
-            s->base.is_jmp = DISAS_SWI;
-            break;
         default:
         illegal_op:
             gen_illegal_op(s);
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index f0f0f50c4e..c2fb28f235 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -528,3 +528,7 @@ LDM              ---- 100 b:1 i:1 u:1 w:1 1 rn:4 list:16   &ldst_block
 
 B                .... 1010 ........................           @branch
 BL               .... 1011 ........................           @branch
+
+# Supervisor call
+
+SVC              ---- 1111 imm:24                             &i
-- 
2.17.1
