Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1329465ejc;
        Sat, 7 Jan 2023 18:51:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsvtDzGM3Dp87FuZQbW+1agyllEKAUgkwGhpjbUHuQ1v8epApjiULTcLEI7aH43aEMpDo2J
X-Received: by 2002:a05:622a:4acd:b0:3a6:9cfa:d6c with SMTP id fx13-20020a05622a4acd00b003a69cfa0d6cmr89378259qtb.39.1673146294813;
        Sat, 07 Jan 2023 18:51:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673146294; cv=none;
        d=google.com; s=arc-20160816;
        b=wNK13sWvvIsQQCgHECwh1Mp9U7xMBaqk0kKCrgLRjPW5GAehEDcuKBpYObU2HX5xVU
         8e/NECaNMXmUGhrH5z/qoLmjVXA4gwE2yGCd5+pNO4tEViv7iLFpSJnqOUQEE3br2i7K
         oDmsYZpyX5QfVFO4Qo+RiY/u6rdndsrMbtVFZwwYAhP+oqIyXgzqtYckUzA5YvnDhrl9
         rLWRG7B6EvT1sl2i8cEbSOeJlHKsTyG/Tt1MijrBjjxmBJ5/AAXf8QIGdqBN64VDtBlx
         ESMIvDbP7Wr3sJrElBYvJrhTpjEtARqdb1e82ObLQFV5+8+VcvSyn3O7A3/nRNPrMCwB
         eyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9ScRTiCetY4GULFmLSkWpnFNmGzWjdbMDLDjsbqu5fo=;
        b=POvOYJo1iEMwTOK8+21ncdSMDgn3IiBuzZXZ99rK62Q4VdESaSgzQJe48USlQwBNgq
         miPC/Me7ISUYLoHrLWRuMuuQLYmJ/wMaim7e60/38LwKJ66UBNM58SpIOIGKlcdVKnmV
         cFAg8v7kL8lrZwy/yak3GWK8bGq0cvA8GtHbAGTi/g/xjddIXkzAB6X8TCIm9VLMLDzH
         EOx1seLP4TEnoY/edNOdwumIc3ox7tN8RYjksOPNveDAqSYaLcOAbhcedJbXoA69v+Ds
         lz6htqul2YSIaf5+N9zcwz4LuQ8XViin76yl23PMso88mLD8qejw8s4JATlIMW5QW8kq
         Zrig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TOAXi5LN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs32-20020a05620a472000b006ff7b2f1985si2810730qkb.575.2023.01.07.18.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:51:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TOAXi5LN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pELak-0006ro-Au; Sat, 07 Jan 2023 21:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELaa-0006ht-VQ
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:39:13 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZQ-0004ns-6A
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:39:05 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 cp9-20020a17090afb8900b00226a934e0e5so8464567pjb.1
 for <qemu-arm@nongnu.org>; Sat, 07 Jan 2023 18:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ScRTiCetY4GULFmLSkWpnFNmGzWjdbMDLDjsbqu5fo=;
 b=TOAXi5LNjIeY1nkvmNKr1LLyMMYFpHORFQuq1LndUTcqcW19FupH/WNFkTSqWN4rLE
 4wt69j5xi2rQiFDqzem5zig+c29iLZJ3+RjDM4qc0pGvl0RBfz5lt/FgLanpFmqCMnVe
 PozALU5VBxd7h63o5rnKun4r2UJG/Wy2z0TlXW7JJRWi9wle9q9/gq05rab5xS7J1Gjw
 93X6ifPoHPkeQy5TEZmmbUb3P0BufSHolivO079loX6zKFFFQM6E3Uvl4A4rLZ/DhVlz
 OJbGCtNekzyKOBmqHMtlCB+qWSqO+ZvqbLTVvFBXDigWzanuETn8rNH70KE30/ywiPds
 AbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ScRTiCetY4GULFmLSkWpnFNmGzWjdbMDLDjsbqu5fo=;
 b=f12MeLKyGNJbvhvA0AwPUEkan/YugYarjz1s2GavOvSSVc87CyssdsWEZfYJrXcfhD
 u8ucDeM632fjpnJMPrFMXNoIaSkznoL0r2PeFRlUzIZvGc5jrBXku+pY6FhGzqnxBfop
 uSF5+qW4SKuCH6gIWbvmt4vCnWG26u5477gc7bSXr6LN+6xbRS1khBVng+34ZNQlJyc2
 wTcBpjXCiYHzrQO1IFHerpxChX4GDy3V+m3si55UlhiW54o26sRMnKvdh2N+ZOsYpUuj
 XIAVVqk6lPxAAH0ROLtvSnJ43BLCe3Rc9Jf6vgBLFnYGu/wYRhB0nnxWIepGaxJ0dbvt
 TlMg==
X-Gm-Message-State: AFqh2kqKByHPVrQLPINg3d9w5Oo1gHPDyZPpb4Y5RyDRV4pp/8InK2fo
 fGIZaWDOnFe3N2mkUguLDZzR0A==
X-Received: by 2002:a17:902:cf09:b0:191:3e64:a5ff with SMTP id
 i9-20020a170902cf0900b001913e64a5ffmr83605253plg.68.1673145479006; 
 Sat, 07 Jan 2023 18:37:59 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 34/36] target/i386: Split out gen_cmpxchg8b, gen_cmpxchg16b
Date: Sat,  7 Jan 2023 18:37:17 -0800
Message-Id: <20230108023719.2466341-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k5jESNCkhRjP

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 48 ++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7e0b2a709a..a82131d635 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2993,6 +2993,34 @@ static void gen_sty_env_A0(DisasContext *s, int offset, bool align)
 #include "emit.c.inc"
 #include "decode-new.c.inc"
 
+static void gen_cmpxchg8b(DisasContext *s, CPUX86State *env, int modrm)
+{
+    gen_lea_modrm(env, s, modrm);
+
+    if ((s->prefix & PREFIX_LOCK) &&
+        (tb_cflags(s->base.tb) & CF_PARALLEL)) {
+        gen_helper_cmpxchg8b(cpu_env, s->A0);
+    } else {
+        gen_helper_cmpxchg8b_unlocked(cpu_env, s->A0);
+    }
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
+#ifdef TARGET_X86_64
+static void gen_cmpxchg16b(DisasContext *s, CPUX86State *env, int modrm)
+{
+    gen_lea_modrm(env, s, modrm);
+
+    if ((s->prefix & PREFIX_LOCK) &&
+        (tb_cflags(s->base.tb) & CF_PARALLEL)) {
+        gen_helper_cmpxchg16b(cpu_env, s->A0);
+    } else {
+        gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
+    }
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+#endif
+
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
 static bool disas_insn(DisasContext *s, CPUState *cpu)
@@ -3844,28 +3872,14 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 if (!(s->cpuid_ext_features & CPUID_EXT_CX16)) {
                     goto illegal_op;
                 }
-                gen_lea_modrm(env, s, modrm);
-                if ((s->prefix & PREFIX_LOCK) &&
-                    (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-                    gen_helper_cmpxchg16b(cpu_env, s->A0);
-                } else {
-                    gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
-                }
-                set_cc_op(s, CC_OP_EFLAGS);
+                gen_cmpxchg16b(s, env, modrm);
                 break;
             }
-#endif        
+#endif
             if (!(s->cpuid_features & CPUID_CX8)) {
                 goto illegal_op;
             }
-            gen_lea_modrm(env, s, modrm);
-            if ((s->prefix & PREFIX_LOCK) &&
-                (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-                gen_helper_cmpxchg8b(cpu_env, s->A0);
-            } else {
-                gen_helper_cmpxchg8b_unlocked(cpu_env, s->A0);
-            }
-            set_cc_op(s, CC_OP_EFLAGS);
+            gen_cmpxchg8b(s, env, modrm);
             break;
 
         case 7: /* RDSEED */
-- 
2.34.1

