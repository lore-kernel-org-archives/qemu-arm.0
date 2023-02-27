Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4295145ejc;
        Sun, 26 Feb 2023 21:39:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9V38WMhMORTeVME9l8Vp84ofkwHBf74d26jsc6A3lv8Ex/KRZEjRUW1/miMKaBGC8hzRh1
X-Received: by 2002:a05:6214:248c:b0:56e:b1d2:9c2a with SMTP id gi12-20020a056214248c00b0056eb1d29c2amr48326019qvb.28.1677476371779;
        Sun, 26 Feb 2023 21:39:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476371; cv=none;
        d=google.com; s=arc-20160816;
        b=0+cienxJte6uy5OJ81NU9FdHfbVmOiTH4fqf4tjNqd8hOaYn4MO17gT1VG3s6xb3TF
         KmLL8GzgzFUbUz9XwhoGEvsxWHNQa7OCEAsc0TMYxc0KHyGi9f4+Ms4++sthLe6F7TKI
         Cd3dieJzsJj/tWJhD0PYEk00/tsDhznDf8ygChGYaDVyRaqatsFmP+o/dSe/pkdYYmij
         5XAznR76tx13N/+uk1pFKheg4DGGOKBboe4LmJ6cuzr/uA8q0UPdk2NeMoRjK0z25kx1
         B5fo/X+bZjWso7Gy5mujRJY5IKSjmKFhhoarapyVTNFjr3/UbqOJVeCf4CAKzaYYGQuk
         pt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u3LWtGSaR9SZMaOcttY5mYoHUtJxLxRAkcHm/oHuhko=;
        b=jjYBJBFYOsPsJ7Fs/1QLTREvWenmwEv47GesgYUBt0zUUjgmzKXlqnvomkxE4EsMzz
         MtqN9i4UyCLStr0SwBhZfBITfWFSSvTeaBOiPEt1B+Fao6vKVaHl6PNw37UpX+yyNfvG
         NOt34a5ALXyyzd/XSlHWZRvJr0y7MxOGmKR97PW70ojP6ScoMl+KMbOGM87TTbf+zaQa
         1ab5EDcthlmP86WOuzngPDQHLzrCd01IgwY3OOMPG2gxLBQMsKE8ehRcpkoTBmSzR2mT
         y5zQUf6ANAS0UghpNkI3Bn/EXMjsLZ4fXohrtNkxvq/9k1f1FiJgNENiydqyDhScICrl
         Kc7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I2oquTAT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15-20020a0ca9cf000000b0056ec337f2e6si5724068qvb.420.2023.02.26.21.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:39:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I2oquTAT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWDU-0003rg-Rv; Mon, 27 Feb 2023 00:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCa-0002v3-Uc
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:37:33 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCX-0002bx-Ue
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:37:32 -0500
Received: by mail-pf1-x42b.google.com with SMTP id n2so2767856pfo.12
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3LWtGSaR9SZMaOcttY5mYoHUtJxLxRAkcHm/oHuhko=;
 b=I2oquTATx9zNLVxKWLnTpU/CA/ActTQvCn/9y0kz1bK9PAsnQAo9fLykHPdmbqWqHm
 992iv+Ti/eFB9SE7xyNDtKBHAiJVc/wyAWBg0e4wtKk5Y/G2EP9yEFA22phMLlxd9QpL
 0olz2bUUUhiEYfzfngoq73OakZUTagaNRxEN7MJFoNbkX37MQPfaHmQp3+I3HU09sgGQ
 gkvPV1jLnJytEzgDR5x5HaJYA6R8tGsk572MfcUf8UUOycgatarT4f0WjeYkJACpCd6N
 qypNj944VLDbXBQj4HKf/PAAr6wNUO+55pUAKbRodczmHPOKHXaEfWIQ7RPgwiZr+LcJ
 aXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3LWtGSaR9SZMaOcttY5mYoHUtJxLxRAkcHm/oHuhko=;
 b=Thw2YqL/K457sN5MW+tA9m5SDWzZUtLsr+iZzCU9fQGnji9nDac/Haez95nNHMKXsW
 HhRkhCD5jS+gSfjl1z10LJHgAJEi6kEUUqadHKlvF2lbjOsrceAaL5Z2GIBDXbiIQwLv
 fNhRJzR1x8RH8ZlP+ACkQDdCJ/uBpahzV41f4y/6c39TlovLIMEDDntFD0ihn926A4AL
 ukC+4j70XS6se+HijyeQBvjQHCT/MR5qUPLIS70zYjEmWvXJCC1JPnzf1iTonq46MSyd
 e0P8bOqam+5KmPPSagmUcO1u0vnNGhsKKCEdvSpJuX/cbnq+TYom3RtoOOjmnWGQB6Yp
 tWTw==
X-Gm-Message-State: AO0yUKW13R+wV25kqFmg2FjMIGQsyAgal6ZDM65Qkb33RLogH7TFpgBb
 yi4Htb1d1jq483W96vBTTCkmPw==
X-Received: by 2002:aa7:96dd:0:b0:5d5:9350:ae05 with SMTP id
 h29-20020aa796dd000000b005d59350ae05mr15996156pfq.32.1677476248372; 
 Sun, 26 Feb 2023 21:37:28 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 08/31] tcg: Remove TEMP_NORMAL
Date: Sun, 26 Feb 2023 19:36:38 -1000
Message-Id: <20230227053701.368744-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zjzhNKxZ+ZEa

TEMP_NORMAL is a subset of TEMP_EBB.  Promote single basic
block temps to single extended basic block.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  2 --
 tcg/tcg.c         | 19 +++----------------
 2 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 2010e746ca..02d5cfc049 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -431,8 +431,6 @@ typedef enum TCGTempVal {
 } TCGTempVal;
 
 typedef enum TCGTempKind {
-    /* Temp is dead at the end of all basic blocks. */
-    TEMP_NORMAL,
     /*
      * Temp is dead at the end of the extended basic block (EBB),
      * the single-entry multiple-exit region that falls through
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6646770268..7ffd4a4f28 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1258,7 +1258,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
 TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
 {
     TCGContext *s = tcg_ctx;
-    TCGTempKind kind = temp_local ? TEMP_TB : TEMP_NORMAL;
+    TCGTempKind kind = temp_local ? TEMP_TB : TEMP_EBB;
     TCGTemp *ts;
     int idx, k;
 
@@ -1368,7 +1368,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
          * silently ignore free.
          */
         return;
-    case TEMP_NORMAL:
+    case TEMP_EBB:
     case TEMP_TB:
         break;
     default:
@@ -1384,7 +1384,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
 #endif
 
     idx = temp_idx(ts);
-    k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
+    k = ts->base_type + (ts->kind == TEMP_EBB ? 0 : TCG_TYPE_COUNT);
     set_bit(idx, s->free_temps[k].l);
 }
 
@@ -1911,7 +1911,6 @@ static void tcg_reg_alloc_start(TCGContext *s)
             break;
         case TEMP_GLOBAL:
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
             val = TEMP_VAL_DEAD;
             /* fall through */
@@ -1941,9 +1940,6 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
         snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
         break;
     case TEMP_EBB:
-        snprintf(buf, buf_size, "ebb%d", idx - s->nb_globals);
-        break;
-    case TEMP_NORMAL:
         snprintf(buf, buf_size, "tmp%d", idx - s->nb_globals);
         break;
     case TEMP_CONST:
@@ -2763,7 +2759,6 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
         case TEMP_TB:
             state = TS_DEAD | TS_MEM;
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
         case TEMP_CONST:
             state = TS_DEAD;
@@ -2812,9 +2807,6 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
                 continue;
             }
             break;
-        case TEMP_NORMAL:
-            s->temps[i].state = TS_DEAD;
-            break;
         case TEMP_EBB:
         case TEMP_CONST:
             continue;
@@ -3572,7 +3564,6 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
     case TEMP_TB:
         new_type = TEMP_VAL_MEM;
         break;
-    case TEMP_NORMAL:
     case TEMP_EBB:
         new_type = free_or_dead < 0 ? TEMP_VAL_MEM : TEMP_VAL_DEAD;
         break;
@@ -3860,7 +3851,6 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
         case TEMP_TB:
             temp_save(s, ts, allocated_regs);
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
             /* The liveness analysis already ensures that temps are dead.
                Keep an tcg_debug_assert for safety. */
@@ -3897,9 +3887,6 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
         case TEMP_TB:
             tcg_debug_assert(ts->val_type != TEMP_VAL_REG || ts->mem_coherent);
             break;
-        case TEMP_NORMAL:
-            tcg_debug_assert(ts->val_type == TEMP_VAL_DEAD);
-            break;
         case TEMP_EBB:
         case TEMP_CONST:
             break;
-- 
2.34.1

