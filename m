Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp439910njb;
        Wed, 4 Dec 2024 11:06:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOs+htJLLWgpgzJgsccubhWuiqi43/NwN0uRvxXBZo7Uq6ltp1O+Eona0q/9/M50gcDYIjHx7V8mQnLg==@linaro.org
X-Received: by 2002:a05:600c:3596:b0:431:50cb:2398 with SMTP id 5b1f17b1804b1-434d48291b5mr36052755e9.2.1733339206303;
        Wed, 04 Dec 2024 11:06:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733339206; cv=none;
        d=google.com; s=arc-20240605;
        b=GCIdfrbhbHHCBdWIRQ6886L97HMc5h2+PK+SqIxP/c2CBIqzVQxQ4K+pPBlI8FC4BW
         euUPmRl9W8R1lp+TO+RjLIfELJ7xI2N7nntKatzcuxpL8BOn+dk8rYNKDRsezq64jjUm
         ck2BfeYRTBGKBvqp3LX9xndQGGtkCJM+fQVd67aRxECmzUl2UEW2UMp5k4kbJCHTupMP
         BYmHKFJV6SRRgkwMe8NZZBU5zJR2XhyuNf6qztZXxBA6MqsiL1PPDbMtGBQJWpIHxYK8
         HAmOCoOfM8m1ogBQPqw/eX0IMax6aJjLayIEbw5h6e831o1Qnd9ZOz2B/0cEPGcveVFJ
         V0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=0ibIy2drWP56YRJu1nbNoc3IL9Q6+0UkelpHO9ibKjU=;
        fh=RUKkiBfxjZX5ZZ+nC6X3t2AfSuKVu48kASggGPU6kFc=;
        b=EIhsy3EUOfIBHaCmx7Tpb5ZEWGXuYjTyGWQ9aUH2AcBoT7/nYVLawjVATSjck/cJ6L
         q2TazuVrpfM1Q2JTS1oYEQfUtDoFo1/ul5gxOMZX5Y2gZjdJGWBwymkDNgQDWrmt+KjX
         9JHhdSyV8VezdDUKxGwq/0qqnOsc9uPfcf3mkZyKVg6c2U3Iv0uSxxF2jVgKhxMP3Sx+
         rxpnPcV3eqjMVdfN/MSOA7PbRn3PyaufQxPAoUicNds8dTTf/NUhtAKjIh1S/mNdFSLa
         xaeLRGkyYPDPSDXSoFvIFhWQuLsQs04RtxdBpzcGBoW9Le+veAXSUj09MyjT6mG2388e
         ltNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EbLAjn/K";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b109f53bsor57560725e9.10.2024.12.04.11.06.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 11:06:46 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EbLAjn/K";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733339206; x=1733944006; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ibIy2drWP56YRJu1nbNoc3IL9Q6+0UkelpHO9ibKjU=;
        b=EbLAjn/Kln9d54b2QTeLnP587RkKEhHNxFmr4vRIXYGJ9CQ98KcWyJEJagoeLmxRua
         S2F6w9t/cdegUs736lVc6SGE3vbFE8Rzf/M9BioGOeWDv7COTEZxueR40awd52sC13Dr
         CvtElWtdq5B6Duz4ge6EPspKm8bkW00tpZvT8Jg0umazIbXDZW1Ql3y/AjPGIOou0UjF
         8dZ5YPPmlpuRcCCU1Spb+NlB1aPcAvVeMZZeeqXoccSKmtBd9jhhmioU/Fd8FzHuuJal
         aZrhxpD3btV2GejRA+KLpH3uBJcR3a1C3FNFkK5VWNvOPdFZ///o0HyrXb6xKx1u6apD
         xMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339206; x=1733944006;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ibIy2drWP56YRJu1nbNoc3IL9Q6+0UkelpHO9ibKjU=;
        b=lM+fj8/MZnSCBsmmDGdPKE5+0wccNsJnj45ig0e/GVA2NY6/MazCh+osmkmJo8XEA4
         Xsv+CpMh+nKap3Y8QZHbM4W04r6PffiE8InDMeGOYrqdKG1ygiAL05Rc9aMiml5Pt0he
         raXlxn525A8c/nT/pg21eSQxpG8oG6Ularv/2mpi+Ue5NwdBLHsN1+/a2iSfcTCib/d7
         1ZEVMB8OLuGB/AZ2Ut6ZJ7K/r9p/mLKezwGt/u6sfDtSCSilMlbltNMA6Q19m3kecALD
         vASrNVZ2SdVSOIw7HjHZ7+zu4espydLdoS4bH0FrawdPzwinZCjFHk9AQzqCdn62e/yM
         azOg==
X-Forwarded-Encrypted: i=1; AJvYcCWaOzU83l/XGY4niLpg9hqrn+iqFuS01Aetmb+yjiATBgEluuzn1T7F1lC6+H7uPOHAzLn4XMkP9ZNT3Q==@linaro.org
X-Gm-Message-State: AOJu0YzCjYG8lv0Nwizp//vPmLppeEPe+j+5oYL+QMQ169kIZcyEsgTH
	ESvqR42gv1ytW4xG5NXstmCkwRpdpkmBSGO0lBrAl7/XShMnSfjv0+T9fwN68C4v9w==
X-Gm-Gg: ASbGncv4lmlwIZ9Pn6AUUs4viioeWzl+4o6IA1mMaEeal3R5wg0RjKAT9D3xyt5Y5fZ
	ZvIfmsMWxRzRHfFJSYB0t0T1c5ZAyADeYMhn3GX7cJBabGtx8H6u/NAaK8K/dw3bCx+df6Hohxz
	OpHHf8jyoHlgnmOpgvbjrJFPWXCWIFxCHlM42HXc5DMsro35fAReG3vOJFOvQ3Nv5w1z9gXvCQF
	tybupkJrdwM7eAMxEnFAwn78UZvQOATefjJSWrZoCPtMb9A
X-Google-Smtp-Source: AGHT+IFQTxPt1P+huYZnrYZ9Ew3tM5Ox2QrI9oPJToAe/ipqyTN+KqSlax2aZU/GU5HwiM9aJJmhIw==
X-Received: by 2002:a05:600c:524d:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-434d09ce368mr70376045e9.16.1733339205742;
        Wed, 04 Dec 2024 11:06:45 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bc7sm33384065e9.35.2024.12.04.11.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 11:06:45 -0800 (PST)
Date: Wed, 4 Dec 2024 19:07:08 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 01/26] kvm: Merge kvm_check_extension() and
 kvm_vm_check_extension()
Message-ID: <20241204190708.GA2349278@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-3-jean-philippe@linaro.org>
 <Z0W_LzcGOfoBveKA@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z0W_LzcGOfoBveKA@redhat.com>
X-TUID: dbuaRBmXXksz

On Tue, Nov 26, 2024 at 12:29:35PM +0000, Daniel P. Berrangé wrote:
> On Mon, Nov 25, 2024 at 07:56:00PM +0000, Jean-Philippe Brucker wrote:
> > The KVM_CHECK_EXTENSION ioctl can be issued either on the global fd
> > (/dev/kvm), or on the VM fd obtained with KVM_CREATE_VM. For most
> > extensions, KVM returns the same value with either method, but for some
> > of them it can refine the returned value depending on the VM type. The
> > KVM documentation [1] advises to use the VM fd:
> > 
> >   Based on their initialization different VMs may have different
> >   capabilities. It is thus encouraged to use the vm ioctl to query for
> >   capabilities (available with KVM_CAP_CHECK_EXTENSION_VM on the vm fd)
> > 
> > Ongoing work on Arm confidential VMs confirms this, as some capabilities
> > become unavailable to confidential VMs, requiring changes in QEMU to use
> > kvm_vm_check_extension() instead of kvm_check_extension() [2]. Rather
> > than changing each check one by one, change kvm_check_extension() to
> > always issue the ioctl on the VM fd when available, and remove
> > kvm_vm_check_extension().
> 
> The downside I see of this approach is that it can potentially
> mask mistakes / unexpected behaviour.
> 
> eg, consider you are in a code path where you /think/ the VM fd
> is available, but for some unexpected reason it is NOT in fact
> available. The code silently falls back to the global FD, thus
> giving a potentially incorrect extension check answer.
> 
> Having separate check methods with no fallback ensures that we
> are checking exactly what we /intend/ to be checking, or will
> see an error

Yes I see your point, and I'm happy dropping this patch since I'm less
familiar with the other archs.

The alternative is replacing kvm_check_extension() with
kvm_vm_check_extension() wherever the Arm ioctl handler behaves
differently depending on the VM type. Simple enough though it does affect
kvm-all.c too:

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 801cff16a5..a56b943f31 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2410,13 +2410,13 @@ static int kvm_recommended_vcpus(KVMState *s)
 
 static int kvm_max_vcpus(KVMState *s)
 {
-    int ret = kvm_check_extension(s, KVM_CAP_MAX_VCPUS);
+    int ret = kvm_vm_check_extension(s, KVM_CAP_MAX_VCPUS);
     return (ret) ? ret : kvm_recommended_vcpus(s);
 }
 
 static int kvm_max_vcpu_id(KVMState *s)
 {
-    int ret = kvm_check_extension(s, KVM_CAP_MAX_VCPU_ID);
+    int ret = kvm_vm_check_extension(s, KVM_CAP_MAX_VCPU_ID);
     return (ret) ? ret : kvm_max_vcpus(s);
 }
 
@@ -2693,7 +2693,7 @@ static int kvm_init(MachineState *ms)
 
 #ifdef TARGET_KVM_HAVE_GUEST_DEBUG
     kvm_has_guest_debug =
-        (kvm_check_extension(s, KVM_CAP_SET_GUEST_DEBUG) > 0);
+        (kvm_vm_check_extension(s, KVM_CAP_SET_GUEST_DEBUG) > 0);
 #endif
 
     kvm_sstep_flags = 0;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7b6812c0de..609c6d4e7a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -618,11 +618,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
-    max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
+    max_hw_wps = kvm_vm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
     hw_watchpoints = g_array_sized_new(true, true,
                                        sizeof(HWWatchpoint), max_hw_wps);
 
-    max_hw_bps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_BPS);
+    max_hw_bps = kvm_vm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_BPS);
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
 
@@ -1764,7 +1764,7 @@ void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa)
 
 void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
 {
-    bool has_steal_time = kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
+    bool has_steal_time = kvm_vm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 
     if (cpu->kvm_steal_time == ON_OFF_AUTO_AUTO) {
         if (!has_steal_time || !arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
@@ -1799,7 +1799,7 @@ bool kvm_arm_aarch32_supported(void)
 
 bool kvm_arm_sve_supported(void)
 {
-    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
+    return kvm_vm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
 }
 
 bool kvm_arm_mte_supported(void)
