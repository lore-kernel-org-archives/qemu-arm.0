Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2642077ejc;
        Sat, 25 Feb 2023 01:28:17 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZinpNhVgMrm1UBXj6p/6aDcy8reJSlgNCN2NAxA3A7MO4zNM/UPP6eeGv7f1g+OjGXX2V
X-Received: by 2002:ad4:5aec:0:b0:56b:fe6a:df87 with SMTP id c12-20020ad45aec000000b0056bfe6adf87mr36626365qvh.52.1677317297278;
        Sat, 25 Feb 2023 01:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317297; cv=none;
        d=google.com; s=arc-20160816;
        b=Q0U2JxOBJV7hxS3e7WSZqE0flU/pSnDaKr8YN5UWJyAXqBPNZsk4/Al2ib01EIWmTj
         +MoqiQ3fQXdLeO+/IUgiSOuH89i2gE+BC+3pH/OnfSFgDAZJvoljmH8QbBxcrISrwP92
         2jVxVkPNcOCBsswZ5tEsZtwTIUXmuGhnCBWEMzioNZXLrgsW1sRjcKDpp/EJ6M9M3UQI
         uTAR9S0nrKXOJCZC5g8SLNSNm9TbMXCz+fvIiILO/rOhAFJt2fIuWPSg8/fOMa/ab7w4
         RmBqAEXk52S698kcIsfdb854ChVpqsFV64VD9X1rmy9sAFms9U7Td1kjLCRACyJugHzL
         LaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TUvgLx5xhTwjb7hREopkObqZZiBh0MpycGbgHAh1Sr8=;
        b=HYALiNe4Yj7AqV7eWXCw9zBwnBvxnxjIju59ihH6sVZ/zO3fTErMfL24NsueC+tdgE
         mR69gruzbG5y8x2MaWIp0LFzToBGqmMmJqw14GbEZEX0n6ZZwPH1xcYRi23+S2ztdtLh
         k7aRFP5SM+AS0/YfbXsEA2D/1It1zvqKIXUCHwzB1g3z5UkVu/uaMLOIYHEY9Z0EQZIr
         TuQB3yM55raWlpI/4p7jZwI+CL1PyqLZQWhjQXTIO8la14TEfTflaGpkP4ozv4coIQbL
         zKXWp6D3s083rJZ4acE/qo2uN9SzDpurKGZMLUP0dP0ltNq+zfITN86jyxDt7vzYfPVZ
         O8jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w9fmbjnT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020a0ce405000000b0056c21b703b9si1456227qvl.256.2023.02.25.01.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:28:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w9fmbjnT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqg0-00016K-NA; Sat, 25 Feb 2023 04:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqf5-0007J2-O1
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:16:13 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqf3-000295-Ty
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:16:11 -0500
Received: by mail-pj1-x1042.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so5186436pjb.3
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUvgLx5xhTwjb7hREopkObqZZiBh0MpycGbgHAh1Sr8=;
 b=w9fmbjnT02Pe+LWPAiKvbxEBzktOIvwjpwBI2PiHz1Cov9xUEX0YgVmqf3h/eIyY+S
 X8qUlr6/hPR9L4xRYOj1QywKqV10crwGNIzhHssYPazACO0DWqRSGd3DCf9cdPPqV2Jf
 5nl9Zh2bWrtV2AewDGeGPm6piYbz4De+3FoaDgY/OQ915Q9ByLLdAaC5zE1DBmyLSUFD
 8ywYDZHGSPbkoLRWANjVGV8tcHFPYhJ2AQwvKNlDd9nHx4SLkVe0eu4iH5qLd+1qcKNP
 Bzm5IovJUCvM+FSHa2zcB+rewMY1jgpceTG4kntSWUGG6pYS9tYD1yyHt/v+c5usEs+7
 1i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUvgLx5xhTwjb7hREopkObqZZiBh0MpycGbgHAh1Sr8=;
 b=uUxg6TY8tP8IG1K6p5Af1Rc2Fw9YieGQao24L3TtM4eDwcL0yBAcrw7FvYmsUPPhfi
 9iA3pdT0F1LNEuf+gweM/wwci19I5VPfxR6MJWExUrwGah4tbfeRTb8ax0+j17uwa6o1
 UqPDYv8ZktKHb7v05x/0GnRj5qtbAqxp4EsXUEMRZsXGFo5APSxMeh9k+PMCIwSLetxr
 D4pK6IzwL7DxPi1XNVYY+ROuOVomJ7jsW5Co+lX3WjqixyuqrjfH1cxTx1cg3+CKyRdP
 Vbr2/G2lMCHqzMYnJpr0KtM2+PkkdEojaIoX/pI6pkFomblviMYFwxAvD10mjHa/CQal
 FLDg==
X-Gm-Message-State: AO0yUKUEax5zGi3pHHkrisFo/4WiYO3VaNurnIDjhlKfE24EBBIYz6gj
 HsocjZuhnnD2JVMz5s16kE3fOQ==
X-Received: by 2002:a17:903:2291:b0:196:7906:b4e with SMTP id
 b17-20020a170903229100b0019679060b4emr24357335plh.19.1677316567803; 
 Sat, 25 Feb 2023 01:16:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:16:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 37/76] target/mips: Drop tcg_temp_free from
 micromips_translate.c.inc
Date: Fri, 24 Feb 2023 23:13:48 -1000
Message-Id: <20230225091427.1817156-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: v/JiyW72dag5

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

