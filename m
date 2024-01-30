Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1003655ejk;
        Tue, 30 Jan 2024 10:23:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyViVOyyY/Xxvx90Txaq419/BmEvfdtm4YSlLQGn/G3ECQ/FJuUPUGicYu3GFEwVqB9uVp
X-Received: by 2002:a05:622a:1107:b0:42b:7b4d:9087 with SMTP id e7-20020a05622a110700b0042b7b4d9087mr1611009qty.12.1706638997549;
        Tue, 30 Jan 2024 10:23:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706638997; cv=none;
        d=google.com; s=arc-20160816;
        b=jz5n9tJB3JdWOm1jmCH0k5axQJlvlV7ofvYsOH4J1hjqrWd28cKBzLcoyPn77+xtlL
         X90KklPaTn+jAmpEncaypIHFGfwQfYcFQNFIF/hjQ6ucfDn/gv96FBJUN9OpND5b1KlB
         TRU8cMv2/Bg6f3xjvd3HlLSD6QgoBNy/wK2ypooqnXwiAjg4vvgID6FCgqLm2HemxBCs
         Y+0/rfE+F4ijzcnGg+0e7rm9SocSKCVSvUC4pvjKO4zMF7oBznBKEqbes3P+d7z4ujUm
         OBcHQq6jOW40PI2MQFAbSB4QgY60vtNi/bL0cuEl2dSi4RxNd5tDElyEwUhIGZFaaSsn
         sHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=G4Izx0gWQsWPxxN+vAB1x1DHKO2iahuZK3MEndem/T8=;
        fh=mp/Ej3Yo9yBAeFXj9QpsLfvBMSxI/4cbSphjodAxBw4=;
        b=0lCtVyZb1wI4luPAxkPHy3UDT0eLBvJp8QY7VJT4og1R94VMl+PGT3ityi8oljYWWr
         zfvUnHfSAMzB26b5svNWVWouYCnX3BoqcOKkN7b+RJOXKjF9t3UQEgqEZSp8NITWUZ2s
         MRoecCt66bo2tbf2RB6BAB9vH2S9Y4o0d53iHVVLh/4lbqMxMGRlb9noN9ltMPdzCiVy
         jjytVbZAseGYGfr57cBwhE/FHg9Jx2HRmHWSB9STSwsJKrROf7WVZqOjN61NsoSRl/zP
         D2hoyST/ZHqOCtKKTnG9mcsIkx8E4697CIpwgabRJNr3jzXC96UCAre5ruSqLna2yNfi
         eqCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=idzRlbMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05622a199400b0042ab7b2e65bsi1723008qtc.7.2024.01.30.10.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 10:23:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=idzRlbMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUskv-0005PL-Tu; Tue, 30 Jan 2024 13:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1rUsku-0005Op-DO
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 13:22:44 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1rUsks-0000y2-Np
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 13:22:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fafd3ebb5so4658505e9.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 10:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706638960; x=1707243760; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=G4Izx0gWQsWPxxN+vAB1x1DHKO2iahuZK3MEndem/T8=;
 b=idzRlbMp3/OkNe2eTNAU8IKMc+ljB08FZSgOSvymP/gzsnU3Oh8XDbKZsl4C8oGfJE
 ow9AmwV59E6MV56R15G5+zvelugucxSvYpk69j6QZKq79s2QRPgxB5kJkpM0lCW0TFD4
 AERXqqJLO/bQA99gwImsp96JSd0VwHsdEpf2s/3MoUi3kPkIS9Rghnn0dWuCA56KmFgW
 eWbQR8il+pW9KlLwho6JTxduZuCt2zcn+Kx8BhQC7arfwbxOnqJMbaEvIUdo1JpT+lVT
 HLsEHkF/zS53KoAYmUjsyQ0+9wc37OMhckiKm852pwrg7RWeqNtooae7XUqJpZukUfRa
 lZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706638960; x=1707243760;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G4Izx0gWQsWPxxN+vAB1x1DHKO2iahuZK3MEndem/T8=;
 b=ViRu7RxH7k4Z19Q60RRtPXI6d8ahzaSnGox8YnlE5SN9eS7X7lAZY6a4WfLtMkmjgt
 DQQCubHUrR9LB14cNXBpY0dBZKm1M81Yikalu+d8/UejtHnqg2AoThLEvXIVjf2Omk7r
 tmIyfiE3qqwSnxMD8Nc2CGAjwGFdKNtyhiAsj4FynCjejYbHw6duzBLbVJc48/4jb+rQ
 KWxuLSiSn1IoVcWgXdjwE9pRQ8SD//7RaNPEvk8YBFwcLSqf+W8TQ0FH05ShdWZ7ObLi
 sFuVMCrY19WxOme+yzDjfPBkTTJwYLKUsYFxywmVUimzNZpCye9dn+IEQjJaHtfUFq29
 F7PQ==
X-Gm-Message-State: AOJu0YytWwibHeCUiZMXASVj5CpDUWFk4X1d65E+VmGR1YlzgzJkzAud
 wvycabt9zdOjt/q75EfLCPqM+hr2m1SITA4ZxDJuE786XnphPu57XRC8GOJw9Mk=
X-Received: by 2002:a05:600c:1ca3:b0:40e:f3ee:5622 with SMTP id
 k35-20020a05600c1ca300b0040ef3ee5622mr6494091wms.11.1706638959821; 
 Tue, 30 Jan 2024 10:22:39 -0800 (PST)
Received: from myrica ([2.221.137.100]) by smtp.gmail.com with ESMTPSA id
 bv25-20020a0560001f1900b0033aec64ba7dsm6657461wrb.78.2024.01.30.10.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 10:22:39 -0800 (PST)
Date: Tue, 30 Jan 2024 18:22:39 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "yanghliu@redhat.com" <yanghliu@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "clg@redhat.com" <clg@redhat.com>
Subject: Re: [RFC 0/7] VIRTIO-IOMMU/VFIO: Fix host iommu geometry handling
 for hotplugged devices
Message-ID: <20240130182239.GA1392966@myrica>
References: <20240117080414.316890-1-eric.auger@redhat.com>
 <SJ0PR11MB6744C50921CC63221A93C75492712@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <7bc955a1-f58d-43b1-8e95-c452bb11f208@redhat.com>
 <20240125184822.GB122027@myrica>
 <db8d6171-acd2-4e1e-9c25-c7d12fa26de4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db8d6171-acd2-4e1e-9c25-c7d12fa26de4@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: tL6tCSWuzrvn

On Mon, Jan 29, 2024 at 05:38:55PM +0100, Eric Auger wrote:
> > There may be a separate argument for clearing bypass. With a coldplugged
> > VFIO device the flow is:
> >
> > 1. Map the whole guest address space in VFIO to implement boot-bypass.
> >    This allocates all guest pages, which takes a while and is wasteful.
> >    I've actually crashed a host that way, when spawning a guest with too
> >    much RAM.
> interesting
> > 2. Start the VM
> > 3. When the virtio-iommu driver attaches a (non-identity) domain to the
> >    assigned endpoint, then unmap the whole address space in VFIO, and most
> >    pages are given back to the host.
> >
> > We can't disable boot-bypass because the BIOS needs it. But instead the
> > flow could be:
> >
> > 1. Start the VM, with only the virtual endpoints. Nothing to pin.
> > 2. The virtio-iommu driver disables bypass during boot
> We needed this boot-bypass mode for booting with virtio-blk-scsi
> protected with virtio-iommu for instance.
> That was needed because we don't have any virtio-iommu driver in edk2 as
> opposed to intel iommu driver, right?

Yes. What I had in mind is the x86 SeaBIOS which doesn't have any IOMMU
driver and accesses the default SATA device:

 $ qemu-system-x86_64 -M q35 -device virtio-iommu,boot-bypass=off
 qemu: virtio_iommu_translate sid=250 is not known!!
 qemu: no buffer available in event queue to report event
 qemu: AHCI: Failed to start FIS receive engine: bad FIS receive buffer address

But it's the same problem with edk2. Also a guest OS without a
virtio-iommu driver needs boot-bypass. Once firmware boot is complete, the
OS with a virtio-iommu driver normally can turn bypass off in the config
space, it's not useful anymore. If it needs to put some endpoints in
bypass, then it can attach them to a bypass domain.

> > 3. Hotplug the VFIO device. With bypass disabled there is no need to pin
> >    the whole guest address space, unless the guest explicitly asks for an
> >    identity domain.
> >
> > However, I don't know if this is a realistic scenario that will actually
> > be used.
> >
> > By the way, do you have an easy way to reproduce the issue described here?
> > I've had to enable iommu.forcedac=1 on the command-line, otherwise Linux
> > just allocates 32-bit IOVAs.
> I don't have a simple generic reproducer. It happens when assigning this
> device:
> Ethernet Controller E810-C for QSFP (Ethernet Network Adapter E810-C-Q2)
> 
> I have not encountered that issue with another device yet.
> I see on guest side in dmesg:
> [    6.849292] ice 0000:00:05.0: Using 64-bit DMA addresses
> 
> That's emitted in dma-iommu.c iommu_dma_alloc_iova().
> Looks like the guest first tries to allocate an iova in the 32-bit AS
> and if this fails use the whole dma_limit.
> Seems the 32b IOVA alloc failed here ;-)

Interesting, are you running some demanding workload and a lot of CPUs?
That's a lot of IOVAs used up, I'm curious about what kind of DMA pattern
does that.

Thanks,
Jean
