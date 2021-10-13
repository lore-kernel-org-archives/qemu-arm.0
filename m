Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2886620lfc;
        Wed, 13 Oct 2021 05:42:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAlo2K7mKCWHTJw+SGkOM1bMKk++WexaBVqTQkxN/V5UzBiiNqRsmdTMeautB/VAuhA5F6
X-Received: by 2002:a05:6102:c0f:: with SMTP id x15mr10064231vss.57.1634128951691;
        Wed, 13 Oct 2021 05:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634128951; cv=none;
        d=google.com; s=arc-20160816;
        b=vHf8skt89q42f3yxClJd4cgqHBhjFiGOqrMYeaN5//Fyw9xDpimmZccUoH0fZg0i9s
         yFsqcqZQ1DSohpBeSrmwq3ZAP0AqO625YpADB0ZnjxKhDb7cJZxCbdkYh21bO/TjjJge
         EBnYeAxYygCM/c8WpPuX2G8kj/YaJEF9nWc1i9AqDOTvORWdHCipG+HfRKIBNyZKx5Cn
         0Ktv6Bw0zBUceMGYWJUSy93xCqC5xCfLNUpHt+9LJBVWouiD+KCA8klsmcmDSQQaDu51
         EEDuJXqpihkbHavmUeVhqz7MnL/veDgqwTjoZW219zJqFAxGvh+9cDAD0M4Vyo/JivvY
         3fYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QyCjUnibHz0gJpWw8DugJ/HG/yze4my/LczsFtyJ8/E=;
        b=kJmvJPPEtGz5Kr/nw4WSzh3xkfBLcq3co2E6wOrQG2SMaR37POGE1HgofX5X6JPSpm
         h5beulmp2RpI5O71w58mKkauIDgkd41w5lb0uavaIPXQtij/kILkXomMbbeYEmHm3riw
         dRFHebzEOsj56Iomh6FBrFmXfvnbQNs20kWS2IlXJKiLlNTUbnfYCWXS+J9RNKWxL9CM
         ehn3QR7Mz+vTUil9X6lVyIoC5qrH2SsDIJ7AGEMM3IBHVGPLYlZyjv7tLp4omyzo/Hox
         dJW4YL94AMl4KPbFGeq59+xFeJw9f2i6IAMKGoxdxFgbftW0iIwD8O93qTeOnz+jf3KB
         9FgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GA9g2Lww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si6207961vsj.374.2021.10.13.05.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 05:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GA9g2Lww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1madaZ-0000DH-04
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 08:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1madaE-0000AM-H3
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 08:42:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1madaC-0006xn-Bu
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 08:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634128927;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QyCjUnibHz0gJpWw8DugJ/HG/yze4my/LczsFtyJ8/E=;
 b=GA9g2LwwLTEwLtZink94ZZWXEz5g+P0qV2RkPdD7A+CQs/gaBaRclLpC90VTjU0WKFdwcn
 V3Xer474/7BiUtU4XbFFcEv6jnp3Nx2udUsbV/drY9y0T5su7CMrCSIDnGD9vX8fokwzA8
 mL48ZrzSO8Aktgi+8eTKUtxin0zAeBE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-hLrNgtQsOn-rJkbUDWnHog-1; Wed, 13 Oct 2021 08:42:06 -0400
X-MC-Unique: hLrNgtQsOn-rJkbUDWnHog-1
Received: by mail-wr1-f71.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so1879812wrd.8
 for <qemu-arm@nongnu.org>; Wed, 13 Oct 2021 05:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=QyCjUnibHz0gJpWw8DugJ/HG/yze4my/LczsFtyJ8/E=;
 b=p3QsW/DPC5JFlS5iJ1tWj4M5okRy5+p9ZiMputakehLS2faxP4PPtWuvk+WrhMbJg0
 TN1jajWa2Qt3m68rAyxd1rireW5CLdOdU0M1OiWs9y5JZ+iOLNkhV+WB4O4+TvlWrcub
 mLytBjbvqp4RcaCJYZQ5n9JCrtSf+eXV5TrFQXWbEpr854ZgI/YlvXpz3N0iWUhtDL9Z
 ZK24/vduIDsqmcCBnyv8oanvgGBYAST6afjjzFF7HHohB51+D+oHVJFqHTJOkI/taqh3
 iT/ejQn8qTITtIjH5scCRsfSb0nZvSfO8TJmTr44PSGmSHjs6ukapUvpNJw1CmXvbt2G
 eWOA==
X-Gm-Message-State: AOAM532M6omNiIT21RhBBVAg+XvMD+x/fB24ZvmhiiwjxfcjnNOgHDY3
 dsQ0Qu7gnAiNmI1F05iDLYulMJVcVDxGoQqpigFmX3RrllGstZ3Sor042VeIe+AtHnTNZE/Afsr
 jaOyCZ7DLY3N1
X-Received: by 2002:a1c:a302:: with SMTP id m2mr12579329wme.111.1634128924851; 
 Wed, 13 Oct 2021 05:42:04 -0700 (PDT)
X-Received: by 2002:a1c:a302:: with SMTP id m2mr12579293wme.111.1634128924598; 
 Wed, 13 Oct 2021 05:42:04 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id j13sm4164651wro.97.2021.10.13.05.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 05:42:04 -0700 (PDT)
Subject: Re: [PATCH] virtio-iommu: Remove non transitional name
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 peter.maydell@linaro.org
References: <20211013095554.758806-1-eric.auger@redhat.com>
 <875yu1w74z.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <ddf10477-6c70-748e-6bfd-4a5498c1e7e3@redhat.com>
Date: Wed, 13 Oct 2021 14:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <875yu1w74z.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: jean-philippe@linaro.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N/brbylYNcp3

Hi Connie,

On 10/13/21 12:28 PM, Cornelia Huck wrote:
> On Wed, Oct 13 2021, Eric Auger <eric.auger@redhat.com> wrote:
>
>> Remove non transitional name for virtio iommu. Like other
>> devices introduced after 1.0 spec, the virtio-iommu does
>> not need it.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Andrea Bolognani <abologna@redhat.com>
>> ---
>>  hw/virtio/virtio-iommu-pci.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
>> index 770c286be7..86fa4e6c28 100644
>> --- a/hw/virtio/virtio-iommu-pci.c
>> +++ b/hw/virtio/virtio-iommu-pci.c
>> @@ -100,7 +100,6 @@ static void virtio_iommu_pci_instance_init(Object *obj)
>>  static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
>>      .base_name             = TYPE_VIRTIO_IOMMU_PCI,
>>      .generic_name          = "virtio-iommu-pci",
>> -    .non_transitional_name = "virtio-iommu-pci-non-transitional",
>>      .instance_size = sizeof(VirtIOIOMMUPCI),
>>      .instance_init = virtio_iommu_pci_instance_init,
>>      .class_init    = virtio_iommu_pci_class_init,
> No objections, but I'm a bit confused regarding base_name and
> generic_name here. Can you drop base_name, re-define
> TYPE_VIRTIO_IOMMU_PCI to "virtio-iommu-pci", and switch generic_name
> over to it? I think that would be more in line with other modern-only
> devices. AFAICS, the places using the #define should continue to work.
>
Sure, this all makes sense to me.

Thanks!

Eric

