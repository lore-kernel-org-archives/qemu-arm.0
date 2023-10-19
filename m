Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp334774ejb;
        Thu, 19 Oct 2023 00:39:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqSPGP4hOrGmUocDHRuzBGnEPgkJHomC12Q74xzMLhFz463Z36obd/4NJIqBqAdY0yOomz
X-Received: by 2002:adf:f708:0:b0:32d:92fc:a625 with SMTP id r8-20020adff708000000b0032d92fca625mr809395wrp.24.1697701188144;
        Thu, 19 Oct 2023 00:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697701188; cv=none;
        d=google.com; s=arc-20160816;
        b=sVr50/b06syEejHZM0tm73VJgF8Vjs8qqVD16AAwktRfAZ/Qlj2pro4fF6t9C2KRbU
         pLi1jUSacJaxlb7JMFOVoeU+VJG4obd+Q5+D76E8rbepY8XVkLZs8f9q9aEWFeqmCA4+
         N8DOMiuu8v3c/yTR2ne9ZSa9m3MbytdYwm9dU6OF5jcJxoJMMzkwg2ofaMNGKnz5eqEx
         W3K2ZipoWVYPVFHCZiG1TXvCZu1PxQ0jvyDt7tc3SdhD+Xmzt3SHP4QujVjsn2Tmc1hn
         kkHsQlZRjOrmevqofExa4Lw9hb96DPWfGI5vSTzdwctC8H0jFr9Sp5mk5FoLwS/sOLya
         41Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=D98dpbEjXlx8VQxuixtp9KOkljaHyL8GcDrrze+pWuo=;
        fh=Gw7SaiAXUCbFmjGm/8vaR94YyyHsrQY9MPpmywXxTIA=;
        b=Tpip1Bo6BiM4Ob6QfrYy2ifjKorDX0LGC4x4/z1LsU1tJIweg68l/bhrrOB2E8NoR+
         2L+MZ1u8SpwkTY1FkhWHEA2ryJKWuCaA72TVta/Ss1WLCsZaZNeCIoVARctE/QVHCHW7
         nI0qYsPq9rabFbloWp+PKjHnE3bH3QJvyEgPkn3kBJh5MQd9TiRqkAyIB65xKETebYQE
         Ug255KLI4WWEG1DiBPQBYRWt3Yykb8VObOhW/jzHS9I/IpndEGKgjgXDK/F0iLeRboyp
         qGXsAjfADSQu8hX/nFiZ8yxICFrq7/yTT4FhuqoDPkr7uS5t9ueRYxfRT89+rCzGU0ah
         AzMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PlzAwXfQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020adfe7c6000000b0032488182103si2355498wrn.229.2023.10.19.00.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PlzAwXfQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNcd-0007YR-Eb; Thu, 19 Oct 2023 03:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNcb-0007Xj-Eb
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:39:09 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNcY-00055F-LX
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:39:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso2505375e9.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697701145; x=1698305945; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D98dpbEjXlx8VQxuixtp9KOkljaHyL8GcDrrze+pWuo=;
 b=PlzAwXfQI5+OpP5IGkUVV8x3/hIAe8bNmQXb94V/S73Y7MNOAgtChBU6Klpmk/06L5
 Y5X37/KJGuglcRnU2yeHAJnanOLn/781Qxbs9YWIymhQ3eZ8HdFJzlSHg+cxB4qtptf5
 gq0uwYVdOaLitZ2EBSnVihEVrd7ddD9U8Dy9FDyLQJuOxdB3RwnzHZ+mMwFjhy8LyU83
 77b1cQ0wdpuVQ5c4qxdnze4mX10noRfa+8iOE7oHyrb0v4GSq4a4Zwsv0k4jx31FlAgU
 ldMEHoi8UympzaQMf/NaYhpZMcGnCQ4jeZpCapVOrh8BSXiJOnWXdijrIi1nRQCVMMKh
 jgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697701145; x=1698305945;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D98dpbEjXlx8VQxuixtp9KOkljaHyL8GcDrrze+pWuo=;
 b=WsyCJl2HrYu4F9v46N+MVpWi1L73n0h977qolf+HAp4EH5PJR4nevENWrvTNZF/4SB
 9MX7iasiNcl+tRsTabvh2ZDeyOUlQQ0IF/P/5sPnavQ0txdtE2Nu9kHg18zmv1UDrKm2
 ar4D9E+x8aemMo3lVdJoPuNuJuQrJGR/trGad1BEvs8KmeqOyASSTvqeI0p7ZbQN+Gi1
 +JXzIh+10q6OrTdiMa2Jwa+2ye739T6lNMhnBdtfyRwfYb6LWdi8m8iWGz9YoY1t7HUh
 rAsk3tBtxyhp7e7R4WUbMU/SZ02hDwa52YPxAGoF2ukQOvK06ZwML5T9lSIlUpAUb+/K
 uGTQ==
X-Gm-Message-State: AOJu0YwiTNeEXI+t0gzmkVJHLNQBtvZjpy2n0x2eAvl+O/mcS35wKJb7
 eZN4+5k6EpkwiI0rathF+KWc8Q==
X-Received: by 2002:a05:600c:4f45:b0:3ff:516b:5c4c with SMTP id
 m5-20020a05600c4f4500b003ff516b5c4cmr1010580wmq.18.1697701144942; 
 Thu, 19 Oct 2023 00:39:04 -0700 (PDT)
Received: from [192.168.165.175] (92.red-88-28-12.dynamicip.rima-tde.net.
 [88.28.12.92]) by smtp.gmail.com with ESMTPSA id
 i18-20020a05600c481200b00407b93d8085sm3629324wmo.27.2023.10.19.00.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 00:39:04 -0700 (PDT)
Message-ID: <c386b03a-c59f-902a-7cb4-f5e54de577d5@linaro.org>
Date: Thu, 19 Oct 2023 09:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 05/12] hw/pci-host/bonito: Do not use SysBus API to map
 local MMIO region
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, Beniamino Galvani
 <b.galvani@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20231019071611.98885-1-philmd@linaro.org>
 <20231019071611.98885-6-philmd@linaro.org>
 <a00df2c8-6108-45f9-ab35-722f989f2057@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <a00df2c8-6108-45f9-ab35-722f989f2057@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: ZIzTrf6dY26T

On 19/10/23 09:26, Thomas Huth wrote:
> On 19/10/2023 09.16, Philippe Mathieu-Daudé wrote:
>> There is no point in exposing an internal MMIO region via
>> SysBus and directly mapping it in the very same device.
>>
>> Just map it without using the SysBus API.
>>
>> Transformation done using the following coccinelle script:
>>
>>    @@
>>    expression sbdev;
>>    expression index;
>>    expression addr;
>>    expression subregion;
>>    @@
>>    -    sysbus_init_mmio(sbdev, subregion);
>>         ... when != sbdev
>>    -    sysbus_mmio_map(sbdev, index, addr);
>>    +    memory_region_add_subregion(get_system_memory(), addr, 
>> subregion);
>>
>> and manually adding the local 'host_mem' variable to
>> avoid multiple calls to get_system_memory().
> 
> Thanks for updating it!
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/pci-host/bonito.c | 32 ++++++++++++++++----------------
>>   1 file changed, 16 insertions(+), 16 deletions(-)


>>       /* PCI copier */
>>       memory_region_init_io(&s->iomem_cop, OBJECT(s), &bonito_cop_ops, s,
>>                             "cop", 0x100);
>> -    sysbus_init_mmio(sysbus, &s->iomem_cop);
>> -    sysbus_mmio_map(sysbus, 4, 0x1fe00300);
>> +    memory_region_add_subregion(host_mem, 0x1fe00300,
>> +                                &s->iomem_cop);
> 
> At least the above two hunks look like they could now fit into one line?

This file will be heavily reworked soon, but meanwhile I did what you
suggested.

> Anyway:
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks!

