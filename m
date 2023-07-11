Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1725623eje;
        Tue, 11 Jul 2023 01:48:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHO+oY4hgBo/d4KLPMXim+EMB64l1jLiTJxO5JXy3LI5ziOrYwarM/EblD0EcJRyH+A1Cw0
X-Received: by 2002:a0c:e310:0:b0:630:1b99:c9d with SMTP id s16-20020a0ce310000000b006301b990c9dmr13097229qvl.45.1689065284191;
        Tue, 11 Jul 2023 01:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689065284; cv=none;
        d=google.com; s=arc-20160816;
        b=hpiozVod4uAWhzCajZl6AUGvlz5gjB7x3hemIvpYcX0EGHFb1MDdwQ063ZVMCYs6Z3
         ZES0Sas4Tqjrao2r31qKs6UerZu+n0EMMxg36l3dOssDu2TAhryfB+l2OIWN4G4N+maj
         eVldVHzi8TIQ3wB4ModYa5rwiyQTSt/WZqRDUHVqA9SuizKFgWRX3CzuSRKiRF4J5Crv
         LW2+E/ZNPTK7e7xWonCp8dAKFnHg2d+YVrajNqPur8FAAJNe55VbNsWiXFrW/ZXFjPKC
         /NVmLppTvFGQlcrSrB1Lp5SOQFz4Car+G+IA+VwPxKmKzhR8DbUeBHg8H3nAmyez1j8W
         XsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=a0jks4zyzUK5FTWiUbIYHZE5X6iLF/reQlhpFh/ub0s=;
        fh=EoOjAfkZesDSF9reC59stfIeodNss65dHW5vS16eomQ=;
        b=g2ZsO9EEQaJUD8P81jWwuqnYK/C0e8HI+08yN+7pv79Ind0yasD7ji/wvqfnnQdjS3
         +WGnJOpoRhDpREvXvUwLLXoPFi2rQMJCBItrjAsUP91UuLKF+9H+PAD/xbWG/UZPKFGZ
         PQKuqVLBJB79Fs7iXS3XGu39zD/aH/HrI0uJhs1nfxpxHm4wghER4jVsC+1axv1G9Oe2
         LAyWPYkG4qyQtlVjCB+F2XGqGCth/fWnKa+DFKxqzfYf5P24/tOn6lP8mZvaqKng562o
         redQEZl6dbBFKix+SlZLIUvE0tcTZMXDt6BglDKwFZL2drMH6vDgk4msiRhS5MZA3BvX
         Jd/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B+VqS+NC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020a0c9c44000000b006372623fbc5si566669qve.274.2023.07.11.01.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jul 2023 01:48:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B+VqS+NC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJ91s-0002JX-Gg; Tue, 11 Jul 2023 04:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qJ91r-0002JG-9A
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 04:47:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qJ91p-0006Hs-62
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 04:47:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689065243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a0jks4zyzUK5FTWiUbIYHZE5X6iLF/reQlhpFh/ub0s=;
 b=B+VqS+NCK5oJiqEmt5wvOBukjyl9ZFRRAaUATnHuK2txPUl44qRBYw0UoyZ7wAJ+mwzcUY
 FZLCTxtjBaISg8peyTp9gLRkjqOtaVg2xIoOFdpMrMp3Ta8eK3vOifQhezgK47ak2PUS5N
 pSkRUidGwuDc7nSqhgBqn4WfurJPVhg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-4L55orNKOhuPGv3iPzlqXw-1; Tue, 11 Jul 2023 04:47:22 -0400
X-MC-Unique: 4L55orNKOhuPGv3iPzlqXw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fbcdca9082so4399921e87.3
 for <qemu-arm@nongnu.org>; Tue, 11 Jul 2023 01:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689065241; x=1691657241;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0jks4zyzUK5FTWiUbIYHZE5X6iLF/reQlhpFh/ub0s=;
 b=R3EDMQMkjPStAOu7w/I7MXlIX7E8pKL+YCTowLN3OOWmYpdFOXAfuNILLS6nA6YgbG
 5nXXVr6TXaUzjSrh7F56QNFosMzd73QcavfpW275RP8/lGQ5i4xBcZrY3qL8yIQygyP7
 Hh0auxK956uqQ71dC7cWIDVEwrNvV9ESWRsMlncfrtI5kJIDi5Chu4FO91NaU8hTJkdw
 9HQGGMzkBrPy2JqoXxXGRBSWeIVTDqElfMgg15zi5o9rhMHWew4uyYjExPAnY2J/RNTh
 oYCxlpCub7Wm4rFjD2pbfMt3pLwEzgtO8/nX/f/CaF9yzaJefgwXJDkPjtzRXWK4Y4/A
 LbGQ==
X-Gm-Message-State: ABy/qLbDt2V23d9v5Vv1J+yCKVek5aDtiH4vNs2zAyiki+ZbPHy69gUb
 c1vU41GPSs5nCqKrcuGjWRJTAQmsRcelNfcx3iSz6iYN2XEB4EAbly/EEa1psUPdmnvrNdC48Bh
 KRLAilAT6JR+c
X-Received: by 2002:a05:6512:3157:b0:4f8:7617:6445 with SMTP id
 s23-20020a056512315700b004f876176445mr11589749lfi.48.1689065241193; 
 Tue, 11 Jul 2023 01:47:21 -0700 (PDT)
X-Received: by 2002:a05:6512:3157:b0:4f8:7617:6445 with SMTP id
 s23-20020a056512315700b004f876176445mr11589724lfi.48.1689065240821; 
 Tue, 11 Jul 2023 01:47:20 -0700 (PDT)
Received: from redhat.com ([2.52.3.112]) by smtp.gmail.com with ESMTPSA id
 v15-20020a1cf70f000000b003fa8158135esm12359147wmh.11.2023.07.11.01.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 01:47:20 -0700 (PDT)
Date: Tue, 11 Jul 2023 04:47:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Mario Casquero <mcasquer@redhat.com>
Subject: Re: [PATCH v3 3/7] arm/virt: Use virtio-md-pci (un)plug functions
Message-ID: <20230711044647-mutt-send-email-mst@kernel.org>
References: <20230710100714.228867-1-david@redhat.com>
 <20230710100714.228867-4-david@redhat.com>
 <20230710173933-mutt-send-email-mst@kernel.org>
 <b9351bf7-cabd-784c-bebc-a18a9b3f4bc1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b9351bf7-cabd-784c-bebc-a18a9b3f4bc1@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: maUx7ctL4CnH

On Tue, Jul 11, 2023 at 10:32:31AM +0200, David Hildenbrand wrote:
> On 10.07.23 23:40, Michael S. Tsirkin wrote:
> > > @@ -2855,12 +2796,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
> > >                                        SYS_BUS_DEVICE(dev));
> > >           }
> > >       }
> > > +
> > >       if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > >           virt_memory_plug(hotplug_dev, dev, errp);
> > > -    }
> > > -
> > > -    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> > > -        virt_virtio_md_pci_plug(hotplug_dev, dev, errp);
> > > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
> > > +        virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
> > >       }
> > >       if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> > 
> > 
> > How is this supposed to link if virtio-md is disabled at compile time?
> > 
> 
> Good point.
> 
> The old code unconditionally enabled MEM_DEVICE, so we never required subs
> for that.
> 
> We either need stubs or have to wrap this in #ifdef.
> 
> Stubs sound cleaner.

That is what we usually do, yes.

-- 
MST

