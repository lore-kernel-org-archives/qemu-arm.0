Received: by 10.28.91.67 with SMTP id p64csp991457wmb;
        Wed, 28 Feb 2018 11:40:26 -0800 (PST)
X-Google-Smtp-Source: AG47ELtdIabpo9VoP7sNUC5iAAww0zPPJlCktk38UNq9M0FOHT2AHsHkGYPSepdzRSEYmWrbmqyI
X-Received: by 2002:a25:5f41:: with SMTP id h1-v6mr12697191ybm.319.1519846826533;
        Wed, 28 Feb 2018 11:40:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846826; cv=none;
        d=google.com; s=arc-20160816;
        b=Z64TJlHNKuAIXr2+S/NHPnY9gDGctFMcnC97yDecPzOfLktwZzgxERH9xuWREe13f0
         ED4YLXwftk6bBTR6b3uRMi0ozGwRPBxP+ERseKF+fzRmPBkJoxFh4N0Qd3v7KFDOlXer
         prQtbypCeQNuO+/mriaZvY2qc8Vi2M4m/BScrSSbHZ/ntV59aY7Ug2JTys+mqNUGT3WJ
         EI9ercpiiLKjh6Nhli7yyiEKDrRIAb8dF0IVISMQrFao352Og2gKYftCpmG5ivjcs9jG
         avKAbogGxQx6m4WPcS5PtgHhx2ECl5o/7IsVwqWQYJ9IcD6+BigjvHmLt7IJmw2q+OcP
         X80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6tTd5rziva4Db2NHAtyuaXfDAQYshirVeyQ6cgwAcZ8=;
        b=i42Ldn9CEUAGqYZyhsTKv5mVVxGWyTZii4qffXKuwfwQpjTsmLeDrV5/XDlyLBh6en
         8Kh5ueeQcJfuAuCtRnVLOnGYra7kBYdw2Z4I+a0PF22azVW0xBF/sI+4c+HmYaUZcY2i
         x+e2XgQkZC927yvx3hql7bCR/8O+7H4bxhstv7TetSI7eEx3AKi3nQkbjMycS9EihIij
         2lCbgE8BOptFs4+Neken1bLhPMi7tr3sBWJfyrlHUc7hWcF6Na99kXoAdPp54lY/MoA0
         HbcF9/W4hr4TGsJj3o06xl/50a5riWJHGq7BbTMWw9ejWYd45sSeL1e7SRRHHXlrvgJ4
         nacw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RRvhdOoz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b199-v6si370372ybg.753.2018.02.28.11.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:40:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RRvhdOoz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7aT-0002RX-Vk
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:40:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S4-0003Q6-18
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S3-0006Oj-1T
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:44 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:32931)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7S2-0006OB-Rx
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:42 -0500
Received: by mail-pl0-x242.google.com with SMTP id c11-v6so2132454plo.0
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 11:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6tTd5rziva4Db2NHAtyuaXfDAQYshirVeyQ6cgwAcZ8=;
	b=RRvhdOozlM03zEnuu9VLGuh/RV1VITf7TDFZ5ItXGNx56aWE7jGJ9diJPVoh93XENU
	eUoItbiuMA33+lKklK1FYoO6eeGgnr0N/Gwm15csaxPrtSRw55pZCUHvpkvwFuacyPax
	TifYfmbFviVAlJKUbgV8juOR1fRajqihjrWyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6tTd5rziva4Db2NHAtyuaXfDAQYshirVeyQ6cgwAcZ8=;
	b=ek2z2FlkkH74LxClZO7ArZjkP6ALt93c1kqE9wzgJeuIK5FLTgd/ZeTLwRxso9BTmi
	sDcpjp7mhec+yxoRCqSg9bE84VsXASESO+9HChPGVu/b/qJWCNImrXdnlyMtndzqN0pL
	84ME6h+844lgA9DuytGgVj1K3OHWW4tFBOxCKQKlDrpo0fp6MYkipQry1G1uMfw4Lo9X
	4uSulX2YCRAiLYXbIrDwhjwmkAD3o4YTi8AakQsBXB6pNVKXuzCItd68DTRT1F6OZq4y
	5J2tEjIluxtJQyVwv7A9p+w+vthA0MTDUuglIh3Yko4wp4qWRveRWkG0MSH/ISmtD0F4
	ANiA==
X-Gm-Message-State: APf1xPC29NN3eWByX+M0iCw02QTB14luKxd1Tv2Sb/e95g4KpcQZYS7V
	fRATEEvJHQhqQosdkU53c92tTg==
X-Received: by 2002:a17:902:2e04:: with SMTP id
	q4-v6mr18904468plb.22.1519846301965; 
	Wed, 28 Feb 2018 11:31:41 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:19 -0800
Message-Id: <20180228193125.20577-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v3 10/16] target/arm: Add ARM_FEATURE_V8_FCMA
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C10HgLRO+jGS

Not enabled anywhere yet.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 +
 linux-user/elfload.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7c8e87544a..f67f357724 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1429,6 +1429,7 @@ enum arm_features {
     ARM_FEATURE_V8_SM4, /* implements SM4 part of v8 Crypto Extensions */
     ARM_FEATURE_V8_RDM, /* implements v8.1 simd round multiply */
     ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
+    ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 63cadae1b4..3ead6ed807 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -552,6 +552,7 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE(ARM_FEATURE_V8_SM4, ARM_HWCAP_A64_SM4);
     GET_FEATURE(ARM_FEATURE_V8_SHA512, ARM_HWCAP_A64_SHA512);
     GET_FEATURE(ARM_FEATURE_V8_RDM, ARM_HWCAP_A64_ASIMDRDM);
+    GET_FEATURE(ARM_FEATURE_V8_FCMA, ARM_HWCAP_A64_FCMA);
 #undef GET_FEATURE
 
     return hwcaps;
-- 
2.14.3

