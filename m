Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp557619ejb;
        Wed, 1 Feb 2023 05:36:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/8xEzCT0y4EwrSbQkBM4pmgWaw+mKbyUZArvo7IMsNME6NEm0gZBGGzbEn6rkEyn7MoCsc
X-Received: by 2002:a5d:6d05:0:b0:2bf:b741:3e0f with SMTP id e5-20020a5d6d05000000b002bfb7413e0fmr3190322wrq.41.1675258609814;
        Wed, 01 Feb 2023 05:36:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675258609; cv=none;
        d=google.com; s=arc-20160816;
        b=CzSnAytqU1ZDi5A1El62pMextGDubpFiv8jQJiEA8nYY+SfIy0mWm055PrkizKaQpH
         RnEnL1TFHGeejC5z9BQoIW1Nw2WwgWdoBhtXbzKisHe9MayApKD/uxkFROlOoqvzrD0m
         /A7YkqzbChi/Od9kij/7Mpn7sBTNFaBmRmb2seZEwvHuxofkFFGLqCZfghIxZp9W7sxL
         8qIwxx3JQySaOKGHrmWfN/vWguwLCrM9MKaAFRUBoknltWYvZmcMDQAAsnCEagHgD3Ex
         Vab56FrhUzDdatpNPnREfxvUbal17cNEzM3BBM8dB4K5Nh80BuglnTlGIqGB6vvn0FjV
         GdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=XSO4Gv3ntmXhlFgssH7XKdcUtcdjqFvz0Y4JY+Eb8io=;
        b=wGJI/2cJQc44cebCFn4yEY0VJRXFh0dzkBUlUTsIFWOqrWFGFxlyQ8Isw6gkpl9O5a
         4U26u5CZYjquDZJQzvjHwA0BtCOv21fGVuSbXdkTTEadtJ0fbFvgRZ7EcMzZZ9LrBXr2
         VmGe2mDOrLGOqqmNGFiAmiXnzuCpgh64VyLGhOQpeYeVMb7sjWR0yikawSkYMyrovoYU
         IDP1E5K/Y7HpoD+2FNSvYuCsAzCWiHQZRDl+UokNOWF/JzkHXOMRmnpJUIN1SuNuO7km
         GQXL1dduTNZZX7rHtfj1QzzJ1+l8Y9SkrqLzdwFAusJxhGKK/qyUtBlQCVMIvVdq/oRh
         VRxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=gpFgJotY;
       dkim=neutral (no key) header.i=@suse.de header.b=DMQcF0TO;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id y7-20020a05600015c700b002bfe7cd113bsi11960094wry.337.2023.02.01.05.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 05:36:49 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=gpFgJotY;
       dkim=neutral (no key) header.i=@suse.de header.b=DMQcF0TO;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2F08920E7D;
	Wed,  1 Feb 2023 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675258609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XSO4Gv3ntmXhlFgssH7XKdcUtcdjqFvz0Y4JY+Eb8io=;
	b=gpFgJotY6wVJMPMULeUn5+UqhI4hesWaI+/+rPlHVKdpulZxoUT9A0dH1btORO45Ygjx/s
	K+mip4KPu2OLXYbPQnoosOfa0JTSnHOB4cUAvWFXDngtGvVqxx3gDnDLmDJfligkDioYmC
	wv6u/fScEn4pCLF3V+QQYiQKU4/+2Wg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675258609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XSO4Gv3ntmXhlFgssH7XKdcUtcdjqFvz0Y4JY+Eb8io=;
	b=DMQcF0TOvlpbSFi0UeMPCaE+0wajEQibfmPdp4zdus7NXmFSarWfKf0tzIPZL4viJPl8Vz
	kYpHrZ1YYc33X0CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A38FB13A10;
	Wed,  1 Feb 2023 13:36:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hRZWGfBq2mMMXAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 01 Feb 2023 13:36:48 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH v5 0/9] target/arm: Allow CONFIG_TCG=n builds
In-Reply-To: <20230120184825.31626-1-farosas@suse.de>
References: <20230120184825.31626-1-farosas@suse.de>
Date: Wed, 01 Feb 2023 10:36:45 -0300
Message-ID: <87edr9y0b6.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: 3P3jWD1JPSeN

Fabiano Rosas <farosas@suse.de> writes:

> This series makes the necessary changes to allow the use of
> --disable-tcg for arm.
>
> Based on "target/arm: CONFIG_TCG=n part 1":
> https://lore.kernel.org/r/20230118193518.26433-1-farosas@suse.de
>
> Since v4:
>
> - Used "max" as the default CPU for KVM-only builds. This allows me to
>   drop all the clunky qtest changes and it keeps disabling TCG
>   separate from changing cpu defaults.
>
>   I'm neutral towards removing the defaults for arm. We can do that in a
>   separate series. It would be nice to make the TCG default equal to the
>   non-TCG one. Otherwise we're bound to get reports that "this command
>   line used to work" if users switch from: 'CONFIG_TCG=n -accel kvm' to
>   'CONFIG_TCG=y -accel kvm' (the latter would try to use the cortex-a15
>   as default).
>
> - Move the ifdef around valid_cpus into the patches that move the
>   respective cpus. Patches 1 & 2.
>
> v4:
> https://lore.kernel.org/r/20230119135424.5417-1-farosas@suse.de
>
> v3:
> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>
> v2:
> https://lore.kernel.org/r/20230109224232.11661-1-farosas@suse.de
>
> v1:
> https://lore.kernel.org/r/20230104215835.24692-1-farosas@suse.de
>
> Claudio Fontana (1):
>   target/arm: move cpu_tcg to tcg/cpu32.c
>
> Fabiano Rosas (8):
>   target/arm: Move 64-bit TCG CPUs into tcg/
>   target/arm: Use "max" as default cpu for the virt machine with KVM
>   tests/qtest: arm-cpu-features: Match tests to required accelerators
>   tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
>   tests/tcg: Do not build/run TCG tests if TCG is disabled
>   target/avocado: Pass parameters to migration test on aarch64
>   arm/Kconfig: Always select SEMIHOSTING when TCG is present
>   arm/Kconfig: Do not build TCG-only boards on a KVM-only build
>
>  configs/devices/aarch64-softmmu/default.mak |   4 -
>  configs/devices/arm-softmmu/default.mak     |  39 --
>  configure                                   |   6 +-
>  hw/arm/Kconfig                              |  43 +-
>  hw/arm/virt.c                               |  10 +-
>  target/arm/Kconfig                          |   7 +
>  target/arm/cpu64.c                          | 632 +------------------
>  target/arm/internals.h                      |   4 +
>  target/arm/meson.build                      |   1 -
>  target/arm/{cpu_tcg.c => tcg/cpu32.c}       |  13 +-
>  target/arm/tcg/cpu64.c                      | 654 ++++++++++++++++++++
>  target/arm/tcg/meson.build                  |   2 +
>  tests/avocado/migration.py                  |  10 +
>  tests/qtest/arm-cpu-features.c              |  34 +-
>  tests/qtest/meson.build                     |   4 +-
>  15 files changed, 772 insertions(+), 691 deletions(-)
>  rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)
>  create mode 100644 target/arm/tcg/cpu64.c

Hi,

Peter, Richard,

I assume this series is good to go for the time being?

I have rebased the first part of the patches + this series + Philippe's
CI patch, all available here:

https://github.com/farosas/qemu/commits/arm-disable-tcg-max

Let me know if it would help to resend it all as one piece.

Thanks
