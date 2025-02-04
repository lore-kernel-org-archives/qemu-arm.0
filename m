Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp226115njb;
        Tue, 4 Feb 2025 06:01:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCValh2KGexRFqx2fRRWB+r17phphUTyUhS4XhhmoES40meBkr+t0QSgyamDzuvRL/81T7XB0edi2Un07Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGeNoGvf0JXyw38+4+CHfYc9KvhjeYGvzom3dSqrZJrtmgIVN+Fv/hbn71g6jGm6nE0YMit
X-Received: by 2002:a05:6122:1308:b0:51b:8949:c9ab with SMTP id 71dfb90a1353d-51e9e426958mr20809763e0c.9.1738677711364;
        Tue, 04 Feb 2025 06:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738677711; cv=none;
        d=google.com; s=arc-20240605;
        b=dw4reaoJf+YXyAeVdfXbFau6YW/fxsOSP5uK8+q1D8cwd3Nf4CdO0is3Lmwj7zjJSR
         UeQtmx/o1/AlTj7lZgXP2w+HA6XLTKOXPvjxlgzqbWC53/GaC7tL3yzooFq8+eA0njsl
         zBixFx2DlJUj3zi9PbB6WUAElS12XALKtctxkEKcsWMKDy536EyMFX/LwuxHG684ohGD
         L+vZrijENxRqs+wiJxwifsuAyXJpf3n5ZH+Tppn7TvA+PW5z5XTK5b5YS9lrmPUlx9zX
         zHXdo4nxOMcfjAj9wP1eCpgyk/Qord2lEN+Ph/+kW1BfKcfgcwtI0ZyCqSscx4jBBlkI
         ifjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xL8fXumOGl4HHwfrRVviOf3KHrqtJBfoIwDgxPO1dLY=;
        fh=yGNCVMvNYy2YOUy/v8k6hcJSoLtAFxWKoSRMNvOkfks=;
        b=a97MP/Tii6jsZC+0PKdTJYPyHr0hCHb1TAaHfDidVuLTv2qOln3/MB12SNFKf4/OyW
         eaUrbfxRkGNrYDBMzlZ6Z2oghFpb0dvwvBvP4qff96W55M8Nj9xcZk1SF2nwzcPFhR0U
         mVkS+rAF1rq1B/AdTCLHy417/iDPSrLgU6S0eAw6vvq2CEuV+cIt6IIPh+OtoDlPZ/1J
         QGC50X92B+qmB1XTMTGwNK6OE70O2lAJlg4xXhK26+d4h7PLtdmflFu442EpyvUXGZms
         K/RHEmCdDDiYfMHrW95pKJbs0vjrvYc8OR7xcTn1PbfkSWSCR3nVbBn5RS3bzyCL9K+s
         Xajw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q1Tkgecp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51f08f9f83esi40145e0c.103.2025.02.04.06.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 06:01:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q1Tkgecp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfJUL-0004oi-8m; Tue, 04 Feb 2025 09:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tfJTm-0004mb-Cy
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 09:00:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tfJTk-0007Qe-It
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 09:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738677633;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xL8fXumOGl4HHwfrRVviOf3KHrqtJBfoIwDgxPO1dLY=;
 b=Q1TkgecpNLhhce96a4Li9YGNIxuF1jrh4a+l6spXIh5U5GV8HD0zbNtkTBrXzFfxKM8o0M
 UVYCyMuyk66g7VLYSC2s7hxzOLAywzHgWRuayN4hzwkuG3ueKg+pUbit82/rUdzDqmuHmh
 Wr1s+t0CodvK9wopJLkiVcG1snKEj3U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-D_76AUDTNeGzflLWoVXLxQ-1; Tue, 04 Feb 2025 09:00:31 -0500
X-MC-Unique: D_76AUDTNeGzflLWoVXLxQ-1
X-Mimecast-MFC-AGG-ID: D_76AUDTNeGzflLWoVXLxQ
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385e00ebb16so2062212f8f.3
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2025 06:00:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738677630; x=1739282430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xL8fXumOGl4HHwfrRVviOf3KHrqtJBfoIwDgxPO1dLY=;
 b=g/ISk+2A/IhM5YVRd4oHiFchnkDhxUA2xw7pmBg9eGkQjWOe0S6R0W/PL0h7L6oxmw
 dJXdugLBjsWutgvVHw2ZQ5lzAYTi+lS79Ibh/oeUF/qrlyMlUY6ECph2/MrT5d43mvUB
 Y+0bBaaFTIebxQG3tZ0dsEn6j1a/6zNviHZdMTLqeI25bvQqt3NQekKqTWl/g9AMvE08
 eMHElGVHxixmANiU75SC4SLZkZFsrqs6Dhd8aMkCermbZIZdDS+Pon1ljX6KyQxDD0L0
 0y0eU09DFJgkXY9Uhse05kdafT/ETYenXlIVn2H54pr7F2gZ6RMYo8t0IjmjJnrkUN03
 DBQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbYRRIJeQ2H2t93Lo9jBCLDI3GoXCcTQpBxIZnrfz2ogCfOVabs66nn/LLcgqhLInt8jGTCXtlduRd@nongnu.org
X-Gm-Message-State: AOJu0Yx+6yX5Q7WJ8kCGeTJ8nqD8zUsPEDzYNu0qWtqP+uA6MuWlVGdE
 bUxN506GKuQb8bem4PX/YpPz/SSoUNW8v7YontVIQqN5rkifw6uDRj2lmPlhDrzBjDbIYCWNIs8
 9HI44nmHMyIf8goqioUQosyStYxT10erQFdBALJH74IYAcvuL3Sa2
X-Gm-Gg: ASbGnctDMODKPlceY3mgTIeq9ao7cWG7BZQtXq8tY3mHvtTyBNKjxe7Hg6MRo1egrZm
 ebwkidNWUcCI2YulzeVB0Rl42P/oshNxxYbpn8Yu1uOktcZ1Wj2HWf760JTRR+4ZskYVvG4+u24
 sGVgFdrrq8+mAifw6AkMlsosXp/mgd7OXIBF4o8PaONzGAcuIbztBOptbbxoXkMHFF4bSQprRhz
 7V9oaeP3uonnmKWclcxuNilOh5Xy7OD9wEjynIaWFlcysDDW6GPbHqCJrBbDjpa1/KJmS6T20Br
 JqmGXNzatFXxeKIqGWeXQid0uETa27hxoS6tFkSPn/K69F8RMYj0
X-Received: by 2002:a05:6000:1a8d:b0:386:36e7:f44f with SMTP id
 ffacd0b85a97d-38c519602famr21338377f8f.18.1738677629831; 
 Tue, 04 Feb 2025 06:00:29 -0800 (PST)
X-Received: by 2002:a05:6000:1a8d:b0:386:36e7:f44f with SMTP id
 ffacd0b85a97d-38c519602famr21338314f8f.18.1738677629286; 
 Tue, 04 Feb 2025 06:00:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0ec02bsm16120645f8f.13.2025.02.04.06.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 06:00:28 -0800 (PST)
Message-ID: <65c1e2a9-33b3-4a6e-8b37-49a841ac9ef1@redhat.com>
Date: Tue, 4 Feb 2025 15:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Content-Language: en-US
To: Nathan Chen <nathanc@nvidia.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "ddutile@redhat.com"
 <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <ZzPd1F/UA2MKMbwl@Asurada-Nvidia>
 <2a61079f-a919-43b1-906a-bae8390bf733@nvidia.com>
 <04024d09ebad4d83ab0679f6bb3b3774@huawei.com>
 <d2bc4fdb-3188-4063-8ead-f2ccefec9c81@nvidia.com>
 <4f657876547f4001935f7314ecb8f8ca@huawei.com>
 <b3e93a16-24df-4ffa-9214-f41383844e48@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <b3e93a16-24df-4ffa-9214-f41383844e48@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i1fui59NbmMQ

Hi Nathan,


On 11/22/24 7:53 PM, Nathan Chen wrote:
> >  >> Also as a heads up, I've added support for auto-inserting PCIe
> switch
> >  >> between the PXB and GPUs in libvirt to attach multiple devices to a
> > SMMU
> >  >> node per libvirt's documentation - "If you intend to plug multiple
> >  >> devices into a pcie-expander-bus, you must connect a
> >  >> pcie-switch-upstream-port to the pcie-root-port that is plugged
> into the
> >  >> pcie-expander-bus, and multiple pcie-switch-downstream-ports to the
> >  >> pcie-switch-upstream-port". Future unit-tests should follow this
> >  >> topology configuration.
> >  >
> > >  > Ok. Could you please give me an example Qemu equivalent command
> > > option,
> > >  > if possible, for the above case. I am not that familiar with
> libvirt
> > > and I would
> > >  > also like to test the above scenario.
> > >
> > > You can use "-device x3130-upstream" for the upstream switch port,
> and
> > > "-device xio3130-downstream" for the downstream port:
> > >
> > >   -device pxb-pcie,bus_nr=250,id=pci.1,bus=pcie.0,addr=0x1 \
> > >   -device pcie-root-port,id=pci.2,bus=pci.1,addr=0x0 \
> > >   -device x3130-upstream,id=pci.3,bus=pci.2,addr=0x0 \
> > >   -device xio3130-
> > > downstream,id=pci.4,bus=pci.3,addr=0x0,chassis=17,port=1 \
> > >   -device vfio-pci,host=0009:01:00.0,id=hostdev0,bus=pci.4,addr=0x0 \
> > >   -device arm-smmuv3-nested,pci-bus=pci.1
> >
> > Thanks. Just wondering why libvirt mandates usage of pcie-switch for
> multiple
> > device plugging rather than just using pcie-root-ports?
> >
> > Please let me if there is any advantage in doing so that you are
> aware > of.
>
> Actually it seems like that documentation I quoted is out of date.
> That section of the documentation for pcie-expander-bus was written
> before a patch that revised libvirt's pxb to have 32 slots instead of
> just 1 slot, and it wasn't updated afterwards.
you mean read QEMU documentation in qemu/docs/pcie.txt (esp PCI Express
only hierarchy)

Thanks

Eric
>
> With your branch and my libvirt prototype, I was still able to attach
> a passthrough device behind a PCIe switch and see it attached to a
> vSMMU in the VM, so I'm not sure if you need to make additional
> changes to your solution to support this. But I think we should still
> support/test the case where VFIO devices are behind a switch,
> otherwise we're placing a limitation on end users who have a use case
> for it.
>
> -Nathan

