Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1289036eji;
        Tue, 2 Jan 2024 04:28:52 -0800 (PST)
X-Received: by 2002:a5d:4851:0:b0:336:77aa:7b2e with SMTP id n17-20020a5d4851000000b0033677aa7b2emr7376147wrs.11.1704198532250;
        Tue, 02 Jan 2024 04:28:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704198532; cv=none;
        d=google.com; s=arc-20160816;
        b=qzw7+/6fbyVEjrdyVylEOtsjYdM4VPGZqksi+XXa5GH97Y16N3pt8keMsUyn1P3B2n
         PLnXb3xggf9pQD/x/IcNwiYweFtg6SK1xMomXAna6FXr2kHGP31v/Ledk8xoP7f7I4RL
         o5NCclNcwbcTfXgFe9xLxCnotsbG54BFJ3JOgLDxmhVL3FV+u0V/h7n15inJMJD72zt/
         TPhxlm/Y1SgSwzzuSkgkL+3Hu6dkwtl1qZb8Xoo61AjrGjycIA1uO0Vfdw1nSEUhTkCT
         RzqaKQgGJfQd8GmIp/+qRvfz1Qev9hYQIOJgmd4+KjWgPh4NX6nqtuAOQ98FXwME0LaT
         b3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EGWivcS99+wHRa2vbtr7B5dRD4LP8waN05N4XbedEWs=;
        fh=Ysji0tydBxZiNEzfwUMaMh6Hs5kQzZg0Gh+RsIMqUtY=;
        b=yIyYE+CWfPvut6HT2kq/N/onByJHQtaPVw040DeatMUlM7wxHpTznQaVfnOfgtaRa+
         P/NMjo5McSeCE1IAK2VjRWdly0/2CrV/EXSiPenVbw8tcPmchtA5tD4JfUxg1i1pgKBz
         NRAV44gtcYKcefVuGDvPiyHqS5wG90K3+AYWVKWMbneZIhjwb86tJlV54N0N6WMNTLSL
         OqDQ53Ci58XlHYDt1uQ6fqUyC8PtTGDbagvO0dPuvWHXH0QAhOlyO2t299IPtYMIONaE
         P0dMPZDOnfOEtAjg8//yB9Omob7sPe8BVEFtgVMNgSQpHAHPuFA+CqzCdg6KjpLq5+AN
         N5eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mfDWEYi/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o8-20020a5d47c8000000b00336d8edac61sor1496955wrc.5.2024.01.02.04.28.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jan 2024 04:28:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mfDWEYi/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704198532; x=1704803332; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EGWivcS99+wHRa2vbtr7B5dRD4LP8waN05N4XbedEWs=;
        b=mfDWEYi/1RyiML21hHViGv8MiybWnUQhmbTU1BLRjjn8cqUEOqxPeGipPfWXIXsFGr
         T8wAe+Ddt/etKNOTYgQMEkg5wnoHgNgHLGLruke7Zq0ezVdz7IDLcatWYnri/MLHGCb9
         yTlgjNZwkPlsgC+LyLQdQt+0dC+8ANqWJu6E7KvNM+lsSm5BiI9ffUCD36amPHYMJo7L
         DEPexv6PsyGdxeUTzwAVz/FDqDfPPlG848aSrjS/RmsFyeco+3lL8nPEdHCwWETSTB1+
         1TFBkKW4DqlmhGBeJ9yptq5SknLQL3MFuFLRgisKCGdxINVD6oJPVLnttYF56N55M3tG
         rEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704198532; x=1704803332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGWivcS99+wHRa2vbtr7B5dRD4LP8waN05N4XbedEWs=;
        b=uQFAvud64uJiLt5xqNimMoP4jAal1gpNBs0YfogjOx8Ov4RhY8hUt4fTHTnQHpLCDW
         E+KIhS8kHDuU+HxCrS9EhnxYEjYB9h/XAMJAj0dTIXIxJwhaZBNz10xffnZHAqbgatmg
         laK6QVJ+N+0Zb+GiqhBzjCZMzQBLaJMVFZXftdZSPnPg3TWWBKXkhH9Qgkh3eLvW/Z9e
         evZ6gQzqFf0gcjrV5/X2gMCpDWn6Bgx+zmimBPT9bLkSmdt/tNDiBrrbP5Ez+4ryBeUn
         QvfLq0kklASi9kvibOgio/oMs6xPa6ckKl8fV4r7MkjwtrR6hPg8PM5PWmHiHh6KM47j
         h+BA==
X-Gm-Message-State: AOJu0YwERUxG0BsuDqE54T2P6E9t2vMODDcJhWAilbmw824x8YN+0KFd
	zkqym/oHj0jfIbysyv3lNEevXu3ldYRbT9yB
X-Google-Smtp-Source: AGHT+IEwpcTL0Csf+EWLMVI9iqmJ7YDfPSWV44S+4HHothwKYStghNbHwsGo0zDVddU+owpDPGqmRw==
X-Received: by 2002:a05:600c:5020:b0:40b:3322:2af6 with SMTP id n32-20020a05600c502000b0040b33222af6mr7727002wmr.5.1704198531712;
        Tue, 02 Jan 2024 04:28:51 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (sal63-h02-176-184-16-71.dsl.sta.abo.bbox.fr. [176.184.16.71])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c354200b0040d5ac00dc6sm25464652wmq.8.2024.01.02.04.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:28:51 -0800 (PST)
Message-ID: <9293e63b-8032-4ea0-b516-9db6949fb607@linaro.org>
Date: Tue, 2 Jan 2024 13:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/arm: Prefer arm_feature() over
 object_property_find()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Radoslaw Biernacki
 <rad@semihalf.com>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20231214171447.44025-1-philmd@linaro.org>
 <CAFEAcA-Je+_tNCwiL_sQb-tDmCRJ2LWm5mAfuowtxbUBNEWQXQ@mail.gmail.com>
 <871qbkug24.fsf@pond.sub.org>
 <CAFEAcA9vEvOeTseaC27hz9RKe13zs_2oPGjK-bLs8VL1wQF2jw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9vEvOeTseaC27hz9RKe13zs_2oPGjK-bLs8VL1wQF2jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jpkD3mPGHMV4

Hi,

On 18/12/23 10:48, Peter Maydell wrote:
> On Mon, 18 Dec 2023 at 07:26, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On Thu, 14 Dec 2023 at 17:14, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> QOM properties are added on the ARM vCPU object when a
>>>> feature is present. Rather than checking the property
>>>> is present, check the feature.
>>>>
>>>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>> RFC: If there is no objection on this patch, I can split
>>>>       as a per-feature series if necessary.
>>>>
>>>> Based-on: <20231123143813.42632-1-philmd@linaro.org>
>>>>    "hw: Simplify accesses to CPUState::'start-powered-off' property"
>>>
>>> I'm not a super-fan of board-level code looking inside
>>> the QOM object with direct use of arm_feature() when
>>> it doesn't have to. What's wrong with asking whether
>>> the property exists before trying to set it?
>>
>> I'm not a fan of using QOM instead of the native C interface.
>>
>> The native C interface is CPUArmState method arm_feature().
> 
> But we don't in most of these cases really want to know "is this
> a CPU with feature foo?". What we're asking is "does this
> QOM property exist so it won't blow up if I set/get it?".

[More analysis on this topic.]

ARMV7M (hw/arm/armv7m.c) is an interesting QOM use case.

ARMV7M is a ARMCPU container, with few more things. (We have
more complex cases with containers of array of vCPUs, so this
single-vCPU case is a good start).

We'd like to apply properties on ARMV7M which get forwarded
to the embedded ARMCPU.
Usually we create the ARMCPU in armv7m_instance_init(), call
object_property_add_alias() to alias some ARMCPU to ARMV7M,
so these properties can be set externally before ARMV7M is
realized, being directly forwarded to the embedded ARMCPU [*].

The problem with ARMV7M is it the ARMCPU QOM type is variable,
so we don't know it in armv7m_instance_init() but only later
in armv7m_realize(), thus we can not call QOM _add_alias() to
alias them. One way to resolve this is to duplicate all possible
ARMCPU properties we want to set on ARMV7M, and set them in
armv7m_realize() after the ARMCPU is created and before it is
realized (the current implementation):

static void armv7m_realize(DeviceState *dev, Error **errp)
{
     ...
     s->cpu = ARM_CPU(object_new_with_props(s->cpu_type,
                                            OBJECT(s), "cpu",
                                            &err, NULL));
     ...

     if (object_property_find(OBJECT(s->cpu), "vfp")) {
         if (!object_property_set_bool(OBJECT(s->cpu), "vfp",
                                       s->vfp, errp)) {
             return;
         }
     }
     ...

     if (!qdev_realize(cpudev, NULL, errp)) {
         return;
     }
     ...
}

static Property armv7m_properties[] = {
     DEFINE_PROP_STRING("cpu-type", ARMv7MState, cpu_type),
     ...
     DEFINE_PROP_BOOL("vfp", ARMv7MState, vfp, true),
     ...
};

Note ARMV7M "vfp" is a /static/ QOM property, so can not be
unregistered if the ARMCPU doesn't expose it.

* If ARMCPU doesn't provide "vfp", ARMV7M properties introspection
   still shows 'vfp=true'.

* If ARMCPU doesn't provide "vfp", requesting 'vfp=true' on ARMV7M
   is silently ignored.

* If ARMCPU doesn't provide "vfp", even if we unregister ARMV7M "vfp"
   property in realize() for cleaner introspection, we can not check
   whether user requested an explicit value before realize().
   Possibly we could use a tri-state {unset/false/true} dynamic property
   to check that.

[*] object_property_add_alias() is a 1-1 static aliasing. In the
     case of cluster of objects we don't have API to do a 1-N static
     aliasing; the current way to do that is similar to dynamic
     properties setters iterating on the array (getter usually return
     the container property, ignoring the cluster values).

Regards,

Phil.
