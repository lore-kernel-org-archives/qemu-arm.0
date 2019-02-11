Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp106270wrp;
        Mon, 11 Feb 2019 15:58:17 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZHHkiE9bUcXM5WumRIMQZhwW5Yr1wX7pYRHiwqzCfknPCC8XQLS4wYQvElhMnZIafY9wRh
X-Received: by 2002:a25:355:: with SMTP id 82mr676009ybd.141.1549929497039;
        Mon, 11 Feb 2019 15:58:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929497; cv=none;
        d=google.com; s=arc-20160816;
        b=OG2ay9tqAncctKyhi0iOOusmV+MK9juvsL9xXk48UitvBR7IokxPLvir6NcjlSt818
         Zew0vwU9XcKkb/uxNM95s6FoLIii4QUB+ia2uSmjRa3zsUwzERz8BrzZf9fGSAszXQ+i
         Zx5E2z+tpJ+dGBVu/bgb2viFpAqAuW7YwZVIYMWBikKbxjKQBZbaaH5yK9MMo7ZSLbD/
         ULYMP/2j2GBsS0F1KW1mLwuYBz839Y7BaI+AVn3se4ozCT9OMqlsYnTNWdGR10aS74cy
         /ho2Fa9m1l69CdVwu8e6pmuGZO8hjV9x7A4JW4GA941SMY7qHvf7JcOfvmmHGLkTHIhx
         OkLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wnM/Ux+FJ1QNzphLa721yF5UFojAxLFZH8jvCJ6dar0=;
        b=kyMRMcURhckp9AbHdkvj3T6SdT5Y7WHeHRE9vvAGFSt6c8FMfRDwWQ34ZOSpuQh34B
         oLsjDkD9DA9t4brvdribzpmR1kwfKVQcfkBo6OKmBsVrS6/0P/cFAe9R72eTKRkuN4Lz
         +NGQQURbwl9JkIbvNGPwg1v0X32BpD7K60/CaOrCqAlFffTB2YeLukqBKL8cF0XBkjXk
         A+ZTokpX+upmu2y8rsz3A4f0JxKGiITxqqrgDfflrXzbUxOh52xD3joMpR39mahn7aNS
         f/M791AjfJNZP5Anq+GEFHqrWlSLyiTTQJfj+RcKVLwORQY1/JpNhvw7Kjs0zjyioIa/
         CWCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FCVo6cWZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13si4379469ybf.296.2019.02.11.15.58.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:58:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FCVo6cWZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58206 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLSq-0000D0-CN
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:58:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOJ-0005UG-L4
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOH-0004f8-1L
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:35 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOE-0004U1-BM
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:30 -0500
Received: by mail-pg1-x543.google.com with SMTP id r11so318906pgp.6
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wnM/Ux+FJ1QNzphLa721yF5UFojAxLFZH8jvCJ6dar0=;
	b=FCVo6cWZzgjCIeZgsip7p6+r1b9YIuTtIIE0vpr4ICQp5tPcip6ipLVlpFpx+CMRcr
	h0Tuo9azsqe56vYAXBWdps+m2Ria9jnIVaZ/2OtPyn8Hd9WT9fzwW2xgalEAB7B8YrwE
	b9NMbQ+zq740dot2Icu2Puxh/N/q5QblmB0YhUbtswc91Z0MLG7wAcyrf2TKZ2JKuiWE
	8TmeEUtW1mxU1+yOHL48gtpVIz4b4ioevtdeGVObBlWdHqtwTQseXkeziY2NTcz00BCR
	slzH9sIEtvwWEQ0c537bK9O09EYpdJ2ExaPUBupiGMFbKfR6OInhHcHqgwR+D/avC1+k
	cM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wnM/Ux+FJ1QNzphLa721yF5UFojAxLFZH8jvCJ6dar0=;
	b=TGgP3i9XcPxFLt8yw+dgxH+ZCVa6c0h/+CFh6z5MeOeI7G010zfaZD+HXbq65DmNlE
	HtPfMBLxXCqj/OWxnk+aAUELFSTKBTAVXj4J2c6CJAR15QQYXvwdhISLnyDh/I6RQFul
	m+SVp6Xh/XrtZVzfXrsU8MfmlzQdj/gEqt+M/G1QSv57kMqHVjfujVvbGDu+TecSJ+ST
	x7zHr1Doxo3usMHMhwS0i+HjxUKl42ss/TtSH4nLvOm7VCN6QL8miSmRpHkPwFelAbix
	uGezG6QyniaBirZM9myZul97iV7ZctxNdxP/B/70DJ7p4x7a+4LZke1OsJu2q/FGx0WC
	ZTPQ==
X-Gm-Message-State: AHQUAuY+fp1PngDviFIehKjmCtKblSXckb54wQC31vMcwi1YeWv/73bN
	UK7suIjdCSJ8IzfkpRd5Ee8oy55fuf8=
X-Received: by 2002:a62:345:: with SMTP id 66mr872084pfd.189.1549929202199;
	Mon, 11 Feb 2019 15:53:22 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:46 -0800
Message-Id: <20190211235258.542-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH v3 16/28] target/arm: Implement the STGP
 instruction
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2XmQx+XUUqT7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Handle atomicity, require pre-cleaned address.
---
 target/arm/translate-a64.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index feed325083..ef3fc3a397 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2708,7 +2708,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
  * +-----+-------+---+---+-------+---+-------+-------+------+------+
  *
  * opc: LDP/STP/LDNP/STNP        00 -> 32 bit, 10 -> 64 bit
- *      LDPSW                    01
+ *      LDPSW/STGP               01
  *      LDP/STP/LDNP/STNP (SIMD) 00 -> 32 bit, 01 -> 64 bit, 10 -> 128 bit
  *   V: 0 -> GPR, 1 -> Vector
  * idx: 00 -> signed offset with non-temporal hint, 01 -> post-index,
@@ -2733,6 +2733,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     bool is_signed = false;
     bool postindex = false;
     bool wback = false;
+    bool set_tag = false;
 
     TCGv_i64 clean_addr, dirty_addr;
 
@@ -2745,6 +2746,14 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
 
     if (is_vector) {
         size = 2 + opc;
+    } else if (opc == 1 && !is_load) {
+        /* STGP */
+        if (!dc_isar_feature(aa64_mte_insn_reg, s) || index == 0) {
+            unallocated_encoding(s);
+            return;
+        }
+        size = 3;
+        set_tag = true;
     } else {
         size = 2 + extract32(opc, 1, 1);
         is_signed = extract32(opc, 0, 1);
@@ -2797,6 +2806,15 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     }
     clean_addr = clean_data_tbi(s, dirty_addr, wback || rn != 31);
 
+    if (set_tag) {
+        TCGv_i64 tcg_rn = cpu_reg_sp(s, rn);
+        if (tb_cflags(s->base.tb) & CF_PARALLEL) {
+            gen_helper_stg_parallel(cpu_env, clean_addr, tcg_rn);
+        } else {
+            gen_helper_stg(cpu_env, clean_addr, tcg_rn);
+        }
+    }
+
     if (is_vector) {
         if (is_load) {
             do_fp_ld(s, rt, clean_addr, size);
-- 
2.17.2

