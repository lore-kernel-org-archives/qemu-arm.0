Received: by 10.28.91.67 with SMTP id p64csp989601wmb;
        Wed, 28 Feb 2018 11:38:13 -0800 (PST)
X-Google-Smtp-Source: AG47ELscf7dhfA3Pgc6MDndybiTXb/Xsnr49+oCzhtBp/uS9P4oZ8bUuSrz/p+RXLUxCMW5XjFpX
X-Received: by 10.129.93.137 with SMTP id r131mr12933258ywb.56.1519846693889;
        Wed, 28 Feb 2018 11:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846693; cv=none;
        d=google.com; s=arc-20160816;
        b=gAxEIgn18pANl6CwVAzaAfH6ub2uOM8JVMjKrBRDy67/J8S2XL7RF7z3QkKzHgerQk
         56fJMhdCR+KBI11m5CWkuPHBM9p4H7B/5/RyD/nsL3mkrwoP1GOE4XQRizGja7FJkebt
         ozHdQ0su02DEiTOFCynk632+ylP7ghuhFaJG805p42FjOhgFWwgzutKiLyAxQ4TCZPJ5
         08O9woCIOIV4ckRYD2BOoMSrasZEQZfYQuc0e6EYLLroX8GesQ0VpryaDvAtIn+/MVXc
         pklMTGuWZDcJnor30qGV7NPwWKTxgm95EeY17f88zDULCfM7hsCbSFyQo5/LJR+sGcPV
         T5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uWNctFB6decpe82M6S7kdxtgGEuN6xi73BI0m6CkSkA=;
        b=Op03l4pzEwh/ECe4i3REW2QwHGOZMzF5fW3UZLDCFOx+62XCOwi39JBVtiGwmx49+i
         DDUK5/j3BttBjkMO79qHC76VniTcuybMQQr51XRdo4IOErj4BQ37xCPBPqtvnudNJ9F3
         nqt8p7aKclchvChJmtALFcXdlPAJrdHwgSJ3E27qW/yOEUgr/6huAB+/gVk22q+jKUX0
         HAVXCni/b1Ebf4Z/QDTROTFgE9FyFDJWyK6SqmikgT9Df3pZ5spJu+YO/y/08UJGzcge
         psQx/Y6oa8O4733oQV7ODq16/oFaRR1WO8S6kLrkAZHH4RO82zE0TkpqR6vUVcOpOTpL
         waZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X5Dxy+nE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1-v6si371745yba.152.2018.02.28.11.38.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:38:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X5Dxy+nE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7YL-00006Y-8E
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:38:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S3-0003Ph-C6
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S2-0006No-3K
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:43 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:40672)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7S1-0006Mp-UE
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:42 -0500
Received: by mail-pl0-x243.google.com with SMTP id i6-v6so2117553plt.7
	for <qemu-devel@nongnu.org>; Wed, 28 Feb 2018 11:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uWNctFB6decpe82M6S7kdxtgGEuN6xi73BI0m6CkSkA=;
	b=X5Dxy+nEvn/fd+ApQM4JVvbtSOZd4QYfaUKM/lzaxdEnxDK73WtCHmt2gK7F9/77Yf
	YdYrC94slOeBH7InUj17XrkE1o6QLcR+KCuTmhAvdoLZwQ4REucMDQ2n0odqmILLAqPk
	9MTzDRL0KARrkGeChqvjquFPVCdXqIraxxogE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uWNctFB6decpe82M6S7kdxtgGEuN6xi73BI0m6CkSkA=;
	b=HIV97QEkfBW+Fe3c+v/NtYwcDdhQW/W41QcnHrnD0PJWZ2JrplfLES2s1UA+oHzcFW
	trPudZ33LvbsWsM6y0YMg7WpaDKoADUdf+xUILRjwQazN3g/8agemfcGwaHUegUN8X18
	3y255QEyQY86SsJ8Ofj5OVcBz2Kfty9/inBddgelIRfsvxmnthlP8bu3d8mraKoRBRTQ
	myYlQ6gILyL+edFC+m/ftcB0F6dB72ITGEhUao70ThGNOBzOIMF/MFA36OcZXlyWR1fh
	STWHW7nuzFxAwU+SAxoyqgRMICDtzcMtekOpkAVkTLRPEDA1TzsqmeBs6M4ZOaAvYsrc
	wsWw==
X-Gm-Message-State: APf1xPAUazHujACrLrHBjY86/RDZzZolwi+6rcoP9xu1fwxoP6yTnKl1
	5bx+YifgJeOdyAmdlinP34JxdjXmO/I=
X-Received: by 2002:a17:902:b691:: with SMTP id
	c17-v6mr9582823pls.308.1519846300713; 
	Wed, 28 Feb 2018 11:31:40 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:18 -0800
Message-Id: <20180228193125.20577-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v3 09/16] target/arm: Enable ARM_FEATURE_V8_RDM
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /s8jsvuZeNpZ

Enable it for the "any" CPU used by *-linux-user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   | 1 +
 target/arm/cpu64.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b3ae62db6..ca5fb1162a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1650,6 +1650,7 @@ static void arm_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
     cpu->midr = 0xffffffff;
 }
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9743bdc8c3..7246866e7d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -230,6 +230,7 @@ static void aarch64_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
     set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
     cpu->dcz_blocksize = 7; /*  512 bytes */
-- 
2.14.3

