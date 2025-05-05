Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2331648njj;
        Mon, 5 May 2025 03:14:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwLS0N8EMnfuW366othfsCZfPksKXHiKfSGAqNpno+dfnMmNKuYfP2eArRLuu+oA9I8SYdKocy3qA/Ew==@linaro.org
X-Google-Smtp-Source: AGHT+IHd9ZIe8sSsJA/zCLIHoWtHSansqNdKHaxiIHAYginZfqHpF8/Ia1Kp+2jd705b8gmXSabO
X-Received: by 2002:a05:6214:230d:b0:6ea:d033:284c with SMTP id 6a1803df08f44-6f523638f12mr138096286d6.0.1746440060083;
        Mon, 05 May 2025 03:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746440060; cv=none;
        d=google.com; s=arc-20240605;
        b=HqT7+3vURXf/8S06cv6SfNuvqhNVWAPEiG6UZmboU/4rvIl+/45beBoKnu6ZgobnBw
         I55Y9vlrfq8HAxs5jy9DLZIo1ubyYkjeUHAc9mY1Cv3GasRnGU02414KqKZ/Q2hHZKqo
         eCeFV1zEtMva2DsSWpH0QIXKWeYxTDXH28MbwG2oJ7iWqCL7fcMxL/CIwb+2EfGCtzpK
         nEA4HmjG2+q9oEZ9KjAKMMMQ5PRDNh+fGgmB0YttYKCtuCT0Dg6PndJ7iHYSdhn4HOxM
         fhizE3xQwQgjjXbyzVPlqx+Y91/9WnDB+0Yz/KVySPrGV6OsxMk5bGF4ywxj0DpUR8kB
         +NPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ohHJP0l/CPWxZVkZm6JMqzdhqvKYYPKZgEYiFXsrn4M=;
        fh=CxBF6OnvaW8/E8/b82F517YK6dzwhTIyVdg2wU0+0y4=;
        b=hXyxbBczyXZp9ZChWzfa6X/UFVy7av+rUoEadFZik9cHXlYU6JXefzV+NN/UNLHNfX
         oqO5tGtw2m89ziVfLOuipprO1xucU6mZj0hczjd48Z3y13P85Qs3cv53SUAUcjmP2+zr
         iKXoUAafK6eUltZ0dG0W+Bh6QWj7kSGi0U5soLg9syE5YHawWkRqB3EiDvEOjSAc8nHB
         nifDamGTx6MmIe52xS9bSKoNB9vmYRj26eOuuNYxw63/LF//FwT4v9ULQxxJ3KTur8i5
         2QLPS4RjKWPvx+BOM/HaOamjN197JiuX/4VnrCbock4gMznBiSwvRpzpDzhOyC5vvqjk
         3HDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OMyoK/KG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f4774e9si85621406d6.239.2025.05.05.03.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 03:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OMyoK/KG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBspo-0003Pa-QI; Mon, 05 May 2025 06:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBspn-0003PJ-FS
 for qemu-arm@nongnu.org; Mon, 05 May 2025 06:14:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBspl-0007th-W0
 for qemu-arm@nongnu.org; Mon, 05 May 2025 06:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746440041;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ohHJP0l/CPWxZVkZm6JMqzdhqvKYYPKZgEYiFXsrn4M=;
 b=OMyoK/KGDbaxrFkfl/FhroRAM3uiLE0YeTjtjeti0u84DRy/EYbp/2/rvIoE/r7nMFIXsx
 i/MxYTX7Pe0UVDKwzeIWVgOv2W43dekZRFP61I8YlrzB1l1L/hMagpRdLoqwqrB58VOTIB
 n0dgtpzGeGSeD1jXYyy3zd5+xySC9RY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-qNDNk0M_OFi2azIevwK5mw-1; Mon, 05 May 2025 06:14:00 -0400
X-MC-Unique: qNDNk0M_OFi2azIevwK5mw-1
X-Mimecast-MFC-AGG-ID: qNDNk0M_OFi2azIevwK5mw_1746440039
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d6c65dc52so30461905e9.1
 for <qemu-arm@nongnu.org>; Mon, 05 May 2025 03:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746440039; x=1747044839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohHJP0l/CPWxZVkZm6JMqzdhqvKYYPKZgEYiFXsrn4M=;
 b=OnKUC0/d/pytz1gcRGS6Rbjn4wfDJIfcXyxrGRIV0WfsZgOkBgLQb/pr/6+mTcA7oo
 xDD9BVqTtd1zUGxJEC+ofKGgXhtg+j0xM9r8s8Nm9JN0xdhNZQeMeybEo6hMuFrm/Vk7
 a+XoQeCjrRhj3X1Mba3C3WpOxxS7DQmbwkFH2q3bjAG2zbqm6EMlkBuHA6dsiHcU+RKm
 1QuJZoSqwYAD/JrwPEnsi9g0RSETJzfqtoVDpY836GmWXAX2lT4NxINs3jK6nLa61GO/
 r8ioyTzesTEx35h7haKu/RMXrzaABfJN17k8wy4bNau1R7RlshKeGI/cS9rvgsvgzSm4
 mKGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFQHvjhmZ+sNFudAw7cUFd1tFeOnTkWmYedP96F+sG6fPje+C+TlXmMlt9RQ7pWMpgZ/J9HQ7MSA==@nongnu.org
X-Gm-Message-State: AOJu0Yzd5ll6v7gTTlZaffVqW6N6I7R65+ZuDJteUT2iJo0qjJ2X2/zC
 nxFDmxdxRnfcA9NwOYIcHaQJkvzDoqLZYpLn8ApNZD8lU5vqNC/bRep2FROlDndZVabghmfPgXi
 PeOFruBfDekR+JXtHDTPPBhdMDBgYmuPE/fIivr9nxFD2wPD1Og==
X-Gm-Gg: ASbGncsqRnwTTJjuT/GGXwUFhoEKZln9cfRE+pxHfTJOSO3aXMJG5rI5wCrs9KwlRin
 oGvcBWYGDWvfN7CRp172akUCU91ZJ/FsJ+t3k8X0fiRTYvq0bBKnSmb79AzE3BsZvaWGfiukPPG
 1wnCK52xLFqSxA+oVmmP4SlpsyTtrybl9XhRnFczglfB8PfNRh78r145hF2m4xdAG/7pWagGfLT
 Rkc35mZXmWbQCvTbNgWWw2FBJXgvDH/mbEsKDHjYGlq60GX2FBgTYtkpobTv2aPnifvvdR84V2R
 n2pu5iDOPpuDvVhHgBPhQe4W0JA1Jk0PuP8xu6lP3BqeDZlIYjbDA+5SEFs=
X-Received: by 2002:a05:600c:1d15:b0:43d:745a:5a50 with SMTP id
 5b1f17b1804b1-441c1cfc72amr64241015e9.19.1746440038820; 
 Mon, 05 May 2025 03:13:58 -0700 (PDT)
X-Received: by 2002:a05:600c:1d15:b0:43d:745a:5a50 with SMTP id
 5b1f17b1804b1-441c1cfc72amr64240765e9.19.1746440038540; 
 Mon, 05 May 2025 03:13:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae7a55sm9793708f8f.45.2025.05.05.03.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 03:13:57 -0700 (PDT)
Message-ID: <dcced2ee-d13f-4af2-83e1-9616d117faaf@redhat.com>
Date: Mon, 5 May 2025 12:13:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] hw/arm/smmuv3: Enable smmuv3 device creation
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-7-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250502102707.110516-7-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gXF6d3jHfgCqAX6Wv8TTEmwTtIZ5sQoI6YxlWIx0Mqc_1746440039
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: qtKCHbNK2Rho



On 5/2/25 12:27 PM, Shameer Kolothum wrote:
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 605de9b721..e13950b7c5 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2022,6 +2022,7 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>      device_class_set_props(dc, smmuv3_properties);
>      dc->hotpluggable = false;
>      dc->bus_type = TYPE_PCIE_BUS;
> +    dc->user_creatable = true;
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
I would squash this into the previous patch

Eric

