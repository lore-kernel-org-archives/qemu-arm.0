Received: by 2002:a17:906:ca92:b0:a35:2c0b:b7b4 with SMTP id js18csp117285ejb;
        Fri, 26 Jan 2024 14:08:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQKRmGG0bbdffnXxAOTPI0VS+MS6EO2HY1y4tCWVQ175gyjNNafAwxT+NlbJ88iir/KZKJ
X-Received: by 2002:a17:903:32c4:b0:1d4:1ee8:869d with SMTP id i4-20020a17090332c400b001d41ee8869dmr435385plr.37.1706306923953;
        Fri, 26 Jan 2024 14:08:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706306923; cv=pass;
        d=google.com; s=arc-20160816;
        b=kPpbcrNOXlUa8A8u6kd6IOQIaPPhTblizz/9HWzjlLnZ4slxkvUICW+qFebnknAji+
         oOP6VAe6au+d22IdHeg0rBGI7aCwPiYFjm+l8UH4HHeOtPP5/UojhxullpLbuGGWtqxp
         S8DDQWi/F5uyU4/OzLuuuJWWsWqnU8vySNjXVdhk517o1B8XU8ne6iUyNICKazaN4RbN
         QRo3y4P5ZB4LhzlneT7Nd/2TOqneQcEHYQjjvUb4mJE2p6gQO6JvrPSV71+ceOWVVMcV
         ICsm3Ge5RibNEYMdOvPtaPiTN5D7Fu8YF2Xc2u/9C7M4bTPQgjq1qORW30ggeE4j7YH3
         ZLHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=1Fp9tWfUnWpTWSY0wSSNV5XB5wPrgNqsnYE0Bp5WmMs=;
        fh=Tzw7ry3evXwnVWACvzmwEOdsg3J6VzcKR4bd6HttjTI=;
        b=FJ8J6gWgopM2tAUs0QG+MC1vtyg3+YKdvvgB5A/+89k5XD22osN9O8zw9w60Nc9P86
         HwH8ngQj8x2r42cg0LvfsfeQQE+pson/l+Mq1QJsfm3QWemIb+3nCC8U0az1x47H7XGJ
         IMbgfXagn4HKPCM6JNmAnQThp3bXYKfvMedE9u+Ju2OCZRjyM/8X9KtzWZIQTavBRKr+
         TjOgMKG4I0lLyuM02AjDyINTeiIDw4ODQok6YaFsRlIPHoxF9ITBRURsfuEvhoDwr8jr
         9pRgvghCU7PAHJ2E/lqF898E2Hc722bdUXS0bnSIsyKdOcr0u0VgMy62qbF73kG56hzY
         l1Aw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWqJZXhE;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7232-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-7232-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7232-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id s6-20020a170902ea0600b001d5ce872ee9si1813102plg.568.2024.01.26.14.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:08:43 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7232-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWqJZXhE;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7232-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-7232-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60A6428240B
	for <alex.bennee@linaro.org>; Fri, 26 Jan 2024 22:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2705B5C6;
	Fri, 26 Jan 2024 22:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWqJZXhE"
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224B95B1FE
	for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706306765; cv=none; b=pzKEPzWfsRK8XGJEoVmFjiNxdTpalu72bu4GMXME5hDRKSJpczbapOam7NIXGyW8tyev2QOvl0ImXMbPZVCjUOhI0wkwYDwRXrAG+Fh3MMwqwr4sYgiTTJqjttbvQPTXuMTzLREZ3Bhe7s8bpkSnF2L1ycyVUmKPOKRVkZeIIiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706306765; c=relaxed/simple;
	bh=ItYA9au/dt+O1e2yo1AQHf5iDgq4VGOSm2btVTvX+X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FE1S2a0KoitxJ1lFWnGMlputvAsL1eTp5DkhS5bDKNYm/2IZRQKQdfAmxWSrXBiJJ326QMco3tUFDZNnxiDJlJGtJk9Ke+Le08rxfTTYoLB7eMLa82tiwDwLoThvjIA7wki0lvkav29iviUHHtcpdS5YXSVrnoWwd6a5GfVOp3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWqJZXhE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40eec4984acso921305e9.2
        for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 14:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706306761; x=1706911561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Fp9tWfUnWpTWSY0wSSNV5XB5wPrgNqsnYE0Bp5WmMs=;
        b=TWqJZXhE0WbSS9urKI+/bD2u0iV39J6Z1s1cNOSma52jUNHWu+X71XxiR5IxuJKnvE
         rV6WSSF67MAtLbfvaExLV5pidG0PzfK1b9JPaNjbAL1aR4Py+RJkuHkyvVi7mINQoWYS
         Pc05Mxxplg/eTiCSj7Ppi13NV80dT2llS4ksnKbcPYZtWoy9jL5dC3Goc5+e52pswdlC
         wyk8zuN4Y4w2DvGIj/nZ5wL2PfEJiRoP4CnnVZc4UNS3nT8/30RySErqjmkbvizOMaBv
         fA9gdj5CEXRAflRtWLEhaI3WcCpO56Pp82sBJajGpYYMLyt/w0W1LzZsTAx338Iw6cLy
         V23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706306761; x=1706911561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Fp9tWfUnWpTWSY0wSSNV5XB5wPrgNqsnYE0Bp5WmMs=;
        b=F1CF13WCqaXo9kaIgmJ4ge2qzoyS6VIqkx1rK1btgfP2jHm0wGdvzK35bx6zMgqNTm
         3NeBRDAvsWctQETb2X0fUQVixUTW3jzDH5Z49vqOd9kBHeOMQd73tFX0a1OK9askUoCH
         SOAO01jwq1Sm8Zlgihwk/dhstLwbhJjkkeR/dPglUH5c87atRksLYLArS7yB0AAj5Uq7
         hNy9pKM16jzNci1+13LJvNP5yy1grRSJOQ8j+KE9YXV0dwngXMcKFkzqv2lpgyPyMplo
         VWUnLTEzwzRymKwnS/ndJ5p6t1R5GO9MYsUrSVY6xrBwfBr9m+miWqJJcA85k87CVNjr
         vf0Q==
X-Gm-Message-State: AOJu0Yx0V+DkzqZV3QWGkaUp25a9LeW/UFev29kUvYX5zZi9zCElNAh7
	1mtK/n9U7DCHEmT7dfkQjgxplLxXhUKXpCDELv7KMzLMcRmpzlcirjmj9Q0xd9U=
X-Received: by 2002:a05:600c:5187:b0:40e:d44a:ca9c with SMTP id fa7-20020a05600c518700b0040ed44aca9cmr330302wmb.48.1706306761345;
        Fri, 26 Jan 2024 14:06:01 -0800 (PST)
Received: from m1x-phil.lan ([176.176.142.39])
        by smtp.gmail.com with ESMTPSA id bi19-20020a05600c3d9300b0040ee51f1025sm1819887wmb.43.2024.01.26.14.05.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jan 2024 14:06:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH v2 18/23] target/rx: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Fri, 26 Jan 2024 23:04:00 +0100
Message-ID: <20240126220407.95022-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240126220407.95022-1-philmd@linaro.org>
References: <20240126220407.95022-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zD7wH6A6WbTV

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/rx/gdbstub.c   | 6 ++----
 target/rx/helper.c    | 6 ++----
 target/rx/translate.c | 3 +--
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/rx/gdbstub.c b/target/rx/gdbstub.c
index d7e0e6689b..f222bf003b 100644
--- a/target/rx/gdbstub.c
+++ b/target/rx/gdbstub.c
@@ -21,8 +21,7 @@
 
 int rx_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
-    RXCPU *cpu = RX_CPU(cs);
-    CPURXState *env = &cpu->env;
+    CPURXState *env = cpu_env(cs);
 
     switch (n) {
     case 0 ... 15:
@@ -53,8 +52,7 @@ int rx_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
 int rx_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    RXCPU *cpu = RX_CPU(cs);
-    CPURXState *env = &cpu->env;
+    CPURXState *env = cpu_env(cs);
     uint32_t psw;
     switch (n) {
     case 0 ... 15:
diff --git a/target/rx/helper.c b/target/rx/helper.c
index dad5fb4976..80912e8dcb 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -45,8 +45,7 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte)
 #define INT_FLAGS (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR)
 void rx_cpu_do_interrupt(CPUState *cs)
 {
-    RXCPU *cpu = RX_CPU(cs);
-    CPURXState *env = &cpu->env;
+    CPURXState *env = cpu_env(cs);
     int do_irq = cs->interrupt_request & INT_FLAGS;
     uint32_t save_psw;
 
@@ -122,8 +121,7 @@ void rx_cpu_do_interrupt(CPUState *cs)
 
 bool rx_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    RXCPU *cpu = RX_CPU(cs);
-    CPURXState *env = &cpu->env;
+    CPURXState *env = cpu_env(cs);
     int accept = 0;
     /* hardware interrupt (Normal) */
     if ((interrupt_request & CPU_INTERRUPT_HARD) &&
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 1829a0b1cd..26aaf7a6b5 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -131,8 +131,7 @@ static int bdsp_s(DisasContext *ctx, int d)
 
 void rx_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
-    RXCPU *cpu = RX_CPU(cs);
-    CPURXState *env = &cpu->env;
+    CPURXState *env = cpu_env(cs);
     int i;
     uint32_t psw;
 
-- 
2.41.0

