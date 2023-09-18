Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3011548ejb;
        Mon, 18 Sep 2023 09:04:30 -0700 (PDT)
X-Received: by 2002:a05:6512:1090:b0:4fb:8948:2b28 with SMTP id j16-20020a056512109000b004fb89482b28mr10666828lfg.63.1695053069842;
        Mon, 18 Sep 2023 09:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053069; cv=none;
        d=google.com; s=arc-20160816;
        b=XVYvpb01NnNbN7QpC8n2zVa5xZIKeJMM9Idz7E2IRBAfcDQuYyqjQaLambwEwb8FrO
         dJp0lNU9Nu+vIOoDLFyn14s2ixmVqRK+WDgmhAQ0jixU4J7gq96GUy6TioVS0flgUQI/
         IZfQEpOKXsewu90Lb7+36J5YhrXzuYjG8sSg6tOqOLZNHROcNV53fQORz6FnE7ClbVD0
         uwmgAj8ltK3Fn7FavRt6c8Rd4WmHu/F7oN+dolF1wmkZGTDNxrp6N+iNSXqW+54unjTo
         Op+7AOh2UmdEUVRIRsUTDuwRiYzrfQsUpr9ijVJ/RgratCP2ZliDzxbE4d5GROxPZIn3
         Ht9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZP1Jq5UriapAIWJmFwmSYSQUUVqpdEGdHuUn9UNvH2c=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=z+MM0jHS2grvOtnpxKsHCpy8uPXdbsEBmBr6nCUq6qzXvbB1XGDKddMm9O1uIHPGnh
         lvowdijwvf6mQ4EA+EjsmMF8NFwH2bNVSnDGyBKwdd3Fod+mXCunXoq4wZDyDjQxicw6
         C16qaGlpqK1a8o74WmwvNpLa/87sNZYuJBuh5HBsBFTuYghLMYyrZ1Xe/iRUAWqdMCvo
         YF0DwdPibmFg6fhWhqwbULGQlQUf8cCPSR7Ld0G2ZvD9M0KhyIVEOA3DnMhJTAL/Unak
         5PyO9VLFvwiuFURTJuawBn3L4YJjJVeUe7M4SN1zmgzTw8dpQFVrTo4kwf35QdB6mZ5W
         SiXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrARGhXz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g12-20020ac24d8c000000b004eb015eab08sor3008589lfe.9.2023.09.18.09.04.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:04:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrARGhXz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053069; x=1695657869; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZP1Jq5UriapAIWJmFwmSYSQUUVqpdEGdHuUn9UNvH2c=;
        b=SrARGhXzTci8WenaQLuzixTEKbOaz/HSqhVM2MCy/JFL3keeRa6vXMt75a21HOWdZ5
         yReVCuqtiUAOlQZXV8c5OpACTBsXmFXWBm+0Swk0EdoxrTCESBmgxFn9oWw7e4MjJUxK
         lVeCD/KcNZ8xz6+gOXM6cJRpbMg14rGaRgV8ZfVoLlP/UnZ4Jp5oFaEND9ldqGZUIGmO
         4wH0481fJGjL0iGHg889kIRNqN35rhalrC16xMcHzN+eXaSx5OkPb4la3Xeb5F3fV4zO
         xRSj5jvL42YhJZv6G+P6RXZRN9XmvKyb2av9TlvcpEzgvk4O7a7QaVS5KwP4gXgbDRgT
         lw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053069; x=1695657869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZP1Jq5UriapAIWJmFwmSYSQUUVqpdEGdHuUn9UNvH2c=;
        b=NK4fExZDkYhmGyQMXlHOk2OYE9maHPZkOlZdOCW3jeqVbBQfr+EahT/BNCwiPX6Lyd
         u7rd20Ml+Gl+7ycUfKq50DjDj8cozCkYd4CNkY8G3Ww6UWbx1kifrd1icdPqgAR1Szyn
         SpwHja9TZp6PjLP6huC4/fvPYs9dt0SrtM/F10xjve3zvuSHXy1M3LlAuL1E87Uivb0G
         w8ZvgwIuoymoyz2BQN42qLf01gxx/T1awlC4v21U4ekWzIDx82QiaKs074H8J5xukQBC
         znp7FwXLzHf+17I9VxplgXBxRN1nXmqjBAHSceeHReEgcN9GEp2JJC+UcOtXMshwvw9J
         jeOg==
X-Gm-Message-State: AOJu0YzfYnJmpMfGQwE2APk66fzN/Gu9z4pFX49EV13gvOnhtj3k587/
	owHypig8wf+cfpNbQMDEXoiAa/F0
X-Google-Smtp-Source: AGHT+IHqyjalPcNFI3j/eC2mJhJCqyXLJDQU80ViEPpsSEn13nBGjwNzQvCpQXl9ahmUuhJ660k6zA==
X-Received: by 2002:a05:6512:31cd:b0:503:1722:bf3a with SMTP id j13-20020a05651231cd00b005031722bf3amr3370635lfe.1.1695053069418;
        Mon, 18 Sep 2023 09:04:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id ec31-20020a0564020d5f00b00530a9488623sm4149603edb.46.2023.09.18.09.04.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:04:28 -0700 (PDT)
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
Subject: [PATCH 17/22] target/i386: Extract verify_accel_features() from cpu_realize()
Date: Mon, 18 Sep 2023 18:02:50 +0200
Message-ID: <20230918160257.30127-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RK5855bItYps

When looking at the x86_cpu_realizefn() method, most of the
code run before the cpu_exec_realizefn() call checks whether
the requested CPU features are compatible with the requested
accelerator. Extract this code to a dedicated handler matching
our recently added CPUClass::verify_accel_features() handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu.c | 62 +++++++++++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d79797d963..2884733397 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7208,26 +7208,19 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
     cpu->hyperv_limits[2] = 0;
 }
 
-static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
+/*
+ * note: the call to the framework needs to happen after feature expansion,
+ * but before the checks/modifications to ucode_rev, mwait, phys_bits.
+ * These may be set by the accel-specific code,
+ * and the results are subsequently checked / assumed in x86_cpu_realizefn().
+ */
+static bool x86_cpu_verify_accel_features(CPUState *cs, Error **errp)
 {
-    CPUState *cs = CPU(dev);
-    X86CPU *cpu = X86_CPU(dev);
-    X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
+    X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
-    static bool ht_warned;
     unsigned requested_lbr_fmt;
 
-    /* Use pc-relative instructions in system-mode */
-#ifndef CONFIG_USER_ONLY
-    cs->tcg_cflags |= CF_PCREL;
-#endif
-
-    if (cpu->apic_id == UNASSIGNED_APIC_ID) {
-        error_setg(errp, "apic-id property was not initialized properly");
-        return;
-    }
-
     /*
      * Process Hyper-V enlightenments.
      * Note: this currently has to happen before the expansion of CPU features.
@@ -7236,7 +7229,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
     x86_cpu_expand_features(cpu, &local_err);
     if (local_err) {
-        goto out;
+        return false;
     }
 
     /*
@@ -7246,7 +7239,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     if (cpu->lbr_fmt != ~PERF_CAP_LBR_FMT) {
         if ((cpu->lbr_fmt & PERF_CAP_LBR_FMT) != cpu->lbr_fmt) {
             error_setg(errp, "invalid lbr-fmt");
-            return;
+            return false;
         }
         env->features[FEAT_PERF_CAPABILITIES] &= ~PERF_CAP_LBR_FMT;
         env->features[FEAT_PERF_CAPABILITIES] |= cpu->lbr_fmt;
@@ -7265,13 +7258,13 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
         if (!cpu->enable_pmu) {
             error_setg(errp, "vPMU: LBR is unsupported without pmu=on");
-            return;
+            return false;
         }
         if (requested_lbr_fmt != host_lbr_fmt) {
             error_setg(errp, "vPMU: the lbr-fmt value (0x%x) does not match "
                         "the host value (0x%x).",
                         requested_lbr_fmt, host_lbr_fmt);
-            return;
+            return false;
         }
     }
 
@@ -7282,7 +7275,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
                    accel_uses_host_cpuid() ?
                        "Host doesn't support requested features" :
                        "TCG doesn't support requested features");
-        goto out;
+        return false;
     }
 
     /* On AMD CPUs, some CPUID[8000_0001].EDX bits must match the bits on
@@ -7296,12 +7289,28 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
     x86_cpu_set_sgxlepubkeyhash(env);
 
-    /*
-     * note: the call to the framework needs to happen after feature expansion,
-     * but before the checks/modifications to ucode_rev, mwait, phys_bits.
-     * These may be set by the accel-specific code,
-     * and the results are subsequently checked / assumed in this function.
-     */
+    return true;
+}
+
+static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
+{
+    CPUState *cs = CPU(dev);
+    X86CPU *cpu = X86_CPU(dev);
+    X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
+    CPUX86State *env = &cpu->env;
+    Error *local_err = NULL;
+    static bool ht_warned;
+
+    /* Use pc-relative instructions in system-mode */
+#ifndef CONFIG_USER_ONLY
+    cs->tcg_cflags |= CF_PCREL;
+#endif
+
+    if (cpu->apic_id == UNASSIGNED_APIC_ID) {
+        error_setg(errp, "apic-id property was not initialized properly");
+        return;
+    }
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -7950,6 +7959,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
+    cc->verify_accel_features = x86_cpu_verify_accel_features;
     cc->has_work = x86_cpu_has_work;
     cc->dump_state = x86_cpu_dump_state;
     cc->set_pc = x86_cpu_set_pc;
-- 
2.41.0
