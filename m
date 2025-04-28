Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp6097903njd;
        Mon, 28 Apr 2025 09:43:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZf/vaCKLvNtHFFWKG75CQfLr+q8+DxXRhRkMGK7e+M0BAv8nAD/OQzp4JWM0k+euRJWC3wYbQepIBjw==@linaro.org
X-Google-Smtp-Source: AGHT+IH3gjB557O1MotTx6mIqmu6b1sDS7H3kmV6NqNzgg+LplsGFoS2V++/z2djw6Ga0b6tE/ng
X-Received: by 2002:a0c:fd23:0:b0:6f4:c824:9d3f with SMTP id 6a1803df08f44-6f4c824a0cfmr159222876d6.16.1745858636185;
        Mon, 28 Apr 2025 09:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745858636; cv=none;
        d=google.com; s=arc-20240605;
        b=X8wGGAj+LjujlvwOpu15sflx8hsUIAqWcU0AljJrGY6qzcswImSnCjGp1H2GnGOb2X
         Fwi6hSjtmMoYEFoaWjtdxU/T4398asgTwiQUbMQB4lffcUdOWBBUoDKwydaBX3qka0xJ
         D8AhxblTW+wFG33TIMgLmWYvxzmDKzVHQlEyfsE07gjoVaezo9zD8pLe1Wd3cbAEdboU
         SAMUWQ64NUZ0gagRsQ3EkPUpClWIbXF2SRW9NHP9r7XQNpv3agW3hMe83dG4NtSIorfW
         3xBqV3VucHDLdicXwI96Qehd1mW+GJ0kLSGse6bemHqEeN7NKei2ABiL1egUvlk6e1uT
         1NKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=hT9szaBMS1wuwJ4Sk2MNJGIE71RFervjbyhX/iYXJP0=;
        fh=i9tgNVaEByTjHHB1eEYcyzpffjQVYcVJDDYNSyyORLY=;
        b=EIdnnjbj2RTYLRPFNADjPovlP8DgBFdwT3+aDnmd22tFpYMXKD2+qhAxbTAe31ukBK
         Y0wXynJbcCHdwNZzIQcV5bylSLnooQnwMA3t8iAQXFJIFu1ha19TnwaKsw7SkpDR6e0w
         Xkc7nl8beTFHAlhuI9nqGt2bSinkN6wtncPEOKryHSU9Ds+yx+dsMRzQO9tdvx6GH4O0
         Or32ZEDdeSenEP/CMlg0P2+Fu4LlI4VZ6UTG0l0l4zrNAiSa1mjmlErukK7Qnu1Hqvex
         9wVP0JGVAwg8PM68cZAPch+RyterrZ442WyXT7a8bpiM7432kgyd1PYQb8j73VdwFkL5
         MlCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a66VeyfM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c0b214f9si101779706d6.496.2025.04.28.09.43.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:43:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a66VeyfM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745858635;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hT9szaBMS1wuwJ4Sk2MNJGIE71RFervjbyhX/iYXJP0=;
	b=a66VeyfMbaH7GitLLFRkJHsQKqU2L2Zf9vfwAVRZq9uZBi45+kXKaaSLRvggHzKcT7groY
	wJbvJgSl3jT7oXYS9OuRGlr7u+cCxmO//oxkIF1Gm7uSCWBlPHwQPaJc+48UKavd9OxPVJ
	1sdBBd4Y2edaX3fyulYQ7sP4bQOxi78=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-LltXT0BPNlW9D0cvQDA58Q-1; Mon, 28 Apr 2025 12:43:54 -0400
X-MC-Unique: LltXT0BPNlW9D0cvQDA58Q-1
X-Mimecast-MFC-AGG-ID: LltXT0BPNlW9D0cvQDA58Q_1745858633
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so26432815e9.3
        for <alex.bennee@linaro.org>; Mon, 28 Apr 2025 09:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858633; x=1746463433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hT9szaBMS1wuwJ4Sk2MNJGIE71RFervjbyhX/iYXJP0=;
        b=AVg2o6bVqyrJnq7U1QTJdw2p6+ATKzf0UWqxfrOUhOW7cFXvHF39fl5MLfYx9u/rYh
         ZlC1vOuhFQlpUnV/y+d9NH1eCdj7SKU97P6DFjBz17+NiqMUi3sGK6Plp+eVkGSY+91g
         QflKyF7upUzpXmyreUuVAIwF74lZbogx3ZRj4J2GmE9pHU1ajStTshK7MyfE+8HV2nEq
         u53wvpJHY2FHUK6VaJeJwz6tKx1a+cRL5INZSBrwAMv2MvwN5l9PthEycdbGuP0VLPfO
         dAAMnMgnLsvx5GV1Y7e5XnR/dPYxfedlKiMrOgRzPPzAAsv4v2c0Vx0YqjYek3+jvbY9
         YUqg==
X-Forwarded-Encrypted: i=1; AJvYcCUXBVj5ljB/TiSLmcSNHk9sYKLIbNq3G6hNtGaeIhTml9XLYtnqc/bE2F53YHCNZxqQim858vPR72Axxg==@linaro.org
X-Gm-Message-State: AOJu0YxrABNCN5UWJUX6Q3bTrDOfLlndwoIfygDfCkiiOUck01+HwtX2
	OzjDoLHLEGDaZLpg89eVr7apOusaz6Tdvs/1R+Gt5ujeIlK5ot2g/MI4YwHY4uYdGNBygzq4ZHu
	DskOkBsCdofSgHUgTAUhUMUJjlyfYT4EUyNNMyrBDI5uhEbTHXqASyg==
X-Gm-Gg: ASbGncs8StRternyNMSdtC4y+gMEU8I/jMr7uihS/E5sX4nd82JCgEcuVV75AhcWXy1
	EIr6CkkdYRQQK0Ofsrqv8on3I2TlCrb5YCs23wEMAVBBmtSvOU1yT6Juj/I3D1XzO09KzwGhCj/
	r+F1VyifEJWGIBY3pOCE31yF5WI1M+NXI8qzcw4yJplm44RkMjNNQHhDnSijzzVhQH5X5mUUyaG
	jrexwpCZnOUijdZtxxAijzaV8CI1z6ZPBCdH92Oj0rWLLy3GqNKJ0SAx4fGiA/0TcAWGkq165SD
	ph1bV8TqHyuE7/fPK3wShwmDDszonT9/aFZi5yHt7FlcSayF/7ZpCwCy8ds=
X-Received: by 2002:a05:600c:3d0b:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-441ac859010mr273545e9.14.1745858633343;
        Mon, 28 Apr 2025 09:43:53 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0b:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-441ac859010mr273125e9.14.1745858632764;
        Mon, 28 Apr 2025 09:43:52 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53108f2sm128676115e9.19.2025.04.28.09.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:43:52 -0700 (PDT)
Message-ID: <4cbaa46b-2114-49b3-8d59-e92a4967665b@redhat.com>
Date: Mon, 28 Apr 2025 18:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH for-10.1 v5 00/13] arm: rework id register storage
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250409144304.912325-1-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250409144304.912325-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l12nXon0ip_9NkB8Q8fVsAn1u6-zt31A4d3nvU0FQOI_1745858633
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: MNTRr4qkC3ZB

Hi Connie,

On 4/9/25 4:42 PM, Cornelia Huck wrote:
> Just a quick respin to fix a missed conversion in hvf.c.
>
> Also available at
> https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v5

I reviewed it again - I can't send any R-b through since I am co-author
;-) - and I spotted few conversion mistakes (I am most probably the one
to blame here sorry)

Once those fixed, I think we should be good.

Eric
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
>
> Cornelia Huck (1):
>   arm/cpu: switch to a generated cpu-sysregs.h.inc
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
>  target/arm/cpu-sysregs.h              |  46 +++
>  target/arm/cpu-sysregs.h.inc          |  52 +++
>  target/arm/cpu.c                      | 111 +++----
>  target/arm/cpu.h                      |  80 +++--
>  target/arm/cpu64.c                    | 128 +++----
>  target/arm/helper.c                   |  68 ++--
>  target/arm/hvf/hvf.c                  |  39 ++-
>  target/arm/internals.h                |   6 +-
>  target/arm/kvm.c                      | 129 ++++----
>  target/arm/ptw.c                      |   6 +-
>  target/arm/tcg/cpu-v7m.c              | 174 +++++-----
>  target/arm/tcg/cpu32.c                | 320 +++++++++---------
>  target/arm/tcg/cpu64.c                | 460 +++++++++++++-------------
>  17 files changed, 1103 insertions(+), 920 deletions(-)
>  create mode 100755 scripts/gen-cpu-sysregs-header.awk
>  create mode 100755 scripts/update-aarch64-sysreg-code.sh
>  create mode 100644 target/arm/cpu-sysregs.h
>  create mode 100644 target/arm/cpu-sysregs.h.inc
>
