Received: by 10.25.208.211 with SMTP id h202csp919665lfg;
        Sun, 20 Mar 2016 11:35:18 -0700 (PDT)
X-Received: by 10.66.155.232 with SMTP id vz8mr39620536pab.53.1458498918543;
        Sun, 20 Mar 2016 11:35:18 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id y5si18716737pfi.188.2016.03.20.11.35.18;
        Sun, 20 Mar 2016 11:35:18 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751586AbcCTSfQ (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Sun, 20 Mar 2016 14:35:16 -0400
Received: from mail-qg0-f66.google.com ([209.85.192.66]:33332 "EHLO
	mail-qg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314AbcCTSfO (ORCPT <rfc822;kvm@vger.kernel.org>);
	Sun, 20 Mar 2016 14:35:14 -0400
Received: by mail-qg0-f66.google.com with SMTP id y89so11839138qge.0
        for <kvm@vger.kernel.org>; Sun, 20 Mar 2016 11:35:14 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=bVCNmyaKMn1zHQnp89z8Xa0OKLQKxxyTF6BBZEfWOn4=;
        b=x1qQVpGSl/LSFzYCaJDaVPu0xmCIuQwR1Zx5sUKLO85gSysynQ5zuHeEpJqvlA8bNX
         0DFpvYQAPP6ETjj3T1nNZXCKZV5KvQ6QabihcezTx71C9ixSmJyB0pBkfNe8Zi80t//d
         vjSylWjKY12bK8vz6Ifhpnv9cG834jAJvDEuI4E4QtoRVXEsmo38RrHXbWUse3tJ7EhL
         jYdgUx4LzR48c9mdvf10SU6qtETCll3woqKyk+MzngZe4I633CHOxnMrZv3zqAP4STkC
         7t9KwFmnw3ozUSwiX9271dt3y1DcG8ax5rCMR5GSyapELsNKlxtoMX+vrUDvcDuWNqj0
         D8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc;
        bh=bVCNmyaKMn1zHQnp89z8Xa0OKLQKxxyTF6BBZEfWOn4=;
        b=lVQ9OtoQ55WCFWEqGSquQ3MqAWi9pKlQGWRRh0IhkGR2bHejW9Fjb+mEjhGG5DafzS
         RSnUiRjBn6oK3tCk6DF6IzPHyCq8wiqTnxo0CGcBas/hxVJQkoPUQaFi4pWtBam6qL2N
         pDDg7pXA/YqzZARk2Dx4G2Sm6zw9ML0z156e6/0kqyQhPzdGITNrknsw1yKITART+khy
         gLJ6qgwJjQWq1t0k52agghD9I92MyAfEErbVeOcyDtFjq2sH730pd4pK80pj3mu5TlWI
         8NfhSbBwUitAztVywMli0s9IwAJgJzRfb6kSbmnx0QbrZ9E9lbgyig65VyuUQgS9F6iP
         MdWw==
X-Gm-Message-State: AD7BkJI4ILuwI2bO6MhYa1c6B8QSBPZ6ZVy6rEi5oANOB5khNaoub4wLGOxirpXMnz0l2RHaO8yDlqVfFmSqvw==
MIME-Version: 1.0
X-Received: by 10.140.229.199 with SMTP id z190mr36685413qhb.48.1458498913603;
 Sun, 20 Mar 2016 11:35:13 -0700 (PDT)
Received: by 10.140.17.170 with HTTP; Sun, 20 Mar 2016 11:35:13 -0700 (PDT)
In-Reply-To: <1458498684-32509-1-git-send-email-rutu.shah.26@gmail.com>
References: <1458498684-32509-1-git-send-email-rutu.shah.26@gmail.com>
Date:	Mon, 21 Mar 2016 00:05:13 +0530
Message-ID: <CAFE_T+T5=pU_Sau5qLnYAHOYJb9ngFkkPWGjVNEQv=D=LC92LA@mail.gmail.com>
Subject: Re: [PATCH v2] Replaced get_tick_per_sec() by NANOSECONDS_PER_SECOND
From:	rutuja shah <rutu.shah.26@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	kraxel@redhat.com, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, kwolf@redhat.com,
	pbonzini@redhat.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	rth@twiddle.net, mst@redhat.com, imammedo@redhat.com,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	John Snow Huston <jsnow@redhat.com>,
	alistair.francis@xilinx.com, Alexander Graf <agraf@suse.de>,
	jasowang@redhat.com, Blue Swirl <blauwirbel@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	cornelia.huck@de.ibm.com, borntraeger@de.ibm.com,
	armbru@redhat.com, lcapitulino@redhat.com, qemu-block@nongnu.org,
	kvm@vger.kernel.org, qemu-arm@nongnu.org,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: Edq5BZVFr7Nq

On Mon, Mar 21, 2016 at 12:01 AM,  <rutu.shah.26@gmail.com> wrote:
Hi,
Some lines seem to have been skipped some how. This patch replaces
get_ticks_per_sec() calls to NANOSECONDS_PER_SECOND. Also, as there
are no callers, get_ticks_per_sec() has been removed. Replacement
imporves readability and understandability of code.

> Example given by Paolo Bonzini,
>
> timer_mod(fdctrl->result_timer,
>           qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (get_ticks_per_sec() / 50));
>
> NANOSECONDS_PER_SECOND makes it obvious that the timer will expire in 1/50th of a second.
>
> ---
>  audio/audio.c             |  3 +--
>  audio/noaudio.c           |  8 ++++----
>  audio/spiceaudio.c        |  4 ++--
>  audio/wavaudio.c          |  2 +-
>  backends/baum.c           |  2 +-
>  block/qed.c               |  2 +-
>  cpus.c                    |  6 +++---
>  hw/acpi/core.c            |  4 ++--
>  hw/arm/omap1.c            | 17 +++++++++--------
>  hw/arm/spitz.c            |  2 +-
>  hw/arm/stellaris.c        |  2 +-
>  hw/arm/strongarm.c        |  2 +-
>  hw/audio/adlib.c          |  2 +-
>  hw/audio/sb16.c           |  4 ++--
>  hw/block/fdc.c            |  4 ++--
>  hw/block/pflash_cfi02.c   |  8 ++++----
>  hw/bt/hci-csr.c           |  4 ++--
>  hw/char/cadence_uart.c    |  4 ++--
>  hw/char/serial.c          | 10 ++++++----
>  hw/display/vga.c          |  6 +++---
>  hw/dma/rc4030.c           |  2 +-
>  hw/ide/core.c             |  4 ++--
>  hw/input/hid.c            |  2 +-
>  hw/input/tsc2005.c        |  3 ++-
>  hw/input/tsc210x.c        |  3 ++-
>  hw/intc/i8259.c           |  2 +-
>  hw/misc/arm_sysctl.c      |  3 ++-
>  hw/misc/macio/cuda.c      | 16 ++++++++--------
>  hw/misc/macio/macio.c     |  2 +-
>  hw/net/dp8393x.c          |  2 +-
>  hw/ppc/ppc.c              | 21 ++++++++++++---------
>  hw/ppc/ppc405_uc.c        |  4 ++--
>  hw/ppc/ppc_booke.c        |  2 +-
>  hw/sd/sdhci-internal.h    |  2 +-
>  hw/sparc64/sun4u.c        |  4 ++--
>  hw/timer/i8254.c          |  4 ++--
>  hw/timer/i8254_common.c   |  6 +++---
>  hw/timer/mc146818rtc.c    | 14 ++++++++------
>  hw/timer/omap_gptimer.c   |  2 +-
>  hw/timer/omap_synctimer.c |  3 ++-
>  hw/timer/pl031.c          | 10 +++++-----
>  hw/timer/pxa2xx_timer.c   | 18 ++++++++++--------
>  hw/usb/hcd-ehci.c         |  5 +++--
>  hw/usb/hcd-musb.c         |  2 +-
>  hw/usb/hcd-ohci.c         | 10 +++++-----
>  hw/usb/hcd-uhci.c         |  6 +++---
>  hw/usb/tusb6010.c         |  6 +++---
>  hw/watchdog/wdt_diag288.c |  2 +-
>  hw/watchdog/wdt_ib700.c   |  2 +-
>  include/hw/acpi/acpi.h    |  2 +-
>  include/qemu/timer.h      |  9 ++-------
>  monitor.c                 |  4 ++--
>  target-ppc/kvm.c          |  4 ++--
>  53 files changed, 143 insertions(+), 134 deletions(-)
> ---
> Thanks,
> Rutuja Shah
