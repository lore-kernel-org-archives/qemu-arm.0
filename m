Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AB1C55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 00:06:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpakX-0001kK-C0; Thu, 30 Jul 2026 20:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakU-0001ej-Pp
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:14 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakR-0001LJ-8F
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:14 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-c9b373d5af0so286721a12.2
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 17:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785456309; x=1786061109; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=96KWcuhE8+BvPKd60ur8XtdREvBb8Mo8Rk3bAfuVXDQ=;
 b=S3C2BzmKDnunXaglZA3m4JU7C44AYOYj2RtDYRMycnEgZ2Z26Cg0zs5u2wJ0PwJ6hp
 B+t7vNwlmnayF0qOFfG0LECow4rgkHnjzD67juCLpppf8OZjmKD/xdTNS3ozy71hY9Uu
 0dEuVJYHboTJlgvfPqtjJScWo51MPTC4EV7n5aFcDCgk9VZAP5Iaf0/i9ACojW2nH1/f
 SP/NsmEe0nkZjVpri2e2NHl/zyBWLQzUKYQhyq7APOV3BEv6UBaoZMb0DJq8Qn4nmWTE
 UtYactQFx3qgcPZbrI0hwa0p5j9ozx+Cuhju6u9WXkhJeFB7/APnG6mQEoPS7n2xHOKf
 sXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785456309; x=1786061109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=96KWcuhE8+BvPKd60ur8XtdREvBb8Mo8Rk3bAfuVXDQ=;
 b=IsRPBfn2zjFXoFGuqkQLst1rYcjcdvTT81o9dUwnmD9VFPt6O+Yz8HLBJ/wxfL9n1M
 9jsRxgUJMNhbehwjSYkIvH3V7rrsTltEdCx0Y3avS7cICxoqcZ09KG1M2BUs981CJAPd
 KItbYJzc/PN1JSocIbcvU49JdaaJTymioYhcyREI9rCz8BwrWrEp/kW+4GuN4HUdm/fQ
 7Gjlkq8cB170gJhgFjNh9neiCPstLvEDpWbZFh1w6Y+IvuI9bV9ZMUvZ8WdSyN/43YKr
 4urC4rpJRQn3aDohTDH8YSkaKpamefbXkz9l9A8el0SRQFSIvFKE3WXyN4nEYJ0EGzqh
 L9EQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqmqWemH7OlLnxiLhLfOUQy3XfAXHuwjmPg9yKtJpK7+GRdaozgCESrleYJtjP1Ji6gx0e0rcvRuw==@nongnu.org
X-Gm-Message-State: AOJu0YyhSgI+nlO0YGbFsFaYhmTe2gSmchs6oeQ1NJ2HL2vzfSzQqjc5
 HpopuryfWIEFEayLUq9J+QhIWLlLLthg27X6Qg1mzlF3aDYXPV1lDssQMIH6y2e1R0E=
X-Gm-Gg: AR+sD11YZRPkWa+c2w5E6XzHdJ65hfjoXNuDLPzUztvMA0qZV+hoNvZEC+ldSOHhHYK
 LMF+Te/xbDQpG245BUv9ZT0y5mpzn8JfPcnihr8zmdgzg+pvpz9JlS3t9nkhrPzKFqtcGG6iWpl
 XfThkHfXRAIvaSVk3MY+hHmcgmt6kdDcouZZtVLY4iUMsX5SUoQ3bdvX/Xd39iuOOhTDSTcfZAR
 tDrjBkOKQFJKo/Y89cVYCyLPsdocpNCIICvfiLwyjp6807fwB/79CjnptJwN1hRqE5QtBBRXuz0
 ofPLwWThla4eOuyq9YjR/D2aJV+8rjCrAO5VdHBOYSZYaKZZ3BXb6F82OIUHu3xSnDape7Jl/SP
 +kwp0UEaUy+CVGNJzRttE+Ga+12BUkQfC0OBN+3kX6Ms0upJgi2Q726RhrIthuDH3YB44x7r2FI
 sDC8xBsNiSdrerpjx7w4l5kUHEpt7twTbHLkJxTZT2hlEt0ZTtXj1MB8JGYnROQrmY3V+35ntW0
 T1ljQGv79tbbO0P0Wif
X-Received: by 2002:a05:6a20:a108:b0:3c3:9a7f:7307 with SMTP id
 adf61e73a8af0-3c90075a083mr4323934637.24.1785456309243; 
 Thu, 30 Jul 2026 17:05:09 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbdb7a999ddsm2656460a12.4.2026.07.30.17.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 17:05:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
Subject: [PATCH 05/11] target/loongarch: Expand bitswap inline
Date: Thu, 30 Jul 2026 17:04:57 -0700
Message-ID: <20260731000503.170446-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731000503.170446-1-richard.henderson@linaro.org>
References: <20260731000503.170446-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

The bitrev_[48]b instructions reverse bits within each byte.
This may be accomplished by reversing bits within the entire
word followed by reversing the bytes with the entire word.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/tcg/helper.h                 |  2 --
 target/loongarch/tcg/op_helper.c              | 11 ----------
 .../loongarch/tcg/insn_trans/trans_bit.c.inc  | 20 +++++++++++++++++--
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/target/loongarch/tcg/helper.h b/target/loongarch/tcg/helper.h
index 4b0fc81db6..e76c73c775 100644
--- a/target/loongarch/tcg/helper.h
+++ b/target/loongarch/tcg/helper.h
@@ -5,8 +5,6 @@
 
 DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
-DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
-
 DEF_HELPER_FLAGS_3(asrtle_d, TCG_CALL_NO_WG, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(asrtgt_d, TCG_CALL_NO_WG, void, env, tl, tl)
 
diff --git a/target/loongarch/tcg/op_helper.c b/target/loongarch/tcg/op_helper.c
index 37afa8e92d..f41f0cb1e6 100644
--- a/target/loongarch/tcg/op_helper.c
+++ b/target/loongarch/tcg/op_helper.c
@@ -22,17 +22,6 @@ void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
     do_raise_exception(env, exception, GETPC());
 }
 
-target_ulong helper_bitswap(target_ulong v)
-{
-    v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
-        ((v & (target_ulong)0x5555555555555555ULL) << 1);
-    v = ((v >> 2) & (target_ulong)0x3333333333333333ULL) |
-        ((v & (target_ulong)0x3333333333333333ULL) << 2);
-    v = ((v >> 4) & (target_ulong)0x0F0F0F0F0F0F0F0FULL) |
-        ((v & (target_ulong)0x0F0F0F0F0F0F0F0FULL) << 4);
-    return v;
-}
-
 /* loongarch assert op */
 void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
diff --git a/target/loongarch/tcg/insn_trans/trans_bit.c.inc b/target/loongarch/tcg/insn_trans/trans_bit.c.inc
index 3d24e320ce..1200f931fa 100644
--- a/target/loongarch/tcg/insn_trans/trans_bit.c.inc
+++ b/target/loongarch/tcg/insn_trans/trans_bit.c.inc
@@ -178,6 +178,22 @@ static void gen_masknez(TCGv dest, TCGv src1, TCGv src2)
     tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, zero, zero, src1);
 }
 
+static void gen_bitrev_4b(TCGv dest, TCGv src)
+{
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t, src);
+    tcg_gen_revbit32_i32(t, t);
+    tcg_gen_bswap32_i32(t, t);
+    tcg_gen_ext_i32_tl(dest, t);
+}
+
+static void gen_bitrev_8b(TCGv dest, TCGv src)
+{
+    tcg_gen_revbit_tl(dest, src);
+    tcg_gen_bswap_tl(dest, dest);
+}
+
 static void gen_bitrev_w(TCGv dest, TCGv src)
 {
     tcg_gen_revbit32_tl(dest, src, TCG_BSWAP_OS);
@@ -199,8 +215,8 @@ TRANS(revb_2w, 64, gen_rr, EXT_NONE, EXT_NONE, gen_revb_2w)
 TRANS(revb_d, 64, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_bswap64_i64)
 TRANS(revh_2w, 64, gen_rr, EXT_NONE, EXT_NONE, gen_revh_2w)
 TRANS(revh_d, 64, gen_rr, EXT_NONE, EXT_NONE, gen_revh_d)
-TRANS(bitrev_4b, ALL, gen_rr, EXT_ZERO, EXT_SIGN, gen_helper_bitswap)
-TRANS(bitrev_8b, 64, gen_rr, EXT_NONE, EXT_NONE, gen_helper_bitswap)
+TRANS(bitrev_4b, ALL, gen_rr, EXT_NONE, EXT_NONE, gen_bitrev_4b)
+TRANS(bitrev_8b, 64, gen_rr, EXT_NONE, EXT_NONE, gen_bitrev_8b)
 TRANS(bitrev_w, ALL, gen_rr, EXT_NONE, EXT_NONE, gen_bitrev_w)
 TRANS(bitrev_d, 64, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_revbit64_i64)
 TRANS(maskeqz, ALL, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_maskeqz)
-- 
2.43.0


