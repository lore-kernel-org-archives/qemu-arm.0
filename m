Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1805846wrq;
        Thu, 14 Jun 2018 02:49:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJYMB0gownDXy5pBevNtpX891grS1wcrPc1xz2J3uNWTx29CCyWv+q62/AaXlH0zyedGpMG
X-Received: by 2002:ac8:3808:: with SMTP id q8-v6mr1607965qtb.354.1528969788352;
        Thu, 14 Jun 2018 02:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528969788; cv=none;
        d=google.com; s=arc-20160816;
        b=RpPXtx+O1IG0ZYy/4ezC57kSWDHgF6ekeyI2IkLUCuAVQdrZYLNQXmZm+WkbTY5pj2
         o6KOs6eEkV5CGUyUbkxCpARIVxWYEDunrcshZCpcEYcK4Kgibz5cBY9WN5N0ThFjDEp5
         PAme9vHrUXqdwKrHtvVlL1WL0q5m7KOA1UM5KXhXKFI97FKdrQckWPxG9mnGnMwJ+ZaZ
         f4tXEhPaw17sP6o0gdHbWg1nTjCjw3iKOIqoip/STysxajOzjBMiyqGE0vMWVk0qmgiX
         433inUhMJma4wIX8L2P9ImD8gsnjp4IeY+FTEJ75esHWFVmHunUexAXwMQEdDVTVZshi
         cZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=saJJzeIhq8eKMP/uiLimh04s/eo+G/TucDaVM9Y7wx4=;
        b=h/LPL9w3yZZGoT5bz9GlCacPgRgHWE3uwwNK0L590uqOrUUoWI92JLSdoAZ3GvYj65
         0y5tP3oKYMBl1fpTwkgD4Iw09Hx7IqyAaZFeBrdZwNFRkHLBZRv5/yM2UgnT55tKNazI
         JBz2WZXBYi2dLkcBr6+Uy0/BCCPzE5mkE90bObtDav8YjMPcTi2/qxLqyeQ1uHDXRFPl
         uhQp3/G+YpUPhkf0oeq4+E/BBtMKuwg5aHKgSzGu673aQKOGMZL9Z8QK9UzA6UveTMje
         reF2TG1Q/iDYHuYdGSM4xFsQXMilFTZG89QrTKqZloyy8iSGXPOCIJ5k1/Kqex2D7MPX
         FreQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1-v6si2905908qtc.6.2018.06.14.02.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 02:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTOt1-0000fQ-S8
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 05:49:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eskultet@redhat.com>) id 1fTOsb-0000dX-4W
	for qemu-devel@nongnu.org; Thu, 14 Jun 2018 05:49:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eskultet@redhat.com>) id 1fTOsa-0005Ow-1G
	for qemu-devel@nongnu.org; Thu, 14 Jun 2018 05:49:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36778 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eskultet@redhat.com>)
	id 1fTOsT-0005NQ-RF; Thu, 14 Jun 2018 05:49:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 439FB401EF06;
	Thu, 14 Jun 2018 09:49:12 +0000 (UTC)
Received: from beluga.usersys.redhat.com (unknown [10.43.2.166])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A30F1117628;
	Thu, 14 Jun 2018 09:48:58 +0000 (UTC)
Date: Thu, 14 Jun 2018 11:48:56 +0200
From: Erik Skultety <eskultet@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20180614094856.GD2220@beluga.usersys.redhat.com>
References: <20180613084149.14523-1-kraxel@redhat.com>
	<20180613084149.14523-4-kraxel@redhat.com>
	<20180613135047.5c1ce227@w520.home>
	<20180613223625.lf6xkzgipzkfslit@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180613223625.lf6xkzgipzkfslit@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 14 Jun 2018 09:49:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 14 Jun 2018 09:49:12 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eskultet@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v4 3/3] hw/vfio/display: add ramfb support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Laine Stump <laine@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?utf-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XX0PFU8NEgD4

On Thu, Jun 14, 2018 at 12:36:25AM +0200, Gerd Hoffmann wrote:
> On Wed, Jun 13, 2018 at 01:50:47PM -0600, Alex Williamson wrote:
> > On Wed, 13 Jun 2018 10:41:49 +0200
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > > So we have a boot display when using a vgpu as primary display.
> > >
> > > Use vfio-pci-ramfb instead of vfio-pci to enable it.
> >
> > Using a different device here seems like it almost guarantees a very
> > complicated path to support under libvirt.  What necessitates this
> > versus a simple ramfb=on option to vfio-pci?
>
> Well, it's simliar to qxl vs. qxl-vga.  It's not qxl,vga={on,off} and
> libvirt has no problems to deal with that ...
>
> Another more technical reason is (again) hotplug.  ramfb needs an fw_cfg
> entry for configuration, and fw_cfg entries can't be hotplugged.  So
> hotplugging vfio-pci with ramfb=on isn't going to fly.  So we need a
> separate device with hotplug turned off.

Well if that's not supposed to work ever, libvirt's hotplug code could format
the following FWIW:
"-device vfio-pci [opts],ramfb=off"

As such, new device wouldn't be that of an issue for libvirt if vfio-pci and
vfio-pci-ramfb are back to back compatible with all the device options that are
available for vfio-pci (I mean in terms of using an mdev). Because in that
case, what libvirt could do is to look whether we're supposed to turn on the
display, if so, then we need support for this in capabilities to query and then
we could prefer this new device over the "legacy" vfio-pci one. However, if we
expect a case where QEMU would succeed to start with an mdev mapped to this
new ramfb device but not with vfio-pci, then that's an issue. Otherwise I don't
necessarily see a problem, if QEMU supports this new device and we need
display, let's use that, otherwise let's use the old vfio-pci device. But I'm
still curious about the ramfb=off possibility I asked above for hotplug
nonetheless.

Thanks,
Erik

>
> > I'm also not sure I understand the usage model, SeaBIOS and OVMF know
> > how to write to this display, but it seems that the guest does not.
>
> Yes.
>
> > I suppose in the UEFI case runtime services can be used to continue
> > writing this display,
>
> Yes.
>
> > but BIOS doesn't have such an option, unless we're somehow emulating
> > VGA here.
>
> vgabios support is in the pipeline, including text mode emulation (at
> vgabios level, direct access to vga window @ 0xa0000 doesn't work).
>
> > So for UEFI, I can imagine this
> > covers us from power on through firmware boot and up to guest drivers
> > initializing the GPU (assuming the vGPU supports a kernel mode driver,
> > does NVIDIA?),
>
> Yes.  Shouldn't matter whenever the driver is kernel or userspace.
>
> > but for BIOS it seems we likely still have a break from
> > the bootloader to GPU driver initialization.
>
> Depends.  vgacon (text mode console) doesn't work.  fbcon @ vesafb works.
>
> > For instance, what driver
> > is used to draw the boot animation (or blue screen) on SeaBIOS Windows
> > VM?
>
> Windows depends on vgabios for that and it works fine.
>
> > I'm assuming that this display and the vGPU display are one in the
> > same, so there's some cut from one to the other.
>
> Yes.  If the vfio query plane ioctl reports a valid guest video mode
> configuration the vgpu display will be used, ramfb otherwise.
>
> cheers,
>   Gerd
>
