Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp160222ejc;
        Thu, 19 Jan 2023 00:08:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtFkD9dxRQIOls2GXxxJobWuQmIqmomevoK2pOeRLfAqsOAwuDD/z9lS3jLPloIEabNDYO0
X-Received: by 2002:a05:6214:3b01:b0:535:2e85:44f1 with SMTP id nm1-20020a0562143b0100b005352e8544f1mr13230218qvb.43.1674115728310;
        Thu, 19 Jan 2023 00:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674115728; cv=none;
        d=google.com; s=arc-20160816;
        b=QskKm1WBCsTXwgZa1pzybzxR6zljxfONnusJEXr1y648G+cc3EH/c0DNlTXwet8Hle
         M0ctVFBd7zmQKkKvnT8GHcI+JN/Rk/HKk7yYYOYU9lcqkD+1ef211WEdNl54v458WuSS
         gEEIZT2hBCmOtl+up7c+gruyX3Hd39IFqIfbCgwVQLezj6X5PR+5Xxd+JXI6avsSgZmZ
         ay46ZRGcc5CatDs/7PX3PnFARos0kHSqhjod1dbkE3YMo0LSjBBZ/hcgOFFai6wefAy4
         U5zrlcVZwvTfFDu3sYmsuL8T2M4y6QF2otCy0tEA0z70M2RczrKS3mxydy987rmJSYTQ
         L7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tJ/9xHZClFctyMKhjMFBoHIMe6ziuEM5qs/YV83DNd8=;
        b=x8VwT0LTBiAMGSTcni0njqtrRd75guQ89sr3BqMwOpGaQkDdg5TTzt+TODZ4PDRgf9
         bggjQqA77soFDaDs9VS1Acp5ueVizTM4XCi9Ld2O4cWuWBOGBMFMuX8falhk0lV+0P8k
         okI3vg6h+TwI3Siu0qdgk48cfVQcJ5Ls18Av1m02bkuEXzXO2Q9Ez8SwMBjH1GdfDF25
         m3XF0md1kn9WEEKVB0W/pRdHPu9OZgwlIGkmW92UH+MYhjGoFC5wF4LgXBtGxNhcDyVJ
         oUBuKw83R2ufAUUJ8ulaZOyQ/MqzXYFPD6E3BmYFcUwA/uZpthNT7DHbffrNLCuU2W3q
         b8SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IZeeQIED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id fq13-20020a056214258d00b00535433eb047si2616761qvb.341.2023.01.19.00.08.48
        for <alex.bennee@linaro.org>;
        Thu, 19 Jan 2023 00:08:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IZeeQIED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIPvf-0000qM-D6; Thu, 19 Jan 2023 03:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pIPvc-0000pa-Ts
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 03:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pIPvY-0001mz-BJ
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 03:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674115457;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJ/9xHZClFctyMKhjMFBoHIMe6ziuEM5qs/YV83DNd8=;
 b=IZeeQIEDOYre5pLmSM23nXt4/1gq9Y+XFwUKqiEn3UR7RINqPvK/NPqB6vpTw936+mAMvb
 MRHsxPGtSbndaNSbMGc+fvdYunI2ftzmEwM438nwDeJu64IGRfI8kHDhvxaGnXa6oezulm
 7svlwXQ2udpsmd0CjGNCPoPMhaA1CZc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-7ZJ1Q9OLOPO8oDl2YjP77g-1; Thu, 19 Jan 2023 03:04:14 -0500
X-MC-Unique: 7ZJ1Q9OLOPO8oDl2YjP77g-1
Received: by mail-qv1-f72.google.com with SMTP id
 jh2-20020a0562141fc200b004c74bbb0affso617554qvb.21
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 00:04:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJ/9xHZClFctyMKhjMFBoHIMe6ziuEM5qs/YV83DNd8=;
 b=5V0vGZep9YGDQghqBvZvt9sOCbe5A1WCoK2NJRdXxFV7wbIruMHGztowRwoLI022Ou
 wVAWchBdkbK9Hrxe2eTD8sEPexyJqd6N1FnEtsixbEpElqmUp/OVC71WpKzM3/dspSrj
 Hcm92i7k3aSl/5NwwJ6V0MMfZ/3wmMnVlV6wWJfTH4dyy1xOOvyvPa7OqKsPom2jpon0
 nUcIfOm6opAjCCRQoIt39o2A+QWfkNw95JuXv8PzTnm8xz2yr6hbbRQ50RbkG22dz+0+
 sSOSaG7By5xfsoBkkaVMv63wg5a5GfmHyQ140xfDMw7qp9QyzYljB6VuEeXdx+i84evQ
 G4CA==
X-Gm-Message-State: AFqh2koXDOuog52KlYZg6iRpGAfMN1gB5bWJAXb6Mv2YPorSpYujTYeK
 GoyoznoRrRoZqxidXpMkPAOqQotPI5oY191RMOtBrF3zkg7Z6r2YV6JEXXCjGnKR0lbU+gVEv4D
 sm4eB/lUNbm3X
X-Received: by 2002:ac8:44a7:0:b0:3b1:54da:d629 with SMTP id
 a7-20020ac844a7000000b003b154dad629mr12762037qto.34.1674115453799; 
 Thu, 19 Jan 2023 00:04:13 -0800 (PST)
X-Received: by 2002:ac8:44a7:0:b0:3b1:54da:d629 with SMTP id
 a7-20020ac844a7000000b003b154dad629mr12762004qto.34.1674115453498; 
 Thu, 19 Jan 2023 00:04:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e25-20020ac86719000000b003b2d890752dsm3228569qtp.88.2023.01.19.00.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 00:04:12 -0800 (PST)
Message-ID: <692489e7-6ed3-4bd7-9813-0d320f4f5be9@redhat.com>
Date: Thu, 19 Jan 2023 09:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] hw: Use TYPE_PCI_BUS definition where appropriate
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230117193014.83502-1-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230117193014.83502-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gwK0OlJuqSvm

Hi Philippe,

On 1/17/23 20:30, Philippe Mathieu-Daudé wrote:
> Use the proper QOM type definition instead of magic string.
> This also helps during eventual refactor while using git-grep.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmu-common.c     | 3 ++-
>  hw/virtio/virtio-iommu.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 54186f31cb..733c964778 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -535,7 +535,8 @@ static void smmu_base_reset_hold(Object *obj)
>  
>  static Property smmu_dev_properties[] = {
>      DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
> -    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus, "PCI", PCIBus *),
> +    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
> +                     TYPE_PCI_BUS, PCIBus *),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 23c470977e..1cd258135d 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1366,7 +1366,8 @@ static const VMStateDescription vmstate_virtio_iommu = {
>  };
>  
>  static Property virtio_iommu_properties[] = {
> -    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
> +    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
> +                     TYPE_PCI_BUS, PCIBus *),
>      DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };

