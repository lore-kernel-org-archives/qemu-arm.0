Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4289541ejc;
        Sun, 26 Feb 2023 21:29:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9hXhI8waeosKmvpjSvuY3JTZyXjst+Xn2cNzU/8bx7Mv9D+ofG5e3JkpUV5A3qoDCeRLO9
X-Received: by 2002:a05:6214:260e:b0:56e:b1d2:9c33 with SMTP id gu14-20020a056214260e00b0056eb1d29c33mr42271941qvb.20.1677475775567;
        Sun, 26 Feb 2023 21:29:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475775; cv=none;
        d=google.com; s=arc-20160816;
        b=KeJmW0rpd01NtzgIKfhvEqL1oOPwvcVPlnh9EWEfMtbI5FDoJw21YHnYK6qOI+Pdtt
         J9XGh2gUl+PmcSLmKYGqUxpEA7KUUgeqmR3UQyiw4jfRCMIn1t0I0Ia6Rjxgm9l17qCG
         WD8slngQBpUYsecoKxMweI7E/gLd1Nld6ZZIJQk23jx9UwI+UrTgRj6olL37PZhYv/va
         kF6ttKkDTJKIDWyBYEmE2YR71Rq0Vplkd8sU34vZHVx03tA14e5P2u64+1Jym3SWr0ZA
         zDyeX+XpgzJS+LOzcyGPjsrKcak+5h8uLLwWqJdstXV1t5Rbmp+FCSjicCMTGUFzL63j
         o9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TUvgLx5xhTwjb7hREopkObqZZiBh0MpycGbgHAh1Sr8=;
        b=kJtaK2RwWLY7lGuwzKq99rPLjk3JlejkqeORRphSJiqCDoutm3XnxsVZfa58nFvWBZ
         A4SIHmD+8bEEXN3gvZwyHb2ra0nOO3LuGXhSSZAbG12qb6ZeLo4dnjbjtQe4PLEgjEvy
         3//ztgZjGHeTlWkpWLoW+UxmvtGolzIuNprbRoTB6AxrNLfdwesUi1zS8otqss1FHYfY
         TvSvGKavYzCONnxMS8iWh+Tx99KfJM1F1HGhODnPHvKANZasrGVkFMWORtoveYkSILIi
         tSQLWgktBirSa0+vXWX5UmhIdamvDKDNic9MYGS8xuZN4dhwtxjK9NMxUFY5hFijAMfL
         g0xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ufm0rY5t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a0ca911000000b0056e8b4c49e9si5443677qva.502.2023.02.26.21.29.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:29:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ufm0rY5t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW2b-0001rC-2M; Mon, 27 Feb 2023 00:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2Q-0000ZL-CK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:27:02 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2G-0007yw-Na
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:26:55 -0500
Received: by mail-pl1-x641.google.com with SMTP id n6so4146621plf.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUvgLx5xhTwjb7hREopkObqZZiBh0MpycGbgHAh1Sr8=;
 b=ufm0rY5t9OPCPFAHVMiiEBR7CFHrxv13TfsrWHaYNIuzAcSfRUPX6OkiCl7v0S/TRi
 4G6nczxCXULKrmBgauoMIuEOBNvYqmyobV2OA+57CPW/d24+1MtqISgCxnj3Sc0Gxm6g
 C7VFrN2BdYKxnMUhO2nIV0xcQSHTezC4/O5MtWIxubX7J4vDeKpEEP8gaSiIL2CMQr2L
 XmyDl8Hupa3CxL6aCzTcl4XmDeBRf/UoXHQmozE59hQxNcY7KYzJA+7WRzeXjIkisb1O
 vuscqx0Z2Zhm1TgTOTBhCIQOzE3FGNIRjuZUroU20K8Jnt03mKU4ekGjIXc7g4toxdjZ
 aNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUvgLx5xhTwjb7hREopkObqZZiBh0MpycGbgHAh1Sr8=;
 b=e3DapuVoqoyF6KwtDRZGNAg8rNLnFbyOdLpA5w8zbzUcB/KFZCssAwx+3aHnhqtKL5
 7ZKahD50r7Jvc3hupEf3X+B5p9LBpjLijdFf9GUIKVGjdo+CpbGGiSeKUAaoE3xJzlKM
 9wjQ/48V742AZC574bv16/9KrxRFlBqCwI8J6v+uFnFhRIC2f+4guiDAnwPbZeh/ihG+
 sWLFK3dTYVltj+RLmEcLcZ/wKp31A8UggjDzPmwMEF29TK+AvYwApofbkl87pFt9gnNO
 fTuQbrX1iLHUArcmF9Q4aj6PSVlqh/VJbNFLQeakRZ4SuAHhMlAXaM53WZt55uPlc3CO
 mA6Q==
X-Gm-Message-State: AO0yUKVD9axmdplud48g7mQu6rut7Fb9w5m8w9EzECp550anEASiK80o
 G+2GekvkJ6x/GOktzijKtmamYUTHut7gdZk9z1Youg==
X-Received: by 2002:a17:903:42cd:b0:19c:d452:b282 with SMTP id
 jy13-20020a17090342cd00b0019cd452b282mr9042209plb.12.1677475611555; 
 Sun, 26 Feb 2023 21:26:51 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 37/76] target/mips: Drop tcg_temp_free from
 micromips_translate.c.inc
Date: Sun, 26 Feb 2023 19:24:26 -1000
Message-Id: <20230227052505.352889-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-TUID: 9AAS3efdQpgH

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/micromips_translate.c.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index 632895cc9e..23f80d4315 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -724,9 +724,6 @@ static void gen_ldst_multiple(DisasContext *ctx, uint32_t opc, int reglist,
         break;
 #endif
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free_i32(t2);
 }
 
 
@@ -1018,8 +1015,6 @@ static void gen_ldst_pair(DisasContext *ctx, uint32_t opc, int rd,
         break;
 #endif
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
@@ -1067,7 +1062,6 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
 
             gen_load_gpr(t0, rt);
             gen_mtc0(ctx, t0, rs, (ctx->opcode >> 11) & 0x7);
-            tcg_temp_free(t0);
         }
         break;
 #endif
@@ -1276,7 +1270,6 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
                  * mode.
                  */
                 ctx->base.is_jmp = DISAS_STOP;
-                tcg_temp_free(t0);
             }
             break;
         case EI:
@@ -1293,7 +1286,6 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
                  */
                 gen_save_pc(ctx->base.pc_next + 4);
                 ctx->base.is_jmp = DISAS_EXIT;
-                tcg_temp_free(t0);
             }
             break;
         default:
-- 
2.34.1

