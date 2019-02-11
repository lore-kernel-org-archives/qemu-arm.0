Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp115526wrp;
        Mon, 11 Feb 2019 16:09:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib4nbX+ukSu0Ukaat54BWctxDtMZSNJvXReN7Fj9WUuhjpYRFT9YO9epXeQqrWeduA9GEy1
X-Received: by 2002:a25:a243:: with SMTP id b61mr675924ybi.386.1549930146969;
        Mon, 11 Feb 2019 16:09:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549930146; cv=none;
        d=google.com; s=arc-20160816;
        b=ChGvXVpqahOswOU5V4HDBmn4ulI6P3G9Oh/oi7VDvNt9rL9CSoXG/35D1b3qmT1koQ
         Lm4URm0ZBBjj7tuzp1yx3QHmzPaBSvCbTugvWmMvz+qUu/3mVatJu4uPRnsO76qknObL
         wxTayJQPA2PfBP8zGSLtzn8nK7WgMI34u/vJ4SF3lyiKrf9eAj0Q2eKy/A1CPyX+dm7s
         ANizbEVXvEVWynjGOi9l469xN6JuoDxR8qW0bb3G/Ia6Ps7fpHt6edjqxTJHsvHuAgOT
         0wcQXodF4CoZkfvdMsxDoSoghdWta+zcPDCWwA7bCjt3beHCKLDOnlplUL573n5a/W4C
         30gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=LWxa4SdRrRFSzqAYYwVZGn5VC6YR+GvJScUZbustbPM=;
        b=iIop4YDSl/7QpveDOeVUPwh+cHgckqbIvw+NalJ1PbQcSLToYglq0LN4iBWkTGfl3Z
         JwLQqFEWantAH3XZ+o1ZkBOd4kLTsB2xsS8EG7htRyLX/0bsqXboqqsk+fT16YdSEgOB
         Ibinl7Xzt7mNoLbJ8DHLzC/DczxZ5ArAwsU5H2KPplB3ryhOTOTAaTEUloWMBN9k2ndT
         Gegc2alLxnqDSHN/1/vg3nFSmzk6Tid29izPZwkcyqyUq9uIhKgpe9bqGRm5hMj9OhJO
         l9vd91qtKbg9Pu9J9Fuuh5gEWUBB0EiWxiWg1fTiBt3bt8GEWLd7gv77O7Y9V/MjQE8D
         m/ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ogABBZcs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si6284339ybc.471.2019.02.11.16.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:09:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ogABBZcs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLdK-00008l-7D
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:09:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOi-0005ss-8Z
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:54:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOg-00053O-6W
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:54:00 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOf-0004Z9-Dw
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:57 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c123so349260pfb.0
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LWxa4SdRrRFSzqAYYwVZGn5VC6YR+GvJScUZbustbPM=;
	b=ogABBZcs8PZBJH1JB9jQX5ncpGPvZ4br995Vp4ZgqWf7yMP+7qwwjljC5qlt5D79rA
	bfIx18seQ2YUOW6kUniFjzVF92TkVKg/3RJ/i8VkUuGMwsN0bIUvmsvz+UkHneuUn0pA
	4+jSffFZkD3bdh4wrGrgX1Vz85NoeWmHYrrVW8GgLt7ImM//zOzs7QzMJJ66jj8wwsJk
	ITyGjcBQN2EBOmLpxxAZlywSIIsyOVjUFeoeBsMh3YWDWHOXOOxWTXIM4FaO6kpOwVgV
	m0iNSpXk6NvfLBN+WDkzGnBrMywu9fmdC/TI3aMQhjH/BLBko3ueLL8eBQQ0VoeLkw0l
	RhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LWxa4SdRrRFSzqAYYwVZGn5VC6YR+GvJScUZbustbPM=;
	b=qOCIFpmReg0slAMljHspwyd0YwEc0X9MumNgaZ2+bABil4lj/VQNmqKYSgUFdoYPUX
	eM0lzPKj5ca3m8U0DvLN2JImBMIjNzRnEQZG0L+zk9hY0qwuoM5TV4YW4GdXVoQUQCEE
	nEVC+mp7tZWa06ErT5aeUd9sGXWfFQhGevGxpKUIIwAWvTlTDqqns1M5y7H31X+KyRn5
	AHmU/l/HiRkiIX5sBFRiPNnD9BSYkGVP9S5z70seyyg+03QZuZM264BZ0Kq7rid6Ookm
	C3cjW3vNV/LipEmzjfYRwguRPFimv1JWpLmFQUhZ9yJbVqtPt8jIzhkSgfduDFxWaGxp
	eOyQ==
X-Gm-Message-State: AHQUAuYbhIG3DElF3HMOwt5xt/aEzDtsash0IQ20YC7dEFhfUetvbNfZ
	7LHG2jVu0MZPYpfAue88ThKG1erwmnc=
X-Received: by 2002:a63:fa48:: with SMTP id g8mr816363pgk.203.1549929208576;
	Mon, 11 Feb 2019 15:53:28 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:51 -0800
Message-Id: <20190211235258.542-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42a
Subject: [Qemu-devel] [PATCH v3 21/28] target/arm: Set PSTATE.TCO on
 exception entry
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
X-TUID: qoh665ErSfg3

R0085 specifies that exception handlers begin with tag checks overridden.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Only set if MTE feature present.
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f17e045706..b979ca0255 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9476,6 +9476,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     target_ulong addr = env->cp15.vbar_el[new_el];
     unsigned int new_mode = aarch64_pstate_mode(new_el, true);
     unsigned int cur_el = arm_current_el(env);
+    unsigned int new_pstate;
 
     /*
      * Note that new_el can never be 0.  If cur_el is 0, then
@@ -9569,7 +9570,11 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
                   env->elr_el[new_el]);
 
-    pstate_write(env, PSTATE_DAIF | new_mode);
+    new_pstate = new_mode | PSTATE_DAIF;
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        new_pstate |= PSTATE_TCO;
+    }
+    pstate_write(env, new_pstate);
     env->aarch64 = 1;
     aarch64_restore_sp(env, new_el);
 
-- 
2.17.2

