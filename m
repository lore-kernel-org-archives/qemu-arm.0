Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1605516njf;
        Mon, 28 Oct 2024 09:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUmraLoBBaXrGgKrw1qxOUTfao0eAufbB7VraXcD9pPjSUEDKgXQ9pB4Kui0Xp3rgcOw2ADNty92kc6w==@linaro.org
X-Received: by 2002:a05:6402:40c7:b0:5ca:e4e:59d6 with SMTP id 4fb4d7f45d1cf-5cbbfa5483bmr7373252a12.26.1730133861545;
        Mon, 28 Oct 2024 09:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730133861; cv=none;
        d=google.com; s=arc-20240605;
        b=GadJd6oFyU3PCgIa3A1AIfbSvKpPiivQfKTd5F1IXjfIYMqaGY8VIYO4XXM9N2mGFu
         mCCcRC/CgFFtCzi44yzdlLTLVOiS8HuV4TrVhpiFWzs1ak/KF0mtoLm4xlKqrlQ4wBeN
         fWenNXusaATolCQmZc/c9maQbbJxiB3TjvKKnUGHEh4AOyvX9jKevwClDhwNTt1Mu+eI
         Ybz/AQTf28Fa5zNKOC3C1EBMlMg3dXFlqi9liztdZIa1czDMAJSSGOelqhTyg0yfMCq7
         0icJ6lbYhFymeTUsr5kXJH3hZJ7J1I/AtfIxo+yQrXXZ6c1gAAVQKNtBaPossWhkFxV5
         qvGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KVW3ua7sJWaIAit3EE0t5f2qivxeSre5gEdtobhzZ2k=;
        fh=9DfJMUYtqJQ+PjrT5tJEQZRMhiMfWYqlLTkvwbmK/mA=;
        b=F5SnOGpWSKtgCWXMPqSkntA4oM0Hy9B+LXVZ4QKfEc7KceAmi5UtE0i5QCETQmkajE
         16jD7xEV7wUXdnFRfhxFxxTXUVUVijosvMDdTCnBa0Z1ZmBfaZm71DmudKofu7gIylLS
         Bsg64od1vbS+4aeRu0OfaeRwXkQ2KQ8meDT3BB8peQen9zJ3CjoYNiW2O12eFyCvksij
         QgyIypOdE82hCDDnngXgasGKzCONrmwiUrspo6VFZwIBlPAbOREQ92VUWdzUqe7BZm4j
         PaB6YMUQs50ewNXrCIrJn9wpXc9TvP5LL/a5jBScP2Qit9nih0jqS5zXOkCtUTKr77Se
         y25g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZxLgGxmF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5cbb6349a3fsor2355523a12.10.2024.10.28.09.44.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 09:44:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZxLgGxmF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730133861; x=1730738661; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KVW3ua7sJWaIAit3EE0t5f2qivxeSre5gEdtobhzZ2k=;
        b=ZxLgGxmFoGOgbitX91X+R5NFYChjLQH++9J3OjLMDw4MryyXt2p/b3aCUTQkixDa3P
         nrqvH1vEswEFEuFV41Tw0heOttNvDAaODObm3woHDxBmpoAPskdyFnup5BRzL7tO/jvJ
         j5w/ZA6HiYgfYkj+JP+dPyVu+fmDfJ43Xdab7kwWtDZGSL+smt+8k6ZdmSLTaCJJEwft
         QpfQxJfPZcUB4EKwB41jJe02Eiwc1jbiCJpSiiPGAuWrXISmUpJ04Ul8md4NPEZBj5nG
         LesKiad3iRQyiGRbjpHXd4xFuUJz3dDKrn++tZSWv7DvDetSFdnR3bYSfqc+XOXr2iM5
         Egug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730133861; x=1730738661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVW3ua7sJWaIAit3EE0t5f2qivxeSre5gEdtobhzZ2k=;
        b=bjadLRN4LZVTa8I42xJ7p0a+844ZqfmxFqeCpDNLIfSI1ECtXjWiYzKNhJCc/i+6ki
         EEk3oioBpWNzCZJGi+8PBkwQ2Dt2hpGtavAMapqZtNVZeeuNwWs1zHtGpGFRs1TOG1Qx
         es1nlMp73KVbOKmlt53Y5mTAc/YnsT+386MDwU0dHm4APmwOZPZgiqf4VY/F1G/5fC8Y
         Gi7GI1SbHCoknzwLH67FFYy9J8GAhpsiR27w3sBBCQsMBKG5FM2PwwPUe1z+MIKHNEaT
         1Vn0m3vVzEbKNMtaNdmFRv5qo4+pJ9AovmsgyYMgmaxw1NPweZ+5s3ERuAW8qnGstV75
         H4Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVxcvStsasix2WymlN7kVigcgt4p8koJ8p5m7Oc1R/qn8jxAzWlVRr3DQufvuTUCpO17aB0JQTxo1X4qw==@linaro.org
X-Gm-Message-State: AOJu0YwvdB7uwA4ft6WpF0o7kW8QaXau3MS5NFjoyNJR7AI7Rrkfc0Ar
	Ra3IkkUGIzz1JUxb+xNFrfis7LpImKvnMJHy/vc0UlKM1ZjYiN1tDb2bNRZ16KuoxHmVtBgQGdj
	mflkbzPPw2n+M1UCaFkmlx9UGWS2CaHiUO2xvNWZ4
X-Google-Smtp-Source: AGHT+IHibvVnzv7R808yofL15SsQp9qWs+wpjwny1r44N3Tr9WhPaNu6tWT/+u4yguYgNE3Vex7W8x8V7/yGfguoMx0=
X-Received: by 2002:a05:6402:34cc:b0:5c8:8bde:a1d3 with SMTP id
 4fb4d7f45d1cf-5cbbfa548b3mr7619120a12.22.1730133860747; Mon, 28 Oct 2024
 09:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <ZxuwZw2plMI6dNyE@pinwheel> <87v7xcnqrs.fsf@redhat.com>
In-Reply-To: <87v7xcnqrs.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Oct 2024 16:44:09 +0000
Message-ID: <CAFEAcA9qqGMduMC_yXm5Jzbpfy0RVEPkxMoN4q72japiHfRCsg@mail.gmail.com>
Subject: Re: [RFC 00/21] kvm/arm: Introduce a customizable aarch64 KVM host model
To: Cornelia Huck <cohuck@redhat.com>
Cc: Kashyap Chamarthy <kchamart@redhat.com>, Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev, 
	richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	oliver.upton@linux.dev, sebott@redhat.com, 
	shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, berrange@redhat.com, 
	abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com, 
	mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: Xozu84GesVTb

On Mon, 28 Oct 2024 at 16:20, Cornelia Huck <cohuck@redhat.com> wrote:
> On Fri, Oct 25 2024, Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > (b) The current CPU features doc[2] for Arm doesn't mention "host
> >     passthrough" at all.  It is only implied by the last part of this
> >     paragraph, from the section titled "A note about CPU models and
> >     KVM"[3]:
> >
> >       "Named CPU models generally do not work with KVM. There are a few
> >       cases that do work [...] but mostly if KVM is enabled the 'host'
> >       CPU type must be used."
> >
> >     Related: in your reply[4] to Dan in this series, you write: "Having
> >     named models is the next thing".  So named CPU models will be a
> >     thing in Arm, too?  Then the above statement in the Arm
> >     'cpu-features' will need updating :-)
>
> The currently existing named models are for cpus like cortex-a57; you
> can use them for KVM if you happen to run on a matching host cpu, but
> they only really make sense for use with tcg.

Note that those are a relic of an old and quickly abandoned
design direction in KVM for Arm, where the idea was that
userspace would specify the target CPU via a KVM_ARM_TARGET_*
constant (initially only permitted on the matching host CPU
but with some vague idea that eventually KVM would emulate
the specified CPU type on different host CPUs also)
On the QEMU side we feed the KVM_ARM_TARGET_* through for the two
CPU models we support in TCG which also have a KVM_ARM_TARGET_*
constant, which is to say Cortex-A57 and Cortex-A53. But none
of the other named CPU models QEMU supports for TCG have that
kind of constant.

Presumably now that KVM supports "pass the guest ID regs
that don't match the host" we would want to support our
existing TCG-modelled named CPU types (for which we
already know the ID register values, for TCG) by telling
the kernel what the ID register values are.

thanks
-- PMM
