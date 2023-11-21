Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp678756ejy;
        Tue, 21 Nov 2023 10:29:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr/8lBx3TC33hdF3B4YG9Bqgdj6e2dj3F5hrH6trxE0E9j6yAB0KlA669vqyH1umUbsAbA
X-Received: by 2002:a05:620a:5627:b0:775:6dfb:874b with SMTP id vv7-20020a05620a562700b007756dfb874bmr12170449qkn.51.1700591384823;
        Tue, 21 Nov 2023 10:29:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700591384; cv=none;
        d=google.com; s=arc-20160816;
        b=j5BO7yOjiG2EftBiXXPCuqpVfe7By7Dlsjdp7kwPpuqz8dfUVP2hX9kMaeCZCiVPkP
         QQq/hUqW9Wk/3k8QH9ElZB++NFqf4EMdowt3LNCWtQIs/JfpDgROvE2UdpMUcdSVk2eD
         FyO28XzHmMJnwPinelxYMw5wz2/hVyDr6LLyjihMxyazdbILdBx6dE+6tgO9JeWoSPym
         nWAmKvkQbcdoY1lLsX0DrZwLwvQVzHE4djOkYcFKsIqouM8dPXkPiVCX8Usa+YBF4ugB
         2jDhTPaitpWc07Y/HGrkclu+UesbJJDrzeX3ZjG5snQZxP0gVf2AkqMzQ1wjHS00khAj
         0ETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jJaVI7eFQSumVnEyWm3N6x8y85gR6jqngXrsofoKTB4=;
        fh=NQVDX/oNQNGA1T+ZxY48aI2mkvtdUIqL/7CLR2qKNKA=;
        b=nTnu0XoQ/3aWUiUte0Ncpu+H/4gU3sWmggNUvKKGKB/p9xBJ+p1NyMIL17oTcQ2G0F
         BVFUXBKCy7LCuGqADM5zIMvzyf8iDs/F1N/H8YUgqgYfbRuuf14qTusObD0a8bFHToDN
         T6mnFCoKrncwum6tMX7/CynSqsKupwBR1JB4t0DEYL52Tvg89lCvP1cTRRs/gR09he7/
         o6sZF8Mzj8mmt66vkD3UQ8P7cnaihjgVwSBGDI1HX0iT/kyJNdZgAdH71BnIUILjyKNM
         RXGIwmfrNujGdpc4ciDoMlcgSkWBEImZDWSu6EZpbOEDoX0VfE6OOZs/FAtJW3vPWxn3
         hOqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hioSv4wt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020a05620a004f00b0077d632369c8si60720qkt.172.2023.11.21.10.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 10:29:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hioSv4wt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5VUd-0006iw-FT; Tue, 21 Nov 2023 13:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1r5VUX-0006fQ-Qc
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 13:28:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1r5VUV-0003Ps-MQ
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 13:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700591333;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJaVI7eFQSumVnEyWm3N6x8y85gR6jqngXrsofoKTB4=;
 b=hioSv4wtb4mSUvH3zPkACQ8+pM8RcOQqkYxNV30BmLXy2rLh0jWbtyYePA2H511l7q3Li2
 gk9rDqG6qqmWPe6jZB6DxneRwEd10pUCroj9QurdSzRVwK7+tEe59fe7tgsbRldw82QaQa
 plOvFnRNWksX2S++CjxOE3MJfweTTSA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-X_vRnSh0OdCcXFB4cpEA5w-1; Tue, 21 Nov 2023 13:28:51 -0500
X-MC-Unique: X_vRnSh0OdCcXFB4cpEA5w-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-778a455f975so735413085a.1
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 10:28:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700591331; x=1701196131;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jJaVI7eFQSumVnEyWm3N6x8y85gR6jqngXrsofoKTB4=;
 b=RmMBEX0qY+a3XQyeyonVFHMkHkuRGu8pbFKL4r4t24eS7IGGudejxYTHc11AMkxtt9
 cNzVvaz2BZjL18FPbhxweO8wThtwvJ+txau6EJfYQ+7kXQI8/qHzUwhfpPFUIfLtfVag
 8OwXL95Ir4GuaPnfAoU7ey3/hA65P99hJxUhEDtZlRD5qjqQ+OxC2vdQ3NwiFZYxSD2h
 LzuONuoyIs6K9xuZ1SGmK1iF2uw5QeyjnbAU9lGRXiaTAeKAy2CAEXKqe/36r38ftB1N
 Zpbj4avdQAek6BIJ8M7NrFjyK2IUAVpDYYaOGokvly4A1xbL86ghNOU4dNLZkdTJ5Fvx
 usug==
X-Gm-Message-State: AOJu0YxZgPUGVbnhL/HUZ4BYfBfP7kH6lnn2IQVhG4Jy9ub6YjAt6TrI
 8zfe7paBd0LgM4LaUr0rlzjG1Vac9G0HCe6b2DrVMjt7iVL9KaFkljLhPR/h4iSuO3JOpe1Deuh
 18rT5lJekUyG2
X-Received: by 2002:a05:620a:8e03:b0:778:8da0:a6a2 with SMTP id
 re3-20020a05620a8e0300b007788da0a6a2mr10219341qkn.28.1700591331046; 
 Tue, 21 Nov 2023 10:28:51 -0800 (PST)
X-Received: by 2002:a05:620a:8e03:b0:778:8da0:a6a2 with SMTP id
 re3-20020a05620a8e0300b007788da0a6a2mr10219322qkn.28.1700591330738; 
 Tue, 21 Nov 2023 10:28:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a05620a0d8b00b0076cbcf8ad3bsm3774009qkl.55.2023.11.21.10.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 10:28:50 -0800 (PST)
Message-ID: <4775da43-e188-4d37-b869-a4084cfeaa23@redhat.com>
Date: Tue, 21 Nov 2023 19:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2? 2/6] hw/virtio: Free
 VirtIOIOMMUPCI::vdev.reserved_regions[] on finalize()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org
References: <20231121174051.63038-1-philmd@linaro.org>
 <20231121174051.63038-3-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20231121174051.63038-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: SfyhBB4oqB5u

Hi Phil,

On 11/21/23 18:40, Philippe Mathieu-Daudé wrote:
> Commit 0be6bfac62 ("qdev: Implement variable length array properties")
> added the DEFINE_PROP_ARRAY() macro with the following comment:
>
>   * It is the responsibility of the device deinit code to free the
>   * @_arrayfield memory.
>
> Commit 8077b8e549 added:
>
>   DEFINE_PROP_ARRAY("reserved-regions", VirtIOIOMMUPCI,
>                     vdev.nb_reserved_regions, vdev.reserved_regions,
>                     qdev_prop_reserved_region, ReservedRegion),
>
> but forgot to free the 'vdev.reserved_regions' array. Do it in the
> instance_finalize() handler.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 8077b8e549 ("virtio-iommu-pci: Add array of Interval properties") # v5.1.0+
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/virtio/virtio-iommu-pci.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 9459fbf6ed..cbdfe4c591 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -95,10 +95,18 @@ static void virtio_iommu_pci_instance_init(Object *obj)
>                                  TYPE_VIRTIO_IOMMU);
>  }
>  
> +static void virtio_iommu_pci_instance_finalize(Object *obj)
> +{
> +    VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(obj);
> +
> +    g_free(dev->vdev.prop_resv_regions);
> +}
> +
>  static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
>      .generic_name  = TYPE_VIRTIO_IOMMU_PCI,
>      .instance_size = sizeof(VirtIOIOMMUPCI),
>      .instance_init = virtio_iommu_pci_instance_init,
> +    .instance_finalize = virtio_iommu_pci_instance_finalize,
>      .class_init    = virtio_iommu_pci_class_init,
>  };
>  

