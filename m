Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3796479wrt;
        Fri, 30 Nov 2018 08:59:21 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VLnyjiw95OEsTQrrY9WzJkAL0AfIalKxxFz6L7UXJ0V7mv0ufBEis1ucXWsP58C2Xr2xA1
X-Received: by 2002:a25:a024:: with SMTP id x33-v6mr6116489ybh.273.1543597161121;
        Fri, 30 Nov 2018 08:59:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543597161; cv=none;
        d=google.com; s=arc-20160816;
        b=WJzk2MQFVooZzpNGq4tW6aP5T4uzEZlgz7+yulovo7/V2QlB/HoAisEiFDTMRVQi4r
         An6iT8N0mROOwN4t+yCWdupxGGXg2pDdb2FluTvBa8VCUhd0qb71j71fUpcVqhgjMxct
         cjSm4oxjveKIy9DFs846oTRG0FaS2eLjMHZvyu6ioCdpp8ps+XX8dTCfWeeMaSmttQwN
         1IYeKu/wLWPG1bUZXUvTK78MY2ya2TX6OM4nJ6TV1+4Qv2dX6mhRaSk8d7lrPdx9I+rj
         DOZqv8PXwRa3f5P9H0nyVXJQdd4Y12yP69yCy5jZZ9oISr6TPFhHimCzgq20LQXAr+o/
         p4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8mhn5ebHNSXj0JlKhiO1Aiz8ATK9Iiht3Lm3cODMTn4=;
        b=LWfuTXmbFc22k6F7ezwgUPfJ0rUo0Y2xCj4IwX4B3kF9PfXCciN7KRGubqLwZL9DTr
         Nj+/UmxAFF0tUi1a1kaDqGG5WbeYVTfQK/CqDmFdnnZbBbWr1r/EkGIPYKlQfVY3yvdM
         d+i7ja2m1b5tuIDhQUGOk6uNSYSpFgnDrtJD/oQB6wHtAaV8PRqI3SpQbQr+HHR8sIqn
         Q7d8J1iuXhnWdrw3c/lMb03hT8LWH8k/4yp5P0NlbTJsgCsc0yNll6yr8CNJ+J27ZJ15
         yR9PQ0FlyekAQ8XZwJCTPesLtbZqvVAbAyKQvoqM09C0mRYmTawgDtC4r1Jv2qbI45rd
         +NHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UUGsuyAp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x136si3447384ywx.424.2018.11.30.08.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 08:59:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UUGsuyAp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSm8O-00050D-J6
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 11:59:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSm7F-0003d1-EQ
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 11:58:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSm7D-0004XB-QE
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 11:58:09 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39650)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSm7D-0004Wa-Hs
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 11:58:07 -0500
Received: by mail-ot1-x342.google.com with SMTP id n8so1845380otl.6
	for <qemu-devel@nongnu.org>; Fri, 30 Nov 2018 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8mhn5ebHNSXj0JlKhiO1Aiz8ATK9Iiht3Lm3cODMTn4=;
	b=UUGsuyAphvA5N1i7pfVR6LxlsP4NvkeSkQpSThJIJM4e+Innj3QvkKYCgd0uVUZpFP
	/NTBi/jbFRf9r8jzXTGhiPEK3tczLcgo3VSHCHiC5Mp7OnKd7Wk6Fo3eHNEKfxmjyhxK
	K6erKLl/FmkKMfDWHoAGq9ROKOhypNO7b3BuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8mhn5ebHNSXj0JlKhiO1Aiz8ATK9Iiht3Lm3cODMTn4=;
	b=CGIxqd64yk2PdLzOWQkhOvnyndjzNpwMTr1cwvG331Jhju1R3nMGz6kXuXxnn51GvS
	OAzMjpCyQw5zGQyIC8ATVzqcLig3XdLcbPn+cEdGTUiSHbYdGfmGBB/0TpVaIejb4jDe
	9bFOrRmslgbYuVFi9fM4GEi1y0cv9DuBwaud2cpR5CCZkhI+ZRAn/unVDcURr+4p8TDK
	OhM48L/TLNDDi/QlpLki/TjTqG2OM09+C393b/Nq0bFwgBzxGCWxUMqI5r0tQYmZ70wj
	hxZSOohN4lhFcUNCWuBY4AFbZw7rcM+whcHEHzziMhyqFsLx1kcViD2U8iLwVYT1d1fa
	5G6g==
X-Gm-Message-State: AA+aEWaF8+8CsBMBozEDMr92z4Ny/9PZ8kRHySoxFbOYGzP2bB5tYqya
	MW97mSCxcf2z6AeJ/4OJmuxP+65xQsQb3kiDR4ajvw==
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr3866347otq.316.1543597086237; 
	Fri, 30 Nov 2018 08:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20181130093852.20739-1-maozhongyi@cmss.chinamobile.com>
In-Reply-To: <20181130093852.20739-1-maozhongyi@cmss.chinamobile.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 16:57:55 +0000
Message-ID: <CAFEAcA_OF=58BwNdUeRVuK72XenY7bPLk0VVrYop4+C4A0wL_g@mail.gmail.com>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v3 00/21] QOM'ify SysBusDeviceClass->init
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
Cc: David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-s390x <qemu-s390x@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: faJcEmCs2GWU

On Fri, 30 Nov 2018 at 09:39, Mao Zhongyi
<maozhongyi@cmss.chinamobile.com> wrote:
>
> v3 -> v2:
>
> - rebase to the HEAD
> - use SysBusDevice *sbd variable in patch15

> Mao Zhongyi (21):
>   musicpal: Convert sysbus init function to realize function
>   block/noenand: Convert sysbus init function to realize function
>   char/grlib_apbuart: Convert sysbus init function to realize function
>   core/empty_slot: Convert sysbus init function to realize function
>   display/g364fb: Convert sysbus init function to realize function
>   dma/puv3_dma: Convert sysbus init function to realize function
>   gpio/puv3_gpio: Convert sysbus init function to realize function
>   milkymist-softusb: Convert sysbus init function to realize function
>   input/pl050: Convert sysbus init function to realize function
>   intc/puv3_intc: Convert sysbus init function to realize function
>   milkymist-hpdmc: Convert sysbus init function to realize function
>   milkymist-pfpu: Convert sysbus init function to realize function
>   puv3_pm.c: Convert sysbus init function to realize function
>   nvram/ds1225y: Convert sysbus init function to realize function
>   pci-bridge/dec: Convert sysbus init function to realize function
>   timer/etraxfs_timer: Convert sysbus init function to realize function
>   timer/grlib_gptimer: Convert sysbus init function to realize function
>   timer/puv3_ost: Convert sysbus init function to realize function
>   usb/tusb6010: Convert sysbus init function to realize function
>   xen_backend: remove xen_sysdev_init() function
>   core/sysbus: remove the SysBusDeviceClass::init path
>
>  hw/arm/musicpal.c            |  9 ++++-----
>  hw/block/onenand.c           | 16 +++++++---------
>  hw/char/grlib_apbuart.c      | 12 +++++-------
>  hw/core/empty_slot.c         |  9 ++++-----
>  hw/core/sysbus.c             | 15 +++++----------
>  hw/display/g364fb.c          |  9 +++------
>  hw/dma/puv3_dma.c            | 10 ++++------
>  hw/gpio/puv3_gpio.c          | 29 ++++++++++++++---------------
>  hw/input/milkymist-softusb.c | 16 +++++++---------
>  hw/input/pl050.c             | 11 +++++------
>  hw/intc/puv3_intc.c          | 11 ++++-------
>  hw/misc/milkymist-hpdmc.c    |  9 +++------
>  hw/misc/milkymist-pfpu.c     | 12 +++++-------
>  hw/misc/puv3_pm.c            | 10 ++++------
>  hw/nvram/ds1225y.c           | 12 +++++-------
>  hw/pci-bridge/dec.c          | 12 ++++++------
>  hw/timer/etraxfs_timer.c     | 14 +++++++-------
>  hw/timer/grlib_gptimer.c     | 11 +++++------
>  hw/timer/puv3_ost.c          | 13 ++++++-------
>  hw/usb/tusb6010.c            |  8 +++-----
>  hw/xen/xen_backend.c         |  7 -------
>  include/hw/sysbus.h          |  3 ---
>  22 files changed, 106 insertions(+), 152 deletions(-)

I think all these patches have now been reviewed. Does anybody
have a preference for which tree it goes through, given that it
touches lots of devices?

I can take this via target-arm, unless anybody would particularly
like to have some or all of it go some other route.

thanks
-- PMM
