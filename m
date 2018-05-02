Received: by 10.28.4.212 with SMTP id 203csp1222596wme;
        Wed, 2 May 2018 15:20:03 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpnwM9yTrasem6H0KN0wHlPT99xCZ2HCHTrLyA/lOi2uH3zS2eOXk9uYSxdqOM7hDPoV8Vy
X-Received: by 2002:aed:2805:: with SMTP id r5-v6mr18178660qtd.28.1525299603824;
        Wed, 02 May 2018 15:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299603; cv=none;
        d=google.com; s=arc-20160816;
        b=w0OQVGasqchNQVrMEK4MGkdtTWkY9Sd5SBkGKfjvfGWbBSfrKr7sGV4WdSH517ke4x
         +PaKauOM7BeTwgYPGx81kNYi4MTImgzQaZGmW52+XKkZG1JvzDZejT/vbsXlwHAglAVv
         KEPw+ReKq+QoTLhuDG6Q1EMQWpT12e0Tn35iFpunJmz5KWgEcPYb+8cq5yoj6XTVth4e
         IyEGljuntvEwEMIs5YxS+NyJ8Ax/hX42RHUMFThx49TKHBYu+Sv77YcvUbLFH/CJWQKv
         Vmx4OfznYOKzBe+Y96tZ4d5UEURbb8bLj6+YLz7zbxGlqSZRBP/Qrfk0cuAXiKZWO0ER
         m7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=WwqWFnklKjiIuffvTXcb3kCGinNAr4T/DUG63Bdts3w=;
        b=WNb6pcO+KK94FOxTSgO9a383UuT/K1VMI0TbXNYgURpeomwFk9jrVZGeU+8/tGigaT
         Qalh6q1na0ur6JByQnK0Fc349+sgRwPE4O83gq4cRsRr4fjdfwE64huqT91ssTt06HMk
         jK9wXkleRYBHlHk4WaNoGteST6Y0jaRDga7ChCvv/jFsWsSwclPmrHGu2p0IeIwklKM8
         rwAjZfgIEzAcGCgk+fycfeO2H39wtE9RCuViC2D5jeixC81iklTg5XQPTQOhpvrR1eQj
         7ioU94+qLPK4BH3evfO2m+2NXV8IaoF3/H72fzolSmxTl0JzmzJXEQ2KGIwyOqzx1rEE
         ha9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a5N2jNNj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s124si2268377qke.400.2018.05.02.15.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 15:20:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a5N2jNNj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fE06V-0003Kv-C7
	for alex.bennee@linaro.org; Wed, 02 May 2018 18:20:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02d-0000e3-6m
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02c-0007tB-9o
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:03 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:45655)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fE02c-0007sZ-4M
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:02 -0400
Received: by mail-pf0-x241.google.com with SMTP id c10so12951552pfi.12
	for <qemu-arm@nongnu.org>; Wed, 02 May 2018 15:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WwqWFnklKjiIuffvTXcb3kCGinNAr4T/DUG63Bdts3w=;
	b=a5N2jNNj+fXoT9hLC83Eyxc2IWCv6rCTxhDJjcPO3+OfocOxmBvRUuYrB51fIriE22
	jQ8FMNWLZvK1o8x23nUrzQPllbnqGU/wblJqZZeD/1OsCj7pa05sPiwnV2dYf8zsFeDj
	h9wDNh43AjydGfcplR7S+wxxBqgfuV76Q8Ih4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WwqWFnklKjiIuffvTXcb3kCGinNAr4T/DUG63Bdts3w=;
	b=fxtyGgDslRGFRqCjUhvzTACX5Viky4Be2iC8yh0B9ji+zqcg+H/DDZgiX1sfHhB/lX
	yhFiA2KewZsWK3sJrWDtKkvdhno0ItvVh7vsW1Mc0dvGWefq+2egHmnV3YtdUY/LVRsu
	lEB1f7DoT8UwZuT3jfeuRI+bnU9m/8mqNVl0Ql0GCHHLj4OZ8x5dIf6pKWzhjefukLqO
	3VzWdLAFwgdDZkv03CU2owxVDxZ8vSSRDApmyt+ZVdJzYkQrYx7AiwlHJUpWVBNPQXeZ
	pthFrS5/LtOusGNZXbwheDXji9mudeKIG/PZba3rLDb7jHDrFqz4LUwRXO7TebL9TjJH
	8xmQ==
X-Gm-Message-State: ALQs6tCTKWHIkB2YYyZfpUGNKIvD4qAVoQUeGdsbHJR1VRe+qijpeOH/
	kFVCMf2tV73bC+5tXJ5eINJ/VA==
X-Received: by 10.98.201.92 with SMTP id k89mr20787451pfg.47.1525299361286;
	Wed, 02 May 2018 15:16:01 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	65sm26170145pft.74.2018.05.02.15.16.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 15:16:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  2 May 2018 15:15:43 -0700
Message-Id: <20180502221552.3873-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 05/14] target/arm: Implement FMOV (general)
 for fp16
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OlmXpxqXzmtD

Adding the fp16 moves to/from general registers.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c64c3ed99d..247a4f0cce 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5463,6 +5463,15 @@ static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
             tcg_gen_st_i64(tcg_rn, cpu_env, fp_reg_hi_offset(s, rd));
             clear_vec_high(s, true, rd);
             break;
+        case 3:
+            /* 16 bit */
+            tmp = tcg_temp_new_i64();
+            tcg_gen_ext16u_i64(tmp, tcg_rn);
+            write_fp_dreg(s, rd, tmp);
+            tcg_temp_free_i64(tmp);
+            break;
+        default:
+            g_assert_not_reached();
         }
     } else {
         TCGv_i64 tcg_rd = cpu_reg(s, rd);
@@ -5480,6 +5489,12 @@ static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
             /* 64 bits from top half */
             tcg_gen_ld_i64(tcg_rd, cpu_env, fp_reg_hi_offset(s, rn));
             break;
+        case 3:
+            /* 16 bit */
+            tcg_gen_ld16u_i64(tcg_rd, cpu_env, fp_reg_offset(s, rn, MO_16));
+            break;
+        default:
+            g_assert_not_reached();
         }
     }
 }
@@ -5519,10 +5534,15 @@ static void disas_fp_int_conv(DisasContext *s, uint32_t insn)
         case 0xa: /* 64 bit */
         case 0xd: /* 64 bit to top half of quad */
             break;
+        case 0x6: /* 16-bit */
+            if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+                break;
+            }
+            /* fallthru */
         default:
             /* all other sf/type/rmode combinations are invalid */
             unallocated_encoding(s);
-            break;
+            return;
         }
 
         if (!fp_access_check(s)) {
-- 
2.14.3

