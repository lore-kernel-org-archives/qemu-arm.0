Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp205159ejc;
        Tue, 23 Jan 2024 01:41:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpi/lar3SYus9XPRX6y+P0Ks6MfUMw0wl0ypUpc6Uhgs4YoukdHKWuUWnK1HzKoGFB4OyS
X-Received: by 2002:a05:622a:34f:b0:42a:4a14:b0e2 with SMTP id r15-20020a05622a034f00b0042a4a14b0e2mr684690qtw.66.1706002913887;
        Tue, 23 Jan 2024 01:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706002913; cv=none;
        d=google.com; s=arc-20160816;
        b=h+eOnwIYkJBvB7HfduzfVipLQYzxNHBCYq9au+tNQAG0m4oE/2et1+NNNCbb+pmGzw
         NwX8ZGLltYXknz/TIioausethQ4PY2gmjExIWs4SMrUeUO6JPGO9cnmW/0u7dVC00ub2
         q9nlLQHdUnkkZi9PwPcVETSKQWbeQffVdAjmZWKf0Lohk49wqTS/rqtVpXoTJjJFMP9O
         YVH1ZsFCme+VWjwjn0aWiOKbHNO5MbfR0f3FDClyQZE6nRAgHEdlZWKQCMOcm6OlJOmP
         3fYZa1cyHQJLuH1Bu70qrbqI5eQ7pcw2j5iqMBGz3FCwwUpsMJpkD7JC58siuuotDrtn
         bLkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OARF2tvTlQRMsVPKh4tXSVqlzBy26fvVr07E4S1wG6Y=;
        fh=2NcGd+JCBbLKhAgkylOW8aGN9Z7GkVbrqtLwUpD0DPE=;
        b=AAs8ZE5xGZdW4nwQFcfs6GBo9BQLJImFmmnAoEBoBuszv/icVjLibHaPMuPGc2F8Cu
         6/pvHVk959Nh/Xtku+ByZte01JRD/gFfVxqWXMSXvSu+RpxHgnDmhQQuSbstAqzemrO4
         mUSsYz+WmvWJIOa6aAlo23rShnBiVXiWMxcnkSUUbfD0SwAYRDMTjOh29PWxXsnF42jH
         PyFPGQBEcNl46BqbXIPzJi/1+ZvBCqgT+Yeg/1obI0m6gyLztA1UxPZVvagSvgiTCvvy
         IHu4zKD99aEWB3HEkmpBIoK+fyMFlJjRLoVGBO5Q4xJUxADgbsUohBs6+dKiNnSjXAn3
         DvWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="h4Hpi/v0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020ac85e12000000b0042a2c58fc4dsi7390663qtx.354.2024.01.23.01.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 01:41:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="h4Hpi/v0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSDHw-0004o9-Ns; Tue, 23 Jan 2024 04:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rSDHu-0004nQ-NQ
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 04:41:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rSDHt-0005XU-5c
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 04:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706002904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OARF2tvTlQRMsVPKh4tXSVqlzBy26fvVr07E4S1wG6Y=;
 b=h4Hpi/v0uVLQ8xT6RJ6kCD3yu6I+XuKa3CBBDEIjgRw5/xoRALwQeyxc3sH5YlGsFcW42Y
 OBay18nfG/vbIMDe6qSRPgLYltreW0rWVtJ8sm2kBCDBbekOoKh74ZztCpvV30Ez2/Hz9F
 r1/WuKJWi/1f4pJDZoeGJXV+4uFx9o0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192--7A5lUhSPra9YBxY8nGK-A-1; Tue, 23 Jan 2024 04:41:42 -0500
X-MC-Unique: -7A5lUhSPra9YBxY8nGK-A-1
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-dc221ed88d9so5363864276.3
 for <qemu-arm@nongnu.org>; Tue, 23 Jan 2024 01:41:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706002902; x=1706607702;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OARF2tvTlQRMsVPKh4tXSVqlzBy26fvVr07E4S1wG6Y=;
 b=KESoT59/WG9Pb51caI3HG4RAf1/3LOzmA62alLNfrkLULQworb8ZhxBIJ1EEbhX3jj
 zirpmzUxByprIkHclpGpx7lQqJAlKlsP+B2Mqx5+q7KmvKp1OeMfVu8p/WrltUzvvcJ7
 Wi/6pqLwFhG24FwngooPr/X9WNckdNv4liGB+UYsldPaZ3jbbNpQ5hjn/lsczbTDeKGo
 iFFqzf0CR6jIsvbAhNiJjlUJfjn/8M9AiPRFLr9PmS4nDUVWHgAXyyqt57aQf/vVBPeO
 tQIjhHipHAAfb8FG1yuDUspOm2Uw8cqfhc3T4oIq/ZxzE00VsdnVRdZppOEVKCYz6e48
 dVBQ==
X-Gm-Message-State: AOJu0Yy5G3SA173cFBHIprP58WDjndnm8AQIif0cq7yujVMGL47RWnyl
 8iYTqZ4h/vmHd4OQaKXVMw/369XEsOjKCa+YRvUDeeHc6AF8bfe4vPougS+O3RGsLRmXEzRBRb4
 ztEaYBNxKYPv985kPDDF99Lz60epyIZQtGVPUH1V4kDQB5lo3ZA==
X-Received: by 2002:a25:8206:0:b0:db7:d569:1859 with SMTP id
 q6-20020a258206000000b00db7d5691859mr3333252ybk.60.1706002901979; 
 Tue, 23 Jan 2024 01:41:41 -0800 (PST)
X-Received: by 2002:a25:8206:0:b0:db7:d569:1859 with SMTP id
 q6-20020a258206000000b00db7d5691859mr3333244ybk.60.1706002901740; 
 Tue, 23 Jan 2024 01:41:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a0cfcc8000000b006819aeb62d6sm3297015qvq.136.2024.01.23.01.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 01:41:41 -0800 (PST)
Message-ID: <c47b95f9-ca42-4f8e-85d1-8fc72404e441@redhat.com>
Date: Tue, 23 Jan 2024 10:41:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] virtio_iommu: Clear IOMMUPciBus pointer cache when
 system reset
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: eric.auger@redhat.com, jean-philippe@linaro.org,
 alex.williamson@redhat.com, peterx@redhat.com, jasowang@redhat.com,
 mst@redhat.com, yi.l.liu@intel.com, chao.p.peng@intel.com
References: <20240122064015.94630-1-zhenzhong.duan@intel.com>
 <20240122064015.94630-2-zhenzhong.duan@intel.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240122064015.94630-2-zhenzhong.duan@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.289,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: huzPW7ROf6QX

On 1/22/24 07:40, Zhenzhong Duan wrote:
> IOMMUPciBus pointer cache is indexed by bus number, bus number
> may not always be a fixed value, i.e., guest reboot to different
> kernel which set bus number with different algorithm.
> 
> This could lead to endpoint binding to wrong iommu MR in
> virtio_iommu_get_endpoint(), then vfio device setup wrong
> mapping from other device.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   hw/virtio/virtio-iommu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 8a4bd933c6..bfce3237f3 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1264,6 +1264,8 @@ static void virtio_iommu_system_reset(void *opaque)
>   
>       trace_virtio_iommu_system_reset();
>   
> +    memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bus_num));
> +
>       /*
>        * config.bypass is sticky across device reset, but should be restored on
>        * system reset

you could remove the memset in virtio_iommu_device_realize() then ?


Thanks,

C.


