Received: by 10.223.197.9 with SMTP id q9csp3403292wrf;
        Mon, 2 Oct 2017 07:12:11 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDjGHV3nW7yPU5O5wZovWg681nvvzpAUrw0AaAkabnSunDOihhYGIIFluJV3sUrjd6P01LW
X-Received: by 10.55.40.19 with SMTP id o19mr15378744qkh.146.1506953531564;
        Mon, 02 Oct 2017 07:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506953531; cv=none;
        d=google.com; s=arc-20160816;
        b=b690G978KGZQ53OvLRNba34786cW5/5T8FgNzpDk5l80rj0DQOkDVUZ6RzZoy3Ghdd
         bCcmOA1lKogqSeIIwDxiKk+npLdy2K1GPL/ict5kyZ42AuS1MWZN7V53JX86cI7FiJTo
         cHZNplkeNx+HtHVGCGdfZ/NNlEbLMPfQSc+fjZ0EHN16uHbbDFNhgKaUZQ7lTVzjul5q
         zHQgaYYqefA8H9E2HK4q0vNpB7htKpAEalu1+Jlm8NDfJMFt8D3vtDpz/JtOm7wJP3PK
         DV9XBcHxKCFGF63RMImK0wLfg4ujbJTcOqr1PJF8qOF7C7fmlvyhKJI9wgggY5WY73jL
         82YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=rQDoCKop1qRH7LeDy4lVZbDBreAd5GIYcBI2FmiXlHQ=;
        b=Z/1XJNMwumnfHYMbzS5WTqu32viwlJsh68yyMVbyxxVhruQbBwRIl030J+JWHbWfzp
         TBCtTVwbcy/AXJvtSX3kG070bfwsZODs/5kVJwyVWRgDxp5ELjlPN9cn2Gxw05A1MdVZ
         69h7ykTu/BcvbsibIVUBfAViKiml+JU7KVPCBSaMLXfi+HqQha0N1VPYv2G5jP8g3AVY
         8qQFAAdVLmAse35AI/2l/nh419W3Ikz+K3tHM83S2VaX17ws9ggDstGiK+s0J0mFlLx3
         jsFNOxYrb4ixyGiuXm9CPJaKqhC4dMEzxtZKMMyYDYIbSMYu/seeYp2esAPcsStXkXwt
         wiew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n189si6845663qkc.477.2017.10.02.07.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Oct 2017 07:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dz1S5-00053g-6I
	for alex.bennee@linaro.org; Mon, 02 Oct 2017 10:12:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1dz1Rq-000517-Qj
	for qemu-arm@nongnu.org; Mon, 02 Oct 2017 10:11:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1dz1Rg-0002e4-Qq
	for qemu-arm@nongnu.org; Mon, 02 Oct 2017 10:11:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43954)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1dz1Rg-0002cM-FE; Mon, 02 Oct 2017 10:11:44 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1A19356E8;
	Mon,  2 Oct 2017 14:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C1A19356E8
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=stefanha@redhat.com
Received: from localhost (ovpn-117-29.ams2.redhat.com [10.36.117.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7908695206;
	Mon,  2 Oct 2017 14:11:30 +0000 (UTC)
Date: Mon, 2 Oct 2017 10:11:28 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20171002141128.GE32241@stefanha-x1.localdomain>
References: <cover.1506730372.git.alistair.francis@xilinx.com>
	<4ad78c1162706cd67654b2ad08daa1b5d5f8f9f1.1506730372.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ad78c1162706cd67654b2ad08daa1b5d5f8f9f1.1506730372.git.alistair.francis@xilinx.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 02 Oct 2017 14:11:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 01/47] Replace all occurances of
 __FUNCTION__ with __func__
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Fam Zheng <famz@redhat.com>, qemu-block@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
	armbru@redhat.com, Yongbok Kim <yongbok.kim@imgtec.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>, alistair23@gmail.com,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: xrTc0cQWJEGB

On Fri, Sep 29, 2017 at 05:14:58PM -0700, Alistair Francis wrote:
> Replace all occurs of __FUNCTION__ except for the check in checkpatch
> with the non GCC specific __func__.
> 
> One line in hcd-musb.c was manually tweaked to pass checkpatch.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Yongbok Kim <yongbok.kim@imgtec.com>
> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Fam Zheng <famz@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
> 
>  audio/audio_int.h          |  2 +-
>  hw/arm/nseries.c           |  2 +-
>  hw/arm/omap1.c             | 42 +++++++++++++++++++++---------------------
>  hw/arm/omap2.c             | 12 ++++++------
>  hw/arm/palm.c              | 14 +++++++-------
>  hw/arm/pxa2xx.c            | 46 +++++++++++++++++++++++-----------------------
>  hw/arm/pxa2xx_gpio.c       |  6 +++---
>  hw/arm/pxa2xx_pic.c        |  4 ++--
>  hw/arm/tosa.c              | 10 +++++-----
>  hw/audio/hda-codec.c       | 10 +++++-----
>  hw/audio/intel-hda.c       | 28 ++++++++++++++--------------
>  hw/audio/wm8750.c          |  4 ++--
>  hw/block/nand.c            |  4 ++--
>  hw/block/onenand.c         |  8 ++++----
>  hw/bt/core.c               | 10 +++++-----
>  hw/bt/hci-csr.c            | 14 +++++++-------
>  hw/bt/hci.c                | 26 +++++++++++++-------------
>  hw/bt/hid.c                |  2 +-
>  hw/bt/l2cap.c              | 22 +++++++++++-----------
>  hw/bt/sdp.c                |  6 +++---
>  hw/display/blizzard.c      | 18 +++++++++---------
>  hw/display/omap_dss.c      |  6 +++---
>  hw/display/pxa2xx_lcd.c    | 14 +++++++-------
>  hw/display/qxl-render.c    |  6 +++---
>  hw/display/qxl.h           |  2 +-
>  hw/display/tc6393xb.c      |  2 +-
>  hw/display/xenfb.c         |  2 +-
>  hw/dma/omap_dma.c          | 26 +++++++++++++-------------
>  hw/dma/pxa2xx_dma.c        | 14 +++++++-------
>  hw/gpio/max7310.c          |  8 ++++----
>  hw/gpio/omap_gpio.c        |  2 +-
>  hw/i2c/omap_i2c.c          |  6 +++---
>  hw/ide/ahci.c              |  2 +-
>  hw/ide/microdrive.c        |  4 ++--
>  hw/input/lm832x.c          |  6 +++---
>  hw/input/pxa2xx_keypad.c   |  6 +++---
>  hw/input/tsc2005.c         |  8 ++++----
>  hw/input/tsc210x.c         |  4 ++--
>  hw/intc/omap_intc.c        |  2 +-
>  hw/isa/vt82c686.c          |  2 +-
>  hw/mips/gt64xxx_pci.c      |  2 +-
>  hw/misc/cbus.c             | 12 ++++++------
>  hw/misc/omap_clk.c         |  4 ++--
>  hw/misc/omap_gpmc.c        |  6 +++---
>  hw/misc/omap_l4.c          |  4 ++--
>  hw/misc/omap_sdrc.c        |  2 +-
>  hw/misc/omap_tap.c         |  6 +++---
>  hw/misc/tmp105.c           |  2 +-
>  hw/pci-host/bonito.c       |  2 +-
>  hw/sd/pxa2xx_mmci.c        |  6 +++---
>  hw/ssi/omap_spi.c          |  6 +++---
>  hw/timer/omap_gptimer.c    |  6 +++---
>  hw/timer/twl92230.c        |  6 +++---
>  hw/usb/desc.c              |  2 +-
>  hw/usb/dev-bluetooth.c     |  4 ++--
>  hw/usb/hcd-musb.c          |  4 ++--
>  hw/usb/tusb6010.c          | 14 +++++++-------
>  hw/xenpv/xen_domainbuild.c | 16 ++++++++--------
>  hw/xenpv/xen_machine_pv.c  |  2 +-
>  include/hw/arm/omap.h      | 10 +++++-----
>  include/hw/arm/sharpsl.h   |  2 +-
>  memory_mapping.c           |  2 +-
>  migration/block.c          |  4 ++--
>  ui/cursor.c                |  6 +++---
>  ui/spice-display.c         |  4 ++--
>  65 files changed, 273 insertions(+), 273 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
