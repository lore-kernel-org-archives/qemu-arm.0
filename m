Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3143181wrg;
        Mon, 17 Jun 2019 18:28:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzoySXqQuRCmc0Lzc2ILKKg4/LxwSogbl35FrngaFw+C4K9s3iiG37mlQQObRU/gaEC9+O+
X-Received: by 2002:aa7:d909:: with SMTP id a9mr69407906edr.261.1560821294237;
        Mon, 17 Jun 2019 18:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560821294; cv=none;
        d=google.com; s=arc-20160816;
        b=idPlw10r9zONwhG/xjqC+U5fNrtsLK+dB+JrXQtGepxFwKrR3yIXEJeEa7zxn2u0Ii
         Fs3XFTVUBbcSP8dKJveySpAo2wj6srjoTF1n41pbHJDmAfRQiUfHqPkOEQ1GyboIzswF
         tdsUcDjlJOBJRqVRNbldV+2CNEefiW6ItSHF8WdNQn4SbZHHa5LjAl3P6ggdlNXt6SKu
         OGj2vMbf5c3LVUaN4Y0v2aL9XvM/YnwEzCCWVn7J8Xhtz+CsuywuKNBkogjTAJ0MnhT+
         y5iGexL3AGtfbYuQoqH0pp+1ApJ61e0kZKV9kufRfJ1pmVxUMCX5M6Rpnkbx1A9Uyi/K
         dJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=Ug/XVoy62/+ubAQY6oNwDhSHzyYSmk8zDIarbePu92c=;
        b=xfRIGMUJbol+rylr/NQlSDNBAfde8OguufvknExOjPxLxGn58c8F8E/XbDqrYN7xBx
         cmP41xCoLoi/+kIwO0VQbvWE/DdU+tPf8fPNAp6cGv+4PtaYv1UK3Ni6pSxxpV1jJ2Fy
         yfNBJHoIYfD/8lgzguDoPVfl+kVK+76MDNewTzu1JrqcavoEMhrGs8qLN/ljRcIlexrg
         2HYj5hayafGOQ/EmPkvaov8BtqMaJ1pow/oYH+mTl98/MZsPqXC5vmhe1YbxES8lEiFm
         zgSS/aVaFwu8IjZca2hVWDkO/0xMpjTfxwHWrWUwPek6JSjKwH/zQy6oQ/e0hZKkQt2L
         6aWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq27si7993057ejb.277.2019.06.17.18.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 18:28:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hd2ux-0002sC-AF
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 21:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hd2tj-0002pz-NQ
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 21:26:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hd2th-0001aI-Bb
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 21:26:54 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:43917)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hd2td-0001U2-HY
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 21:26:51 -0400
Received: by mail-qk1-f195.google.com with SMTP id m14so7503266qka.10
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 18:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ug/XVoy62/+ubAQY6oNwDhSHzyYSmk8zDIarbePu92c=;
 b=IuzKxMpNoHLPokpfVz0lUuadQp1YYCjJ9Q6PYRtlSZHKHRtQH2wXwfkF5/ddgWwhsT
 v0g/2RHXrc+oEKDw+iBmw/ZUaEgbh+7Kk5S2ZkauSCGa6s8p/f7jGYkAg8bxC+9z2GWC
 WPfkuefS6fc+pKqsO5FJ/toPqBWj6MGNX0hoGMou3LWXw6d3FLPR0420zNYuOlMDfSet
 HKNxec17ZnFpP9IEw2e9GSjTqU0pk/cDjtJfXvrpntdCo2bzq7h52rq08LM013c2AIa3
 8zUZDgXIFk2xjRfJrApgtPudCgY4fVlQos2ugK4dcXH8SOlsy1rZArYs3Vupd2f28bn8
 2auA==
X-Gm-Message-State: APjAAAW1zpg++VmdFqfyIMtImUoigKm8bHZMdoaPKFUKMCFTT7FImyAQ
 2+6NtfqbS3axIamP9QXo8q7LgQ==
X-Received: by 2002:a05:620a:1286:: with SMTP id
 w6mr89560135qki.219.1560821207573; 
 Mon, 17 Jun 2019 18:26:47 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
 [100.0.197.103])
 by smtp.gmail.com with ESMTPSA id n18sm3316476qtr.28.2019.06.17.18.26.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 18:26:46 -0700 (PDT)
Date: Mon, 17 Jun 2019 21:26:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-ID: <20190617212637-mutt-send-email-mst@kernel.org>
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
 <20190416013902.4941-5-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190416013902.4941-5-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.222.195
Subject: Re: [Qemu-devel] [PATCH 4/5] pci: designware: Update MSI mapping
 when MSI address changes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f+jan4dwstCj

On Mon, Apr 15, 2019 at 06:39:01PM -0700, Andrey Smirnov wrote:
> MSI mapping needs to be update when MSI address changes, so add the
> code to do so.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/pci-host/designware.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 6affe823c0..e80facc4a0 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -289,11 +289,13 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
>      case DESIGNWARE_PCIE_MSI_ADDR_LO:
>          root->msi.base &= 0xFFFFFFFF00000000ULL;
>          root->msi.base |= val;
> +        designware_pcie_root_update_msi_mapping(root);
>          break;
>  
>      case DESIGNWARE_PCIE_MSI_ADDR_HI:
>          root->msi.base &= 0x00000000FFFFFFFFULL;
>          root->msi.base |= (uint64_t)val << 32;
> +        designware_pcie_root_update_msi_mapping(root);
>          break;
>  
>      case DESIGNWARE_PCIE_MSI_INTR0_ENABLE:
> -- 
> 2.20.1
