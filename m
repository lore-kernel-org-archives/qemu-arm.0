Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1035488ejb;
        Mon, 5 Feb 2024 02:20:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCIUBx7+Nwi7HT8YYXJf/cpHZx1HjpLDwU+6e7qEbXw1PcLpPvKq6HSqT5LGkls9tKy7FJ
X-Received: by 2002:ad4:5dc5:0:b0:68c:8874:59e9 with SMTP id m5-20020ad45dc5000000b0068c887459e9mr7467079qvh.43.1707128455552;
        Mon, 05 Feb 2024 02:20:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707128455; cv=none;
        d=google.com; s=arc-20160816;
        b=CrIehBTJveWvgRdJzh7RsEl1VYt5o9Jd1nWJmLGpn+EAcUy8EvP02UqSwqXIWX1HTt
         fTk3K6R3FBkt/2EI6YU50OTibWIWTgbkg2SiB4MTsAi+VhJev14d1qsWNDkzSoY80Z8z
         cvwB3idllKH3oSV5uMZHHMiFx23zB9XRqQ/lkkOW1n+fG6ngtmLSSbDfvA4fveJpt7Gd
         xcuJHPSAhWXLXNuElo6XXOWcH3tmG1NtSuR6rDhzoG/qbnx+Mur3u8CckOk406y+IfmN
         2vjCTxN1TG0LvOVPv8Tp9kTo+VTqpBcQ1aQ+7EpUFeeRUVP/glpljJyyndkvOWF7KEVI
         3HDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sUPTNvY8Nr+3a8iI0upUi4LqIuPeIsfzu+X/LeJIEKI=;
        fh=yOoP1cgkkTBlzKr0ZI8flkV/gtxdGMVUiFQCSCqmB3A=;
        b=H+GLlgw6XkdTnj2tMUS+BL48zcJwlbIp1bt4yD1zRgHIdUhfwNIA9SfHJuEgLIdg3d
         UrwCgBoNBs3xiD2qYvKRG7XBszq9pod9pJZ67CcYQB7nt09ycbvFJi0K8P2cK6AFpQMG
         CG9AsTUpIsJSv96vAnlEpQJ5cRYI6qJ9dOmKTgZHQ1+IGsc8tDwUg+JB9FGFk+fbgKd/
         CXeAS8dWp4yOulhvpPOC0bGyxH6JzQ7Y6ixPFRFkiwPx3HSj7JLjuVcSrYBuyLo35P5z
         apPwVKV4co+rQmuEmysZAIMhfNXiATZUd7KQEYncD7PA70Lk2Qz0zko6jZFXI98AN1RG
         dGXA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ChD4VE2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCWPPShNcx1AzZl1L93B33P04rx1lBDkJuSCMht8Hm1KamSwUu1dwbr/wNGyd1UUbHaZivF4+gviFwbonkataIVFdsNCtJO6
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020a0cf80d000000b0068c7a5e268bsi8255821qvn.178.2024.02.05.02.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 02:20:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ChD4VE2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rWw5i-0003nH-Dd; Mon, 05 Feb 2024 05:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rWw5f-0003mv-BV
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 05:20:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rWw5d-0003s1-PH
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 05:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707128437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUPTNvY8Nr+3a8iI0upUi4LqIuPeIsfzu+X/LeJIEKI=;
 b=ChD4VE2E4zjJGMh12fMgs2Apw/Z9hKoaNobfMeJTWIAOPJcU3gC0Ep417XpGpY9hXo0MnW
 oS5BRM3VDN+VEpamTYRmedNVSLUgF2ucCUeRaDV+EpG2ZzIVP8XMns1bMMYwyQr+T+5D8l
 SLKGwBig9awkOoVLImogjaPRDOuL9eU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-5xXhbFJ1NpySC-1hHZQZ9Q-1; Mon, 05 Feb 2024 05:20:35 -0500
X-MC-Unique: 5xXhbFJ1NpySC-1hHZQZ9Q-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-dc693399655so6890196276.1
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 02:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707128435; x=1707733235;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sUPTNvY8Nr+3a8iI0upUi4LqIuPeIsfzu+X/LeJIEKI=;
 b=wpvMdqlKPianrNATECuHLGcsj6RJpB5WQ5NMYfdL5O0AOgDYOAElRkrd+uEmY/pV75
 R9fNyfuJ8uEnfogHhnZLSmm8Wxo1hSuxQf8TvHuGZvePfmmGn8qnAkjvRrsVH2nCdvBT
 sQB3AxZF3igcmiTrFYM1mS0ThXy0OAYYjJAvHvmzVLIjwrHXcMBo5pa68/Xk9E9M0uHf
 fyV0faqYcEPXS6v8xIKTiXJ7UJXvXp3HzZEZd6LOBeCr+pguOs4Prl9QU7b0XFdG18x1
 dfHGSuU7ux+EwxDQDD/V1GU2QgIAxjpr7sHDUMt4achSwA1LtyXM6XbVvSJ4225C+3TK
 Wjyw==
X-Gm-Message-State: AOJu0Yywq0MsxWZK7EvXJnC3aq1mu6wYTs4L4Q7K8ioaX2yeQ4xgHDLu
 s6r7ynYTjYzAPStXyi9JGZKF3bgsPRvTY2lEb3UrQlwUdy1tj63iBpO71SE9eiz0xbuPVzMBFRQ
 B8ezHrpu15ugnUP6ZIMM6S6zI10ANwnTfTvAQ735RedD9+FfQfg==
X-Received: by 2002:a25:4e87:0:b0:dbd:5bfa:9681 with SMTP id
 c129-20020a254e87000000b00dbd5bfa9681mr13967201ybb.37.1707128435255; 
 Mon, 05 Feb 2024 02:20:35 -0800 (PST)
X-Received: by 2002:a25:4e87:0:b0:dbd:5bfa:9681 with SMTP id
 c129-20020a254e87000000b00dbd5bfa9681mr13967190ybb.37.1707128434999; 
 Mon, 05 Feb 2024 02:20:34 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUAKPA88/z24Wed9eNja1QCWxXQiPgddsvd+BACKYTOl1jbMdB9OusYHzTh0uogku3M2xthQE+Q00hpu+783fA00ZIP281f40vvz/0cwKEBbQPiVli0twjOL5oWGNoW8NR77CBSl2l68OuQfPpsqvTnd4/27Z0Erep83+VzdPdBgOERVujz49mv8cCg0zjpxf2paLIbP3dxSUus1Kd/zUptG8C5etYBd/VkWheDyaqxp95ZCNHpajaEkSavoSgvzmc+2kXWMZjFemZV8XLWkScRapWHeMMSMAoNxTl7MVWQ7sWKAp/W0poztCQLIgQJWpJE6J5V/g5xiH3SEwmFIdwj6v8wYQc6GEw=
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 oj16-20020a056214441000b006869d54c818sm3554263qvb.109.2024.02.05.02.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:20:34 -0800 (PST)
Message-ID: <183d0606-8fbe-4783-bb71-4ec3732a78f3@redhat.com>
Date: Mon, 5 Feb 2024 11:20:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] virtio-iommu: Add an option to define the input
 range width
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, yanghliu@redhat.com
Cc: mst@redhat.com, jasowang@redhat.com
References: <20240201163324.564525-1-eric.auger@redhat.com>
 <20240201163324.564525-2-eric.auger@redhat.com>
 <319bda87-1d7e-40e3-812f-0f9c4d61f357@redhat.com>
In-Reply-To: <319bda87-1d7e-40e3-812f-0f9c4d61f357@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.361,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RuigTlVdwJct

On 2/5/24 10:14, Cédric Le Goater wrote:
> On 2/1/24 17:32, Eric Auger wrote:
>> aw-bits is a new option that allows to set the bit width of
>> the input address range. This value will be used as a default for
>> the device config input_range.end. By default it is set to 64 bits
>> which is the current value.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - Check the aw-bits value is within [32,64]
>> ---
>>   include/hw/virtio/virtio-iommu.h | 1 +
>>   hw/virtio/virtio-iommu.c         | 7 ++++++-
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
>> index 781ebaea8f..5fbe4677c2 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -66,6 +66,7 @@ struct VirtIOIOMMU {
>>       bool boot_bypass;
>>       Notifier machine_done;
>>       bool granule_frozen;
>> +    uint8_t aw_bits;
>>   };
>>   #endif
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index ec2ba11d1d..7870bdbeee 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -1314,7 +1314,11 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>        */
>>       s->config.bypass = s->boot_bypass;
>>       s->config.page_size_mask = qemu_real_host_page_mask();
>> -    s->config.input_range.end = UINT64_MAX;
>> +    if (s->aw_bits < 32 || s->aw_bits > 64) {
>> +        error_setg(errp, "aw-bits must be within [32,64]");
>> +    }
>> +    s->config.input_range.end =
>> +        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;
> 
> 
> This could be simplified :
> 
>    s->config.input_range.end = BIT_ULL(s->aw_bits) - 1;

Forget that. We would need a int28.

Thanks,

C.



> 
> Anyhow,
> 
> 
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> 
> Thanks,
> 
> C.
> 
> 
> 
>>       s->config.domain_range.end = UINT32_MAX;
>>       s->config.probe_size = VIOMMU_PROBE_SIZE;
>> @@ -1525,6 +1529,7 @@ static Property virtio_iommu_properties[] = {
>>       DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>>                        TYPE_PCI_BUS, PCIBus *),
>>       DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
> 

