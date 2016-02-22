Received: by 10.25.208.211 with SMTP id h202csp1349048lfg;
        Mon, 22 Feb 2016 11:16:03 -0800 (PST)
X-Received: by 10.55.209.148 with SMTP id o20mr19467005qkl.5.1456168563845;
        Mon, 22 Feb 2016 11:16:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v65si30637473qhb.128.2016.02.22.11.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 11:16:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXvxh-0000fo-QQ
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 14:16:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aXvx5-0008EC-7f
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 14:15:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aXvx2-0007Fw-1u
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 14:15:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aXvx1-0007Fp-S2; Mon, 22 Feb 2016 14:15:19 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id A253663141;
	Mon, 22 Feb 2016 19:15:18 +0000 (UTC)
Received: from redhat.com (vpn1-6-31.ams2.redhat.com [10.36.6.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u1MJFE5r017254; Mon, 22 Feb 2016 14:15:15 -0500
Date: Mon, 22 Feb 2016 21:15:13 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Kevin O'Connor" <kevin@koconnor.net>
Message-ID: <20160222211352-mutt-send-email-mst@redhat.com>
References: <1456144729-17196-1-git-send-email-mst@redhat.com>
	<20160222144749.GA6977@morn.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160222144749.GA6977@morn.lan>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 22 Feb 2016 19:15:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH RFC] fw-cfg: support writeable blobs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A0W/bxYFLSFF

On Mon, Feb 22, 2016 at 09:47:49AM -0500, Kevin O'Connor wrote:
> On Mon, Feb 22, 2016 at 02:41:38PM +0200, Michael S. Tsirkin wrote:
> > Useful to send guest data back to QEMU.
> > The write interface is restricted to DMA.
> > 
> > Suggested-by: Kevin O'Connor <kevin@koconnor.net>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> > 
> >  hw/lm32/lm32_hwsetup.h    |  2 +-
> >  include/hw/loader.h       |  4 ++--
> >  include/hw/nvram/fw_cfg.h |  3 ++-
> >  hw/arm/virt-acpi-build.c  |  2 +-
> >  hw/core/loader.c          | 19 ++++++++++++-------
> >  hw/i386/acpi-build.c      |  4 ++--
> >  hw/nvram/fw_cfg.c         | 36 ++++++++++++++++++++++++++++--------
> >  7 files changed, 48 insertions(+), 22 deletions(-)
> > 
> > diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
> > index 838754d..805b445 100644
> > --- a/hw/lm32/lm32_hwsetup.h
> > +++ b/hw/lm32/lm32_hwsetup.h
> > @@ -74,7 +74,7 @@ static inline void hwsetup_create_rom(HWSetup *hw,
> >          hwaddr base)
> >  {
> >      rom_add_blob("hwsetup", hw->data, TARGET_PAGE_SIZE,
> > -                 TARGET_PAGE_SIZE, base, NULL, NULL, NULL);
> > +                 TARGET_PAGE_SIZE, base, NULL, NULL, NULL, true);
> >  }
> 
> Instead of supporting "writable blobs", I wonder if it would be
> simpler for both firmware and qemu to implement an "ioctl" like
> interface.  That is, just directly invoke a new fw_cfg callback from
> fw_cfg_dma_transfer() with the data obtained via dma_memory_read().  I
> think that may be more flexible because then the QEMU code doesn't
> have to check for changes to a blob - it would instead be immediately
> invoked upon a change.
> 
> -Kevin

So far, I didn't see any need to invoke callbacks.
All users seem happy with simply using data
written by guest.

OTOH if there's no blob to write, users need to add code
to migrate it manually, blobs are migrated automatically.

-- 
MST
