Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp113482wrp;
        Mon, 11 Feb 2019 16:06:43 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia9tSTNcKmFLAK8tNikxaqHV45rSJ4sgPKqccEKBqW96aBkSbu4ioCghGQOcggTancRWit+
X-Received: by 2002:a25:4e08:: with SMTP id c8mr695372ybb.160.1549930003447;
        Mon, 11 Feb 2019 16:06:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549930003; cv=none;
        d=google.com; s=arc-20160816;
        b=JBkohIBJsE/92QZQtQai3O+NfoLRBAEkVN60yMTlLOaUYdgV2kPgP9Ccw7jyTXL7YA
         37ExgZkMqB1Ob9jeceuQcAGgDRoeIOfbep7KNK4AC3u764ad9bQHQ+MhzfKBrgY/Mzn0
         /xRNQreYwMsm9a5xk/hUE/0HXQdBUMckMwsQdOYuM6Z4vbDsTXOAbr3aNH41sKeD44nX
         WCOB217pv7Q9YR382+4m5PMnnvlGLw/NeljNHyVxPFrsAd4Eh9QXGb8lNy3Jn1ZztMOc
         ZcB7VEigaDZ5h30UKdpJa477wyDwOmz6nb24IJrbJfVWc2QbrP9vHGZ0hLNXVXoyHGSF
         a29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=DNVFOwsoNzgnKbR7Mnu9AKsd+9PuR6uwgzj4ngGGq+U=;
        b=X7W1+X0a3uOGjeGNgtwV8f/vVrc4wkzzAosapk2IHrP8iKezr8BIxdUKhEHhG7M4pG
         DVQ4MKx4gutHCFGOL/OiGc568Tsr3usQzEiM/sk1YKzFF8/6Fiz7Yfl8I3ONGzGAaAvX
         RDHezgOfSCqRejm23P7D0BTKQHvSFDFzKBqDzsQForIkrh/6xJOTksK6OMNGmIfnRfti
         Z2HDDVs6ZZ7Wh9yujLjIWJMp1w4gnyurbpq9gIZUoSR8bBHWP6MBOe37vLiRUpKAy1+o
         eAEXZea6qZs6dSL7NaoABX6ViatIPV8k6LHem/WIfZAliCfQfxB1CPjq2qUqX9xhJ6+2
         UXpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NJr08u+t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si6674024ybp.368.2019.02.11.16.06.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:06:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NJr08u+t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLb0-0006pK-QM
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:06:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOf-0005or-9X
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOe-0004xQ-6A
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:57 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOb-0004SF-5T
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:54 -0500
Received: by mail-pl1-x631.google.com with SMTP id y10so347039plp.0
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DNVFOwsoNzgnKbR7Mnu9AKsd+9PuR6uwgzj4ngGGq+U=;
	b=NJr08u+toyNHXxsde+rUj/T7JyiZ9z5OYzle+qHhclO/uQiMJ9gBKI5cDgjQppwbab
	Zj0kH2BZE6H8ALg9AwxOpd67XK9HgCFlar5ZCAi9HKFJtggmHQ6WrbsBjPWo1r5xROwC
	O+t2Hjhe+CgYT9U5Jdplj20lRzUj6eQ+Z7gzYA/GB2PstfbO4fW4vRnwqwc5nqPO6TAj
	cXV7JjF5iG91I+l8920yrk9tzJFDc9hn5IkDP8/HXfK0q5TxkuPKJTeE4OnPMYnm99B8
	pf3CjaFua+8VBTVlDhQ3L70Us+1MaSHmReizKyufJTDeZEpyWvL5E0cP8jbNwveRHbtC
	JLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DNVFOwsoNzgnKbR7Mnu9AKsd+9PuR6uwgzj4ngGGq+U=;
	b=V1RscCzl2UysXyPTEsevsOseJIqCo+zJmIhNtcwzRby3OzVj2oTsnPgSpC5ukcO7QK
	Db9tBRRa+uTz50n42Hhv2vXMJdp3NLjLWQ3EWM5FHZNr/wDWO3DtdQNTZDvwDVZBLZok
	azEGymFCSvP5Cq1oXdWaS5LMvgLQNlmixl3A+fJ3sFhJ1cvZTsQ7dvFk76V+Dy62e6fs
	dUV30LV4fzrJGy1eDvT1OAqiw3/O79Opii5D26Wk3pIEea9cetL2D8ia19usVbcR0j2d
	ZXaYCvAmKxVIt5SvUVeeNMrZnaAxeqsv05o0VPUKSinMEoDcwF5AqCjtHHKkvbI3grop
	88iA==
X-Gm-Message-State: AHQUAuZ9l67utDeHbPwsuB6rmIXAPVKXsZyJVuZMvu4yah3IqyLuJ5qQ
	/M5BNBXae6Pr2ufQshmLxBNwDPA6TI0=
X-Received: by 2002:a17:902:8d8d:: with SMTP id
	v13mr893143plo.121.1549929198356; 
	Mon, 11 Feb 2019 15:53:18 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:43 -0800
Message-Id: <20190211235258.542-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::631
Subject: [Qemu-devel] [PATCH v3 13/28] target/arm: Implement the SUBP
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
X-TUID: 4GFVzfKQZRAB

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix extraction length.
---
 target/arm/translate-a64.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 791bcc3b66..2339556320 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5139,19 +5139,39 @@ static void handle_crc32(DisasContext *s,
  */
 static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
 {
-    unsigned int sf, rm, opcode, rn, rd;
+    unsigned int sf, rm, opcode, rn, rd, setflag;
     sf = extract32(insn, 31, 1);
+    setflag = extract32(insn, 29, 1);
     rm = extract32(insn, 16, 5);
     opcode = extract32(insn, 10, 6);
     rn = extract32(insn, 5, 5);
     rd = extract32(insn, 0, 5);
 
-    if (extract32(insn, 29, 1)) {
+    if (setflag && opcode != 0) {
         unallocated_encoding(s);
         return;
     }
 
     switch (opcode) {
+    case 0: /* SUBP(S) */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        } else {
+            TCGv_i64 tcg_n, tcg_m, tcg_d;
+
+            tcg_n = read_cpu_reg_sp(s, rn, true);
+            tcg_m = read_cpu_reg_sp(s, rm, true);
+            tcg_gen_sextract_i64(tcg_n, tcg_n, 0, 56);
+            tcg_gen_sextract_i64(tcg_m, tcg_m, 0, 56);
+            tcg_d = cpu_reg(s, rd);
+
+            if (setflag) {
+                gen_sub_CC(true, tcg_d, tcg_n, tcg_m);
+            } else {
+                tcg_gen_sub_i64(tcg_d, tcg_n, tcg_m);
+            }
+        }
+        break;
     case 2: /* UDIV */
         handle_div(s, false, sf, rm, rn, rd);
         break;
-- 
2.17.2

