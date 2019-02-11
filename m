Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1943120wrq;
        Sun, 10 Feb 2019 17:11:01 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZbBRlYzQGYQ0vLH774yrgPC3QYNWSkfAs8zryDq/8wbvFj1niH0o/1zMUOibYQDyShGWeY
X-Received: by 2002:adf:eb90:: with SMTP id t16mr17306970wrn.324.1549847461874;
        Sun, 10 Feb 2019 17:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847461; cv=none;
        d=google.com; s=arc-20160816;
        b=lICngezy+MbP9YZSGspRbAzes6exuUNRWkGFoBNtBFl0aIQrho7tjGFrCZU79Qahar
         b2FwacfPH7tRwSKMqCVcl9DESyho5GIZp6dI4CByU5HBR0fkE5wZeV078GN0EOC/ppet
         TEMSgt4Zn6Wd8ID3TN1gAcHmS8NC/oVoGusovJ7GovSXLEweRkSizBrGbrSZQ0bmnWoE
         6VS9VfjgUXuQ/Fr3+dqOUeZuh2qydf4R6JS8c3hWJcfhMejdjVkOS9BzyOgDQwLYDuG7
         Vk16OwQOzij3TuP/JtEfyuBV/oRDnhPUKZ85MqvJiKUoqtv3OBrygHc9q80gA85uZdGc
         kRKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=MeANllhl1EJDV5sKJLIW0fjvttmmw3UOBcxKU9DzMxw=;
        b=WprlxF1Ehsfui/ndqncBAAKOCWmCNkiOFMDhNI7lRp6tbTD41tHv/TqjH7W54rVXBq
         l3G5GdWlxCThvn86YnenaGQi60KMbPCxTwMTD/X1emD/y701zOHW/BUAPyBPCMh3+doY
         BpSi5c8p+OFcaTNFEPXwgdDMCJkagvZqA/5BZ8HvZUglOrEMSXwJSqCQ2b62GDSi04f6
         X/aUDR+fkD6xfwo3sn8d2RAOTIuYJimUi6gKSVkMBHj3xcp/pB6oUn6MFVq2pI43Lc0a
         DCE8PYiL/oZ8sQ3ZpB+7xAAqkuL/NS6QqUDkDyZfnAbQxVp3jvH61rnraQA5oCVjCxa6
         6GvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JzV2yK8u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v23si7059501wrv.164.2019.02.10.17.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JzV2yK8u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt07g-0006iZ-QZ
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:11:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05u-0005vZ-2u
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05s-00007Q-1T
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:10 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33996)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05r-000856-NS
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:07 -0500
Received: by mail-pl1-x631.google.com with SMTP id w4so4525445plz.1
	for <qemu-devel@nongnu.org>; Sun, 10 Feb 2019 17:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MeANllhl1EJDV5sKJLIW0fjvttmmw3UOBcxKU9DzMxw=;
	b=JzV2yK8u9V9hmkNEC+LMvb/OE/CZhY++ro6NYUgPvcw2kv3oKiWM8Agu4XizJpDor9
	cBEaf7HVeKp6iJNmEc+1OmbEuOqUp0ZzO3ykJGiI4gCc1AJJv/qwXQuh1bU/CDTeOukV
	F6b9BQ84WvnF1ugdRHOQzbMzppLILEYLsfjcukm7AHmbpgkFh0RINKrzjC5duUSA2QCM
	qTwLGNakTKK0aNETuoEX90ZQo98Ex8P63j5lN7aTX6LG+Vvj/qorOHMZXBC+Luf5Nq6C
	gtWmSt38tJ3ypJlRTyNsRocg9gtpXeGm/GFiTz5ClMoBv+zp8o9GTyrWpYrQcOoh0uKQ
	OwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MeANllhl1EJDV5sKJLIW0fjvttmmw3UOBcxKU9DzMxw=;
	b=C2kpwLD4AJvA5cbgXLJYtv3oKuV3uYzmOfvW/0npsqpYBE9BZ9JVFrIDtF+vxATGdm
	8HoslYhpSscFKqciRv8WCjqFnNqg5p/6IvSHvI3NezVFZ0zc4UK/IHUTTRgACAJ98D3e
	NEMMwOzu9JNjM33oB+tKqRoZbVPTepckM8+7986r0x6uRPfE1NqePoauSu4N6TNwumds
	mCcpPshg7YG9RDrAdsxw8Z+KdM4yEXqbSnS5erKYHArEv/i9ogDxso4udQUIGewJ5a1X
	4tvWg2hHrAmG0fRN0wyDDjg1BHdEtVVvD77e+hrUmWoEkexfmGotQjNu70O4J3BLTXHA
	RLXA==
X-Gm-Message-State: AHQUAuYUDNptQg8Df9xQJ2BU/hY0+CRiXX7to1DhPz1rhzq8jkObQDNS
	1Qhv1WQUOQY7PvFxG4RKGRuNDgyCv/s=
X-Received: by 2002:a17:902:1122:: with SMTP id
	d31mr34969423pla.246.1549847320949; 
	Sun, 10 Feb 2019 17:08:40 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:10 -0800
Message-Id: <20190211010829.29869-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::631
Subject: [Qemu-devel] [PATCH v2 07/26] target/arm: Assert no manual change
 to CACHED_PSTATE_BITS
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
X-TUID: qmMzAIxSFu/m

These bits are stored elsewhere; changing env->pstate has no effect.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index a24757d3d7..296d1ac72c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -209,6 +209,8 @@ static inline void set_pstate_bits(uint32_t bits)
 {
     TCGv_i32 p = tcg_temp_new_i32();
 
+    tcg_debug_assert(!(bits & CACHED_PSTATE_BITS));
+
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_ori_i32(p, p, bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
@@ -220,6 +222,8 @@ static inline void clear_pstate_bits(uint32_t bits)
 {
     TCGv_i32 p = tcg_temp_new_i32();
 
+    tcg_debug_assert(!(bits & CACHED_PSTATE_BITS));
+
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_andi_i32(p, p, ~bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-- 
2.17.2

