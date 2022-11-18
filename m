Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp273076ejx;
        Fri, 18 Nov 2022 06:12:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7kgPKGAMNHttowgJGwhTlTfS3rY2pZYQAYyGLCgO7Lj2ObuEKbinoojRVW2uxbWY/ES6mI
X-Received: by 2002:a05:622a:1e8c:b0:3a5:62:af4f with SMTP id bz12-20020a05622a1e8c00b003a50062af4fmr6537014qtb.431.1668780761687;
        Fri, 18 Nov 2022 06:12:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668780761; cv=none;
        d=google.com; s=arc-20160816;
        b=xj2TJPNpLBYdvby2y8lb5qJPBaLEW2M47/PAddsxH5Gr+w52brHkR6341Vl2bqwbKC
         POkM3SBwDLW18gKKgB7CPq8trc8X3GUzyTlpUEt2Gbmc7J28D8m3sfgythA5lKFbRrq7
         mqsVMQku+19qWLSpie8ryuyO6LcnClzog8AL8uwFdkw0GP5eQdUVu1faQ5mUMv4P0ZjF
         USK7Auy0EgicbM7KX6/2q5aAO5u1gU9rRjtTWAOlZNvF/xgw4ZfGR9uosLryUZU+h8xf
         q3UR1ToYCTUAeQyFvzSQMCwz5mk+qOTNELzhVvlHa72lkiPlRF3JFRLkWLhGJjo2XKfh
         dCBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/wSohw/W7bgCsvhQamLahjPWqdXNnc2y0sFvcI06aT8=;
        b=T9FJb3Uq3k4IKKmk43KwJO3XWXEQxKnqmhBInkPxQF7b064YMNUnXLPaby+p80VI0t
         rInIRoeVqlqVHiStUOGXgjtzgEX78ULuScldvT5TdfN4qiDwdkDO+1SHqiy2LPKQRB9D
         8XdIImCjR3hRpbJIhum1gvTYuiZBJeGB/QzjyYEjmhVmEE+XCtuqJfJKtOT1DEZvDR1N
         WNPscq/kCBmk6572JV3SUxLaZiCVvx+ja+5gIo8VyYMB98t146GcGmvpUrZ6fsCHN4p/
         PVeo6t6T9Ilp+1YUlJCKD0EX0PEUiW/YoMrCmL6aSZKctHIvTbXWxRGUMnFtW4ointFa
         y3fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pv0o7HYb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a0562140c6200b00496b2053145si1926843qvj.41.2022.11.18.06.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Nov 2022 06:12:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pv0o7HYb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ow26M-0003wY-Hk; Fri, 18 Nov 2022 09:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ow26L-0003wG-5r
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 09:12:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ow26J-0008E4-CY
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 09:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668780734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wSohw/W7bgCsvhQamLahjPWqdXNnc2y0sFvcI06aT8=;
 b=Pv0o7HYbciCjGFY1fQ6WYC/5iOyoacNfnaPmHj96VRIb9Z9+iBI2kBsUSUzZPIhqcwA0UF
 2U2f7SA9MUEpZIIjeIwP1gmJio0HuvbMQ/C/ntWpBwRyEPKwmHz0o2Djym+8f41WFloRS8
 Jk02O5zzHTfnb/3pFsgjOSidLayxM+E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-m3LK92NYNqWV8XPQ7JfLng-1; Fri, 18 Nov 2022 09:12:12 -0500
X-MC-Unique: m3LK92NYNqWV8XPQ7JfLng-1
Received: by mail-wm1-f72.google.com with SMTP id
 c10-20020a7bc84a000000b003cf81c2d3efso1181831wml.7
 for <qemu-arm@nongnu.org>; Fri, 18 Nov 2022 06:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/wSohw/W7bgCsvhQamLahjPWqdXNnc2y0sFvcI06aT8=;
 b=14bp1HXQ0+21TYpYjg+2Lzk2b38iVeaLge5THtKj8mKoaGdMclAo2gdlaOm/PU84TO
 BFE19qpnVGmDz40wQZfBKYHZPcm9/mcxODP7yJc3mmHCJGXYjCR2RNb5kaDUxCf4ZLyL
 331UrNnOkt5Ne9t0vaswWQRCMnD1oLbuooKU2Hyjn8gpGdbxRgHGKmEHN9K4er/vq3Gr
 /qp1+Lptwrk5h5N8se5LVLujhZkLhYVy+54VocswS1arv/wIDTaUWql1+7LXk/MxqxQ0
 pgxghWwExO2oXBvg/RtRPuF98/u094V7jjsJoGlHzQw1CFEPih+xcVnUY6cEE4CLhvqU
 HopQ==
X-Gm-Message-State: ANoB5pmAoUN1Th7agFzxFQa/buOP5H+MvdMN8yRZm/vOTNFcdzzW0LWf
 M768+86TuZ/tECZsMlJxdWqdBUBz/QVu1rFILGhhacHR+ax2/IlsmOl7YYffhH6iyUseS9uulgX
 O9f16wXLSfLsG
X-Received: by 2002:a05:600c:4211:b0:3c6:b656:5b52 with SMTP id
 x17-20020a05600c421100b003c6b6565b52mr8723141wmh.1.1668780731672; 
 Fri, 18 Nov 2022 06:12:11 -0800 (PST)
X-Received: by 2002:a05:600c:4211:b0:3c6:b656:5b52 with SMTP id
 x17-20020a05600c421100b003c6b6565b52mr8723099wmh.1.1668780731276; 
 Fri, 18 Nov 2022 06:12:11 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-78.web.vodafone.de.
 [109.43.177.78]) by smtp.gmail.com with ESMTPSA id
 i14-20020adff30e000000b002368a6deaf8sm3718594wro.57.2022.11.18.06.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 06:12:10 -0800 (PST)
Message-ID: <57f8506b-5c82-9b8b-57c9-02992963f2c4@redhat.com>
Date: Fri, 18 Nov 2022 15:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0] hw: Add compat machines for 8.0
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <20221111124534.129111-1-cohuck@redhat.com>
 <32f9a700-28f3-ada6-9526-c53cdcd3b5ac@redhat.com> <87pmdksh6k.fsf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87pmdksh6k.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: AEFP03ian3Gv

On 18/11/2022 11.14, Cornelia Huck wrote:
> On Fri, Nov 18 2022, Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 11/11/2022 13.45, Cornelia Huck wrote:
>>> Add 8.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.
>>>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> ---
>> ...
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index 0ad0ed160387..1c0a7b83b545 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -435,7 +435,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>>>        machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>>>    }
>>>    
>>> -static void pc_i440fx_7_2_machine_options(MachineClass *m)
>>> +static void pc_i440fx_8_0_machine_options(MachineClass *m)
>>>    {
>>>        PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>>        pc_i440fx_machine_options(m);
>>> @@ -444,6 +444,18 @@ static void pc_i440fx_7_2_machine_options(MachineClass *m)
>>>        pcmc->default_cpu_version = 1;
>>
>> Instead of renaming pc_i440fx_7_2_machine_options() and introducing a new
>> pc_i440fx_7_2_machine_options() below, what about moving
>> pcmc->default_cpu_version = 1 into pc_i440fx_machine_options() instead, like
>> it is done with all other options? Then you could introduce a completely new
>> pc_i440fx_8_0_machine_options() which would be way more logical (also when
>> looking at this file with "git blame" later).
>>
>>>    }
>>>    
>>> +DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
>>> +                      pc_i440fx_8_0_machine_options);
>>> +
>>> +static void pc_i440fx_7_2_machine_options(MachineClass *m)
>>> +{
>>> +    pc_i440fx_8_0_machine_options(m);
>>> +    m->alias = NULL;
>>> +    m->is_default = false;
>>> +    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>>> +    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
>>> +}
>>> +
>>>    DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
>>>                          pc_i440fx_7_2_machine_options);
>>>    
>>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>>> index a496bd6e74f5..10bb49f679b0 100644
>>> --- a/hw/i386/pc_q35.c
>>> +++ b/hw/i386/pc_q35.c
>>> @@ -370,7 +370,7 @@ static void pc_q35_machine_options(MachineClass *m)
>>>        m->max_cpus = 288;
>>>    }
>>>    
>>> -static void pc_q35_7_2_machine_options(MachineClass *m)
>>> +static void pc_q35_8_0_machine_options(MachineClass *m)
>>>    {
>>>        PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>>        pc_q35_machine_options(m);
>>> @@ -378,6 +378,17 @@ static void pc_q35_7_2_machine_options(MachineClass *m)
>>>        pcmc->default_cpu_version = 1;
>>
>> dito
>>
>>>    }
>>>    
>>> +DEFINE_Q35_MACHINE(v8_0, "pc-q35-8.0", NULL,
>>> +                   pc_q35_8_0_machine_options);
>>> +
>>> +static void pc_q35_7_2_machine_options(MachineClass *m)
>>> +{
>>> +    pc_q35_8_0_machine_options(m);
>>> +    m->alias = NULL;
>>> +    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>>> +    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
>>> +}
>>> +
>>>    DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
>>>                       pc_q35_7_2_machine_options);
>>>    
>>
>> Would it make sense to remove the m->alias = NULL from the 7.1 and earlier
>> machine types now?
> 
> Hm, all of this is how we've done machine type updates for the last few
> years :) We can certainly clean up the redundant stuff, but I'd prefer
> to do that via a separate patch.

OK, that's fair. I'll try to come up with a patch or two if nobody beats me 
to it once the 8.0 development phase starts.

  Thomas

