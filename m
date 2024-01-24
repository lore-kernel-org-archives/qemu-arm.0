Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp382466ejq;
        Wed, 24 Jan 2024 07:54:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENfosHXFwcx5qSQ2IpfyFCL4APifCcWRMBwpFZ1aDamNxwf5fkcY3nqwSTZZ2jF1nJ73qf
X-Received: by 2002:a92:c64b:0:b0:361:92f8:88b5 with SMTP id 11-20020a92c64b000000b0036192f888b5mr1777704ill.106.1706111690049;
        Wed, 24 Jan 2024 07:54:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706111690; cv=pass;
        d=google.com; s=arc-20160816;
        b=SNPB3W+cyOOGzpFSsCCaWmE4OvFdSFo4YyhDWb2VWzGrai0ZofaL54uZGS343U4Lj4
         dzzkyEIhzNBR0Jrfg46Gxw8lQ7WZv2CD4B516eDGldE0zJxwXTFVxgJHOl6KJL9aHr9K
         /dzYMm/OXBxike1TXUwuZ4ev09b+JxbYQ1oK22DOdjk6KpLSmQgPxxlpwvbMagTETOKP
         qDTh82S4aUlG3C+/eNCt4XKXw58FzdNu2uBE2gtxxiZkjGSsTmpenYAtPIL5p00NqmZN
         RpaQqCMA9ZF9VuD61JZaPqLt1+heXvoreubTxFLuV0K5O7/EDedYMs0XVXW1ZRM/Xonc
         flFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=v3Z0Jq1OM+053LyGdHXwEFjN+ojKTQFR08GCVhW4ybo=;
        fh=xK/PpTBdOmWf4C8q/qM/JEZSr/jQk367oOzmeGjbBKo=;
        b=ieF5nZAd88p5hRtCKUfFc5Ui1oqzRVv52yVEvlrfgcwDr2HhoFrmc8PH4XOgwsIsEi
         M2wKCpuqquALm7ypk1YuWoGSfjBYt2NWAyB6LowPPKqYJ1szjfK089yZgk7oR7s/JzkK
         bd782ZyGnAcVBz6Z09uO2L/MAkKqCgBsThJSkBx5tvmRVn5rtg+cSOaV0vthi1nF5u7G
         mKJG0MdXV0tiHTreTYFi/3uN0TebLVbbMew5VdgZJCzqoGRlcx8tbefsd6fRH6w4IJL3
         npwnvOW4UIHE0tYFln1ASP5vBrGzBu7+XPwLkhPOsmKApplAYbH+RBosirmuDIb3NTvG
         n9JQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLuL+SZ4;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6840-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-6840-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-6840-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id w2-20020a631602000000b005cfbeee4c1dsi7673481pgl.314.2024.01.24.07.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 07:54:50 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6840-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLuL+SZ4;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6840-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-6840-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E07328B582
	for <alex.bennee@linaro.org>; Wed, 24 Jan 2024 15:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1531F43154;
	Wed, 24 Jan 2024 15:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WLuL+SZ4"
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4607CF01
	for <kvm@vger.kernel.org>; Wed, 24 Jan 2024 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706111684; cv=none; b=GK1Uj4lo8z/pPxUaVbG130ODRGVHK5ZFI/BHADBEwVoMqQZjit96NnjqJ84ZRPePLPWBuSTOD9b1r49g+nXZEald4rsd0ft+7WnB/QF2CKqkUn7SVDvsaUidjzl39tGcJ9fdSxe/bVAFBRETQMbWFAjqOrrLHuQqT1UPmNpWgrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706111684; c=relaxed/simple;
	bh=j+BVpcz2XWaeeEAH59opB8t/0vTtup6odtKMebX6ikA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SkR4pJw1syeGUCBNGDcRgs7uDU0iPecJ+VkFZII0WckWdZ1hmel98oBCyQqamKmqMK3IF8RY4FzobVMz1VkDvUCMVEO7J6QAhcmGndERECYF5LiX+rUqwPstbX24CViKiyN0Hjhu6YPXnYIrLyKxDUSjY936lg8QMiq/s4SZ4gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WLuL+SZ4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40ec048e0c1so15695615e9.2
        for <kvm@vger.kernel.org>; Wed, 24 Jan 2024 07:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706111681; x=1706716481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3Z0Jq1OM+053LyGdHXwEFjN+ojKTQFR08GCVhW4ybo=;
        b=WLuL+SZ4U24dj3tXe3ZRY35ttUKv3wrueQxibZDPsjdKp625tZRNs6eTqIPBN2jq4P
         JaAl+h9+IkF3DVg50NAg4WfXnxiYZYRYWq6P5IIH6Q31HjSFa5psBg+0FBbUfGd+it2o
         e/jUduf0695ONTqGRZNo6ApgRZ2Obq4yApaICc5RVmlqFM8P8HOExkGvhNmXMY2AMr3q
         6q2x1OpOitONT/ZmjSsrVguqMjo2NuxVVR5qZKFmgXTI7F/9o5Zd4cIhSRHdoFqPYarh
         U19Wjf8N6iHzJ9kpHCf0818nkK5k8Xb7xli5p4We1BCoHT7Yhf2X+qwbKxa6LwMGrkk8
         aVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706111681; x=1706716481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3Z0Jq1OM+053LyGdHXwEFjN+ojKTQFR08GCVhW4ybo=;
        b=Db5wZ3oUmVQ5cQK6hsR/uuPo1bDCRiof/knYeEsvB0L1c0mom0QJO5826PrwM6Xgm5
         YewEDH+dp18dgnkCLUP0jLj0L8buDgqARlbbEIL5pLUW98m2SLUPD3U/D3tgFLNeE56J
         pj4BBKgk/+h3FLHy8e3Or5UfKzWOnYrHKicwbYa5NSsCpcWLmu5uQ1+7VIo2t34yZIgJ
         HkpFsGr/Djpa/QfQdUB7kGj343ejsrCHNSZdT+s34Gy0sC6qt2FRClom+f3T/kNJZdOD
         GpGyn7z81XrkTP6iq7gyiiGxCKao74xl2ZpYyiwJuaw2zabLli2ltgTyqdR6uWTVwlfk
         drQg==
X-Gm-Message-State: AOJu0Yw3nsSsO29Q0gOECDSLBO3yd6p/5a4WVJN06n25ph3MGLW6k/jY
	ztVhatI+fqYVrarucpeqUckN0SEt9YoIHhesRslOnO5iBO6oU7HOnGrieyQ7zVE=
X-Received: by 2002:a05:600c:4f87:b0:40d:8810:468b with SMTP id n7-20020a05600c4f8700b0040d8810468bmr1763339wmq.88.1706111681634;
        Wed, 24 Jan 2024 07:54:41 -0800 (PST)
Received: from localhost.localdomain (lgp44-h02-176-184-8-67.dsl.sta.abo.bbox.fr. [176.184.8.67])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c4f0700b0040d5f466deesm57530wmq.38.2024.01.24.07.54.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jan 2024 07:54:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] accel/kvm: Directly check KVM_ARCH_HAVE_MCE_INJECTION value in place
Date: Wed, 24 Jan 2024 16:54:25 +0100
Message-ID: <20240124155425.73195-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240124155425.73195-1-philmd@linaro.org>
References: <20240124155425.73195-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: C9BriB0FM40m

Directly use KVM_ARCH_HAVE_MCE_INJECTION instead of
KVM_HAVE_MCE_INJECTION.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/kvm.h |  6 +++---
 accel/kvm/kvm-all.c  | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 2e9aa2fc53..4107678233 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -350,11 +350,11 @@ bool kvm_vcpu_id_is_valid(int vcpu_id);
 /* Returns VCPU ID to be used on KVM_CREATE_VCPU ioctl() */
 unsigned long kvm_arch_vcpu_id(CPUState *cpu);
 
-#if KVM_ARCH_HAVE_MCE_INJECTION
-#define KVM_HAVE_MCE_INJECTION
+#ifndef KVM_ARCH_HAVE_MCE_INJECTION
+#error Missing KVM_ARCH_HAVE_MCE_INJECTION definition in "cpu.h"
 #endif
 
-#ifdef KVM_HAVE_MCE_INJECTION
+#if KVM_ARCH_HAVE_MCE_INJECTION
 void kvm_arch_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
 #endif
 
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 49e755ec4a..b98c0843b1 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2750,7 +2750,7 @@ void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu)
     run_on_cpu(cpu, do_kvm_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
 }
 
-#ifdef KVM_HAVE_MCE_INJECTION
+#if KVM_ARCH_HAVE_MCE_INJECTION
 static __thread void *pending_sigbus_addr;
 static __thread int pending_sigbus_code;
 static __thread bool have_sigbus_pending;
@@ -2855,7 +2855,7 @@ int kvm_cpu_exec(CPUState *cpu)
 
         attrs = kvm_arch_post_run(cpu, run);
 
-#ifdef KVM_HAVE_MCE_INJECTION
+#if KVM_ARCH_HAVE_MCE_INJECTION
         if (unlikely(have_sigbus_pending)) {
             bql_lock();
             kvm_arch_on_sigbus_vcpu(cpu, pending_sigbus_code,
@@ -3339,7 +3339,7 @@ void kvm_init_cpu_signals(CPUState *cpu)
     sigaction(SIG_IPI, &sigact, NULL);
 
     pthread_sigmask(SIG_BLOCK, NULL, &set);
-#if defined KVM_HAVE_MCE_INJECTION
+#if KVM_ARCH_HAVE_MCE_INJECTION
     sigdelset(&set, SIGBUS);
     pthread_sigmask(SIG_SETMASK, &set, NULL);
 #endif
@@ -3358,7 +3358,7 @@ void kvm_init_cpu_signals(CPUState *cpu)
 /* Called asynchronously in VCPU thread.  */
 int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr)
 {
-#ifdef KVM_HAVE_MCE_INJECTION
+#if KVM_ARCH_HAVE_MCE_INJECTION
     if (have_sigbus_pending) {
         return 1;
     }
@@ -3375,7 +3375,7 @@ int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr)
 /* Called synchronously (via signalfd) in main thread.  */
 int kvm_on_sigbus(int code, void *addr)
 {
-#ifdef KVM_HAVE_MCE_INJECTION
+#if KVM_ARCH_HAVE_MCE_INJECTION
     /* Action required MCE kills the process if SIGBUS is blocked.  Because
      * that's what happens in the I/O thread, where we handle MCE via signalfd,
      * we can only get action optional here.
-- 
2.41.0

