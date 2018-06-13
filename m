Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1272750wrq;
        Wed, 13 Jun 2018 15:37:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKMqDzwSSGaERpI+MwVGxTOQakKiDQhwz4BlYBCwe91xDD+4Va4BA9jwwjMYG4XRycUj5QV
X-Received: by 2002:ac8:8c6:: with SMTP id y6-v6mr56044qth.103.1528929440055;
        Wed, 13 Jun 2018 15:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528929440; cv=none;
        d=google.com; s=arc-20160816;
        b=GtxNf9pOXBl5BZpntjutCM6SHVOk9DiVe8dm8E9Lus5s2iHMZ3uVzgf4BcPiyFctam
         EmbyUW9O7rM5qnhqZ+184H0JllzKbQUQUX/pMrNP/AwWZYU0levbslbS7Zr+FpMXYe//
         x8i3v2axYMOnfp9LN+64r7X/quQQ8FKtlMfjlmW73NxggiRC0aKAWM/crcsDMGZuGpNP
         I/ZRJGysrOCP1xRRIrj92WpgpOJqTlvFv1XxCV7YueAMfRs3vTgc6AkZfdxX0VKxScxt
         9gimLO0k0Pb4NrqN4mKNs+9dszh0j0MKoCrh1C4074FaglqkQvYNmY4lsDGPAvywCKfb
         4B3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=U9fTqi1D0zuz5fLKuymQP+0ZiGrJy8gyoXTBhDqSkyg=;
        b=NO5Svt+AAr8+QzNnCziC2CJGd+L2tS/AiW4s+QGEIboHPLgPZR2aGZjxWGZF7pLgr/
         UBu58SSpRiP7Erb6I3UIfrlFWaHArIHlz8gjszpZ3lHj5/oaArgfo9IYK/tvGQdcwPiM
         Vmd/jn3T/iY5C/JCN0BZlzC3xY5cbCfxssQdTKwSGhKnH54AdFO1DDQ++uvMUI8JAEB4
         Qg1TJOTGjU1FBkG+MGg2J128nUNN70j2ruFmptJBx6qDVFdMKl+56rGJk9UVbbt1Hw9a
         lgzg33fcutwM2h047cIzvnPWxNkJukJdxAWeu7H9ZBmAQ6NxD0qQMQpRWa5lvpAj568u
         0nZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v52-v6si103056qtc.356.2018.06.13.15.37.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 15:37:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTEOF-0002WV-Jt
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 18:37:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fTENT-00026D-Sn
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 18:36:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fTENQ-0004NX-Pj
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 18:36:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36896 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fTENQ-0004Mz-K4; Wed, 13 Jun 2018 18:36:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0EA9C400E9BA;
	Wed, 13 Jun 2018 22:36:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 691962024CA1;
	Wed, 13 Jun 2018 22:36:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6376C96A36; Thu, 14 Jun 2018 00:36:25 +0200 (CEST)
Date: Thu, 14 Jun 2018 00:36:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Message-ID: <20180613223625.lf6xkzgipzkfslit@sirius.home.kraxel.org>
References: <20180613084149.14523-1-kraxel@redhat.com>
	<20180613084149.14523-4-kraxel@redhat.com>
	<20180613135047.5c1ce227@w520.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180613135047.5c1ce227@w520.home>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 13 Jun 2018 22:36:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 13 Jun 2018 22:36:28 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4 3/3] hw/vfio/display: add ramfb support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Laine Stump <laine@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?utf-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gHBqJizA0pCh

On Wed, Jun 13, 2018 at 01:50:47PM -0600, Alex Williamson wrote:
> On Wed, 13 Jun 2018 10:41:49 +0200
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > So we have a boot display when using a vgpu as primary display.
> > 
> > Use vfio-pci-ramfb instead of vfio-pci to enable it.
> 
> Using a different device here seems like it almost guarantees a very
> complicated path to support under libvirt.  What necessitates this
> versus a simple ramfb=on option to vfio-pci?

Well, it's simliar to qxl vs. qxl-vga.  It's not qxl,vga={on,off} and
libvirt has no problems to deal with that ...

Another more technical reason is (again) hotplug.  ramfb needs an fw_cfg
entry for configuration, and fw_cfg entries can't be hotplugged.  So
hotplugging vfio-pci with ramfb=on isn't going to fly.  So we need a
separate device with hotplug turned off.

> I'm also not sure I understand the usage model, SeaBIOS and OVMF know
> how to write to this display, but it seems that the guest does not.

Yes.

> I suppose in the UEFI case runtime services can be used to continue
> writing this display,

Yes.

> but BIOS doesn't have such an option, unless we're somehow emulating
> VGA here.

vgabios support is in the pipeline, including text mode emulation (at
vgabios level, direct access to vga window @ 0xa0000 doesn't work).

> So for UEFI, I can imagine this
> covers us from power on through firmware boot and up to guest drivers
> initializing the GPU (assuming the vGPU supports a kernel mode driver,
> does NVIDIA?),

Yes.  Shouldn't matter whenever the driver is kernel or userspace.

> but for BIOS it seems we likely still have a break from
> the bootloader to GPU driver initialization.

Depends.  vgacon (text mode console) doesn't work.  fbcon @ vesafb works.

> For instance, what driver
> is used to draw the boot animation (or blue screen) on SeaBIOS Windows
> VM?

Windows depends on vgabios for that and it works fine.

> I'm assuming that this display and the vGPU display are one in the
> same, so there's some cut from one to the other.

Yes.  If the vfio query plane ioctl reports a valid guest video mode
configuration the vgpu display will be used, ramfb otherwise.

cheers,
  Gerd

