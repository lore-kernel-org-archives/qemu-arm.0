Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2641037ejc;
        Sat, 25 Feb 2023 01:26:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/8zbTJT0r31BsopPj5yLNbkxsfoTli6GbP+AZlCIw3/ONNRUrDVAeMFSCbfZFOXtgoq3rT
X-Received: by 2002:a05:6214:21a3:b0:56e:b966:4089 with SMTP id t3-20020a05621421a300b0056eb9664089mr33196090qvc.23.1677317190738;
        Sat, 25 Feb 2023 01:26:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317190; cv=none;
        d=google.com; s=arc-20160816;
        b=F9xrmZmmJviKBQvF3H20g57DmqQ4hRYB9qDF2aoT34XdQk8vGyJN2kXo+xwUwcUC0V
         Wxu8Bs+i0FsT0AWGPy9mVohqnZRHaxcW9gu8cK9giF2cYIcWFnzkpuiN3ZDxcjjkX+28
         hO19mxMV7sQb2QfVYlGuMpq5YVaCnDWTK6U7kCyhjMtYNAVlUtSsT5DdVQnAxEP1dN6x
         cUVrSEXnSYFBxufIPZqJTt52NvA1DrTHBCPE//c+Uvcn/FpDgdW+rsj1M5phrlLhsID2
         Giv8tKX1bcaJH1js1Irxxp7hdhGkBv09Ls0LPTWtFFzF+1L9tbwDAhYvtf/KYGuvyjtW
         Xh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x5RhcaUXSQ5MfMxq0C6EBN7haRQoUvmPfbIAZ3PLMW4=;
        b=VZjJ9gWO+bahrCNQSltdwEyIUezLFWJFcxAdodjIKnPOE1o0NYwrLA7SMUJZ/B0enY
         nHQuKfrRP2SAYW87LZWSNm6Ib6pelQYJXSUdnoPWEfJQlfErI4i/b+C2wGbPI4sp2fMS
         CRK2N5Z92AIA2DbeoxGOAJlHD7WRq1U3WzZLZTZgCCyjKRSJXFqiBPjfel5sz3fBxGd3
         KRiRFLy2WR5JWpH8rtyzL/9/FwIhQhOM5RvcFdULyaKkDi6CjpGDAR0cSCwYhmqOYqrJ
         Dx3ctlC4npiQ/Yddat8ZK7XKfbyQMYacYtDGAtUX3gcSsT2rGnt6tdYw69UfH6w0yuTv
         2mDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VUJ7RFfR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12-20020a0cb3cc000000b005727252afb3si1609177qvf.282.2023.02.25.01.26.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:26:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VUJ7RFfR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqjz-0000k9-17; Sat, 25 Feb 2023 04:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjN-0006Vm-8N
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:40 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjG-0003AV-Kj
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:35 -0500
Received: by mail-pf1-x434.google.com with SMTP id ay18so863721pfb.2
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x5RhcaUXSQ5MfMxq0C6EBN7haRQoUvmPfbIAZ3PLMW4=;
 b=VUJ7RFfRVwbXo1RBt+nRsutOHLuWIV/8OqTOn2/rV6UeFM1DYBPojTr92lXn8ZMv55
 Z7jYSoKAbotdxwH+vWoEqNGjZKwvtTueCqnjzqdcieDUGNv84+DNyVdTWjF4UtZbsgUy
 mGlFVmk5CnQup8FHZeGrb0ZTD9+zTLxudo0n3mjrgB8mbyiMREHgVMsbnDByjZSIamgX
 jRPq4IPqSN2g5DFOgOqnT5b/8G7DIxXBOrkXSUlWjjV2qCgDi5Gy4T+i+vGpvyWCJJIb
 ZMVCcvHhd4hVzkTI0kwIvvUBW4OulJACgY/KZcuYq+9VVvR4qBKH6LREERWhKEyzouhf
 80Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x5RhcaUXSQ5MfMxq0C6EBN7haRQoUvmPfbIAZ3PLMW4=;
 b=ojOzSeCZCzAV8kwGSnmZ1LLe6uLgeZL9OsCr5Xhu87l7b0CvWPKcV7L/B0GoInE4KS
 qc2hVq/JfKHIMBZOYQ1S26uGlSQvCPv4OEK/GS19QiGV1qlhdNO+fC32Nneo3munqQEQ
 RHel/E63w4wg8PJq3Kl++MT4d9l7gD84Eb6mzlCQhDZl3cxIE0f/CpbZW3FZmXSgg+Uy
 mee+cjFZxQ3qEBs14eOJzC56iKdgvMOwr7DYJG/lL2jHMJmapQAwTS+aMCnK/G/AKgXB
 84KEFyW6In5um0QiaZRbST1toEwZLV7Mzd6aOp4wsufRFXyND32bV4gbOcAM8z7FTGCq
 qxHA==
X-Gm-Message-State: AO0yUKV4xokKrns+wEDgYyb37dTU+ILgK4cjARBEVvDsdAKL8RWtvxMg
 CSpJyTcq8Vppf8T7L5yxih8iJw==
X-Received: by 2002:aa7:8f11:0:b0:5df:3aa1:10c5 with SMTP id
 x17-20020aa78f11000000b005df3aa110c5mr6774524pfr.14.1677316829736; 
 Sat, 25 Feb 2023 01:20:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 68/76] target/sparc: Drop free_compare
Date: Fri, 24 Feb 2023 23:14:19 -1000
Message-Id: <20230225091427.1817156-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-TUID: mQLyNEdmiRiE

Translators are no longer required to free tcg temporaries.
Remove the g1 and g2 members of DisasCompare, as they were
used to track which temps needed to be freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 560fb32e28..f32f237051 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -93,7 +93,6 @@ typedef struct DisasContext {
 typedef struct {
     TCGCond cond;
     bool is_bool;
-    bool g1, g2;
     TCGv c1, c2;
 } DisasCompare;
 
@@ -1066,16 +1065,6 @@ static inline void gen_op_next_insn(void)
     tcg_gen_addi_tl(cpu_npc, cpu_npc, 4);
 }
 
-static void free_compare(DisasCompare *cmp)
-{
-    if (!cmp->g1) {
-        tcg_temp_free(cmp->c1);
-    }
-    if (!cmp->g2) {
-        tcg_temp_free(cmp->c2);
-    }
-}
-
 static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
                         DisasContext *dc)
 {
@@ -1135,17 +1124,14 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
         cmp->cond = logic_cond[cond];
     do_compare_dst_0:
         cmp->is_bool = false;
-        cmp->g2 = false;
         cmp->c2 = tcg_const_tl(0);
 #ifdef TARGET_SPARC64
         if (!xcc) {
-            cmp->g1 = false;
             cmp->c1 = tcg_temp_new();
             tcg_gen_ext32s_tl(cmp->c1, cpu_cc_dst);
             break;
         }
 #endif
-        cmp->g1 = true;
         cmp->c1 = cpu_cc_dst;
         break;
 
@@ -1167,7 +1153,6 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
             if (!xcc) {
                 /* Note that sign-extension works for unsigned compares as
                    long as both operands are sign-extended.  */
-                cmp->g1 = cmp->g2 = false;
                 cmp->c1 = tcg_temp_new();
                 cmp->c2 = tcg_temp_new();
                 tcg_gen_ext32s_tl(cmp->c1, cpu_cc_src);
@@ -1175,7 +1160,6 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
                 break;
             }
 #endif
-            cmp->g1 = cmp->g2 = true;
             cmp->c1 = cpu_cc_src;
             cmp->c2 = cpu_cc_src2;
             break;
@@ -1192,7 +1176,6 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
         /* We're going to generate a boolean result.  */
         cmp->cond = TCG_COND_NE;
         cmp->is_bool = true;
-        cmp->g1 = cmp->g2 = false;
         cmp->c1 = r_dst = tcg_temp_new();
         cmp->c2 = tcg_const_tl(0);
 
@@ -1258,7 +1241,6 @@ static void gen_fcompare(DisasCompare *cmp, unsigned int cc, unsigned int cond)
     /* For now we still generate a straight boolean result.  */
     cmp->cond = TCG_COND_NE;
     cmp->is_bool = true;
-    cmp->g1 = cmp->g2 = false;
     cmp->c1 = r_dst = tcg_temp_new();
     cmp->c2 = tcg_const_tl(0);
 
@@ -1342,8 +1324,6 @@ static void gen_cond(TCGv r_dst, unsigned int cc, unsigned int cond,
     } else {
         tcg_gen_setcond_tl(cmp.cond, r_dst, cmp.c1, cmp.c2);
     }
-
-    free_compare(&cmp);
 }
 
 static void gen_fcond(TCGv r_dst, unsigned int cc, unsigned int cond)
@@ -1357,8 +1337,6 @@ static void gen_fcond(TCGv r_dst, unsigned int cc, unsigned int cond)
     } else {
         tcg_gen_setcond_tl(cmp.cond, r_dst, cmp.c1, cmp.c2);
     }
-
-    free_compare(&cmp);
 }
 
 #ifdef TARGET_SPARC64
@@ -1378,8 +1356,6 @@ static void gen_compare_reg(DisasCompare *cmp, int cond, TCGv r_src)
 {
     cmp->cond = tcg_invert_cond(gen_tcg_cond_reg[cond]);
     cmp->is_bool = false;
-    cmp->g1 = true;
-    cmp->g2 = false;
     cmp->c1 = r_src;
     cmp->c2 = tcg_const_tl(0);
 }
@@ -1391,8 +1367,6 @@ static inline void gen_cond_reg(TCGv r_dst, int cond, TCGv r_src)
 
     /* The interface is to return a boolean in r_dst.  */
     tcg_gen_setcond_tl(cmp.cond, r_dst, cmp.c1, cmp.c2);
-
-    free_compare(&cmp);
 }
 #endif
 
@@ -3268,7 +3242,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                     l1 = gen_new_label();
                     tcg_gen_brcond_tl(tcg_invert_cond(cmp.cond),
                                       cmp.c1, cmp.c2, l1);
-                    free_compare(&cmp);
                 }
 
                 mask = ((dc->def->features & CPU_FEATURE_HYPV) && supervisor(dc)
@@ -3827,7 +3800,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                     cpu_src1 = get_src1(dc, insn);                 \
                     gen_compare_reg(&cmp, cond, cpu_src1);         \
                     gen_fmov##sz(dc, &cmp, rd, rs2);               \
-                    free_compare(&cmp);                            \
                 } while (0)
 
                 if ((xop & 0x11f) == 0x005) { /* V9 fmovsr */
@@ -3851,7 +3823,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         cond = GET_FIELD_SP(insn, 14, 17);              \
                         gen_fcompare(&cmp, fcc, cond);                  \
                         gen_fmov##sz(dc, &cmp, rd, rs2);                \
-                        free_compare(&cmp);                             \
                     } while (0)
 
                     case 0x001: /* V9 fmovscc %fcc0 */
@@ -3901,7 +3872,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         cond = GET_FIELD_SP(insn, 14, 17);              \
                         gen_compare(&cmp, xcc, cond, dc);               \
                         gen_fmov##sz(dc, &cmp, rd, rs2);                \
-                        free_compare(&cmp);                             \
                     } while (0)
 
                     case 0x101: /* V9 fmovscc %icc */
@@ -4713,7 +4683,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             tcg_gen_movcond_tl(cmp.cond, dst,
                                                cmp.c1, cmp.c2,
                                                cpu_src2, dst);
-                            free_compare(&cmp);
                             gen_store_gpr(dc, rd, dst);
                             break;
                         }
@@ -4745,7 +4714,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             tcg_gen_movcond_tl(cmp.cond, dst,
                                                cmp.c1, cmp.c2,
                                                cpu_src2, dst);
-                            free_compare(&cmp);
                             gen_store_gpr(dc, rd, dst);
                             break;
                         }
-- 
2.34.1

