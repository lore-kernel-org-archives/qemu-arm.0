Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7544385njc;
        Tue, 12 Nov 2024 10:28:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2zGB0qc3FISk1Hi5o/xuB1ZfFTDQk4cp9xPbEBDnV/VDfHoF6nQKPKmYjpk2G4l57EKs3Tx0a8ohlOA==@linaro.org
X-Google-Smtp-Source: AGHT+IGc6VRVDu4EthlELpKORyBPZxaejKbjjv8u9Vt1K9AJa6uXZuIjMO3yz8BIdnJl3dI/d6D9
X-Received: by 2002:a05:620a:4542:b0:7a9:dc30:3d3e with SMTP id af79cd13be357-7b331eaa597mr2167258685a.24.1731436102584;
        Tue, 12 Nov 2024 10:28:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731436102; cv=none;
        d=google.com; s=arc-20240605;
        b=C99lOPpBvIMDevXeNacBwm6Kb/ZgFdMkIdROOtk9LuLRQ9L5oxVWQcj5CpNvbkOeIM
         y7c3XdZaJZTW/HQ1ljHXvtIHv7+NCmfXHHHSHO1uSQZ/WpyInjZJRIUrS9gUhyPQ5anJ
         J+ZooD/i5nEQRaMvsZgw5FxHtXDvfB+bnOi+cpxup3QR2q9hM0pcFrCe9g5ZxBKxoA+c
         aQhlvQewdSfVJOtHczrx/2m/WSsJnudj7crpc2wfNgcee12p1QUKQde5tmx+fwSwl3NW
         X00NRCBA53yCegfkelvFRZX4EexXxOUnfAWNyEqkil8c/yfR16Ws7VSyeBNxl/kvuZU9
         duVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=MbF9/4xJRmxnt6uDCcd4rasfeBCsiUAx4Kw61y++Xj0=;
        fh=P3b4DNDs7eCrL6c2OH8mYDJRjeovGJFanJc46kHWr7k=;
        b=YVrIz9hEshivZU0GwQP5O3H1qwwUHwog4/XEdboB8vCNKSKmQTdGNtxRsK2aIYsf8s
         U3ky5k2i7Ke5adjOZvcnA1igqciazlqdMZIX7ht++3+vgKKi+gt7pyyQNtOltTywFDgt
         3X19vV6drnOR9SuInvCvlfNtOD5i/+TbcsMZFZZTdsGhG6J4JwpNRY5Gs6Pp7sdGiO55
         yIHRoVgEcxZviwBduK1JlPUxpJ8YDQXJsm6ULRD24OhcImeJ+gXZ0bsLQJd6SxTxmA1q
         UUOSYErcpQu56nXyV5odEWfQdqgeCPbxfa78ZKl21zWeVbdwoLpJWzWcLrWTgwv2ru8M
         +WSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ozwoc4sl;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ac58557si1355745885a.199.2024.11.12.10.28.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 10:28:22 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ozwoc4sl;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731436102;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MbF9/4xJRmxnt6uDCcd4rasfeBCsiUAx4Kw61y++Xj0=;
	b=Ozwoc4slexcdCYdwvWQXfsdlI3hNs0fI0SrSdk5kqRNgUmpTztdM1tkdPoo4XrVl7n+rge
	FXCL7Isy0oDPxTR+1tFeJibci1THA1ulTIhHJi4R95+JaWepRb0isgCwJ4+JbXr3OHmeP1
	c2CC7zIZuxE5UgKQ/sXvRPwfWoKUEgA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-qbrBtgJrPpyJ2FTnS7V8Ww-1; Tue, 12 Nov 2024 13:28:20 -0500
X-MC-Unique: qbrBtgJrPpyJ2FTnS7V8Ww-1
X-Mimecast-MFC-AGG-ID: qbrBtgJrPpyJ2FTnS7V8Ww
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d52ca258eso3077388f8f.3
        for <alex.bennee@linaro.org>; Tue, 12 Nov 2024 10:28:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731436100; x=1732040900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbF9/4xJRmxnt6uDCcd4rasfeBCsiUAx4Kw61y++Xj0=;
        b=jnESBMgGQoeFZjuVVFU+sM0SlHjWYZsmKY2/82ZKag4H8td7HtWt0RecPTdLAk9Ey7
         DrRIZWSplE9bmoWk2YoRfB42Q0ZY9sg8JAVpKbSvr6DHq9dlm/VZ0Hd2j2dZOdIFiu/a
         IAwHqvaBIV3UPoy4eHTME+C10YpumVhyEJf6NZ71I7fpJW2+tG+wqXq6AxcDwWljMwq6
         aZ3oQEnB5Dd1JU+6htvhk6yZJz9ErAaAfox/C7Kp91iO8IZu0ggcdwPx4cvrZSQ7p5xR
         0+URxtk/pe7a83ti/UjZ9ZF7EfltwZqk5SLiUyCQlbI4bheL4GduanC+fTYCtbnmZ+xJ
         WKeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDyPHqM+zOqAETz2tNw1FubJ9InN7JWGeyKyalmgaU2/vT+ZJGrqKFUEdlk9lvnneYyMfPftPI3M06Ng==@linaro.org
X-Gm-Message-State: AOJu0Ywr/2ijWADEOwKC9nBGjJoBlEXIKUrXAqmgkvLbrFlpgQK+8iv9
	KT0rSQlTQEpS9lIECLHf9E5H4Of+kmXfGWHHK/CBdH3tqIR4hxeMwReUDAhF8xdhxVmXGrjvgEA
	s1ChkUMJL7ESBK7pyuSBTg+jrHXQqYIL19oSyzMdee6dcQ69ks3mv6A==
X-Received: by 2002:a05:6000:691:b0:37d:36f2:e2cb with SMTP id ffacd0b85a97d-382080817d9mr3173440f8f.0.1731436099652;
        Tue, 12 Nov 2024 10:28:19 -0800 (PST)
X-Received: by 2002:a05:6000:691:b0:37d:36f2:e2cb with SMTP id ffacd0b85a97d-382080817d9mr3173412f8f.0.1731436099134;
        Tue, 12 Nov 2024 10:28:19 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda03e42sm16322294f8f.89.2024.11.12.10.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 10:28:18 -0800 (PST)
Message-ID: <b7f25d3b-6ba7-4924-9383-74c1169dfe86@redhat.com>
Date: Tue, 12 Nov 2024 19:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
To: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com>
 <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com>
 <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
 <Zx-9WxXkmkMuGIlQ@redhat.com>
 <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
 <Zx_EGxj2aqc_2-kY@redhat.com>
 <63c232c2-a325-48d6-8ed4-753a7c6e3b4e@redhat.com> <87ikstn8sc.fsf@redhat.com>
 <87frnwmn2v.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87frnwmn2v.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Trjx2Xe9Mh0ZVh2Z2TP3MSuDAsr2VU4zdCJyVW1w2XE_1731436100
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: I5uPNDR1SnXM

Hi Conny,

On 11/12/24 17:30, Cornelia Huck wrote:
> On Mon, Nov 11 2024, Cornelia Huck <cohuck@redhat.com> wrote:
>
>> On Mon, Nov 04 2024, Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> Hi Daniel,
>>>
>>> On 10/28/24 18:04, Daniel P. Berrangé wrote:
>>>> On Mon, Oct 28, 2024 at 04:48:18PM +0000, Peter Maydell wrote:
>>>>> On Mon, 28 Oct 2024 at 16:35, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>> On Mon, Oct 28, 2024 at 04:16:31PM +0000, Peter Maydell wrote:
>>>>>>> On Fri, 25 Oct 2024 at 14:24, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>>>> On Fri, Oct 25, 2024 at 03:18:25PM +0200, Eric Auger wrote:
>>>>>>>>> On 10/25/24 15:06, Daniel P. Berrangé wrote:
>>>>>>>>>> Also, is this naming convention really the same one that users
>>>>>>>>>> will see when they look at /proc/cpuinfo to view features ? It
>>>>>>>>> No it is not. I do agree that the custom cpu model is very low level. It
>>>>>>>>> is very well suited to test all series turning ID regs as writable but
>>>>>>>>> this would require an extra layer that adapts /proc/cpuinfo feature
>>>>>>>>> level to this regid/field abstraction.
>>>>>>>>>
>>>>>>>>> In /cpu/proc you will see somethink like:
>>>>>>>>>  Features    : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp
>>>>>>>>> asimdhp cpuid asimdrdm lrcpc dcpop asimddp
>>>>>>>> Right, IMHO, this is the terminology that QEMU must use in user
>>>>>>>> facing APIs.
>>>>>>> /proc/cpuinfo's naming is rather weird for historical
>>>>>>> reasons (for instance there is only one FEAT_FP16 feature
>>>>>>> but cpuinfo lists "fphp" and "asimdhp" separately).
>>>>>> There's plenty of wierd history in x86 too. In this
>>>>>> case I might suggest just picking one of the two
>>>>>> common names, and ignoring the other.
>>>>>>
>>>>>> If we really wanted to, we could alias the 2nd name
>>>>>> to the first, but its likely not worth the bother.
>>>>> Or we could use the standard set of architectural
>>>>> feature names, and not have the problem at all, and not
>>>>> have to document what we mean by our nonstandard names.
>>>>> (cpuinfo names do actually mostly line up with the
>>>>> standard names, just not 100%. Similarly gcc/clang command
>>>>> line options are mostly the architectural feature name.)
>>>> Ah, right, yes. Sorry I mis-understood you originally to be suggesting
>>>> the same low level names as this patch.
>>> If my understanding is correct, Peter suggested to rely on the
>>> terminology used in
>>>
>>> https://developer.arm.com/documentation/109697/2024_09
>>>
>>> the doc pointed to by Oliver.
>>>
>>> So I think the next step is to understand how those "high level" features do map onto low level ID register field values. I think a high level feature can map onto separate fields in separate ID regs. This may not be the most common case though. 
>> I went through all the FEAT_xxx features defined so far and tried to
>> categorize them (probably with some errors here and there, but the
>> general trend should be correct.)
>>
>> There's 335 features defined at the moment.
>>
>> Of these, the majority (295 by my count) map to one or more values in
>> one or more id registers. These are what I'd consider the "easy" ones
>> (added complexity if we deal with serveral values, but in general, it is
>> clear how to handle them, and most of them actually map to a single
>> value.) Of course, dependencies may be on top of that.
>>
>> Then, we have some features (~25 or so) that are actually defined by
>> dependencies (i.e. FEAT_FOO and FEAT_BAR mean that we have FEAT_BAZ,
>> sometimes with an architecture extension dependency thrown in as well.)
>> These features are not really relevant when we compare two cpus since
>> they do not map to registers directly, but they are relevant if we allow
>> them to be specified (and use them as a kind of shorthand.) IOW, we'd
>> need to think about how we'd handle them for comparisons and baselining.
>>
>> Next, let's talk about architecture extensions. All features have a
>> level where they have been introduced as optional, some have an upper
>> limit (e.g. FEAT_AA32EL1 is not allowed from v9.0 onwards), and quite a
>> number of them (~65 or so) become mandatory with a certain architecture
>> extension. Sometimes, FEAT_FOO + arch ext also implies FEAT_BAR. If we
>> introduce Armvx.y named models, we'd need to enforce that some features
>> are (not) set for a certain model. Complex, but not a showstopper. (We'd
>> also need to deal with that if we worked on the register level.)
>>
>> We also have some registers like MIDR/REVIDR that do not correlate with
>> any FEAT_xxx, but that we still need to handle; I would suggest to deal
>> with them via separate cpu properties (e.g. specify a list of possible
>> MIDR/REVIDR pairs.) I hope that there are not too many of them, although
>> we do have some impdef registers.
>>
>> That leaves some headscratchers (at least for me.) E.g. FEAT_UINJ, which
>> is optional from v9.5, and mandatory from v9.6, but where I'm unsure how
>> we'd discover it, especially as we do not have a way to discover the
>> architecture extensions. Maybe this will work for named actual cpus
>> only? I'm also not sure if I understand FEAT_CHK, which is listed as
>> optional from v8.0 and mandatory from v9.4, but every aarch64 cpu is
>> supposed to be compliant, because CHKFEAT might be a NOP (and this is
>> only supposed to check for FEAT_GCS? Yes, I'm confused.)
>>
>> So tl;dr, we cover a lot of the ID register space via FEAT_xxx (with
>> varying complexity), but we already know about some exceptions. For some
>> FEAT_xxx, I'm not sure if we want to handle them at all.
>>
>> (I also seem to remember that there some things like perf counters that
>> don't map to any on/off features, but no idea about the details here.)
> Following up on this, some ideas/questions on how a command line could
> look like and behave.
>
> Let's say we introduce Armv80, Armv81, ... models for the architecture
> extensions and optionally named models for individual cpus we care about
> (e.g. My85BasedCpu which would be Armv85 + some stuff on top). The
> Armv<xy> models would come with all mandatory features turned on and
> would allow all optional features to be set or unset, with
> (accelerator-specific) verification on top.
>
> Let's assume that we have
>
> -cpu Armv80,FEAT_AdvSIMD=on,FEAT_FP=on
>
> Since the two features provide each other, I'd assume
>
> -cpu Armv80,FEAT_AdvSIMD=on
>
> or
>
> -cpu Armv80,FEAT_FP=on
>
> to be equivalent, and
>
> -cpu Armv80,FEAT_AdvSIMD=on,FEAT_FP=off
>
> to generate an error. Question: at which level? s390x does dependency
> validation in QEMU, we could do it as well, but I think we have way more
> dependencies on Arm.
>
> Also, let's take FEAT_BTI, which is optional for 8.4 and mandatory from
> 8.5 onwards. I'd expect
>
> -cpu Armv84,FEAT_BTI=on   <-- ok
> -cpu Armv84  same as -cpu Armv84,FEAT_BTI=off
> -cpu Armv85 same as -cpu Arm84,FEAT_BTI=on
except we may have plenty of other 8.5 mandatory features I guess
> -cpu Armv85,FEAT_BTI=off  <-- Error!
>
> When doing baselining while looking at id registers, we'd get
>
> ID_AA64PFR1_EL1.BT == 1 -> must use Armv84 or later
> ID_AA64PFR1_EL1.BT == 0 -> must use Armv84 or earlier
>
> (unfortunately, some other features are more complex...)
>
> Would
>
> -cpu Armv84,<all 8.5 mandatory bits>
>
> generate the same cpu as
>
> -cpu Armv85
>
> (and therefore, the two be migratable between each other?)
I don't think we want this capability. I guess we would support
migration between exact same cpu <type>,<feat list>
>
> If we create named cpu models for individual cpus, e.g.
>
> -cpu My85BasedCpu
>
> as equivalent to
>
> -cpu Armv85,FEAT_FOO=on,FEAT_BAR=on
>
> Should we allow
>
> -cpu My85BasedCpu,FEAT_BAR=off
> or would the command line need to be
>
> -cpu Armv85,FEAT_FOO=on
I am scared about the overall implementation/test matrix. Can we afford
supporting that many setups, revision based models, named models with
all kinds of features optim-in/opt-out. We should also keep in mind what
is our current goal, ie. supporting migration between different machines
but still with sufficient commonalities.

Shouldn't we try to collect community needs in that regard. I don't know
if people will/can tell us what they want to migrate from/to. At least
do the machines comply with the same spec rev or how large is the gap.
How many ID regs/features do mismatch in general. Are those ID regs
currently writable? What would be the best grouping model for them?

Also many ID regs are not writable, because we have not turned them yet
as writable or because they are not that much a problem at the moment.
Maybe some features are not fully turned as writable. I mean some ID
regs they depend on are but not all of them.

So maybe we should reduce the complexity by reducing the scope to the 16
writable regs we have atm (~ 126 writable ID reg fields).
>
> (e.g. to deal with not all id regs being writable?)
>
> Regardless of what we end up doing for features and cpu models, we'll
> need to be able to specify registers that do not correlate to any
> features; especially for things like MIDR/REVIDR, where we'll want to
> provide a list of possible target values as pairs;
>
> -cpu Armv85,midr_revidr=(<value>,<value>)
>
> is ugly, and figuring the actual values is not user friendly at all, I
> fear :(
>
> And now, at the end of this long email, the most important questions:
> What colour should the features have?
>
> Matching the architecture: FEAT_AdvSIMD, FEAT_FP, FEAT_BTI
>
> Dropping "FEAT_": AdvSIMD, FP, BTI
>
> Less shouty: feat_advsimd, feat_fp, feat_bti
>
> Less shouty and shorter: advsimd, fp, bti  -- in this case we'd need to
> be careful because we already have sve/sme props, and I'm not sure if we
> could do some sugaring without conflicts.

Another big question I think is how the upper layer will detect the
relevance of a named model and associated feature. We saw that

/proc/cpuinfo was not that much consistent with FEAT_xxx terminology. Many other features can't be queried I guess. I think it is also part of the problematic. Is it worth exposing stuff that cannot be simply introspected?

Thanks

Eric

>
> Thoughts?
>
