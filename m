Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7599C83F22
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 06:27:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubZ7E-00012G-GO; Tue, 15 Jul 2025 02:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ubZ6e-0000ol-NA
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 02:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ubZ6c-0000cz-EM
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 02:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752560731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yR/K0TjaSYqVLdfMq4Fj7MwBfiK3n2HzM07tqV/zxL4=;
 b=iQAN71VawmcZ7YCzVO7U1wGjCNdx/LNDedRti102C+FVeyzID5qls+BsthzF7Az6fsko8a
 EET7E6rFFPV4tEQXIZIblcvOoMYSK1zskDl6vP/RFakdcikdDCT7JNVhSLQS9oB910lrQ9
 MuSzEf/+HBzux93NO06jnvTFi2ITjdc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-D65SK9YmPy2GaEXw9s3G9w-1; Tue, 15 Jul 2025 02:25:27 -0400
X-MC-Unique: D65SK9YmPy2GaEXw9s3G9w-1
X-Mimecast-MFC-AGG-ID: D65SK9YmPy2GaEXw9s3G9w_1752560727
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f7ebfd00so1996525f8f.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 23:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752560726; x=1753165526;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yR/K0TjaSYqVLdfMq4Fj7MwBfiK3n2HzM07tqV/zxL4=;
 b=Q5+2be2z/peHrLQQ7dv7TRTMPAOG4O3vl7GNT3nTIsPem2OlbQXRf+WCK+jdrmYRlV
 HllMD/XUixA1xrh29QryUk0GqTNDTOnDTjv3AYlCbpiqJQTOjpe+CAZpGSm2sBf+U1qk
 v6tkbnLaySuLoiGwX/ROszhU1a8dgbkJ8F3wh9g2M3RY3Cqe2kQE3n+QqiykMIJDfF/Z
 WHYhWMCOnz5OTxpZ0r6cTuAcqGBnwzhjTvZiTZSqGQArOi9eAsQReJyVV+2M0LU8qG37
 iBHAHoe6m+nEXLnYasX1zT++74x8DEuAw8RYu1Q1DAGWCFZs6THTlE/SqbmTFw/dgfeP
 yApA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEelTkhC3S6Id/XXB1tR77OUbUqnSU1VAhdV1vHCcrGPBHueqUZzAM3Fne5fYu7fGkr67buq6TKw==@nongnu.org
X-Gm-Message-State: AOJu0YxPmH4l77mc5jWfnZqXsBYo33noFN/MoAQsDhDYitbVKAcqGYjt
 7RDhXJ8wUi7AOqStwKOb1A7I1mr5daWzrLiSEJXr3ER7XTSokArvnL+1+6Wt/bZ9J4meJLbH83Q
 MZQIP14OYXjgeJnNIb7YmkbkBuV3E5omVL9vG0zOfYdYfdgZGqZ+56A==
X-Gm-Gg: ASbGnctRaco2/x1dTKA+hCI1wPcdWARkgb8w+HkOYMKtImPXjZJO4FGeN9rJc1rDLrO
 IMNhPFZlADWwPxw9zA75TvpDJQkmFSwGDkpmRvEF0vDY+uJifHPrniQIAmH2cCzvN1/oU6c0IOf
 smamShlZ9Q8X85Sn71nw7W0aoyefxsn3E+6dOYww2ezQxoJYN7cf9/QHjRLTASo1/U06PNeTLEH
 0UR5z0gaChAY9Ejixr2OhyqKmN4DaR+cEFf5OzrjJUfhqdAR4OzYyk/+rUsosSg8RWOHWhv6oJM
 B9BLlwM92bPo7pCUAyliZnxKSUMdGYTUHkOpwAN4LIqrAwtNMY9IeIZxb4yBATOiQYVuUgDZ3TQ
 =
X-Received: by 2002:a5d:6f01:0:b0:3b6:463:d85d with SMTP id
 ffacd0b85a97d-3b60463d8eemr5033527f8f.11.1752560726543; 
 Mon, 14 Jul 2025 23:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7pnWKKZo0XadlBciO2eczrCLrFIuhvCJ/23pHyIOKKp4B+rQ6Zsf/3vS4w8T4o9bvmoYKNA==
X-Received: by 2002:a5d:6f01:0:b0:3b6:463:d85d with SMTP id
 ffacd0b85a97d-3b60463d8eemr5033514f8f.11.1752560726173; 
 Mon, 14 Jul 2025 23:25:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:165:d60:266c:b13b:afd7:40fd?
 ([2a01:e0a:165:d60:266c:b13b:afd7:40fd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e2710bsm14213882f8f.99.2025.07.14.23.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 23:25:25 -0700 (PDT)
Message-ID: <ef3f739d-5cda-4078-a5eb-ca6632d5e92e@redhat.com>
Date: Tue, 15 Jul 2025 08:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vfio, migration: save device parent pci config
To: Huaitong Han <oenhan@gmail.com>, mst@redhat.com
Cc: mjt@tls.msk.ru, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Huguanshen Chen <chenhgs@chinatelecom.cn>,
 Heng Zhang <zhangh121@chinatelecom.cn>, Huaitong Han
 <hanht2@chinatelecom.cn>, "'qemu-arm@nongnu.org'" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Levon <john.levon@nutanix.com>
References: <20250605083338.1845911-1-chenhgs@chinatelecom.cn>
 <238cce11-3050-4ec8-acbd-b1605f9dc4a1@tls.msk.ru>
 <CAAuJbe+dNpdA62CjfQfGq0Ph72w+Nooyax=WdRuYCRTPRngvxg@mail.gmail.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <CAAuJbe+dNpdA62CjfQfGq0Ph72w+Nooyax=WdRuYCRTPRngvxg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mGLWc3jCdRPB_Bxp8sQEoKF4Q0NlwhUZcLXJe_VsbR0_1752560727
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/14/25 04:37, Huaitong Han wrote:
> Hi, mst, clg
> 
> Any comments?


Since this seems to be a GIC issue on the aarch64 virt platform, you
should cc: the virt-arm people for more insights.

Also, the vfio-user devices have been merged very recently, ~1w ago,
and, AFAICT, migration is not supported. Are you testing against the
master QEMU branch ? Adding John in cc: nevertheless.

Thanks,

C.



> Thanks.
> Huaitong Han
> 
> Michael Tokarev <mjt@tls.msk.ru> 于2025年7月13日周日 17:12写道：
> 
>>
>> Ping?  Has this been forgotten?
>>
>> Thanks,
>>
>> /mjt
>>
>> On 05.06.2025 11:33, oenhan@gmail.com wrote:
>>> From: Huguanshen Chen <chenhgs@chinatelecom.cn>
>>>
>>> On arm64 virtualization platform, vfio-user devices lose their interrupts after
>>> migration to the destination. This issue occurs because qemu fails to deliver
>>> the msi device id to the vGIC. The error device id is calculated based on the
>>> device's parent bus, so it is essential to save the parent pci config to
>>> prevent this issue.
>>>
>>> Backtrace:
>>> QEMU:
>>>    #0 qdev_get_parent_bus
>>>    #1 pci_dev_bus_num
>>>    #2 pci_req_id_cache_extract
>>>    #3 pci_requester_id
>>>    #4 kvm_irqchip_update_msi_route delivers 0(error id) to vGIC
>>>
>>> KVM:
>>>    #0 find_its_device returns error
>>>    #1 find_ite
>>>    #2 vgic_its_resolve_lpi
>>>    #3 vgic_its_trigger_msi
>>>    #4 vgic_its_inject_msi
>>>    #5 kvm_set_msi
>>>    #6 kvm_send_userspace_msi
>>>
>>> Reported-by: Heng Zhang <zhangh121@chinatelecom.cn>
>>> Signed-off-by: Huguanshen Chen <chenhgs@chinatelecom.cn>
>>> Signed-off-by: Huaitong Han <hanht2@chinatelecom.cn>
>>> ---
>>>    hw/vfio/pci.c | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>> index a1bfdfe375..442113d0b7 100644
>> ...
> 


