Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1325847ejc;
        Sat, 7 Jan 2023 18:39:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsV4gzj8pBIStssoxvtFiloLXBrA8s1UxmBJqh/vBXLVG2yDimcEnyI8FPS6UI2i7DP3L2X
X-Received: by 2002:ad4:4dc6:0:b0:4c7:7f63:5fc2 with SMTP id cw6-20020ad44dc6000000b004c77f635fc2mr87497508qvb.41.1673145563933;
        Sat, 07 Jan 2023 18:39:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673145563; cv=none;
        d=google.com; s=arc-20160816;
        b=kZH2y+yzS/q1ljmMh9qD12eau2s+GmCT/TJC0glD73EHXInn9hmscT748JKKvOcwkZ
         9f7+g9WhjsNI/aFI+sn234EBt1coekvdmb3NIOX5ZxI1H31l6M8h8C1b9Kj+b3YMgCvg
         8vWU5WSvqghbUCEsztW5sXNpLZyAMJSmIS291gGmpp+ve3BUGJCftv8aTZMEyLdbChVp
         dK11Q8nrvlCp0KFpV1hwOLM8abu9//xqXxJfEDTm1EaHLfwSEnUmgPHy1rdGjRrLk+Xv
         ijC4ith3XMx+h5jBwbC0kYgqWNj5LhrQFZXSdNhi4QxNXg3Gb8/DHIv8t6h0k98cw3Hu
         tS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SzDpq4p4TZ0OiGc3bd/AjIVDg1qF6XupmGP3awuLITw=;
        b=L9weQbWvN6OqXDsEinUS41lSz81jkHBmK/7c6ITy/hSRbjhZRITdF21czG0Y44hJZx
         k9ku0+d8SLO0o4AbI/ZMYQ683NHU83ZFZ+OKcXz+VnwXwcdvCKeosw1M8b2UTC9ACs7D
         MJyEFKdMvV+k0G6sLlhn6l3pnixAqJ3qSSSTeNvG+rgBfu3CGrVwCEl764SbeG/3ejeu
         VGQBQ46jhmRi69Vr1Ml8uqrszo5Z2XFDgNrx9k4vAWOODeRFvA9Ry82Yp1ToWBLXaj8v
         Z0AAmG/IxeTfJP7U7RhfcTJNEYXZgooXAyr6oDKv5cHk3RD8Ifd+ADhh80l05ZP0dDq8
         iKuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XOErZP0u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05620a0bcd00b006fb16e595b6si2992011qki.665.2023.01.07.18.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:39:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XOErZP0u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELaA-00063j-I4; Sat, 07 Jan 2023 21:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELa6-0005qY-Up
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:42 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZH-0004YR-F9
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:41 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 b9-20020a17090a7ac900b00226ef160dcaso4079944pjl.2
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzDpq4p4TZ0OiGc3bd/AjIVDg1qF6XupmGP3awuLITw=;
 b=XOErZP0uyB76ZPYUCJeaFgU8ddkWddUTq1jXF4aC6Xsq3md/pb6qGu7cpMgfM3O/Bt
 BnrMpJ3nQ4JbWfIunKtiQ21Agi5reiprnWmOQ6uIVtmn7ZXVKLf9YRvRbqRUWwhnjXWn
 63GtHhGcZb1EsASn+IXYkj7OLAHjbgnMRmQl5C0uv4v75tWWcgd++qNm4vT+eBiBZaJl
 1C9tyaRk/i4/sr+T0dVjjlSAkogLJe8nGlKbuviO//QGxqv6K3u/SzmlM3v/0Dpw9mdN
 4iYXtMSLDKAcZyxSbvC4lCoXgg/lPuUdQcbHPjnfdHz8MRVXEobCQglYW9V9h1Spp7DL
 z6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzDpq4p4TZ0OiGc3bd/AjIVDg1qF6XupmGP3awuLITw=;
 b=Us40JGYrx2z1vf2IYCfO0R/Z2eFJhJzsKdzW2ZCgylEled+y4uHs2165dhWO71rJgg
 2odYUsqYhoFqhTrnEpc2cNnKhTmQy5yLmyUiwymx/iw5erXVfLV314nzWGJno5yVm5oy
 I1153HVPll9GJIkkvWvoA7VdWEB3Ke/5Zx5paFGXqkz/7A8/steWUMkezhyP1eOJ83Ff
 ejXM/WssVywHC5v5aRkGNVj6uroYG9wJbU2905kDtLv6OszjJqOJtYT/3yQmN+4wdaoT
 wV81NkihJ/ygEagQVkKHNBtuudGX4V8bV929fWEkvi9JAwV/jG+glbgExbxkGMROg+pf
 MenQ==
X-Gm-Message-State: AFqh2krfux+A+2ORCUKhsjHjBCmZ6edgphY9RZsBz5G+5M3t7UO1kq9/
 +YguXPOMWkon4cVZvpLzbJ5vzpztu+6DtuWa
X-Received: by 2002:a05:6a20:a584:b0:ad:a5fd:b664 with SMTP id
 bc4-20020a056a20a58400b000ada5fdb664mr68552759pzb.37.1673145469580; 
 Sat, 07 Jan 2023 18:37:49 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 26/36] target/s390x: Use Int128 for return from CLST
Date: Sat,  7 Jan 2023 18:37:09 -0800
Message-Id: <20230108023719.2466341-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HR9IEOR8ENb0

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h         |  2 +-
 target/s390x/tcg/mem_helper.c | 11 ++++-------
 target/s390x/tcg/translate.c  |  8 ++++++--
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 593f3c8bee..25c2dd0b3c 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -16,7 +16,7 @@ DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, i128, env, s64, s64)
 DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i128, env, i64, i64, i64)
 DEF_HELPER_3(srst, void, env, i32, i32)
 DEF_HELPER_3(srstu, void, env, i32, i32)
-DEF_HELPER_4(clst, i64, env, i64, i64, i64)
+DEF_HELPER_4(clst, i128, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mvn, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvo, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvpg, TCG_CALL_NO_WG, i32, env, i64, i32, i32)
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index cb82cd1c1d..9be42851d8 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -886,7 +886,7 @@ void HELPER(srstu)(CPUS390XState *env, uint32_t r1, uint32_t r2)
 }
 
 /* unsigned string compare (c is string terminator) */
-uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
+Int128 HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
 {
     uintptr_t ra = GETPC();
     uint32_t len;
@@ -904,23 +904,20 @@ uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
             if (v1 == c) {
                 /* Equal.  CC=0, and don't advance the registers.  */
                 env->cc_op = 0;
-                env->retxl = s2;
-                return s1;
+                return int128_make128(s2, s1);
             }
         } else {
             /* Unequal.  CC={1,2}, and advance the registers.  Note that
                the terminator need not be zero, but the string that contains
                the terminator is by definition "low".  */
             env->cc_op = (v1 == c ? 1 : v2 == c ? 2 : v1 < v2 ? 1 : 2);
-            env->retxl = s2 + len;
-            return s1 + len;
+            return int128_make128(s2 + len, s1 + len);
         }
     }
 
     /* CPU-determined bytes equal; advance the registers.  */
     env->cc_op = 3;
-    env->retxl = s2 + len;
-    return s1 + len;
+    return int128_make128(s2 + len, s1 + len);
 }
 
 /* move page */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 6953b81de7..8397fe2bd8 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2164,9 +2164,13 @@ static DisasJumpType op_clm(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_clst(DisasContext *s, DisasOps *o)
 {
-    gen_helper_clst(o->in1, cpu_env, regs[0], o->in1, o->in2);
+    TCGv_i128 pair = tcg_temp_new_i128();
+
+    gen_helper_clst(pair, cpu_env, regs[0], o->in1, o->in2);
+    tcg_gen_extr_i128_i64(o->in2, o->in1, pair);
+    tcg_temp_free_i128(pair);
+
     set_cc_static(s);
-    return_low128(o->in2);
     return DISAS_NEXT;
 }
 
-- 
2.34.1

