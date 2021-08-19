Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp397531lfg;
        Thu, 19 Aug 2021 07:50:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMw3aTWINb+3k2cPNtcyKP2wSmz+lkPK+fI18V/8T4ApV2Xph6FFmkY+tqgHLZYmxbc2g5
X-Received: by 2002:a02:7312:: with SMTP id y18mr13097624jab.129.1629384628471;
        Thu, 19 Aug 2021 07:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629384628; cv=none;
        d=google.com; s=arc-20160816;
        b=mbY4DaA9L2smqnUlsf3CkJ0xtLSkAxDkqGyvLcygvMaC6GmpwpW6xmrVfH8IUEYymk
         BaPVm5QLXXmLaNrNdJ24wQljte8daCLlCRol91h5jkTXl2RhnSKs69+ifa9GpbScdQJL
         f9T+GwRVzrs89r76Px+6BlzKfshSfCOIdgIqDWWCLkYSEFq4QTysf/6QtxtmDvT5BhLY
         ODTFXGgIQLTHSr5VtL02bvM4RxQ7OfZCoALCRPGdJPZmKG+LojPyl6K4/2M/OxILTV4N
         Fzz0HA8y+OjBXZEjmNa0XvuSv4+hQNKhdqyqfcl3Y4uTfEbVpjrrn7vf9KvEkXDw4U8q
         pVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3LtbL35GFfw/jMOYi5MMA9wQzNSgU3PW/M24GFN6G0Y=;
        b=u1278lvV84F30yEe5Eg9R2kIUmHakGUuxTPrFZRJmW9ywG0IFnkE53mS59df3IG4CO
         CE1Plpa9a/YfgMDCAauRjauCStL1gJuHhJJ4Gk55DT7h6tF88qAsroq4rZcFIs26CPjH
         u14rhgl2txJKPyOAUKyHVrK2V7TlC919YeqQtMRNwkWVwDv4mTcrIzNqIoZCKN36gIgy
         4hLO8jmgItCejWo+jo28N3FGK4Ya9veBenA1/swNBSA3gjHVS0ytbbzMK6XsZLykdtvH
         sBaQVfy/v21ufW73RYjveovZ/5yryKNYxEsZrauDCZdFbQEMNQHmZ0gjwYGEvDwPfl4g
         NNhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XjBaYIfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si182750ilm.40.2021.08.19.07.50.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:50:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XjBaYIfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGjND-0001SZ-OZ
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjMp-0001Rh-9f
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjMm-0006Nj-FP
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629384599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LtbL35GFfw/jMOYi5MMA9wQzNSgU3PW/M24GFN6G0Y=;
 b=XjBaYIfLfh47wcTjeHckJ0lUPpQb9gnAzYhmFR1LbvPsL60SqsuRzbvWULMWUFaA8iJnhI
 LkYF0PFFmYfFq5ZtPOFVCi5y3iRiBqgP+/QNuvxZuZJh+V+J5AoIjyRhzaoydL7r2AZRPd
 inSkQ3aiL+vjcWBXnm1ny26gZrpbDpo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-uPGSiiCsPMqGj4JF3A_n_Q-1; Thu, 19 Aug 2021 10:49:58 -0400
X-MC-Unique: uPGSiiCsPMqGj4JF3A_n_Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so1757747wru.19
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3LtbL35GFfw/jMOYi5MMA9wQzNSgU3PW/M24GFN6G0Y=;
 b=rXwxsiy1a3gYd+SzmcTIC4fhycR8UwboY4KJ7JArwk174mGtC3cDViKExyWM+OzbSC
 2rWQjWz8Uks94tKVwM9mMqAeggrQFWn05dbqJYLWEDLhK479xIiykAL3HUE8L6CnwUIb
 J9ZTi7zuVW2K24uE0VrUnTOfzfpPkm7ru3V3AwXiyUuiFiRan12eVsvvxkLDgi3hQjjm
 11Ioy8dns3mz4ghRpQoV4ofbie7Y4HwMeYjGlxh5Qg3VO0gyonWTjVzMPveY2jQs9ajm
 rvCrClE0FYADNMY8jwkmAbQF2Su3LvFBWafgAgkS0h0QofF8KKhXo/MIcZdEUl2eD6wK
 KHGA==
X-Gm-Message-State: AOAM532/f+vlC2mzZ9brS+nGAeeumvbV7g0xIulf+vRkTKaSRHn5WbyR
 yHNVllZgXZk5fnJ5cCk5J6W1tlpBKpRjV+/1zlUsyrQgQkUJ5sH6kdEOsYmUJukj/39eVyfGeom
 i1YfG4wHqBVlE
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr4428534wrr.92.1629384596924; 
 Thu, 19 Aug 2021 07:49:56 -0700 (PDT)
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr4428511wrr.92.1629384596697; 
 Thu, 19 Aug 2021 07:49:56 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s10sm3689846wrv.54.2021.08.19.07.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:49:56 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
To: Ani Sinha <ani@anisinha.ca>
References: <20210812033405.362985-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2108171014500.202364@anisinha-lenovo>
 <CAFEAcA8Fu+mkzFi9JdTtbqMcnnV74Swk04xx2a1G4L_oATY2eQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2108191849260.417749@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108191905100.418214@anisinha-lenovo>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <16b11751-7ab2-8d68-0bf2-5453bc2938fc@redhat.com>
Date: Thu, 19 Aug 2021 16:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2108191905100.418214@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sAoyagyG3/Nc

Cc'ing Shameer Kolothum.

On 8/19/21 3:36 PM, Ani Sinha wrote:
> On Thu, 19 Aug 2021, Ani Sinha wrote:
>> On Thu, 19 Aug 2021, Peter Maydell wrote:
>>> On Tue, 17 Aug 2021 at 05:45, Ani Sinha <ani@anisinha.ca> wrote:

>>> Is it intended that ACPI_HW_REDUCED must always imply
>>> ACPI_MEMORY_HOTPLUG, or is it just a coincidence that the
>>> virt board happens to want both, and so we select both ?

The ACPI dependency was missing (see commit 36b79e3219d,
"hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)",
now we don't need it explicitly.

>> From a purely code inspection point of view, I noticed that
>> generic_event_device.c depends on CONFIG_ACPI_HW_REDUCED. The GED does use
>> memory hotplug apis - for example acpi_ged_device_plug_cb() uses
>> acpi_memory_plug_cb() etc.
>>
>> Hence, as it stands today, CONFIG_ACPI_HW_REDUCED will need to select ACPI
>> memory hotplug. Unless we remove the GED device's dependence on
>> ACPI_HW_REDUCED that is. I cannot comment whether that would be wise or if
>> we should reorg the code in some other way.
> 
> The other question we should ask is whether arm platform requires
> ACPI_MEMORY_HOTPLUG independent of ACPI_HW_REDUCED/GED device? If that is
> the case, then maybe we should keep that config option as is.
> Maybe @qemu-arm can answer that?

Or git-log:

commit cff51ac978c4fa0b3d0de0fd62d772d9003f123e
Author: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Date:   Wed Sep 18 14:06:27 2019 +0100

    hw/arm/virt: Enable device memory cold/hot plug with ACPI boot

    This initializes the GED device with base memory and irq, configures
    ged memory hotplug event and builds the corresponding aml code. With
    this, both hot and cold plug of device memory is enabled now for
    Guest with ACPI boot. Memory cold plug support with Guest DT boot is
    not yet supported.

>>>> On Thu, 12 Aug 2021, Ani Sinha wrote:
>>>>

Please prepend here 'Since commit 36b79e3219d ("hw/acpi/Kconfig: Add
missing Kconfig dependencies"),'

With it:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>>>>> ACPI_MEMORY_HOTPLUG is implicitly turned on when ACPI_HW_REDUCED is selected.
>>>>> ACPI_HW_REDUCED is already enabled. No need to turn on ACPI_MEMORY_HOTPLUG
>>>>> explicitly. This is a minor cleanup.
>>>>>
>>>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
>>>>> ---
>>>>>  hw/arm/Kconfig | 1 -
>>>>>  1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>>>> index 4ba0aca067..38cf9f44e2 100644
>>>>> --- a/hw/arm/Kconfig
>>>>> +++ b/hw/arm/Kconfig
>>>>> @@ -25,7 +25,6 @@ config ARM_VIRT
>>>>>      select ACPI_PCI
>>>>>      select MEM_DEVICE
>>>>>      select DIMM
>>>>> -    select ACPI_MEMORY_HOTPLUG
>>>>>      select ACPI_HW_REDUCED
>>>>>      select ACPI_NVDIMM
>>>>>      select ACPI_APEI
>>>>> --
>>>>> 2.25.1

