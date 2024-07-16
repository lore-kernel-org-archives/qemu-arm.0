Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp179266njk;
        Tue, 16 Jul 2024 06:37:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWljrhzGMTrv/J6Nj2b8zAW7oc3H3V85PcOPvjQwAzIBVcD40EXeEwb39RPWkeIvrY29r9DzyfG2TbWED1HNiEgzaIp9R4H
X-Google-Smtp-Source: AGHT+IGABPaep4AjiRZt2Vs0UB1F8Qzre27a2KMqZ4yubmhUOUG9VIiFbFwVroHVq6H/RV0f6d8j
X-Received: by 2002:a05:620a:4442:b0:79e:fb20:e116 with SMTP id af79cd13be357-7a17b722ee3mr282889685a.61.1721137019872;
        Tue, 16 Jul 2024 06:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721137019; cv=none;
        d=google.com; s=arc-20160816;
        b=ll+Qu09+rZZtkDHbaaEfoZKQwRjk1p9+5p2Z77kPoaYOliUUWK/x8Phd65xtxFtO/0
         LyI1JsggvcUGb2XqxIF8ASvmSRBkfWB5QahAe098bSCSs73AWqaiyNS0yjIoXZm2K+T3
         w4asuSvIxoLjHh50a+scA9Qt/y/sy8nU6/2fVbhnP26rurbMHGjWDXEwa4y/rQhZLqKZ
         EAU0s3Xao9u/Ka8XATu3BN1GgZSkKJ76qkLqgak8dmA/WU3p9UXP0HE9NNQmP0V2lQT8
         Pepk7sYXs/+2f+bVaz0Wel/3ivpna1aioHjRNOaOYThaMAhqT6Gee+bSKKz+t9RMDM1V
         ua9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5PQS67yb2p+iDG1xlm1ssI9cGEhRrPcmsYof73n10AA=;
        fh=W9M9mKkK1oKFOl7HtPtRTC7PxrzbRSSP85jR3haG7ZM=;
        b=0VtlZx0g0Z//YA7kvekmVQOx/ViKJpBwcf0Xs60kxAD5DgR9KrEHkLuA/vD058Pmi2
         koJevI2TSE7T5fUjBT5FFQo2+oTTQQVM1xtI5XzSyaRFUEO1Y5wybMk1UgJwmAX9LVar
         Nz618UA2TbtryeizBKrQ/wBXhJ2v+3Dw27l3RgeB5OLEVHAshmLIxjRG7B3ih1hQGSC6
         /jFfQPwI+FnniRS5LhngxQtJkhur1g6l8WLJqAuoWIabhq2VNHBP2v1C30MIpWyuPvg1
         jtGulOmkCAQy1jQhpZ38R9brww2j/vfBtvA1NxDx1SODu1NW0YafivR9Tsb0Gcr024D2
         eHKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frxoUhdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c498e2si736012385a.246.2024.07.16.06.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 06:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frxoUhdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTiMU-0001em-GL; Tue, 16 Jul 2024 09:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTiMK-0000ua-Ah
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 09:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTiMI-0005ns-MV
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 09:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721137005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PQS67yb2p+iDG1xlm1ssI9cGEhRrPcmsYof73n10AA=;
 b=frxoUhdnmddh1Sp3LKBYMoA5ivrR7acQexhCTy2ozd0lHmyMd4IHCgD8ZflOvzcutJ8efU
 QZ9QxoZbMpJ8vFLCu/lTkHeJjvwElC4wrBEtSjbwQcZNrj256XOQSkawnFYgdIh6yL2XEx
 Li6Bpk1wLKjhsy6MIHpUxXNSR9r/9O8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-05ZaoNgfMjqbOopi-E0-Sg-1; Tue, 16 Jul 2024 09:36:42 -0400
X-MC-Unique: 05ZaoNgfMjqbOopi-E0-Sg-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2ee87069f27so55176201fa.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 06:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721137001; x=1721741801;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5PQS67yb2p+iDG1xlm1ssI9cGEhRrPcmsYof73n10AA=;
 b=WXH2pD/wPtrIeUZEImQgFgIjP+MRg52ntVJuDfnATvR2Cy0lvLdvTGIrXZPjhGn6bM
 8zbkygClfXL611Ov0WmwIpgEK5H1bd1ZPHBBB7RK6f89F3ref0Rea+f7bUXgqvUtlajj
 5e0H2OFnumduLH/Oo1HXGDL2q4wkYyE7ttHHV3ZSjm7XWjfq20wI6UNmDVCXAnQZXIJm
 lM7POToRiwPQtvvWvFso6pyqYj1lBdGKcRbDz0PuhWtxb5w4UdRcC0KXGbQUyqe+fhHh
 mSJwrZmdjsbvNE3ewNMDMHXGeRQr+VHSyWNNjn4QJQ0Zw2GbWFIISXQevzNnI1vEZNB/
 wF8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO7ViU1f/DQjwpeI/NYi7YI3hZFkOiHDZNBHbvGAD090mQDETPMVcA9/Dkml8mll/5XKNEz611SWT2caxaYiFSme/K
X-Gm-Message-State: AOJu0YzKyzPnhgOxYQfVCaQLMp7rh1ee0DxosQuMi61EfGaJjQZYdRhh
 7C6NCHAD6YewcH3RmQZUeVnOshNRV4JmGtr+CyB75X5k/1zA8P9MIbjnO2R/9Se6nUjyrsvqcUZ
 It3e+BTsn7ljaC/ombfW3GZxUmFeu/I6q49aUrzrYdxoaV6GSAQ==
X-Received: by 2002:a2e:9d86:0:b0:2ee:5b1c:f0eb with SMTP id
 38308e7fff4ca-2eef415b6dcmr15350591fa.9.1721137001181; 
 Tue, 16 Jul 2024 06:36:41 -0700 (PDT)
X-Received: by 2002:a2e:9d86:0:b0:2ee:5b1c:f0eb with SMTP id
 38308e7fff4ca-2eef415b6dcmr15350461fa.9.1721137000828; 
 Tue, 16 Jul 2024 06:36:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:9e2:9000:26c5:842:8baa:576b?
 ([2a01:e0a:9e2:9000:26c5:842:8baa:576b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafbf29sm9140258f8f.70.2024.07.16.06.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 06:36:40 -0700 (PDT)
Message-ID: <0f910af8-923c-40a0-b3ce-7d4fa0a3dcbb@redhat.com>
Date: Tue, 16 Jul 2024 15:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] virtio-iommu: Add trace point on
 virtio_iommu_detach_endpoint_from_domain
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com, jasowang@redhat.com
Cc: yanghliu@redhat.com
References: <20240716094619.1713905-1-eric.auger@redhat.com>
 <20240716094619.1713905-7-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240716094619.1713905-7-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: t/LU2E446IfK

On 7/16/24 11:45, Eric Auger wrote:
> Add a trace point on virtio_iommu_detach_endpoint_from_domain().
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/virtio/virtio-iommu.c | 1 +
>   hw/virtio/trace-events   | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 440dfa6e92..59ef4fb217 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -308,6 +308,7 @@ static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
>       if (!ep->domain) {
>           return;
>       }
> +    trace_virtio_iommu_detach_endpoint_from_domain(domain->id, ep->id);
>       g_tree_foreach(domain->mappings, virtio_iommu_notify_unmap_cb,
>                      ep->iommu_mr);
>       QLIST_REMOVE(ep, next);
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index b7c04f0856..04e36ae047 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -116,6 +116,7 @@ virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, u
>   virtio_iommu_set_config(uint8_t bypass) "bypass=0x%x"
>   virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>   virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
> +virtio_iommu_detach_endpoint_from_domain(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>   virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
>   virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64
>   virtio_iommu_unmap_done(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64

