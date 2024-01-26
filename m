Received: by 2002:a17:906:ca92:b0:a35:2c0b:b7b4 with SMTP id js18csp116554ejb;
        Fri, 26 Jan 2024 14:07:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpg91OUWvIlJwwszi6tZKxo2sWxmipOPfk+GEW8qHsn2VqmWpynq/AIjN5mpjHdIUDtRX1
X-Received: by 2002:a05:622a:90:b0:42a:541a:24de with SMTP id o16-20020a05622a009000b0042a541a24demr886213qtw.4.1706306823527;
        Fri, 26 Jan 2024 14:07:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706306823; cv=none;
        d=google.com; s=arc-20160816;
        b=PzjwDq06vt+GBrgXhaoqB9sJwrLbT7dR2frNQpg1Z/QkC0LTNfLbLRbCI75m0TJ6VU
         2OgXmKMRPDO08JtGoZbH7aH4L/GGl/ibJ4ob6Ey3ds/UDeyZGdqhpyGkBQ1qoX7vhNlX
         /i+g0ear84ZeiyGX2C8pSpt3qUYxe+bJYlv52dRZnvZCGboJ6w3thBGu7uYJFXIvQRuO
         M3i6CdQVl++DJPluv5cjsR+mzKn+7NqPakuu3GLEnRbDVmkVlbzSjTz1omq6DRN+ddxB
         B0Fo8z5bBhEaN66wXvDNkkgS4axX2bLG/r2umTM1r01GGP3WJbRuR/MoW4lTJ1yLpXUN
         S74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wkOEO96VeYz15t7MFpkcGQawVspurMDTqf/y8c7vhEo=;
        fh=/qojCzKzJzu17eSGMo9CTqxbtyYGaOrKOmbzUDrHuP4=;
        b=l4BmiY5q0KBH63To/CnDQWEJQKoweMNW581WTkzHEL9oVUTL8Ki2NUo37wKu1AHrjU
         Dl1jbcjdoVXuMGlCMVz2IDf406oYPGKbi7+0KKDnzWb+++m3Z195ZRwlWAYtV3Kr3X9C
         2JKaT+RYM4sZawtOkisjkf/EuJoYxa/XIALMm1PH+7krG3LvhgZ9BmS/des1FLeb2i4h
         nPvTQdGb+qOO82heC3bLBcaIQJ8+tVufz37ogrVtLewn9hwsOp9rewnc4BMTijOEhkGj
         lU2+Awzmwq/b/Nl6QOjtkF2t0xXoy/Y7bwlEXuXHo94e7IqhcQY5jCJ6YQamNdsWqqEA
         o4AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTcaS6tJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05622a04ce00b0042a3a097dc1si2042592qtx.728.2024.01.26.14.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 14:07:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTcaS6tJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTULL-0002f1-LO; Fri, 26 Jan 2024 17:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTUKY-0000e2-U4
 for qemu-devel@nongnu.org; Fri, 26 Jan 2024 17:05:47 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTUKV-0004Fv-4g
 for qemu-devel@nongnu.org; Fri, 26 Jan 2024 17:05:46 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3122b70439so122086466b.3
 for <qemu-devel@nongnu.org>; Fri, 26 Jan 2024 14:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706306741; x=1706911541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wkOEO96VeYz15t7MFpkcGQawVspurMDTqf/y8c7vhEo=;
 b=pTcaS6tJXnX5eIh9+DM9zC2Nsnf4YHLPgupn80S7NUx+xHHDcXISd75tNEmhgQmYnC
 N1toqpssV7ATI3kSPJT2HNm+lGul+VMG7AatqqOYTvkpj58RchtaOW1LWSndIKQ2yNp5
 ThckOLqwlpm1WEBWKa5wG5fcZ0FBGwEUE+shkqDrySHh2JOK/lABwymge6bUBYDp35VY
 RmfPjQ3nwBJg/AZFVgB75Oih094pFvRBjwWGXP+G3mNIP8LemyhIS6npl0eyJeMCUlbW
 rUkYRwzG+ixA4daQgxC43a9oCNkmTVKZsd8omllQYIR51qpZ1lhi/rau3QKLR7j2SDWZ
 7/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706306741; x=1706911541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wkOEO96VeYz15t7MFpkcGQawVspurMDTqf/y8c7vhEo=;
 b=rJ7zwSadVMU+NcaKW7jP8iCO8MRlWTeDIrCCfSq377EzHI7oPQ6AaXAOo8sy0riGzg
 hvJ43wIY9wAg8gnJKhtOJto4gSiivA7+qppwZuo0KqIRICIHj4IL2cmuZ68cyZxHX4Fb
 ceG+cD3LcaFDPYsF0CI7I84iex5d63TD7uAIMvENsUiByo0P7Ew3HDRDFGS3DWkWTAGn
 XjZJeGJi5zBcslZna/2uIpUjksJclUhKqGeISw15eBJG6rFO7QpLp76DGzx8ZGHWGYAI
 cKB4NhdDVeGSOD1EwkSt5QzmLw3kWXMLSJZqpqDFOneunzbj4IQHiwY2XcfRKMqzoLDX
 RAvA==
X-Gm-Message-State: AOJu0Yz7CVlKHifnHmUA6r+qfViK/aBDzlsfu/W1tFBndcNi0HU2y4XD
 xI3pC4/5xJaJunnqv9FZfcDihTKG8xMkBOaHUIPnGs0/cHb0vssPz6On6fDQ0nmrKesuURKHIDZ
 1
X-Received: by 2002:a17:906:fc09:b0:a34:d426:1beb with SMTP id
 ov9-20020a170906fc0900b00a34d4261bebmr335803ejb.54.1706306741394; 
 Fri, 26 Jan 2024 14:05:41 -0800 (PST)
Received: from m1x-phil.lan ([176.176.142.39])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a170906408c00b00a3185d260e5sm1039705ejj.151.2024.01.26.14.05.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Jan 2024 14:05:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2 15/23] target/openrisc: Prefer fast cpu_env() over slower
 CPU QOM cast macro
Date: Fri, 26 Jan 2024 23:03:57 +0100
Message-ID: <20240126220407.95022-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240126220407.95022-1-philmd@linaro.org>
References: <20240126220407.95022-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F5oFRZr9ccKN

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/openrisc/gdbstub.c   | 3 +--
 target/openrisc/interrupt.c | 6 ++----
 target/openrisc/translate.c | 3 +--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/openrisc/gdbstub.c b/target/openrisc/gdbstub.c
index d1074a0581..0cce8d4f92 100644
--- a/target/openrisc/gdbstub.c
+++ b/target/openrisc/gdbstub.c
@@ -23,8 +23,7 @@
 
 int openrisc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
-    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
-    CPUOpenRISCState *env = &cpu->env;
+    CPUOpenRISCState *env = cpu_env(cs);
 
     if (n < 32) {
         return gdb_get_reg32(mem_buf, cpu_get_gpr(env, n));
diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index d4fdb8ce8e..b3b5b40577 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -29,8 +29,7 @@
 
 void openrisc_cpu_do_interrupt(CPUState *cs)
 {
-    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
-    CPUOpenRISCState *env = &cpu->env;
+    CPUOpenRISCState *env = cpu_env(cs);
     int exception = cs->exception_index;
 
     env->epcr = env->pc;
@@ -105,8 +104,7 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
 
 bool openrisc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
-    CPUOpenRISCState *env = &cpu->env;
+    CPUOpenRISCState *env = cpu_env(cs);
     int idx = -1;
 
     if ((interrupt_request & CPU_INTERRUPT_HARD) && (env->sr & SR_IEE)) {
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index ecff4412b7..aff53c0065 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1668,8 +1668,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
 
 void openrisc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
-    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
-    CPUOpenRISCState *env = &cpu->env;
+    CPUOpenRISCState *env = cpu_env(cs);
     int i;
 
     qemu_fprintf(f, "PC=%08x\n", env->pc);
-- 
2.41.0

