Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp805054njc;
        Fri, 9 Aug 2024 02:30:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWr3GpN+O25TKB+UdsmbKt8E4PQ1XbcP3ei0X6tGOHio1PU27n3micjTG/N2OyUeifOy9m0Ce0f66luLOX00dW2ErI8OmX0
X-Received: by 2002:adf:a31d:0:b0:367:938f:550 with SMTP id ffacd0b85a97d-36d281e5965mr3571304f8f.25.1723195831102;
        Fri, 09 Aug 2024 02:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723195831; cv=none;
        d=google.com; s=arc-20160816;
        b=sLl+AJYrmHG36Q3ORbyT6HdvUagjAGDknkIxOji92hjC/HcY3LDzB9La5Bp+GwtSec
         Hq+5UbNPToISmCUqGp73p1/VFuEDMT6HJg69hoYtAAQidwivx+CAJGF2Zm3vNySQD/om
         q7PngLUzPaIoqrR2yJkrR5MekKcOIRIsyxmrpvTlHYD0YZf551nxU92ZU9OWARebJfvZ
         7ohos9DrALIMFGj50DUu6p0/Tw5QsllwX6/BTv6vRaIyVIFiceZCdUN3m34/5jC00Ba8
         UtBDvqsP6QJNJcUhVS+cSw/RAtlHiZSzy1GNV6pMTGipDTdqbHVvg3Fn6LGyA3KgVdrX
         Jxmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WTXFjiUw5Bp4dZ4P9iTQAoR26OCDVV5O5ZIqNR6ttXo=;
        fh=x1jNA+AuG+5Oz39Pitjgdaa/Z2apQYczLgiH0LfEFPw=;
        b=MCisCh39lIp2IVQ4YhJ/lwd20ZB5FazyFlYsiU1HD8W9qiznFC8lw+dnKCPoKQF/z+
         Z7XeTGatW1pXXzVYTqHjZ6jXd7uz+br3Hu+8Er8U9aW4+NCM7+ijleUipZMEpMW8yrG4
         TvCj6EjNyzvqhgh/ti5r7JtzIYOG0bM3SLsUWRetw4J+zcd7/mx7RTZmJza6eE12gMYp
         uIuv9smd5he4wnCpgtv7f5OPBFKELReq0MV9hS5IS27iqb9asmT6kh75ZSPHlzUNvAqd
         KGVOBDchwUoQP59jZNt0bheCECyCQH0AH5NrxyK3rMbLjLC7PcNozjGm1xJvcnGUPE34
         FsBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hzB57RVI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36d27678fd9sor933382f8f.5.2024.08.09.02.30.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Aug 2024 02:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hzB57RVI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723195830; x=1723800630; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WTXFjiUw5Bp4dZ4P9iTQAoR26OCDVV5O5ZIqNR6ttXo=;
        b=hzB57RVII+h3xbgJLtnroSYflmdqy/scFb7e15/3IGZxgUQJtc9QtFSTkQEB8F6KlS
         MI6hVh+nGSRoMyfBU7spxTQo7rRdWbx7gOPng9AqKMBhgvjDLESt4BFcNizdpG7oU2hx
         lFpt1MRsyljbWKnybn+BaDyduDRmr1IvAFJZWW4N/G7uwLl5XVZHbI3vSZ655GM6Lb/O
         g9PHGDV64Cc166Zr/Ahake1KKTbOWlQPbMqaAvWGI5LF4XuPdkRFzWh95SVzUjvGhlYr
         tUESNCK4MPWmednfibSjGTUo5ObXjHCSGwMW831MHERAb87M0sBbgSRh6Tfgdp5hJa/B
         ytwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723195830; x=1723800630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WTXFjiUw5Bp4dZ4P9iTQAoR26OCDVV5O5ZIqNR6ttXo=;
        b=cwxVniEr7m2H93J1sRhbIarnfMPqYjSyGXFX/pO3W5lLMSU93fk2eUyYZJIXFmpbUq
         4KYP1EtUCnWb8XIXKkfbOo8IL7jHC77px+I7DLaMwbLOCdnl4edY1SopibcKywxB3hJj
         uYNvY2tOjdGs+F5MlQXjAu5jXfrnkCxDHTOURH/QVBfqZKUy4dhk68iVaRCAVxZNYhux
         6cFYmGi8o0ZIrCx2UhJ+rRGo2hE+plm8o0zEL6yiduTdG6op2ZN26uPTimG0oYFbfq+W
         R3F1gb+RVBfW63MJf9/+VcCjenfepWh2vjLrHIUfVOhx63X46rBSm6mmKuvKBfAdOgJK
         osqw==
X-Forwarded-Encrypted: i=1; AJvYcCWjgZO+ITK5FDUvm6QaC5QnKpShAaamWuBY2mo9sntfuxJF35/jRHRlS+GUxYM8nS0V+x9OVQWdU0ncwT46Ybr/hN2mx8gE
X-Gm-Message-State: AOJu0YyexUStSKP6QHLocio5nZMWHKmNKVs48Lda8BfO5vkG3PVPm1Yb
	dHy+FCtQln2uScuS2QkW9w+q5cMR9c0pj+nNizd1/fo4h/VnHemdVMXGiCVrr5/3Wg==
X-Google-Smtp-Source: AGHT+IE2kOvm5jYMZiltc3fT9+yWha2f7l9SEStT1cOlFQ7BoScLKVHUtFWIY6lmySr2vwOgFlSQxw==
X-Received: by 2002:a5d:6691:0:b0:368:6bb:f79e with SMTP id ffacd0b85a97d-36d6829eadbmr913471f8f.4.1723195830340;
        Fri, 09 Aug 2024 02:30:30 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.178.175] (41.red-95-127-42.staticip.rima-tde.net. [95.127.42.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d271576c1sm4682692f8f.21.2024.08.09.02.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 02:30:29 -0700 (PDT)
Message-ID: <9080f7e5-a40d-4cbd-a734-74578dd27894@linaro.org>
Date: Fri, 9 Aug 2024 11:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/23] scripts: add script to generate C header files
 from SVD XML files
To: Octavian Purdila <tavip@google.com>, John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com,
 pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com,
 peter.maydell@linaro.org, marcandre.lureau@redhat.com,
 alistair@alistair23.me, berrange@redhat.com, crosa@redhat.com,
 bleal@redhat.com
References: <20240805201719.2345596-1-tavip@google.com>
 <20240805201719.2345596-4-tavip@google.com>
 <CAFn=p-abeXP+dUtp_gwH3dcD5DT-sTAFg=udVugrzcU1r8fXpA@mail.gmail.com>
 <CAGWr4cQL_LMWmEUdoPprRSp2k=CkQ0UJp5Q45qbAtUvvE6fDHg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAGWr4cQL_LMWmEUdoPprRSp2k=CkQ0UJp5Q45qbAtUvvE6fDHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Oym8R1FG8hUO

On 9/8/24 00:30, Octavian Purdila wrote:
> On Thu, Aug 8, 2024 at 2:56 PM John Snow <jsnow@redhat.com> wrote:


>>> diff --git a/configure b/configure
>>> index 5ad1674ca5..811bfa5d54 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -956,7 +956,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
>>>   # Finish preparing the virtual environment using vendored .whl files
>>>
>>>   $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
>>> -     ${source_path}/pythondeps.toml meson || exit 1
>>> +     ${source_path}/pythondeps.toml meson svd-gen-header || exit 1
>>
> 
> Hi John,
> 
> Thanks for reviewing!
> 
>>
>> I haven't read the rest of this series; I'm chiming in solely from the build/python maintainer angle. Do we *always* need pysvd, no matter how QEMU was configured? Adding it to the meson line here is a very big hammer.
>>
> 
> I think the minimum we can do is to install it only if CONFIG_ARM is
> enabled. That might change in the future if the models we create with
> pysvd are enabled for other architectures.

Similarly on how we manage libfdt, you can have meson defines
SVDGEN as:

   config_host_data.set('CONFIG_SVDGEN', svd_gen_header.found())

Then declare SVDGEN in Kconfig.host, and finally use in the Kconfigs:

   config FLEXCOMM_UART
       bool
       depends on SVDGEN

   config RT500
       bool
       depends on ARM
       select FLEXCOMM_UART

See for FDT examples:

$ git grep 'depends on.*FDT'
hw/core/Kconfig:10:    depends on FDT
hw/i386/Kconfig:118:    depends on I386 && FDT
hw/loongarch/Kconfig:4:    depends on LOONGARCH64 && FDT
hw/mips/Kconfig:84:    depends on MIPS64 && !TARGET_BIG_ENDIAN && FDT
hw/ppc/Kconfig:4:    depends on PPC64 && FDT
hw/ppc/Kconfig:29:    depends on PPC64 && FDT
hw/ppc/Kconfig:58:    depends on PPC && FDT
hw/ppc/Kconfig:77:    depends on PPC && FDT
hw/ppc/Kconfig:174:    depends on PPC && FDT
hw/ppc/Kconfig:180:    depends on PPC && FDT
hw/ppc/Kconfig:186:    depends on PPC && FDT
hw/rx/Kconfig:11:    depends on RX && FDT
hw/xtensa/Kconfig:17:    depends on XTENSA && FDT

>> If not, consider looking at how sphinx (the "docs" group) is only conditionally installed into the configure venv and mimic that using the appropriate configure flags that necessitate the availability of pyvsd for the QEMU build.
> 
> Thanks for the pointer, I'll take a look.
> 
>>
>> We also need to provide a way for pysvd to be available offline; some packages are available via distro libs and if this package is available for every distro we officially support, that's sufficient (but requires updates to our various docker and VM test configuration files to add the new dependency). Otherwise, like we do for meson, we need to vendor the wheel in the tree so offline tarball builds will continue to work.
>>
>> It looks like pysvd is a pure python package with no dependencies, so it should be OK to vendor it in qemu.git/python/wheels/ - look at qemu.git/python/scripts/vendor.py and consider updating and running this script.
> 
> Thanks, I'll look at it and add it in v2.
> 
>>
>> (The real blocker here is that RPM builds are performed offline and dependencies that cannot be satisfied via rpm can't be added through pip. We need any one of these to be true: (A) pyvsd is available (of a sufficient version) in all distro repositories we target; (B) This build feature is conditional and nobody minds if it never gets enabled for RPM builds; (C) The package can be vendored.)
>>
>> ~~js
>>
>> That said, you might be the first person I've seen outside of Paolo and I to brave mucking around with the python build venv. You deserve a bravery sticker :)
>>
>>>
>>>   # At this point, we expect Meson to be installed and available.
>>>   # We expect mkvenv or pip to have created pyvenv/bin/meson for us.
>>> diff --git a/meson.build b/meson.build
>>> index ec59effca2..dee587483b 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -3235,6 +3235,10 @@ tracetool_depends = files(
>>>     'scripts/tracetool/vcpu.py'
>>>   )
>>>
>>> +svd_gen_header = [
>>> +  python, files('scripts/svd-gen-header.py')
>>> +]
>>> +
>>>   qemu_version_cmd = [find_program('scripts/qemu-version.sh'),
>>>                       meson.current_source_dir(),
>>>                       get_option('pkgversion'), meson.project_version()]
>>> diff --git a/python/setup.cfg b/python/setup.cfg
>>> index 48668609d3..bc830c541a 100644
>>> --- a/python/setup.cfg
>>> +++ b/python/setup.cfg
>>> @@ -45,6 +45,7 @@ devel =
>>>       urwid >= 2.1.2
>>>       urwid-readline >= 0.13
>>>       Pygments >= 2.9.0
>>> +    pysvd >= 0.2.3
>>>
