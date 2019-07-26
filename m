Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207779wrv;
        Fri, 26 Jul 2019 10:51:44 -0700 (PDT)
X-Received: by 2002:a17:902:c509:: with SMTP id o9mr99123136plx.222.1564163504061;
        Fri, 26 Jul 2019 10:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163504; cv=none;
        d=google.com; s=arc-20160816;
        b=gjY7BLow/Y2QIY8O8JD1w4kIfaMTAD5Z0Ivf7aAWP+RKAVF1DrkEezKzNB2RxCYXuJ
         ZFcHo8R6n/SuiCzC+bBLf7wePetSvqdKbt5/HEjXf8SBpISmHz8fmO9G3SvvUz/XBRzO
         hDReBDI+A0hnDp81fxaHwETMHdA2OvzaSm+Ar19gIjPRPA5B0ggw1B6Nn4h2hJ7Is8Ob
         WjMy3VzLivBDYYYXy7Y2C+0oY7hyNFFe9G0sSZV/xXgneYZaNRVyQw6O8OkdqaizRTGA
         NscEgPOW+V4s5qJUahO0oI7yPf3dpWEDVo+NnFDJkmmZAf3U+cJzBXs4GGIbouz76hNA
         hzYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=C70Yg+46c/XVZyXVh4QRHDyUG/TqYDz7LEEkFesYi6Q=;
        b=DnryH4uWjRvV0JBW6uyasAUoNdAgCfFLrywImxbwpQnDdvF1YLktsCjBzvKDw/zC4m
         88881lob7IaGDhtUoSBSuYsGnl56wlfRghw5Rpsoms0UOFSr70tbajggz3NpcjElcg2p
         3NluNFhyCryFTJeS9yalhGxKfOfB0P86GO0u7aUvknt5Al9ZyX7zDE45/f2XQQPlwCPP
         SLa26xGdJ+1Mjy1YsCz+83Y/HUxKB5nPdP7TFZYDwlO4EP1E24cGi6K0Q6fE5tQUCuMd
         NoFx3xHigv99nYmRplV9vR6reCk6ksnt0N+r77se4JgCip0PDuLfBv5JDYDUPqP1xxO7
         8W/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NzxCzQPw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w8sor32865581pgr.42.2019.07.26.10.51.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NzxCzQPw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=C70Yg+46c/XVZyXVh4QRHDyUG/TqYDz7LEEkFesYi6Q=;
        b=NzxCzQPwDL2RHpSKettJLJJ3w8c0BDGTVv1D2coZzWHKoMplL/ZnUe4nh5V15XPe6O
         2wvHwYgFDvS5rWbFipEQDZqV3L/elqF1/YwK94JB3inJTWRaic+RNfKB6FtMaGYBh+LY
         7ddtzIuW02hHgXU+WObCHgWmrEqaFhWP1/vn+vZ6AoDhdBmcIpwu0YwksdtzqVcjd+ih
         IxICgFMB4AidU6+tIdQBC5GXSekfcHFMhtegGtvcdsnelu0WW6RYGHkGdWpLxRL11MgW
         J6xLpCfeMpwGfP/KNsXqU6iaA2poW4fHJR1JRQVrwIQ3DXvx32rxQj6xCrplH0avJlxB
         Acrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C70Yg+46c/XVZyXVh4QRHDyUG/TqYDz7LEEkFesYi6Q=;
        b=Qx3o3pmLmVVGH6E9eCK4VizKjl9GshcSiNYsgrei/HLQafXoAunFeLloQstj5jKwxj
         N8/FiaEAl7i/3OmWGvwAhbmRrQ4vDc0V7IDWvfR2Lc9yl4SNq1gnBMMvWRl0XJrVAml4
         5+qeq1NMDIDuaaFL7GqufiK8p/p5hxyH5iMcyPybaoe74RsFdqAr/MZRuR4Oo4mC/38A
         R9ppQrZ1GCLXFSRgjnv6o4hFjXZUh0U1bsaHDpgSTaXKYn1lEiSGna9aY5ZsTbutvczR
         1DYFgVxE+jv6jtMPx+xxeoqH5xH6aMdaGnL3E2wkW8Qvyk7pKHs+R7LZ9FVrS3hlYSrM
         /RNw==
X-Gm-Message-State: APjAAAXkjw1bbvm9KQe1SDEyfzoNh9QHAPXG+ni8NJEN8uYfljOMHbpC
	9EOm25pzMXNmIdnSYfUv+5MTjVe5
X-Google-Smtp-Source: APXvYqyF8ot09O5wbGNYiUf4yRBDWlRiRaMvIm9JFcBGgwFl0aZMR7EOT42ArkN8s+NqKuvGWqKv1g==
X-Received: by 2002:a63:ee08:: with SMTP id e8mr38601581pgi.70.1564163503573;
        Fri, 26 Jul 2019 10:51:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 58/67] target/arm: Convert T16, push and pop
Date: Fri, 26 Jul 2019 10:50:23 -0700
Message-Id: <20190726175032.6769-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: gtgY9PCa5ko4

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 83 ++++++------------------------------------
 target/arm/t16.decode  | 10 +++++
 2 files changed, 22 insertions(+), 71 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 55404414a2..5d0d0779c8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7593,6 +7593,16 @@ static int t16_setflags(DisasContext *s, int x)
     return s->condexec_mask == 0;
 }
 
+static int t16_push_list(DisasContext *s, int x)
+{
+    return (x & 0xff) | (x & 0x100) << (14 - 8);
+}
+
+static int t16_pop_list(DisasContext *s, int x)
+{
+    return (x & 0xff) | (x & 0x100) << (15 - 8);
+}
+
 /*
  * Include the generated decoders.
  * Note that the T32 decoder reuses some of the trans_* functions
@@ -10618,7 +10628,6 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
     uint32_t val, op, rm, rd, shift, cond;
     int32_t offset;
-    int i;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
     TCGv_i32 addr;
@@ -10691,76 +10700,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             goto illegal_op;
 
         case 4: case 5: case 0xc: case 0xd:
-            /*
-             * 0b1011_x10x_xxxx_xxxx
-             *  - push/pop
-             */
-            addr = load_reg(s, 13);
-            if (insn & (1 << 8))
-                offset = 4;
-            else
-                offset = 0;
-            for (i = 0; i < 8; i++) {
-                if (insn & (1 << i))
-                    offset += 4;
-            }
-            if ((insn & (1 << 11)) == 0) {
-                tcg_gen_addi_i32(addr, addr, -offset);
-            }
-
-            if (s->v8m_stackcheck) {
-                /*
-                 * Here 'addr' is the lower of "old SP" and "new SP";
-                 * if this is a pop that starts below the limit and ends
-                 * above it, it is UNKNOWN whether the limit check triggers;
-                 * we choose to trigger.
-                 */
-                gen_helper_v8m_stackcheck(cpu_env, addr);
-            }
-
-            for (i = 0; i < 8; i++) {
-                if (insn & (1 << i)) {
-                    if (insn & (1 << 11)) {
-                        /* pop */
-                        tmp = tcg_temp_new_i32();
-                        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                        store_reg(s, i, tmp);
-                    } else {
-                        /* push */
-                        tmp = load_reg(s, i);
-                        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-                        tcg_temp_free_i32(tmp);
-                    }
-                    /* advance to the next address.  */
-                    tcg_gen_addi_i32(addr, addr, 4);
-                }
-            }
-            tmp = NULL;
-            if (insn & (1 << 8)) {
-                if (insn & (1 << 11)) {
-                    /* pop pc */
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                    /* don't set the pc until the rest of the instruction
-                       has completed */
-                } else {
-                    /* push lr */
-                    tmp = load_reg(s, 14);
-                    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-                    tcg_temp_free_i32(tmp);
-                }
-                tcg_gen_addi_i32(addr, addr, 4);
-            }
-            if ((insn & (1 << 11)) == 0) {
-                tcg_gen_addi_i32(addr, addr, -offset);
-            }
-            /* write back the new stack pointer */
-            store_reg(s, 13, addr);
-            /* set the new PC value */
-            if ((insn & 0x0900) == 0x0900) {
-                store_reg_from_load(s, 15, tmp);
-            }
-            break;
+            /* push/pop, in decodetree */
+            goto illegal_op;
 
         case 1: case 3: case 9: case 11: /* czb */
             rm = insn & 7;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 90a4b71a45..10cdca1fbb 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -221,3 +221,13 @@ REVSH           1011 1010 11 ... ...            @rdm
   # rest of the space is a reserved hint, behaves as nop.
   NOP           1011 1111 ---- 0000
 }
+
+# Push and Pop
+
+%push_list      0:9 !function=t16_push_list
+%pop_list       0:9 !function=t16_pop_list
+
+STM             1011 010 ......... \
+                &ldst_block i=0 b=1 u=0 w=1 rn=13 list=%push_list
+LDM             1011 110 ......... \
+                &ldst_block i=1 b=0 u=0 w=1 rn=13 list=%pop_list
-- 
2.17.1
