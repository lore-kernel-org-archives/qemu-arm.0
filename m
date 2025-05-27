Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5045502njc;
        Tue, 27 May 2025 12:34:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxPF5qOq6eYSHnD4kpqqb5jbVDqkZzgC4nPiv4rfDfHEzdSSUXAaN0H8Jd4wJfgNERxoslYrRqnpaEwQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHYeYW1+n9RNKbn30YMUNhE02WSmRxaIyfDGHIj1I5HaX3MVg1jOQOhITSjhdYhiy4qO7sz
X-Received: by 2002:a05:620a:43a8:b0:7c5:588a:5c1e with SMTP id af79cd13be357-7ceecbd814cmr2003658285a.30.1748374491432;
        Tue, 27 May 2025 12:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748374491; cv=none;
        d=google.com; s=arc-20240605;
        b=CLrBaz+omroE+c1/16gsYe6OJnSIuROWwKPWvufvCecUbdEVkgGqk4MkQI9o4j7qe2
         MYGD7h1+qCJ9UeTtU4lX0ZlJUFJqpXLDAdKGDFfrRoSY2pEbqIzVJNNdoySeKDK97kFD
         BCgzB6uqY2AaELoYYusnsbP2y0KC7sXQO3mdFyKWJl/28nkLZYQmUbtQkQ59AwxWB7b4
         aykPGiuwt/iUW1MAVpZLrOrxMFwpJJST5SPCBF325M3lpie5dSSI4oOIYVlMvUVM1Mw1
         2Q4fHDbklS0Hl6SADMPcpYHdSrNwquomBuqw381LJ2w+IStDwZcGT4Nh98sEqI2PZxYN
         ms9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9jWIROm8RTitpuU8pAEdyjf0Vz8p6L6T62GjaidCFCA=;
        fh=BWO0xgRCN8PEvF8LoYAZjKIk9h4av4AFTK1/Y/tE4Z0=;
        b=RA0V5Z8uT90ZujRSAh/tOiE32/rwTppjo/ZwXNOM5r7Lcf3Boz+xwZas6/8iUk7xeA
         RaSDHf0+a1e6fAFYa/exFgW6aK4akUUtRQ/eO7SuKQ5Fe818pWF0YZ40KhxQuerBu7R0
         kuPbkb8ppEWfg7BRSVO6HWpOIhHh8T9YHhdHW6Fo6JUYUrhA5x5bb+d/8uUntNVc3GeN
         DicGVlWYvy3mtDd7+xE1WPJF/BJYr6wC7hkoLwD4+kfOcohvnP0D3bgQooGqeY1ftAYa
         RZa1WsZJniCCXKiYdJIuXAGsk46w+N6lQFZIClWyTIDIXsG4GGdyfisBvyIk1e3lNA8C
         DiRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dGFhdDST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a2f9388f74si521131cf.374.2025.05.27.12.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 May 2025 12:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dGFhdDST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uK04J-0001Zx-Sg; Tue, 27 May 2025 15:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uK04H-0001ZR-AA
 for qemu-arm@nongnu.org; Tue, 27 May 2025 15:34:34 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uK04D-0004Fm-Kf
 for qemu-arm@nongnu.org; Tue, 27 May 2025 15:34:32 -0400
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-52f22008b6aso1144957e0c.1
 for <qemu-arm@nongnu.org>; Tue, 27 May 2025 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748374466; x=1748979266; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9jWIROm8RTitpuU8pAEdyjf0Vz8p6L6T62GjaidCFCA=;
 b=dGFhdDSTkVQEYXVitvJvTaOmHwYG2mCpDAA7nxmDTjKvAPJHhufSr1se7HDULkrgwF
 kO68T1Smom2GcZ/XRH74nUvUcWtQSAoxH6I5a8GxTU9KvCaXR1VpIvgrqp5hh9DgUX3m
 rdFktTUIZ3/jHGgDIVd3Aun/6pTU53YZSoVgJb8fM1o6UtFUgW8IVMo5V5Um0Z5h6YDG
 Zrknjr9sARkDScA26rRWIDXNB0PL5LqZ+OBGRoZeLWJwqR4LRFrNhnoWiIUDAlbqDOrI
 aZQ1pSUGj9mZ7JvNMjrjeI2ES3Uqd+dpxtkr9lzHc/2iZtvSnyHP5YxlWB6x2Qukp/sJ
 2euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748374466; x=1748979266;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9jWIROm8RTitpuU8pAEdyjf0Vz8p6L6T62GjaidCFCA=;
 b=X2XoPgw2S7b92ZNjYg/rybH+jkZ52JUo2LPKSuLEy9aXKLtdzo5mZNSyHmnzaTzgD3
 vo/FVBOf4LQ2aDMS0u6Ou3pO+JdnFCdzMjk/2YzYnsz1oiLWMhrR+JAcpDeHM2zJCAuh
 nGOlSQ60CarqNyK/CCO7SWULOP+GrkKomt179pQCmHPGaVAGTv+GaNk3golNN11y41Jw
 6MPxr8m4tpLpzppgRyXrkPky8JnXIvV37mBuLjrdRc4LwnXkyG3I8nmj2RF/vQH0Fr4h
 XmOfAnUmWLx+/PcPHRFBdkxUtpRnf1fl3xTRXwEW/tEmAuaE9A8INN0q6IRE2RIHw4p4
 io8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW//Vve4MyEMjuBbDF4QwEkFV9Yr3eO2J3LttzXwzlptY8IBgGUSkz5WpeUsIYl3szYl0KDl/ND0Q==@nongnu.org
X-Gm-Message-State: AOJu0YywbrSUG5lerPcPLAcZ9yg2VfY7NK+UV7Jql196tRmYL6durMXs
 sFVlprhV0SJdYSDLTOc9UZIgWfKfe3iZPeYMki4Dtjl1h4Q3lPK8BGuJ8ypOVRDsazC4EX+LBPe
 6LicV
X-Gm-Gg: ASbGncucz5eugpEJU4q0dZkC2TmGnTx6Kt2Oq8IPzj5+1FN1atCmHMObl/vc6PDJChk
 9V8ScXAoLX6ZPVnN2iv63Je3CtSwXpDzKgVM66LjeHGTNbsvokMtBpmOaX9HdGEYBLNft6fOJak
 RJ1nr9GZSZsRA013pZEG3wAVk/4qAHKzYZXp//u/QQ5zQOR6vYX3vbzotoNPMGCnclGTtK9poqD
 gY1iKiK6/e04+uRd73MRnf2D7gxNPrwJXy/LO3nRWPzBuNhNm7+J7XCddE8rBzX0RRoRagqcBy2
 qeDcTtD02IuKP8TQKlRRkiwKKSsR07j7U0AjuDG+cQ3ekel1aje6wnH2vXnQ9d6XqHVNw/S0uPT
 Ne9cz5Hw6LCvMwXMFwblN13L++YVtOw==
X-Received: by 2002:a05:6122:1d9e:b0:52a:79fd:d05e with SMTP id
 71dfb90a1353d-52f2c4a8cd0mr12398945e0c.2.1748374466405; 
 Tue, 27 May 2025 12:34:26 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b402:6ba2:2066:dacd:9134:8586?
 ([2804:7f0:b402:6ba2:2066:dacd:9134:8586])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52dbab4e96bsm20122089e0c.29.2025.05.27.12.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 12:34:25 -0700 (PDT)
Message-ID: <37fbdb85-fa16-4e09-a033-5a0ae5bdbb18@linaro.org>
Date: Tue, 27 May 2025 16:34:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/22] hw/i386/acpi-build: Move aml_pci_edsm to a generic
 place
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-15-eric.auger@redhat.com>
 <ad7c7b84-9f12-4767-a349-df47c489c726@linaro.org>
 <2f1d15ea-82fe-4633-9791-ef9a3721b87d@redhat.com>
 <95bff50a-4da9-4abe-b596-95c64ab85231@linaro.org>
 <55ef40d6-f940-4e53-b591-2a1df5f5b5e1@linaro.org>
 <51fd4295-cf41-4b39-b678-692a558f0967@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <51fd4295-cf41-4b39-b678-692a558f0967@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2Y8xzfzLpD2/

Hi Eric,

On 5/27/25 04:18, Eric Auger wrote:
> 
> 
> On 5/21/25 10:19 PM, Gustavo Romero wrote:
>> Hi Eric,
>>
>> On 5/21/25 13:24, Gustavo Romero wrote:
>>> Hi Eric,
>>>
>>> On 5/21/25 12:56, Eric Auger wrote:
>>>> Hi Gustavo,
>>>>
>>>> On 5/21/25 5:26 PM, Gustavo Romero wrote:
>>>>> Hi Eric,
>>>>>
>>>>> On 5/14/25 14:01, Eric Auger wrote:
>>>>>> Move aml_pci_edsm to pcihp since we want to reuse that for
>>>>>> ARM and acpi-index support.
>>>>>>
>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>> ---
>>>>>>     include/hw/acpi/pcihp.h |  2 ++
>>>>>>     hw/acpi/pcihp.c         | 53
>>>>>> +++++++++++++++++++++++++++++++++++++++++
>>>>>>     hw/i386/acpi-build.c    | 53
>>>>>> -----------------------------------------
>>>>>>     3 files changed, 55 insertions(+), 53 deletions(-)
>>>>>>
>>>>>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>>>>>> index 4d820b4baf..bc31dbff39 100644
>>>>>> --- a/include/hw/acpi/pcihp.h
>>>>>> +++ b/include/hw/acpi/pcihp.h
>>>>>> @@ -82,6 +82,8 @@ bool build_append_notification_callback(Aml
>>>>>> *parent_scope, const PCIBus *bus);
>>>>>>       void build_append_pci_bus_devices(Aml *parent_scope, PCIBus
>>>>>> *bus);
>>>>>>     +Aml *aml_pci_edsm(void);
>>>>>> +
>>>>>>     /* Called on reset */
>>>>>>     void acpi_pcihp_reset(AcpiPciHpState *s);
>>>>>>     diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>>>>>> index d800371ddc..57fe8938b1 100644
>>>>>> --- a/hw/acpi/pcihp.c
>>>>>> +++ b/hw/acpi/pcihp.c
>>>>>> @@ -937,6 +937,59 @@ void build_append_pci_bus_devices(Aml
>>>>>> *parent_scope, PCIBus *bus)
>>>>>>         }
>>>>>>     }
>>>>>>     +Aml *aml_pci_edsm(void)
>>>>>> +{
>>>>>> +    Aml *method, *ifctx;
>>>>>> +    Aml *zero = aml_int(0);
>>>>>> +    Aml *func = aml_arg(2);
>>>>>> +    Aml *ret = aml_local(0);
>>>>>> +    Aml *aidx = aml_local(1);
>>>>>> +    Aml *params = aml_arg(4);
>>>>>> +
>>>>>> +    method = aml_method("EDSM", 5, AML_SERIALIZED);
>>>>>> +
>>>>>> +    /* get supported functions */
>>>>>> +    ifctx = aml_if(aml_equal(func, zero));
>>>>>> +    {
>>>>>> +        /* 1: have supported functions */
>>>>>> +        /* 7: support for function 7 */
>>>>>> +        const uint8_t caps = 1 | BIT(7);
>>>>>> +        build_append_pci_dsm_func0_common(ifctx, ret);
>>>>>> +        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret,
>>>>>> zero)));
>>>>>> +        aml_append(ifctx, aml_return(ret));
>>>>>> +    }
>>>>>> +    aml_append(method, ifctx);
>>>>>> +
>>>>>> +    /* handle specific functions requests */
>>>>>> +    /*
>>>>>> +     * PCI Firmware Specification 3.1
>>>>>> +     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
>>>>>> +     *        Operating Systems
>>>>>> +     */
>>>>>> +    ifctx = aml_if(aml_equal(func, aml_int(7)));
>>>>>> +    {
>>>>>> +       Aml *pkg = aml_package(2);
>>>>>> +       aml_append(pkg, zero);
>>>>>> +       /* optional, if not impl. should return null string */
>>>>>> +       aml_append(pkg, aml_string("%s", ""));
>>>>>> +       aml_append(ifctx, aml_store(pkg, ret));
>>>>>> +
>>>>>> +       /*
>>>>>> +        * IASL is fine when initializing Package with computational
>>>>>> data,
>>>>>> +        * however it makes guest unhappy /it fails to process such
>>>>>> AML/.
>>>>>> +        * So use runtime assignment to set acpi-index after
>>>>>> initializer
>>>>>> +        * to make OSPM happy.
>>>>>> +        */
>>>>>> +       aml_append(ifctx,
>>>>>> +           aml_store(aml_derefof(aml_index(params, aml_int(0))),
>>>>>> aidx));
>>>>>> +       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
>>>>>> +       aml_append(ifctx, aml_return(ret));
>>>>>> +    }
>>>>>> +    aml_append(method, ifctx);
>>>>>> +
>>>>>> +    return method;
>>>>>> +}
>>>>>> +
>>>>>>     const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>>>>>>         .name = "acpi_pcihp_pci_status",
>>>>>>         .version_id = 1,
>>>>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>>>>> index bcfba2ccb3..385e75d061 100644
>>>>>> --- a/hw/i386/acpi-build.c
>>>>>> +++ b/hw/i386/acpi-build.c
>>>>>> @@ -322,59 +322,6 @@ build_facs(GArray *table_data)
>>>>>>         g_array_append_vals(table_data, reserved, 40); /* Reserved */
>>>>>>     }
>>>>>>     -static Aml *aml_pci_edsm(void)
>>>>>> -{
>>>>>> -    Aml *method, *ifctx;
>>>>>> -    Aml *zero = aml_int(0);
>>>>>> -    Aml *func = aml_arg(2);
>>>>>> -    Aml *ret = aml_local(0);
>>>>>> -    Aml *aidx = aml_local(1);
>>>>>> -    Aml *params = aml_arg(4);
>>>>>> -
>>>>>> -    method = aml_method("EDSM", 5, AML_SERIALIZED);
>>>>>> -
>>>>>> -    /* get supported functions */
>>>>>> -    ifctx = aml_if(aml_equal(func, zero));
>>>>>> -    {
>>>>>> -        /* 1: have supported functions */
>>>>>> -        /* 7: support for function 7 */
>>>>>> -        const uint8_t caps = 1 | BIT(7);
>>>>>> -        build_append_pci_dsm_func0_common(ifctx, ret);
>>>>>> -        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret,
>>>>>> zero)));
>>>>>> -        aml_append(ifctx, aml_return(ret));
>>>>>> -    }
>>>>>> -    aml_append(method, ifctx);
>>>>>> -
>>>>>> -    /* handle specific functions requests */
>>>>>> -    /*
>>>>>> -     * PCI Firmware Specification 3.1
>>>>>> -     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
>>>>>> -     *        Operating Systems
>>>>>> -     */
>>>>>> -    ifctx = aml_if(aml_equal(func, aml_int(7)));
>>>>>> -    {
>>>>>> -       Aml *pkg = aml_package(2);
>>>>>> -       aml_append(pkg, zero);
>>>>>> -       /* optional, if not impl. should return null string */
>>>>>> -       aml_append(pkg, aml_string("%s", ""));
>>>>>> -       aml_append(ifctx, aml_store(pkg, ret));
>>>>>> -
>>>>>> -       /*
>>>>>> -        * IASL is fine when initializing Package with computational
>>>>>> data,
>>>>>> -        * however it makes guest unhappy /it fails to process such
>>>>>> AML/.
>>>>>> -        * So use runtime assignment to set acpi-index after
>>>>>> initializer
>>>>>> -        * to make OSPM happy.
>>>>>> -        */
>>>>>> -       aml_append(ifctx,
>>>>>> -           aml_store(aml_derefof(aml_index(params, aml_int(0))),
>>>>>> aidx));
>>>>>> -       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
>>>>>> -       aml_append(ifctx, aml_return(ret));
>>>>>> -    }
>>>>>> -    aml_append(method, ifctx);
>>>>>> -
>>>>>> -    return method;
>>>>>> -}
>>>>>> -
>>>>>>     /*
>>>>>>      * build_prt - Define interrupt routing rules
>>>>>>      *
>>>>>
>>>>> EDSM is not called from anywhere. _DSM method actually calls the PDSM,
>>>>> already defined
>>>>> in pcihp.c and generated by aml_pci_pdsm(). build_acpi_pci_hotplug(),
>>>>> which calls
>>>>> aml_pci_pdsm(), properly creates the PDSM method. Then in
>>>>> build_append_pcihp_slots()
>>>>> the a _DSM is defined per slot and inside it there is a call to PDSM,
>>>>> so I understand
>>>>> we should actually stick to the PDSM in pcihp.c instead of EDSM.
>>>>
>>>> I see build_append_pci_bus_devices -> aml_pci_static_endpoint_dsm
>>>> adds a _DSM method which eventually calls EDSM.
>>>
>>> Yes, but I meant in the final generated ACPI AML code.
>>>
>>>
>>>> aml_pci_device_dsm builds another _DSM implementation which calls PDSM.
>>>>
>>>> As we use build_append_pci_bus_devices and we are likely to have a _DSM
>>>> implementation that calls EDSM method, I think we shall have it in the
>>>> aml. What do I miss?
>>>
>>> Maybe some condition in build_append_pci_bus_devices() of:
>>>
>>>           if (pdev->acpi_index &&
>>>               !object_property_get_bool(OBJECT(pdev), "hotpluggable",
>>>                                         &error_abort)) { ... }
>>>
>>>
>>> is not met?
>>>
>>> Does your _DSM method in the machine's ACPI has a call to EDSM? I don't
>>> see it. In my case it's the PDSM that is being called:
>>>
>>> gromero@xps13:/tmp$ grep -n PDSM dsdt.dsl
>>> 1910:        Method (PDSM, 5, Serialized)
>>> 2047:                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
>>> gromero@xps13:/tmp$ grep -n EDSM dsdt.dsl
>>> 1959:        Method (EDSM, 5, Serialized)
>>> gromero@xps13:/tmp$
>>>
>>> I also confirmed that PDSM is what is being used by reverting this
>>> patch and
>>> dropping the aml_append(pci0_scope, aml_pci_edsm()); in 15/22.
>>>
>>> But also, why shouldn't we use the PDSM defined already in pcihp.c?
>>> This is
>>> indeed crafted for the acpi-pcihp-hotplug device as I understand it.
>>
>> Sorry, I see now, the EDSM is actually only for static endpoint PCI
>> devices,
>> i.e. non-hotpluggable, I see. So PDSM and EDSM serve different
>> purposes, although
>> similar.
>>
>> So, my point in the end is (and the one that confused me too) that
>> EDSM can be
>> present even if it will never be used by any static device, working
>> pretty much
>> like an ACPI deadcode. Could we avoid this? For instance, just emit
>> EDSM if
>> a _DSM that relies on it is emitted, like:
> 
> I see your point and it's true that for some PCIe configs the code can
> be there while not used. However it looks it is done the same way on x86
> and I would tend to be not more popish than the pope ;-)
> 
> Maybe this can be a patch sent afterwards that would also address the
> x86 case then.

Got it. Well, I think it's just a matter of making build_append_pci_bus_devices()
tell if any static endpoint is added and just call aml_pci_edsm() to emit EDSM if
there is any, like in my diff:

+        /* Generate tables for static endpoints. */
+        if (build_append_pci_bus_devices(pci0_scope, vms->bus)) {
+            /* Has a _DSM method that requires a EDSM method. */
+            aml_append(pci0_scope, aml_pci_edsm());
+        }

But I'm not really the maintainer or the official reviewer for this part of
the code, and you certainly have more karma than I do in this area, so it's
up to you, of course. I just think ACPI code is tricky enough to review,
and having dead code makes it a tad more daunting :)


>>
>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>> index e87846a1fa..4d6dd3dd96 100644
>> --- a/hw/acpi/pcihp.c
>> +++ b/hw/acpi/pcihp.c
>> @@ -905,8 +905,9 @@ void build_append_pcihp_slots(Aml *parent_scope,
>> PCIBus *bus)
>>       aml_append(parent_scope, notify_method);
>>   }
>>   
>> -void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
>> +bool build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
>>   {
>> +    bool has_dsm = false;
>>       int devfn;
>>       Aml *dev;
>>   
>> @@ -929,11 +930,14 @@ void build_append_pci_bus_devices(Aml
>> *parent_scope, PCIBus *bus)
>>               !object_property_get_bool(OBJECT(pdev), "hotpluggable",
>>                                         &error_abort)) {
>>               aml_append(dev, aml_pci_static_endpoint_dsm(pdev));
>> +            has_dsm = true;
>>           }
>>   
>>           /* device descriptor has been composed, add it into parent
>> context */
>>           aml_append(parent_scope, dev);
>>       }
>> +
>> +    return has_dsm;
>>   }
>>   
>>   Aml *aml_pci_edsm(void)
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 05a754d368..e4788c03ed 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -844,15 +844,22 @@ build_dsdt(GArray *table_data, BIOSLinker
>> *linker, VirtMachineState *vms)
>>       if (vms->acpi_pcihp) {
>>           Aml *pci0_scope = aml_scope("\\_SB.PCI0");
>>   
>> -        aml_append(pci0_scope, aml_pci_edsm());
>>           build_acpi_pci_hotplug(dsdt, AML_SYSTEM_MEMORY,
>>                                  memmap[VIRT_ACPI_PCIHP].base);
>>           build_append_pcihp_resources(pci0_scope,
>>                                        memmap[VIRT_ACPI_PCIHP].base,
>>                                        memmap[VIRT_ACPI_PCIHP].size);
>>   
>> -        /* Scan all PCI buses. Generate tables to support hotplug. */
>> -        build_append_pci_bus_devices(pci0_scope, vms->bus);
>> +        /*
>> +         * Scan all PCI buses and devices. Generate tables to support
>> static
>> +         * endpoint devices and hotplug.
>> +         */
>> +        /* Generate tables for static endpoints. */
>> +        if (build_append_pci_bus_devices(pci0_scope, vms->bus)) {
>> +            /* Has a _DSM method that requires a EDSM method. */
>> +            aml_append(pci0_scope, aml_pci_edsm());
>> +        }
>> +        /* Generate tables for PCI buses/slots/ */
>>           if (object_property_find(OBJECT(vms->bus),
>> ACPI_PCIHP_PROP_BSEL)) {
>>               build_append_pcihp_slots(pci0_scope, vms->bus);
>>           }
>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>> index bda5ea24b5..25cc39f4ab 100644
>> --- a/include/hw/acpi/pcihp.h
>> +++ b/include/hw/acpi/pcihp.h
>> @@ -82,7 +82,7 @@ void build_append_pcihp_resources(Aml *table,
>>                                     uint64_t io_addr, uint64_t io_len);
>>   bool build_append_notification_callback(Aml *parent_scope, const
>> PCIBus *bus);
>>   
>> -void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>> +bool build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>>   
>>   Aml *aml_pci_edsm(void);
>>
>>
>> Another question that I have is: could you please share a QEMU command
>> line option
>> that generates a static endpoint PCI device that matches the criteria
>> for the emission
>> of the _DSM method accordingly to build_append_pci_bus_devices()?
> You can instantiate a virtio-net-pci device on pci.0 and with acpi-index
> set.
> 
> -device
> virtio-net-pci,bus=pcie.0,netdev=nic0,mac=6a:f5:10:b1:3d:d2,acpi-index=12
> 
> In that case EDSM is being called:
> 
>          Device (S08)
>          {
>              Name (_ADR, 0x00010000)  // _ADR: Address
>              Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
>              {
>                  Local0 = Package (0x01)
>                      {
>                          0x0C
>                      }
>                  Return (EDSM (Arg0, Arg1, Arg2, Arg3, Local0))
>              }
>          }
> 
> Putting it on a root port will let the EDSM unused.

Thanks for the example. Would it be correct to say so that EDSM is part of
the coldplug and so could be left for another series, so out of scope for
hotpluging?


Cheers,
Gustavo
