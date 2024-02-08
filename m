Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp914371eji;
        Thu, 8 Feb 2024 00:17:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEClWwfQTW8fKcXat1FGHRlzTrURkAhHmeJE9MH2JRHYIClDyi+qZ0xiTMlst24sgnGWUXa
X-Received: by 2002:ac8:4509:0:b0:42a:4662:48c8 with SMTP id q9-20020ac84509000000b0042a466248c8mr6315810qtn.63.1707380222299;
        Thu, 08 Feb 2024 00:17:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707380222; cv=none;
        d=google.com; s=arc-20160816;
        b=e0tTX13xPCIuupNGnUe5+HvDeBUjrZ9SHWwqEYdFaef39JytwjWwdSIteQEz+WWaux
         ZLHktVOh5YGJbiyP2y3ev8thjvjc+KZvTCrpCUFNW4TYmo02BipM00egAgd8gqdD3KTp
         PslafwgG0apDlPTB6qgTSCPt980jPT0t/EfRiGZJWZtF2rz/OfkAkXj6u08awShvlkru
         s0ho9PZDzLf++MizKvaOLH4mRLZfacHsVWJeFCzWFu/JirF/Z3fs7yw5lEwqbw+tjwP2
         P3QIsR5lHyoMZdfYq4v4EF5IetOqKIE4E6ruOQ0vn10EVpHxPI8Sob0LIVt8xALGvPuz
         NxbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CNFhr0w3eENUWizh5QT/Cx/sdgdBCpB/dUJcwMwp9Yg=;
        fh=j5RCzbEgZ26Ab9N8Feb6WL7PNB0x2P9j9kPRBG+Dx58=;
        b=FziyOT25q+js77TuDBxohAfcSkT2MeTsHAPat+5UZFNSJWrPuaWQSyHDkBtedRiP6Y
         vvn9UjKijt2xrN82UL1+ijY67h/5go4No3nyRgHegIyzLchZ7DAl9sD4PeV9LwNDZJ9k
         +eaAYV3h8NHE/vgEAaBAKe8fTG6vh3XgAeY3UAUKo81o0Yt5R5pMAC7lqZdAw4nOxq2L
         j3VD1QrYtzYg8Nrgdzvt3IWS8/rMpm1ectB5dtOk524OmyUeGsdKI1p0v+uwztnPOmjk
         1NXys3hwx410uFRl1v8Xyka0TAEt3coviUbLYE0sJaRpnU8oIlTgfMeAFhb2ia3+Efir
         TPqg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dkPd9l3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCU8H1ZUq7DH3AtCQOusSLtd/IAXBY/yK8II7wxhE5aImk0ZKnOA2bI9Xi4dDlTsv2Z0znqchbhwdooJwmlELh7gD5WAe3ke
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a05622a058a00b0042c3446590esi2739816qtb.499.2024.02.08.00.17.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 00:17:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dkPd9l3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXzaS-0003EN-GQ; Thu, 08 Feb 2024 03:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rXzaR-0003E2-5C
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 03:16:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rXzaP-0004uW-M1
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 03:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707380203;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CNFhr0w3eENUWizh5QT/Cx/sdgdBCpB/dUJcwMwp9Yg=;
 b=dkPd9l3YzRaYgRaE+OUrpJN/hr+a6nAenbeUhFhiXNkNi5mJ8Nsw/rMM9bWlADCiaYCQti
 MfUUSQTPIeBEyYtpYGqzDkjD7sIuJfDCDJhpDdpBPmVU2kAtYXkodf7LIYcLsq/fi/Soju
 pIPYh9YwJdOeRRMfZwrMk2RH7Ei9pQY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-Vtdp9U_aPHOVp2Zok5eqEA-1; Thu, 08 Feb 2024 03:16:40 -0500
X-MC-Unique: Vtdp9U_aPHOVp2Zok5eqEA-1
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-7d643835a00so693147241.2
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 00:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707380200; x=1707985000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CNFhr0w3eENUWizh5QT/Cx/sdgdBCpB/dUJcwMwp9Yg=;
 b=FMCqy2X0/nQMBqSo8KKnrmis+tncmrJotYog/isjpPKLm/F2fHYWeuIwReRy0SPNwS
 WstsIXp5rIY7UDWPkVRzAuF0TwwDB7VyXko5AxXBHI5Puwmwq6UpjSOCzbYPKz53ftfh
 pAU1x+WhElAPxmdHi+s7Ahf7C0Fb9BPPkUol9NvmGeUyOU5T+SrumZHD4pWg5OfK/RlV
 JAZVE4m/1kQx1hyVFtNHg+Xn298tlM0j/r1665OzApZL71rh81kBnr6kefbkf/G1vQYs
 lgYJjrziCZrsWSN3AW6bEt2fHqanyAe7k4oCOHGERd2ETbZdN3zezVERojSiRgxZABJo
 sjJQ==
X-Gm-Message-State: AOJu0YyZswQnjvHGnQssApXvU4zTan6rkcxSRrPkzLRnYX16/X42LzDA
 lWNyiwMS5Fg3JPXtS/l2xkrU9jS9tZw+tIQk2rGNCr5gLBtEBDlcpCs0rSTGAZomV1iP6Z0H25Y
 ArgIrbli25Dj5KbSZJAKlQgxImwJQwDrGurDzwOxBIHGHGuCfwA==
X-Received: by 2002:a67:ff9a:0:b0:46b:303d:471a with SMTP id
 v26-20020a67ff9a000000b0046b303d471amr5281424vsq.31.1707380199871; 
 Thu, 08 Feb 2024 00:16:39 -0800 (PST)
X-Received: by 2002:a67:ff9a:0:b0:46b:303d:471a with SMTP id
 v26-20020a67ff9a000000b0046b303d471amr5281412vsq.31.1707380199492; 
 Thu, 08 Feb 2024 00:16:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYDWEveP5G16Wt1GBcCHuFkoTVzS0+8jJ+fghFnEE3lTwSRSWW7xGko9RZ4dPmNf7dLM9E1P+uFLe6/J1FC/ccO/dzH8PV8MTDvPKyQY4lqEzGI60/54fHi7jC8ticK5AGWXhGDYNh/VN55JpuSsatO6cWfZnjAsx4HStli4UEZd5iPKT8bdyq/CZrXypZNiefjXteutQKkqC8FznKr9GCxCWoQFmDf3FEa/OeGSAZUdC/JDs2n/d4dwodKMjgGhC4WWbgHrXbEIEMuyhMBXVMQWUXl/Bf7nqTdIWw9rArRlx/xwibrYJ/hTmqCP6o3xowGFL6
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 mb10-20020a056214550a00b0068cbfb3df1fsm1174901qvb.97.2024.02.08.00.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 00:16:38 -0800 (PST)
Message-ID: <1790d917-9360-4ce4-b1ad-aba9b72bc418@redhat.com>
Date: Thu, 8 Feb 2024 09:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] virtio-iommu: Add an option to define the input
 range width
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, yanghliu@redhat.com, mst@redhat.com,
 clg@redhat.com, jasowang@redhat.com
References: <20240201163324.564525-1-eric.auger@redhat.com>
 <20240201163324.564525-2-eric.auger@redhat.com>
 <20240205101322.GA2086490@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240205101322.GA2086490@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.106,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4UXVVswD7BmM

Hi Jean,

On 2/5/24 11:13, Jean-Philippe Brucker wrote:
> Hi Eric,
>
> On Thu, Feb 01, 2024 at 05:32:22PM +0100, Eric Auger wrote:
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
>>  include/hw/virtio/virtio-iommu.h | 1 +
>>  hw/virtio/virtio-iommu.c         | 7 ++++++-
>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
>> index 781ebaea8f..5fbe4677c2 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -66,6 +66,7 @@ struct VirtIOIOMMU {
>>      bool boot_bypass;
>>      Notifier machine_done;
>>      bool granule_frozen;
>> +    uint8_t aw_bits;
>>  };
>>  
>>  #endif
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index ec2ba11d1d..7870bdbeee 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -1314,7 +1314,11 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>       */
>>      s->config.bypass = s->boot_bypass;
>>      s->config.page_size_mask = qemu_real_host_page_mask();
>> -    s->config.input_range.end = UINT64_MAX;
>> +    if (s->aw_bits < 32 || s->aw_bits > 64) {
> I'm wondering if we should lower this to 16 bits, just to support all
> possible host SMMU configurations (the smallest address space configurable
> with T0SZ is 25-bit, or 16-bit with the STT extension).
Is it a valid use case case to assign host devices protected by
virtio-iommu with a physical SMMU featuring Small Translation Table?
It leaves 64kB IOVA space only. Besides in the spec, it is wriiten the
min T0SZ can even be 12.

"The minimum valid value is 16 unless all of the following also hold, in
which case the minimum permitted
value is 12:
– SMMUv3.1 or later is supported.
– SMMU_IDR5.VAX indicates support for 52-bit Vas.
– The corresponding CD.TGx selects a 64KB granule.
"

At the moment I would prefer to stick to the limit suggested by Alex
which looks also sensible for other archs whereas 16 doesn't.

Thanks

Eric
>
> Thanks,
> Jean
>
>> +        error_setg(errp, "aw-bits must be within [32,64]");
>> +    }
>> +    s->config.input_range.end =
>> +        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;
>>      s->config.domain_range.end = UINT32_MAX;
>>      s->config.probe_size = VIOMMU_PROBE_SIZE;
>>  
>> @@ -1525,6 +1529,7 @@ static Property virtio_iommu_properties[] = {
>>      DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>>                       TYPE_PCI_BUS, PCIBus *),
>>      DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> -- 
>> 2.41.0
>>

