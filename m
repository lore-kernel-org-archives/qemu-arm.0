Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2807685wrv;
        Thu, 18 Jul 2019 15:45:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKrmNBPe++CnxKeoIVQM7t43k7FpTpmFUqN3WISD8OjaHsG6kXBAp4z/ck/3pRCG7ht8aP
X-Received: by 2002:a37:3c4:: with SMTP id 187mr30271371qkd.406.1563489949505;
        Thu, 18 Jul 2019 15:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563489949; cv=none;
        d=google.com; s=arc-20160816;
        b=GEAlTct5dUanHxT+JDxuNFTB/umdMWGt1/SovDYoq9OGHmndZPeK1XbRPmM3oPZJbu
         2pvo8KYr7xnQv8dffn6lWDZc9OtXFZuRFIw1ru8jEhlJwcsrlSX2V5eOoPNnwjnySGuN
         cxIK8awN4yD5iDjcyJ/QgZ3PQu6mJmxfEK+HWKw8/KB8qKhw4GGZRiwQfaXLD4Hd/pNf
         odtpUxtjeS3c3mRz0Tc0DWz6KVIaPA7h2k71P4xGDcZz3IpmOfLnKEkYJonTsjFsvqvH
         w3gGY7TQr76bXndf/5KLBwxFm1Ao97KRGzLBCBhOyR1DquBUqdfxoSn39+c+x9YOofrW
         NH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=XNv/MLuEPijZabgrZtgNgFL+cBzoVRFjOzWDFuuK3qM=;
        b=fLB3p2NXTfwa5HSW3PzJPAQpIwwFtn6MVO7jFXISJWckH3pDqUCchX44H9bS89aw50
         oCqqgp5vBPWoOMK9p6eIK4aiGnIF9L/p6q+L8IldBml8UehXbQl7SytDPbHBCytn5vOT
         NW4EfQcvul0MWYL/8uUbNOhW57DngoSzrxJMLz1sG50guC3+XsLKB/4RJKM0SeRzXChP
         Dh9Q2lpT3ay9WB4s4rMxDCt5sdRont2o405x2NiDJtkqk7A38+rUH/kGV0mB5kI+Dc1q
         LzJa7/UrrDkhMPuFy6PrjKNzoT5+uIN83VslkN1LfJc3TZyisgXg2O+IY+JfPBMlzjf2
         oAkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id r29si18756661qte.170.2019.07.18.15.45.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 15:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 890BE7FDE9;
	Thu, 18 Jul 2019 22:45:48 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE7915D719;
	Thu, 18 Jul 2019 22:45:43 +0000 (UTC)
Subject: Re: [PATCH for-4.1] target/arm: Limit ID register assertions to TCG
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190718125928.20147-1-peter.maydell@linaro.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a47660f2-4b72-3ae7-7bf2-90db54d553ae@redhat.com>
Date: Fri, 19 Jul 2019 00:45:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190718125928.20147-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 18 Jul 2019 22:45:48 +0000 (UTC)
X-TUID: LyfhZRItsmcp

On 07/18/19 14:59, Peter Maydell wrote:
> In arm_cpu_realizefn() we make several assertions about the values of
> guest ID registers:
>  * if the CPU provides AArch32 v7VE or better it must advertise the
>    ARM_DIV feature
>  * if the CPU provides AArch32 A-profile v6 or better it must
>    advertise the Jazelle feature
> 
> These are essentially consistency checks that our ID register
> specifications in cpu.c didn't accidentally miss out a feature,
> because increasingly the TCG emulation gates features on the values
> in ID registers rather than using old-style checks of ARM_FEATURE_FOO
> bits.
> 
> Unfortunately, these asserts can cause problems if we're running KVM,
> because in that case we don't control the values of the ID registers
> -- we read them from the host kernel.  In particular, if the host
> kernel is older than 4.15 then it doesn't expose the ID registers via
> the KVM_GET_ONE_REG ioctl, and we set up dummy values for some
> registers and leave the rest at zero.  (See the comment in
> target/arm/kvm64.c kvm_arm_get_host_cpu_features().) This set of
> dummy values is not sufficient to pass our assertions, and so on
> those kernels running an AArch32 guest on AArch64 will assert.
> 
> We could provide a more sophisticated set of dummy ID registers in
> this case, but that still leaves the possibility of a host CPU which
> reports bogus ID register values that would cause us to assert.  It's
> more robust to only do these ID register checks if we're using TCG,
> as that is the only case where this is truly a QEMU code bug.
> 
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1830864
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Laszlo, would you mind testing this on your setup? I don't have
> a system with an old enough kernel to trigger the assert. (The
> change is pretty much a "has to work" one though :-))

32-bit guest runs fine, with this patch applied to v4.1.0-rc1 :)

Tested-by: Laszlo Ersek <lersek@redhat.com>

Thank you!
Laszlo

> 
>  target/arm/cpu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 1959467fdc8..9eb40ff755f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1369,6 +1369,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>       * There exist AArch64 cpus without AArch32 support.  When KVM
>       * queries ID_ISAR0_EL1 on such a host, the value is UNKNOWN.
>       * Similarly, we cannot check ID_AA64PFR0 without AArch64 support.
> +     * As a general principle, we also do not make ID register
> +     * consistency checks anywhere unless using TCG, because only
> +     * for TCG would a consistency-check failure be a QEMU bug.
>       */
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          no_aa32 = !cpu_isar_feature(aa64_aa32, cpu);
> @@ -1383,7 +1386,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>           * Presence of EL2 itself is ARM_FEATURE_EL2, and of the
>           * Security Extensions is ARM_FEATURE_EL3.
>           */
> -        assert(no_aa32 || cpu_isar_feature(arm_div, cpu));
> +        assert(!tcg_enabled() || no_aa32 || cpu_isar_feature(arm_div, cpu));
>          set_feature(env, ARM_FEATURE_LPAE);
>          set_feature(env, ARM_FEATURE_V7);
>      }
> @@ -1409,7 +1412,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      if (arm_feature(env, ARM_FEATURE_V6)) {
>          set_feature(env, ARM_FEATURE_V5);
>          if (!arm_feature(env, ARM_FEATURE_M)) {
> -            assert(no_aa32 || cpu_isar_feature(jazelle, cpu));
> +            assert(!tcg_enabled() || no_aa32 || cpu_isar_feature(jazelle, cpu));
>              set_feature(env, ARM_FEATURE_AUXCR);
>          }
>      }
> 
