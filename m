Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2677540eja;
        Mon, 6 Nov 2023 03:06:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtCQhh9SnUmAsdXsPL5Lp/iF5cCDg1QO6LbvUoorvs8mRedQAPtPpeobpJgnS8SK1lZ4sO
X-Received: by 2002:aca:2201:0:b0:3b6:4ee:49c8 with SMTP id b1-20020aca2201000000b003b604ee49c8mr361573oic.54.1699268793777;
        Mon, 06 Nov 2023 03:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268793; cv=none;
        d=google.com; s=arc-20160816;
        b=Zk+to2ejwOH6iGBoFmfqIqhMzwBrMqsEVpXVmJsTK8gaAjqOf94mpDNhG2Mnh1UFkq
         Mfy20l/0y9dQr+EkK/Z9jonuO23Sw/NGUBgzNZ7fjVZBnXwZS9n9BvTaQKA40p8HsogX
         W2+RD+UMgyMIF7JWPvQ+KagF+Eb/WAharQ/1iXS3sXQup53920b/4GtDc01MX714sRvO
         JKJ+5iHslL3RJRJS2PMtpfan2h5sIcEuSd0j/ZBVERnu7Ri6ZfMPBI/8HLm4Xo2D4Nsq
         XARU9D5bTrLA1eLF/Q73KIzsFVMH1JFaYErQgFGGQBzBlIUgH+na3wqQlDYe+5ifXnxm
         1SEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=3KIslD3tBGe6rvvH4379K4CtN4FVJCslZLzDLuVWSbo=;
        fh=sv0Y+dA/cU1Bgb/VBJogqin4Spf+R0vCWKmGl8Na7m0=;
        b=1BYxlslzn+AuZATONiNgo1isIHbcxu8xVNlAdXzfksOZGpCdUkb42DTnF6b4eyLaDO
         0QAlhiPMYaLQgx5RuOoymHrry1cjUiOoRuxbggEvdbUXxmz+3DOoQkT6elefHvQj/u8H
         07AfxPIoXSMHuEfN/l400mt4PWW3PYteOMmBtT5ZMvA4fE51VJ2ChMUeQaFe43rGBu1l
         Dsdty1AJuetCVFfzgWntc1kcFB21A/km1uqAVEtHRIsWvwnmeQAn905S9u0tO3ijAOsl
         r0c1uBAXo1IWrdUpaqG2QIxpVQWrd3cJLclOERX2YyYPKIcerx5wOKeQgkKxGCVyiKEY
         qIwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ieo7ztTi;
       spf=pass (google.com: domain of kvm+bounces-693-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-693-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-693-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id az2-20020a056a02004200b005bd35c864e7si9263988pgb.732.2023.11.06.03.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:06:33 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-693-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ieo7ztTi;
       spf=pass (google.com: domain of kvm+bounces-693-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-693-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24CA1280E7A
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8B41EB2E;
	Mon,  6 Nov 2023 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ieo7ztTi"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CA91EB2B
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:06:29 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229291B2
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:06:27 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40859c46447so27369395e9.1
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268786; x=1699873586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KIslD3tBGe6rvvH4379K4CtN4FVJCslZLzDLuVWSbo=;
        b=Ieo7ztTi3KWvsVeJAdtKoCSCd8C5DREIODWn0L0ot5lcdF0CtZIX7PSydM+UfI0TjZ
         cS+J22BptJlN+xOeGZg2HuOA7EgqoOBJRzRFuCmx3j1mvnbUAFEe3+nhtJwO4tRxKQ0f
         5ObcY+DEXu9+j5Cwa1iFkphpdT8AuVgHm3LnkzKmz7lXMW40aT6jdv+Jz6FtYk65yQPo
         1cbRP13O9C2XNz9HuxBZMgH3sXGaFUe6/i3vU14RUoS9adf0n/jPD1IkR6fhnrJCwUaO
         mMk31NUBmEczuwE73BjZSU4Z5cYndZHinYGrURwoKWaaqZjS82pQeuFmOjDNJgWkMQ2R
         EiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268786; x=1699873586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KIslD3tBGe6rvvH4379K4CtN4FVJCslZLzDLuVWSbo=;
        b=fcUTHaBOdXLkeNuveqX4G0cEoUC8eqUplr+UuXSb0uMMWJclUN8Z6oK60axChoXuos
         Ps8nie0PRZU7skmr5OYFKP8EgdOELnIk/b+JNUwjPXeA9Zc4ZG0lpmUvyt+xkStfR7Wr
         uwyTKrI6oySE3aaRpv53UIkNnGxnOTZhFpP9u4tUBMQwIhZYx0Of5s42zwgomtQoQEpu
         USKGGm1qphTOjoSGRp9cB4YN9933bsNWYFuPcX/xZT7Tb77uQyfxWigbeykQZ/8nujoA
         npgnL+9VTIMn0EgTwK6eYvoGykEVji/8lCStvfZ8JLepJadi9G1B+s0rbzCxiIaaTONR
         3ujw==
X-Gm-Message-State: AOJu0YyH1Y7GoxEjeYZPVMro1D/5eXPd8EJlj7z8bCUsTBrlXgjjjLVA
	7I7tSXky8Ss/D7BfqEUPeJBhAA==
X-Received: by 2002:a05:600c:1c27:b0:405:1c14:9227 with SMTP id j39-20020a05600c1c2700b004051c149227mr21583067wms.33.1699268786451;
        Mon, 06 Nov 2023 03:06:26 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c1c1300b004060f0a0fd5sm11856347wms.13.2023.11.06.03.06.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:06:26 -0800 (PST)
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
	Roman Bolshakov <roman@roolebo.dev>,
	Zhao Liu <zhao1.liu@intel.com>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PULL 24/60] target/i386/hvf: Use env_archcpu() in simulate_[rdmsr/wrmsr]()
Date: Mon,  6 Nov 2023 12:02:56 +0100
Message-ID: <20231106110336.358-25-philmd@linaro.org>
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
X-TUID: 97pm3lbawmqP

When CPUArchState* is available (here CPUX86State*), we can
use the fast env_archcpu() macro to get ArchCPU* (here X86CPU*).
The QOM cast X86_CPU() macro will be slower when building with
--enable-qom-cast-debug.

Pass CPUX86State* as argument to simulate_rdmsr / simulate_wrmsr
instead of a CPUState* to avoid an extra cast.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Roman Bolshakov <roman@roolebo.dev>
Tested-by: Roman Bolshakov <roman@roolebo.dev>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20231009110239.66778-7-philmd@linaro.org>
---
 target/i386/hvf/x86_emu.h |  4 ++--
 target/i386/hvf/hvf.c     |  4 ++--
 target/i386/hvf/x86_emu.c | 21 ++++++++++-----------
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/target/i386/hvf/x86_emu.h b/target/i386/hvf/x86_emu.h
index 640da90b30..4b846ba80e 100644
--- a/target/i386/hvf/x86_emu.h
+++ b/target/i386/hvf/x86_emu.h
@@ -29,8 +29,8 @@ bool exec_instruction(CPUX86State *env, struct x86_decode *ins);
 void load_regs(struct CPUState *cpu);
 void store_regs(struct CPUState *cpu);
 
-void simulate_rdmsr(struct CPUState *cpu);
-void simulate_wrmsr(struct CPUState *cpu);
+void simulate_rdmsr(CPUX86State *env);
+void simulate_wrmsr(CPUX86State *env);
 
 target_ulong read_reg(CPUX86State *env, int reg, int size);
 void write_reg(CPUX86State *env, int reg, target_ulong val, int size);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index cb2cd0b02f..20b9ca3ef5 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -591,9 +591,9 @@ int hvf_vcpu_exec(CPUState *cpu)
         {
             load_regs(cpu);
             if (exit_reason == EXIT_REASON_RDMSR) {
-                simulate_rdmsr(cpu);
+                simulate_rdmsr(env);
             } else {
-                simulate_wrmsr(cpu);
+                simulate_wrmsr(env);
             }
             env->eip += ins_len;
             store_regs(cpu);
diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index af1f205ecf..b1f8a685d1 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -663,11 +663,10 @@ static void exec_lods(CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-void simulate_rdmsr(struct CPUState *cpu)
+void simulate_rdmsr(CPUX86State *env)
 {
-    X86CPU *x86_cpu = X86_CPU(cpu);
-    CPUX86State *env = &x86_cpu->env;
-    CPUState *cs = env_cpu(env);
+    X86CPU *x86_cpu = env_archcpu(env);
+    CPUState *cpu = env_cpu(env);
     uint32_t msr = ECX(env);
     uint64_t val = 0;
 
@@ -746,8 +745,8 @@ void simulate_rdmsr(struct CPUState *cpu)
         val = env->mtrr_deftype;
         break;
     case MSR_CORE_THREAD_COUNT:
-        val = cs->nr_threads * cs->nr_cores; /* thread count, bits 15..0 */
-        val |= ((uint32_t)cs->nr_cores << 16); /* core count, bits 31..16 */
+        val = cpu->nr_threads * cpu->nr_cores;  /* thread count, bits 15..0 */
+        val |= ((uint32_t)cpu->nr_cores << 16); /* core count, bits 31..16 */
         break;
     default:
         /* fprintf(stderr, "%s: unknown msr 0x%x\n", __func__, msr); */
@@ -761,14 +760,14 @@ void simulate_rdmsr(struct CPUState *cpu)
 
 static void exec_rdmsr(CPUX86State *env, struct x86_decode *decode)
 {
-    simulate_rdmsr(env_cpu(env));
+    simulate_rdmsr(env);
     env->eip += decode->len;
 }
 
-void simulate_wrmsr(struct CPUState *cpu)
+void simulate_wrmsr(CPUX86State *env)
 {
-    X86CPU *x86_cpu = X86_CPU(cpu);
-    CPUX86State *env = &x86_cpu->env;
+    X86CPU *x86_cpu = env_archcpu(env);
+    CPUState *cpu = env_cpu(env);
     uint32_t msr = ECX(env);
     uint64_t data = ((uint64_t)EDX(env) << 32) | EAX(env);
 
@@ -856,7 +855,7 @@ void simulate_wrmsr(struct CPUState *cpu)
 
 static void exec_wrmsr(CPUX86State *env, struct x86_decode *decode)
 {
-    simulate_wrmsr(env_cpu(env));
+    simulate_wrmsr(env);
     env->eip += decode->len;
 }
 
-- 
2.41.0

