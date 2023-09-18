Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3011162ejb;
        Mon, 18 Sep 2023 09:04:03 -0700 (PDT)
X-Received: by 2002:a17:906:76c2:b0:9a6:1560:42da with SMTP id q2-20020a17090676c200b009a6156042damr8249573ejn.15.1695053043309;
        Mon, 18 Sep 2023 09:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053043; cv=none;
        d=google.com; s=arc-20160816;
        b=ifRW6N4XM1jpBZR46j83RS0+bNdX5x8Hzeq0w/D33V5nJNE7/fP/GbgS40VPBViiyr
         fVjtlpVwnx3wWTDMSOdgOA51mx1kjrcfbn/Hk6GTpAOeDWeg/xv6e+hxt8yUjtq88+a9
         sCJMtnT5mfIQW03QG2SBfZeW+huUu69P8CuFw7Fbuvd6uQEaAtIf7WjBc43ssWkeKg3A
         N13F++ZJfVZz6tJ3tUiVfnIhEXg8dw6QDRjZdZGm4ty3CAteb9Fg+XMCDTT307exy2Xl
         RL/IEtEbkq0r5mjFrcikjnwWAbCl+z+sH0E67gfJlxb17paFzozap9SLiuFpvBP33928
         d5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DBZjR8eqTRO2FcjHJbn6UW72+cRDsZ12eh5J24aMJRM=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=c5Xg5SAV78LawySnwHSlfYUz2IRNB/397WIvpmMlyMYnJtEGI/Rk/ikNroOjiUpUbW
         h9ngIlu6p5TBucErfo3e94PuRD1zleVBgJB+9VQbmoJb1s0g4niJ0rmwzmBJ5+ICrVxd
         X2/Oovv0H+8fLnqf+hq5ENHmqaUsIuo/AaJDwQ49SuNm8E2LbW4Q8kjnmIQ15ucQFT/c
         JTVlpMA8qkQCWK+6rwe85JII3F3rRMY7c9CnAKzn1kOaZenFilg0R8278iDcUAO+uUtW
         l2SlLN6+XxtjRMgrSQcL9hs/LMa3cnCgzUodO+4f6VoLFeKUW8N+Eo+1U22DuGJqb8cu
         vvIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HgarUdI/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jy16-20020a170907763000b009adae266a73sor2828971ejc.19.2023.09.18.09.04.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:04:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HgarUdI/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053043; x=1695657843; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBZjR8eqTRO2FcjHJbn6UW72+cRDsZ12eh5J24aMJRM=;
        b=HgarUdI/Po38UFUjndsOeBJAGSttXP56gR5hfa9dvdd2tL9ITebGMo6bNTreQmMbKX
         dWmCTpP5ilWV/8Df8Aqd+ei2wjf8dwfyLugRm1V4vW2oM5wwNJTJuRmAKakG+rE6Q7Ub
         KtvkEvD4SdhzqmIjIIP42HOh53zsjZ2kcV9iTkt4Q+TqS1nHLHHszpwQx7dhOyM88Cc6
         anYKuMrVaR0aGeQKNPWbMfVHgBNezlLal4SrjKH91Nx5/XmQCb2C96XciASo5ybgPj9u
         jbLOtvN8nT/137Dv+sK4CHHNBeMNWUXoIwhTtRvGXUm+PW3aWUixKVbJc8Etlzhpvzsp
         Pnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053043; x=1695657843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBZjR8eqTRO2FcjHJbn6UW72+cRDsZ12eh5J24aMJRM=;
        b=lbsZOJ5m4JP2Ha2LWWwdhaEzxuZAfD9FOxiAkxPKVRmIH1L4X78IhMgprLSEpfZYYp
         r+Xji/Yb4FvTxe+3Hkt6S4damwIFLybkDDzRNN6Vgotn3QJQ6QhGfuB4TpfRDBvZlbpO
         IwQTmQDUVActKvk1t9aiw+JOu/2+sDYSBBK9Z42UO7ltyIjd4qmzbwNzt0Rqwc6c+Uld
         j/jQmifl8t3/vq9fY7xSa8Pi8KbW00HM6qVHpmUpPcTxlx+i2DK5ZDjWSO7HGB6oWWUh
         iLiawCBFTS7xUjM4wRS/WCvUXPMDEIGt8KCfv61XOWSuXz2cwuFHfGpyYJ5qwso17QfV
         ELbA==
X-Gm-Message-State: AOJu0YyOYw9QwtLc54RF8CcHgQi7VjT8dnBH2I4HoeRPEb/RV0MvH9Rx
	8S260BbwvE7DwQjk/wKZCKG1+z6y
X-Google-Smtp-Source: AGHT+IFSQh3aSy8WNfVsJ8gBPwr/UHTrTRJ5GVnUXxcFo9z61kuLhRihhFERCd0BfPS6IwLRcpPE5w==
X-Received: by 2002:a17:906:209b:b0:9a9:fa50:1fa8 with SMTP id 27-20020a170906209b00b009a9fa501fa8mr8796931ejq.40.1695053042868;
        Mon, 18 Sep 2023 09:04:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id z15-20020a170906240f00b0099bd1ce18fesm6723198eja.10.2023.09.18.09.04.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:04:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Marek Vasut <marex@denx.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Brian Cain <bcain@quicinc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Claudio Fontana <cfontana@suse.de>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-ppc@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Alessandro Di Federico <ale@rev.ng>,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Chris Wulff <crwulff@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-s390x@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Luc Michel <luc@lmichel.fr>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Bin Meng <bin.meng@windriver.com>,
	Stafford Horne <shorne@gmail.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Markus Armbruster <armbru@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 12/22] target/mips: Create clock *after* accelerator vCPU is realized
Date: Mon, 18 Sep 2023 18:02:45 +0200
Message-ID: <20230918160257.30127-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sB7UG7Phnhks

Architecture specific hardware doesn't have a particular dependency
on the accelerator vCPU (created with cpu_exec_realizefn), and can
be initialized *after* the vCPU is realized. Doing so allows further
generic API simplification (in few commits).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 0aea69aaf9..7c81e6c356 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -464,20 +464,6 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
     MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    if (!clock_get(cpu->clock)) {
-#ifndef CONFIG_USER_ONLY
-        if (!qtest_enabled()) {
-            g_autofree char *cpu_freq_str = freq_to_str(CPU_FREQ_HZ_DEFAULT);
-
-            warn_report("CPU input clock is not connected to any output clock, "
-                        "using default frequency of %s.", cpu_freq_str);
-        }
-#endif
-        /* Initialize the frequency in case the clock remains unconnected. */
-        clock_set_hz(cpu->clock, CPU_FREQ_HZ_DEFAULT);
-    }
-    mips_cp0_period_set(cpu);
-
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -492,6 +478,20 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
     fpu_init(env, env->cpu_model);
     mvp_init(env);
 
+    if (!clock_get(cpu->clock)) {
+#ifndef CONFIG_USER_ONLY
+        if (!qtest_enabled()) {
+            g_autofree char *cpu_freq_str = freq_to_str(CPU_FREQ_HZ_DEFAULT);
+
+            warn_report("CPU input clock is not connected to any output clock, "
+                        "using default frequency of %s.", cpu_freq_str);
+        }
+#endif
+        /* Initialize the frequency in case the clock remains unconnected. */
+        clock_set_hz(cpu->clock, CPU_FREQ_HZ_DEFAULT);
+    }
+    mips_cp0_period_set(cpu);
+
     mcc->parent_realize(dev, errp);
     cpu_reset(cs);
 }
-- 
2.41.0
