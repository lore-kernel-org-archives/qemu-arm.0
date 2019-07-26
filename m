Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207596wrv;
        Fri, 26 Jul 2019 10:51:33 -0700 (PDT)
X-Received: by 2002:a65:4045:: with SMTP id h5mr95136055pgp.247.1564163493145;
        Fri, 26 Jul 2019 10:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163493; cv=none;
        d=google.com; s=arc-20160816;
        b=FdSFU6VfjqRpVgWwHDmyWMXQ4bMw7nIxR2KkNaYWhvv2iYTnjAAYDxMNFTeBaYnSp9
         nmrCd0ZMNVASsxPATeIWXOKY9C8NsN3AsvdUlz1gTi+4PGBwhndBntvkHThOBFbEWu4O
         nYkeo3n/lPR00Yg5uulKs+UVFsQEsPJBC+2Ct3LeNQ6n+D/RqXPzhvwK3uwsKuUB3Fsx
         Gq/MMqvcvkWW4mkFnxYCliETa2Yvm1MMHEs4SGGGH3hSqtDyVhHg02vW6fAwyZoYpTlB
         0WV0lurGXaANDsk8Fz+C3kVk7wPqXTz+7qoBPBcfNx+oPO5YHcbExx9yVojR/5BMSml4
         EcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=BTtAZNtC5LEslFth4SXf60p+WzB9yMjQ3jwBVq1HIi4=;
        b=z/LkgSc+g/u1UZWmsT4bY3G1b3c93/k11+OT0sGEzmRNnUC8GfR0jZtAaQDpEKMyT3
         gc5jqxhMRSk5v9pkcMjrscYPRzi3SYTHrIss2TF46R+WTY6lmu4wmx2ObBIsP24pIDuK
         w2V4+2FR8woKSrTttCrqakiUVVRBNdGBfaNHe7CTneI5M5CHZBQ880ndPbx/s3M2kWvY
         A0iSrBumJ9FWvMdJUMeV6OpEg6VAR3WOaQFSSjds/R0Ty9lD/z6AkI6AcEtPgjv3SvE+
         ecYzSHXpUfSLVxtiWsTIJEk4hRlD6J+gNFUks8NR+PGPI8V8IaqXEWAn4B+JofJ0bHIF
         GeJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9xCZVJS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r7sor65084518pli.56.2019.07.26.10.51.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9xCZVJS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BTtAZNtC5LEslFth4SXf60p+WzB9yMjQ3jwBVq1HIi4=;
        b=P9xCZVJSzzPbFwt0skLMTpo8XnRqYGuhw2eh9OeVGkUmwz70l2P48a8hNEpssL939P
         cD+1uSa2ZfLb+9AUrt85qbbGF3dQk06EazdGaBc0ekb9rnlyvujhFs157VEQceB7ijdT
         w8cuD4WpDWzftv3dtWezARrsm04RKbDv94SfS9dEVdgkLGnyuBlb2Xp5TKVLy4SEO0if
         a+igRl3ht4NxL1Wo2vopl7KFJaYW1cZEakz2h6t0QprPt/uqs802fXE1Qq8RD2kDPkw1
         cs35MLeu7axsUcn43OUGOSb8wvwiv2G8zjTpTt8oD1HF8pvClicJx8JJrrP4x3Rr9lhY
         AjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BTtAZNtC5LEslFth4SXf60p+WzB9yMjQ3jwBVq1HIi4=;
        b=ft4xX+ntRidU7epY6ZzUI2k9Cyw2U5FDzH3Wl/HQetXaZKvwMyEpRYaWiePZ3oHdnV
         ioW3sMDZMV6WaV6b/hNy3u0PuFZz0+SSnV3uvf4J3NvtRtQk+YGkjVbEtAtCycXe6n/T
         pVzntZeUP2CQ1Cwhscu8yTieruDbwYdrIKiBDFb43uZgb1UJY+dgF06bnCUMYuIPhVVz
         quPA8TopqW+aVFjARYwaAfHWM3tgRsNTkIOgEIoauz008rboML8HtMZLa/XRMP6Goh6M
         S0MpFd56FPupFUt9OZC4DF1BwNZJyPMeJm9T8TGpJ5sj4IUJ9iAgZxlBFYfRUffoD9/r
         oJNA==
X-Gm-Message-State: APjAAAVY/5omVr+zldDP+VZu0FYqyl13foOygi8xGgpRe6mc/ywrm6Hi
	L15nts5sgtmIuQlAZ2QBv5w3GI7X
X-Google-Smtp-Source: APXvYqxGKsWl+5/l25OfpcTTAgVJNE+QrokbXWOLMWIHBjhIfGI2O53Jfvx3OeIVgKAIDOr/bDTnmw==
X-Received: by 2002:a17:902:424:: with SMTP id 33mr17653195ple.151.1564163492748;
        Fri, 26 Jul 2019 10:51:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 48/67] target/arm: Convert T16 load/store multiple
Date: Fri, 26 Jul 2019 10:50:13 -0700
Message-Id: <20190726175032.6769-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: FsBV6opm5x8n

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 47 +++++++-----------------------------------
 target/arm/t16.decode  |  8 +++++++
 2 files changed, 16 insertions(+), 39 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 525276ed13..f551fde3db 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9988,6 +9988,13 @@ static bool trans_LDM(DisasContext *s, arg_ldst_block *a)
     return true;
 }
 
+static bool trans_LDM_t16(DisasContext *s, arg_ldst_block *a)
+{
+    /* Writeback is conditional on the base register not being loaded.  */
+    a->w = !(a->list & (1 << a->rn));
+    return trans_LDM(s, a);
+}
+
 /*
  * Branch, branch with link
  */
@@ -10759,6 +10766,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     case 8: /* load/store halfword immediate offset, in decodetree */
     case 9: /* load/store from stack, in decodetree */
     case 10: /* add PC/SP (immediate), in decodetree */
+    case 12: /* load/store multiple, in decodetree */
         goto illegal_op;
 
     case 11:
@@ -10984,45 +10992,6 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         }
         break;
 
-    case 12:
-    {
-        /* load/store multiple */
-        TCGv_i32 loaded_var = NULL;
-        rn = (insn >> 8) & 0x7;
-        addr = load_reg(s, rn);
-        for (i = 0; i < 8; i++) {
-            if (insn & (1 << i)) {
-                if (insn & (1 << 11)) {
-                    /* load */
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                    if (i == rn) {
-                        loaded_var = tmp;
-                    } else {
-                        store_reg(s, i, tmp);
-                    }
-                } else {
-                    /* store */
-                    tmp = load_reg(s, i);
-                    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-                    tcg_temp_free_i32(tmp);
-                }
-                /* advance to the next address */
-                tcg_gen_addi_i32(addr, addr, 4);
-            }
-        }
-        if ((insn & (1 << rn)) == 0) {
-            /* base reg not in list: base register writeback */
-            store_reg(s, rn, addr);
-        } else {
-            /* base reg in list: if load, complete it now */
-            if (insn & (1 << 11)) {
-                store_reg(s, rn, loaded_var);
-            }
-            tcg_temp_free_i32(addr);
-        }
-        break;
-    }
     case 13:
         /* conditional branch or swi */
         cond = (insn >> 8) & 0xf;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 568656ecd6..67476b30dc 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -26,6 +26,7 @@
 &ri              !extern rd imm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
+&ldst_block      !extern rn i b u w list
 
 # Set S if the instruction is outside of an IT block.
 %s               !function=t16_setflags
@@ -109,3 +110,10 @@ LDR_ri          10011 ... ........              @ldst_spec_i rn=13
 ADR             10100 rd:3 ........             imm=%imm8_0x4
 ADD_rri         10101 rd:3 ........ \
                 &s_rri_rot rn=13 s=0 rot=0 imm=%imm8_0x4  # SP
+
+# Load/store multiple
+
+@ldstm          ..... rn:3 list:8               &ldst_block i=1 b=0 u=0 w=1
+
+STM             11000 ... ........              @ldstm
+LDM_t16         11001 ... ........              @ldstm
-- 
2.17.1
