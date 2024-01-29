Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp296636ejk;
        Mon, 29 Jan 2024 08:45:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyjh36v9fkKeEgwMgH74z9AMnVmaAcleUFGige9lUBjy+HXnXy6gz4J7T69vhzieypUfFt
X-Received: by 2002:a17:902:ed97:b0:1d8:d02f:a05a with SMTP id e23-20020a170902ed9700b001d8d02fa05amr2886980plj.34.1706546758182;
        Mon, 29 Jan 2024 08:45:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706546758; cv=pass;
        d=google.com; s=arc-20160816;
        b=l9ZcfF2gOGADsOBytHizfo9SzQfAYSQ42AE8q122NJ3SID9eg5eKytAHW/D7jPZZco
         aoObgvOUgyC46GlAWlWb9LQcNK+xsG9y1UT7czbDgFNpc5Gjm4MV36Ot5wLuDKo6yCKO
         i95UWPQskVmz1svqS4rAJsd7wyW6eNbnMd6nXupFyRlJPFbfrSrqPXYHqpsxUEUK68fK
         L2kIs5yJhNqR4llqznLUPQHWOS7wWW7lFPYuGqShXvfMwjHfaJp0rOJgiCwAWDC6Ddq7
         5ogNIOaWWWk6sCyJB+mGnRkPYsvHU6H+kN8tUUJGyEpXeIbqwfRYfBmS23ORqZlmsCrX
         yqQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=B6GmB2IPQQ3XezKE8bqOs65jaQBYCmOI4YcRWUsHLHk=;
        fh=7K9i0j/AOf8D4mzk94OEUEfvrz+Iir3hBGSXXaZzHJo=;
        b=SRwCv04T4LILcmH9XwqKJzhAb0IvoAb6SLv0FyCi0LG1ytNoKmbObJFRARyzttIVOt
         v3AbEVXlvb+09oJVgBpc4Ie87HTYlo/HtLI9GzgnyJTCC6ApG1x8KCPOnxwuAvLHU4rh
         P9dfKoSGwXg4TBVABw/sDOr6cHXcf1JZ+13XX+DLRhyljIFB8GEmnd2cWrmndHWSU3ax
         uS7+X26EXGFPj3h2TTe4TV9dFm28GazlAk/OV76RUU4UKvj60BMllTSX1euEVBQ/FC6x
         iZiSNrJ1HF8HJAzr08kw/Lj8UhKXMnKl2GnDKG9i+j5wVmRpEJheomNJDyEuin1l6REn
         BApQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ceg8bKg1;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7351-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-7351-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7351-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id i17-20020a17090332d100b001d74c169000si2795764plr.222.2024.01.29.08.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:45:58 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7351-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ceg8bKg1;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7351-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-7351-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98C1B285EB9
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772CD154BF0;
	Mon, 29 Jan 2024 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ceg8bKg1"
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFEE15697A
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546753; cv=none; b=j89dFoZ/NfPePq+9g7aHmJczcchec7R4LcJSEdScwkl9qqoFSid9dY4jpnvQMnUhSubpbyDq+E6sCVQ7yLX+IHh9OixVzETlE0iEm12xrXTPqNpEu5HfTv0r+P4KGfLuJDt2lRKGfWhL1VEu1v6zNW826Cdc0GZTQeqxuFtpTCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546753; c=relaxed/simple;
	bh=Dfve9lvAhrJFI2u612phHcaW1dV02y8xZ3hniKcxslk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=apY+llsWKqFhVBVV5EwL/DO8fZRgCMfxaS88L6J1KynbcCrSVe8f7WHAzJvL1bKesfJtfsAuJ62XLkRVM2+p/AovAUSJABLSccq3jHtTcTcgQIN0juWXE7YlMTKJBIvg2ZKRQGTGhkv/189cKOxLhlK5Cd79JHW5zv64kzYXbkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ceg8bKg1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e800461baso44757885e9.3
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546749; x=1707151549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6GmB2IPQQ3XezKE8bqOs65jaQBYCmOI4YcRWUsHLHk=;
        b=ceg8bKg1pWcPaH5r9Z7Y0axNk5ZWNKh1bgEEWlv2M8FO0f6TRxAwDz5D2iwEAwtsgN
         sMxSIh21vfeyNxNUMNCNvFh3en7qUzTKrk9y5WwOXS9iPtETPFq4889va8iVGl9x9zGF
         pRXeC2FYJBxLl6dsycMVFZaPB6H1z0X6GoG83SKmQfEAo2wqX9j65+tpnZwiI3AyQ/My
         v3AKcFgPzq1qblN36RRG/AVMYCwsm1Oa0pYtnzEOKeu5Pv95GOgJPgyIoqF/y/S307Am
         IE3ECKFv0j7piOmStODEhI+NxVUQknuCaOCUd9aG5SKe5VlVBQ1m3Hy21V2B2vRE+aUk
         zOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546749; x=1707151549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6GmB2IPQQ3XezKE8bqOs65jaQBYCmOI4YcRWUsHLHk=;
        b=U0Sq7wbNUOlxGxwhBIFgyHcebTwSaWcD1XmQRkSls8j4rzQH/kovFZDjZ9oPrAm932
         LVsE5YX7y18wP73hP5ecn69YZwLBsOO3lN3+kntOGLCG0llcapDha8XpdrjPGxNvyl10
         daV588JVLXblrxFCi2bBAr87mFaVcGBGE0IuQvm13ZTiBXCxHwfO2ONIcDNsuY7p6dra
         Z1iUJS9SsZ39MSLTJZNZZx+Bve5s/Rpjd2eiRAEEVABSBmfjbfOIQMCTWHOAGLjJHBQk
         v7w8Fixn2qnsK026t/ok8zAT+XxnizJMURvqeXgJFu+OE0/X5NRq2AT45VzCsIrzFNIC
         Pkow==
X-Gm-Message-State: AOJu0YwvJln//XazrXMIsTkyFPgurU9Ov+bpfoTN9CJcG+LSWKRLVZnM
	pYJwv47O0K2Tac48C4r6m/rA4gMg593SG9Ew1kwrYg0mA3ikr97tmgW5piCHGJc=
X-Received: by 2002:a05:600c:1f83:b0:40e:b1f6:2ed7 with SMTP id je3-20020a05600c1f8300b0040eb1f62ed7mr5943831wmb.32.1706546749731;
        Mon, 29 Jan 2024 08:45:49 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id b6-20020a05600003c600b0033aed4e3b55sm3381414wrg.102.2024.01.29.08.45.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jan 2024 08:45:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 05/29] scripts/coccinelle: Add cpu_env.cocci script
Date: Mon, 29 Jan 2024 17:44:47 +0100
Message-ID: <20240129164514.73104-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240129164514.73104-1-philmd@linaro.org>
References: <20240129164514.73104-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wEIChRoUiSWZ

Add a Coccinelle script to convert the following slow path
(due to the QOM cast macro):

  &ARCH_CPU(..)->env

to the following fast path:

  cpu_env(..)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                      |   1 +
 scripts/coccinelle/cpu_env.cocci | 100 +++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 scripts/coccinelle/cpu_env.cocci

diff --git a/MAINTAINERS b/MAINTAINERS
index dfaca8323e..ca3c8c18ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -157,6 +157,7 @@ F: accel/tcg/
 F: accel/stubs/tcg-stub.c
 F: util/cacheinfo.c
 F: util/cacheflush.c
+F: scripts/coccinelle/cpu_env.cocci
 F: scripts/decodetree.py
 F: docs/devel/decodetree.rst
 F: docs/devel/tcg*
diff --git a/scripts/coccinelle/cpu_env.cocci b/scripts/coccinelle/cpu_env.cocci
new file mode 100644
index 0000000000..5a70c2211a
--- /dev/null
+++ b/scripts/coccinelle/cpu_env.cocci
@@ -0,0 +1,100 @@
+/*
+ * Convert &ARCH_CPU(..)->env to use cpu_env(..).
+ *
+ * Rationale: ARCH_CPU() might be slow, being a QOM cast macro.
+ *            cpu_env() is its fast equivalent.
+ *            CPU() macro is a no-op.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-FileCopyrightText: Linaro Ltd 2024
+ * SPDX-FileContributor: Philippe Mathieu-Daudé
+ */
+
+@@
+type ArchCPU =~ "CPU$";
+identifier cpu;
+type CPUArchState =~ "^CPU";
+identifier env;
+@@
+     ArchCPU *cpu;
+     ...
+     CPUArchState *env = &cpu->env;
+     <...
+-    &cpu->env
++    env
+     ...>
+
+
+/*
+ * Due to commit 8ce5c64499 ("semihosting: Return failure from
+ * softmmu-uaccess.h functions"), skip functions using softmmu-uaccess.h
+ * macros (they don't pass 'env' as argument).
+ */
+@ uaccess_api_used exists @
+identifier semihosting_func =~ "^(put|get)_user_[us](al|8|16|32)$";
+@@
+      semihosting_func(...)
+
+
+/*
+ * Argument is CPUState*
+ */
+@ cpustate_arg depends on !uaccess_api_used @
+identifier cpu;
+type ArchCPU =~ "CPU$";
+type CPUArchState;
+identifier ARCH_CPU =~ "CPU$";
+identifier env;
+CPUState *cs;
+@@
+-    ArchCPU *cpu = ARCH_CPU(cs);
+     ...
+-    CPUArchState *env = &cpu->env;
++    CPUArchState *env = cpu_env(cs);
+     ... when != cpu
+
+
+/*
+ * Argument is not CPUState* but a related QOM object.
+ * CPU() is not a QOM macro but a cast (See commit 0d6d1ab499).
+ */
+@ depends on !uaccess_api_used  && !cpustate_arg @
+identifier cpu;
+type ArchCPU =~ "CPU$";
+type CPUArchState;
+identifier ARCH_CPU =~ "CPU$";
+identifier env;
+expression cs;
+@@
+-    ArchCPU *cpu = ARCH_CPU(cs);
+     ...
+-    CPUArchState *env = &cpu->env;
++    CPUArchState *env = cpu_env(CPU(cs));
+     ... when != cpu
+
+
+/* When single use of 'env', call cpu_env() in place */
+@ depends on !uaccess_api_used @
+type CPUArchState;
+identifier env;
+expression cs;
+@@
+-    CPUArchState *env = cpu_env(cs);
+     ... when != env
+-     env
++     cpu_env(cs)
+     ... when != env
+
+
+/* Both first_cpu/current_cpu are extern CPUState* */
+@@
+symbol first_cpu;
+symbol current_cpu;
+@@
+(
+-    CPU(first_cpu)
++    first_cpu
+|
+-    CPU(current_cpu)
++    current_cpu
+)
-- 
2.41.0

