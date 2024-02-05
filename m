Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1237183ejb;
        Mon, 5 Feb 2024 08:24:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIa5WnpvdBqEChAjrNh2ioYC+0qlhjGBcnFNmCMGVKmE275YybZjIOiI9C0yxhCDWvnYGU
X-Received: by 2002:ac8:5807:0:b0:42c:7da:9bee with SMTP id g7-20020ac85807000000b0042c07da9beemr7449508qtg.22.1707150253657;
        Mon, 05 Feb 2024 08:24:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707150253; cv=none;
        d=google.com; s=arc-20160816;
        b=NaZt3geAM3eul1sS8/+t1brpexorEJOcXGeXIGJIv9zP6HRUmgsxcYeVaIz3wpyE9V
         E6gJc+ZXB7B1jyDCEbNqHdYJZ7/rxHNtttJJP526yIshQ8V+88v794E5eLHEXfWmoRMR
         DDSoBZ5Yy4jkl+DYpBGSQAF3o1FG+Y1s+BQ8YGii+/RS0GgLGWfW9CB+rjSeh979AZt/
         IYZgzJq/5XjfmnYugfndGKzlpb4AIFw62KZWG6V+ZOqFJk2auR0ADpM3GSMKkQ9jFdLt
         A4tKvaEdLei9f/WuYnoq/jWK8+/2OdhPa6uD+/f/8vJ/VuNpjcdyzESFQ7CNy2tGnajM
         C8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UVUzUhq1mlN9+ApWt8fAm937WttibYcQ3x62aI1sh8Y=;
        fh=wkjAZZRVIbuM0fK36O7OqN95bGACuJAI82LrThyKkyw=;
        b=YYC+Qy2VbHHkVoDQvJOzjHy/rLMDZytIxM4Q1hHVBDjqfp33GSfMwozU1ZBzr6EHq9
         coooxWRzBd1b5X7TJsUKWENwXei66uEzX8o7nR5ovoJFyxrTG4xsQPX2HvTNt04z2Syh
         AOKPqGXEkkBHUs1a+BRv/JWxLNAVnmroRIxbk6mAwrB1HLi43ZjuUQx8T3zf+HJK7Li6
         ILbj1wIHedvho7dTJBHLjnIbu+jWYeZrBkUUhUKesTaid1xEJw160m2Vj0BwfKauasTv
         X1HIys6NEcxDDqaY1Dr8dMM/+iqQH1PBkET8cKBbL0p5N7nAViBsQB+G63XhZkY9Mjck
         tyiA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Udh8gtb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCV3JHb4jLuuWA4o8aGK91z4ydh1c/L+N8QROdG5mQeGoHpDWVUztIa3T+MQaRF6K2bq01hCqCRW7sqidURhFtKCJ+48RWeB
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020a05622a14cf00b0042c1258cedesi168149qtx.547.2024.02.05.08.24.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 08:24:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Udh8gtb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rX1kx-0005Wq-H7; Mon, 05 Feb 2024 11:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rX1kv-0005WL-9c
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 11:23:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rX1ks-0000Qo-2g
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 11:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707150212;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVUzUhq1mlN9+ApWt8fAm937WttibYcQ3x62aI1sh8Y=;
 b=Udh8gtb5uJiws87G0VUmvceQcSE8VmktxzJ6mCNMq83IDh8lhl3W8VFM4PLRSrdKwRzTL0
 UKMrWqVEIJmaUzzJ0UF6G0CACeeAQ5bsUX+BHlBSwwvsmtU0044rgc/Vhwc+GuJT1ZIjAy
 L4xjWiBP4J8+tkMA9WKD1TBmLE7KJ6M=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-oqo7VwjSMZ6vIgOley62GQ-1; Mon, 05 Feb 2024 11:23:31 -0500
X-MC-Unique: oqo7VwjSMZ6vIgOley62GQ-1
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-46d3a2ac07aso126182137.0
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 08:23:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707150210; x=1707755010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UVUzUhq1mlN9+ApWt8fAm937WttibYcQ3x62aI1sh8Y=;
 b=l7KrBt59fydJ4tUq6DEpeFPNrhPVArUgzk9E9HX0iL/8hEqYCGdX1dP1NsBTJClLHy
 2wj7lCmJww0/2OxjQVUKycnIKvZfCxI8jYT9gyedRP3v6VN9TvFT13TreMv4+xv7yA5Y
 hEt07TIntCPwOKF1y4J6VXLauPmhtwx5uh39V3Y5aXt/B/chws3MxHxaC8Eloboq24lp
 0oFVCPFKa8PYvUB4CeIKl0jE8hyrYoteNs9gUT0kwQkAcnCSSb6jFP+jOwtmfIW3iA+g
 P1zfSOLXkfEWV9VXE6DgaU2oPh1sQ5HFn/96bqTPbv5j9VjzSmpj699//B3+c2km+g5b
 ehsA==
X-Gm-Message-State: AOJu0Yw4i2YfRNS2rvEhsZ7LRXJnWZpFbr7UleM8yZBeKBUrhy4aXm0l
 mSrMfAzAqkxJTigN2gwISwXuac63ifhTX0cQ7US3jkc6sYDuqiELT5fs//3VKGkmM2T9SKTkth9
 66z0yDzsOQ0mgT3h7DN54Uz7oP+PFqYuMGvfOqez0+/sXi1thbg==
X-Received: by 2002:a05:6102:34e3:b0:46d:238b:7b5e with SMTP id
 bi3-20020a05610234e300b0046d238b7b5emr367973vsb.0.1707150210659; 
 Mon, 05 Feb 2024 08:23:30 -0800 (PST)
X-Received: by 2002:a05:6102:34e3:b0:46d:238b:7b5e with SMTP id
 bi3-20020a05610234e300b0046d238b7b5emr367946vsb.0.1707150210348; 
 Mon, 05 Feb 2024 08:23:30 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXsVaHsdJfNi+Cg71oYIhYjE+4RFgkOymurVRQPyHJRwqsoHhwYfsQqtH8PnyN+uYWbzjJ/X4zcwPZJDORKWZr7Qwde9ADvkWhuTCokk1Ys4Ky8awM/8Y2YPtlAT+i+nN6qFS60CxLlGZazfNZxKl0CDfiDd+IZdIU1p3LqVDLT/hYQ1TlstSDV/rfRSMWxkKiji5sGfS4KOfvrMFtJgegL4eYxVSio2lo2YPfarFc/eTOAldSzCBJZpQnwAtyhvHBUkLNp0TDCUKrBF9XkhS+rgqp4xcaM0d/OLaE/eeshp31tFhbNov1sQg8U4CHEGOmavj9o
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a0cf514000000b0068c440bc7d0sm109511qvm.105.2024.02.05.08.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 08:23:29 -0800 (PST)
Message-ID: <e5c70c36-d309-4a28-8649-67cfb701dd4c@redhat.com>
Date: Mon, 5 Feb 2024 17:23:25 +0100
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
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.285,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: htbJFqlfMNOy

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
I have no objection relaxing that check. Alex suggested this 32b low
limit with his knowledge of x86. I am a bit reluctant to add extra
machine specific checks though. Anyway I assume that some [low] aw-bits
will fail with some guests and this will be difficult to understand from
bug reports.

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

