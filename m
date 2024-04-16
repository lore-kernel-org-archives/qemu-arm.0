Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp573890ejd;
        Tue, 16 Apr 2024 12:03:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNHZda1lx26BSPRqEqh7l4VpmR3zEahDkPMwEmzmEmPHObqV4Aby1QLhBB8ldxv5/lC1V1eEzb88F8RQnb807x/VIxQS4m
X-Google-Smtp-Source: AGHT+IEAyP8gkQd7a77cXUHlUN5hvbmlKMUhdHESGIHugkUiTSUKJY7z3JiobALOczWpWLHowTK7
X-Received: by 2002:a05:6102:3c97:b0:47b:9874:514a with SMTP id c23-20020a0561023c9700b0047b9874514amr2851151vsv.5.1713294199176;
        Tue, 16 Apr 2024 12:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713294199; cv=none;
        d=google.com; s=arc-20160816;
        b=b1i8KZKNQrTxDE7Ley6dvUB11u16t9qjjrpnj6rNx1CUvHV+p7bjG1omV/TlKAjg0p
         MQSENz0SUqQTPfPn1gegaaUewFeZcGWdA0/fO4KXo+sSiCzrd1Sm/0PR4rrsd7w8IYI/
         JlbefqtJ9RoeWAAnIUyD29eMoGc85ULfM2B5t3sm9wgo8zYgJL/2/VC6eyjVqHxDmRrO
         HX25S7eZTXNg7XO+ho6LMxqk/zIXGSTAbT8aY10R6/pX7zuE+7ygVXnQW93PetBRYUMM
         /579xchY5L3SBwIsNLuppwbcYW+8h9vIhLtHI+rTqzjMf9yGE6X0MwZk/T0vQe+FtbDL
         ccqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h1653K/UfEWnXUTbr/YeJw2UmUosHHOUFfds+vppZrE=;
        fh=e65F0ZsnVkvCfG4D78ncJkIJ0xVLyuoJTUpbf/1U6qU=;
        b=o8CO68Dqr56zoUJAS15LhJZIgX5UPLe/RI1gK6hN58fYKATckwH2U1AfAvh8yV8gm/
         gGfXlkA6k3zpBLAS4k9RsPLCs56PygPtZFoV+9YVz7gbtxD4T/A5KfMyTHQ89fINx+gO
         obHyfekRUMrHrJmDRyflADp5CYK7YscvHs5VorGCCScH2/2qaroS1jFocCzN5AxE5mDK
         83qT2GopyGC0Mk2Ce9v7EZApo6rEtVI2LhEAdlCBGeyZ60BhNaYWG1FJ72cCJcD8+RGP
         y1X3QFsxVhS01Nrahk2yXy8rxPOPKUlBxG1VSW/Yoq/bMZdkUicccOkQ/+XIlTJJ3gKz
         sc2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1uu1bXd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v26-20020a056102303a00b0047a0c92e0d0si1904867vsa.823.2024.04.16.12.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 12:03:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1uu1bXd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwo4L-0004Ef-Dg; Tue, 16 Apr 2024 15:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwo4E-0003Uv-7s
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 15:02:08 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwo4C-0005tl-3g
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 15:02:05 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5193363d255so823062e87.3
 for <qemu-arm@nongnu.org>; Tue, 16 Apr 2024 12:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713294122; x=1713898922; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h1653K/UfEWnXUTbr/YeJw2UmUosHHOUFfds+vppZrE=;
 b=m1uu1bXdSeZn95aU1obdUE+N8UpmxJNLlyH3r5X5RSKi06txBlJsLRQMVBh4ZsI6oF
 5SYh+aa3YvHPNO7p7hmWL4GoJM6y+1BmZLf0oAN5c+VksvXVuAzi4WDIYOHa55cEmeuo
 p6kGy1xPcalKykCSlcGZNtkDDG2qDia+dPBWx8cqd6MWi2IuqEIJKXfs6Am7oqYbRWyh
 sE0DSE8LLy/rO7cGXPJ9ldDrUJUkz75P8fB1knZhlRw4cv8qbpwdRaR6GAwzVwvWlQaV
 /jPjxRMF7RgywrF0eqmm4sigJdTvVFCWIvenwqELTHiZJg5QDQQiAd3sIf69i3LZsdk6
 kSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713294122; x=1713898922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h1653K/UfEWnXUTbr/YeJw2UmUosHHOUFfds+vppZrE=;
 b=CwUc+WAdyAeTApY4juJUy4wGlbT5y/lyblIfErNNfnh7VVdNY9m+kFrUXMb23F9kNW
 pfrcr4PXDT0osqiAHtcJ0p7NQqFJaMP46uDMg6lP1Uc7U3WrK4TOTmukxUUv044lcuPD
 w1xSZYfANWiE7ayRmQ5Kufah2JI2etbSqzm9508+IZKIYr+eYs0KIJoIavCeAKx8h7Vd
 9I7oHRrBXLRY+tcd8CnkXkLOJDEQQ+OnyM3WvlU4YfYOAhF0IFH3OmBcEU2Fsb9QQFQk
 t2BlAavd5mSlCwpPR5Ft7j23pTNMz7FSt4pwSSs9edeWR4OkUf7NwrDpckTYMMEJWsHg
 YZ8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWisS/UflaX52twp8sP+1H0dKJErU4Rp71t+/rTXs6+FiodUQ3k8vnnX/58yyFBJExVx2+nKvi3L152tXHr1ZEc2ZX0
X-Gm-Message-State: AOJu0YxQcCSXZhAguOSUwP+8WwnCfAYEWqSD6n5vNJQ7AXwLT5jUcbVV
 4OjyKrubhMkEfmeRR7553oFhBdY+RgDGUzuMWAi6kIbgAd9/+ALnxpv9Hq2NPoo=
X-Received: by 2002:ac2:5a0f:0:b0:518:d259:8542 with SMTP id
 q15-20020ac25a0f000000b00518d2598542mr5101592lfn.2.1713294122153; 
 Tue, 16 Apr 2024 12:02:02 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a170906470900b00a51a74409dcsm7262977ejq.221.2024.04.16.12.01.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 12:02:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v4 21/22] target/i386: Remove X86CPU::kvm_no_smi_migration
 field
Date: Tue, 16 Apr 2024 20:59:37 +0200
Message-ID: <20240416185939.37984-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VeE0EPRSzNbA

X86CPU::kvm_no_smi_migration was only used by the
pc-i440fx-2.3 machine, which got removed. Remove it
and simplify kvm_put_vcpu_events().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.h     | 3 ---
 target/i386/cpu.c     | 2 --
 target/i386/kvm/kvm.c | 7 +------
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6b05738079..5b016d6667 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2018,9 +2018,6 @@ struct ArchCPU {
     /* if set, limit maximum value for phys_bits when host_phys_bits is true */
     uint8_t host_phys_bits_limit;
 
-    /* Stop SMI delivery for migration compatibility with old machines */
-    bool kvm_no_smi_migration;
-
     /* Forcefully disable KVM PV features not exposed in guest CPUIDs */
     bool kvm_pv_enforce_cpuid;
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 33760a2ee1..f9991e7398 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7905,8 +7905,6 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-vendor-cpuid-only", X86CPU, vendor_cpuid_only, true),
     DEFINE_PROP_BOOL("lmce", X86CPU, enable_lmce, false),
     DEFINE_PROP_BOOL("l3-cache", X86CPU, enable_l3_cache, true),
-    DEFINE_PROP_BOOL("kvm-no-smi-migration", X86CPU, kvm_no_smi_migration,
-                     false),
     DEFINE_PROP_BOOL("kvm-pv-enforce-cpuid", X86CPU, kvm_pv_enforce_cpuid,
                      false),
     DEFINE_PROP_BOOL("vmware-cpuid-freq", X86CPU, vmware_cpuid_freq, true),
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e68cbe9293..88f4a7da33 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4337,6 +4337,7 @@ static int kvm_put_vcpu_events(X86CPU *cpu, int level)
     events.sipi_vector = env->sipi_vector;
 
     if (has_msr_smbase) {
+        events.flags |= KVM_VCPUEVENT_VALID_SMM;
         events.smi.smm = !!(env->hflags & HF_SMM_MASK);
         events.smi.smm_inside_nmi = !!(env->hflags2 & HF2_SMM_INSIDE_NMI_MASK);
         if (kvm_irqchip_in_kernel()) {
@@ -4351,12 +4352,6 @@ static int kvm_put_vcpu_events(X86CPU *cpu, int level)
             events.smi.pending = 0;
             events.smi.latched_init = 0;
         }
-        /* Stop SMI delivery on old machine types to avoid a reboot
-         * on an inward migration of an old VM.
-         */
-        if (!cpu->kvm_no_smi_migration) {
-            events.flags |= KVM_VCPUEVENT_VALID_SMM;
-        }
     }
 
     if (level >= KVM_PUT_RESET_STATE) {
-- 
2.41.0

