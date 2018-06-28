Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7244489wrq;
        Thu, 28 Jun 2018 03:22:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfWQwaM0fW8MxcVVoQmCZzXbD/hEi3SpO2aL1JORgJHCzFcP58vWnsmPFn6w4fvO6vCUmCn
X-Received: by 2002:a0c:d789:: with SMTP id z9-v6mr8607702qvi.87.1530181351412;
        Thu, 28 Jun 2018 03:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530181351; cv=none;
        d=google.com; s=arc-20160816;
        b=pHMfvDr8qus73xP6GuG+n+n2eSAttevoR1L4e61i7Ehx3chrNp5MZmpCr0RA34nVIn
         H4c7b4kWRILSF6A84aRS6h/jw3++kfqX1JP942aZM4e4x63U0tz4qxIlCtp0bt7mXfeA
         E0hMxnl40zxBsU8raoRQ/sZ6tUdV3bVKz7xjgF4hLBS49xovTCzqSRPU7MnLn/i09qzd
         YkxT3hodPR0gB5xS/fwWNncDnkLaKWH7yV//6lgmBNXFRwWe5RgcN6MC3sIM/H6gUP/I
         ZHkH/gcF3pijndBgj4+oWtFObnmeUsJki4jm+RVxLJZLOQKrzqlW8kkX4Wb01RcLAEQx
         D6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=I55SGFbXYXyVtVxpDUPVYUXNgJMfCjIwVv61WXW1Ca4=;
        b=rRbRn8Mq3+4/qpcbcJcKOOC2pJ3mRdjcTss1q1QOg8C4fdr3TI7nGEbAmHC09zLVwu
         8XCcpPZMODVbOxcf66f0CTeaebndnxMiSyak4GRCQ8N3VMNd33VktifQxnfsSAO9akkr
         oeATgO2sdQ1n40zVh5u6vvDSc6GnF/6E2G8eiPSl1OLShfknPLtTH2hLFufsGCttPO1b
         k1oyAbKcULVuMr+oE+KnXy5uetQU3fMBwWCRem4ImOTiTO6GPGNA40yeILZFma3xgFNG
         utjUWXpUsQ+mC1xoWn6jPqa9xJqFuf4VCDPAxynexVN8nOfAJLOto3Gm5qHkcjOcyytr
         toSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2-v6si1856396qki.143.2018.06.28.03.22.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 03:22:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYU4M-00044U-VL
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 06:22:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fYU4G-00044O-5D
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 06:22:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fYU4C-0007Zt-RX
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 06:22:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58522 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fYU4C-0007Yt-ME; Thu, 28 Jun 2018 06:22:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C656818F03A;
	Thu, 28 Jun 2018 10:22:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9AB31C723;
	Thu, 28 Jun 2018 10:22:18 +0000 (UTC)
Date: Thu, 28 Jun 2018 11:22:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20180628102216.GC3513@redhat.com>
References: <1530094388-607-1-git-send-email-hongbo.zhang@linaro.org>
	<20180627123116.GB2424@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180627123116.GB2424@work-vm>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 28 Jun 2018 10:22:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 28 Jun 2018 10:22:20 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm: Add SBSA machine type
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nhT848L3NBL0

On Wed, Jun 27, 2018 at 01:31:17PM +0100, Dr. David Alan Gilbert wrote:
> * Hongbo Zhang (hongbo.zhang@linaro.org) wrote:
> > This patch introduces a new Arm machine type 'SBSA' with features:
> >  - Based on legacy 'virt' machine type.

The 'virt' machine type is absolutely *not* legacy. It is the preferred
modern, legacy-free machine type when running virtual machines. Since
aarch64 is greenfield, there is no compelling reason to emulate a
specific physical machine for VMs, hence the 'virt' machine type.

> >  - Newly designed memory map.
> >  - EL2 and EL3 are enabled by default.
> >  - AHCI controller attached to system bus, and then CDROM and hard disc
> >    can be added to it.
> >  - EHCI controller attached to system bus, with USB mouse and key board
> >    installed by default.
> >  - E1000 ethernet card on PCIE bus.

> >  - VGA display adaptor on PCIE bus.
> >  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
> >  - No virtio functions enabled, since this is to emulate real hardware.
> 
> I'm a bit confused; do you have real modern ARM hardware that has an
> e1000 on it?  If I understand correctly, e1000 is the old PCI version
> and the e1000e is at least the more modern PCIe version which makes
> more sense if you're building on PCIe.

Indeed, it makes little sense to default to e1000 if the goal is to make
it legacy-free

> However, if you:
>   a) Don't have real hardware with the e1000 on
>   b) Do have PCIe
> 
> then to my mind it makes sense to use virtio-net-pci rather than
> an e1000e.

If it does down the virtio-* route though, I fail to see any point in
adding the new machine type at all -  'virt' machine type is intended
to be used for guests where everything is paravirtualized, ignoring
physical hardware constraints.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
