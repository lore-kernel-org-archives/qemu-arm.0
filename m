Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1330662ejc;
        Sat, 7 Jan 2023 18:55:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsTtsboUxKDzxXW4RNkbLyCotPpDFlGWA6w2ZgroIWrihbkPwgntIWuDPIcPKkTXhdIumu5
X-Received: by 2002:a05:6214:5143:b0:531:c0a0:bb00 with SMTP id kh3-20020a056214514300b00531c0a0bb00mr38610706qvb.41.1673146528720;
        Sat, 07 Jan 2023 18:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673146528; cv=none;
        d=google.com; s=arc-20160816;
        b=i6umVt+PstNS0pZSVkWFZbm7o3bTzWaIuiTBATnCJCgoMSkDrWRcongdBMBQhmX0tv
         SFPVZ0y7JcNxd0zZJN26jKCBdu6ak6+HiQclFzd2pkpksTwWHf2hPbe91gjq3fPGG1Du
         8TKxI6uDPMHFJygTbpFCbhgfAAK17oA1jfSstf0bAITNMDa/QuR8rFhNmwUF+wDOcV5N
         RYbXHVjL2tjKz3Qy6RmSMWdk/Bs/bWlAalvF2vQuG0PXnZ0/tlsnU7B7a9R+nJzIeluZ
         Sa1P/q0/6G9FdReFiSsjBuLwzJI8IUR29wzg3z+g8xMhpTIZ+1jZcMOnLqYt6i5zc0Ai
         O9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=U/HSkpGEvHbItuZnMKBTZy7j63PzLUxQ950pxrJaTtQ=;
        b=FcSi+TDvCGN/XmuO7V7hu3K4cieTdVqDlELFrOk/UVFqkD5pNuLdXghLuPRyPDb2VE
         nIbUUf6hP3/c6WYhCSoQ1eI9DOvjmA8bosvZfq0N7s1xIL26G3srVZFZtnEoXHz6D1tg
         abZOyUIlbqkROXA/xc/DjjYza3fnRNE5TuNvd41IQutKxmThzOWsgOurvuKgI9Qj064F
         Qmkz/Je1Zy53+An/CebNqtRBx8eLojGLsQrYAMTr8rM8O8KPixKoZ8yRrnSSCM/I/00d
         jxyI0WCYLh9yPVTUern4rusdxUcRNdw7p+pzC/RrNtRQuYnAOG5f8LGl3Qzn7KvLIToO
         nclw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cabsn7Pe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05620a400900b006feb00198a2si2871325qko.97.2023.01.07.18.55.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:55:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cabsn7Pe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELaE-0006Gp-Og; Sat, 07 Jan 2023 21:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELaB-00067K-EV
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:47 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZJ-0004kS-5m
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:47 -0500
Received: by mail-pl1-x62c.google.com with SMTP id jn22so5842593plb.13
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/HSkpGEvHbItuZnMKBTZy7j63PzLUxQ950pxrJaTtQ=;
 b=Cabsn7PefcqmPGGmkreUHmuZqTbdJT501NMjsX90Okc5g3KqmMzGE95eDzNKFphZ49
 EtqsmzjmXCkbiQPPWfvHOcHAkNmm5pQrnNVoCUiSh5XPONfR3jwSJCaeZYWS7jfknop0
 2m0h8l2goW7YQyMwq6I2tFHoXe1EmV2CJ2D3r1YVYaryu7ppXZl9ZpbT4P2i5/syC9/o
 RJm92msy/NrziUaHc0FoIfKl3CESE9VTgKpo5ZhAYySfyrBmF0R7XpYLlwO6kmdRDECm
 MpYqkG92xxDyjALHr0sTaDqlM5RmUocQeQ2rQjv4xzYXo2O5BBf7npN8+3XsBfcgG5mS
 3rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/HSkpGEvHbItuZnMKBTZy7j63PzLUxQ950pxrJaTtQ=;
 b=mEEpgsBtVMUorrb7rixMiGbO5odJYZpwxxEJa1vYy6OlaWKY4NylyQVqSUUxJ4GOIM
 wEvwGuF28wGs448UV12nmkpelDh7UI5A2DgBNkAcL4x6+gafka5X4DzjuTanRNVnPSVl
 5BI7RjBTCJuXioUmn5hH7onUrdymWRcA3dGXQ7viS1f3NqKM5e86DVBp8fLTZkUYAZ+I
 x9hD7igSEpOQlzuSKZzBxb3tH3lhXArF3lIn+YluOSZpvPG/fvshTOuU9OAAgwKgUrhT
 BqDEglmR2S8jP7yqqXMGAGaaP8CTxKFhy2uagVvUX11JxLHlfqu7puSpggP5snUwOY9m
 VWeQ==
X-Gm-Message-State: AFqh2kr/TLoz3vOliAOrN10SVZe6zfBbkiQwuD4hGI0Fw4x+FC/Yb9cY
 hr4bA0w/IdMNumGww6vMCv3ho9Ka/JUM/bX7
X-Received: by 2002:a17:903:110d:b0:192:8b0e:98e1 with SMTP id
 n13-20020a170903110d00b001928b0e98e1mr53826505plh.54.1673145471955; 
 Sat, 07 Jan 2023 18:37:51 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 28/36] target/s390x: Use Int128 for return from TRE
Date: Sat,  7 Jan 2023 18:37:11 -0800
Message-Id: <20230108023719.2466341-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: xLrkUEG7v/q7

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h         | 2 +-
 target/s390x/tcg/mem_helper.c | 7 +++----
 target/s390x/tcg/translate.c  | 7 +++++--
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 03b29efa3e..b4170a4256 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -99,7 +99,7 @@ DEF_HELPER_FLAGS_4(unpka, TCG_CALL_NO_WG, i32, env, i64, i32, i64)
 DEF_HELPER_FLAGS_4(unpku, TCG_CALL_NO_WG, i32, env, i64, i32, i64)
 DEF_HELPER_FLAGS_3(tp, TCG_CALL_NO_WG, i32, env, i64, i32)
 DEF_HELPER_FLAGS_4(tr, TCG_CALL_NO_WG, void, env, i32, i64, i64)
-DEF_HELPER_4(tre, i64, env, i64, i64, i64)
+DEF_HELPER_4(tre, i128, env, i64, i64, i64)
 DEF_HELPER_4(trt, i32, env, i32, i64, i64)
 DEF_HELPER_4(trtr, i32, env, i32, i64, i64)
 DEF_HELPER_5(trXX, i32, env, i32, i32, i32, i32)
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index b0b403e23a..49969abda7 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1632,8 +1632,8 @@ void HELPER(tr)(CPUS390XState *env, uint32_t len, uint64_t array,
     do_helper_tr(env, len, array, trans, GETPC());
 }
 
-uint64_t HELPER(tre)(CPUS390XState *env, uint64_t array,
-                     uint64_t len, uint64_t trans)
+Int128 HELPER(tre)(CPUS390XState *env, uint64_t array,
+                   uint64_t len, uint64_t trans)
 {
     uintptr_t ra = GETPC();
     uint8_t end = env->regs[0] & 0xff;
@@ -1668,8 +1668,7 @@ uint64_t HELPER(tre)(CPUS390XState *env, uint64_t array,
     }
 
     env->cc_op = cc;
-    env->retxl = len - i;
-    return array + i;
+    return int128_make128(len - i, array + i);
 }
 
 static inline uint32_t do_helper_trt(CPUS390XState *env, int len,
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1a7aa9e4ae..f3e4b70ed9 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4905,8 +4905,11 @@ static DisasJumpType op_tr(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_tre(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tre(o->out, cpu_env, o->out, o->out2, o->in2);
-    return_low128(o->out2);
+    TCGv_i128 pair = tcg_temp_new_i128();
+
+    gen_helper_tre(pair, cpu_env, o->out, o->out2, o->in2);
+    tcg_gen_extr_i128_i64(o->out2, o->out, pair);
+    tcg_temp_free_i128(pair);
     set_cc_static(s);
     return DISAS_NEXT;
 }
-- 
2.34.1

