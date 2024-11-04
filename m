Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2198203njc;
        Mon, 4 Nov 2024 07:34:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+XiP0Ek1dLW8MT6AKtXWBGLCf6tiPFCLm6BiRcS5PL6AC3aGVz5wVpsN/cm9ydJ4ekNTP07QxKIXtWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGvBjG0CgYI52RQO1SLdw+P3t0QKkwxikieVqfKC4cmo28FSeM7WEdRcf7whmnKZVa9y/T1
X-Received: by 2002:a05:620a:2444:b0:7ae:3fae:a260 with SMTP id af79cd13be357-7b2fb9cf6dfmr1383691385a.66.1730734482414;
        Mon, 04 Nov 2024 07:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730734482; cv=none;
        d=google.com; s=arc-20240605;
        b=WFo9kSRplH5RINq/RdP+YD0DeisnztsInWojNAYtadlKNZBVDuOfVahTfRtCYglr5T
         t1n1L5aJOwbbhVvPRvftNR2PI8n8i4irpYYVjKbDNdGhT9MvESZHnZmNYoEtUMynd7WM
         ea+Pkt5KxYrP/YtmQej+EqtxsiPjAKeMeKQA4Phi114nzPs/FzW67iKWXWJVj5xtEWEX
         1Bl/PCZtmKcnETsKTZc47AVJXOjD9Nc2GB33otppqUOz45N0d4s86QNGNPeSh+yMCF0v
         aznIbWBjE+Vgo96N1A0ZxgKIk4RbVQ2g1xD14sYrX7q8RdQjOVl4rmf+mb9T8F9/JdV+
         tOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=nSzC8fuhrTYfNX2e1clLraq8/0hvYKlTSC3OeLDtmLQ=;
        fh=ku1kPFtVNxk177pdtJzy0pOxWEJ6iCCn+D755Ur4U7U=;
        b=H8IasqvHwfFOm8AOeKiihiS4QrOqBqyZnyYtwcI3p2xPjR9NSZ8qOg4FgDoF2fKJ+w
         lxXRyAXBhmmo+44gDAp09hpq/1LEZMMydAtrvsbhoBNowOsoz90PcT/jWV4VLNx4AOGn
         VddeT+UKqCtHvdBtvlXv1R2mzIpKBtYnejJ/6rlg0zwFozGnSson9OnHwG/bi0+QtKyW
         INMLWtccsaGi6JT5nuwZZeBurvloulTGQoR9MXSXYx804ll0W5kGqXpvOGSCAOgyz/5E
         ebhwJpzHPFfo5j7j6pVFnEHUtNsuYTCv17wiiRvN2SsoXsPzKQVtdnPooRz5OgkdDPcw
         0xLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gFd7/iE5";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3accc62si1132702485a.675.2024.11.04.07.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:34:42 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gFd7/iE5";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730734482;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nSzC8fuhrTYfNX2e1clLraq8/0hvYKlTSC3OeLDtmLQ=;
	b=gFd7/iE5En7tpIUQqUMgn7pVTQiXb4goFYw9bgipygNQJwvpDIXsXh4T7EDwnakQkzMdGT
	lSEFCWY+YhdPQD3KTBmv4YJ7KjTplLW8qkCgKbC44kBBreQdrN5azfdFam7+ZYHH36asgt
	UjOLa/rGZ+0A6kL16Y0/jNI3Wm26xyM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-O5xyqc4EO6ykS99Qe1ntGg-1; Mon, 04 Nov 2024 10:34:38 -0500
X-MC-Unique: O5xyqc4EO6ykS99Qe1ntGg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d47127e69so1842860f8f.1
        for <alex.bennee@linaro.org>; Mon, 04 Nov 2024 07:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730734477; x=1731339277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSzC8fuhrTYfNX2e1clLraq8/0hvYKlTSC3OeLDtmLQ=;
        b=cqP0J1Cfjm0WLvMoYtloqPICz5DyzCb/YMswZOoo3I82c9wjZ6ZIVSu0daK/tAS1Kn
         Ugg1PVxNMBOc4T23Rt9Fjo8BiYXHqV0GGXI2bDOW+YhBJmJlA2sTkJrAvNURWUMLNloH
         IAwAEzVuF7/ZvY+4bfwc9SfqTnB0/qdwMUOof4PZ6OEwvLJHGniPLh5MIm/0TVa06sJN
         tgoPaJwEf8H7ZE59EtmU2kINRrLVm3moAx+wvBdNS6ik9RPSqKnWWkl2GTwTMJtelChn
         LR19V1R1H+ig7W3Yqc4IKEZ5UHg5Xyls7S3408TJC9aZAi8IKp+IvmZhRvBas9zlOeaJ
         LZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNz2FRPjxEX7otSphHklYfMVFQfR811qGtwt6ZiYEDRL++Do7Dtf4IdpJqMZ0gXnbpF7Dv/y/rtX+1mg==@linaro.org
X-Gm-Message-State: AOJu0YyjugZWW7wvp1eJxxNoQeYMAwJ2quIVNYJ2M3qyKm6JQTbu+uBc
	DHzoSZMTiJ1GE44WXyzgTcu40gHMJpwVJ9ht6dz97rE9U781kogXivbOnmNWkWRBhqO+HAvCvnc
	/LLEJEw5Cvu5Xhy8Lp2SWQ5PmsEhaj0YlHHrZ40odjjG/I/3pfh26Rw==
X-Received: by 2002:adf:ebd2:0:b0:37d:3f42:9b59 with SMTP id ffacd0b85a97d-380610f7ea7mr22023348f8f.11.1730734476719;
        Mon, 04 Nov 2024 07:34:36 -0800 (PST)
X-Received: by 2002:adf:ebd2:0:b0:37d:3f42:9b59 with SMTP id ffacd0b85a97d-380610f7ea7mr22023318f8f.11.1730734476312;
        Mon, 04 Nov 2024 07:34:36 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7b32sm13547570f8f.18.2024.11.04.07.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 07:34:35 -0800 (PST)
Message-ID: <52690aae-55b6-47d5-a308-dd75475f8377@redhat.com>
Date: Mon, 4 Nov 2024 16:34:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com> <Zx__Zi3Zpg1AspnE@pinwheel>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Zx__Zi3Zpg1AspnE@pinwheel>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: icTQJqfLJ/sB

Hi Kashyap,

On 10/28/24 22:17, Kashyap Chamarthy wrote:
> On Fri, Oct 25, 2024 at 12:17:40PM +0200, Eric Auger wrote:
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> Add some documentation for the custom model.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  docs/system/arm/cpu-features.rst | 55 +++++++++++++++++++++++++++-----
>>  1 file changed, 47 insertions(+), 8 deletions(-)
>>
>> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
>> index a5fb929243..962a2c6c26 100644
>> --- a/docs/system/arm/cpu-features.rst
>> +++ b/docs/system/arm/cpu-features.rst
>> @@ -2,7 +2,10 @@ Arm CPU Features
> [...]
>
>> +Using the ``host`` type means the guest is provided all the same CPU
>> +features as the host CPU type has.  And, for this reason, the ``host``
>> +CPU type should enable all CPU features that the host has by default.
>> +
>> +In case some features need to be hidden to the guest, ``custom`` model
>> +shall be used instead. This is especially useful for migration purpose.
>> +
>> +The ``custom`` CPU model generally is the better choice if you want more
>> +flexibility or stability across different machines or with different kernel
>> +versions. 
> Does "more flexibility or stability across different machines" also
> imply "live migration compatiblity across host CPUs"?
yes that's the goal
>
>> However, even the ``custom`` CPU model will not allow configuring
>> +an arbitrary set of features; the ID registers must describe a subset of the
>> +host's features, and all differences to the host's configuration must actually
>> +be supported by the kernel to be deconfigured.
> [...]
>
>> +The ``custom`` CPU model needs to be configured via individual ID register
>> +field properties, for example::
>> +
>> +  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
> If possible, it would be really helpful (and user-friendly) to be able
> to specify the CPU feature names as you see under /proc/cpuinfo, and be
> able to turn the flags on or off:
>     
>         -M virt -cpu franken,rndr=on,ts=on,fhm=off
>
> (... instead of specifying long system register IDs that groups together
> a bunch of CPU features.  If I understand it correctly, the register
> "ID_AA64ISAR0_EL1" maps to a set of visible features listed here:
> https://docs.kernel.org/arch/arm64/cpu-feature-registers.html)
Not all the writable ID regs are visible through the above technique.
But indeed I think we converged on the idea to use higher level feature
names than ID reg field values.
However we need to study the feasibility and mappings between those high
level features and ID reg field values.
The cons is that we need to describe this mapping manually. Besides
being cumbersome this is also error prone.
>
>
> Next, I prefix the below by noting that I wrote it before seeing
> Cornelia's reply that the name "custom" is not set in stone:
> https://lists.nongnu.org/archive/html/qemu-arm/2024-10/msg00987.html.
>
> I wonder if the word "custom" is starting to get overloaded; on x86:
>
>   - Libvirt itself uses the term "custom" this way, to quote its
>     documentation[1] for the 'custom' XML attribute:
>
>       custom
>     
>       In this mode, the 'cpu' element describes the CPU that should be
>       presented to the guest. This is the default when no 'mode'
>       attribute is specified. This mode makes it so that a persistent
>       guest will see the same hardware no matter what host the guest is
>       booted on.
>
>   - Some management tools also follow libvirt and use the term "custom"
>     to refer to one of two things, (a) a specific named CPU model that
>     libvirt and QEMU recognize, e.g. "Cascadelake-Server"; or (b) a
>     named CPU model + extra CPU flags, e.g. this is how OpenStack
>     uses[2] "custom" to configure CPU models, and flags that can be
>     enabled or disabled via "+" or "-":
>
>       [libvirt]
>       cpu_mode = custom
>       cpu_model = IvyBridge-IBRS
>       cpu_model_extra_flags="ss,+vmx,-pcid [...]"
>
>     (Note the "cpu_mode" there: it is referring to the three possible
>     modes that libvirt and QEMU support today: 'host-passthrough',
>     'host-model', and named CPU models via "custom".)
>
>     The above config translates to this QEMU command-line:
>
>         -cpu IvyBridge-IBRS,ss=on,vmx=on,pcid=off [...]
>
> Now if QEMU introduces "custom", it is likely to create some confusion.
> But luckily, as referenced above, it is open to change. :)
Agreed! Thank you for the references!

Eric
>
>     * * *
>
> FWIW, I agree with Dan here[3] that it would cause less future pain if
> Arm's named CPU models also decides on a "baseline that matches some
> corresponding real world silicon".  I've experienced plenty of such
> debugging pain in x86-land from years of troubleshooting live migration
> bugs involving CPU model (in)compatibility.  (Often, with help from
> DanPB and Jiri Denemark).
>
> [1] https://docs.openstack.org/nova/latest/admin/cpu-models.html#cpu-modes
> [2] https://libvirt.org/formatdomain.html#cpu-model-and-topology
> [3] https://lists.nongnu.org/archive/html/qemu-arm/2024-10/msg00888.html
>     — [RFC 21/21] arm/cpu-features: Document custom vcpu model
>
> [...]
>
