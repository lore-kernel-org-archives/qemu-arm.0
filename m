Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3845445lfb;
        Mon, 6 Sep 2021 07:29:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw17Qf5qV6Jwfu+BeyK0xuBeXhgdPvl9uQVJWnaA65JisTwaby0LEdi0RKDLMA6CaZnryrS
X-Received: by 2002:a05:6638:c4d:: with SMTP id g13mr10806044jal.43.1630938556541;
        Mon, 06 Sep 2021 07:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630938556; cv=none;
        d=google.com; s=arc-20160816;
        b=a+qS//3Mz/HFCEhfUxR1mxwObRpGe62ALI1J6yfAgTFefXL21bKDZYvo3/+t7nV1g2
         lVMW3cFf2Tmu9yqBW90NEjMH5hXjmdbvJD13mxvs/azR6BxQituD+Fe3GYQPPvN/98LE
         CMOcwShVljMDPSiOV+6WhH8e96P5/l73ubc3tC+V4WZrelG9njtoc0CIaCcNQxj5q/sp
         igv33Li9Qiymy97AR/H3jtMa2YOaZeX3YaNWEpq7hPyHiMpJQLyVf/oTTVvm6/hDVMG9
         +zKrlzi2Ga6KdVGpWlGRGSY6eNlDf87RXz6GXVkzH4kU6cOBZuPLd2zjt63i9DUUR+ph
         L2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MdAJhWc1ZkuHYWytK95knAAaKg7XwLD9shbQFRWo1EQ=;
        b=qpR5F7TiAzeqCVeVhw1olDwOm2ZKLG5U3lK9870toHdBXqcPOy8597r/6MrioR5n+c
         SqmqKALGD5iD3hFmy8kkZctjV6WXT9JXb8E5auGWaRFSGfOUTj0QZEO/ME6899lbjse+
         Kn9czmOgkWQAj5qIP+gA3Xr47Gk6/1Y9a56sTrfyrhKkQL1MeFhrs6hlqfKQPvV6aT/C
         o2+KC4MQG8k+/PM71FhGuOfAH900RZmTd7+BqEjhMnDBe41bnhzrJG7DJcZtbq/nqvQG
         Gh/5Y7el+FDh+qzJvYWDo/q74/M+FckOI+0DE5yWTS4aYHD1WQXcCaR9AnRVhPZgXC9R
         uvww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QbiHSQkt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si7722791jaa.15.2021.09.06.07.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 07:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QbiHSQkt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNFcZ-0003gw-Tq
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 10:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFcP-0003ep-Gq
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 10:29:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFcM-0006fE-W6
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 10:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630938542;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MdAJhWc1ZkuHYWytK95knAAaKg7XwLD9shbQFRWo1EQ=;
 b=QbiHSQktAhytod5DbEVnFRb0jHj7gDY4Lk4rLBad/82fervGckWbMAKdX0yRtqqvZf5p8+
 nQ7/RT8jH++hVsSwvEKzDFiVXtAmHbmwRWx4CNYKKOC11cOfmZ5yMxQcDDkKeVVHeW71DC
 aQOf+JdpViChGyZ6xTHx1i2oSmGrn8Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-Qln3B4GhOdKaadm5nBVsRA-1; Mon, 06 Sep 2021 10:29:01 -0400
X-MC-Unique: Qln3B4GhOdKaadm5nBVsRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r126-20020a1c4484000000b002e8858850abso2405856wma.0
 for <qemu-arm@nongnu.org>; Mon, 06 Sep 2021 07:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=MdAJhWc1ZkuHYWytK95knAAaKg7XwLD9shbQFRWo1EQ=;
 b=blnXwNrctt8sqI081IJJXqh4slUQbVdCMFE41kvECOT3hmvh+/A7sALTBWyKYXE3U2
 dTBKXxZV0HAY6s6XctWxho1Gvr0iur0a/UIjxVy0EledG0x+eWwZgMYwAKn15QmywrhM
 7QkajOw3KdXdVmEssCXFN0zgrNBxc10dHQzYCjnnG0c5TFxIqwNdIhVYQezvezN/78oV
 qcvqkXGeTZNMTR/W89mxCnlioV81eRyxFrcCDl5q4n4JyNfVIufzTCnTkvLb+6Gw+Hcj
 j/YPFuvTR6W/mPuP8bcgw9KkcnnpZ8mYp15Rs4vm67eQqVX15E5N0fgQWzM8gv+BAwFP
 K6oA==
X-Gm-Message-State: AOAM532i7GZLOoQYcf9UrL7A4TvPUPA4/t7EssCuot110xDB8RkZjxpK
 +o3el5l6EntFhFnSgoy8/BwBY5aMGCeUtcg4Q+M+jBoJKJp9X7Uv4iT3mNSANUPPNAQXBaC7AtK
 qT2esB++VGB8V08Sk84ue3i5stoQNk8yQOxGJTtbDAfyxXwU+53/95z987aYMIZcSldE=
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr12022542wmm.55.1630938540009; 
 Mon, 06 Sep 2021 07:29:00 -0700 (PDT)
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr12022519wmm.55.1630938539768; 
 Mon, 06 Sep 2021 07:28:59 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c9sm8036245wrf.77.2021.09.06.07.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:28:59 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] hw/arm/virt: Reject instantiation of multiple
 IOMMUs
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-6-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <d209ec52-775e-bf25-fc00-5d9aeb2d65ef@redhat.com>
Date: Mon, 6 Sep 2021 16:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-6-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p+J9eGRgs4+P

Hi Jean,
On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> We do not support instantiating multiple IOMMUs. Before adding a
> virtio-iommu, check that no other IOMMU is present. This will detect
> both "iommu=smmuv3" machine parameter and another virtio-iommu instance.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

You may add
Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
as the problem already exists with dt.

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/virt.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b4598d3fe6..5ca225291f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2475,6 +2475,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          PCIDevice *pdev = PCI_DEVICE(dev);
>  
> +        if (vms->iommu != VIRT_IOMMU_NONE) {
> +            error_setg(errp, "virt machine does not support multiple IOMMUs");
> +            return;
> +        }
> +
>          vms->iommu = VIRT_IOMMU_VIRTIO;
>          vms->virtio_iommu_bdf = pci_get_bdf(pdev);
>          create_virtio_iommu_dt_bindings(vms);

