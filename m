Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp231659ejc;
        Wed, 9 Aug 2023 14:25:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsg/i2uItC11n5SA7dlrK/gK4HV9MS6WYCM+obOEIwVyyZ5QClq9tfiAUWsJrBEzLTIVFd
X-Received: by 2002:a05:620a:47a5:b0:76c:8e37:49b5 with SMTP id dt37-20020a05620a47a500b0076c8e3749b5mr246563qkb.47.1691616324784;
        Wed, 09 Aug 2023 14:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691616324; cv=none;
        d=google.com; s=arc-20160816;
        b=p6hz/sCBqBSh/Z1e/dQkYQJ2fjCiFxnGHfCFXaifPeXML6RfSusekirYJ4CIyOXFdd
         jUuhHDswLzORqnCoIVW0fd9iJOAg5f7VthM83QOlmKpVU82/Uq+McGzM7iZpyKdkLOIr
         ljNlPH2cir8+b+R+tFSwaa9N7VSQBGdmAYXHnLvgJkFq8bQRpj6QlCU4wp68nhEHnSUk
         PI0xdFUgn44GcixU+J2VOyyC2PlJiSVxK57TyeNVinzaU3UIJdzGWgxMNnT7Xu0H1k+S
         FcVcYM+q8UAmg6NSwaKL7VcjdP84sVJebcw+2dZSNM1rB2vqrC98jGjJKAToLZ+4sesP
         ldQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=umdNypH+rFz/fDMq+B3MPfHFLbSFUqS8VdJV8sfoYM8=;
        fh=uBNIY/CAS6I5cWHIcA9m+bJY4ETHRClVYpxlVTH4os0=;
        b=OKHNEiWOgaGBpq4KhEhZ3j7mwDu/daaAxAQs/JwL4848HwotINygvVDWhOgbCDKgIj
         KqpVqD46Pa7f61xQBDkTod9pAJ3YJnQQbOhV/aTO2sV1B0JIUTwI2wyYCTGbhnFMYsB6
         yg1nRqtY9qrs+a0aAJKIYMTAHWR/eOHdrrCkVzE780lAWmGZD87Igo2oqpQHXumItc7N
         1hIcSi7RxhTYavcn494/a590H161azwaDZEknNXvGZj56d+g9+TkOC7pVjLFkl/9Dy/H
         j0z8FJMsrY4OPRQDpYWzQt4mR/JJcZEcxZUkqhe2dUvzSZVlXqnxBrpLp51ImYcH06Ji
         bioQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dEp5D71d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t23-20020a05622a181700b00403c200b5f1si34407qtc.477.2023.08.09.14.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 14:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dEp5D71d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTqff-0006YV-Eu; Wed, 09 Aug 2023 17:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qTqfd-0006Xj-9n
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 17:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qTqfa-0007PN-IX
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 17:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691616281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=umdNypH+rFz/fDMq+B3MPfHFLbSFUqS8VdJV8sfoYM8=;
 b=dEp5D71d5ZtxcGiPKv76FeA00fp4ct0DPbOyxXifg9+LDAwKD98WMNYJq62UJP3jFrdUYO
 CiftBk8MeIa88DN2HCEK6VkbEKIj4sqhZ2E86UexCSDTi6YXBspWyhFdQ32VfvMb5P0oK5
 7OfAwMWEJ63pOkJ6Jd7AcyfpaQoMVIM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-tqhcjvHAPUqSWxCRNUp3vw-1; Wed, 09 Aug 2023 17:24:38 -0400
X-MC-Unique: tqhcjvHAPUqSWxCRNUp3vw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fe4cca36b7so1429365e9.3
 for <qemu-arm@nongnu.org>; Wed, 09 Aug 2023 14:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691616277; x=1692221077;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umdNypH+rFz/fDMq+B3MPfHFLbSFUqS8VdJV8sfoYM8=;
 b=Sn7ngUTPhZm/MFJYZS8ZW2SWryh6Pz5yCOIn30kvTTvhkMVVGxOyfQcEL5/tv7ZIo7
 4fwPkcim3x/Zq0z+Qos3dStu5VlF1f8G6Hl7cI9533ghVgPmPSgpv2WOM03xGAt15c37
 RxjbarqGJp5n4XlX1LkXTxP48OyRMYZ6JGELqTIKdo24j8wb/nO+D6kYSQxRigUGJVw5
 h/sWCQFzaZTSUHo8SijcH5ryyvXDd7AXSW7HxG09ePlH+CjTB5RFFzbwI+ZgnjnN940K
 PHVmKl0F0iyi8Ue1BdPmaQGeRoEY8FWvWlz8UTgoZppJmuV2VXdpPCMoozJIJqwutO5w
 x72g==
X-Gm-Message-State: AOJu0YxllXz1BUSPW0zBIRLKCz2HfhEr2KNrJtaxyjTr5fVx4yvBBWPo
 8VI9PpYLfv/Og4EyHpqEeLgONYf92rxezwrLF3/b0tntoSvTK/npYn6ZdAAGfYmprX2q+0OqFvw
 PzdZgmHxpTiZ6
X-Received: by 2002:a7b:cb85:0:b0:3fe:485f:ed13 with SMTP id
 m5-20020a7bcb85000000b003fe485fed13mr274374wmi.29.1691616277536; 
 Wed, 09 Aug 2023 14:24:37 -0700 (PDT)
X-Received: by 2002:a7b:cb85:0:b0:3fe:485f:ed13 with SMTP id
 m5-20020a7bcb85000000b003fe485fed13mr274360wmi.29.1691616277180; 
 Wed, 09 Aug 2023 14:24:37 -0700 (PDT)
Received: from redhat.com ([2.52.137.93]) by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c00cb00b003fe29f6b61bsm97146wmm.46.2023.08.09.14.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 14:24:36 -0700 (PDT)
Date: Wed, 9 Aug 2023 17:24:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Greg Kurz <groug@kaod.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
Message-ID: <20230809172413-mutt-send-email-mst@kernel.org>
References: <20230809102257.25121-1-jason.chien@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230809102257.25121-1-jason.chien@sifive.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ploGi0VXSoBX

On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason Chien wrote:
> In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-root
> bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
> the child bus "dw-pcie" is realized before the parent bus "pcie" which is
> the root PCIe bus. Thus, the extended configuration space is not accessible
> on "dw-pcie". The issue can be resolved by adding the
> PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>

I think we should fix the order of initialization rather than
hack around it.

> ---
>  hw/pci-host/designware.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 9e183caa48..388d252ee2 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -694,6 +694,7 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
>                                       &s->pci.io,
>                                       0, 4,
>                                       TYPE_PCIE_BUS);
> +    pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>  
>      memory_region_init(&s->pci.address_space_root,
>                         OBJECT(s),
> -- 
> 2.17.1

