Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4302810ejc;
        Sun, 26 Feb 2023 21:53:43 -0800 (PST)
X-Google-Smtp-Source: AK7set++V0+euodI1dnk7TYW/OAPZRqyG+9pgt92sPP24ATemXzhz4I+oDCY0prODgHDrg+5TlvA
X-Received: by 2002:a05:6214:29c9:b0:56e:9d09:5150 with SMTP id gh9-20020a05621429c900b0056e9d095150mr11909704qvb.15.1677477223768;
        Sun, 26 Feb 2023 21:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477223; cv=none;
        d=google.com; s=arc-20160816;
        b=he/o78+Dayr3kzS99SvYoygEzepmGZUpI7C5tHACEFXsTAGRFlrzGy+jAP4qScJ9zm
         3PEmPl/Km55/vWw0pMhBxBfdjgCxHpdevGkd5ANhL7aytDX8HynNB/JI9cYr6J+bWPB6
         a08YhUsCDrN8Mu4mBBgRWZ16IavklF+FgbTGJAdEia4L/bqObzBH4fxVdDezN9KlQPZD
         pmrhdLK+hm6nCe677jm6WTmZiy6j+bWINnMLonId7Y18McWsnMdHsOYTLR7/Z2Qse3Oo
         MHQVRH8oYoUbbh7zDVRX7msmmHV2E0uI7nWESq4D1Rgg9d19+jJjtle6Rl2AxG1qZMuP
         gjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sG9cqgyja8wZFxXAESY3FM7IJYCLVD/+8GYVn1Dmh4s=;
        b=ejp1NkErZH69AnlSMtFAgL6Y8+MmC3ZWUxPYgO+BHD7axcG9QC+hcHBtKC2kGalm24
         IkoSl0ay1lHqtfNT6NGoVVNUchvw3Qb4eokE3XesK3G0J0G2/Sgna7McoofcG1E7z1lh
         LiW19QAkegUtMxjDLIomU7D2GOMhqdNDHoeNsp3d9Tyt6kTCVBqn+uvGn7En0xOlFlr9
         AkTRwUpDRIYvQKJ1gKQ9h8Rk9QRorfDMBoDZ9Y+72fJ5/wQCQ+RGJl/flaBKF1qc+efi
         ePe1h4j8tYnQqwP8QJjfl2P58vwlVgoJUXfSF/+fq8WvN4bvTEGuKdB4iIILx2FATO7y
         o2Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCJe8I2r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020a0ce08b000000b005726e406f43si5749801qvk.230.2023.02.26.21.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:53:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCJe8I2r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW6C-0003vX-CX; Mon, 27 Feb 2023 00:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5U-0002vj-ME
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:13 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5Q-0000HW-M7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:11 -0500
Received: by mail-pl1-x633.google.com with SMTP id z2so5505129plf.12
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sG9cqgyja8wZFxXAESY3FM7IJYCLVD/+8GYVn1Dmh4s=;
 b=yCJe8I2rbmzaLFi6KoVGoDRbmJajAYfrmzGP2oByx1QR+RW3IxRKDNIK+2JbN0PVDc
 Cak9P5Eo1RKe9V9/NfZh3mQi0o4zskeHB/VMRub3DF/EKf8DCI9L5Is+5QGex0LDjNS1
 qOsMa3jDMWjSl2Ob0+a0DfroxADZw1PKRF9DA/wxG+cJ6DcJXTA1vwcrNG1RbF2XiBmz
 rvx/ddn+G7cMx2z5lzqLl4TYIdWed+mxJFieiVJYbnGQDDgSAs1XG2vDPJ2EeUVLOIC8
 fmmkJ8vZC+TpnB1yo9SVw8Do51HPFI9z6l3p9Ft2fdwWuF7MGzkDqtS2N+DDtxMBNGC3
 AraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sG9cqgyja8wZFxXAESY3FM7IJYCLVD/+8GYVn1Dmh4s=;
 b=1CaJaJ25Fq+jHg3+3qvSd0k4bHH9V975J2/lh0FLGEp+Bpqqc2MeLFsVYeCUiLDGD5
 vzgl+X0oGwVg1rYuF5AB3yeU+KEW8Opay1ZQiYJRLLROTfZQy/Y0drbX8ulUzYk95nZo
 u4Pgg6B2f//k0Sg17AOaYKiGvwmutO+/LZOpkiytiXeb0gybc7+eQtwJsgm9neXtr+Yx
 J4XFQwcHoUsrOqa0V4JQjeNxmFdOFE0hzF0Mw9NAmUQfAfMi2fhtler86OXCw9/VpFSr
 y5MEFhEPP7BIlebS0LRWKkbsmnBsW0qvwTrplUzXzpCReUjJOCB9FCgeTNsfOX+vLPdA
 zHZA==
X-Gm-Message-State: AO0yUKXU9Ht7VQlbAJ+dqswIsJwxpDuH9xa2rMWIx80n9cPZaQPJD+Id
 usd8Vgc5JHcqvTmURNJeJ/qkWDMnBcxY4oBxkC0=
X-Received: by 2002:a17:90b:3b8d:b0:234:a299:b50a with SMTP id
 pc13-20020a17090b3b8d00b00234a299b50amr8447764pjb.2.1677475806933; 
 Sun, 26 Feb 2023 21:30:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 42/76] target/mips: Drop tcg_temp_free from
 octeon_translate.c
Date: Sun, 26 Feb 2023 19:24:31 -1000
Message-Id: <20230227052505.352889-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: ykvroOoemjqZ

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

