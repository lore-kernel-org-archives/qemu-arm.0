Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2535890wrt;
        Sun, 13 Jan 2019 17:20:55 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5KV+o0xecCu18yLaT1Wh6k0Dulob30j0+nQRCuifxRdgYkSQLFim57kIcPl5ArGFOmJlOk
X-Received: by 2002:a1c:ac42:: with SMTP id v63mr9509343wme.119.1547428854972;
        Sun, 13 Jan 2019 17:20:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428854; cv=none;
        d=google.com; s=arc-20160816;
        b=DrRM9ThXBwhyiGQ3fyvH1EvhVu90FUZfaahpQ4NO/c9rWAbzQVeaRqXvgVRdAxkir9
         zjJKnsRqeMFRnkLP9VVsDuGnrlCYyTM5bRyJRr6m0SsFhpwkuM6ntItzysaxa6LorNEp
         sVp7UF9uHyn8da8H8aZuA9FNFR31UH8iESr7a3vNrQ87kHFJHzK6Hbs7QTi2PA1gjUhi
         GDABVowed9ZSdHKWwwX6ZtFoxkn8C7Vfg22aP2OOBQmZoIM8BGWvaE7lyzCC+GsR1e+e
         5sdVQMeegic1CBVSJMyNyrknEd8QHOzZgA8tjQLmffZKdwKJtfRZc/FULM1ydwM7L3Li
         l07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=9sPdVbj9dZn6pAYd1DuwtQyLD564k7UzO/H76KQKWTg=;
        b=JEhPNAXGV6NjObAoFpfexUMnXSZOolAtmkic7Fl30RgAXQoiOP/eGBNXcnop+d6+4c
         8XMGc34f5VPMApSi2udAkpd0++gKxx/dCNP/iFl4QCjN2IsPUrQAwMJJoslAutB9LVFc
         /9je0kTswduUJitg3nW+uihrB6sbhjlLrO8kB+uwL6gKcoRIH7A/7JN/4n2z4NMmlK4W
         NMvz7YBT/dQgaxQmN2U/GroCfqXNCSIrGk1KZRlcKCyhvg+QDv1nuUBc2AsUR2pcNgri
         7tyb6ybkniJKXt+0CLx+sBdbVIKi0e5g64paO3isjC5NkQ0iAWfUMDg7hBMhisMh0Kc+
         d8VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="h5O/EScv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 64si17772621wmb.190.2019.01.13.17.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:20:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="h5O/EScv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqvt-0003fu-Up
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:20:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnH-0005gN-8a
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnG-0000x3-Ia
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:59 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38310)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqnG-0000vd-DE
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:58 -0500
Received: by mail-pg1-x543.google.com with SMTP id g189so8738527pgc.5
	for <qemu-devel@nongnu.org>; Sun, 13 Jan 2019 17:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9sPdVbj9dZn6pAYd1DuwtQyLD564k7UzO/H76KQKWTg=;
	b=h5O/EScvfNzM+AhthVKf9PITJYqLSowqsuPE7s+Vw0zkSYTpmbF+dM1pkW+YmtRfok
	6RJ8ZTkXme3Rjdc8V79/2knU4TjiyzRIxp2hwEsQZ9n6bzuNjPi+QzfAWIntrvM4K5B2
	so/tWK4cIOikX3caPovNUOltOs6klTtHPJAos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9sPdVbj9dZn6pAYd1DuwtQyLD564k7UzO/H76KQKWTg=;
	b=aY7YvdPJUNp+vn5WHmK3WtDLoC7bR+z4Lms/0wr0RmiXejsYMb6ZWKcURUaxhJ0/QV
	nR9LDoRyEGYJ9+O+SIlByDx+ixjHRjOJJY/o/uo1IQg9FvKk2rNJUVBqx4p6Faa42cb4
	GYKDPlmTb/1JJr8LCn2vK1rOQ2Dd2H3xUfbCW6DFWhssXjHgeWX6ri5xo4qJJBIjxmO6
	mLiCO3BaQ5XO5oHK7ALg2pdngVHeUMMMiahBuayhhmY3tuJHv1Tw0tKmv4tZPQCVPj/7
	O0ZE8iER16rqxK3bTnkKokiN96PYwg5t4QlhKcdtYIwFdYpygUReDO2ONfYzFyEZMlPH
	+8Tw==
X-Gm-Message-State: AJcUukepY/s9ogBuX4ropAqb6KzE9U8ZJqMGOCJiydOkJSxwkAAyCJVP
	9A30DQ70qfs4xLR1mV5VA5g6yaAf2N9JCQ==
X-Received: by 2002:aa7:8354:: with SMTP id z20mr23059498pfm.81.1547428317101; 
	Sun, 13 Jan 2019 17:11:57 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.11.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:11:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:13 +1100
Message-Id: <20190114011122.5995-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH 08/17] target/arm: Implement the GMI instruction
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
X-TUID: M5H41LEmJ2+T

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    | 1 +
 target/arm/mte_helper.c    | 6 ++++++
 target/arm/translate-a64.c | 6 ++++++
 3 files changed, 13 insertions(+)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 47577207b2..ef340cb6f9 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -107,3 +107,4 @@ DEF_HELPER_FLAGS_2(mte_check, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
 DEF_HELPER_FLAGS_4(subg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
+DEF_HELPER_FLAGS_2(gmi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index e2b1a5dd40..2f6ac45150 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -197,3 +197,9 @@ uint64_t HELPER(subg)(CPUARMState *env, uint64_t ptr,
     offset <<= LOG2_TAG_GRANULE;
     return address_with_allocation_tag(ptr - offset, rtag);
 }
+
+uint64_t HELPER(gmi)(uint64_t ptr, uint64_t mask)
+{
+    int tag = allocation_tag_from_addr(ptr);
+    return mask | (1ULL << tag);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 879d6b8d46..6583ad93b1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5137,6 +5137,12 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
         gen_helper_irg(cpu_reg_sp(s, rd), cpu_env,
                        cpu_reg_sp(s, rn), cpu_reg(s, rm));
         break;
+    case 5: /* GMI */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        }
+        gen_helper_gmi(cpu_reg(s, rd), cpu_reg_sp(s, rn), cpu_reg(s, rm));
+        break;
     case 8: /* LSLV */
         handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
         break;
-- 
2.17.2

