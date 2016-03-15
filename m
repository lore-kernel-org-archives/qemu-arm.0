Received: by 10.25.208.211 with SMTP id h202csp490087lfg;
        Tue, 15 Mar 2016 03:08:27 -0700 (PDT)
X-Received: by 10.66.66.198 with SMTP id h6mr44312975pat.112.1458036507452;
        Tue, 15 Mar 2016 03:08:27 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h7si4716092pat.9.2016.03.15.03.08.27;
        Tue, 15 Mar 2016 03:08:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S965154AbcCOKIZ (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Tue, 15 Mar 2016 06:08:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47800 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964916AbcCOKIX (ORCPT <rfc822;kvm@vger.kernel.org>);
	Tue, 15 Mar 2016 06:08:23 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 70834F9E86;
	Tue, 15 Mar 2016 10:08:17 +0000 (UTC)
Received: from [10.36.112.35] (ovpn-112-35.ams2.redhat.com [10.36.112.35])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u2FA88T7009056;
	Tue, 15 Mar 2016 06:08:09 -0400
Subject: Re: [Qemu-ppc] [PATCH] Replacing (and removing) get_ticks_per_sec()
 function with NANOSECONDS_PER_SECOND Signed-off-by: Rutuja Shah
 <rutu.shah.26@gmail.com>
To:	rutu.shah.26@gmail.com, qemu-devel@nongnu.org
References: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
Cc:	peter.maydell@linaro.org, kvm@vger.kernel.org, mst@redhat.com,
	jasowang@redhat.com, lcapitulino@redhat.com, kraxel@redhat.com,
	qemu-block@nongnu.org, borntraeger@de.ibm.com,
	samuel.thibault@ens-lyon.org, balrogg@gmail.com,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org,
	stefanha@redhat.com, pbonzini@redhat.com, cornelia.huck@de.ibm.com,
	jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
	crosthwaite.peter@gmail.com, armbru@redhat.com,
	blauwirbel@gmail.co, qemu-ppc@nongnu.org, imammedo@redhat.com
From:	Laurent Vivier <lvivier@redhat.com>
Message-ID: <56E7DF08.2050400@redhat.com>
Date:	Tue, 15 Mar 2016 11:08:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 15 Mar 2016 10:08:17 +0000 (UTC)
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: hVCFDmcdDBBJ



On 10/03/2016 20:30, rutu.shah.26@gmail.com wrote:
> From: Rutuja Shah <rutu.shah.26@gmail.com>
> 
> ---
>  audio/audio.c             |  2 +-
>  audio/noaudio.c           |  4 ++--
>  audio/spiceaudio.c        |  2 +-
>  audio/wavaudio.c          |  2 +-
>  backends/baum.c           |  2 +-
>  block/qed.c               |  2 +-
>  cpus.c                    |  6 +++---
>  hw/acpi/core.c            |  4 ++--
>  hw/arm/omap1.c            | 14 +++++++-------
>  hw/arm/spitz.c            |  2 +-
>  hw/arm/stellaris.c        |  2 +-
>  hw/arm/strongarm.c        |  2 +-
>  hw/audio/adlib.c          |  2 +-
>  hw/audio/sb16.c           |  4 ++--
>  hw/block/fdc.c            |  2 +-
>  hw/block/pflash_cfi02.c   |  4 ++--
>  hw/bt/hci-csr.c           |  4 ++--
>  hw/char/cadence_uart.c    |  4 ++--
>  hw/char/serial.c          |  6 +++---
>  hw/display/vga.c          |  6 +++---
>  hw/dma/rc4030.c           |  2 +-
>  hw/ide/core.c             |  2 +-
>  hw/input/hid.c            |  2 +-
>  hw/input/tsc2005.c        |  2 +-
>  hw/input/tsc210x.c        |  2 +-
>  hw/intc/i8259.c           |  2 +-
>  hw/misc/arm_sysctl.c      |  2 +-
>  hw/misc/macio/cuda.c      | 16 ++++++++--------
>  hw/misc/macio/macio.c     |  2 +-
>  hw/net/dp8393x.c          |  2 +-
>  hw/ppc/ppc.c              | 18 +++++++++---------
>  hw/ppc/ppc405_uc.c        |  4 ++--
>  hw/ppc/ppc_booke.c        |  2 +-
>  hw/sd/sdhci-internal.h    |  2 +-
>  hw/sparc64/sun4u.c        |  4 ++--
>  hw/timer/i8254.c          |  4 ++--
>  hw/timer/i8254_common.c   |  6 +++---
>  hw/timer/mc146818rtc.c    |  6 +++---
>  hw/timer/omap_gptimer.c   |  2 +-
>  hw/timer/omap_synctimer.c |  2 +-
>  hw/timer/pl031.c          | 10 +++++-----
>  hw/timer/pxa2xx_timer.c   | 14 +++++++-------
>  hw/usb/hcd-ehci.c         |  4 ++--
>  hw/usb/hcd-musb.c         |  2 +-
>  hw/usb/hcd-ohci.c         | 10 +++++-----
>  hw/usb/hcd-uhci.c         |  6 +++---
>  hw/usb/tusb6010.c         |  4 ++--
>  hw/watchdog/wdt_diag288.c |  2 +-
>  hw/watchdog/wdt_ib700.c   |  2 +-
>  include/hw/acpi/acpi.h    |  2 +-
>  include/qemu/timer.h      |  9 ++-------
>  monitor.c                 |  4 ++--
>  target-ppc/kvm.c          |  4 ++--
>  53 files changed, 114 insertions(+), 119 deletions(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index e841532..8c2c495 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1870,7 +1870,7 @@ static void audio_init (void)
>          conf.period.ticks = 1;
>      } else {
>          conf.period.ticks =
> -            muldiv64 (1, get_ticks_per_sec (), conf.period.hertz);
> +            muldiv64 (1, NANOSECONDS_PER_SECOND, conf.period.hertz);

This can be replaced by:

	conf.period.ticks = NANOSECONDS_PER_SECOND / conf.period.hertz;

>      }
>  
>      e = qemu_add_vm_change_state_handler (audio_vm_change_state_handler, s);
...
> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
> index cd23197..27d9d0b 100644
> --- a/hw/usb/hcd-musb.c
> +++ b/hw/usb/hcd-musb.c
> @@ -564,7 +564,7 @@ static void musb_schedule_cb(USBPort *port, USBPacket *packey)
>          ep->intv_timer[dir] = timer_new_ns(QEMU_CLOCK_VIRTUAL, musb_cb_tick, ep);
>  
>      timer_mod(ep->intv_timer[dir], qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   muldiv64(timeout, get_ticks_per_sec(), 8000));
> +                   muldiv64(timeout, NANOSECONDS_PER_SECOND, 8000));

Can be replaced by: "timeout * 125000"

(I don't think the value of  NANOSECONDS_PER_SECOND will change in the
future ;) ).

>  }
>  
>  static int musb_timeout(int ttype, int speed, int val)
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index 17ed461..a9bf805 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -1849,12 +1849,12 @@ static void usb_ohci_init(OHCIState *ohci, DeviceState *dev,
>  
>      if (usb_frame_time == 0) {
>  #ifdef OHCI_TIME_WARP
> -        usb_frame_time = get_ticks_per_sec();
> -        usb_bit_time = muldiv64(1, get_ticks_per_sec(), USB_HZ/1000);
> +        usb_frame_time = NANOSECONDS_PER_SECOND;
> +        usb_bit_time = muldiv64(1, NANOSECONDS_PER_SECOND, USB_HZ/1000);

Can be replaced by:

    usb_bit_time = NANOSECONDS_PER_SECOND / (USB_HZ / 1000);

>  #else
> -        usb_frame_time = muldiv64(1, get_ticks_per_sec(), 1000);
> -        if (get_ticks_per_sec() >= USB_HZ) {
> -            usb_bit_time = muldiv64(1, get_ticks_per_sec(), USB_HZ);
> +        usb_frame_time = muldiv64(1, NANOSECONDS_PER_SECOND, 1000);

    usb_frame_time = NANOSECONDS_PER_SECOND / 1000;

> +        if (NANOSECONDS_PER_SECOND >= USB_HZ) {
> +            usb_bit_time = muldiv64(1, NANOSECONDS_PER_SECOND, USB_HZ);

    usb_bit_time = NANOSECONDS_PER_SECOND / USB_HZ;

>          } else {
>              usb_bit_time = 1;
>          }
...
