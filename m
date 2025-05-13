Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp394857njb;
        Tue, 13 May 2025 02:38:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+tCLRDt+FG4SCwAHI6jIsejJKucJ1eorO3V30Q+FEBi+7uDGQ0kpr/X/gM/3r4+LpYOwRZwVrWFI4Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IHTyg81R9VrfEPUevWcwSJZN0AjI0NFUikzjg/nxkT9e7Ggak4D+8BTpNKAUw2QXppwhVS5
X-Received: by 2002:a05:620a:d8d:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7cd01168e05mr2431696885a.58.1747129106543;
        Tue, 13 May 2025 02:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747129106; cv=none;
        d=google.com; s=arc-20240605;
        b=Ath8n/7OiYgMzQ8mRxyPl6orQJS0UuLw92458e1X3T2r0GhZryppbDG9YQp82BLlr4
         MlR3CvpdoZDVsvg0JPf0KgavwHvHiG7t/nnnBtgOOAfo7mJ71kl+K9hJxxuWd8sYGrvT
         pR0ilaxx2NeCTsoSQfvyG+yg7Wr48PMtdB4NjteuaDajuP4UQNR3X7jlGwTJKAUx3WJx
         iKYOKNhAgbUXj7aUT9gmmycZoKAGC0i2Z9l/wM829ie7i9miDw7DaFvVHLtgMjP9mTqk
         1LvnoYN6SBy2iop0RI1VR0xo4G2XEJqnmVrHYJwiE+Z1VEOwNHoMUVQ8zptXY0A4cvGR
         WUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=4KrX5dQOsiuTyKGPiD7lJuvLzjNro5fZEtw25f9WuCU=;
        fh=/CKQ3nMtXKHOuiE1/DfBmWoXQFLFXQ5vw4iEEZrcemM=;
        b=La3wbpHvRKt3omqgsmfRRXIMmm+31CCyp/Sb368EWVYDN7+cNj4KvTQGMFwFtZz/sh
         lfQf8qplnT+zy+9wQf3zrXI6lu0WFPTiXm2kexlUGLJJfE9S9xtbU2KWvAInz9TfYhXY
         mGIhekWg8T2KJyq58jcmdYfeufe0bYQMFbegfB1IKXKGZovuFGY5Gvz0tW7hHCekfrmO
         8ooKx4MtKj4DgXPA9ClUQ24PLdTZVGNOTOfWn3o2vIFd3HVZjwyWQHraJid6FvW6abVG
         xI0Nyj0oQLdaa31MUh6+vwSJkU7/HY/VtIugyvAs5JafTtY+weKOU/fBkbWAa+WtRwXg
         4uHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WRLHmOh3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fe3585si1081771785a.393.2025.05.13.02.38.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:38:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WRLHmOh3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747129106;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4KrX5dQOsiuTyKGPiD7lJuvLzjNro5fZEtw25f9WuCU=;
	b=WRLHmOh3lqKMu1dk7IB+CInN4oPyCj03OEYhQIklFdn3ad7AfO5xdaWacyqZkdtqoKpFai
	W1gqfS/c05+UjhlB/M0JY4etUSZiUlTOv6deP6cUkSpnDPX0CY6QzdIdq7OC6JlvasieJ4
	P+Mth4EoLZN8PO/fX8f6Wq7U46mhszk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-R8CR3u9wO0-oFGxkp9cxoQ-1; Tue, 13 May 2025 05:38:25 -0400
X-MC-Unique: R8CR3u9wO0-oFGxkp9cxoQ-1
X-Mimecast-MFC-AGG-ID: R8CR3u9wO0-oFGxkp9cxoQ_1747129104
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so21825155e9.1
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 02:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747129104; x=1747733904;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KrX5dQOsiuTyKGPiD7lJuvLzjNro5fZEtw25f9WuCU=;
        b=cg/7L+HB3qRgutbUu4Ja0WEuXwOqlOsbIXkJyDCjGPKOC6uISVwYtP7sP/xiSx3cWj
         nX7OvujMUdpdMu2WeMXi6JEVU3CUmHVT/vr4zmhyBfopdZ2dQNgp7WUzDIISqUDzGTKr
         o8M3fqm0EwVH7hs47t0kttkAZO6//M+t0Yz91Pk56LqfVw0k1dENlmc9Z3F00fVE8hQG
         vFpvByQmbekwc2AIPt+MYB7ai7lccjwpPY4e8dlChTXtf0cGbi2PSirkCnTtaBguISZo
         mdQ92AyNl5DHd3fPwuUdsqQz+bmnQKd68dxMrytiGbjNmAvkLAnjie/upTY0n0f9z89h
         7WMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUROm1Z1QQli1UUpfF72fz5UqCRJXyrcotznnrSIOF0hn5aQbJMtKJiuBKz9VvlTnuGR/TZHY+SR8PuA==@linaro.org
X-Gm-Message-State: AOJu0YxLb3YCKTmG2cCNhKm4pnOL8Ft8wzZdrsUZj9Y41erBR6sGpPlO
	Yh1Cxf6B5FFdvy0HILrPtRh1jgfAZoJdylCsRTOlaHLY4aHaMIp3hziK5o5Xd0EvZ7ne03YVZUw
	nLnsnCq5bOucvU601EzALxQJRwN/2kQHnniE9tvDjH96O5dcKd2YCmg==
X-Gm-Gg: ASbGncueTCHAZD6pk0H+zMBqhPiQ1w1pGFpMkQc63HlwC6Rya61J1sOyWNXr2AKHj5O
	aLpqERxFewhbkpnvMOoolK9dc1B9+1xvQjujZvtLATi8h3esRtiE14du2gz8BLDUIb+Pyh80Zua
	gmUGU8zW83TuhrjHSNObmTNP9n/CKP0q2Ba1dxkMpE4rhm6kDDKEyw2JbAdJ/umnbYRHM52en8U
	SbHa0w3eeZvTBNFmsB9X4CsDZ9AhBe8u38n8ZmZIaw6KZmFK7hhfokgsZlsnqmcSROat/jKvJuq
	6s5Qn3CfXVSqLs3lFPVQmD2omcMC1Pu346VTsXoTzE2DYZWdXmLD5E7mPgs=
X-Received: by 2002:a05:600c:4d21:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-442eacf980fmr16403355e9.12.1747129103729;
        Tue, 13 May 2025 02:38:23 -0700 (PDT)
X-Received: by 2002:a05:600c:4d21:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-442eacf980fmr16403125e9.12.1747129103224;
        Tue, 13 May 2025 02:38:23 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aecb0sm206781415e9.28.2025.05.13.02.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:38:22 -0700 (PDT)
Message-ID: <7efea440-f472-4115-9133-436347632c50@redhat.com>
Date: Tue, 13 May 2025 11:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v6 00/14] arm: rework id register storage
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250506085234.855779-1-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250506085234.855779-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lAbamzIiQXKl3fi292U4vj-_J6_6WYmLagJTWF4O4bU_1747129104
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: siPdu/HV0RzY

Hi Connie,

On 5/6/25 10:52 AM, Cornelia Huck wrote:
> Just some small changes:
> - fixed up some botched conversions noted by Eric (thanks!)
> - rebased to current master
> - new patch with a small cleanup suggested by Eric
>
> Also available at
> https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v6

The series looks good to me and I have not spotted any additional
conversion issue.

Thanks

Eric
>
> <v5 cover letter>
> Just a quick respin to fix a missed conversion in hvf.c.
>
> <v4 cover letter>
> Next iteration of the id register patches; only small changes.
>
> Changed from v3:
> - added R-bs (thanks!)
> - added missing SPDX header
> - merged patch introducing accessors for kvm to the first user
> - skip over sysregs outside of the id register range when generating
>   register definitions again
>
> Also available at
> https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v4
>
> <v3 cover letter>
> Yet another update of the id register series, less changes this time
> around.
>
> Changed from v2:
> - changed generation of the various register defines via the "DEF"
>   magic suggested by Richard
> - some kvm-only code moved to kvm.c; some code potentially useful to
>   non-kvm code stayed out of there (the cpu model code will make use
>   of it, and that one should be extendable outside of kvm -- a
>   revised version of those patches is still in the works, but I'll be
>   off for a few days and rather wanted to get this one out first)
>
> Also available at
> https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v3
>
> <v2 cover letter>
>
> Changed from v1:
> - Noticed that we missed the hvf code. Converted, compiled, but not tested
>   as I'm lacking an environment for testing.
> - Hopefully incorporated most of the suggested changes -- if I missed
>   something, it was unintentional unless mentioned below.
>   - fixed repeated inclusion of definitions
>   - hopefully made macros more robust
>   - removed distinction between reading 32/64 values, which was mostly
>     adding churn for little value
>   - postponed generating property definitions to the cpu model patches,
>     where they are actually used
>   - juggled hunks and moved them to the right patches
>   - fixed some typos
> - rebased to a more recent code base
>
> NOT changed from v1:
> - definitions are still generated from the Linux sysregs file
>   - I still think updating the generated files on demand (so that we can
>     double check the result) is the right thing to do
>   - I'm open to changing the source of the definitions from the sysregs
>     file to the JSON definitions published by Arm; however, I first wanted
>     to get the code using it right -- we can switch out the code generating
>     the file to use a different source easily later on, and I'd also like
>     to steal parts of the script from Linux once integrated (which I think
>     hasn't happened yet?)
>
> <v1 cover letter>
>
> [Note: I've kept the cc list from the last round of cpu model patches;
> so if you're confused as to why you're cc:ed here, take it as a
> heads-up that a new cpu model series will come along soon]
>
> This patch series contains patches extracted from the larger cpu model
> series (RFC v2 last posted at
> https://lore.kernel.org/qemu-devel/20241206112213.88394-1-cohuck@redhat.com/)
> and aims at providing a base upon which we can continue with building
> support for cpu models, but which is hopefully already an improvement
> on its own.
>
> Main changes from the patches in that series include:
> - post-pone the changes to handle KVM writable ID registers for cpu models
>   (I have a series including that on top of this one)
> - change how we store the list of ID registers, and access them
>   basically, use an enum for indexing, and an enum doing encodings in a
>   pattern similar to cpregs
> - move some hunks to different patches
> - update the scripts to generate the register descriptions, and run
>   them against a recent Linux sysregs file
>
> What I've kept:
> - generating the register descriptions from the Linux sysregs file
>   I think that file is still our best bet to generate the descriptions
>   easily, and updating the definitions is a manual step that can be checked
>   for unintended changes
> - most of the hard work that Eric had been doing; all new bugs in there
>   are my own :)
>
> </v1 cover letter>
> </v2 cover letter>
> </v3 cover letter>
> </v4 cover letter>
> </v5 cover letter>
>
> Cornelia Huck (2):
>   arm/cpu: switch to a generated cpu-sysregs.h.inc
>   arm/kvm: use fd instead of fdarray[2]
>
> Eric Auger (12):
>   arm/cpu: Add sysreg definitions in cpu-sysregs.h
>   arm/cpu: Store aa64isar0/aa64zfr0 into the idregs arrays
>   arm/cpu: Store aa64isar1/2 into the idregs array
>   arm/cpu: Store aa64pfr0/1 into the idregs array
>   arm/cpu: Store aa64mmfr0-3 into the idregs array
>   arm/cpu: Store aa64dfr0/1 into the idregs array
>   arm/cpu: Store aa64smfr0 into the idregs array
>   arm/cpu: Store id_isar0-7 into the idregs array
>   arm/cpu: Store id_pfr0/1/2 into the idregs array
>   arm/cpu: Store id_dfr0/1 into the idregs array
>   arm/cpu: Store id_mmfr0-5 into the idregs array
>   arm/cpu: Add sysreg generation scripts
>
>  hw/intc/armv7m_nvic.c                 |  27 +-
>  scripts/gen-cpu-sysregs-header.awk    |  35 ++
>  scripts/update-aarch64-sysreg-code.sh |  25 ++
>  target/arm/cpu-features.h             | 317 +++++++++---------
>  target/arm/cpu-sysregs.h              |  42 +++
>  target/arm/cpu-sysregs.h.inc          |  52 +++
>  target/arm/cpu.c                      | 111 +++----
>  target/arm/cpu.h                      |  80 +++--
>  target/arm/cpu64.c                    | 128 +++----
>  target/arm/helper.c                   |  68 ++--
>  target/arm/hvf/hvf.c                  |  39 ++-
>  target/arm/internals.h                |   6 +-
>  target/arm/kvm.c                      | 139 ++++----
>  target/arm/ptw.c                      |   6 +-
>  target/arm/tcg/cpu-v7m.c              | 174 +++++-----
>  target/arm/tcg/cpu32.c                | 320 +++++++++---------
>  target/arm/tcg/cpu64.c                | 459 +++++++++++++-------------
>  17 files changed, 1103 insertions(+), 925 deletions(-)
>  create mode 100755 scripts/gen-cpu-sysregs-header.awk
>  create mode 100755 scripts/update-aarch64-sysreg-code.sh
>  create mode 100644 target/arm/cpu-sysregs.h
>  create mode 100644 target/arm/cpu-sysregs.h.inc
>
