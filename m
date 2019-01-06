Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2869267wrt;
        Sun, 6 Jan 2019 14:51:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7dyh3wGBu2BdAIRN5JildM/jHWDtst8WD7AQ/2pCq7QV8pvXykzHP1FGgws379riK/H4QF
X-Received: by 2002:a1c:5dce:: with SMTP id r197mr6515707wmb.130.1546815067911;
        Sun, 06 Jan 2019 14:51:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546815067; cv=none;
        d=google.com; s=arc-20160816;
        b=y61Qu/wY+iOCbdEXZBv78PHaEghDsqEQXhHM4FvLHY6SLZkaDCFkEzQH6WZ+miRppD
         FRt+SNARGve85g5zwc2yr/AaF9nI11pQBSnCICKv2+7FiqWmKnDbcx3IRfRg9kEK7Y0P
         Ub1B7ak5L81XlZ8dD+ngqXhv36t0dzAgrChCKiWCezbqwE1PxPvRaQWR0sp6CdAYVJHO
         xE8clhOVaLzUm1OcVY4pXbluPj/1RzrFxmeluIrqVe6Xdbzpra1bhAqpc/B5437yrZLo
         10JakunQ69+4f6GgQFu1SHcDfrMBkO/uJ2CgpZVBp4usMy+oblKxWVq8WH3EHV+XLdGY
         yvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kn8TChn9a+pm0RN7mZwckgPE1JRDgQHcCQVRvVrkJ7Y=;
        b=oPhnsS58CC8iAp6zYgYqOda+G6HRj2Jjw5ttZ8jOJTUCz3aezYzkgKm4cOJkS60FDE
         JQGAF6+Pk9XJrfLcM6vjn3EeglPLBcmuk8hHBqmUd4V4TuUq1/QIyn8pK7L1F+QsxtL/
         tV1ha27RffoAuH2C+sG5aXgMWUpzCZYflgo4TUktAE8UIkh6VzlqomIBtI1cbSfudkkW
         vmWO6VWAwoLT9RyEFrI5FKPboIxlAE+ShW4bEQdwcIhmYx7ClwjwsheT50xTxwjnVciw
         UVDLOD2NmcHPy4/ePhVCfhK3PnDEmLeayWiZY5ODQGPFr2xcjB+8F0601+aHAQuZNGJ8
         CViA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bHLGqdcH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si4172214wmd.74.2019.01.06.14.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 14:51:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bHLGqdcH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggHG7-0003oz-0S
	for alex.bennee@linaro.org; Sun, 06 Jan 2019 17:51:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ggHFo-0003m9-Cv
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ggHFn-0004gK-Hs
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:48 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38260)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ggHFn-0004g0-C1
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:47 -0500
Received: by mail-pl1-x644.google.com with SMTP id e5so19932172plb.5
	for <qemu-arm@nongnu.org>; Sun, 06 Jan 2019 14:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kn8TChn9a+pm0RN7mZwckgPE1JRDgQHcCQVRvVrkJ7Y=;
	b=bHLGqdcHZdEZOXs6S+jX0XGhwgSMIKO1PeZi6eVSo+9f3gVrKfuz3O3gPa6rooL9x1
	xhMJDocZEpeKSf6f5ozxI2getqhOqxfC9nTd+Ucv18RfePA/cx9QHudDK96GYLnV8NkL
	x2mi3MhIhrgbgb7mF3kcx542fpjbO5y8WBUl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kn8TChn9a+pm0RN7mZwckgPE1JRDgQHcCQVRvVrkJ7Y=;
	b=TsyAl5vEFvVy3k9dBL6bPrZYMyKf9WbujsZw9Vv25KWLu5wAFCPJaojh7u0qKsPinp
	y2RYSLniZ+0G6avtxxsYlkhlEP3WW0AXnO2cCL0JL4lPqjUwfjl32EdQXlPpay/EImAz
	jwpz+KtOfwcZW5cBRNycL6FoJqIekTHvKv3+UK/Z9v75FrB73LNTJieAs7jx8FjBwU5y
	sJ7wM6MwCH9NtZG8Xm8XYlaNCyKoL/iuibhaJUh1jkXiK/+2pLqruJgWalAAiD0Idzh0
	aCGqjBrFarIXZza+vA/A4kgtztyMQNjfmjLnjgxqR4T8Y0GhxSbeS4aRL+NHw4xqZKJL
	1c1Q==
X-Gm-Message-State: AJcUukfR5xhfJA+2VV6MaG2liAknsdmyko3KA7o+MNVMiPC85ul054JH
	U4kByMe5gObQlVlwSUqdGwjGhw==
X-Received: by 2002:a17:902:b090:: with SMTP id
	p16mr59152015plr.190.1546815046394; 
	Sun, 06 Jan 2019 14:50:46 -0800 (PST)
Received: from cloudburst.lan
	(2001-44b8-2176-c800-8cc6-2630-7d99-5ef1.static.ipv6.internode.on.net.
	[2001:44b8:2176:c800:8cc6:2630:7d99:5ef1])
	by smtp.gmail.com with ESMTPSA id
	n78sm45905768pfk.19.2019.01.06.14.50.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 06 Jan 2019 14:50:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jan 2019 08:50:33 +1000
Message-Id: <20190106225035.5671-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190106225035.5671-1-richard.henderson@linaro.org>
References: <20190106225035.5671-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH 1/3] target/arm: Rely on optimization within
 tcg_gen_gvec_or
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YtOO7KqQz50F

Since we're now handling a == b generically, we no longer need
to do it by hand within target/arm/.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c |  6 +-----
 target/arm/translate-sve.c |  6 +-----
 target/arm/translate.c     | 12 +++---------
 3 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e1da1e4d6f..2d6f8c1b4f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10152,11 +10152,7 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
         gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_andc, 0);
         return;
     case 2: /* ORR */
-        if (rn == rm) { /* MOV */
-            gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_mov, 0);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_or, 0);
-        }
+        gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_or, 0);
         return;
     case 3: /* ORN */
         gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_orc, 0);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b15b615ceb..3a2eb51566 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -280,11 +280,7 @@ static bool trans_AND_zzz(DisasContext *s, arg_rrr_esz *a)
 
 static bool trans_ORR_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    if (a->rn == a->rm) { /* MOV */
-        return do_mov_z(s, a->rd, a->rn);
-    } else {
-        return do_vector3_z(s, tcg_gen_gvec_or, 0, a->rd, a->rn, a->rm);
-    }
+    return do_vector3_z(s, tcg_gen_gvec_or, 0, a->rd, a->rn, a->rm);
 }
 
 static bool trans_EOR_zzz(DisasContext *s, arg_rrr_esz *a)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7c4675ffd8..33b1860148 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6294,15 +6294,9 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 tcg_gen_gvec_andc(0, rd_ofs, rn_ofs, rm_ofs,
                                   vec_size, vec_size);
                 break;
-            case 2:
-                if (rn == rm) {
-                    /* VMOV */
-                    tcg_gen_gvec_mov(0, rd_ofs, rn_ofs, vec_size, vec_size);
-                } else {
-                    /* VORR */
-                    tcg_gen_gvec_or(0, rd_ofs, rn_ofs, rm_ofs,
-                                    vec_size, vec_size);
-                }
+            case 2: /* VORR */
+                tcg_gen_gvec_or(0, rd_ofs, rn_ofs, rm_ofs,
+                                vec_size, vec_size);
                 break;
             case 3: /* VORN */
                 tcg_gen_gvec_orc(0, rd_ofs, rn_ofs, rm_ofs,
-- 
2.17.2

