Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3818171wrv;
        Fri, 19 Jul 2019 10:21:57 -0700 (PDT)
X-Received: by 2002:a1c:6555:: with SMTP id z82mr50557232wmb.129.1563556917731;
        Fri, 19 Jul 2019 10:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563556917; cv=none;
        d=google.com; s=arc-20160816;
        b=twlcL6qn3WrAqXfdyFl6EsfV9MiUHRCr48bqh8k4vJ5un5Wah27s4DXhBhz77+J66d
         HMdbljaq75d/MELmUP3SnbuUtMdPuabtavUpqn5/kT7X2GiOHFfBsZ1ZL2g2oybDUG+d
         uN/AkPr8pg/pz7SdBIaD1E2Hci1RoWOSHRq8GOJPOIS3onIwO+rIMR94Y4XvymMiiKPX
         wFGRm8Dvx9qlm3rI/sdv3eL52ZNcE6frezHKXDo2790/9dXmvXxLNhvnCea9vvUZgtQK
         P+eROZX6ncn8oLLAj5RViBcaW/3tkEV8Zk74ETTdgJUfu3exs16km8W1Hyw6CZUmjX2R
         WEkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=PbhLHDdRUx14ysCaVZJdG4IkpobtNSYGHjXGxn1nrzI=;
        b=Ww17gLjxvF+/Odo7rQf+VI2b8OyrbCFn5PCsVKWGLCk2dSWtdQ3gza9lxEnGxs4fDU
         XX2liaCrhWRA8kZ//905csO2F8i/X3KCoB2t5X/kZcJaNpLZoX8HDyqOp+zkbPaLq4uJ
         EOD0+EDFjpQg0Rypj0QYu6NkVioklwfj9WkyaaxWS1+JkiFWziV1f7YAzF3engrexY0V
         CUtG15T/hPbtnu1KQ0ACw5ursS/NvOjB6ADceDeGBeUcVNXyWEPCEiOae9rA/BZXSrSZ
         +UlcWx+1+4BfRLX3dc51jTzpQLYbPQoxDcntUlDgsGTA1v6XSCEAMTLgrQ+P4Z+ky6Ss
         0K3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 131sor18164735wmd.1.2019.07.19.10.21.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2019 10:21:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PbhLHDdRUx14ysCaVZJdG4IkpobtNSYGHjXGxn1nrzI=;
        b=g+/fl8nPux+DLIrP1jFsZeB/fwyd98UP1/9QSsGDYFE06ffKzJO6z8hkHPblPI+s8u
         MG8vr6avqBv3qpBBMDCBwUjeO56odu1xxXZj6s2EK7CNugfi2yz1/0LbRfcj9sKweCVo
         aNjYRN5ytkcjD9nLR8AfyejbUq58FUv2sggkvvVwEOxKAab0tvM13URjz19NllUeOKKu
         +y3MAiMUeAMZv1Czb+ZKc+RtmStpgirKGRYcvtXS0boUvQuwsUtBa/1vctwXOtxuV0hJ
         RlW6/dHQ1HxuqACnC+Tx8TqcrakjUGYYuMjkhyoGaZfTljUb6E3DKc+PitZ3Ttk13tZ0
         Coiw==
X-Gm-Message-State: APjAAAVaRSjgb7ocueKYDwGVf8hcEEabBdWqzFox1GF+zAQI0GoZmDhG
	MpFRni2dOoSPnVd9h35SldaXD6e3GWE=
X-Google-Smtp-Source: APXvYqwRk+/wRd4YpxLm/ztvOrmkyFqGsbOnC1KssjwCrbE2ZZOcBeHJf5OvDaU707qox/s4F/1PRg==
X-Received: by 2002:a7b:c104:: with SMTP id w4mr51056912wmi.42.1563556917300;
        Fri, 19 Jul 2019 10:21:57 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net. [83.42.61.62])
        by smtp.gmail.com with ESMTPSA id o11sm29424004wmh.37.2019.07.19.10.21.56
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 10:21:56 -0700 (PDT)
Subject: Re: [PATCH for-4.1] target/arm: Limit ID register assertions to TCG
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190718125928.20147-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <40085853-280c-cd33-57ac-ccc9db6f9b36@redhat.com>
Date: Fri, 19 Jul 2019 19:21:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190718125928.20147-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jL72YuwrxiL1

On 7/18/19 2:59 PM, Peter Maydell wrote:
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

Agreed, this is clever and simpler.

> 
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1830864
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Laszlo, would you mind testing this on your setup? I don't have
> a system with an old enough kernel to trigger the assert. (The
> change is pretty much a "has to work" one though :-))
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
