Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4609441njb;
        Wed, 11 Dec 2024 23:41:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQwmKjq2MDXLal0zsOp5MlFdPgDWzq7kGDYbj60rNUfGT62hAWiaV3BKOTZWSGaj45ON8YdIduR/8a8g==@linaro.org
X-Google-Smtp-Source: AGHT+IG3Cl2JQIbKsctDzk4DBVr/RvAMLGVQ2tS/WmN3nbeKnGZBF6zfoJ4j13gQzP78C2sAJySX
X-Received: by 2002:a05:622a:130c:b0:467:6201:818a with SMTP id d75a77b69052e-46796234692mr47614231cf.36.1733989278014;
        Wed, 11 Dec 2024 23:41:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733989278; cv=none;
        d=google.com; s=arc-20240605;
        b=ibJCOlVNri67ZMleou+ewAaZzE8aEmHo7KNbY5k7y+6nqERSAoVG0VfdkbweL0AYyl
         +R3nb00Pjz9pkhdCD7mFvnJetfVO7tXEsulNbGh5+F/IeSila1T6/ap0aCEerI142U5X
         FOxv9pfZ90QhGaFPo2pYYoShXdIjvisE9ggcPypOCPuY44LLpUdH0F6Jhqh7qo6hFazU
         4yVXv7MzbPhU84VoySbIaSBCQbUleBbGOTdlYTrVRL0MFnYXzr0I1yhmWA0vabtvOzs1
         yZGOJb/wld9E2S17c3frZueOxUMOhTzos1fIo3J+IPkSwb4oUrhvLRevUs611CLsG894
         QjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=+BBjqkexuxRVsrMPO4GlnyeXmHrcoGbCCP6iUHH48A4=;
        fh=ReiOr77FyjF1gUOQ7Fob/HiZ3JU0opGUYT53XZpFFzo=;
        b=lBJchGXlcDg1+CfiI3UsCpYVpwRW3h/iw+WL+NYD77Moqg1tZFwn7G341o7dTXUHHQ
         c9kb2EcMblKG9Dgwy2FisoZg+O3uNrYK9BXLh3F8u6pS9pCUJWkRJ9No2wY0NSwXaCsh
         uaUN6DtSVfNHKHgrWgmtf1kIBZ5vKdeSUFT+DSLUwDXkYRfvk3u4OZJjUzW+a3e3Qr5i
         7bhnntUikxNVoLiVh5bYHGtcKBowI1Umpd0lOd927c7EX0M/nKrOKMfoGpFh9RTigr2U
         ZRYAXadr+mTPbgHIv1vA+ZIhDTjh+ftubx/ZSgLZqP83z0bIcuRK+IvFQaQb4J1NALvN
         MFIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ToSqnxDZ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46758e33aa5si129628701cf.491.2024.12.11.23.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:41:17 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ToSqnxDZ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733989277;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BBjqkexuxRVsrMPO4GlnyeXmHrcoGbCCP6iUHH48A4=;
	b=ToSqnxDZ0ZeoFKtZnYT3SSGnXEZdcJBHeY0gh1O/4lyMQ3ev0x/2sSoXN14KtwIh5HKYcs
	/JHGv9MOL9VkVRjMYR6HE/N5zisOaAP2YzBlk2DNqIN0X0pYAG2nh8Um+2/m6oUfmSEcMx
	cnVf/t2WTFaf09lL358kx5Kvk6yZLIw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-4LqJPzymOPyRL9FdfbF-5Q-1; Thu, 12 Dec 2024 02:41:16 -0500
X-MC-Unique: 4LqJPzymOPyRL9FdfbF-5Q-1
X-Mimecast-MFC-AGG-ID: 4LqJPzymOPyRL9FdfbF-5Q
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467905ab1bbso12488581cf.1
        for <alex.bennee@linaro.org>; Wed, 11 Dec 2024 23:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733989275; x=1734594075;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BBjqkexuxRVsrMPO4GlnyeXmHrcoGbCCP6iUHH48A4=;
        b=rAPRHVhSaxbx6pY8/F4T7ilS/LSHb2YIqtVft7j9EGedECuP+ktzJGTJBn/Hf9zXgw
         EOLPYXDJC6d9MvRpkQETQXloAqVBEbFHfLY/s7+62pUFnGRTcBfF59qy5yS3vv2NG8bR
         b0HwzS0Vg/gGlNDcXGlA8ytrs1miN0c9mqChUk5OXeaGkSs1x3MXLbiOQ9PEXiS/IgAj
         qzd39ty1Rw9svkzjdM1MW2ScI1z7bypL5JqNzAWHMQCu+QfB/jwvss3+BT3i3x97owJg
         CtqPDjMj7Xu+PYYFcwGMPzW2NEfD34Kexhx+9jtpUfBLOVqSlZTjWlwaouPBBqoOiioI
         RbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq7630M8Z/0I6UUiDoibsfNMhvYYC7/VpLMRSGpMeTk9RRAiN28VuF5eSxxgg73jrwJIMhIH4c3adiqg==@linaro.org
X-Gm-Message-State: AOJu0Yw7w++WO98pkKDqJ5I3nBlw0CaPPBagPCu7g1r7sXJrbTzEujGB
	cC04NCpo9VHvC3D+gf1KV1zjaOPbL9E0nLvhLIq+eImNd82YT+OAQNuIjqr7uJxU1Lpqq+1WQwR
	COlEWjTYEGMRNbrKQx5iIE9u2wNh0neRewn3jb6PT78aig4zhWQDQ2w==
X-Gm-Gg: ASbGncvY4rbIppo/8mAGUshyliu7sOGYSF0hbINtIHi3N67f75a8LK5OlJAJhZBbvLX
	XcbsokzGFuDx6TOlBqvhrheUpqYI3WxpMyK8aSQYwYN6Pv3UvgJx/16SC95pC7tLRMEYXtEjN5Q
	aUO5QmVBhKO2F3x1rrdXpM1vINRy66oCJfvzDUGuyyMVGYFRSIzwqH4+7cO5NssSI5B9+xYQr5+
	9b1UN9vQ8CTn9HKhb6b1v/KLeGlN+50/wC/EIOQ84XB2bDY23Km82tkJtxmT23PEzGmGvABVACZ
	hXjZmXl582c6PpKBAfhSDzWZ/F2S
X-Received: by 2002:a05:6214:2129:b0:6d4:1662:348c with SMTP id 6a1803df08f44-6dae38f5795mr35838156d6.17.1733989275342;
        Wed, 11 Dec 2024 23:41:15 -0800 (PST)
X-Received: by 2002:a05:6214:2129:b0:6d4:1662:348c with SMTP id 6a1803df08f44-6dae38f5795mr35837876d6.17.1733989274955;
        Wed, 11 Dec 2024 23:41:14 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dae944ce81sm4009876d6.61.2024.12.11.23.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 23:41:13 -0800 (PST)
Message-ID: <74616ed3-24d3-44fd-a8b0-bb2927dbd5d5@redhat.com>
Date: Thu, 12 Dec 2024 08:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64 KVM
 host model
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20241206112213.88394-1-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20241206112213.88394-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GyvOQMM0uQk_cFR4t9oFEVO0pLMR3TiNryIVPalq1UE_1733989275
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 5HPVRjDhyVWO

Hi Peter, Richard,

On 12/6/24 12:21, Cornelia Huck wrote:
> A respin/update on the aarch64 KVM cpu models. Also available at
> gitlab.com/cohuck/qemu arm-cpu-model-rfcv2
>
> Find Eric's original cover letter below, so that I do not need to
> repeat myself on the aspects that have not changed since RFCv1 :)
>
> Changes from RFCv1:
>
> Rebased on more recent QEMU (some adaptions in the register conversions
> of the first few patches.)
>
> Based on feedback, I have removed the "custom" cpu model; instead, I
> have added the new SYSREG_<REG>_<FIELD> properties to the "host" model.
> This works well if you want to tweak anything that does not correspond
> to the existing properties for the host model; however, if you e.g.
> wanted to tweak sve, you have two ways to do so -- we'd probably either
> want to check for conflicts, or just declare precedence. The kvm-specific
> props remain unchanged, as they are orthogonal to this configuration.
>
> The cpu model expansion for the "host" model now dumps the new SYSREG_
> properties in addition to the existing host model properties; this is a
> bit ugly, but I don't see a good way on how to split this up.
>
> Some more adaptions due to the removal of the "custom" model.
>
> Things *not* changed from RFCv1:
>
> SYSREG_ property naming (can be tweaked easily, once we are clear on what
> the interface should look like.)
>
> Sysreg generation scripts, and the generated files (I have not updated
> anything there.) I think generating the various definitions makes sense,
> as long as we double-check the generated files on each update (which would
> be something to trigger manually anyway.)
>
> What I would like us to reach some kind of consensus on:
>
> How to continue with the patches moving the ID registers from the isar
> struct into the idregs array. These are a bit of churn to drag along;
> if they make sense, maybe they can be picked independently of this series?
What is your opinion on that? Patches 2 -12 are dedicated to the move of
isar struct's individual idreg fields to an array. To me , this
anonymous storage looks more generic, scalable and adapted to the way we
retrieve information from KVM. Do you think this is an acceptable
reshuffle of the code and can we envision to push those changes in a
separate prerequisite series that would avoid us to rebase everytime
until we get a solution for named vcpu models?

Thanks

Eric
>
> Whether it make sense to continue with the approach of tweaking values in
> the ID registers in general. If we want to be able to migrate between cpus
> that do not differ wildly, we'll encounter differences that cannot be
> expressed via FEAT_xxx -- e.g. when comparing various AmpereAltra Max systems,
> they only differ in parts of CTR_EL0 -- which is not a feature register, but
> a writable register.
>
> Please take a look, and looking forward to your feedback :)
>
> ***********************************************************************
>
> Title: Introduce a customizable aarch64 KVM host model 
>
> This RFC series introduces a KVM host "custom" model.
>
> Since v6.7 kernel, KVM/arm allows the userspace to overwrite the values
> of a subset of ID regs. The list of writable fields continues to grow.
> The feature ID range is defined as the AArch64 System register space
> with op0==3, op1=={0, 1, 3}, CRn==0, CRm=={0-7}, op2=={0-7}.
>
> The custom model uses this capability and allows to tune the host
> passthrough model by overriding some of the host passthrough ID regs. 
>
> The end goal is to get more flexibility when migrating guests
> between different machines. We would like the upper software layer
> to be able detect how tunable the vpcu is on both source and destination
> and accordingly define a customized KVM host model that can fit
> both ends. With the legacy host passthrough model, this migration
> use case would fail.
>
> QEMU queries the host kernel to get the list of writable ID reg
> fields and expose all the writable fields as uint64 properties. Those
> are named "SYSREG_<REG>_<FIELD>". REG and FIELD names are those
> described in ARM ARM Reference manual and linux arch/arm64/tools/sysreg.
> Some awk scriptsintroduced in the series help parsing the sysreg file and
> generate some code. those scripts are used in a similar way as
> scripts/update-linux-headers.sh.  In case the ABI gets broken, it is
> still possible to manually edit the generated code. However it is
> globally expected the REG and FIELD names are stable.
>
> The list of SYSREG_ID properties can be retrieved through the qmp
> monitor using query-cpu-model-expansion [2].
>
> The first part of the series mostly consists in migrating id reg
> storage from named fields in ARMISARegisters to anonymous index
> ordered storage in an IdRegMap struct array. The goal is to have
> a generic way to store all id registers, also compatible with the
> way we retrieve their writable capability at kernel level through
> the KVM_ARM_GET_REG_WRITABLE_MASKS ioctl. Having named fields
> prevented us from getting this scalability/genericity. Although the
> change is invasive  it is quite straightforward and should be easy
> to be reviewed.
>
> Then the bulk of the job is to retrieve the writable ID fields and
> match them against a "human readable" description of those fields.
> We use awk scripts, derived from kernel arch/arm64/tools/gen-sysreg.awk
> (so all the credit to Mark Rutland) that populates a data structure
> which describes all the ID regs in sysreg and their fields. We match
> writable ID reg fields with those latter and dynamically create a
> uint64 property. 
>
> Then we need to extend the list of id regs read from the host
> so that we get a chance to let their value overriden and write them
> back into KVM .
>
> This expectation is that this custom KVM host model can prepare for
> the advent of named models. Introducing named models with reduced
> and explicitly defined features is the next step.
>
> Obviously this series is not able to cope with non writable ID regs.
> For instance the problematic of MIDR/REVIDR setting is not handled
> at the moment.
>
>
> TESTS:
> - with few IDREG fields that can be easily examined from guest
>   userspace:
>   -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0,SYSREG_ID_AA64ISAR1_EL1_DPB=0x0
> - migration between custom models
> - TCG A57 non regressions. Light testing for TCG though. Deep
>   review may detect some mistakes when migrating between named fields
>   and IDRegMap storage
> - light testing of introspection. Testing a given writable ID field
>   value with query-cpu-model-expansion is not supported yet.
>
> TODO/QUESTIONS:
> - Some idreg named fields are not yet migrated to an array storage.
>   some of them are not in isar struct either. Maybe we could have
>   handled TCG and KVM separately and it may turn out that this
>   conversion is unneeded. So as it is quite cumbersome I prefered
>   to keep it for a later stage.
> - the custom model does not come with legacy host properties
>   such as SVE, MTE, expecially those that induce some KVM
>   settings. This needs to be fixed.
> - The custom model and its exposed properties depend on the host
>   capabilities. More and more IDREG become writable meaning that
>   the custom model gains more properties over the time and it is
>   host linux dependent. At the moment there is no versioning in
>   place. By default the custom model is a host passthrough model
>   (besides the legacy functions). So if the end-user tries to set
>   a field that is not writable from a kernel pov, it will fail.
>   Nevertheless a versionned custom model could constrain the props
>   exposed, independently on the host linux capabilities.
> - the QEMU layer does not take care of IDREG field value consistency.
>   The kernel neither. I imagine this could be the role of the upper
>   layer to implement a vcpu profile that makes sure settings are
>   consistent. Here we come to "named" models. What should they look
>   like on ARM?
> - Implementation details:
>   -  it seems there are a lot of duplications in
>   the code. ID regs are described in different manners, with different
>   data structs, for TCG, now for KVM.
>   - The IdRegMap->regs is sparsely populated. Maybe a better data
>   struct could be used, although this is the one chosen for the kernel
>   uapi.
>
> References:
>
> [1] [PATCH v12 00/11] Support writable CPU ID registers from userspace
> https://lore.kernel.org/all/20230609190054.1542113-1-oliver.upton@linux.dev/
>
> [2]
> qemu-system-aarch64 -qmp unix:/home/augere/TEST/QEMU/qmp-sock,server,nowait -M virt --enable-kvm -cpu custom
> scripts/qmp/qmp-shell /home/augere/TEST/QEMU/qmp-sock
> Welcome to the QMP low-level shell!
> Connected to QEMU 9.0.50
> (QEMU) query-cpu-model-expansion type=full model={"name":"custom"}
>
> [3]
> KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES
> KVM_ARM_GET_REG_WRITABLE_MASKS
> Documentation/virt/kvm/api.rst
>
> [4] linux "sysreg" file
> linux/arch/arm64/tools/sysreg and gen-sysreg.awk
> ./tools/include/generated/asm/sysreg-defs.h
>
>
> Cornelia Huck (3):
>   kvm: kvm_get_writable_id_regs
>   arm-qmp-cmds: introspection for ID register props
>   arm/cpu-features: document ID reg properties
>
> Eric Auger (17):
>   arm/cpu: Add sysreg definitions in cpu-sysregs.h
>   arm/cpu: Store aa64isar0 into the idregs arrays
>   arm/cpu: Store aa64isar1/2 into the idregs array
>   arm/cpu: Store aa64drf0/1 into the idregs array
>   arm/cpu: Store aa64mmfr0-3 into the idregs array
>   arm/cpu: Store aa64drf0/1 into the idregs array
>   arm/cpu: Store aa64smfr0 into the idregs array
>   arm/cpu: Store id_isar0-7 into the idregs array
>   arm/cpu: Store id_mfr0/1 into the idregs array
>   arm/cpu: Store id_dfr0/1 into the idregs array
>   arm/cpu: Store id_mmfr0-5 into the idregs array
>   arm/cpu: Add infra to handle generated ID register definitions
>   arm/cpu: Add sysreg generation scripts
>   arm/cpu: Add generated files
>   arm/kvm: Allow reading all the writable ID registers
>   arm/kvm: write back modified ID regs to KVM
>   arm/cpu: more customization for the kvm host cpu model
>
>  docs/system/arm/cpu-features.rst      |  47 +-
>  hw/intc/armv7m_nvic.c                 |  27 +-
>  scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++
>  scripts/gen-cpu-sysregs-header.awk    |  47 ++
>  scripts/update-aarch64-sysreg-code.sh |  27 +
>  target/arm/arm-qmp-cmds.c             |  19 +
>  target/arm/cpu-custom.h               |  58 +++
>  target/arm/cpu-features.h             | 311 ++++++------
>  target/arm/cpu-sysreg-properties.c    | 682 ++++++++++++++++++++++++++
>  target/arm/cpu-sysregs.h              | 152 ++++++
>  target/arm/cpu.c                      | 123 ++---
>  target/arm/cpu.h                      | 120 +++--
>  target/arm/cpu64.c                    | 260 +++++++---
>  target/arm/helper.c                   |  68 +--
>  target/arm/internals.h                |   6 +-
>  target/arm/kvm.c                      | 253 +++++++---
>  target/arm/kvm_arm.h                  |  16 +-
>  target/arm/meson.build                |   1 +
>  target/arm/ptw.c                      |   6 +-
>  target/arm/tcg/cpu-v7m.c              | 174 +++----
>  target/arm/tcg/cpu32.c                | 320 ++++++------
>  target/arm/tcg/cpu64.c                | 460 ++++++++---------
>  target/arm/trace-events               |   8 +
>  23 files changed, 2594 insertions(+), 916 deletions(-)
>  create mode 100755 scripts/gen-cpu-sysreg-properties.awk
>  create mode 100755 scripts/gen-cpu-sysregs-header.awk
>  create mode 100755 scripts/update-aarch64-sysreg-code.sh
>  create mode 100644 target/arm/cpu-custom.h
>  create mode 100644 target/arm/cpu-sysreg-properties.c
>  create mode 100644 target/arm/cpu-sysregs.h
>
