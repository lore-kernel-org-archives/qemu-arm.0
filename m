Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp804576lfm;
        Tue, 7 Jul 2020 03:26:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJa+t37+m485sZd889O1WbC+H1SuxKeLD6XhvhxUpZ9IBxerZ4F8P7y34fKats1mnjLYKR
X-Received: by 2002:a54:4e87:: with SMTP id c7mr2796377oiy.110.1594117583011;
        Tue, 07 Jul 2020 03:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594117583; cv=none;
        d=google.com; s=arc-20160816;
        b=wAG3ryDxhBj4O6XOX12YxhF52pmxe0GpFOoehIQeUyk4L4eEYhSFIv1ShcrjnuH5J7
         tA0xi7zzSBRnbAKBDN4pQd8GwaayKEwvNYVD9ji8NiGUfoB6Vr8epwb8OTKpbctBoXph
         1L4F7EnujPb6Z4l8wx53ni9OQn0K68Q3coXc3blvOpjmrrOOj/7WJnON3Elkw3KZmWPG
         Kj/M8JH1OTiyvBLnSyrtnd4jsMdVUW5QkC7Rn5Zjfo6aun3GRx+IdGnIZTXO6D5nLMuw
         6X6kTkbX7VJ4NWE7dot9no0w0+fIi1xgREy44WAl3MWCMNasJngCTkyYfCrTS5lWanqB
         0Bbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:user-agent:in-reply-to:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=Ksh7qm6adGST/ZaaaSRGOC5KkyimhdVy3s/dSUsS2wc=;
        b=UOrjMtpukMWkaYRvoZM6IANB09MZP3zPrvhojf9BZ4AY5iJc1LBat83eA+l1/z/4/T
         yg5ry+KpET5gSAlM/k7r/k+8b6pXZ3eCak2LscTTizQy8Zh6vSUb2f0VtJ+xndgEmfqj
         W8yN8E1pGXoBKRJHlc2HY271ImQL4HOjZMB77MQyhAvfrGxA9cNza7hhl6qdR1pyLkz9
         wEGNxMBywso3z1n1GuAKzVaxQR3CjaPGH8woSXljywGFCs7qZUnUByM5SJFoIIP++eTL
         0XA+DNWZrOgNT18c/lP31ZlS+Mlr0DmANuw7mC3WdA+vxx4JaCzDBy2grXLT0NsjEGrJ
         iFlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XGU6y4+S;
       spf=pass (google.com: domain of berrange@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id o7si390499otk.49.2020.07.07.03.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jul 2020 03:26:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XGU6y4+S;
       spf=pass (google.com: domain of berrange@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594117582;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=Ksh7qm6adGST/ZaaaSRGOC5KkyimhdVy3s/dSUsS2wc=;
	b=XGU6y4+StnZo91tkuOdh5X2SManb75uwPNIrht8vP2Q1v2ahhaoSOXfvCxU8zaMFIVYoL1
	+d7yZ/jb8mfbBsBShpa+eivTKSk9Jjjm5QgBEjkzW6HSgxreKerq80z7gqzBO9XgFHyK+0
	wTJj6ChglurfvG5t3HxzZHwgnEu/hZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-OgGMpmGzP4aC_p9nKwLp_w-1; Tue, 07 Jul 2020 06:25:55 -0400
X-MC-Unique: OgGMpmGzP4aC_p9nKwLp_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 742B2879511;
	Tue,  7 Jul 2020 10:25:50 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.57])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEF315D9F3;
	Tue,  7 Jul 2020 10:25:13 +0000 (UTC)
Date: Tue, 7 Jul 2020 11:25:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Paul Durrant <paul@xen.org>, Richard Henderson <rth@twiddle.net>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Lieven <pl@kamp.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Riku Voipio <riku.voipio@iki.fi>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Alistair Francis <alistair@alistair23.me>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-ppc@nongnu.org, qemu-block@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Chris Wulff <crwulff@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] trivial: Remove trailing whitespaces
Message-ID: <20200707102510.GF2649462@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200706162300.1084753-1-dinechin@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200706162300.1084753-1-dinechin@redhat.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TUID: GZBwt5uHOvEz

On Mon, Jul 06, 2020 at 06:23:00PM +0200, Christophe de Dinechin wrote:
> There are a number of unnecessary trailing whitespaces that have
> accumulated over time in the source code. They cause stray changes
> in patches if you use tools that automatically remove them.
> 
> Tested by doing a `git diff -w` after the change.
> 
> This could probably be turned into a pre-commit hook.

scripts/checkpatch.pl ought to be made to check it.

> 
> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
> ---
>  block/iscsi.c                                 |   2 +-
>  disas/cris.c                                  |   2 +-
>  disas/microblaze.c                            |  80 +++---
>  disas/nios2.c                                 | 256 +++++++++---------
>  hmp-commands.hx                               |   2 +-
>  hw/alpha/typhoon.c                            |   6 +-
>  hw/arm/gumstix.c                              |   6 +-
>  hw/arm/omap1.c                                |   2 +-
>  hw/arm/stellaris.c                            |   2 +-
>  hw/char/etraxfs_ser.c                         |   2 +-
>  hw/core/ptimer.c                              |   2 +-
>  hw/cris/axis_dev88.c                          |   2 +-
>  hw/cris/boot.c                                |   2 +-
>  hw/display/qxl.c                              |   2 +-
>  hw/dma/etraxfs_dma.c                          |  18 +-
>  hw/dma/i82374.c                               |   2 +-
>  hw/i2c/bitbang_i2c.c                          |   2 +-
>  hw/input/tsc2005.c                            |   2 +-
>  hw/input/tsc210x.c                            |   2 +-
>  hw/intc/etraxfs_pic.c                         |   8 +-
>  hw/intc/sh_intc.c                             |  10 +-
>  hw/intc/xilinx_intc.c                         |   2 +-
>  hw/misc/imx25_ccm.c                           |   6 +-
>  hw/misc/imx31_ccm.c                           |   2 +-
>  hw/net/vmxnet3.h                              |   2 +-
>  hw/net/xilinx_ethlite.c                       |   2 +-
>  hw/pci/pcie.c                                 |   2 +-
>  hw/sd/omap_mmc.c                              |   2 +-
>  hw/sh4/shix.c                                 |   2 +-
>  hw/sparc64/sun4u.c                            |   2 +-
>  hw/timer/etraxfs_timer.c                      |   2 +-
>  hw/timer/xilinx_timer.c                       |   4 +-
>  hw/usb/hcd-musb.c                             |  10 +-
>  hw/usb/hcd-ohci.c                             |   6 +-
>  hw/usb/hcd-uhci.c                             |   2 +-
>  hw/virtio/virtio-pci.c                        |   2 +-
>  include/hw/cris/etraxfs_dma.h                 |   4 +-
>  include/hw/net/lance.h                        |   2 +-
>  include/hw/ppc/spapr.h                        |   2 +-
>  include/hw/xen/interface/io/ring.h            |  34 +--
>  include/qemu/log.h                            |   2 +-
>  include/qom/object.h                          |   4 +-
>  linux-user/cris/cpu_loop.c                    |  16 +-
>  linux-user/microblaze/cpu_loop.c              |  16 +-
>  linux-user/mmap.c                             |   8 +-
>  linux-user/sparc/signal.c                     |   4 +-
>  linux-user/syscall.c                          |  24 +-
>  linux-user/syscall_defs.h                     |   2 +-
>  linux-user/uaccess.c                          |   2 +-
>  os-posix.c                                    |   2 +-
>  qapi/qapi-util.c                              |   2 +-
>  qemu-img.c                                    |   2 +-
>  qemu-options.hx                               |  26 +-
>  qom/object.c                                  |   2 +-
>  target/cris/translate.c                       |  28 +-
>  target/cris/translate_v10.inc.c               |   6 +-
>  target/i386/hvf/hvf.c                         |   4 +-
>  target/i386/hvf/x86.c                         |   4 +-
>  target/i386/hvf/x86_decode.c                  |  20 +-
>  target/i386/hvf/x86_decode.h                  |   4 +-
>  target/i386/hvf/x86_descr.c                   |   2 +-
>  target/i386/hvf/x86_emu.c                     |   2 +-
>  target/i386/hvf/x86_mmu.c                     |   6 +-
>  target/i386/hvf/x86_task.c                    |   2 +-
>  target/i386/hvf/x86hvf.c                      |  42 +--
>  target/i386/translate.c                       |   8 +-
>  target/microblaze/mmu.c                       |   2 +-
>  target/microblaze/translate.c                 |   2 +-
>  target/sh4/op_helper.c                        |   4 +-
>  target/xtensa/core-de212/core-isa.h           |   6 +-
>  .../xtensa/core-sample_controller/core-isa.h  |   6 +-
>  target/xtensa/core-test_kc705_be/core-isa.h   |   2 +-
>  tcg/sparc/tcg-target.inc.c                    |   2 +-
>  tcg/tcg.c                                     |  32 +--
>  tests/tcg/multiarch/test-mmap.c               |  72 ++---
>  ui/curses.c                                   |   4 +-
>  ui/curses_keys.h                              |   4 +-
>  util/cutils.c                                 |   2 +-
>  78 files changed, 440 insertions(+), 440 deletions(-)

The cleanup is a good idea, however, I think it is probably better to
split the patch approx into subsystems. That will make it much easier
to cherry-pick for people doing backports.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
