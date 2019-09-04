Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1147451wrp;
        Wed, 4 Sep 2019 13:09:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyo74Ue8FOqSOc+fiJyYYCfGwS7iU4ggWJJf3U/vKvfOubfO1FHeRoSOr6P8zLrH+qOCx+I
X-Received: by 2002:a37:9582:: with SMTP id x124mr40971523qkd.269.1567627781703;
        Wed, 04 Sep 2019 13:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627781; cv=none;
        d=google.com; s=arc-20160816;
        b=kEWpV090Pq4frszRyM1fnCU6G6SHsMyvujhq8ae1r4SNfPFcunG7Vn29rD1lsiut6N
         5gnuI+t+YuMHp/fJVvT0mMgFdQa5JaI/1s0JfuqCgZSQkCxPdoVL7VH1Iob0Vl/lPcVu
         q+0qvHjMrP3TejQGfBrfVzzJrtjSOaIrvtbDrF6CFSojywW0h1JzHf/6ePaSqNWuoh8m
         b7IIMmOA3tbT0USLorgJbN5ACxHnGFVZLIkOMBbT58PmPa5tMPorYkYVcM4qsrLDLw7g
         wtC/9SnZI0JBpE+Si76VLTjVhFjKNVDRl3qQyriBE9UGgbMXbYh8R0n3zLiDBVxCJs1K
         u09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=O4gGKTm/ojsMEGeGW6yunfSWJTb8afl4fLManLOK4Wg=;
        b=NNf19aXacPtzRDDKDLV0HfIrl7PRQW3vpqSf12BayGUXbt559818htv1NJI89JxR8M
         bpPqee8HmRY2+gm/78v656bEEXP4Z+Qw0D2Rdut5Eswwgy0TfmJpVX08mvODdruvoFKY
         zoJpAqLEJgHSzSdkt4eWx17aLCBavBT6zVSJ6eg4vBB6tDf1+0LUB1dSHkgiMdOVsTWU
         zACcfFKdmF3Pa7ktOU+8MZQRqyN8s9HVacXKrJPrd5qzxb83orTZiqg4zYzDFxtJYcOl
         B7bR3LAtx4ZZxAGgZ46yDRvTYtT1hNmYyqsI2aa5BkddZththI61DSzHW2lzk3gWbLgY
         ZMKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LVsmspge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f35si3345345qtb.181.2019.09.04.13.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:09:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LVsmspge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bb2-00044I-Rs
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0W-0005BL-HS
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0S-0002mA-Rh
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:56 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44455)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0S-0002kt-HF
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:52 -0400
Received: by mail-pf1-x444.google.com with SMTP id q21so8878885pfn.11
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O4gGKTm/ojsMEGeGW6yunfSWJTb8afl4fLManLOK4Wg=;
 b=LVsmspgeMt2rLJPKUlsfm/Y52JzVPCRKttgmM7YSTSsgJPmkj7X42e3ck+w0f8t400
 /tdv3onZKJHBOXqLAc7scRdPXNfJu5H57q/wlgE/sCfRMmvhWifcRgZBOSnR7sDDOagL
 kqGH4i5gnl88GzpEhYpXnp3x1XhEatKCt/ihxfutVRTORAZr8pepxJv5qjkbpSChZIvP
 sVy+ZpYPyu/ulXv0uZVzhlUQBVfQtpO1MFDUpi+pXSZ2rIQH3OlvvCuj3+vy6Pc8wnBO
 kqDb83ZP2wVKT7U1TSiJv2rzWJdD3wZZbdBJ1GIvB4FQ9ll9KU36P9xyicNYkRl+SZG9
 +IMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O4gGKTm/ojsMEGeGW6yunfSWJTb8afl4fLManLOK4Wg=;
 b=E6YWeUrDnWZ+YwUNtg+X3tGFPnz4pfN00/bbo4zuFcH5ZtdkH2pPO5rpagOU92fPD9
 /erWOw4oNyTb4I+dFVoxVqnjqGrnWS8q8I8se+T2NbkMZ3A6IUkIsYiAYEkuhefm6OOO
 9W5c/WrZNYqR8GeR8llk0Of22am2+atn76SL/3xA1Ob49fAa4xmcpUH8e+3T+uLGDisD
 28muv9TgsielINLiKHgwdBQIlSgTIwmIvrw/bo6p7l2u2KowzTEj6YE3nvySd60Xy7ZR
 MNPZUTKDl4+BfOkxWL0u2QMBBn5yjILjCZe9Uc8cG/hJua6GxFh7LDKjnh+4vEsvoF2+
 B8iw==
X-Gm-Message-State: APjAAAUQ4p2K/BuzU/2CS7XsKwDPx+EA8r3wC3e6mSc9ell8JYfAQQIX
 fEzod3GB62xnrQuBFdqAMBwOsw==
X-Received: by 2002:a17:90a:da04:: with SMTP id
 e4mr6944783pjv.116.1567625511403; 
 Wed, 04 Sep 2019 12:31:51 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:29 -0700
Message-Id: <20190904193059.26202-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v4 39/69] target/arm: Convert Unallocated memory
 hint
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PIo5RajtV5NP

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 8 --------
 target/arm/a32-uncond.decode | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3f02532d12..7023ee78f1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10332,14 +10332,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             return;
         }
-        if (((insn & 0x0f700000) == 0x04100000) ||
-            ((insn & 0x0f700010) == 0x06100000)) {
-            if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
-                goto illegal_op;
-            }
-            return; /* v7MP: Unallocated memory hint: must NOP */
-        }
-
         if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index ddc5edfa5e..60ccfc598d 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -64,3 +64,11 @@ PLI              1111 0100 -101 ---- 1111 ---- ---- ----    # (imm, lit) 7
 PLD              1111 0111 -101 ---- 1111 ----- -- 0 ----   # (register) 5te
 PLDW             1111 0111 -001 ---- 1111 ----- -- 0 ----   # (register) 7mp
 PLI              1111 0110 -101 ---- 1111 ----- -- 0 ----   # (register) 7
+
+# Unallocated memory hints
+#
+# Since these are v7MP nops, and PLDW is v7MP and implemented as nop,
+# (ab)use the PLDW helper.
+
+PLDW             1111 0100 -001 ---- ---- ---- ---- ----
+PLDW             1111 0110 -001 ---- ---- ---- ---0 ----
-- 
2.17.1

