Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3011640ejb;
        Mon, 18 Sep 2023 09:04:35 -0700 (PDT)
X-Received: by 2002:a2e:95cb:0:b0:2b6:a3a0:5f7 with SMTP id y11-20020a2e95cb000000b002b6a3a005f7mr8495751ljh.9.1695053075699;
        Mon, 18 Sep 2023 09:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053075; cv=none;
        d=google.com; s=arc-20160816;
        b=O4KRcCXo+YayEpM+7HGiQk8A6T3Qh4n5lngnsSfMVHYiQqlL1o+F2FjoR1ZN4MnzU7
         A/immpYy4khkdfgnUB4ZFTr91akY9DuDMdzO33cz3dGS9RN/b0cOn4gRO7a86jOLYUGp
         roL1n8t77VD2v5vLZICK5TJgZSJRI53i5bI3Y5bJ2wSEtEPwvhksv4KYxPIFRwhml0+n
         MWlqiCO5BbBhpQMFWMkTuE7ikEPIGfdiSRwyzwvRR5goLnu4pFpb01IUwkJkXjgpUR/U
         RTiNBjcLGCTCCEUAsgC46HYuK748xcXTWNlL75fPTixKlE0bqWwNgTqowtKkMKLW87VH
         0d1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CLYCBr4NSqb4Srk/T+P7jn9AmbCAT10Txre246ezJ94=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=qeot0LG412y6lDmH/JHzwvx3Cni63IBxSF+i0YbvsKwyPMebJsoumWBnUB/YJTuejZ
         Yvq0PBhyngjlIOVwGRv6mb8Wh7MzWTBqBXfXM+mWH6BmQrL/f1SVg6t5DjKJGQb437wB
         Y19vhvkuNxTvhsZU8ZT4B0+Xu07BKa+6Ft0foouQNXmCzK4PuCt2jH//76w9pMJKkJAT
         7s09M1D0YAXsuOMpo0HMZmskSsg8xptynI/M2aK/bRZciVPX2ezwPEFLWIAHK9l9FDMb
         rAEKjYKBuahA3H9MjwQUvSA83XqUojRAIXSJ2sH8uZfbV8/iTGIFqjQzZXRaVCTFKc1V
         NAYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6lIupsG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t24-20020a2e8e78000000b002c01abd3a4csor431613ljk.1.2023.09.18.09.04.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:04:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6lIupsG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053075; x=1695657875; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLYCBr4NSqb4Srk/T+P7jn9AmbCAT10Txre246ezJ94=;
        b=O6lIupsGJfnQPQgH1OcXk8AdWXEMEw/lSG2epMpvGv6WnCaK9Sa8h/0KJRgOUJItuF
         Ti9kLbwl5H2P6/uJQaC0Rm2LFsRa+dJABCZh3Cvz4kbS/zlcdLE0Kw5g0AlFfqUMSMhy
         t19K+0k/H6oUjGLK9Ge1FBl7gSJIpSB+6zgWkROoxsQ6SK1zbe0HVMXuK3M+BpTuEaln
         WnKEo9ZpLOxqdOkafXbwO3EbAm0RULw2WaO4Yt0PKs0OsyTY9NyZhXiM/aK79pqqBb9N
         Ts7LDlBXHbuj7A5Sf3RTkJKEBG23Qy32HstkO2xgIUWPz1n9fd+lz5z60UXA8x7QkDyh
         DoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053075; x=1695657875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLYCBr4NSqb4Srk/T+P7jn9AmbCAT10Txre246ezJ94=;
        b=LNycvB758598iWaahaSR9nL9FLbLhDwU624TXZKBFwbNlkrnkBZpdIX/xuIVja2GIE
         VnwiAgVBKpQSNNgL+WCncT8euPPz3VbjON2h17A+tFXR6+af6HB8LFtbdEHFKKW2FhMS
         G5/vOO6uP652FBwo8+JwYBhvwTaAbwG2jhnKa8uo0UE+qZTPbitqNpB2etu7ONTMShCk
         lPnjb5SJj7UMq1fCHOX9zkPdZSWofKxXP0G/ivLqSDrZVVIgrsUqmDwmbqYj4wXVmjIm
         Zrn6WrZIuka02YlRFqNO/8AFf6j1NsF1APKA/LWR6akvNHVQ9QPIqwXKGthToUeuqJuz
         Wjsg==
X-Gm-Message-State: AOJu0YzsMb6SNXyQQuwOAh5EOe8uOiMeXrRBbcOXGZJ9Z1x0dUcHyQsd
	G75baj+zzRikG508WB3N4U7Chf9F
X-Google-Smtp-Source: AGHT+IEszpq6z0T8KHVLe1aYl3TXIxtDx0wMS/QiHJe0YDjbBZ7toGFiwcuS0GxUEQgehFRPXlIxjg==
X-Received: by 2002:a2e:8046:0:b0:2bc:b821:84ad with SMTP id p6-20020a2e8046000000b002bcb82184admr8047755ljg.16.1695053075234;
        Mon, 18 Sep 2023 09:04:35 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906560a00b0099d0c0bb92bsm6569110ejq.80.2023.09.18.09.04.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:04:34 -0700 (PDT)
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
Subject: [PATCH 18/22] target/s390x: Call s390_cpu_realize_sysemu from s390_realize_cpu_model
Date: Mon, 18 Sep 2023 18:02:51 +0200
Message-ID: <20230918160257.30127-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jPP7ENRVVgo0

s390_cpu_realize_sysemu() runs some checks for the TCG accelerator,
previous to creating the vCPU. s390_realize_cpu_model() also does
run some checks for KVM.
Move the sysemu call to s390_realize_cpu_model(). Having a single
call before cpu_exec_realizefn() will allow us to factor a
verify_accel_features() handler out in a pair of commits.

Directly pass a S390CPU* to s390_cpu_realize_sysemu() to simplify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/s390x-internal.h | 2 +-
 target/s390x/cpu-sysemu.c     | 3 +--
 target/s390x/cpu.c            | 6 ------
 target/s390x/cpu_models.c     | 4 ++++
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 825252d728..781ac08458 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -241,7 +241,7 @@ uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, uint64_t src, uint64_t dst,
 unsigned int s390_cpu_halt(S390CPU *cpu);
 void s390_cpu_unhalt(S390CPU *cpu);
 void s390_cpu_init_sysemu(Object *obj);
-bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp);
+bool s390_cpu_realize_sysemu(S390CPU *cpu, Error **errp);
 void s390_cpu_finalize(Object *obj);
 void s390_cpu_class_init_sysemu(CPUClass *cc);
 void s390_cpu_machine_reset_cb(void *opaque);
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 8112561e5e..5178736c46 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -122,9 +122,8 @@ void s390_cpu_init_sysemu(Object *obj)
     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
 }
 
-bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp)
+bool s390_cpu_realize_sysemu(S390CPU *cpu, Error **errp)
 {
-    S390CPU *cpu = S390_CPU(dev);
     MachineState *ms = MACHINE(qdev_get_machine());
     unsigned int max_cpus = ms->smp.max_cpus;
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 416ac6c4e0..7257d4bc19 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -237,12 +237,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
         goto out;
     }
 
-#if !defined(CONFIG_USER_ONLY)
-    if (!s390_cpu_realize_sysemu(dev, &err)) {
-        goto out;
-    }
-#endif
-
     cpu_exec_realizefn(cs, &err);
     if (err != NULL) {
         goto out;
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 98f14c09c2..f030be0d55 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -612,6 +612,10 @@ void s390_realize_cpu_model(CPUState *cs, Error **errp)
         cpu->env.cpuid = deposit64(cpu->env.cpuid, CPU_PHYS_ADDR_SHIFT,
                                    CPU_PHYS_ADDR_BITS, cpu->env.core_id);
     }
+
+    if (!s390_cpu_realize_sysemu(cpu, &err)) {
+        return;
+    }
 #endif
 }
 
-- 
2.41.0
