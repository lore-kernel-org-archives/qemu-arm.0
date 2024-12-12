Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4633122njb;
        Thu, 12 Dec 2024 00:42:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWYRs6pyRkA+ca7u33FrrAO0LhCLsywB4YIWStYo8w7scZBh6z/fnMZ6faVU7drOWpZkgi+NwQd6vrOfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEKpzFfKii6Ib6md/iLg3Ejn6mwL683nu4yxDV/F8WxOe+ryYKfLwh4iG6sV0tXhHTaXo/S
X-Received: by 2002:a05:622a:1b8c:b0:467:83f1:71d2 with SMTP id d75a77b69052e-467962487a3mr47143321cf.45.1733992941246;
        Thu, 12 Dec 2024 00:42:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733992941; cv=none;
        d=google.com; s=arc-20240605;
        b=CFJjPvXBi/FQjk/soFC/DQXSrYFEUDFYYRWHCk8OIJibcV3OFxB4ldHRkaeSY7HG+I
         257a5SRysWMfbi3rouj58IIvmp1N0yE0yF7LbLFV2X0Kh+I8QA5Mf/Irgf3KjckPa2Oe
         i1C5iNSTILt59VeQ+8D55cRGYN/drDpkRi6FjshpDMACDNuUgiq0O9X7Vh6FvkuS7KMi
         x1sbcbTeyAQJ5CeZwYk2tirMJFUlWiH2qNX1VzHmHqmz7syr9p0EinYVpzVY3+YoyTFu
         HUolW2e959hQEkF5Nu7pc/+RS3mmUMtPLKSbKu90R+GR39L5NlFUKf6ZTOkErBxyqAuS
         QVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Fq2OXaAqxrnZzKJ4pdDq32glNwmc3P16AJSHGpEXKeI=;
        fh=aYv3BgeNu+eRTNpVmLv7NNe18A24J0OLMNyxn9d9lXE=;
        b=CfvQ38xvaHct0QFz2wjYvPlUibqWO0GqoVnPF/OX7Au5SL0McetbXM54fO8DEidTz8
         krzmh0NF5400ZEu+KziFIs/tguWKgVHSs2A3as+VZDRjW4yqTeGplBrtEC4Lh2cXBnXe
         WCXO1zzuBTYJEncvBM5rf1tsyfAbX9psi1/ZR8Vai5h1PliKz5fO1awAQO+rbOTlVvih
         vet/dfHwf2D0nbmBoUy4e5FJ3XD5c0unatJXCeKtc/ZcgKHnbMlF8osy4Umy3rB9cE3P
         HwkO0roPmpDPeHpSYfLzBiN6Tle7mLQ0WZnlyjbjcWUaKzblqi34IpLctLZ0JA9XOj4v
         ybJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CSRA1+oq;
       spf=pass (google.com: domain of eauger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eauger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eauger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46796183c8esi17488631cf.308.2024.12.12.00.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 00:42:21 -0800 (PST)
Received-SPF: pass (google.com: domain of eauger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CSRA1+oq;
       spf=pass (google.com: domain of eauger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eauger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733992940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fq2OXaAqxrnZzKJ4pdDq32glNwmc3P16AJSHGpEXKeI=;
	b=CSRA1+oq47qWpLnepBYSDHhoD+vGBaE5YEwZw8RSwAsDuSJxyeYXwbINJPBjiBU2zoAhOq
	QxLufw0qiVNnpIRaETs15hHDO8/mAHlSbMA9JifxPB7yV47yWX3A0E6wAgrT7a6WPHWLVq
	B15yNghnRqu5kumfq8ewOc6bdU70Z1A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-_Zw4cIySN1eqMoTNYVp5ig-1; Thu, 12 Dec 2024 03:42:19 -0500
X-MC-Unique: _Zw4cIySN1eqMoTNYVp5ig-1
X-Mimecast-MFC-AGG-ID: _Zw4cIySN1eqMoTNYVp5ig
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d895f91a7dso7272896d6.0
        for <alex.bennee@linaro.org>; Thu, 12 Dec 2024 00:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733992939; x=1734597739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq2OXaAqxrnZzKJ4pdDq32glNwmc3P16AJSHGpEXKeI=;
        b=K9i7n8gw/P5Y5fwp0QvFzXp+E138gFglp6aL4NIR29RJfzUQo1NAKnaHwdWePJyR23
         DYBjanxmpRGPSSgXV7gxicuHiEdPSmLxDmCQiZaVF9epW0TxEAoUhvtlxD6QEi1uSYID
         g4+zn5l6XHXrpveFyP61w9YnLk2OiMPIgThiC6YXFD0gcob91dlh4k9+82bTiY1L/VIC
         UHbzoP2ZIBz8dXLyYwESnWnqPh//LVGqRtdutY/vmw1a2UvCdZYf9k1KheI2NrRDfJw1
         gYsbHTUe6rzD14ydaRnbxnFYrXeobYVP5TdiPSG88SIWai/9JeRJj0LR2pxTiKttL74i
         Vp/g==
X-Forwarded-Encrypted: i=1; AJvYcCUlOolA5cff1+rcs8gzRvdeS37wFGr2vuwwxM3SylUxSzfadUHEkn1YABA0aP4rnOGKeR/S4RJqRUi6Fw==@linaro.org
X-Gm-Message-State: AOJu0YxVKmNYNWpiSbin9rFipROnhIIdkvKPAB3bXk69UlhcjfQvckcT
	9r2nIQvce0CvgE0MLVO4J0qhvEvduxIzysoJB9MXN4y4cjIFGc7KAENk4rKdhPLil/PJWM2cpoY
	0tb+USAdGmPepM2Fj12aDNB2wugricrnn+jsTJdeARbweC7XZ8a0llw==
X-Gm-Gg: ASbGncsCOJc5wGsqtvpo6MTPtVb+GKjeQFWy6IyGZ/VJFhZmaIUk25Px2SIV9Q4NsDM
	7LhtQjEHbY7cyxA99QJ9l2kJSd9lxI0lZzZkh1T0b9EPbqpfzi1fE7v46dyERO3Q8x2fatk9WnI
	BBooSK+ZxlE3JHT4qOF9yvDqCqsfeKCffTCzJ2h7zTsiLyf/Rew3+63ommZeBG88nIKucBBRfPl
	sdQv5+GDpjQqOugK77FSumgnua78kRRZjX/fI7cMa287fbBIARZXMn8YFliblh8TXh97I1Dvquj
	lMaBAOugcwkWsJ+Oeni+1EM=
X-Received: by 2002:a05:622a:306:b0:466:ad0d:f0ca with SMTP id d75a77b69052e-4679624ae7cmr57165611cf.50.1733992938942;
        Thu, 12 Dec 2024 00:42:18 -0800 (PST)
X-Received: by 2002:a05:622a:306:b0:466:ad0d:f0ca with SMTP id d75a77b69052e-4679624ae7cmr57165081cf.50.1733992938421;
        Thu, 12 Dec 2024 00:42:18 -0800 (PST)
Return-Path: <eauger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467562a36a8sm52327331cf.79.2024.12.12.00.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 00:42:17 -0800 (PST)
Message-ID: <38604260-6f92-4f16-9a4d-c310cbc52d77@redhat.com>
Date: Thu, 12 Dec 2024 09:42:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64 KVM
 host model
To: eric.auger@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20241206112213.88394-1-cohuck@redhat.com>
 <edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yEwIenMCgsBaGfY4jcH81gRnS1-lx8vs1S3mWA3bT7M_1733992939
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LnKgYiotvHV9

Shameer,

On 12/12/24 09:12, Eric Auger wrote:
> Connie,
> 
> On 12/6/24 12:21, Cornelia Huck wrote:
>> A respin/update on the aarch64 KVM cpu models. Also available at
>> gitlab.com/cohuck/qemu arm-cpu-model-rfcv2
>>
>> Find Eric's original cover letter below, so that I do not need to
>> repeat myself on the aspects that have not changed since RFCv1 :)
>>
>> Changes from RFCv1:
>>
>> Rebased on more recent QEMU (some adaptions in the register conversions
>> of the first few patches.)
>>
>> Based on feedback, I have removed the "custom" cpu model; instead, I
>> have added the new SYSREG_<REG>_<FIELD> properties to the "host" model.
>> This works well if you want to tweak anything that does not correspond
>> to the existing properties for the host model; however, if you e.g.
>> wanted to tweak sve, you have two ways to do so -- we'd probably either
>> want to check for conflicts, or just declare precedence. The kvm-specific
>> props remain unchanged, as they are orthogonal to this configuration.
>>
>> The cpu model expansion for the "host" model now dumps the new SYSREG_
>> properties in addition to the existing host model properties; this is a
>> bit ugly, but I don't see a good way on how to split this up.
>>
>> Some more adaptions due to the removal of the "custom" model.
>>
>> Things *not* changed from RFCv1:
>>
>> SYSREG_ property naming (can be tweaked easily, once we are clear on what
>> the interface should look like.)
>>
>> Sysreg generation scripts, and the generated files (I have not updated
>> anything there.) I think generating the various definitions makes sense,
>> as long as we double-check the generated files on each update (which would
>> be something to trigger manually anyway.)
>>
>> What I would like us to reach some kind of consensus on:
>>
>> How to continue with the patches moving the ID registers from the isar
>> struct into the idregs array. These are a bit of churn to drag along;
>> if they make sense, maybe they can be picked independently of this series?
>>
>> Whether it make sense to continue with the approach of tweaking values in
>> the ID registers in general. If we want to be able to migrate between cpus
>> that do not differ wildly, we'll encounter differences that cannot be
>> expressed via FEAT_xxx -- e.g. when comparing various AmpereAltra Max systems,
>> they only differ in parts of CTR_EL0 -- which is not a feature register, but
>> a writable register.
> In v1 most of the commenters said they would prefer to see FEAT props
> instead of IDREG field props. I think we shall try to go in this
> direction anyway. As you pointed out there will be some cases where FEAT
> won't be enough (CTR_EL0 is a good example). So I tend to think the end
> solution will be a mix of FEAT and ID reg field props.
> 
> Personally I would smoothly migrate what we can from ID reg field props
> to FEAT props (maybe using prop aliases?), starting from the easiest 1-1
> mappings and then adressing the FEAT that are more complex but are
> explictly needed to enable the use cases we are interested in, at RedHat:
> migration within Ampere AltraMax family, migration within NVidia Grace
> family, migration within AmpereOne family and migration between Graviton3/4.
> 
> We have no info about other's use cases. If some of you want to see some
> other live migration combinations addressed, please raise your voice.
In relation to [1] you seem to be also interested in the migration
between heterogeneous systems with qemu.

Do you think targeting migration within a cpu family is enough for your
use cases. How different are the source and destination host on your
cases. Do you thing feat props are relevant in your case or would you
need lower granularity at idreg field levelto pass the migration?

[1] [PATCH v3 0/3] KVM: arm64: Errata management for VM Live migration
https://lore.kernel.org/all/20241209115311.40496-1-shameerali.kolothum.thodi@huawei.com/

Thank you in advance

Eric
> Some CSPs may have their own LM solution/requirements but they don't use
> qemu. So I think we shall concentrate on those use cases.
> 
> You did the exercise to identify most prevalent patterns for FEAT to
> IDREG fields mappings. I think we should now encode this conversion
> table for those which are needed in above use cases.
> 
> From a named model point of view, since I do not see much traction
> upstream besides Red Hat use cases, targetting ARM spec revision
> baselines may be overkill. Personally I would try to focus on above
> models: AltraMax, AmpereOne, Grace, ... Or maybe the ARM cores they may
> be derived from. According to the discussion we had with Marc in [1] it
> seems it does not make sense to target migration between very
> heterogeneous machines and Dan said we would prefer to avoid adding
> plenty of feat add-ons to a named models. So I would rather be as close
> as possible to a specific family definition.   
> 
> Thanks
> 
> Eric
> 
> [1]
> https://lore.kernel.org/all/c879fda9-db5a-4743-805d-03c0acba8060@redhat.com/#r
> 
>>
>> Please take a look, and looking forward to your feedback :)
>>
>> ***********************************************************************
>>
>> Title: Introduce a customizable aarch64 KVM host model 
>>
>> This RFC series introduces a KVM host "custom" model.
>>
>> Since v6.7 kernel, KVM/arm allows the userspace to overwrite the values
>> of a subset of ID regs. The list of writable fields continues to grow.
>> The feature ID range is defined as the AArch64 System register space
>> with op0==3, op1=={0, 1, 3}, CRn==0, CRm=={0-7}, op2=={0-7}.
>>
>> The custom model uses this capability and allows to tune the host
>> passthrough model by overriding some of the host passthrough ID regs. 
>>
>> The end goal is to get more flexibility when migrating guests
>> between different machines. We would like the upper software layer
>> to be able detect how tunable the vpcu is on both source and destination
>> and accordingly define a customized KVM host model that can fit
>> both ends. With the legacy host passthrough model, this migration
>> use case would fail.
>>
>> QEMU queries the host kernel to get the list of writable ID reg
>> fields and expose all the writable fields as uint64 properties. Those
>> are named "SYSREG_<REG>_<FIELD>". REG and FIELD names are those
>> described in ARM ARM Reference manual and linux arch/arm64/tools/sysreg.
>> Some awk scriptsintroduced in the series help parsing the sysreg file and
>> generate some code. those scripts are used in a similar way as
>> scripts/update-linux-headers.sh.  In case the ABI gets broken, it is
>> still possible to manually edit the generated code. However it is
>> globally expected the REG and FIELD names are stable.
>>
>> The list of SYSREG_ID properties can be retrieved through the qmp
>> monitor using query-cpu-model-expansion [2].
>>
>> The first part of the series mostly consists in migrating id reg
>> storage from named fields in ARMISARegisters to anonymous index
>> ordered storage in an IdRegMap struct array. The goal is to have
>> a generic way to store all id registers, also compatible with the
>> way we retrieve their writable capability at kernel level through
>> the KVM_ARM_GET_REG_WRITABLE_MASKS ioctl. Having named fields
>> prevented us from getting this scalability/genericity. Although the
>> change is invasive  it is quite straightforward and should be easy
>> to be reviewed.
>>
>> Then the bulk of the job is to retrieve the writable ID fields and
>> match them against a "human readable" description of those fields.
>> We use awk scripts, derived from kernel arch/arm64/tools/gen-sysreg.awk
>> (so all the credit to Mark Rutland) that populates a data structure
>> which describes all the ID regs in sysreg and their fields. We match
>> writable ID reg fields with those latter and dynamically create a
>> uint64 property. 
>>
>> Then we need to extend the list of id regs read from the host
>> so that we get a chance to let their value overriden and write them
>> back into KVM .
>>
>> This expectation is that this custom KVM host model can prepare for
>> the advent of named models. Introducing named models with reduced
>> and explicitly defined features is the next step.
>>
>> Obviously this series is not able to cope with non writable ID regs.
>> For instance the problematic of MIDR/REVIDR setting is not handled
>> at the moment.
>>
>>
>> TESTS:
>> - with few IDREG fields that can be easily examined from guest
>>   userspace:
>>   -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0,SYSREG_ID_AA64ISAR1_EL1_DPB=0x0
>> - migration between custom models
>> - TCG A57 non regressions. Light testing for TCG though. Deep
>>   review may detect some mistakes when migrating between named fields
>>   and IDRegMap storage
>> - light testing of introspection. Testing a given writable ID field
>>   value with query-cpu-model-expansion is not supported yet.
>>
>> TODO/QUESTIONS:
>> - Some idreg named fields are not yet migrated to an array storage.
>>   some of them are not in isar struct either. Maybe we could have
>>   handled TCG and KVM separately and it may turn out that this
>>   conversion is unneeded. So as it is quite cumbersome I prefered
>>   to keep it for a later stage.
>> - the custom model does not come with legacy host properties
>>   such as SVE, MTE, expecially those that induce some KVM
>>   settings. This needs to be fixed.
>> - The custom model and its exposed properties depend on the host
>>   capabilities. More and more IDREG become writable meaning that
>>   the custom model gains more properties over the time and it is
>>   host linux dependent. At the moment there is no versioning in
>>   place. By default the custom model is a host passthrough model
>>   (besides the legacy functions). So if the end-user tries to set
>>   a field that is not writable from a kernel pov, it will fail.
>>   Nevertheless a versionned custom model could constrain the props
>>   exposed, independently on the host linux capabilities.
>> - the QEMU layer does not take care of IDREG field value consistency.
>>   The kernel neither. I imagine this could be the role of the upper
>>   layer to implement a vcpu profile that makes sure settings are
>>   consistent. Here we come to "named" models. What should they look
>>   like on ARM?
>> - Implementation details:
>>   -  it seems there are a lot of duplications in
>>   the code. ID regs are described in different manners, with different
>>   data structs, for TCG, now for KVM.
>>   - The IdRegMap->regs is sparsely populated. Maybe a better data
>>   struct could be used, although this is the one chosen for the kernel
>>   uapi.
>>
>> References:
>>
>> [1] [PATCH v12 00/11] Support writable CPU ID registers from userspace
>> https://lore.kernel.org/all/20230609190054.1542113-1-oliver.upton@linux.dev/
>>
>> [2]
>> qemu-system-aarch64 -qmp unix:/home/augere/TEST/QEMU/qmp-sock,server,nowait -M virt --enable-kvm -cpu custom
>> scripts/qmp/qmp-shell /home/augere/TEST/QEMU/qmp-sock
>> Welcome to the QMP low-level shell!
>> Connected to QEMU 9.0.50
>> (QEMU) query-cpu-model-expansion type=full model={"name":"custom"}
>>
>> [3]
>> KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES
>> KVM_ARM_GET_REG_WRITABLE_MASKS
>> Documentation/virt/kvm/api.rst
>>
>> [4] linux "sysreg" file
>> linux/arch/arm64/tools/sysreg and gen-sysreg.awk
>> ./tools/include/generated/asm/sysreg-defs.h
>>
>>
>> Cornelia Huck (3):
>>   kvm: kvm_get_writable_id_regs
>>   arm-qmp-cmds: introspection for ID register props
>>   arm/cpu-features: document ID reg properties
>>
>> Eric Auger (17):
>>   arm/cpu: Add sysreg definitions in cpu-sysregs.h
>>   arm/cpu: Store aa64isar0 into the idregs arrays
>>   arm/cpu: Store aa64isar1/2 into the idregs array
>>   arm/cpu: Store aa64drf0/1 into the idregs array
>>   arm/cpu: Store aa64mmfr0-3 into the idregs array
>>   arm/cpu: Store aa64drf0/1 into the idregs array
>>   arm/cpu: Store aa64smfr0 into the idregs array
>>   arm/cpu: Store id_isar0-7 into the idregs array
>>   arm/cpu: Store id_mfr0/1 into the idregs array
>>   arm/cpu: Store id_dfr0/1 into the idregs array
>>   arm/cpu: Store id_mmfr0-5 into the idregs array
>>   arm/cpu: Add infra to handle generated ID register definitions
>>   arm/cpu: Add sysreg generation scripts
>>   arm/cpu: Add generated files
>>   arm/kvm: Allow reading all the writable ID registers
>>   arm/kvm: write back modified ID regs to KVM
>>   arm/cpu: more customization for the kvm host cpu model
>>
>>  docs/system/arm/cpu-features.rst      |  47 +-
>>  hw/intc/armv7m_nvic.c                 |  27 +-
>>  scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++
>>  scripts/gen-cpu-sysregs-header.awk    |  47 ++
>>  scripts/update-aarch64-sysreg-code.sh |  27 +
>>  target/arm/arm-qmp-cmds.c             |  19 +
>>  target/arm/cpu-custom.h               |  58 +++
>>  target/arm/cpu-features.h             | 311 ++++++------
>>  target/arm/cpu-sysreg-properties.c    | 682 ++++++++++++++++++++++++++
>>  target/arm/cpu-sysregs.h              | 152 ++++++
>>  target/arm/cpu.c                      | 123 ++---
>>  target/arm/cpu.h                      | 120 +++--
>>  target/arm/cpu64.c                    | 260 +++++++---
>>  target/arm/helper.c                   |  68 +--
>>  target/arm/internals.h                |   6 +-
>>  target/arm/kvm.c                      | 253 +++++++---
>>  target/arm/kvm_arm.h                  |  16 +-
>>  target/arm/meson.build                |   1 +
>>  target/arm/ptw.c                      |   6 +-
>>  target/arm/tcg/cpu-v7m.c              | 174 +++----
>>  target/arm/tcg/cpu32.c                | 320 ++++++------
>>  target/arm/tcg/cpu64.c                | 460 ++++++++---------
>>  target/arm/trace-events               |   8 +
>>  23 files changed, 2594 insertions(+), 916 deletions(-)
>>  create mode 100755 scripts/gen-cpu-sysreg-properties.awk
>>  create mode 100755 scripts/gen-cpu-sysregs-header.awk
>>  create mode 100755 scripts/update-aarch64-sysreg-code.sh
>>  create mode 100644 target/arm/cpu-custom.h
>>  create mode 100644 target/arm/cpu-sysreg-properties.c
>>  create mode 100644 target/arm/cpu-sysregs.h
>>
> 
