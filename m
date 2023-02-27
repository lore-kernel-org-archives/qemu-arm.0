Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301848ejc;
        Sun, 26 Feb 2023 21:52:01 -0800 (PST)
X-Google-Smtp-Source: AK7set/PkCI330bwFBCxslb/Z6/Dccf6Nh98jjx5Xe7hxMogjUS+Eu9a7KZQNyBU/wIx4SnDkjjH
X-Received: by 2002:ac8:5d92:0:b0:3b9:cc9b:1d9d with SMTP id d18-20020ac85d92000000b003b9cc9b1d9dmr15989615qtx.20.1677477121066;
        Sun, 26 Feb 2023 21:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477121; cv=none;
        d=google.com; s=arc-20160816;
        b=fLm8SYgr+MHO+Bouqs4V3hTQUKsZXs+4bo4+mplt9k/e5PHwvAD9+nXNTeRIiLXAce
         Cv8P9WMAL5rPPxIEzYNUpqQn99bgHRfhme1olt4Jrep0YWoNYsg1BQsJ3/XY14X+meGi
         VGD1ajPhNALzM/KviSAD66+GeOuaYT7YHkrk1oOiY/03z/BZc5zM5HWX4IrMy+TaWk8g
         HfTcEfuFTErxlvNCCTa6lGUtIKGJE5NvXJsNFnu3/Z5+lbtvmjyJiXOL+Y+Ev0O9Ck2X
         qy5HCbEHaLo/pLHFUxcJhH2qbEn9rVnX3uy9FrM76lFigHBrsL9LFvvx2JCAxT9CHLZE
         8w0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4kqBfUrEC0hgJZyLTR3qpiXaj+lmTNXQFttN4oATONw=;
        b=sWfHO0qfRuEyJ1/ObInaedNetbOC4nCUvnPh3io1UTDbO/D2UJK/eQglsC6jX+jp4F
         Qv6du6NsxDXIutbad/V90AevDmhO6nR3GtBcp3CU2f8AGtH5aZ3JhvixtPRMXoiUDQzz
         LzyGcmyOiJ0eRsFz78p5i5dS1kRDxBNUn6WVkcVR7C6cuekq3L+LB3vpg7SfLcp9n3by
         B1SWSkbcZz8FpK39BKSnLpk/cx2EEauTb8rR8UJyRAoiJcv/+fFrT9L9vnGiMTPDdK40
         ruy5Vq5XrhpupA8pPHR0VW4MT+7W3RdF4eCMNp/Kf7h8HBie1hVqddUPI85NM8W8B9hY
         9hpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMorFQz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a05622a014400b003b82eb6578esi5865033qtw.138.2023.02.26.21.52.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:52:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMorFQz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW5d-000377-Qe; Mon, 27 Feb 2023 00:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5O-0002o8-9l
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:30:07 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5L-000055-Pk
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:30:05 -0500
Received: by mail-pl1-x629.google.com with SMTP id bh1so5506468plb.11
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4kqBfUrEC0hgJZyLTR3qpiXaj+lmTNXQFttN4oATONw=;
 b=DMorFQz3rzOt3Ngjk3WkKsBMLyXwoZsGW9pGzH1c//uB6CSUhoyheWlsHyskDdGJIT
 YjVfrTWJKNBJX78bIx7vcez7m906cGI+tkUM3QKEfMKSWeJzH68KUqKKzpilLIXPlUXW
 UjbcCEqk+U1SY/lmwX1+Bp84SdQ1LpiOFU+/KSstIH6os2TdcvtjPUdKK5ZGRmm0IDJw
 S8frZ2XX+9C/MyVRiqy+qQefBY4HDJSAspQoR52WL0B2HRtAqWiA+29MDxvALkRD1dKk
 uEb3YVsL6kxH86qhiB37lJXA5SBTBU6QztJuovHkTXAbB7i24TGgI3DQj8oFfjKZFXYd
 41Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4kqBfUrEC0hgJZyLTR3qpiXaj+lmTNXQFttN4oATONw=;
 b=55UU3XrxDAMO8iuta/ZTmOquepLT1OevfaWtkzaNT9ZgeIAK/5TxlGwLVzZM7m5SnB
 QugGOgeotMbneTGmoTgjkhL7/C9eOfxr3wv6Dr26D2aJftVwdQRllvKP/eXe+q8VbeB8
 nJgANRjeI2kTjykbce1uQq+fb84HFb6vW26FDvPuwAB8xkHm7kozRLHZfgsUV+I9CYWA
 E7TWVZorE/s8Z4m6vIvT24vthWkgIaN+SojNjCbzAtsBpG8dpe8E72u4aTFybHVSaf+e
 i/PtrUt8b97uUalxHH5SEKuGdeTO4WhvJzPd8JPw1u0jaHfhZB6W1oSpSrX4JlPznSaQ
 pV+w==
X-Gm-Message-State: AO0yUKVXGK1KjtO52n6xRtsvUhCmlVZccMsiaiX1uFUdO9sr+ZC3HIZf
 ASpCDnUIw+FuJdNjNQ9kBhibSA==
X-Received: by 2002:a17:90b:2248:b0:235:31e9:e793 with SMTP id
 hk8-20020a17090b224800b0023531e9e793mr8367182pjb.13.1677475801245; 
 Sun, 26 Feb 2023 21:30:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 40/76] target/mips: Drop tcg_temp_free from mxu_translate.c
Date: Sun, 26 Feb 2023 19:24:29 -1000
Message-Id: <20230227052505.352889-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: z9KSarQ8hfie

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mxu_translate.c | 51 ---------------------------------
 1 file changed, 51 deletions(-)

diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index f52244e1b2..8703b0cef4 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -513,8 +513,6 @@ static void gen_mxu_s32i2m(DisasContext *ctx)
     } else if (XRa == 16) {
         gen_store_mxu_cr(t0);
     }
-
-    tcg_temp_free(t0);
 }
 
 /*
@@ -537,8 +535,6 @@ static void gen_mxu_s32m2i(DisasContext *ctx)
     }
 
     gen_store_gpr(t0, Rb);
-
-    tcg_temp_free(t0);
 }
 
 /*
@@ -613,9 +609,6 @@ static void gen_mxu_s8ldd(DisasContext *ctx)
     }
 
     gen_store_mxu_gpr(t0, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /*
@@ -664,11 +657,6 @@ static void gen_mxu_d16mul(DisasContext *ctx)
     }
     gen_store_mxu_gpr(t3, XRa);
     gen_store_mxu_gpr(t2, XRd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
 }
 
 /*
@@ -741,11 +729,6 @@ static void gen_mxu_d16mac(DisasContext *ctx)
     }
     gen_store_mxu_gpr(t3, XRa);
     gen_store_mxu_gpr(t2, XRd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
 }
 
 /*
@@ -821,15 +804,6 @@ static void gen_mxu_q8mul_q8mulsu(DisasContext *ctx)
 
     gen_store_mxu_gpr(t0, XRd);
     gen_store_mxu_gpr(t1, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
-    tcg_temp_free(t4);
-    tcg_temp_free(t5);
-    tcg_temp_free(t6);
-    tcg_temp_free(t7);
 }
 
 /*
@@ -860,9 +834,6 @@ static void gen_mxu_s32ldd_s32lddr(DisasContext *ctx)
     tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, MO_TESL ^ (sel * MO_BSWAP));
 
     gen_store_mxu_gpr(t1, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 
@@ -1125,9 +1096,6 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         tcg_gen_shri_i32(t0, t0, 16);
         /* finally update the destination */
         tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     } else if (unlikely(XRb == XRc)) {
         /* both operands same -> just set destination to one of them */
         tcg_gen_mov_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1]);
@@ -1161,9 +1129,6 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         tcg_gen_shri_i32(t0, t0, 16);
         /* finally update the destination */
         tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     }
 }
 
@@ -1226,9 +1191,6 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
             /* finally update the destination */
             tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
         }
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     } else if (unlikely(XRb == XRc)) {
         /* both operands same -> just set destination to one of them */
         tcg_gen_mov_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1]);
@@ -1266,9 +1228,6 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
             /* finally update the destination */
             tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
         }
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     }
 }
 
@@ -1384,9 +1343,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 24);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN2:
@@ -1410,9 +1366,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 16);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN3:
@@ -1436,9 +1389,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 8);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN4:
@@ -1598,7 +1548,6 @@ bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
         }
 
         gen_set_label(l_exit);
-        tcg_temp_free(t_mxu_cr);
     }
 
     return true;
-- 
2.34.1

