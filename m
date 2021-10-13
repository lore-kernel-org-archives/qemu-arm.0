Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2598416lfc;
        Tue, 12 Oct 2021 23:29:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv666tWWh3mPNJxoN0p5fFDygyKf/8PpvN/fK0yF/dRmEzHbBfy6kegBGMjFlp1lR3Lbmx
X-Received: by 2002:a05:6e02:144e:: with SMTP id p14mr8360799ilo.286.1634106582431;
        Tue, 12 Oct 2021 23:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634106582; cv=none;
        d=google.com; s=arc-20160816;
        b=aRIg9VuO/nfjyRuvdvggUPAxufy5gcV2ttrXQSr4WpSkLL5QeHGQ9KibQXE6Bz3rb3
         J9nerD8BLFO0pShpnduuLkr0O4/c8JEo0ajZCjF0YnHOVxTyW0YmPAlNt3AGGYcQNtUu
         snEGaf9VHKLtlFOsUROuHXrao3jEJv+7h9NWf19pjoWpicYKGb0XHyk6kqUOE+m1QiBY
         5+2cG94Mdwwfzz7489sj/TEID5jBecTSOfZ0j9Rga6FfNSUCuOB6hEGwN2KmuHboqJou
         owIk40xM+JCgtFzmQD5Q3muu5EkHrBhnn3DdP/cIzev6kogUaogSoW7iCTKMJZRQ2ueq
         oSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=jpQby8zU+sTJwyf5eLqZB2xon5KDF+cuqm30S24c1QI=;
        b=D224R0/lFeOuvf6703gDsksJzVzbIR4LVW4nLwj7zx2CejD/SJvc8Ts5/Cenx5BgCD
         wRPlS88rtZO2LECb6a5dkGiPNG7TriJ2PdK8NBAGY0XRTpu2jTh3Neda88acueWaDdzI
         nhSYsLtUBxpeJyXs9bi7wqrsS9HwgN1s3LrMjHQBJLZHwEH6m/jkVbphCEUe6n1cWYWa
         M7xbO5Nx6rNFKAJBqaXjGPRHC/4563nTsoMI21T0wM9cMOJg2j02XAMNsjzMUl+0adgU
         4e0xrC89W81Zx0uwKRaXdx//Z08lVuXzw2bTnNtuTC/IRjREZgsRnYiSpsj8rPmo2v0E
         BKSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="O28024/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si21426565jaj.90.2021.10.12.23.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 23:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="O28024/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maXll-0008WE-Nd
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 02:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maXlR-0008IT-Dc
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 02:29:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maXlP-0005fE-TU
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 02:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634106559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jpQby8zU+sTJwyf5eLqZB2xon5KDF+cuqm30S24c1QI=;
 b=O28024/4QqjlsHk61jpfp5PaINW2nDAxFoFgeeBEksSqYqr08dIy5C7gtwCdRYfliqk8QF
 5dTfl6MFeHIj3EZrirhNweBZ2Uy7kHbQYTJt+YvQHKjgHczgteuTD9JVvPVJCWGkexgd/t
 Qvt79HBcmItH2MjCTzMr8lgNutHp6wc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-ahACDLzDMNCBsHljZyVNDg-1; Wed, 13 Oct 2021 02:29:16 -0400
X-MC-Unique: ahACDLzDMNCBsHljZyVNDg-1
Received: by mail-ed1-f69.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so1269325edi.19
 for <qemu-arm@nongnu.org>; Tue, 12 Oct 2021 23:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jpQby8zU+sTJwyf5eLqZB2xon5KDF+cuqm30S24c1QI=;
 b=7xM5yoxoctT6YT7zgz4KizrdJOD6gm2qdq0zXY3gnh/N0hYb6bSaVXXxioRviPxuqt
 xwQUQhLObjUFKGZmrCTwqAlN+YuZWTqhm1rrcIVFhWnHCwNMCBv9PO5B8FXyr0GaDJeQ
 6nPaKqym2JucawquadqMD2MYY82N0sG73XxPoQKIeYt05GGS+O9/LWZwcMaVt0lvbhto
 gEjK/3USLgWaZhg9UoJpMyA745bh+UPW81WMNzmpjCwuMkKfYKOz0Mi7E+jSp1xRrd7F
 bMiwmFl2epiYdoQGpyP8MHfvD95WaD1eZhvgn1Ysb9h142h0gycnHdaCL/0vpS/hCIXh
 UXTA==
X-Gm-Message-State: AOAM530UvhGE587Q8Af4X6zIJWCsCCVBbnC+mfLzO4fycaEeeWACdZBx
 fljQ94/e1YdSfeD++j8gxJGxmgzPpzjQS/DIH6zMwJLMd8Td+l6q0w+evwRN0j+iVSAJZXCUZOJ
 ucsVa80v+DEwU
X-Received: by 2002:a05:6402:10da:: with SMTP id
 p26mr6821971edu.283.1634106555055; 
 Tue, 12 Oct 2021 23:29:15 -0700 (PDT)
X-Received: by 2002:a05:6402:10da:: with SMTP id
 p26mr6821938edu.283.1634106554798; 
 Tue, 12 Oct 2021 23:29:14 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id bq4sm6087072ejb.43.2021.10.12.23.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:29:14 -0700 (PDT)
Date: Wed, 13 Oct 2021 08:29:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211013062912.ilm7bydayna6gmco@gator.home>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211012114016.6f4a0c10@redhat.com>
 <20211012103754.kbyd3du26rpsi3ie@gator.home>
 <20211012142754.1c4e5071@redhat.com>
 <20211012131308.45j7ofd4xwk42epv@gator>
 <20211012155321.256e8867@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012155321.256e8867@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, robh@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 02PdFlV2r3u4

On Tue, Oct 12, 2021 at 03:53:21PM +0200, Igor Mammedov wrote:
...
> > > 
> > > Instead of putting workaround in QEMU and then making them generic,
> > > I'd prefer to:
> > >  1. make QEMU to be able generate DT with memory-less nodes  
> > 
> > How? DT syntax doesn't allow this, because each node needs a unique
> > name which is derived from its base address, which an empty numa
> you are talking about memory@foo nodes, aren't you?

yes, memory@<address> nodes

...
> > 
> > > or use ACPI tables which can
> > >     describe memory-less NUMA nodes if fixing how DT is
> > >     parsed unfeasible.  
> > 
> > We use ACPI already for our guests, but we also generate a DT (which
> > edk2 consumes). We can't generate a valid DT when empty numa nodes
> does edk2 actually uses numa info from QEMU?
>

edk2 doesn't use it, but I'd prefer we generate a DT which describes
the user's input and what the ACPI tables describe. Maybe someday it
won't be possible, but so far we've managed.

Thanks,
drew

