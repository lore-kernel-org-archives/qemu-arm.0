Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098F5C55165
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 00:06:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpakW-0001je-LA; Thu, 30 Jul 2026 20:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakU-0001eg-LI
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:14 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakR-0001LC-8W
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:14 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so497352b3a.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 17:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785456308; x=1786061108; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Rdh3OOkoPnHUJw/UD4a6FqZEuxZNNZ9BwpVlBszcZe8=;
 b=byjCDJXdluHeIdmlst3Ih6oNAF4FQXb2MY/A+9Pdil2B3JksKviEFmH0XbNcf/o5xu
 o7WZKrBzgDVZcdhavDvJSC7xY5hz495ZfwKnt1a1R9V7Lk74UzWHl3IQ6fWjC0g9L/k3
 6aAJClfQoYb7WA1wGdE2PTg40r/y0Z5jCBMaDntd2GxQA/fGjxh59ZmHSZHsk4sVefS+
 1LWIvbva/6dU33lEmXM92Bg4iJOyUVOTTRgSg6soonKWw3r3lwfBzqGmaD9QMAzXAWZE
 Fxc8IwGN9JgwxUx57PYdwLDOkAPNadS+158WBz+cHRLRMHF2RTHrDgEfPM4rRe/hoOat
 IwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785456308; x=1786061108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Rdh3OOkoPnHUJw/UD4a6FqZEuxZNNZ9BwpVlBszcZe8=;
 b=soqa4OoPpExf2eB2jHBXaZHTFQxY7BJb8AriStGRNcN4rid73EfymjQx5FxCH7+8jv
 8b3SEud63MQ9YLkp9jXw0y1JUwHDkmEQlqh46XK0aE9i+utqNsim3tB12+Xqy75j54rS
 xKOFXgsa04oRUwsFwnsshadMvzCJm4vqTlwIBfH5YOXylWqcNr0T2MrAcACmN/RenVrR
 a7BEF2K52faHu1FTB4zfsYUa/3K2jc/Uy7LPFJcCYLPmf3mFkOFbCIEMZIYKOyvcdAls
 foIdCARgee+WWntjSrO/+Za9W7jEjDiEeECSUMZtS7J+nZGsbaMKu3v/qcQeuNTmLIez
 5Yjg==
X-Forwarded-Encrypted: i=1;
 AHgh+RozRCjaErDJqS8HJewsZwaIMPEdKAE5QgSfHEiNMJbvhtj3U5YsUQI07UQqp26eAtprootFzKLQrA==@nongnu.org
X-Gm-Message-State: AOJu0Yyau6aAEZPRfU09hfLE9YsAiO/UlLn19MGtnLTg6q5U0NzBlfca
 +9/QKeYXRM/mjyqE2tNsOZ1x38geqjIlhFb+qv6pkaoRJdHnfquyyfkgIUN96RgMLIU=
X-Gm-Gg: AR+sD10KaVI3cfrMKqCpprrmG0AIB2aLB2MaunqwSuAt6Fn634/UA3DRikrpxqhnt95
 0X5CPagNG58Ju4AtvElbSYZT1P7VIMY9zK5hSFetlwESt7YjhQ9XtY3RMSpM9NM0lM8mIKra+VB
 TmNcgUPfyuN6KP2xc2BCWyCTUHLAXaMovN8jBEzpatcjhfO2+Bspcq3KuA4CCvwPqXtt8Gl/VPq
 EKD1kh6jbXce8qP/AuvdZw6Co2+VZGiD5IvUeNM6LGTgesWT1+lzZJYkNoP8lw2wMwfuEyo1yzZ
 oZP9QAdPL2RHupdqhb56fpE1miXjtQOKDzIQ55CuCXRHCDcyxpgB1FzTetb7rRWGD6/j8udXpoA
 JabJ5ymIx15CFWZLGHS76LdYmhczHmDzVBhS8jQXyrB8xxC2oBBdaH1l28M2g5TGJk/9pMTbK9n
 UuM9XFcPqGnosT8VD1pYvxj2xVfsjmPQ9KqR5sj4uLc43Nk61skd6UGKGLLIS37sxXknUK/RFeI
 qyLP4BT3L3z16ZAoIQI
X-Received: by 2002:a05:6a20:7f9a:b0:3c3:8fc3:5373 with SMTP id
 adf61e73a8af0-3c90085c8b8mr3827736637.35.1785456308136; 
 Thu, 30 Jul 2026 17:05:08 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbdb7a999ddsm2656460a12.4.2026.07.30.17.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 17:05:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
Subject: [PATCH 04/11] target/loongarch: Use generic tcg_gen_revbit*
Date: Thu, 30 Jul 2026 17:04:56 -0700
Message-ID: <20260731000503.170446-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731000503.170446-1-richard.henderson@linaro.org>
References: <20260731000503.170446-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/tcg/helper.h                   |  2 --
 target/loongarch/tcg/op_helper.c                | 10 ----------
 target/loongarch/tcg/insn_trans/trans_bit.c.inc |  9 +++++++--
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/target/loongarch/tcg/helper.h b/target/loongarch/tcg/helper.h
index 8a6c62f116..4b0fc81db6 100644
--- a/target/loongarch/tcg/helper.h
+++ b/target/loongarch/tcg/helper.h
@@ -5,8 +5,6 @@
 
 DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
-DEF_HELPER_FLAGS_1(bitrev_w, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(bitrev_d, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 
 DEF_HELPER_FLAGS_3(asrtle_d, TCG_CALL_NO_WG, void, env, tl, tl)
diff --git a/target/loongarch/tcg/op_helper.c b/target/loongarch/tcg/op_helper.c
index e63ac66daa..37afa8e92d 100644
--- a/target/loongarch/tcg/op_helper.c
+++ b/target/loongarch/tcg/op_helper.c
@@ -22,16 +22,6 @@ void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
     do_raise_exception(env, exception, GETPC());
 }
 
-target_ulong helper_bitrev_w(target_ulong rj)
-{
-    return (int32_t)revbit32(rj);
-}
-
-target_ulong helper_bitrev_d(target_ulong rj)
-{
-    return revbit64(rj);
-}
-
 target_ulong helper_bitswap(target_ulong v)
 {
     v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
diff --git a/target/loongarch/tcg/insn_trans/trans_bit.c.inc b/target/loongarch/tcg/insn_trans/trans_bit.c.inc
index ee5fa003ce..3d24e320ce 100644
--- a/target/loongarch/tcg/insn_trans/trans_bit.c.inc
+++ b/target/loongarch/tcg/insn_trans/trans_bit.c.inc
@@ -178,6 +178,11 @@ static void gen_masknez(TCGv dest, TCGv src1, TCGv src2)
     tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, zero, zero, src1);
 }
 
+static void gen_bitrev_w(TCGv dest, TCGv src)
+{
+    tcg_gen_revbit32_tl(dest, src, TCG_BSWAP_OS);
+}
+
 TRANS(ext_w_h, ALL, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_ext16s_tl)
 TRANS(ext_w_b, ALL, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_ext8s_tl)
 TRANS(clo_w, ALL, gen_rr, EXT_NONE, EXT_NONE, gen_clo_w)
@@ -196,8 +201,8 @@ TRANS(revh_2w, 64, gen_rr, EXT_NONE, EXT_NONE, gen_revh_2w)
 TRANS(revh_d, 64, gen_rr, EXT_NONE, EXT_NONE, gen_revh_d)
 TRANS(bitrev_4b, ALL, gen_rr, EXT_ZERO, EXT_SIGN, gen_helper_bitswap)
 TRANS(bitrev_8b, 64, gen_rr, EXT_NONE, EXT_NONE, gen_helper_bitswap)
-TRANS(bitrev_w, ALL, gen_rr, EXT_NONE, EXT_SIGN, gen_helper_bitrev_w)
-TRANS(bitrev_d, 64, gen_rr, EXT_NONE, EXT_NONE, gen_helper_bitrev_d)
+TRANS(bitrev_w, ALL, gen_rr, EXT_NONE, EXT_NONE, gen_bitrev_w)
+TRANS(bitrev_d, 64, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_revbit64_i64)
 TRANS(maskeqz, ALL, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_maskeqz)
 TRANS(masknez, ALL, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_masknez)
 TRANS(bytepick_w, ALL, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_w)
-- 
2.43.0


