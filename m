Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2867531njb;
        Mon, 9 Dec 2024 12:37:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3a6QbSErSJHEhf/TN4VpMLrCKS1PCqh5FzP5pMfLZoYh1ZBE0k+mcqdg8tgF3t1ZLHzXy+XwSVK+DSg==@linaro.org
X-Google-Smtp-Source: AGHT+IEdbESkHHuTBKwTNoCpLhIwesZl5ZWHvEm/VGxbrgJ5ZnB4F83MP8MkxutmJmGnVe5JEz5C
X-Received: by 2002:a05:6214:c64:b0:6d8:899e:c3bf with SMTP id 6a1803df08f44-6d8e71a6668mr233552976d6.34.1733776659573;
        Mon, 09 Dec 2024 12:37:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733776659; cv=none;
        d=google.com; s=arc-20240605;
        b=N0JtRUi55Gao/wtmmXCe+UsXm0ivTfQlKycq8bkd72TBV+3W87F3+3KlWDDcQHfR37
         MbcjDM+0Ki4LY1O3mLyQ8170UTeaw4sE7oY5/D5g3NwNNZ/ncZqV4v9kAgkAa52/KJv6
         VKYzWV7kin3fNOvgwNvjbq2O85vettQH+UXx+vxLwJQCTFxtoZCbUK77wU2iYETynO7M
         60oqvWoK0erEQtSohSTLCkBtqH6m/0Yb+rNpmhx9qEspmMrB2h+HBsd8I89hELO1/dib
         Tst6sw1Ay7fkxCHbIVq1aUiSNcTrpe6QbQ37fQol4SNzj6/A10i8oosESsld+eCzfbc2
         iDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Bli328WsnAA7e6BAnLZlQPV2xXXE4Q5muDDz6zeVzNM=;
        fh=1sKW4VeHNI5A+LhENg08eWaqqbJhgKaHL3ydIlO7Uow=;
        b=LLj6CIXoksvxZQn1Do73XoaHE+iITcpXW7bEMu+OtJBSdzuSaLZjMV/PFDAMxShD6w
         d3oNKTbU2rOKSClW66zMEuArDs1J8ru90frABosyqJxcjN7sgFzZkBoVtf2CxSEnPebe
         MrlRNGeF2XFmpDnymVbXHdg1xbT+p3H7mgRCTqdRSETwipCWx2xWCYnrS546jZSOFCOH
         r023qJswdb7hypdjwW7EWoj4E07UgJpnI4LlwESNVnn3A4TCVlY6GI2glllnq4VjK5sN
         HoKwqusuOtYwPCkl7ZISm2PySFU+CpjWY7v2zlU4LJ2zlsA6y92TKHe1q/x0+YlA3o6T
         egLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=e6oeiZpu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac0b91esi142819596d6.380.2024.12.09.12.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 12:37:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=e6oeiZpu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKkV9-0006Ef-LI; Mon, 09 Dec 2024 15:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV6-0006Cx-CN
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:37:04 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV2-0003Cc-Uw
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:37:04 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9f1d76dab1so549762666b.0
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 12:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733776619; x=1734381419;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bli328WsnAA7e6BAnLZlQPV2xXXE4Q5muDDz6zeVzNM=;
 b=e6oeiZpu0b+UIZK1QOuPmuI2msBB1BuTwvXFfHhiw8CVH7Tnbc2211XO7RkVhIw6ik
 OXRai7b4PdnVJ6c/1cKKc8wSqkSZL+YDPu83cybp/qbn+4DQBc8tEkGnYcm6HjkyNh4k
 VF4CesNILgEVk63FIW3SDj9ef6LIdchq/WdJZRn7VNemDmmhtX5RuCFaNq0TRKyge7nM
 XqVdPobYKbUR4i+xdZcTF7zJbgSfaKFFOckagEX7PMbKMDZQcdSTA8ngcMSRl2DJFV7l
 gNLPspyDpm6Dj7G2XI4tFXGxbwGeE3b1vrlKp657TcM/Cg7PkU/2m0LrfA9lX3ImfgBY
 AfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733776619; x=1734381419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bli328WsnAA7e6BAnLZlQPV2xXXE4Q5muDDz6zeVzNM=;
 b=f/gojmx9lf1DTxob1r+FbEFD3hFOmrRbUe0LkeHqI+FLN2vmEvJOrgji4XGMKMWtGq
 l9BUi/GF8UGaGfTMjnk4qd7wew2fopOe3WE3k8ze94bXGOW17aczm9ll6h9DP3kVv7DS
 CXhoOI+pLlOg2LyMQc790qtFERA5xHlNEKwc9pHFiPab6WvdC7HT7sikRTDoqtjy5r3F
 WxPID041URtdVI2vfc8dsFKQPcsUxBabXGbfddl4xMgSksds/XpRDIv2EN+4pFImm+Py
 XIkOsjspOoVhtfEss5br1d5BtpYqsoIdUDdvDCPMA+Ur30yuNfirJR0MuB6Ul3YB7LF5
 j1kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKoY1mC95FXGaWVa6jZKCl4B8ruRDqW+v3Ar0k6QuzMzdQ53z/tU3fHDkei9P3Tl8JizNEM3SaVA==@nongnu.org
X-Gm-Message-State: AOJu0Yyy1qvxxWdYhKkJgRBDjrrl7QJzVvq7kmnrff0hcG0uymmENdaF
 pKuZvGJM220P/c4VD3BWQLCg+EX8QLgIYcXfX+q66vK3U4Qq2iAoc3uD6rgOmw==
X-Gm-Gg: ASbGncuux3wKFJJWxw7iPHEUMWuCVneuGmzMBkqo1CkGZtYvgp+HeZzdnBTRvikhIh5
 8GJLzNxMGT8FwBrWbbR2byn1NUXiwJ8pKIC8DFhH3NUWFnTCbMCJ+F/IBWH7Oyj3cZIrQVsOaqU
 Rlvs3Gqduxy2KTT7CZqONBQXYucZBM5nQfV062Wwxyf1q8R3jeDAL/dyPSEc/CsS5sTkQuXtyjU
 0ert0KFv5R6Oniq/WPy8WfdxRNLJQ+CD31338qCEf7L9YQq9BN4iasu75H7XaNsG61YCdLSZXYL
 FyXJ7Bgs1YaaU0XWrng/k6p0NNBVng==
X-Received: by 2002:a17:906:18aa:b0:aa6:80ed:e9af with SMTP id
 a640c23a62f3a-aa680edeb9cmr609832566b.25.1733776618468; 
 Mon, 09 Dec 2024 12:36:58 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa692e4e9d5sm141783566b.129.2024.12.09.12.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 12:36:58 -0800 (PST)
From: phil@philjordan.eu
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH 01/11] hvf: Add facility for initialisation code prior to
 first vCPU run
Date: Mon,  9 Dec 2024 21:36:19 +0100
Message-Id: <20241209203629.74436-2-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241209203629.74436-1-phil@philjordan.eu>
References: <20241209203629.74436-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62c;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gXqiZtaYy1FV

From: Phil Dennis-Jordan <phil@philjordan.eu>

Some VM state required for fully configuring vCPUs is only available
after all devices have been through their init phase. This extra
function, called just before each vCPU makes its first VM entry,
allows us to perform such architecture-specific initialisation.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 accel/hvf/hvf-accel-ops.c | 5 +++++
 include/sysemu/hvf_int.h  | 1 +
 target/arm/hvf/hvf.c      | 4 ++++
 target/i386/hvf/hvf.c     | 4 ++++
 4 files changed, 14 insertions(+)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index d60874d3e6..c17a9a10de 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -442,6 +442,11 @@ static void *hvf_cpu_thread_fn(void *arg)
     cpu_thread_signal_created(cpu);
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
 
+    if (!cpu_can_run(cpu)) {
+        qemu_wait_io_event(cpu);
+    }
+    hvf_vcpu_before_first_run(cpu);
+
     do {
         if (cpu_can_run(cpu)) {
             r = hvf_vcpu_exec(cpu);
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 42ae18433f..2775bd82d7 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -67,6 +67,7 @@ const char *hvf_return_string(hv_return_t ret);
 int hvf_arch_init(void);
 hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range);
 int hvf_arch_init_vcpu(CPUState *cpu);
+void hvf_vcpu_before_first_run(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ca7ea92774..0b334c268e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1061,6 +1061,10 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
+void hvf_vcpu_before_first_run(CPUState *cpu)
+{
+}
+
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
     cpus_kick_thread(cpu);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index c5d025d557..3b6ee79fb2 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -338,6 +338,10 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
+void hvf_vcpu_before_first_run(CPUState *cpu)
+{
+}
+
 static void hvf_store_events(CPUState *cpu, uint32_t ins_len, uint64_t idtvec_info)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-- 
2.39.3 (Apple Git-146)

