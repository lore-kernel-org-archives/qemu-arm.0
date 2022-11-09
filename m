Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp181746ejx;
        Wed, 9 Nov 2022 03:35:04 -0800 (PST)
X-Received: by 2002:a05:6000:4086:b0:236:b659:471d with SMTP id da6-20020a056000408600b00236b659471dmr37001766wrb.563.1667993704638;
        Wed, 09 Nov 2022 03:35:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667993704; cv=none;
        d=google.com; s=arc-20160816;
        b=PbtCKxMDXS4y7Evi9UL/x0ITfKmSBkCL4+d5XyYOVeQBpAgI9i9yxr/F0MFK8cPgRz
         53EMXLV9OutvDUsBNukXdcDYKsWA1Z0RtZ3HCQ7rDfbMI0rG2qpFxcaSUpHJN3tE/GiX
         e/w+EYo1mTCE7ZKto6uK2FKiBlZs4cBvLSVeYrl75KeZx3RCgckB9Upo1TNgJcnRTgjA
         OtMHBqk4u9dWIK1J56aVkkRhO7PzfRa2j7qSDG2uiXv+JVWiVojoPOe9mJPZRdZowG3T
         sQO2T1obXBFhURHg6ZiMxgZ6+XxNRTYmQCYV7COg3mwWkkE8tNbHnVhMB3CjC9CdFmPB
         rzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FPx0waf55UEgZwXyqqagdDKJJCFfsMAc8aLtD5HI970=;
        b=O86SMfBhxNXcZ0w40IZMkVj36CO24JUsAx6Pg0Ql7ZfHTPfhECkRDLkheUtHRT1BvR
         1QkeIFTXTUkO6U2h3e3xJv4lNtDdDtVxyV946kzRP1er7FR+PS68o9IgwzsvTP5BrjDC
         8txI4oolzTQHwDLv6xlVNCA45A2A63bEH8dzPG1QegtCI0C08SbWRi7qn5zWDCuRDngk
         J5qpEFYIAdf8UgahJWUBAM+cCeA060wHEt0SyvwHVbMUZayiMSos0Y3tFkABmIoyv7oS
         ni+jeviG2OjyZSfVTLpM1nBqFJCaq6xPd2WpvKdN7VgEO/ktJt+P7vEst5XkUrja70Nt
         n+/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="FbGtY/B8";
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o10-20020a1c750a000000b003cfc08f061dsor320824wmc.43.2022.11.09.03.35.04
        (Google Transport Security);
        Wed, 09 Nov 2022 03:35:04 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="FbGtY/B8";
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FPx0waf55UEgZwXyqqagdDKJJCFfsMAc8aLtD5HI970=;
        b=FbGtY/B8puhYAYRst3EpLz5SEC/sGRl3tr++X9AY5e5FuToXU1YcGwFXS4xzjtt3Fa
         gLoamp0SReNVrF8ppi0Utfd3WmMokgnbDlNyFjt1beoP7mHpxCfU/H6rePYfxJ3yAGjq
         0uDZxjXQ2mk7oN3jbYufHTH2VhO4kpdEqGLsSxazlD9Duoh7qrmXzdBooMs+98YaYZwA
         iQuSWBusoHc2dtHKANY+jNZNrbytx8uaj3LOaU1sSgiSQ0ZK+DINOL9ZI983HXQgD9Nu
         bZomOv1Xe1P4ecbSKKSWizPNNC1Im3JwqPUJ6Qkfs4Pu2DJyWvAvhRi9jtP3G4fSocH/
         +gWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPx0waf55UEgZwXyqqagdDKJJCFfsMAc8aLtD5HI970=;
        b=P3f8NRDV8IpniZrcflezqkPhCW6r9NNDL5pLLqhVHXt5rLolC4TJMjfOOkUvqDivg2
         E06y8cKNS6s2+I4pSdVAE+2IYIBAqfS97z9moUXGe3oAR1lSms14plDewPYNJ9BHSWkP
         Em5f4H6ZDG7ib7dFHVJCbajzcsUfzSdqGAaRQ3xADR6aGbLT/u5lFfgqF0iflzCn1I9J
         Y5IIA/wf8jfVOHvjmLxuUqbmyLaTr2WvCM1Qzw2rwG8CRFzEk2paL2zkjibtnEth91Y2
         sOJnAmu0fgvbKjBMek+fBeJfZHkz29ev85fO6toT3GlZYFrUJh1tmt5m0HWKs5Yah5Bi
         uadw==
X-Gm-Message-State: ACrzQf3Wv2HZBCeIVD75Mv0DPh6tci1JKS8vGFVXEwhyk5vKa0Q8ReHz
	59TqelAcEb4P20PTQZXDpXByZ+teMaB6JW2A/lSg0crXImCroA==
X-Google-Smtp-Source: AMsMyM45MTwl5lMlh1d8ui60xgw4kbx9TuRE3pjvXi1GyWL4cL/pOozIyFBG8xdvMhPqu3/HKwDu5QQaoDhban4Ogjo=
X-Received: by 2002:a1c:19c4:0:b0:3b4:a1da:76c3 with SMTP id
 187-20020a1c19c4000000b003b4a1da76c3mr49788239wmz.106.1667993703957; Wed, 09
 Nov 2022 03:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20221104184101.6923-1-fcagnin@quarkslab.com> <20221104184101.6923-3-fcagnin@quarkslab.com>
 <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk> <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
 <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk> <CAFEAcA9jVVQhouS7uhmh+gMs328M_0r9Nz3npzrbmBoVhS+=TA@mail.gmail.com>
In-Reply-To: <CAFEAcA9jVVQhouS7uhmh+gMs328M_0r9Nz3npzrbmBoVhS+=TA@mail.gmail.com>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Wed, 9 Nov 2022 12:34:53 +0100
Message-ID: <CAF8_6KmzX=wbGwoYstC7OAJqTnXK0DKiFXM435hcFqszm7+4QQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mads Ynddal <mads@ynddal.dk>, qemu-devel@nongnu.org, dirty@apple.com, 
	r.bolshakov@yadro.com, "open list:ARM cores" <qemu-arm@nongnu.org>, 
	Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>, 
	Francesco Cagnin <fcagnin@quarkslab.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: AA7s/SkOMXt6

> In my version, I added the sw breakpoints to `hvf_vcpu_state` so they would
> follow each CPU, but it's effectively a copy of the global set of breakpoints.

Ah, I missed this field, and it seems the proper one to use. I'll switch
to this.

> Moving it to `hvf_arch_update_guest_debug` would probably be best. Having it in
> `hvf_arch_init_vcpu` would mean that it's always enabled. In some corner-cases,
> that might have an adverse effect.

I agree, I'll move it to 'hvf_arch_update_guest_debug()'.

> I also noticed you are adding 1 to the WRPs and BRPs. As I interpret the
> documentation, you should subtract 1 instead, given the value 0 is reserved:
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index dbc3605f6d..80a583cbd1 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -39,11 +39,11 @@ static void hvf_arm_init_debug(CPUState *cpu)
> {
> ARMCPU *arm_cpu = ARM_CPU(cpu);
>
> - max_hw_bps = 1 + extract64(arm_cpu->isar.id_aa64dfr0, 12, 4);
> + max_hw_bps = extract64(arm_cpu->isar.id_aa64dfr0, 12, 4) - 1;
> hw_breakpoints =
> g_array_sized_new(true, true, sizeof(HWBreakpoint), max_hw_bps);
>
> - max_hw_wps = 1 + extract64(arm_cpu->isar.id_aa64dfr0, 20, 4);
> + max_hw_wps = extract64(arm_cpu->isar.id_aa64dfr0, 20, 4) - 1;
> hw_watchpoints =
> g_array_sized_new(true, true, sizeof(HWWatchpoint), max_hw_wps);
> return;
>
> But the documentation is a bit ambiguous on that. Maybe we can test it?

I tested this again and indeed adding 1 is correct. Thanks Peter for
also pointing out 'arm_num_brps()' and 'arm_num_wrps()', I'll switch to
those.
