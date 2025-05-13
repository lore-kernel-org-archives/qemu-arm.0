Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp600614njb;
        Tue, 13 May 2025 08:29:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbMM9+iwNm34FJtaCvIbBal25Xqbun78lRWBFXBJ7cD/1dLoe8M52UzeHLdofT72v5i1ESDlS8q6ExRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHBkvVlOtY+DbHBg+zM92WecjjbpLbPO3CNR3amqf9UdF/sYrPdFVTyOsIe5FnCtomRYr9z
X-Received: by 2002:a05:651c:1614:b0:307:e0c3:5293 with SMTP id 38308e7fff4ca-326c46ade6dmr73055271fa.36.1747150191606;
        Tue, 13 May 2025 08:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747150191; cv=none;
        d=google.com; s=arc-20240605;
        b=apH5bdix+I6yKPbKuSaDD6zIYOboPJMUBsVNcfXG51mClhW+G1KJfnJ29U+WfbvOxG
         wOvTpUH8vtVC9pj1kDuEKg1KfgYglqjX0tjt70HmV+PlKZ6f0EvsI6yQCaN8nMPQUDpF
         WcejS/vHWFI8wYGjSFScLcha5L8inZe45JsyBVeWObs6cqc25aYNAokcTgk5edwC5Yt2
         LyzEuXHl1RbRwZJdOi7wpRNqh83434ajdpCt8L4VN/awpYKaIAq6orVCck8J9xFA2m3D
         WnnsE6M4l3jilMPTQ5tdoXO4dydKaQK6zcC36mrUaZ0T8A0MgKJVaBtBGQ5O0pkwxfL0
         xahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=n3SV9RrB4pXNYv42wcSIPomPi1fFx4e4cmy7nDRktu8=;
        fh=sA5RfQ0EgjnPTYXBHnFFVNAYTDWeSxMf75MxPVgZj2A=;
        b=lrgfslc2/qCdJ0Jv4aipzxeE1GPmWEoo6m8JK94bpP0FqS8hYZ34v6tzIhjCG8gx0h
         HeBdBzfa5PAn0BMdIyZ/mT8qKIoIonJtnc82VqYtRmcMXfNNkiocXu8FnmO7h0e8Mm1T
         rLUNgaFObZmTB97GCE62tPZLgY8zlvP8o6ac797u5NlQ72t5nHtL6uumsupxj7x6V8dS
         h+UTjNVNSO3TbClKvShokWwNDptnLOyNcR6gJm/N8wF3tOqvECNrELJcUDOZbQ+/p+jm
         LwM5jAa2ltKeVdneq6c5EvBpDAgpLIhYoLzBQjIAvD2adCrg/KmJdxgsp5leHXHj1X8/
         6TLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DiS2NjPT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 38308e7fff4ca-326c35d2d3dsi43534571fa.524.2025.05.13.08.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:29:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DiS2NjPT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747150190;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3SV9RrB4pXNYv42wcSIPomPi1fFx4e4cmy7nDRktu8=;
	b=DiS2NjPTJv3pFJwTaoQezAp8S0q3lQQT3EaxFGipvCv6IFgkN3LPhrIZX9ddfIAl2qlLa4
	tsexxmYNAnrX7yp2qiUTWCQFtFvIQQZ9a/q/qTiqSA9ZooFHl4Vao5O7kx5JHuUdLt+JHX
	jajjFWWncvGX9lF31iVCkxpjIBb9Fq0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-9yCt-5vFNICh8tf2mi4t8A-1; Tue, 13 May 2025 11:29:48 -0400
X-MC-Unique: 9yCt-5vFNICh8tf2mi4t8A-1
X-Mimecast-MFC-AGG-ID: 9yCt-5vFNICh8tf2mi4t8A_1747150188
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a0bcaf5f45so1840013f8f.1
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 08:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747150187; x=1747754987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3SV9RrB4pXNYv42wcSIPomPi1fFx4e4cmy7nDRktu8=;
        b=E6Hv1KTjmtSXoEBpUPFMETJLhLaahclXQf607QhiU8cC1M3ir0nG/NcwZ1IvAEX7hP
         USB8a2NRxZJJiF7I7tpevIQAQYj+FldRiV3CbIleUStK7epJ5em/PGO4YARaL/Z2CzQe
         Tk7Ec9Cb3LmGkT2efmvcJgKMT2DUXt72+RiSTdt+mtTAgNA1eno8kNJ2e91KVz/x0DQT
         oovP7UZmMZZOAmEAkvmcsPhnGWmUGx8+wTR5JayWYRCdeAD6shAja3D7esTR+QM8P/gG
         OjL0aH6Z9sutVziUThiz3qq1d/se70f2ua+PodWxP1dO3knm+hxTlcUFy2l6nxcXHaZw
         OtvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOcz8BUvW0jYCMPNJKE4QT8GPu+ZTHBhDhKn+vfEMIAKCUAVlceT7bXUMDkrnArOWP8LQ0Q5z2UlH3yg==@linaro.org
X-Gm-Message-State: AOJu0YyZCHLqa7HQHU9eskgg2aGkDbwr5wjyIslPgUP0q4TbNgzyVHFT
	YLWY5nxnBNQTJgserRCzQ7iVvzLh3p05m7Ydm0sgls2ykP6W9Sl2sQLZo0JQL0ZMLDx/W1ThaOG
	3r8MDSQDcl6DHwW0cbPo+qz/emxXnUnU61G+Q54m18BzoYu34uuZIfUixRZLkUw==
X-Gm-Gg: ASbGncs0aC2+dtA4MQVGQtvQ0Ca1luHgDPDX4p4plqyi0VNhK/buiaaL2/p3SczdOUm
	gz2ehapiGqpgRXCqQ1nAZ4MipLmeabE3jdfrIFX1akAHJ41Zs68QzO+Hfa74U6hH8p/w28SSEgW
	3qo6DrWYGLl4r8fRP2VCP5uX6qiwCO8DqbMwyIC3l2q9MdQYxg3SZSDwYu7G+hjR51fiTaz+Ftf
	dc1jAlPqWbYsJuJgne2TkuFwpvTf7iqvT5p1n+l3BFDwCCwG5SJSfe1XR+/SchU/+6erJf7l1tI
	kOslMPUKepOH0LwxW80DnwUWPt5cQANWY5qw6r8Wk2KZisCFrGiNa0QyD1o=
X-Received: by 2002:a5d:650b:0:b0:3a1:f655:c5b2 with SMTP id ffacd0b85a97d-3a1f655c5femr12607478f8f.39.1747150186963;
        Tue, 13 May 2025 08:29:46 -0700 (PDT)
X-Received: by 2002:a5d:650b:0:b0:3a1:f655:c5b2 with SMTP id ffacd0b85a97d-3a1f655c5femr12607460f8f.39.1747150186559;
        Tue, 13 May 2025 08:29:46 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebe00sm16888782f8f.38.2025.05.13.08.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:29:45 -0700 (PDT)
Message-ID: <dadc4acd-97c8-4647-9467-89cd1966a6f2@redhat.com>
Date: Tue, 13 May 2025 17:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 00/10] kvm/arm: Introduce a customizable aarch64 KVM
 host model
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20250414163849.321857-1-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250414163849.321857-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ddtzjYi2T-WcZo3kMKDfZIEK4ISy_T7Qbf44lUA7U1s_1747150188
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: ubJYp5VaRbWB

Hi,

On 4/14/25 6:38 PM, Cornelia Huck wrote:
> [This is on top of v5 of the ID register storage rework:
> https://lore.kernel.org/qemu-devel/20250409144304.912325-1-cohuck@redhat.com/T/#t]
>
> It's been a while, but here's finally a respin of the series to make ID
> registers configurable directly via the command line.
>
> Major changes from v2 include:
> - split out the rework of ID register storage (see above) and rebased on top
>   of that
> - hopefully improved the documentation
> - fixed some bugs along the way (including output of the cpu model expansion
>   command, and compilation with HVF on)
>
> Decided against zeroing unknown registers; it's mostly a "dammed if you do,
> dammed if you don't" situation as one case or the other will not quite work
> as desired, even disregarding fields like AA64PFR1_EL1.MTE_frac where 0
> might indicate things we do not support. You'll need to be careful when
> doing kernel updates and be explicit with configuring fields.
This is not totally clear to me. Is it possible to come with examples
and also derive some guidelines to avoid pitfalls? I guess this kind of
aknowledgement can be scary.
>
> The current cpu properties stay as they are; we can work on converting them
> to compatibility props once we have support for configuring the ID register
> fields on the command line for the other accelerators (this is still KVM only.)

At least what can we do to make sure they are not inconsistent and work
well together. Looks like a must have before being non RFC.
>
> The FEAT_xxx features only support a subset of what we need to configure in
> real life; for example, different AltraMax machines differ in CTR_EL0, which
> is not covered by any FEAT_. It might make sense to provide them as syntactic
> sugar on top.

I agree that anyway we will need an ID reg field granularity for some
real life cases. On top of that we shall try to build higher level props
matching to features as requested by an overwhelming majority in earlier
comments.
>
> We still have to deal with MIDR/REVIDR/AIDR differences by exploiting
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=d300b0168ea8fd5022a1413bd37ab63f4e5a7d4d
> (in a different series.)
Shameer, do you plan to contribute the qemu integration of this feature
you developped on kernel side; or do you allow us to integrate it in
this series?

Thanks

Eric
>
> I have not ignored the issue of named models on Arm, I just wanted to get the
> base infrastructure into place first :)
>
> Real world example (migration Graviton 3 -> 4, thx to Sebastian):
>
> -cpu host,pauth=off,SYSREG_ID_AA64PFR0_EL1_SEL2=0,SYSREG_ID_AA64PFR0_EL1_EL0=1,
>  SYSREG_ID_AA64ISAR0_EL1_TLB=0,SYSREG_ID_AA64ISAR0_EL1_TS=0,
>  SYSREG_ID_AA64ISAR0_EL1_SM4=0,SYSREG_ID_AA64ISAR0_EL1_SM3=0,
>  SYSREG_ID_AA64ISAR1_EL1_SPECRES=0,SYSREG_ID_AA64ISAR1_EL1_SB=0,
>  SYSREG_ID_AA64ISAR1_EL1_FRINTTS=0,SYSREG_ID_AA64MMFR0_EL1_TGRAN4_2=1,
>  SYSREG_ID_AA64MMFR0_EL1_TGRAN16_2=1,SYSREG_ID_AA64MMFR0_EL1_TGRAN64_2=1
>
> (not including handling MIDR differences, which is out of scope for this series)
>
> Code also available at
> https://gitlab.com/cohuck/qemu/-/tree/arm-cpu-model-rfcv3?ref_type=heads
>
>
> Cornelia Huck (5):
>   arm/cpu: Add generated sysreg properties
>   kvm: kvm_get_writable_id_regs
>   arm/cpu: accessors for writable id registers
>   arm-qmp-cmds: introspection for ID register props
>   arm/cpu-features: document ID reg properties
>
> Eric Auger (5):
>   arm/cpu: Add infra to handle generated ID register definitions
>   arm/cpu: Add sysreg properties generation
>   arm/kvm: Allow reading all the writable ID registers
>   arm/kvm: write back modified ID regs to KVM
>   arm/cpu: more customization for the kvm host cpu model
>
>  docs/system/arm/cpu-features.rst      | 104 +++-
>  scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++
>  scripts/update-aarch64-sysreg-code.sh |   5 +-
>  target/arm/arm-qmp-cmds.c             |  19 +
>  target/arm/cpu-custom.h               |  60 +++
>  target/arm/cpu-sysreg-properties.c    | 713 ++++++++++++++++++++++++++
>  target/arm/cpu-sysregs.h              |   2 +
>  target/arm/cpu.c                      |  12 +
>  target/arm/cpu.h                      |  47 ++
>  target/arm/cpu64.c                    |  24 +-
>  target/arm/kvm.c                      | 289 ++++++++++-
>  target/arm/kvm_arm.h                  |  26 +-
>  target/arm/meson.build                |   1 +
>  target/arm/trace-events               |   6 +
>  14 files changed, 1617 insertions(+), 16 deletions(-)
>  create mode 100755 scripts/gen-cpu-sysreg-properties.awk
>  create mode 100644 target/arm/cpu-custom.h
>  create mode 100644 target/arm/cpu-sysreg-properties.c
>
