Received: by 10.223.172.38 with SMTP id v35csp1850646wrc;
        Fri, 8 Sep 2017 09:39:18 -0700 (PDT)
X-Received: by 10.55.113.4 with SMTP id m4mr4522171qkc.349.1504888757916;
        Fri, 08 Sep 2017 09:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504888757; cv=none;
        d=google.com; s=arc-20160816;
        b=apZ/La6WFpKAmqXmB6roCEA4bMSv1pLP5whuWLHmKyrPNPbKMFQgQM9xlUMqud773Y
         wXQCrTju0+HIwU2BGSUOo/2iQvJJf8m/00JBSgPp6rXjdTzLRL1Ehqejhys3Fl2CURsH
         BvLltn13ZBhEWKVqpKsHGdMCtYg6Qk3su02grVDO7FICDz2t5cG844Zd9hhYXfbM8V45
         2I2Sw2OZL6cD+CRRF4NAKqs6SJrsQHRnlK0YIIGnUU5KNIMQev2p03vZihKFcUSPv2l/
         3KOJHm6ET9xF1AyLrAXJUV9nNhrzSymUNM0K/YIASYSQr2+ybxojKcISX6K569+MiuGk
         XhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=idWlPc4sVNdDvysx4VVV5IIav5gIxi0kIVm3/FP7va4=;
        b=KiQjTqBKuUwefYWi6LPCNSbkXniUJ1MwlpdcIVVAx9LRAhs0XO0RRO5+t8lzlIKuGQ
         fcsTWvhVI7K7a1A+BvQizGQh9X9gUUzhjvnFAMdCukZ5SrHyPQiGKntuSqd/hcHvh197
         lA+/VJ+LD1OCDnaKWTIi496f7LH7JmnkaiG9xzVl2OfNJ6p7erlmP/obcFnxduYSCj7B
         eoZv/apEBppcqfJU1kXcNopCTdsWsM9dvK7nbrIfmU/VPbu73g7vC5bfO/yI25dVNrsP
         62NAMJ8/eGecziKS7ANgoaQBRWGMpz52+ahCBYlmYf/xnIrMqzCSir9kkt5RNoxmkS2H
         hObg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e/CVhD6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q37si2616888qtb.252.2017.09.08.09.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Sep 2017 09:39:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e/CVhD6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dqMJH-0005At-IC
	for alex.bennee@linaro.org; Fri, 08 Sep 2017 12:39:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dqMJA-00058P-6w
	for qemu-arm@nongnu.org; Fri, 08 Sep 2017 12:39:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dqMJ5-00060T-9U
	for qemu-arm@nongnu.org; Fri, 08 Sep 2017 12:39:08 -0400
Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d]:36793)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dqMJ5-00060A-3D
	for qemu-arm@nongnu.org; Fri, 08 Sep 2017 12:39:03 -0400
Received: by mail-pg0-x22d.google.com with SMTP id m9so5703416pgd.3
	for <qemu-arm@nongnu.org>; Fri, 08 Sep 2017 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=idWlPc4sVNdDvysx4VVV5IIav5gIxi0kIVm3/FP7va4=;
	b=e/CVhD6aqkDe6wMVmizPhVHg3J7CKlo4+sTYRXAwzjYgztBKVpmImupxTAF/HFFH2L
	DXx7UsMzeN1ubypgyZdh9TmOmUwp4tDcWVumX8EN1KX50lMoXDn1PGz9vhB01ouO/yBa
	7o5iFfpu6nrv+vmzAVZRi2u+d8ewFdXoh1rfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=idWlPc4sVNdDvysx4VVV5IIav5gIxi0kIVm3/FP7va4=;
	b=BaWt9o6S0Ke3DB+4AbyZpRQc5pntarjt6JUXUf0lOneBndRqA8SKw58BXVbVmDd/NQ
	4iALFZVdpWhirbZbOnTfwbBlVgKfKwQUhU1LMaXWIFJklxrQ9hizU4sUyR2Zq9Sw7f5w
	LqBmmxnBhVvHedRlUXI6Y/CjpwVc/KZRQDXYcy80gtLARbNGdWlXZVNhwK0m8M8ebBBF
	2ko3C//JLOsWS9uDEDH1+Y3m5a833x+QfqDy+i3t8dSB+8HUcOBgCKtjoRH+w6MMeWyb
	PJ0olfLGW/K0fnynpOVT6H1eSzodZsjOexpW3TxDbyNc83aj00vA85YIQes6bBPbp/2c
	MucQ==
X-Gm-Message-State: AHPjjUiO1ZJ9vnK5RP+KVIF6P6futgvVkAKFQg2u93liUOVTCeQBJvZI
	3/AFwl7VYhz9hpyp
X-Google-Smtp-Source: ADKCNb6777LaREK3n5kaLgWvOeRp7asd0YZMWmw9PeGZNBYSDi7tIqmjW9J1KFJ+u5ZAMEHME+Nqng==
X-Received: by 10.84.168.98 with SMTP id e89mr4084662plb.292.1504888741739;
	Fri, 08 Sep 2017 09:39:01 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	q28sm4515173pfj.77.2017.09.08.09.39.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 09:39:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  8 Sep 2017 09:38:59 -0700
Message-Id: <20170908163859.29820-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22d
Subject: [Qemu-arm] [PATCH] target/arm: Avoid an extra temporary for
 store_exclusive
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sCorB2VYXrrM

Instead of copying addr to a local temp, reuse the value (which we
have just compared as equal) already saved in cpu_exclusive_addr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9017e30510..114e21cc58 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1894,7 +1894,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
 }
 
 static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
-                                TCGv_i64 inaddr, int size, int is_pair)
+                                TCGv_i64 addr, int size, int is_pair)
 {
     /* if (env->exclusive_addr == addr && env->exclusive_val == [addr]
      *     && (!is_pair || env->exclusive_high == [addr + datasize])) {
@@ -1910,13 +1910,8 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
      */
     TCGLabel *fail_label = gen_new_label();
     TCGLabel *done_label = gen_new_label();
-    TCGv_i64 addr = tcg_temp_local_new_i64();
     TCGv_i64 tmp;
 
-    /* Copy input into a local temp so it is not trashed when the
-     * basic block ends at the branch insn.
-     */
-    tcg_gen_mov_i64(addr, inaddr);
     tcg_gen_brcond_i64(TCG_COND_NE, addr, cpu_exclusive_addr, fail_label);
 
     tmp = tcg_temp_new_i64();
@@ -1927,27 +1922,24 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
             } else {
                 tcg_gen_concat32_i64(tmp, cpu_reg(s, rt2), cpu_reg(s, rt));
             }
-            tcg_gen_atomic_cmpxchg_i64(tmp, addr, cpu_exclusive_val, tmp,
+            tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr,
+                                       cpu_exclusive_val, tmp,
                                        get_mem_index(s),
                                        MO_64 | MO_ALIGN | s->be_data);
             tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
         } else if (s->be_data == MO_LE) {
-            gen_helper_paired_cmpxchg64_le(tmp, cpu_env, addr, cpu_reg(s, rt),
-                                           cpu_reg(s, rt2));
+            gen_helper_paired_cmpxchg64_le(tmp, cpu_env, cpu_exclusive_addr,
+                                           cpu_reg(s, rt), cpu_reg(s, rt2));
         } else {
-            gen_helper_paired_cmpxchg64_be(tmp, cpu_env, addr, cpu_reg(s, rt),
-                                           cpu_reg(s, rt2));
+            gen_helper_paired_cmpxchg64_be(tmp, cpu_env, cpu_exclusive_addr,
+                                           cpu_reg(s, rt), cpu_reg(s, rt2));
         }
     } else {
-        TCGv_i64 val = cpu_reg(s, rt);
-        tcg_gen_atomic_cmpxchg_i64(tmp, addr, cpu_exclusive_val, val,
-                                   get_mem_index(s),
+        tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr, cpu_exclusive_val,
+                                   cpu_reg(s, rt), get_mem_index(s),
                                    size | MO_ALIGN | s->be_data);
         tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
     }
-
-    tcg_temp_free_i64(addr);
-
     tcg_gen_mov_i64(cpu_reg(s, rd), tmp);
     tcg_temp_free_i64(tmp);
     tcg_gen_br(done_label);
-- 
2.13.5

