Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1572532lfg;
        Fri, 12 Mar 2021 12:38:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzS3Sh3PcNSwXvxLgUkjmB4Bmn1spdHtPwYd+0UbW0lWK299LVbIR6Pel0+rS9GVv27tZaY
X-Received: by 2002:a05:6638:406:: with SMTP id q6mr1049329jap.126.1615581521242;
        Fri, 12 Mar 2021 12:38:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615581521; cv=none;
        d=google.com; s=arc-20160816;
        b=trtM7u/U4UvRgkobF9XVtdgeBvzIZ8lgazlnpVZdwcshmGmOJlsEJGziXYSTIecg3x
         ebuUFtlunUVQ5bzCUxqcC/xj73ElH3MrCRc4v75R5guIOrj4A5hq2I7GJmSAiPPFJTIk
         Ra9L2jxdCq+smU8Xn8byhpfHqwa71v8Ikeo/kk+8NFMspi3cVNmWZC4LRF8zcQhj7hO5
         SNeZFZEbnLcE2VXmaEX7EzsP4gPU6rbjDnpZbdZu7fAIG3nBtlrgMGnzNAVY5Q0KCQsL
         v+5iKG6BNfvySEJmzsOiQO+qPMk3B2zEvIqY4U0HVFP8bDAPi/lAexqifkhDhNxb0sFg
         SawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=u9ocnIzD9dlpj0e13ccQCn+baLvCjUIHGltEZdAUNfI=;
        b=uD6TodStBx2H3ntQCfls7KhJtZjvsJ3N+MkNcOiooVw05vPDOATxiHiYqN9AnpCq7V
         jKMrreEpnZxoO0GC6BgDrm73Zy/1HsNhQchoocKWmSTzfZs59+skBqKq92IRZobsr68J
         Pf4Raploxl7SQb++F6OxmKW0hZgwTSaftAd9suu/CHLMc8B3mVVQ7xDqp59IfWlkrOk2
         pu0i65cEyfKv0vEKv4ObIIpwAtpHRRFDb6yqjYlZ02h9/bxsiW+cnI+K7WyTl7r82r38
         Vaw1ShfhD+oBsMkK45Pro9ahPqXuoLXHf2FgSCG/QOFW4g1w7lyFhkF3w4MWW3OEf91j
         BkFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YL7al5pD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n26si5958002jam.115.2021.03.12.12.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 12:38:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YL7al5pD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKoYS-0000fS-GG
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 15:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKoYK-0000f1-DZ
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 15:38:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKoYH-0003Sj-8B
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 15:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615581507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9ocnIzD9dlpj0e13ccQCn+baLvCjUIHGltEZdAUNfI=;
 b=YL7al5pDaH/9rOBJKs5isRnW4nV9edoFkJMrZIHBJSkh6oqFM4wCheskQ6mlPMQFhoesax
 Zj7I8zVFi5Yvn76JRISyc9RiW9V8sm/2FRpSaJrFuch7CxPV2Pgv2p8uBA3c/2jmURxiOA
 9fp/dCQ3rQnMW0xT6kWpgclMzFWRlaI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-KlXsSNUAOo-QkkCF-OCzKQ-1; Fri, 12 Mar 2021 15:38:24 -0500
X-MC-Unique: KlXsSNUAOo-QkkCF-OCzKQ-1
Received: by mail-qk1-f199.google.com with SMTP id 130so19011662qkm.0
 for <qemu-arm@nongnu.org>; Fri, 12 Mar 2021 12:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u9ocnIzD9dlpj0e13ccQCn+baLvCjUIHGltEZdAUNfI=;
 b=nDnq0QxIbTjfz2GO63t+GNi61TRwGsDp5+LFQtsESWfe24T9kF7sohKhE9Pb3WeSSU
 clLJOuZm2hMlCIya9iGjAjhnTT2D0rid1INQ47BriesvqftGKyBfBbzolCe+63Wl0aFd
 yMuj50I0IYV9/9lrHxHTOhxDs6VCdfbdImjhQDPBL31CqCKLDEnQyTjNY+xG0QvR7BE+
 RsyJXBnRkfzISagUgyL0YlCgJUajZwt2E9DPdKDEgcSEQ6TaC9UsZvnUpgFjvaUGvBmd
 U6zy1oQSJzCVhI77OQEIoPGakSEBxE5+4iTqeq8eIN3+1Ak2kE6J+R0OvR2oZq0zNkly
 sRJg==
X-Gm-Message-State: AOAM532h6eZPjOTqybpZ6N/aqJLCA/D4K2hmKpEftJjG9Mps3uz/G2XG
 pEaP9BeJqkRMxQOTuCaBBDXAYEVmZZBDcLkGi1XrCU8e6/Vr+BJKvOizux+R9xVjIgGgvbFRPHM
 YNUmXiv8I7O8M
X-Received: by 2002:aed:306c:: with SMTP id 99mr13355213qte.352.1615581503684; 
 Fri, 12 Mar 2021 12:38:23 -0800 (PST)
X-Received: by 2002:aed:306c:: with SMTP id 99mr13355191qte.352.1615581503395; 
 Fri, 12 Mar 2021 12:38:23 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id b17sm3377134qtp.73.2021.03.12.12.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 12:38:22 -0800 (PST)
Date: Fri, 12 Mar 2021 15:38:21 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/5] hw/pci-host/prep: Remove unuseful memory region
 mapping
Message-ID: <20210312203821.GN194839@xz-x1>
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-4-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210312182851.1922972-4-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C1tEB8ERwOAh

On Fri, Mar 12, 2021 at 07:28:49PM +0100, Philippe Mathieu-Daudé wrote:
> The pci_io_non_contiguous region is mapped on top of pci_io
> with higher priority, but simply dispatch into this region
> address space. Simplify by directly registering the former
> region in place, and adapt the address space dispatch offsets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci-host/prep.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 0a9162fba97..00a28c2d18c 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -159,8 +159,7 @@ static uint64_t raven_io_read(void *opaque, hwaddr addr,
>      uint8_t buf[4];
>  
>      addr = raven_io_address(s, addr);
> -    address_space_read(&s->pci_io_as, addr + 0x80000000,
> -                       MEMTXATTRS_UNSPECIFIED, buf, size);
> +    address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, buf, size);
>  
>      if (size == 1) {
>          return buf[0];
> @@ -191,8 +190,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
>          g_assert_not_reached();
>      }
>  
> -    address_space_write(&s->pci_io_as, addr + 0x80000000,
> -                        MEMTXATTRS_UNSPECIFIED, buf, size);
> +    address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, buf, size);

This changes access to s->pci_io_as, but below didn't change s->pci_io_as
layout at all (below is about address_space_mem).  Is this intended?

>  }
>  
>  static const MemoryRegionOps raven_io_ops = {
> @@ -294,9 +292,8 @@ static void raven_pcihost_initfn(Object *obj)
>      address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
>  
>      /* CPU address space */
> -    memory_region_add_subregion(address_space_mem, 0x80000000, &s->pci_io);
> -    memory_region_add_subregion_overlap(address_space_mem, 0x80000000,
> -                                        &s->pci_io_non_contiguous, 1);
> +    memory_region_add_subregion(address_space_mem, 0x80000000,
> +                                &s->pci_io_non_contiguous);

I don't know any of this code at all... but it seems the two memory regions are
not identical in size:

    memory_region_init(&s->pci_io, obj, "pci-io", 0x3f800000);
    memory_region_init_io(&s->pci_io_non_contiguous, obj, &raven_io_ops, s,
                          "pci-io-non-contiguous", 0x00800000);

Then it seems the memory access dispatching to (0x00800000, 0x3f800000) would
change too, from s->pci_io to nothing.  Raise this up too since I don't know
either whether it's intended..

>      memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
>      pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
>                               &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
> -- 
> 2.26.2
> 

-- 
Peter Xu

