Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2676504eja;
        Mon, 6 Nov 2023 03:04:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTW2MkkfxTv1R+HZ9YGcy3Vah4gkAzGNOjkoSoi3b7UcIUDM2Ly4GHGAzKBhT9vHAkF9EX
X-Received: by 2002:a17:90a:898f:b0:280:215e:8855 with SMTP id v15-20020a17090a898f00b00280215e8855mr20043663pjn.21.1699268693910;
        Mon, 06 Nov 2023 03:04:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268693; cv=none;
        d=google.com; s=arc-20160816;
        b=On03auKMf3DgmTgHAYKS2ub3s5e8SNV+p1mwjhmAh/wF7nzVCsMJe6V5zmxvXZt542
         I5V9B1W1hVbLP+se4Voz4K2/LgEgk8jKMMOWMxInp2+oZ6cW9DokFruNyeNtH2nVDNte
         VBB9VB/GYR2jTE0T6S0KtiIxyie+DIDkwZVmq0FuqcjepZrhfeaoRLLVil0krTZ2VkCG
         Q9Qytm50H2YZek4+XWMLj33l7FVuDNmCi9FQ2txGcArSBcHLjsMKQWWlX4MIZjEqcTl6
         GxvPJ1cJAcp34cCBHNGtlQaQ8R1/+p1hSgVN2b+z+gU5Ybe6de5hPCMi/nbGc4xfNBXu
         gASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=edoh0A4VIBHnomUl2UTL+gBl3YX8JThMwON2libfRQU=;
        fh=V0tM3fzalQvNKX+6zR9HT8vkbBod1Af5U0BAlbl/Me0=;
        b=AQ7eP1DBLI340v7e9oyLh5HWbEliOkBwW+lkm89g9suwPfP3RbNDd2z2Y5/0tJ3vGS
         blgy2XdvDzxGtT8NfEzdbpHbHhXY7S0CoEvwwn5qkVSIfvFOLpOsNiBqEDiCGGURPGKL
         Ww2cgZpzlbzP800heyhwjYnid0tLu703fa4/oeucbViRsvc9xeaW9gCgjeDgfTPvDwi/
         2hPiDyfSgGfwklfZ/1C3k5HUaRG9ATMjEblP61C98w3DpqwglkEHJCBNcJHtHFF2a6lr
         maDuXWrjD4VuRxyv2Gj/6wHbGA1s3aXOZyRYePdMjsCX5S1CAfPvLj7+I9SXBLMGBPNL
         daLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NS6KuHO0;
       spf=pass (google.com: domain of kvm+bounces-678-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-678-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-678-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id l15-20020a17090a49cf00b00280039bc6fcsi7763401pjm.135.2023.11.06.03.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:04:53 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-678-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NS6KuHO0;
       spf=pass (google.com: domain of kvm+bounces-678-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-678-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A0D1281402
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB35D1862D;
	Mon,  6 Nov 2023 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NS6KuHO0"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3EF182DB
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:04:45 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35AD4B0
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:04:44 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-307d58b3efbso2509362f8f.0
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268682; x=1699873482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edoh0A4VIBHnomUl2UTL+gBl3YX8JThMwON2libfRQU=;
        b=NS6KuHO0cmCmp/6pMY9kb7noz1GPDcCvR2gyiLYsCZ8p6GUV85Xfe1g4gX9zmBufdB
         LUxj7KIGnpMov6o7V/e02UYTb//dy71qk1uPEwiijZZvMHWJFP7wBGTCniGrhGSLYjf1
         NmU/JJvZ3xxiD+kXjyFwoSY0ok/bVOs+iE4U2sxW/lI2ejGOhhk5k6W7FdZ4Rtn4oaW+
         AYVn0+DYs4Bjan+ePLkrRE0ML4ueIr1EVv3m3ArkhuUDZ2v3b0BpXZXw/uRKcsaRGuCs
         BxF2VBsiAUc7tRGcKZcXAIcrbs/bRs9RW1o+h+O4A25GUkF0igJAoUidrBfB0VaWSDyB
         dlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268682; x=1699873482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edoh0A4VIBHnomUl2UTL+gBl3YX8JThMwON2libfRQU=;
        b=crMHoiUBUKuHG5IaK7ZhTmmOXxaYsleDwnSutdpMdnWs32/y8WopGNrm8KtGaq3SIv
         ejG0kU6pU9GY1+sGA5o/IAVOHLAhDDfmAX1wqEEZd/Nwcm0PHJrd67anEUfCSjuDGsDH
         WBpxv0t+zjSkfTlvt1tC5p7xLY2IC4jdaTMF7+0O3f2gjqLMPUPhYRrHfXMuIoj4tSTq
         F4BphCj2lyvgiTmChf5RafFTPxpPU6HzqW+TovbqCZGJ1wjNWc2s6LnOl56/Bxw4BBZj
         kT8zKxuMIvRF92rjholIuKTM9+Z1fICqzA/aNKUPEHlmBlP+ewmSm1TkT9WVaR/WyhYw
         NG3w==
X-Gm-Message-State: AOJu0YzlGj0HHXS4don5eONnLAn6V2nPUbYHerPfmYyisKXSBjrh1Ci8
	7qo4THOYnv1uYbDLLy+ervNRDg==
X-Received: by 2002:adf:f0c8:0:b0:32d:a2a3:9533 with SMTP id x8-20020adff0c8000000b0032da2a39533mr23224446wro.59.1699268682776;
        Mon, 06 Nov 2023 03:04:42 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id y3-20020adfe6c3000000b003140f47224csm9111991wrm.15.2023.11.06.03.04.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:04:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL 09/60] target: Mention 'cpu-qom.h' is target agnostic
Date: Mon,  6 Nov 2023 12:02:41 +0100
Message-ID: <20231106110336.358-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zydvejDSQ66i

"target/foo/cpu-qom.h" is supposed to be target agnostic
(include-able by any target). Add such mention in the
header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231013140116.255-3-philmd@linaro.org>
---
 target/arm/cpu-qom.h        | 2 +-
 target/hppa/cpu-qom.h       | 2 +-
 target/microblaze/cpu-qom.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 153865d1bb..dfb9d5b827 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM CPU
+ * QEMU ARM CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
index 67f12422c4..4b1d48f7ca 100644
--- a/target/hppa/cpu-qom.h
+++ b/target/hppa/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU HPPA CPU
+ * QEMU HPPA CPU QOM header (target agnostic)
  *
  * Copyright (c) 2016 Richard Henderson <rth@twiddle.net>
  *
diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index 2a734e644d..78f549b57d 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU MicroBlaze CPU
+ * QEMU MicroBlaze CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
-- 
2.41.0

