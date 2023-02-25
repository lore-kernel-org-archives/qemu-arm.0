Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2641814ejc;
        Sat, 25 Feb 2023 01:27:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/Z6glSZw8ITA7VGcfGO2Np6c5fjIeFvspskkOOc2784RW0HGN25cD2BjydyNfTjn9uugVh
X-Received: by 2002:a05:622a:10:b0:3b8:4325:7610 with SMTP id x16-20020a05622a001000b003b843257610mr34105307qtw.67.1677317271282;
        Sat, 25 Feb 2023 01:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317271; cv=none;
        d=google.com; s=arc-20160816;
        b=zMA0xztUItebM7kzNhd5eks7H3G4b7F8VnKO/ldl6N6VweBXSCMfREKsecZl18wkgK
         /jvhGtW6AUQijBD0LyqyVNh3RBD4Jtl+nv9xJMb8MQCbn1oJUr9LRlP+T5xvrvOPOCgq
         6i3CeNfj2eF+9Vs6LWZBO+KcN/e77AxKBIV6H1WV07fZxnGCOOWGilSaVfba8s9v+57p
         pqXrreEhsHgcmDYVaRzSNmbduxyJhOAfKxh9jXhrbFkNVGa7Mg10Xad6hq2Gvw0y/w/C
         I1dRckRD0f+stB294DxnGFPNigdVeZB5KGFwQCWuBvjP6FcJ+PNZ+BSdMq6RU+X7IzK/
         jvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sG9cqgyja8wZFxXAESY3FM7IJYCLVD/+8GYVn1Dmh4s=;
        b=aH9xu1BOK9YiEVLL10hSxV+D1rlbYq+Ur9Y1BuU/hmQm87y48rSvxw7FlNayhim3Sa
         zrPEK790geSOyx+dYClVENHB2m6jnByo29VyyhEXAHEczOiA4XRkpmE+I1m0510SQ0qw
         8hPUDJKQA5hGFeqhP7UQwgSeNnrJIHX53tQpNQMjpvhwdkgDKl9cvmB1WJrsCz0uS/Fu
         M4rcCdUCT4sKoVnVa3HHMKVF4WMmJzzMd/ZkXW4uYYMlWbXUOPj4pJKS+kIXWK2ZovLz
         K6FxE1VDKOiGm0+X9ysFmUiyxOR7xSVjYfIrh1mc+MSyA11ULZzpLb5ooiz/bu53gWpo
         Kjeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVOFLCnb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24-20020a05622a1a1800b003bbd8bdb934si1641134qtb.792.2023.02.25.01.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:27:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVOFLCnb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqim-0005dK-QN; Sat, 25 Feb 2023 04:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiE-0003kF-DR
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:27 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiB-0002tR-J3
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:26 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so5190658pjb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sG9cqgyja8wZFxXAESY3FM7IJYCLVD/+8GYVn1Dmh4s=;
 b=EVOFLCnbGHjQIDFCEf7AyRffiWssRsWDeaz73VnqUwylWBLc5px1NIr/rNUrJW/mLo
 jP63ff/+NxoTnjA7yV61bWW3H3FixSrp+qDcBWAB7BZpX/QvOtpmTVoM6n3v3nyjD1MZ
 Us7zhdFiOoQ3naoU8CWI2EtJioi3io8hfAeJVXdY1R9NtpwrTz7YIdyasT6woRUPf+K7
 DHaWC/WAI3l6TL+hBxL3vFOaD0eaL0WietF9n9OCRR4R5AcUX7Da7eb2ZrhUDmvTlvAf
 lFp9uUxFnSARQIHZaMF6ix/x8035yUPXqUrqW8BF+PRmNaLj01gMZxt+/MJfuR4i3iJU
 ICxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sG9cqgyja8wZFxXAESY3FM7IJYCLVD/+8GYVn1Dmh4s=;
 b=Vc/vxu5F5rTzP0txtM/a7zBahZQ9ojXHdTrX7uSe3N7dR86Gn//ZenhlQTjor5LaKH
 hXmEFOT0GqhJHSkxEKkzHS3deQZWYDJlubTgamLq3/RUnZnf4at6A9LNyaTRF09orhaR
 WipnW2K+0dINV6mVtOmu9PMBL/dLylyFo3TeZn7Jkk5ch+rPH899svnCr6iCdHM2UuA0
 wMy6wc7vFGTJv6RCWX3RW4YhBuB39cOSXNFOe8v3Qqqygwz7yKPDJ2LWRa1mQSjKqlkw
 PR+FdgBHQQq0i619xEeHk7aZC8oCbcbTAZ+uI2AuwRJfyb20OyRJp4JyF3NjdOxJX3/T
 H0lA==
X-Gm-Message-State: AO0yUKWsowMnzvNRIox9N8+GYOXYJpksBoT10hKMV12OTcfhSltbuymI
 7Ft7vQyaT/gA8c6Y8mPZMt0SC/gijevG73R5Tfg=
X-Received: by 2002:a05:6a20:3d89:b0:bc:a9f2:9355 with SMTP id
 s9-20020a056a203d8900b000bca9f29355mr12687491pzi.9.1677316761985; 
 Sat, 25 Feb 2023 01:19:21 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 42/76] target/mips: Drop tcg_temp_free from octeon_translate.c
Date: Fri, 24 Feb 2023 23:13:53 -1000
Message-Id: <20230225091427.1817156-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: W4LPpaSFucKv

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/octeon_translate.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
index 6a207d2e7e..103c304d10 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -40,8 +40,6 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
     ctx->hflags |= MIPS_HFLAG_BC;
     ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
     ctx->hflags |= MIPS_HFLAG_BDS32;
-
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -61,10 +59,6 @@ static bool trans_BADDU(DisasContext *ctx, arg_BADDU *a)
 
     tcg_gen_add_tl(t0, t0, t1);
     tcg_gen_andi_i64(cpu_gpr[a->rd], t0, 0xff);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -83,10 +77,6 @@ static bool trans_DMUL(DisasContext *ctx, arg_DMUL *a)
     gen_load_gpr(t1, a->rt);
 
     tcg_gen_mul_i64(cpu_gpr[a->rd], t0, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -103,8 +93,6 @@ static bool trans_EXTS(DisasContext *ctx, arg_EXTS *a)
     gen_load_gpr(t0, a->rs);
     tcg_gen_sextract_tl(t0, t0, a->p, a->lenm1 + 1);
     gen_store_gpr(t0, a->rt);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -121,8 +109,6 @@ static bool trans_CINS(DisasContext *ctx, arg_CINS *a)
     gen_load_gpr(t0, a->rs);
     tcg_gen_deposit_z_tl(t0, t0, a->p, a->lenm1 + 1);
     gen_store_gpr(t0, a->rt);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -142,8 +128,6 @@ static bool trans_POP(DisasContext *ctx, arg_POP *a)
     }
     tcg_gen_ctpop_tl(t0, t0);
     gen_store_gpr(t0, a->rd);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -167,10 +151,6 @@ static bool trans_SEQNE(DisasContext *ctx, arg_SEQNE *a)
     } else {
         tcg_gen_setcond_tl(TCG_COND_EQ, cpu_gpr[a->rd], t1, t0);
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -194,8 +174,5 @@ static bool trans_SEQNEI(DisasContext *ctx, arg_SEQNEI *a)
     } else {
         tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_gpr[a->rt], t0, imm);
     }
-
-    tcg_temp_free(t0);
-
     return true;
 }
-- 
2.34.1

