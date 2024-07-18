Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1393521njk;
        Thu, 18 Jul 2024 05:08:07 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW8Mmrb4D6YwSamj3J2CUlsbBTakkC0DGQ3DMwWEOVzwaCr9Y1rMEmyInZXP7jez/jr3HGcetdAIGY0nBrnpopQ4MtkurS9
X-Google-Smtp-Source: AGHT+IFbTg+6QJKvUQWh5M5rhUoOr1hcTrRmsAX6ZABIHzxSygi2ozSCA0OtHN81fO5FotcnEseL
X-Received: by 2002:a05:6a20:2584:b0:1bc:ecb9:1df3 with SMTP id adf61e73a8af0-1c4077b583fmr4874099637.5.1721304487299;
        Thu, 18 Jul 2024 05:08:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721304487; cv=pass;
        d=google.com; s=arc-20160816;
        b=YWRPuly2CE9K71P37bw8P1rLT1uStpPwKrRs2lckbhRghpWDc7wyaxAykg2ARW2akf
         yU3BrXqSTvaNAHZAxlncPYBXYz/3+VuM6VdMCa79aYWPqxYEyFfN7C6U5o2EGOO6uLFa
         21/oXHBwAE/mnLgfzt2s+3Xe883Jnai3aVp6COq85gKTx+WhyDkePKhfaNG2O20vXZlb
         NV74A+Qt/ecPN3d+3c4gfW5wYaEYVYHMySa7C1rAcM6eDQNmCnd2xNfzNRvgBVqule9E
         vRXTBHIhYgRSNXe3OniXE9OLW0h+7VG/7c5U8ZXaPKBYS5tFBwSe4mWlOwzBcbpG7fw0
         fW9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=QS+i/qWgg92JCDQnNoCb860uCH44CrJEZk7eK6ps8uI=;
        fh=kqzvpt8ZcKWSwc6rKU8uSxcMipGXoBvUIXrQzHwHAQc=;
        b=ncmdG2f5b6ib5NKgxfKHtH5NbyhjMIqKZG/xtmSTtIv6B96STxVdH0CHMH4FbIGMT5
         uJAwqpE9McO9/i7VwnZRchzmXqkEUzgL3QktZk8uJd19xYQx3S59ILfi7DjPWdA09OI3
         lz84pMT+Kq/lwbLOU5ralOBZIV4GiK9ppb7tmdX29kOZ8IJ7H+pae19Hhc2muBUnuZYi
         1Iy0qV7JnPD2uaqq4aL7MC7ehki8dv6MYTRIPUUFE/uM3QOIRdXm+NH0V6tNktkUCN05
         962oA6d7GaKp9cI0Pl6o4U3UEitigm2enSx/GVtpV6TKbaCjCnRxjMH/jAKEfK9VCMXf
         IM0Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nfeaXroR;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21826-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-21826-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-21826-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-78e443c0873si11413540a12.606.2024.07.18.05.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 05:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21826-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nfeaXroR;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21826-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-21826-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0747284A67
	for <alex.bennee@linaro.org>; Thu, 18 Jul 2024 12:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E7B12FB13;
	Thu, 18 Jul 2024 12:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfeaXroR"
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3321113C699
	for <kvm@vger.kernel.org>; Thu, 18 Jul 2024 12:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721304470; cv=none; b=hVpzlzdRDVxv9X6lUrGt+kwFsUMCC+vuEFA2hEQr6zxjImsacqgcm2LPchc9J7GzaNT0TUdCGklVu0dI/MWtf5e/tKwta6hT3S2jqGDCSsCkN/NoR4GMrRkCPY7EGbZNT+aQZCBH3wN047z4D9MaIICORW5hdtzKWHXMr5p5REI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721304470; c=relaxed/simple;
	bh=IcJ23Q0iCS8Sr1ehH+Hu805RN/zyQlg1n2id4d8A0Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cdok6nzlLNtQ3cSHmT8pVBijbiZaNbzhxhKpDudfSP9w6vqnqQYbOEhKFoebBBKuYu2Glq+Sgj0r0AbenxBTijmnW92KPlIgZhbAJWQvl6EvYBDIb2aLJGNbn1SvQGWt4T0bwsmNyhAiUv6HDlkpswu0ChSNpySgBV6LBM9PX5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfeaXroR; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-59559ea9cfdso789923a12.0
        for <kvm@vger.kernel.org>; Thu, 18 Jul 2024 05:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721304466; x=1721909266; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QS+i/qWgg92JCDQnNoCb860uCH44CrJEZk7eK6ps8uI=;
        b=nfeaXroR/c2TQ+ih735CalMoJhDNDQzNbcFUNFQWhe4uYv6HHGCsGOUWVeekGaofdi
         OIv+eL5E5VYCHvk8MFcjhC7NZSyqOL/OT1wE0Upjj4WXbr9tEkiSe1WkuzWUKZuGH+iE
         e2ozwcSqiA2m/ZFPHFekB4fy1mDaLYZRSeLXNqGCK3LCh7V01hE7jAhzEGSMaqIf+sHq
         6JOO2ilacRJPaoiBPgFKN+Bs0nh3USjL8S9gAozx2wX0AyisyhpSVfiZ7Ye6IgikXp62
         waObEv/rJc0Y6+KOVSJ2Tm/ppBjtQnXl+ad+YhlrbCzShuPPpj/bOtn3Z9mW/e2V/HOC
         pe8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721304466; x=1721909266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS+i/qWgg92JCDQnNoCb860uCH44CrJEZk7eK6ps8uI=;
        b=t3VLboQT5D+E06lhEto5HwruZ6f346xhIYGK8eFzcxz4QrPcfbVNnnOlgDOTQwTtsP
         Hq4l0Mswcl4kGvap5Vg9JA5Vz0SciHgWgslEnBBuIuXECwIuHZDzA//X5Y+zhT3nSizb
         9n8tvDiuh6bOCZjI6mRw6UYTmHso0x6f/s0T6N9MsPI6WsVghyWWu3wGMsEcOupfoLS4
         jf7Kv+z1MpfI7dDIK4+XH/rr1wIwfGp5w2Nl5C/TRdYcQa0w5/+FjbolsCUYJxPBbez0
         UcyRRqghOei55EV5ru7H4KHf4yfciJGN6+5ZnwHs30ZPkv6t9bDuVSCh84qZJu1NPHY5
         Qv0g==
X-Forwarded-Encrypted: i=1; AJvYcCXlqxyBM5H6D0kRulE9Ql3N9irc2w5RkuOTwctUW3T+Giof3upfAhX0Kjf+tv9Qyr0AH5viGmQcy8oAMK9yCpLCX4FP
X-Gm-Message-State: AOJu0Yw1HjqVC54GI9DoR/KXRce4MYHJqOe6ge+ztjYGMH8bdN3bRB7R
	Wkd4mYJDvNKT/jSWamjEsEXZFRnwOqO6y+bLLmOvT0FJAvrY3eiE/ZLZwh4rQJKdr7Fh8SA68zt
	C5lrSWE2XNxobJbm0csqNaXnlY4cbKGHYFKf5ug==
X-Received: by 2002:a05:6402:430a:b0:57c:a77d:a61e with SMTP id
 4fb4d7f45d1cf-5a05b22a336mr4519482a12.7.1721304466515; Thu, 18 Jul 2024
 05:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-pmu-v3-0-8c7c1858a227@daynix.com> <20240716-pmu-v3-2-8c7c1858a227@daynix.com>
In-Reply-To: <20240716-pmu-v3-2-8c7c1858a227@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jul 2024 13:07:35 +0100
Message-ID: <CAFEAcA8tFtdpCQobU9ytzxvf3_y3DiA1TwNq8fWgFUtCUYT4hQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] target/arm/kvm: Fix PMU feature bit early
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: G5Mm3Ke6TpZl

On Tue, 16 Jul 2024 at 13:50, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> kvm_arm_get_host_cpu_features() used to add the PMU feature
> unconditionally, and kvm_arch_init_vcpu() removed it when it is actually
> not available. Conditionally add the PMU feature in
> kvm_arm_get_host_cpu_features() to save code.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  target/arm/kvm.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 70f79eda33cd..849e2e21b304 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -280,6 +280,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      if (kvm_arm_pmu_supported()) {
>          init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
>          pmu_supported = true;
> +        features |= 1ULL << ARM_FEATURE_PMU;
>      }
>
>      if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
> @@ -448,7 +449,6 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      features |= 1ULL << ARM_FEATURE_V8;
>      features |= 1ULL << ARM_FEATURE_NEON;
>      features |= 1ULL << ARM_FEATURE_AARCH64;
> -    features |= 1ULL << ARM_FEATURE_PMU;
>      features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
>
>      ahcf->features = features;
> @@ -1888,13 +1888,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (!arm_feature(env, ARM_FEATURE_AARCH64)) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
>      }
> -    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
> -        cpu->has_pmu = false;
> -    }
>      if (cpu->has_pmu) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
> -    } else {
> -        env->features &= ~(1ULL << ARM_FEATURE_PMU);
>      }
>      if (cpu_isar_feature(aa64_sve, cpu)) {
>          assert(kvm_arm_sve_supported());

Not every KVM CPU is necessarily the "host" CPU type.
The "cortex-a57" and "cortex-a53" CPU types will work if you
happen to be on a host of that CPU type, and they don't go
through kvm_arm_get_host_cpu_features().

(Also, at some point in the future we're probably going to
want to support "tell the guest it has CPU type X via the
ID registers even when the host is CPU type Y". It seems
plausible that in that case also we'll end up wanting this
there too. But I don't put much weight on this because there's
probably a bunch of things we'll need to fix up if and when
we eventually try to implement this.)

thanks
-- PMM
