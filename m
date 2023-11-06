Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2677493eja;
        Mon, 6 Nov 2023 03:06:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUX6FrIqJf4jtZvXiBXFSu8VMEwUNvidMbijfd52t9IdmnlnxCnsad03ZRiQqVD0Ik4qg7
X-Received: by 2002:a17:90b:1241:b0:280:1689:4aac with SMTP id gx1-20020a17090b124100b0028016894aacmr19943417pjb.2.1699268786627;
        Mon, 06 Nov 2023 03:06:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268786; cv=none;
        d=google.com; s=arc-20160816;
        b=XJ64x0UGFygJpAINKe8mpiSlyEThh5+D9BoUdLiEoTphVXh4Lzf0lgOg+6QufJ5GDd
         1/YDRRftXmY9i8EmjAxps7vwmRNTIkV/KjFShiRF4Y7wZJtEqbkRsoh3JVZTbhTxXuGI
         rO+wDm4PBxpWtDY92+lgfuIpNxQ/1rZey1CNPH7BM5GI+MAs0ruZkaR1jd0m2IeuT9/A
         vF3/V86MUeUo93lE/9Qr80kmxdEierAvMbQH4CHi0sz1WxPJ0XVfhSekvBMUsq9y9l7f
         tGa1/byO9a5qF6z39S+isnC3B59x+qJQJeM4ERMtuP8SctRYtzQuz/9YbyE4cqr384/W
         /ORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=Kr5DULV07OwGLXl8unpIp7yrXhMhnI+29Dc5ljVlc2w=;
        fh=KsRs8T3mbLYMlyhqBIfasTAuo72nFePg8n4RIyLlRbA=;
        b=GgZ2YEwQXexGnKBX80vAJvy5InJ2X9wuNdYAB8An1wsZSOYS/RtBrsBuIe7Tyd2bk5
         SyFUAGNpAntW5X3tG0eCFrM8xDAPWWhsW4v6HQES0vCc5g6qpnf4yRMfxAQQULhBT9rc
         HrCGRt6yTj3uI16uQxv4301yQF6yyT2RSEMznX/W1sSPsCXVUCxfI6BBq0wVlKwbLjXB
         ehjtihFQ1Zqmsy6qY6fkxagQ3opfwcuLmGP78wZSpN7CTngUTlBTcLP0jtpKLfX1qCal
         uqs6u539wfB2heWGPMp4gyi2EMRpSr6l0W6XMNSr7QYCrT2FVPCQQ5UmngEQHkfdPJE8
         uyIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xcdo3m4i;
       spf=pass (google.com: domain of kvm+bounces-691-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-691-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-691-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id v22-20020a17090a899600b00280145d5114si7842766pjn.5.2023.11.06.03.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:06:26 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-691-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xcdo3m4i;
       spf=pass (google.com: domain of kvm+bounces-691-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-691-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F7BDB21CDE
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1551EB2F;
	Mon,  6 Nov 2023 11:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xcdo3m4i"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9441EB29
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:06:15 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A42DFA
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:06:14 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40859c464daso32128565e9.1
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268772; x=1699873572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr5DULV07OwGLXl8unpIp7yrXhMhnI+29Dc5ljVlc2w=;
        b=Xcdo3m4iZcfaKsOyziCQU1We8qFzTG30UDrxZD6p/tBmuPyxn4KrkAIPhItUT9AY4N
         ZzD7LT7fF56nIAog7MGdKMKxmIDai4m2S73LLcJck3ehwVOc1xgXdILpTrhn9lErmlZo
         k2TRFXxtJGoayI23wgF2LZ1g08wBoBsLmDr4Dz3kBBu1tePC5sWotiPOO6XK3ogQsw1f
         8B3MGj0DIaaIqBsO5cfTiof0iojM3123THHZMaI2FMiH0c88xcgxWmdx6fLIYF2CeSlk
         NxhueiCP+acZ+3eN3j3j2YxS5Xqq00MRibrLYPGBgoi4NcsapA8cTrgU+r6VwO1k98R/
         JO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268772; x=1699873572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kr5DULV07OwGLXl8unpIp7yrXhMhnI+29Dc5ljVlc2w=;
        b=t+Kx/sQt+blsDFjbuFae1io1vSdtnRctxDeGNXCM2N6IFtkJblsIFTQk6x7jFM2/R7
         4iaz1jSNusgWpkf96NVckCRYnDHB3oEIXtCiYBmDM6aYYf/N+81PmkI5238uQaNoX/ze
         jyVjWzFiREHDE4QEBhO88hS4Yv3+WX8Co54l/shYMpc/lUakiW8pvvDKZ2euYW0L+P9Z
         ChTWCjqLi9HuDo1ck1i0YRyq683dob70YsSOkpQEbwu0SYnHpdrZH0FAJzedsuHAvcqo
         evRpJGMOCpzrbEc6UqOx5TJUIrtsgGQzXVBTzAwD4YUTt52Cn9VMY7Lv+lOqMW7pNrJC
         c42Q==
X-Gm-Message-State: AOJu0YxuUleWEwUN8tzseeVxbWO43+3p1J2KQfUdC4/8hy52bDm4JYTQ
	O/ldlx1zqK7m3ZQYU60qSsgLOg==
X-Received: by 2002:a05:600c:35c9:b0:401:73b2:f039 with SMTP id r9-20020a05600c35c900b0040173b2f039mr24065294wmq.7.1699268772505;
        Mon, 06 Nov 2023 03:06:12 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d618b000000b0032db4825495sm9214037wru.22.2023.11.06.03.06.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:06:12 -0800 (PST)
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
	Alistair Francis <alistair.francis@wdc.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 22/60] target/xtensa: Use env_archcpu() in update_c[compare|count]()
Date: Mon,  6 Nov 2023 12:02:54 +0100
Message-ID: <20231106110336.358-23-philmd@linaro.org>
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
X-TUID: DmxEtoB09dt/

When CPUArchState* is available (here CPUXtensaState*), we
can use the fast env_archcpu() macro to get ArchCPU* (here
XtensaCPU*). The QOM cast XTENSA_CPU() macro will be slower
when building with --enable-qom-cast-debug.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20231009110239.66778-5-philmd@linaro.org>
---
 target/xtensa/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 7bb8cd6726..496754ba57 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -37,7 +37,7 @@
 
 void HELPER(update_ccount)(CPUXtensaState *env)
 {
-    XtensaCPU *cpu = XTENSA_CPU(env_cpu(env));
+    XtensaCPU *cpu = env_archcpu(env);
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
     env->ccount_time = now;
@@ -58,7 +58,7 @@ void HELPER(wsr_ccount)(CPUXtensaState *env, uint32_t v)
 
 void HELPER(update_ccompare)(CPUXtensaState *env, uint32_t i)
 {
-    XtensaCPU *cpu = XTENSA_CPU(env_cpu(env));
+    XtensaCPU *cpu = env_archcpu(env);
     uint64_t dcc;
 
     qatomic_and(&env->sregs[INTSET],
-- 
2.41.0

