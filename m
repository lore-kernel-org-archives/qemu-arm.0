Received: by 10.25.208.211 with SMTP id h202csp1590840lfg;
        Sat, 12 Mar 2016 08:21:25 -0800 (PST)
X-Received: by 10.55.43.35 with SMTP id r35mr19195131qkh.64.1457799685010;
        Sat, 12 Mar 2016 08:21:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w189si13796720qka.47.2016.03.12.08.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Mar 2016 08:21:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aemI8-0000Ma-6v
	for alex.bennee@linaro.org; Sat, 12 Mar 2016 11:21:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1aemHv-0000EL-7v
	for qemu-arm@nongnu.org; Sat, 12 Mar 2016 11:21:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1aemHk-0003uj-TU
	for qemu-arm@nongnu.org; Sat, 12 Mar 2016 11:21:11 -0500
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:35000)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>)
	id 1aemGo-0003jP-BJ; Sat, 12 Mar 2016 11:20:02 -0500
Received: by mail-qk0-x233.google.com with SMTP id o6so59815465qkc.2;
	Sat, 12 Mar 2016 08:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=OgcYIVfy56cFo3slrEbjKcpYWYfnIi25+oZ8nxHRddo=;
	b=mEEUrCluY2vns8Im1PbfLmTjyyc4PQDJIxzM0SYhrPlRW0RlMfNbT5sYzM+JfNdnFU
	IN/UibMqi2mR6aOuXvGh7zN2C5QY1qICYqSjgv+ZFt4BfhKiKe5roSmpJn2LIWIRiwdm
	Mh7eMvkWN1h0ICFBIoqDzIhQTS3eRqlhriXqOVlNfQRyRYN6gbpZC5hF8AuVBErbckJB
	Ss2m/rONcXrPpynEjvIwUdoK4yeuXW8yQtpK8DL5yP7KH7g+nLRwhMsdhKrGzJOwX0iQ
	cTZdgpHbwncd0L/ymE8gNtBzaAdlrotjkwGg1W1zkU/9qPoUtL6tf5TlUukEZLlqU0tG
	ZmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=OgcYIVfy56cFo3slrEbjKcpYWYfnIi25+oZ8nxHRddo=;
	b=ZSLhPavS/pDjuBKI+XLmYeiX+gbvte8DJzqpXqY6BhGUSZ2bM/ZwHONYkq9KlirlLA
	A7EShZqfGgRgppvTCShXdXT5kZmor7EExv2/1aUsR3NE6Jd9uJ+cri2i6RDnaIlPfGjq
	1rWKOXvqGLpyQa02WusHmSuUK2uwWRKxB3zly5GK+MzBimvp4pdrPXv4BYURGDisr8QV
	Qdlt+eUC45Dv8RhCmBhGaQu6lFZO+gUxQkj7egbswe/FvPvdrlPwG0IzSnbfvS63Ab8T
	fQ0JFZ6r5RVl6R6UPxelSm4E7Zqj1tKHbXNtQqTuhv/MbEePTd1OQxDEb64knCyvj2H6
	hbzw==
X-Gm-Message-State: AD7BkJIiJWsyc/ZjVa2BkBt80G0L0DzIvua8wNbgWK+WPtd58Ze6a7nJM9Q4SMJWrr4Izxw/ZNjH2JyQZtTTcg==
MIME-Version: 1.0
X-Received: by 10.55.55.138 with SMTP id e132mr19147039qka.11.1457799601444;
	Sat, 12 Mar 2016 08:20:01 -0800 (PST)
Received: by 10.140.17.170 with HTTP; Sat, 12 Mar 2016 08:20:01 -0800 (PST)
Received: by 10.140.17.170 with HTTP; Sat, 12 Mar 2016 08:20:01 -0800 (PST)
In-Reply-To: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
References: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
Date: Sat, 12 Mar 2016 21:50:01 +0530
Message-ID: <CAFE_T+RrgbdRb0qQDRv28kCJrVK4VaJ052oNZJbaXyrBpeVZPg@mail.gmail.com>
From: rutuja shah <rutu.shah.26@gmail.com>
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary=001a1149059865e1c8052ddc6bce
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::233
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
	mst@redhat.com, jasowang@redhat.com,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	lcapitulino@redhat.com, blauwirbel@gmail.com, kraxel@redhat.com,
	qemu-block@nongnu.org, armbru@redhat.com, borntraeger@de.ibm.com,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com,
	cornelia.huck@de.ibm.com, John Snow Huston <jsnow@redhat.com>,
	rth@twiddle.net, kwolf@redhat.com, Alexander Graf <agraf@suse.de>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	imammedo@redhat.com
Subject: Re: [Qemu-arm] [PATCH] Replacing (and removing) get_ticks_per_sec()
 function with NANOSECONDS_PER_SECOND Signed-off-by: Rutuja Shah
 <rutu.shah.26@gmail.com>
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
X-TUID: 1MrOkAXL2D9t

--001a1149059865e1c8052ddc6bce
Content-Type: text/plain; charset=UTF-8

Hi,
Sorry for the inconvenience caused due to the format of my patch.

Due to a typo mail id was wrong, adding blauwirbel@gmail.com
On Mar 11, 2016 1:00 AM, <rutu.shah.26@gmail.com> wrote:

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
>      }
>
>      e = qemu_add_vm_change_state_handler (audio_vm_change_state_handler,
> s);
> diff --git a/audio/noaudio.c b/audio/noaudio.c
> index 09588b9..931aa03 100644
> --- a/audio/noaudio.c
> +++ b/audio/noaudio.c
> @@ -49,7 +49,7 @@ static int no_run_out (HWVoiceOut *hw, int live)
>
>      now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      ticks = now - no->old_ticks;
> -    bytes = muldiv64 (ticks, hw->info.bytes_per_second, get_ticks_per_sec
> ());
> +    bytes = muldiv64 (ticks, hw->info.bytes_per_second,
> NANOSECONDS_PER_SECOND);
>      bytes = audio_MIN (bytes, INT_MAX);
>      samples = bytes >> hw->info.shift;
>
> @@ -106,7 +106,7 @@ static int no_run_in (HWVoiceIn *hw)
>          int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>          int64_t ticks = now - no->old_ticks;
>          int64_t bytes =
> -            muldiv64 (ticks, hw->info.bytes_per_second, get_ticks_per_sec
> ());
> +            muldiv64 (ticks, hw->info.bytes_per_second,
> NANOSECONDS_PER_SECOND);
>
>          no->old_ticks = now;
>          bytes = audio_MIN (bytes, INT_MAX);
> diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
> index 297fd41..a098057 100644
> --- a/audio/spiceaudio.c
> +++ b/audio/spiceaudio.c
> @@ -104,7 +104,7 @@ static int rate_get_samples (struct audio_pcm_info
> *info, SpiceRateCtl *rate)
>
>      now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      ticks = now - rate->start_ticks;
> -    bytes = muldiv64 (ticks, info->bytes_per_second, get_ticks_per_sec
> ());
> +    bytes = muldiv64 (ticks, info->bytes_per_second,
> NANOSECONDS_PER_SECOND);
>      samples = (bytes - rate->bytes_sent) >> info->shift;
>      if (samples < 0 || samples > 65536) {
>          error_report("Resetting rate control (%" PRId64 " samples)",
> samples);
> diff --git a/audio/wavaudio.c b/audio/wavaudio.c
> index 343b1a1..1991487 100644
> --- a/audio/wavaudio.c
> +++ b/audio/wavaudio.c
> @@ -51,7 +51,7 @@ static int wav_run_out (HWVoiceOut *hw, int live)
>      int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      int64_t ticks = now - wav->old_ticks;
>      int64_t bytes =
> -        muldiv64 (ticks, hw->info.bytes_per_second, get_ticks_per_sec ());
> +        muldiv64 (ticks, hw->info.bytes_per_second,
> NANOSECONDS_PER_SECOND);
>
>      if (bytes > INT_MAX) {
>          samples = INT_MAX >> hw->info.shift;
> diff --git a/backends/baum.c b/backends/baum.c
> index c11320e..20b49f2 100644
> --- a/backends/baum.c
> +++ b/backends/baum.c
> @@ -336,7 +336,7 @@ static int baum_eat_packet(BaumDriverState *baum,
> const uint8_t *buf, int len)
>
>          /* Allow 100ms to complete the DisplayData packet */
>          timer_mod(baum->cellCount_timer,
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                       get_ticks_per_sec() / 10);
> +                       NANOSECONDS_PER_SECOND / 10);
>          for (i = 0; i < baum->x * baum->y ; i++) {
>              EAT(c);
>              cells[i] = c;
> diff --git a/block/qed.c b/block/qed.c
> index 404be1e..6fa7e1f 100644
> --- a/block/qed.c
> +++ b/block/qed.c
> @@ -345,7 +345,7 @@ static void qed_start_need_check_timer(BDRVQEDState *s)
>       * migration.
>       */
>      timer_mod(s->need_check_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   get_ticks_per_sec() * QED_NEED_CHECK_TIMEOUT);
> +                   NANOSECONDS_PER_SECOND * QED_NEED_CHECK_TIMEOUT);
>  }
>
>  /* It's okay to call this multiple times or when no timer is started */
> diff --git a/cpus.c b/cpus.c
> index bc774e2..17be5de 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -275,7 +275,7 @@ void cpu_disable_ticks(void)
>     fairly approximate, so ignore small variation.
>     When the guest is idle real and virtual time will be aligned in
>     the IO wait loop.  */
> -#define ICOUNT_WOBBLE (get_ticks_per_sec() / 10)
> +#define ICOUNT_WOBBLE (NANOSECONDS_PER_SECOND / 10)
>
>  static void icount_adjust(void)
>  {
> @@ -326,7 +326,7 @@ static void icount_adjust_vm(void *opaque)
>  {
>      timer_mod(icount_vm_timer,
>                     qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   get_ticks_per_sec() / 10);
> +                   NANOSECONDS_PER_SECOND / 10);
>      icount_adjust();
>  }
>
> @@ -665,7 +665,7 @@ void configure_icount(QemuOpts *opts, Error **errp)
>                                          icount_adjust_vm, NULL);
>      timer_mod(icount_vm_timer,
>                     qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   get_ticks_per_sec() / 10);
> +                   NANOSECONDS_PER_SECOND / 10);
>  }
>
>  /***********************************************************/
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 3d9e5c4..5ea3b3b 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -389,7 +389,7 @@ uint16_t acpi_pm1_evt_get_sts(ACPIREGS *ar)
>         acpi_pm_tmr_update function uses ns for setting the timer. */
>      int64_t d = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      if (d >= muldiv64(ar->tmr.overflow_time,
> -                      get_ticks_per_sec(), PM_TIMER_FREQUENCY)) {
> +                      NANOSECONDS_PER_SECOND, PM_TIMER_FREQUENCY)) {
>          ar->pm1.evt.sts |= ACPI_BITMASK_TIMER_STATUS;
>      }
>      return ar->pm1.evt.sts;
> @@ -483,7 +483,7 @@ void acpi_pm_tmr_update(ACPIREGS *ar, bool enable)
>
>      /* schedule a timer interruption if needed */
>      if (enable) {
> -        expire_time = muldiv64(ar->tmr.overflow_time, get_ticks_per_sec(),
> +        expire_time = muldiv64(ar->tmr.overflow_time,
> NANOSECONDS_PER_SECOND,
>                                 PM_TIMER_FREQUENCY);
>          timer_mod(ar->tmr.timer, expire_time);
>      } else {
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 6f68130..8073950 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -107,7 +107,7 @@ static inline uint32_t omap_timer_read(struct
> omap_mpu_timer_s *timer)
>
>      if (timer->st && timer->enable && timer->rate)
>          return timer->val - muldiv64(distance >> (timer->ptv + 1),
> -                                     timer->rate, get_ticks_per_sec());
> +                                     timer->rate, NANOSECONDS_PER_SECOND);
>      else
>          return timer->val;
>  }
> @@ -125,7 +125,7 @@ static inline void omap_timer_update(struct
> omap_mpu_timer_s *timer)
>      if (timer->enable && timer->st && timer->rate) {
>          timer->val = timer->reset_val; /* Should skip this on clk enable
> */
>          expires = muldiv64((uint64_t) timer->val << (timer->ptv + 1),
> -                           get_ticks_per_sec(), timer->rate);
> +                           NANOSECONDS_PER_SECOND, timer->rate);
>
>          /* If timer expiry would be sooner than in about 1 ms and
>           * auto-reload isn't set, then fire immediately.  This is a hack
> @@ -133,7 +133,7 @@ static inline void omap_timer_update(struct
> omap_mpu_timer_s *timer)
>           * sets the interval to a very low value and polls the status bit
>           * in a busy loop when it wants to sleep just a couple of CPU
>           * ticks.  */
> -        if (expires > (get_ticks_per_sec() >> 10) || timer->ar)
> +        if (expires > (NANOSECONDS_PER_SECOND >> 10) || timer->ar)
>              timer_mod(timer->timer, timer->time + expires);
>          else
>              qemu_bh_schedule(timer->tick);
> @@ -613,14 +613,14 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr
> addr,
>                  now -= s->ulpd_gauge_start;
>
>                  /* 32-kHz ticks */
> -                ticks = muldiv64(now, 32768, get_ticks_per_sec());
> +                ticks = muldiv64(now, 32768, NANOSECONDS_PER_SECOND);
>                  s->ulpd_pm_regs[0x00 >> 2] = (ticks >>  0) & 0xffff;
>                  s->ulpd_pm_regs[0x04 >> 2] = (ticks >> 16) & 0xffff;
>                  if (ticks >> 32)       /* OVERFLOW_32K */
>                      s->ulpd_pm_regs[0x14 >> 2] |= 1 << 2;
>
>                  /* High frequency ticks */
> -                ticks = muldiv64(now, 12000000, get_ticks_per_sec());
> +                ticks = muldiv64(now, 12000000, NANOSECONDS_PER_SECOND);
>                  s->ulpd_pm_regs[0x08 >> 2] = (ticks >>  0) & 0xffff;
>                  s->ulpd_pm_regs[0x0c >> 2] = (ticks >> 16) & 0xffff;
>                  if (ticks >> 32)       /* OVERFLOW_HI_FREQ */
> @@ -3026,7 +3026,7 @@ static void omap_mcbsp_source_tick(void *opaque)
>
>      omap_mcbsp_rx_newdata(s);
>      timer_mod(s->source_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   get_ticks_per_sec());
> +                   NANOSECONDS_PER_SECOND);
>  }
>
>  static void omap_mcbsp_rx_start(struct omap_mcbsp_s *s)
> @@ -3072,7 +3072,7 @@ static void omap_mcbsp_sink_tick(void *opaque)
>
>      omap_mcbsp_tx_newdata(s);
>      timer_mod(s->sink_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   get_ticks_per_sec());
> +                   NANOSECONDS_PER_SECOND);
>  }
>
>  static void omap_mcbsp_tx_start(struct omap_mcbsp_s *s)
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index 607cb58..d8ecb9c 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -404,7 +404,7 @@ static void spitz_keyboard_tick(void *opaque)
>      }
>
>      timer_mod(s->kbdtimer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   get_ticks_per_sec() / 32);
> +                   NANOSECONDS_PER_SECOND / 32);
>  }
>
>  static void spitz_keyboard_pre_map(SpitzKeyboardState *s)
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index de8dbb2..a7ba43c 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -100,7 +100,7 @@ static void gptm_reload(gptm_state *s, int n, int
> reset)
>          tick += (int64_t)count * system_clock_scale;
>      } else if (s->config == 1) {
>          /* 32-bit RTC.  1Hz tick.  */
> -        tick += get_ticks_per_sec();
> +        tick += NANOSECONDS_PER_SECOND;
>      } else if (s->mode[n] == 0xa) {
>          /* PWM mode.  Not implemented.  */
>      } else {
> diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
> index 3b17a21..52a7481 100644
> --- a/hw/arm/strongarm.c
> +++ b/hw/arm/strongarm.c
> @@ -1024,7 +1024,7 @@ static void
> strongarm_uart_update_parameters(StrongARMUARTState *s)
>      ssp.parity = parity;
>      ssp.data_bits = data_bits;
>      ssp.stop_bits = stop_bits;
> -    s->char_transmit_time =  (get_ticks_per_sec() / speed) * frame_size;
> +    s->char_transmit_time =  (NANOSECONDS_PER_SECOND / speed) *
> frame_size;
>      if (s->chr) {
>          qemu_chr_fe_ioctl(s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
>      }
> diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
> index 1270b19..e4db92d 100644
> --- a/hw/audio/adlib.c
> +++ b/hw/audio/adlib.c
> @@ -169,7 +169,7 @@ static void timer_handler (int c, double interval_Sec)
>
>      s->ticking[n] = 1;
>  #ifdef DEBUG
> -    interval = get_ticks_per_sec () * interval_Sec;
> +    interval = NANOSECONDS_PER_SECOND * interval_Sec;
>      exp = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + interval;
>      s->exp[n] = exp;
>  #endif
> diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
> index 6f8816c..3286471 100644
> --- a/hw/audio/sb16.c
> +++ b/hw/audio/sb16.c
> @@ -762,8 +762,8 @@ static void complete (SB16State *s)
>                  freq = s->freq > 0 ? s->freq : 11025;
>                  samples = dsp_get_lohi (s) + 1;
>                  bytes = samples << s->fmt_stereo << (s->fmt_bits == 16);
> -                ticks = muldiv64 (bytes, get_ticks_per_sec (), freq);
> -                if (ticks < get_ticks_per_sec () / 1024) {
> +                ticks = muldiv64 (bytes, NANOSECONDS_PER_SECOND, freq);
> +                if (ticks < NANOSECONDS_PER_SECOND / 1024) {
>                      qemu_irq_raise (s->pic);
>                  }
>                  else {
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 9838d21..1624260 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -1939,7 +1939,7 @@ static void fdctrl_handle_readid(FDCtrl *fdctrl, int
> direction)
>
>      cur_drv->head = (fdctrl->fifo[1] >> 2) & 1;
>      timer_mod(fdctrl->result_timer,
> -                   qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (get_ticks_per_sec() / 50));
> +                   qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (NANOSECONDS_PER_SECOND / 50));
>  }
>
>  static void fdctrl_handle_format_track(FDCtrl *fdctrl, int direction)
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index aaa697a..39d887c 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -432,7 +432,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
>              pfl->status = 0x00;
>              /* Let's wait 5 seconds before chip erase is done */
>              timer_mod(pfl->timer,
> -                           qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (get_ticks_per_sec() * 5));
> +                           qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (NANOSECONDS_PER_SECOND * 5));
>              break;
>          case 0x30:
>              /* Sector erase */
> @@ -447,7 +447,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
>              pfl->status = 0x00;
>              /* Let's wait 1/2 second before sector erase is done */
>              timer_mod(pfl->timer,
> -                           qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (get_ticks_per_sec() / 2));
> +                           qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (NANOSECONDS_PER_SECOND / 2));
>              break;
>          default:
>              DPRINTF("%s: invalid command %02x (wc 5)\n", __func__, cmd);
> diff --git a/hw/bt/hci-csr.c b/hw/bt/hci-csr.c
> index 0189b0a..2e970b6 100644
> --- a/hw/bt/hci-csr.c
> +++ b/hw/bt/hci-csr.c
> @@ -363,7 +363,7 @@ static int csrhci_ioctl(struct CharDriverState *chr,
> int cmd, void *arg)
>      switch (cmd) {
>      case CHR_IOCTL_SERIAL_SET_PARAMS:
>          ssp = (QEMUSerialSetParams *) arg;
> -        s->baud_delay = get_ticks_per_sec() / ssp->speed;
> +        s->baud_delay = NANOSECONDS_PER_SECOND / ssp->speed;
>          /* Moments later... (but shorter than 100ms) */
>          s->modem_state |= CHR_TIOCM_CTS;
>          break;
> @@ -389,7 +389,7 @@ static void csrhci_reset(struct csrhci_s *s)
>      s->out_len = 0;
>      s->out_size = FIFO_LEN;
>      s->in_len = 0;
> -    s->baud_delay = get_ticks_per_sec();
> +    s->baud_delay = NANOSECONDS_PER_SECOND;
>      s->enable = 0;
>      s->in_hdr = INT_MAX;
>      s->in_data = INT_MAX;
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index b590d99..486591b 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -205,7 +205,7 @@ static void uart_parameters_setup(CadenceUARTState *s)
>      }
>
>      packet_size += ssp.data_bits + ssp.stop_bits;
> -    s->char_tx_time = (get_ticks_per_sec() / ssp.speed) * packet_size;
> +    s->char_tx_time = (NANOSECONDS_PER_SECOND / ssp.speed) * packet_size;
>      if (s->chr) {
>          qemu_chr_fe_ioctl(s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
>      }
> @@ -479,7 +479,7 @@ static void cadence_uart_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq);
>
> -    s->char_tx_time = (get_ticks_per_sec() / 9600) * 10;
> +    s->char_tx_time = (NANOSECONDS_PER_SECOND / 9600) * 10;
>  }
>
>  static int cadence_uart_post_load(void *opaque, int version_id)
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 39e07db..efc93dd 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -178,7 +178,7 @@ static void serial_update_parameters(SerialState *s)
>      ssp.parity = parity;
>      ssp.data_bits = data_bits;
>      ssp.stop_bits = stop_bits;
> -    s->char_transmit_time =  (get_ticks_per_sec() / speed) * frame_size;
> +    s->char_transmit_time =  (NANOSECONDS_PER_SECOND / speed) *
> frame_size;
>      qemu_chr_fe_ioctl(s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
>
>      DPRINTF("speed=%d parity=%c data=%d stop=%d\n",
> @@ -217,7 +217,7 @@ static void serial_update_msl(SerialState *s)
>         We'll be lazy and poll only every 10ms, and only poll it at all if
> MSI interrupts are turned on */
>
>      if (s->poll_msl)
> -        timer_mod(s->modem_status_poll,
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + get_ticks_per_sec() / 100);
> +        timer_mod(s->modem_status_poll,
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + NANOSECONDS_PER_SECOND / 100);
>  }
>
>  static gboolean serial_xmit(GIOChannel *chan, GIOCondition cond, void
> *opaque)
> @@ -823,7 +823,7 @@ static void serial_reset(void *opaque)
>      s->mcr = UART_MCR_OUT2;
>      s->scr = 0;
>      s->tsr_retry = 0;
> -    s->char_transmit_time = (get_ticks_per_sec() / 9600) * 10;
> +    s->char_transmit_time = (NANOSECONDS_PER_SECOND / 9600) * 10;
>      s->poll_msl = 0;
>
>      s->timeout_ipending = 0;
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 555cac6..026b7d1 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -235,9 +235,9 @@ static void
> vga_precise_update_retrace_info(VGACommonState *s)
>
>      r->total_chars = vtotal_lines * htotal_chars;
>      if (r->freq) {
> -        r->ticks_per_char = get_ticks_per_sec() / (r->total_chars *
> r->freq);
> +        r->ticks_per_char = NANOSECONDS_PER_SECOND / (r->total_chars *
> r->freq);
>      } else {
> -        r->ticks_per_char = get_ticks_per_sec() / chars_per_sec;
> +        r->ticks_per_char = NANOSECONDS_PER_SECOND / chars_per_sec;
>      }
>
>      r->vstart = vretr_start_line;
> @@ -265,7 +265,7 @@ static void
> vga_precise_update_retrace_info(VGACommonState *s)
>          "dots = %d\n"
>          "ticks/char = %" PRId64 "\n"
>          "\n",
> -        (double) get_ticks_per_sec() / (r->ticks_per_char *
> r->total_chars),
> +        (double) NANOSECONDS_PER_SECOND / (r->ticks_per_char *
> r->total_chars),
>          htotal_chars,
>          hretr_start_char,
>          hretr_skew_chars,
> diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
> index 1c4f8df..a06c235 100644
> --- a/hw/dma/rc4030.c
> +++ b/hw/dma/rc4030.c
> @@ -112,7 +112,7 @@ static void set_next_tick(rc4030State *s)
>      tm_hz = 1000 / (s->itr + 1);
>
>      timer_mod(s->periodic_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   get_ticks_per_sec() / tm_hz);
> +                   NANOSECONDS_PER_SECOND / tm_hz);
>  }
>
>  /* called for accesses to rc4030 */
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 241e840..ea614de 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -976,7 +976,7 @@ static void ide_sector_write_cb(void *opaque, int ret)
>             option _only_ to install Windows 2000. You must disable it
>             for normal use. */
>          timer_mod(s->sector_write_timer,
> -                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (get_ticks_per_sec() / 1000));
> +                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (NANOSECONDS_PER_SECOND / 1000));
>      } else {
>          ide_set_irq(s->bus);
>      }
> diff --git a/hw/input/hid.c b/hw/input/hid.c
> index 41a9387..874a5f5 100644
> --- a/hw/input/hid.c
> +++ b/hw/input/hid.c
> @@ -96,7 +96,7 @@ void hid_set_next_idle(HIDState *hs)
>  {
>      if (hs->idle) {
>          uint64_t expire_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                               get_ticks_per_sec() * hs->idle * 4 / 1000;
> +                               NANOSECONDS_PER_SECOND * hs->idle * 4 /
> 1000;
>          if (!hs->idle_timer) {
>              hs->idle_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> hid_idle_timer, hs);
>          }
> diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
> index 8da4887..3baa94f 100644
> --- a/hw/input/tsc2005.c
> +++ b/hw/input/tsc2005.c
> @@ -291,7 +291,7 @@ static void tsc2005_pin_update(TSC2005State *s)
>      s->precision = s->nextprecision;
>      s->function = s->nextfunction;
>      s->pdst = !s->pnd0;        /* Synchronised on internal clock */
> -    expires = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (get_ticks_per_sec() >> 7);
> +    expires = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (NANOSECONDS_PER_SECOND >> 7);
>      timer_mod(s->timer, expires);
>  }
>
> diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
> index d11ef04..437db26 100644
> --- a/hw/input/tsc210x.c
> +++ b/hw/input/tsc210x.c
> @@ -835,7 +835,7 @@ static void tsc210x_pin_update(TSC210xState *s)
>      s->busy = 1;
>      s->precision = s->nextprecision;
>      s->function = s->nextfunction;
> -    expires = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (get_ticks_per_sec() >> 10);
> +    expires = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> (NANOSECONDS_PER_SECOND >> 10);
>      timer_mod(s->timer, expires);
>  }
>
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 6f3a863..bb43669 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -230,7 +230,7 @@ int pic_read_irq(DeviceState *d)
>      printf("IRQ%d latency=%0.3fus\n",
>             irq,
>             (double)(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) -
> -                    irq_time[irq]) * 1000000.0 / get_ticks_per_sec());
> +                    irq_time[irq]) * 1000000.0 / NANOSECONDS_PER_SECOND);
>  #endif
>      DPRINTF("pic_interrupt: irq=%d\n", irq);
>      return intno;
> diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
> index 339205b..9949209 100644
> --- a/hw/misc/arm_sysctl.c
> +++ b/hw/misc/arm_sysctl.c
> @@ -171,7 +171,7 @@ static uint64_t arm_sysctl_read(void *opaque, hwaddr
> offset,
>      case 0x58: /* BOOTCS */
>          return 0;
>      case 0x5c: /* 24MHz */
> -        return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 24000000,
> get_ticks_per_sec());
> +        return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 24000000,
> NANOSECONDS_PER_SECOND);
>      case 0x60: /* MISC */
>          return 0;
>      case 0x84: /* PROCID0 */
> diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
> index 481abdb..83995cc 100644
> --- a/hw/misc/macio/cuda.c
> +++ b/hw/misc/macio/cuda.c
> @@ -145,7 +145,7 @@ static void cuda_update_irq(CUDAState *s)
>
>  static uint64_t get_tb(uint64_t time, uint64_t freq)
>  {
> -    return muldiv64(time, freq, get_ticks_per_sec());
> +    return muldiv64(time, freq, NANOSECONDS_PER_SECOND);
>  }
>
>  static unsigned int get_counter(CUDATimer *ti)
> @@ -189,7 +189,7 @@ static int64_t get_next_irq_time(CUDATimer *s, int64_t
> current_time)
>
>      /* current counter value */
>      d = muldiv64(current_time - s->load_time,
> -                 CUDA_TIMER_FREQ, get_ticks_per_sec());
> +                 CUDA_TIMER_FREQ, NANOSECONDS_PER_SECOND);
>      /* the timer goes down from latch to -1 (period of latch + 2) */
>      if (d <= (s->counter_value + 1)) {
>          counter = (s->counter_value - d) & 0xffff;
> @@ -208,7 +208,7 @@ static int64_t get_next_irq_time(CUDATimer *s, int64_t
> current_time)
>      }
>      CUDA_DPRINTF("latch=%d counter=%" PRId64 " delta_next=%" PRId64 "\n",
>                   s->latch, d, next_time - d);
> -    next_time = muldiv64(next_time, get_ticks_per_sec(), CUDA_TIMER_FREQ)
> +
> +    next_time = muldiv64(next_time, NANOSECONDS_PER_SECOND,
> CUDA_TIMER_FREQ) +
>          s->load_time;
>      if (next_time <= current_time)
>          next_time = current_time + 1;
> @@ -531,7 +531,7 @@ static void cuda_adb_poll(void *opaque)
>      }
>      timer_mod(s->adb_poll_timer,
>                     qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   (get_ticks_per_sec() / (1000 / s->autopoll_rate_ms)));
> +                   (NANOSECONDS_PER_SECOND / (1000 /
> s->autopoll_rate_ms)));
>  }
>
>  /* description of commands */
> @@ -559,7 +559,7 @@ static bool cuda_cmd_autopoll(CUDAState *s,
>          if (autopoll) {
>              timer_mod(s->adb_poll_timer,
>                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                      (get_ticks_per_sec() / (1000 /
> s->autopoll_rate_ms)));
> +                      (NANOSECONDS_PER_SECOND / (1000 /
> s->autopoll_rate_ms)));
>          } else {
>              timer_del(s->adb_poll_timer);
>          }
> @@ -585,7 +585,7 @@ static bool cuda_cmd_set_autorate(CUDAState *s,
>      if (s->autopoll) {
>          timer_mod(s->adb_poll_timer,
>                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                  (get_ticks_per_sec() / (1000 / s->autopoll_rate_ms)));
> +                  (NANOSECONDS_PER_SECOND / (1000 /
> s->autopoll_rate_ms)));
>      }
>      return true;
>  }
> @@ -665,7 +665,7 @@ static bool cuda_cmd_get_time(CUDAState *s,
>      }
>
>      ti = s->tick_offset + (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
> -                           / get_ticks_per_sec());
> +                           / NANOSECONDS_PER_SECOND);
>      out_data[0] = ti >> 24;
>      out_data[1] = ti >> 16;
>      out_data[2] = ti >> 8;
> @@ -687,7 +687,7 @@ static bool cuda_cmd_set_time(CUDAState *s,
>      ti = (((uint32_t)in_data[1]) << 24) + (((uint32_t)in_data[2]) << 16)
>           + (((uint32_t)in_data[3]) << 8) + in_data[4];
>      s->tick_offset = ti - (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
> -                           / get_ticks_per_sec());
> +                           / NANOSECONDS_PER_SECOND);
>      return true;
>  }
>
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index 42325bf..5071f95 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -253,7 +253,7 @@ static uint64_t timer_read(void *opaque, hwaddr addr,
> unsigned size)
>      uint64_t systime = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      uint64_t kltime;
>
> -    kltime = muldiv64(systime, 4194300, get_ticks_per_sec() * 4);
> +    kltime = muldiv64(systime, 4194300, NANOSECONDS_PER_SECOND * 4);
>      kltime = muldiv64(kltime, 18432000, 1048575);
>
>      switch (addr) {
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index e847b77..e6c9f98 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -293,7 +293,7 @@ static void dp8393x_set_next_tick(dp8393xState *s)
>
>      ticks = s->regs[SONIC_WT1] << 16 | s->regs[SONIC_WT0];
>      s->wt_last_update = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -    delay = get_ticks_per_sec() * ticks / 5000000;
> +    delay = NANOSECONDS_PER_SECOND * ticks / 5000000;
>      timer_mod(s->watchdog, s->wt_last_update + delay);
>  }
>
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index ce90b09..ce2cb89 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -463,7 +463,7 @@ void ppce500_set_mpic_proxy(bool enabled)
>  uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t
> tb_offset)
>  {
>      /* TB time in tb periods */
> -    return muldiv64(vmclk, tb_env->tb_freq, get_ticks_per_sec()) +
> tb_offset;
> +    return muldiv64(vmclk, tb_env->tb_freq, NANOSECONDS_PER_SECOND) +
> tb_offset;
>  }
>
>  uint64_t cpu_ppc_load_tbl (CPUPPCState *env)
> @@ -504,7 +504,7 @@ uint32_t cpu_ppc_load_tbu (CPUPPCState *env)
>  static inline void cpu_ppc_store_tb(ppc_tb_t *tb_env, uint64_t vmclk,
>                                      int64_t *tb_offsetp, uint64_t value)
>  {
> -    *tb_offsetp = value - muldiv64(vmclk, tb_env->tb_freq,
> get_ticks_per_sec());
> +    *tb_offsetp = value - muldiv64(vmclk, tb_env->tb_freq,
> NANOSECONDS_PER_SECOND);
>      LOG_TB("%s: tb %016" PRIx64 " offset %08" PRIx64 "\n",
>                  __func__, value, *tb_offsetp);
>  }
> @@ -638,11 +638,11 @@ static inline uint32_t
> _cpu_ppc_load_decr(CPUPPCState *env, uint64_t next)
>
>      diff = next - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      if (diff >= 0) {
> -        decr = muldiv64(diff, tb_env->decr_freq, get_ticks_per_sec());
> +        decr = muldiv64(diff, tb_env->decr_freq, NANOSECONDS_PER_SECOND);
>      } else if (tb_env->flags & PPC_TIMER_BOOKE) {
>          decr = 0;
>      }  else {
> -        decr = -muldiv64(-diff, tb_env->decr_freq, get_ticks_per_sec());
> +        decr = -muldiv64(-diff, tb_env->decr_freq,
> NANOSECONDS_PER_SECOND);
>      }
>      LOG_TB("%s: %08" PRIx32 "\n", __func__, decr);
>
> @@ -674,7 +674,7 @@ uint64_t cpu_ppc_load_purr (CPUPPCState *env)
>
>      diff = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - tb_env->purr_start;
>
> -    return tb_env->purr_load + muldiv64(diff, tb_env->tb_freq,
> get_ticks_per_sec());
> +    return tb_env->purr_load + muldiv64(diff, tb_env->tb_freq,
> NANOSECONDS_PER_SECOND);
>  }
>
>  /* When decrementer expires,
> @@ -750,7 +750,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu,
> uint64_t *nextp,
>
>      /* Calculate the next timer event */
>      now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -    next = now + muldiv64(value, get_ticks_per_sec(), tb_env->decr_freq);
> +    next = now + muldiv64(value, NANOSECONDS_PER_SECOND,
> tb_env->decr_freq);
>      *nextp = next;
>
>      /* Adjust timer */
> @@ -1011,7 +1011,7 @@ static void cpu_4xx_fit_cb (void *opaque)
>          /* Cannot occur, but makes gcc happy */
>          return;
>      }
> -    next = now + muldiv64(next, get_ticks_per_sec(), tb_env->tb_freq);
> +    next = now + muldiv64(next, NANOSECONDS_PER_SECOND, tb_env->tb_freq);
>      if (next == now)
>          next++;
>      timer_mod(ppc40x_timer->fit_timer, next);
> @@ -1042,7 +1042,7 @@ static void start_stop_pit (CPUPPCState *env,
> ppc_tb_t *tb_env, int is_excp)
>                      __func__, ppc40x_timer->pit_reload);
>          now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>          next = now + muldiv64(ppc40x_timer->pit_reload,
> -                              get_ticks_per_sec(), tb_env->decr_freq);
> +                              NANOSECONDS_PER_SECOND, tb_env->decr_freq);
>          if (is_excp)
>              next += tb_env->decr_next - now;
>          if (next == now)
> @@ -1107,7 +1107,7 @@ static void cpu_4xx_wdt_cb (void *opaque)
>          /* Cannot occur, but makes gcc happy */
>          return;
>      }
> -    next = now + muldiv64(next, get_ticks_per_sec(), tb_env->decr_freq);
> +    next = now + muldiv64(next, NANOSECONDS_PER_SECOND,
> tb_env->decr_freq);
>      if (next == now)
>          next++;
>      LOG_TB("%s: TCR " TARGET_FMT_lx " TSR " TARGET_FMT_lx "\n", __func__,
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index ec81f65..3fcaf01 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1353,7 +1353,7 @@ static uint32_t ppc4xx_gpt_readl (void *opaque,
> hwaddr addr)
>      case 0x00:
>          /* Time base counter */
>          ret = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> gpt->tb_offset,
> -                       gpt->tb_freq, get_ticks_per_sec());
> +                       gpt->tb_freq, NANOSECONDS_PER_SECOND);
>          break;
>      case 0x10:
>          /* Output enable */
> @@ -1408,7 +1408,7 @@ static void ppc4xx_gpt_writel (void *opaque,
>      switch (addr) {
>      case 0x00:
>          /* Time base counter */
> -        gpt->tb_offset = muldiv64(value, get_ticks_per_sec(),
> gpt->tb_freq)
> +        gpt->tb_offset = muldiv64(value, NANOSECONDS_PER_SECOND,
> gpt->tb_freq)
>              - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>          ppc4xx_gpt_compute_timer(gpt);
>          break;
> diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
> index a8d4e76..86fafc9 100644
> --- a/hw/ppc/ppc_booke.c
> +++ b/hw/ppc/ppc_booke.c
> @@ -163,7 +163,7 @@ static void booke_update_fixed_timer(CPUPPCState
>    *env,
>          ticks += delta_tick;
>      }
>
> -    *next = now + muldiv64(ticks, get_ticks_per_sec(), tb_env->tb_freq);
> +    *next = now + muldiv64(ticks, NANOSECONDS_PER_SECOND,
> tb_env->tb_freq);
>      if ((*next < now) || (*next > INT64_MAX)) {
>          /* Overflow, so assume the biggest number the qemu timer
> supports. */
>          *next = INT64_MAX;
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index c712daf..161177c 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -216,7 +216,7 @@
>  #define SD_HOST_SPECv2_VERS             0x2401
>
>  #define SDHC_REGISTERS_MAP_SIZE         0x100
> -#define SDHC_INSERTION_DELAY            (get_ticks_per_sec())
> +#define SDHC_INSERTION_DELAY            (NANOSECONDS_PER_SECOND)
>  #define SDHC_TRANSFER_DELAY             100
>  #define SDHC_ADMA_DESCS_PER_DELAY       5
>  #define SDHC_CMD_RESPONSE               (3 << 0)
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index 0a6f453..232bdc2 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -445,12 +445,12 @@ static void hstick_irq(void *opaque)
>
>  static int64_t cpu_to_timer_ticks(int64_t cpu_ticks, uint32_t frequency)
>  {
> -    return muldiv64(cpu_ticks, get_ticks_per_sec(), frequency);
> +    return muldiv64(cpu_ticks, NANOSECONDS_PER_SECOND, frequency);
>  }
>
>  static uint64_t timer_to_cpu_ticks(int64_t timer_ticks, uint32_t
> frequency)
>  {
> -    return muldiv64(timer_ticks, frequency, get_ticks_per_sec());
> +    return muldiv64(timer_ticks, frequency, NANOSECONDS_PER_SECOND);
>  }
>
>  void cpu_tick_set_count(CPUTimer *timer, uint64_t count)
> diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
> index b84a33f..5e61ad5 100644
> --- a/hw/timer/i8254.c
> +++ b/hw/timer/i8254.c
> @@ -53,7 +53,7 @@ static int pit_get_count(PITChannelState *s)
>      int counter;
>
>      d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) -
> s->count_load_time, PIT_FREQ,
> -                 get_ticks_per_sec());
> +                 NANOSECONDS_PER_SECOND);
>      switch(s->mode) {
>      case 0:
>      case 1:
> @@ -263,7 +263,7 @@ static void pit_irq_timer_update(PITChannelState *s,
> int64_t current_time)
>  #ifdef DEBUG_PIT
>      printf("irq_level=%d next_delay=%f\n",
>             irq_level,
> -           (double)(expire_time - current_time) / get_ticks_per_sec());
> +           (double)(expire_time - current_time) / NANOSECONDS_PER_SECOND);
>  #endif
>      s->next_transition_time = expire_time;
>      if (expire_time != -1)
> diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c
> index ed511b8..e18299a 100644
> --- a/hw/timer/i8254_common.c
> +++ b/hw/timer/i8254_common.c
> @@ -47,7 +47,7 @@ int pit_get_out(PITChannelState *s, int64_t current_time)
>      int out;
>
>      d = muldiv64(current_time - s->count_load_time, PIT_FREQ,
> -                 get_ticks_per_sec());
> +                 NANOSECONDS_PER_SECOND);
>      switch (s->mode) {
>      default:
>      case 0:
> @@ -81,7 +81,7 @@ int64_t pit_get_next_transition_time(PITChannelState *s,
> int64_t current_time)
>      int period2;
>
>      d = muldiv64(current_time - s->count_load_time, PIT_FREQ,
> -                 get_ticks_per_sec());
> +                 NANOSECONDS_PER_SECOND);
>      switch (s->mode) {
>      default:
>      case 0:
> @@ -121,7 +121,7 @@ int64_t pit_get_next_transition_time(PITChannelState
> *s, int64_t current_time)
>          break;
>      }
>      /* convert to timer units */
> -    next_time = s->count_load_time + muldiv64(next_time,
> get_ticks_per_sec(),
> +    next_time = s->count_load_time + muldiv64(next_time,
> NANOSECONDS_PER_SECOND,
>                                                PIT_FREQ);
>      /* fix potential rounding problems */
>      /* XXX: better solution: use a clock at PIT_FREQ Hz */
> diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
> index eb0100a..f9c23df 100644
> --- a/hw/timer/mc146818rtc.c
> +++ b/hw/timer/mc146818rtc.c
> @@ -120,7 +120,7 @@ static void rtc_coalesced_timer_update(RTCState *s)
>          /* divide each RTC interval to 2 - 8 smaller intervals */
>          int c = MIN(s->irq_coalesced, 7) + 1;
>          int64_t next_clock = qemu_clock_get_ns(rtc_clock) +
> -            muldiv64(s->period / c, get_ticks_per_sec(), RTC_CLOCK_RATE);
> +            muldiv64(s->period / c, NANOSECONDS_PER_SECOND,
> RTC_CLOCK_RATE);
>          timer_mod(s->coalesced_timer, next_clock);
>      }
>  }
> @@ -166,10 +166,10 @@ static void periodic_timer_update(RTCState *s,
> int64_t current_time)
>          s->period = period;
>  #endif
>          /* compute 32 khz clock */
> -        cur_clock = muldiv64(current_time, RTC_CLOCK_RATE,
> get_ticks_per_sec());
> +        cur_clock = muldiv64(current_time, RTC_CLOCK_RATE,
> NANOSECONDS_PER_SECOND);
>          next_irq_clock = (cur_clock & ~(period - 1)) + period;
>          s->next_periodic_time =
> -            muldiv64(next_irq_clock, get_ticks_per_sec(), RTC_CLOCK_RATE)
> + 1;
> +            muldiv64(next_irq_clock, NANOSECONDS_PER_SECOND,
> RTC_CLOCK_RATE) + 1;
>          timer_mod(s->periodic_timer, s->next_periodic_time);
>      } else {
>  #ifdef TARGET_I386
> diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
> index b303421..3a43863 100644
> --- a/hw/timer/omap_gptimer.c
> +++ b/hw/timer/omap_gptimer.c
> @@ -402,7 +402,7 @@ static void omap_gp_timer_write(void *opaque, hwaddr
> addr,
>          if (s->trigger == gpt_trigger_none)
>              omap_gp_timer_out(s, s->scpwm);
>          /* TODO: make sure this doesn't overflow 32-bits */
> -        s->ticks_per_sec = get_ticks_per_sec() << (s->pre ? s->ptv + 1 :
> 0);
> +        s->ticks_per_sec = NANOSECONDS_PER_SECOND << (s->pre ? s->ptv + 1
> : 0);
>          omap_gp_timer_update(s);
>          break;
>
> diff --git a/hw/timer/omap_synctimer.c b/hw/timer/omap_synctimer.c
> index edd8d98..e554c35 100644
> --- a/hw/timer/omap_synctimer.c
> +++ b/hw/timer/omap_synctimer.c
> @@ -29,7 +29,7 @@ struct omap_synctimer_s {
>
>  /* 32-kHz Sync Timer of the OMAP2 */
>  static uint32_t omap_synctimer_read(struct omap_synctimer_s *s) {
> -    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 0x8000,
> get_ticks_per_sec());
> +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 0x8000,
> NANOSECONDS_PER_SECOND);
>  }
>
>  void omap_synctimer_reset(struct omap_synctimer_s *s)
> diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
> index 3ccb2cb..bdec478 100644
> --- a/hw/timer/pl031.c
> +++ b/hw/timer/pl031.c
> @@ -80,7 +80,7 @@ static void pl031_interrupt(void * opaque)
>  static uint32_t pl031_get_count(PL031State *s)
>  {
>      int64_t now = qemu_clock_get_ns(rtc_clock);
> -    return s->tick_offset + now / get_ticks_per_sec();
> +    return s->tick_offset + now / NANOSECONDS_PER_SECOND;
>  }
>
>  static void pl031_set_alarm(PL031State *s)
> @@ -96,7 +96,7 @@ static void pl031_set_alarm(PL031State *s)
>          pl031_interrupt(s);
>      } else {
>          int64_t now = qemu_clock_get_ns(rtc_clock);
> -        timer_mod(s->timer, now + (int64_t)ticks * get_ticks_per_sec());
> +        timer_mod(s->timer, now + (int64_t)ticks *
> NANOSECONDS_PER_SECOND);
>      }
>  }
>
> @@ -204,7 +204,7 @@ static void pl031_init(Object *obj)
>      sysbus_init_irq(dev, &s->irq);
>      qemu_get_timedate(&tm, 0);
>      s->tick_offset = mktimegm(&tm) -
> -        qemu_clock_get_ns(rtc_clock) / get_ticks_per_sec();
> +        qemu_clock_get_ns(rtc_clock) / NANOSECONDS_PER_SECOND;
>
>      s->timer = timer_new_ns(rtc_clock, pl031_interrupt, s);
>  }
> @@ -216,7 +216,7 @@ static void pl031_pre_save(void *opaque)
>      /* tick_offset is base_time - rtc_clock base time.  Instead, we want
> to
>       * store the base time relative to the QEMU_CLOCK_VIRTUAL for
> backwards-compatibility.  */
>      int64_t delta = qemu_clock_get_ns(rtc_clock) -
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -    s->tick_offset_vmstate = s->tick_offset + delta / get_ticks_per_sec();
> +    s->tick_offset_vmstate = s->tick_offset + delta /
> NANOSECONDS_PER_SECOND;
>  }
>
>  static int pl031_post_load(void *opaque, int version_id)
> @@ -224,7 +224,7 @@ static int pl031_post_load(void *opaque, int
> version_id)
>      PL031State *s = opaque;
>
>      int64_t delta = qemu_clock_get_ns(rtc_clock) -
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -    s->tick_offset = s->tick_offset_vmstate - delta / get_ticks_per_sec();
> +    s->tick_offset = s->tick_offset_vmstate - delta /
> NANOSECONDS_PER_SECOND;
>      pl031_set_alarm(s);
>      return 0;
>  }
> diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
> index 33449e6..78d1477 100644
> --- a/hw/timer/pxa2xx_timer.c
> +++ b/hw/timer/pxa2xx_timer.c
> @@ -119,11 +119,11 @@ static void pxa2xx_timer_update(void *opaque,
> uint64_t now_qemu)
>      uint64_t new_qemu;
>
>      now_vm = s->clock +
> -            muldiv64(now_qemu - s->lastload, s->freq,
> get_ticks_per_sec());
> +            muldiv64(now_qemu - s->lastload, s->freq,
> NANOSECONDS_PER_SECOND);
>
>      for (i = 0; i < 4; i ++) {
>          new_qemu = now_qemu + muldiv64((uint32_t) (s->timer[i].value -
> now_vm),
> -                        get_ticks_per_sec(), s->freq);
> +                        NANOSECONDS_PER_SECOND, s->freq);
>          timer_mod(s->timer[i].qtimer, new_qemu);
>      }
>  }
> @@ -148,10 +148,10 @@ static void pxa2xx_timer_update4(void *opaque,
> uint64_t now_qemu, int n)
>
>      now_vm = s->tm4[counter].clock + muldiv64(now_qemu -
>                      s->tm4[counter].lastload,
> -                    s->tm4[counter].freq, get_ticks_per_sec());
> +                    s->tm4[counter].freq, NANOSECONDS_PER_SECOND);
>
>      new_qemu = now_qemu + muldiv64((uint32_t) (s->tm4[n].tm.value -
> now_vm),
> -                    get_ticks_per_sec(), s->tm4[counter].freq);
> +                    NANOSECONDS_PER_SECOND, s->tm4[counter].freq);
>      timer_mod(s->tm4[n].tm.qtimer, new_qemu);
>  }
>
> @@ -190,7 +190,7 @@ static uint64_t pxa2xx_timer_read(void *opaque, hwaddr
> offset,
>          return s->tm4[tm].tm.value;
>      case OSCR:
>          return s->clock + muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) -
> -                        s->lastload, s->freq, get_ticks_per_sec());
> +                        s->lastload, s->freq, NANOSECONDS_PER_SECOND);
>      case OSCR11: tm ++;
>          /* fall through */
>      case OSCR10: tm ++;
> @@ -214,7 +214,7 @@ static uint64_t pxa2xx_timer_read(void *opaque, hwaddr
> offset,
>                  s->snapshot = s->tm4[tm - 1].clock + muldiv64(
>                                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) -
>                                  s->tm4[tm - 1].lastload,
> -                                s->tm4[tm - 1].freq, get_ticks_per_sec());
> +                                s->tm4[tm - 1].freq,
> NANOSECONDS_PER_SECOND);
>              else
>                  s->snapshot = s->tm4[tm - 1].clock;
>          }
> @@ -222,7 +222,7 @@ static uint64_t pxa2xx_timer_read(void *opaque, hwaddr
> offset,
>          if (!s->tm4[tm].freq)
>              return s->tm4[tm].clock;
>          return s->tm4[tm].clock +
> muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) -
> -                        s->tm4[tm].lastload, s->tm4[tm].freq,
> get_ticks_per_sec());
> +                        s->tm4[tm].lastload, s->tm4[tm].freq,
> NANOSECONDS_PER_SECOND);
>      case OIER:
>          return s->irq_enabled;
>      case OSSR: /* Status register */
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 1b50601..f9a3dd0 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -2303,10 +2303,10 @@ static void ehci_frame_timer(void *opaque)
>          /* If we've raised int, we speed up the timer, so that we quickly
>           * notice any new packets queued up in response */
>          if (ehci->int_req_by_async && (ehci->usbsts & USBSTS_INT)) {
> -            expire_time = t_now + get_ticks_per_sec() / (FRAME_TIMER_FREQ
> * 4);
> +            expire_time = t_now + NANOSECONDS_PER_SECOND /
> (FRAME_TIMER_FREQ * 4);
>              ehci->int_req_by_async = false;
>          } else {
> -            expire_time = t_now + (get_ticks_per_sec()
> +            expire_time = t_now + (NANOSECONDS_PER_SECOND
>                                 * (ehci->async_stepdown+1) /
> FRAME_TIMER_FREQ);
>          }
>          timer_mod(ehci->frame_timer, expire_time);
> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
> index cd23197..27d9d0b 100644
> --- a/hw/usb/hcd-musb.c
> +++ b/hw/usb/hcd-musb.c
> @@ -564,7 +564,7 @@ static void musb_schedule_cb(USBPort *port, USBPacket
> *packey)
>          ep->intv_timer[dir] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> musb_cb_tick, ep);
>
>      timer_mod(ep->intv_timer[dir], qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   muldiv64(timeout, get_ticks_per_sec(), 8000));
> +                   muldiv64(timeout, NANOSECONDS_PER_SECOND, 8000));
>  }
>
>  static int musb_timeout(int ttype, int speed, int val)
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index 17ed461..a9bf805 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -1849,12 +1849,12 @@ static void usb_ohci_init(OHCIState *ohci,
> DeviceState *dev,
>
>      if (usb_frame_time == 0) {
>  #ifdef OHCI_TIME_WARP
> -        usb_frame_time = get_ticks_per_sec();
> -        usb_bit_time = muldiv64(1, get_ticks_per_sec(), USB_HZ/1000);
> +        usb_frame_time = NANOSECONDS_PER_SECOND;
> +        usb_bit_time = muldiv64(1, NANOSECONDS_PER_SECOND, USB_HZ/1000);
>  #else
> -        usb_frame_time = muldiv64(1, get_ticks_per_sec(), 1000);
> -        if (get_ticks_per_sec() >= USB_HZ) {
> -            usb_bit_time = muldiv64(1, get_ticks_per_sec(), USB_HZ);
> +        usb_frame_time = muldiv64(1, NANOSECONDS_PER_SECOND, 1000);
> +        if (NANOSECONDS_PER_SECOND >= USB_HZ) {
> +            usb_bit_time = muldiv64(1, NANOSECONDS_PER_SECOND, USB_HZ);
>          } else {
>              usb_bit_time = 1;
>          }
> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
> index c370240..2dbf22b 100644
> --- a/hw/usb/hcd-uhci.c
> +++ b/hw/usb/hcd-uhci.c
> @@ -402,7 +402,7 @@ static int uhci_post_load(void *opaque, int version_id)
>
>      if (version_id < 2) {
>          s->expire_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -            (get_ticks_per_sec() / FRAME_TIMER_FREQ);
> +            (NANOSECONDS_PER_SECOND / FRAME_TIMER_FREQ);
>      }
>      return 0;
>  }
> @@ -444,7 +444,7 @@ static void uhci_port_write(void *opaque, hwaddr addr,
>              /* start frame processing */
>              trace_usb_uhci_schedule_start();
>              s->expire_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                (get_ticks_per_sec() / FRAME_TIMER_FREQ);
> +                (NANOSECONDS_PER_SECOND / FRAME_TIMER_FREQ);
>              timer_mod(s->frame_timer, s->expire_time);
>              s->status &= ~UHCI_STS_HCHALTED;
>          } else if (!(val & UHCI_CMD_RS)) {
> @@ -1130,7 +1130,7 @@ static void uhci_frame_timer(void *opaque)
>      UHCIState *s = opaque;
>      uint64_t t_now, t_last_run;
>      int i, frames;
> -    const uint64_t frame_t = get_ticks_per_sec() / FRAME_TIMER_FREQ;
> +    const uint64_t frame_t = NANOSECONDS_PER_SECOND / FRAME_TIMER_FREQ;
>
>      s->completions_only = false;
>      qemu_bh_cancel(s->bh);
> diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
> index 9f6af90..31d3e5b 100644
> --- a/hw/usb/tusb6010.c
> +++ b/hw/usb/tusb6010.c
> @@ -516,7 +516,7 @@ static void tusb_async_writew(void *opaque, hwaddr
> addr,
>          if (value & TUSB_DEV_OTG_TIMER_ENABLE)
>              timer_mod(s->otg_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
> +
>                              muldiv64(TUSB_DEV_OTG_TIMER_VAL(value),
> -                                     get_ticks_per_sec(), TUSB_DEVCLOCK));
> +                                     NANOSECONDS_PER_SECOND,
> TUSB_DEVCLOCK));
>          else
>              timer_del(s->otg_timer);
>          break;
> @@ -727,7 +727,7 @@ static void tusb6010_power(TUSBState *s, int on)
>          s->intr_ok = 0;
>          tusb_intr_update(s);
>          timer_mod(s->pwr_timer,
> -                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> get_ticks_per_sec() / 2);
> +                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> NANOSECONDS_PER_SECOND / 2);
>      }
>  }
>
> diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
> index 1c3658e..f54a35a 100644
> --- a/hw/watchdog/wdt_diag288.c
> +++ b/hw/watchdog/wdt_diag288.c
> @@ -79,7 +79,7 @@ static int wdt_diag288_handle_timer(DIAG288State
> *diag288,
>          }
>          timer_mod(diag288->timer,
>                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                  timeout * get_ticks_per_sec());
> +                  timeout * NANOSECONDS_PER_SECOND);
>          break;
>      case WDT_DIAG288_CANCEL:
>          if (!diag288->enabled) {
> diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
> index 532530b..532afe8 100644
> --- a/hw/watchdog/wdt_ib700.c
> +++ b/hw/watchdog/wdt_ib700.c
> @@ -64,7 +64,7 @@ static void ib700_write_enable_reg(void *vp, uint32_t
> addr, uint32_t data)
>
>      ib700_debug("addr = %x, data = %x\n", addr, data);
>
> -    timeout = (int64_t) time_map[data & 0xF] * get_ticks_per_sec();
> +    timeout = (int64_t) time_map[data & 0xF] * NANOSECONDS_PER_SECOND;
>      timer_mod(s->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + timeout);
>  }
>
> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> index 7462e20..a2aa704 100644
> --- a/include/hw/acpi/acpi.h
> +++ b/include/hw/acpi/acpi.h
> @@ -155,7 +155,7 @@ void acpi_pm_tmr_reset(ACPIREGS *ar);
>  static inline int64_t acpi_pm_tmr_get_clock(void)
>  {
>      return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> PM_TIMER_FREQUENCY,
> -                    get_ticks_per_sec());
> +                    NANOSECONDS_PER_SECOND);
>  }
>
>  /* PM1a_EVT: piix and ich9 don't implement PM1b. */
> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index d0946cb..384fc6b 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -785,18 +785,13 @@ void cpu_enable_ticks(void);
>  /* Caller must hold BQL */
>  void cpu_disable_ticks(void);
>
> -static inline int64_t get_ticks_per_sec(void)
> -{
> -    return 1000000000LL;
> -}
> -
>  static inline int64_t get_max_clock_jump(void)
>  {
>      /* This should be small enough to prevent excessive interrupts from
> being
>       * generated by the RTC on clock jumps, but large enough to avoid
> frequent
>       * unnecessary resets in idle VMs.
>       */
> -    return 60 * get_ticks_per_sec();
> +    return 60 * NANOSECONDS_PER_SECOND;
>  }
>
>  /*
> @@ -822,7 +817,7 @@ static inline int64_t get_clock(void)
>  {
>      LARGE_INTEGER ti;
>      QueryPerformanceCounter(&ti);
> -    return muldiv64(ti.QuadPart, get_ticks_per_sec(), clock_freq);
> +    return muldiv64(ti.QuadPart, NANOSECONDS_PER_SECOND, clock_freq);
>  }
>
>  #else
> diff --git a/monitor.c b/monitor.c
> index e99ca8c..6bdf174 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -1506,9 +1506,9 @@ int64_t dev_time;
>  static void hmp_info_profile(Monitor *mon, const QDict *qdict)
>  {
>      monitor_printf(mon, "async time  %" PRId64 " (%0.3f)\n",
> -                   dev_time, dev_time / (double)get_ticks_per_sec());
> +                   dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
>      monitor_printf(mon, "qemu time   %" PRId64 " (%0.3f)\n",
> -                   tcg_time, tcg_time / (double)get_ticks_per_sec());
> +                   tcg_time, tcg_time / (double)NANOSECONDS_PER_SECOND);
>      tcg_time = 0;
>      dev_time = 0;
>  }
> diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
> index d67c169..a095c91 100644
> --- a/target-ppc/kvm.c
> +++ b/target-ppc/kvm.c
> @@ -1336,7 +1336,7 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run
> *run)
>
>          /* Always wake up soon in case the interrupt was level based */
>          timer_mod(idle_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                       (get_ticks_per_sec() / 50));
> +                       (NANOSECONDS_PER_SECOND / 50));
>      }
>
>      /* We don't know if there are more interrupts pending after this.
> However,
> @@ -1796,7 +1796,7 @@ uint32_t kvmppc_get_tbfreq(void)
>  {
>      char line[512];
>      char *ns;
> -    uint32_t retval = get_ticks_per_sec();
> +    uint32_t retval = NANOSECONDS_PER_SECOND;
>
>      if (read_cpuinfo("timebase", line, sizeof(line))) {
>          return retval;
> --
> 1.9.1
>
>

--001a1149059865e1c8052ddc6bce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi,<br>
Sorry for the inconvenience caused due to the format of my patch. </p>
<p dir=3D"ltr">Due to a typo mail id was wrong, adding <a href=3D"mailto:bl=
auwirbel@gmail.com">blauwirbel@gmail.com</a> <br>
</p>
<div class=3D"gmail_quote">On Mar 11, 2016 1:00 AM,  &lt;<a href=3D"mailto:=
rutu.shah.26@gmail.com">rutu.shah.26@gmail.com</a>&gt; wrote:<br type=3D"at=
tribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">From: Rutuja Shah &lt;<a href=3D"=
mailto:rutu.shah.26@gmail.com">rutu.shah.26@gmail.com</a>&gt;<br>
<br>
---<br>
=C2=A0audio/audio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
=C2=A0audio/noaudio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++-=
-<br>
=C2=A0audio/spiceaudio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0audio/wavaudio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0backends/baum.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0block/qed.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 +++---<br>
=C2=A0hw/acpi/core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++-=
-<br>
=C2=A0hw/arm/omap1.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++++++-=
------<br>
=C2=A0hw/arm/spitz.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<=
br>
=C2=A0hw/arm/stellaris.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/arm/strongarm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/audio/adlib.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/audio/sb16.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++-=
-<br>
=C2=A0hw/block/fdc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<=
br>
=C2=A0hw/block/pflash_cfi02.c=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0hw/bt/hci-csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++-=
-<br>
=C2=A0hw/char/cadence_uart.c=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0hw/char/serial.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<b=
r>
=C2=A0hw/display/vga.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<b=
r>
=C2=A0hw/dma/rc4030.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0hw/ide/core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
=C2=A0hw/input/hid.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<=
br>
=C2=A0hw/input/tsc2005.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/input/tsc210x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/intc/i8259.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0hw/misc/arm_sysctl.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/misc/macio/cuda.c=C2=A0 =C2=A0 =C2=A0 | 16 ++++++++--------<br>
=C2=A0hw/misc/macio/macio.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0hw/net/dp8393x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/ppc/ppc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++=
++++++---------<br>
=C2=A0hw/ppc/ppc405_uc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0hw/ppc/ppc_booke.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/sd/sdhci-internal.h=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/sparc64/sun4u.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0hw/timer/i8254.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0hw/timer/i8254_common.c=C2=A0 =C2=A0|=C2=A0 6 +++---<br>
=C2=A0hw/timer/mc146818rtc.c=C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
=C2=A0hw/timer/omap_gptimer.c=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0hw/timer/omap_synctimer.c |=C2=A0 2 +-<br>
=C2=A0hw/timer/pl031.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br=
>
=C2=A0hw/timer/pxa2xx_timer.c=C2=A0 =C2=A0| 14 +++++++-------<br>
=C2=A0hw/usb/hcd-ehci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0hw/usb/hcd-musb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0hw/usb/hcd-ohci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br=
>
=C2=A0hw/usb/hcd-uhci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<b=
r>
=C2=A0hw/usb/tusb6010.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0hw/watchdog/wdt_diag288.c |=C2=A0 2 +-<br>
=C2=A0hw/watchdog/wdt_ib700.c=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0include/hw/acpi/acpi.h=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0include/qemu/timer.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++-------<br>
=C2=A0monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ++--<br>
=C2=A0target-ppc/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A053 files changed, 114 insertions(+), 119 deletions(-)<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index e841532..8c2c495 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -1870,7 +1870,7 @@ static void audio_init (void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conf.period.ticks =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conf.period.ticks =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64 (1, get_ticks_per_sec (=
), conf.period.hertz);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64 (1, NANOSECONDS_PER_SEC=
OND, conf.period.hertz);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0e =3D qemu_add_vm_change_state_handler (audio_vm_change=
_state_handler, s);<br>
diff --git a/audio/noaudio.c b/audio/noaudio.c<br>
index 09588b9..931aa03 100644<br>
--- a/audio/noaudio.c<br>
+++ b/audio/noaudio.c<br>
@@ -49,7 +49,7 @@ static int no_run_out (HWVoiceOut *hw, int live)<br>
<br>
=C2=A0 =C2=A0 =C2=A0now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
=C2=A0 =C2=A0 =C2=A0ticks =3D now - no-&gt;old_ticks;<br>
-=C2=A0 =C2=A0 bytes =3D muldiv64 (ticks, hw-&gt;info.bytes_per_second, get=
_ticks_per_sec ());<br>
+=C2=A0 =C2=A0 bytes =3D muldiv64 (ticks, hw-&gt;info.bytes_per_second, NAN=
OSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0bytes =3D audio_MIN (bytes, INT_MAX);<br>
=C2=A0 =C2=A0 =C2=A0samples =3D bytes &gt;&gt; hw-&gt;info.shift;<br>
<br>
@@ -106,7 +106,7 @@ static int no_run_in (HWVoiceIn *hw)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t now =3D qemu_clock_get_ns(QEMU_CL=
OCK_VIRTUAL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t ticks =3D now - no-&gt;old_ticks;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t bytes =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64 (ticks, hw-&gt;info.byt=
es_per_second, get_ticks_per_sec ());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64 (ticks, hw-&gt;info.byt=
es_per_second, NANOSECONDS_PER_SECOND);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no-&gt;old_ticks =3D now;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes =3D audio_MIN (bytes, INT_MAX);<br>
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c<br>
index 297fd41..a098057 100644<br>
--- a/audio/spiceaudio.c<br>
+++ b/audio/spiceaudio.c<br>
@@ -104,7 +104,7 @@ static int rate_get_samples (struct audio_pcm_info *inf=
o, SpiceRateCtl *rate)<br>
<br>
=C2=A0 =C2=A0 =C2=A0now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
=C2=A0 =C2=A0 =C2=A0ticks =3D now - rate-&gt;start_ticks;<br>
-=C2=A0 =C2=A0 bytes =3D muldiv64 (ticks, info-&gt;bytes_per_second, get_ti=
cks_per_sec ());<br>
+=C2=A0 =C2=A0 bytes =3D muldiv64 (ticks, info-&gt;bytes_per_second, NANOSE=
CONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0samples =3D (bytes - rate-&gt;bytes_sent) &gt;&gt; info=
-&gt;shift;<br>
=C2=A0 =C2=A0 =C2=A0if (samples &lt; 0 || samples &gt; 65536) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Resetting rate control=
 (%&quot; PRId64 &quot; samples)&quot;, samples);<br>
diff --git a/audio/wavaudio.c b/audio/wavaudio.c<br>
index 343b1a1..1991487 100644<br>
--- a/audio/wavaudio.c<br>
+++ b/audio/wavaudio.c<br>
@@ -51,7 +51,7 @@ static int wav_run_out (HWVoiceOut *hw, int live)<br>
=C2=A0 =C2=A0 =C2=A0int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<=
br>
=C2=A0 =C2=A0 =C2=A0int64_t ticks =3D now - wav-&gt;old_ticks;<br>
=C2=A0 =C2=A0 =C2=A0int64_t bytes =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64 (ticks, hw-&gt;info.bytes_per_second,=
 get_ticks_per_sec ());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64 (ticks, hw-&gt;info.bytes_per_second,=
 NANOSECONDS_PER_SECOND);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (bytes &gt; INT_MAX) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0samples =3D INT_MAX &gt;&gt; hw-&gt;info.=
shift;<br>
diff --git a/backends/baum.c b/backends/baum.c<br>
index c11320e..20b49f2 100644<br>
--- a/backends/baum.c<br>
+++ b/backends/baum.c<br>
@@ -336,7 +336,7 @@ static int baum_eat_packet(BaumDriverState *baum, const=
 uint8_t *buf, int len)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Allow 100ms to complete the DisplayDat=
a packet */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(baum-&gt;cellCount_timer, qemu_=
clock_get_ns(QEMU_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0get_ticks_per_sec() / 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NANOSECONDS_PER_SECOND / 10);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; baum-&gt;x * baum-&g=
t;y ; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EAT(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cells[i] =3D c;<br>
diff --git a/block/qed.c b/block/qed.c<br>
index 404be1e..6fa7e1f 100644<br>
--- a/block/qed.c<br>
+++ b/block/qed.c<br>
@@ -345,7 +345,7 @@ static void qed_start_need_check_timer(BDRVQEDState *s)=
<br>
=C2=A0 =C2=A0 =C2=A0 * migration.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;need_check_timer, qemu_clock_get_ns(QEM=
U_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_t=
icks_per_sec() * QED_NEED_CHECK_TIMEOUT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOS=
ECONDS_PER_SECOND * QED_NEED_CHECK_TIMEOUT);<br>
=C2=A0}<br>
<br>
=C2=A0/* It&#39;s okay to call this multiple times or when no timer is star=
ted */<br>
diff --git a/cpus.c b/cpus.c<br>
index bc774e2..17be5de 100644<br>
--- a/cpus.c<br>
+++ b/cpus.c<br>
@@ -275,7 +275,7 @@ void cpu_disable_ticks(void)<br>
=C2=A0 =C2=A0 fairly approximate, so ignore small variation.<br>
=C2=A0 =C2=A0 When the guest is idle real and virtual time will be aligned =
in<br>
=C2=A0 =C2=A0 the IO wait loop.=C2=A0 */<br>
-#define ICOUNT_WOBBLE (get_ticks_per_sec() / 10)<br>
+#define ICOUNT_WOBBLE (NANOSECONDS_PER_SECOND / 10)<br>
<br>
=C2=A0static void icount_adjust(void)<br>
=C2=A0{<br>
@@ -326,7 +326,7 @@ static void icount_adjust_vm(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(icount_vm_timer,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_=
clock_get_ns(QEMU_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_t=
icks_per_sec() / 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOS=
ECONDS_PER_SECOND / 10);<br>
=C2=A0 =C2=A0 =C2=A0icount_adjust();<br>
=C2=A0}<br>
<br>
@@ -665,7 +665,7 @@ void configure_icount(QemuOpts *opts, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ic=
ount_adjust_vm, NULL);<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(icount_vm_timer,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_=
clock_get_ns(QEMU_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_t=
icks_per_sec() / 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOS=
ECONDS_PER_SECOND / 10);<br>
=C2=A0}<br>
<br>
=C2=A0/***********************************************************/<br>
diff --git a/hw/acpi/core.c b/hw/acpi/core.c<br>
index 3d9e5c4..5ea3b3b 100644<br>
--- a/hw/acpi/core.c<br>
+++ b/hw/acpi/core.c<br>
@@ -389,7 +389,7 @@ uint16_t acpi_pm1_evt_get_sts(ACPIREGS *ar)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_pm_tmr_update function uses ns for setting=
 the timer. */<br>
=C2=A0 =C2=A0 =C2=A0int64_t d =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br=
>
=C2=A0 =C2=A0 =C2=A0if (d &gt;=3D muldiv64(ar-&gt;tmr.overflow_time,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 get_ticks_per_sec(), PM_TIMER_FREQUENCY)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NANOSECONDS_PER_SECOND, PM_TIMER_FREQUENCY)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ar-&gt;pm1.evt.sts |=3D ACPI_BITMASK_TIME=
R_STATUS;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return ar-&gt;pm1.evt.sts;<br>
@@ -483,7 +483,7 @@ void acpi_pm_tmr_update(ACPIREGS *ar, bool enable)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* schedule a timer interruption if needed */<br>
=C2=A0 =C2=A0 =C2=A0if (enable) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 expire_time =3D muldiv64(ar-&gt;tmr.overflow_t=
ime, get_ticks_per_sec(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expire_time =3D muldiv64(ar-&gt;tmr.overflow_t=
ime, NANOSECONDS_PER_SECOND,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PM_TIMER_FREQUENCY);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(ar-&gt;tmr.timer, expire_time);=
<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c<br>
index 6f68130..8073950 100644<br>
--- a/hw/arm/omap1.c<br>
+++ b/hw/arm/omap1.c<br>
@@ -107,7 +107,7 @@ static inline uint32_t omap_timer_read(struct omap_mpu_=
timer_s *timer)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (timer-&gt;st &amp;&amp; timer-&gt;enable &amp;&amp;=
 timer-&gt;rate)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return timer-&gt;val - muldiv64(distance =
&gt;&gt; (timer-&gt;ptv + 1),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer-&gt;rate, =
get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer-&gt;rate, =
NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return timer-&gt;val;<br>
=C2=A0}<br>
@@ -125,7 +125,7 @@ static inline void omap_timer_update(struct omap_mpu_ti=
mer_s *timer)<br>
=C2=A0 =C2=A0 =C2=A0if (timer-&gt;enable &amp;&amp; timer-&gt;st &amp;&amp;=
 timer-&gt;rate) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer-&gt;val =3D timer-&gt;reset_val; /*=
 Should skip this on clk enable */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expires =3D muldiv64((uint64_t) timer-&gt=
;val &lt;&lt; (timer-&gt;ptv + 1),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0get_ticks_per_sec(), timer-&gt;rate);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_PER_SECOND, timer-&gt;rate);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If timer expiry would be sooner than i=
n about 1 ms and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * auto-reload isn&#39;t set, then fire i=
mmediately.=C2=A0 This is a hack<br>
@@ -133,7 +133,7 @@ static inline void omap_timer_update(struct omap_mpu_ti=
mer_s *timer)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * sets the interval to a very low value =
and polls the status bit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * in a busy loop when it wants to sleep =
just a couple of CPU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ticks.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (expires &gt; (get_ticks_per_sec() &gt;&gt;=
 10) || timer-&gt;ar)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (expires &gt; (NANOSECONDS_PER_SECOND &gt;&=
gt; 10) || timer-&gt;ar)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(timer-&gt;timer, =
timer-&gt;time + expires);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_bh_schedule(timer-&gt;=
tick);<br>
@@ -613,14 +613,14 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr a=
ddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0now -=3D s-&g=
t;ulpd_gauge_start;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 32-kHz tic=
ks */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ticks =3D muldiv64=
(now, 32768, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ticks =3D muldiv64=
(now, 32768, NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;ulpd_pm=
_regs[0x00 &gt;&gt; 2] =3D (ticks &gt;&gt;=C2=A0 0) &amp; 0xffff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;ulpd_pm=
_regs[0x04 &gt;&gt; 2] =3D (ticks &gt;&gt; 16) &amp; 0xffff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ticks &gt=
;&gt; 32)=C2=A0 =C2=A0 =C2=A0 =C2=A0/* OVERFLOW_32K */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0s-&gt;ulpd_pm_regs[0x14 &gt;&gt; 2] |=3D 1 &lt;&lt; 2;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* High frequ=
ency ticks */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ticks =3D muldiv64=
(now, 12000000, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ticks =3D muldiv64=
(now, 12000000, NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;ulpd_pm=
_regs[0x08 &gt;&gt; 2] =3D (ticks &gt;&gt;=C2=A0 0) &amp; 0xffff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;ulpd_pm=
_regs[0x0c &gt;&gt; 2] =3D (ticks &gt;&gt; 16) &amp; 0xffff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ticks &gt=
;&gt; 32)=C2=A0 =C2=A0 =C2=A0 =C2=A0/* OVERFLOW_HI_FREQ */<br>
@@ -3026,7 +3026,7 @@ static void omap_mcbsp_source_tick(void *opaque)<br>
<br>
=C2=A0 =C2=A0 =C2=A0omap_mcbsp_rx_newdata(s);<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;source_timer, qemu_clock_get_ns(QEMU_CL=
OCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_t=
icks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOS=
ECONDS_PER_SECOND);<br>
=C2=A0}<br>
<br>
=C2=A0static void omap_mcbsp_rx_start(struct omap_mcbsp_s *s)<br>
@@ -3072,7 +3072,7 @@ static void omap_mcbsp_sink_tick(void *opaque)<br>
<br>
=C2=A0 =C2=A0 =C2=A0omap_mcbsp_tx_newdata(s);<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;sink_timer, qemu_clock_get_ns(QEMU_CLOC=
K_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_t=
icks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOS=
ECONDS_PER_SECOND);<br>
=C2=A0}<br>
<br>
=C2=A0static void omap_mcbsp_tx_start(struct omap_mcbsp_s *s)<br>
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c<br>
index 607cb58..d8ecb9c 100644<br>
--- a/hw/arm/spitz.c<br>
+++ b/hw/arm/spitz.c<br>
@@ -404,7 +404,7 @@ static void spitz_keyboard_tick(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;kbdtimer, qemu_clock_get_ns(QEMU_CLOCK_=
VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_t=
icks_per_sec() / 32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOS=
ECONDS_PER_SECOND / 32);<br>
=C2=A0}<br>
<br>
=C2=A0static void spitz_keyboard_pre_map(SpitzKeyboardState *s)<br>
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c<br>
index de8dbb2..a7ba43c 100644<br>
--- a/hw/arm/stellaris.c<br>
+++ b/hw/arm/stellaris.c<br>
@@ -100,7 +100,7 @@ static void gptm_reload(gptm_state *s, int n, int reset=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tick +=3D (int64_t)count * system_clock_s=
cale;<br>
=C2=A0 =C2=A0 =C2=A0} else if (s-&gt;config =3D=3D 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 32-bit RTC.=C2=A0 1Hz tick.=C2=A0 */<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tick +=3D get_ticks_per_sec();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tick +=3D NANOSECONDS_PER_SECOND;<br>
=C2=A0 =C2=A0 =C2=A0} else if (s-&gt;mode[n] =3D=3D 0xa) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* PWM mode.=C2=A0 Not implemented.=C2=A0=
 */<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c<br>
index 3b17a21..52a7481 100644<br>
--- a/hw/arm/strongarm.c<br>
+++ b/hw/arm/strongarm.c<br>
@@ -1024,7 +1024,7 @@ static void strongarm_uart_update_parameters(StrongAR=
MUARTState *s)<br>
=C2=A0 =C2=A0 =C2=A0ssp.parity =3D parity;<br>
=C2=A0 =C2=A0 =C2=A0ssp.data_bits =3D data_bits;<br>
=C2=A0 =C2=A0 =C2=A0ssp.stop_bits =3D stop_bits;<br>
-=C2=A0 =C2=A0 s-&gt;char_transmit_time =3D=C2=A0 (get_ticks_per_sec() / sp=
eed) * frame_size;<br>
+=C2=A0 =C2=A0 s-&gt;char_transmit_time =3D=C2=A0 (NANOSECONDS_PER_SECOND /=
 speed) * frame_size;<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;chr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_fe_ioctl(s-&gt;chr, CHR_IOCTL_SE=
RIAL_SET_PARAMS, &amp;ssp);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c<br>
index 1270b19..e4db92d 100644<br>
--- a/hw/audio/adlib.c<br>
+++ b/hw/audio/adlib.c<br>
@@ -169,7 +169,7 @@ static void timer_handler (int c, double interval_Sec)<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;ticking[n] =3D 1;<br>
=C2=A0#ifdef DEBUG<br>
-=C2=A0 =C2=A0 interval =3D get_ticks_per_sec () * interval_Sec;<br>
+=C2=A0 =C2=A0 interval =3D NANOSECONDS_PER_SECOND * interval_Sec;<br>
=C2=A0 =C2=A0 =C2=A0exp =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + interva=
l;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;exp[n] =3D exp;<br>
=C2=A0#endif<br>
diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c<br>
index 6f8816c..3286471 100644<br>
--- a/hw/audio/sb16.c<br>
+++ b/hw/audio/sb16.c<br>
@@ -762,8 +762,8 @@ static void complete (SB16State *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0freq =3D s-&g=
t;freq &gt; 0 ? s-&gt;freq : 11025;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0samples =3D d=
sp_get_lohi (s) + 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes =3D sam=
ples &lt;&lt; s-&gt;fmt_stereo &lt;&lt; (s-&gt;fmt_bits =3D=3D 16);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ticks =3D muldiv64=
 (bytes, get_ticks_per_sec (), freq);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ticks &lt; get=
_ticks_per_sec () / 1024) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ticks =3D muldiv64=
 (bytes, NANOSECONDS_PER_SECOND, freq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ticks &lt; NAN=
OSECONDS_PER_SECOND / 1024) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0qemu_irq_raise (s-&gt;pic);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
diff --git a/hw/block/fdc.c b/hw/block/fdc.c<br>
index 9838d21..1624260 100644<br>
--- a/hw/block/fdc.c<br>
+++ b/hw/block/fdc.c<br>
@@ -1939,7 +1939,7 @@ static void fdctrl_handle_readid(FDCtrl *fdctrl, int =
direction)<br>
<br>
=C2=A0 =C2=A0 =C2=A0cur_drv-&gt;head =3D (fdctrl-&gt;fifo[1] &gt;&gt; 2) &a=
mp; 1;<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(fdctrl-&gt;result_timer,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_=
clock_get_ns(QEMU_CLOCK_VIRTUAL) + (get_ticks_per_sec() / 50));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_=
clock_get_ns(QEMU_CLOCK_VIRTUAL) + (NANOSECONDS_PER_SECOND / 50));<br>
=C2=A0}<br>
<br>
=C2=A0static void fdctrl_handle_format_track(FDCtrl *fdctrl, int direction)=
<br>
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c<br>
index aaa697a..39d887c 100644<br>
--- a/hw/block/pflash_cfi02.c<br>
+++ b/hw/block/pflash_cfi02.c<br>
@@ -432,7 +432,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pfl-&gt;status =3D 0x00;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Let&#39;s wait 5 seconds=
 before chip erase is done */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(pfl-&gt;timer,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (get_ticks_=
per_sec() * 5));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (NANOSECOND=
S_PER_SECOND * 5));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x30:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Sector erase */<br>
@@ -447,7 +447,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pfl-&gt;status =3D 0x00;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Let&#39;s wait 1/2 secon=
d before sector erase is done */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(pfl-&gt;timer,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (get_ticks_=
per_sec() / 2));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (NANOSECOND=
S_PER_SECOND / 2));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;%s: invalid c=
ommand %02x (wc 5)\n&quot;, __func__, cmd);<br>
diff --git a/hw/bt/hci-csr.c b/hw/bt/hci-csr.c<br>
index 0189b0a..2e970b6 100644<br>
--- a/hw/bt/hci-csr.c<br>
+++ b/hw/bt/hci-csr.c<br>
@@ -363,7 +363,7 @@ static int csrhci_ioctl(struct CharDriverState *chr, in=
t cmd, void *arg)<br>
=C2=A0 =C2=A0 =C2=A0switch (cmd) {<br>
=C2=A0 =C2=A0 =C2=A0case CHR_IOCTL_SERIAL_SET_PARAMS:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssp =3D (QEMUSerialSetParams *) arg;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;baud_delay =3D get_ticks_per_sec() / ssp=
-&gt;speed;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;baud_delay =3D NANOSECONDS_PER_SECOND / =
ssp-&gt;speed;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Moments later... (but shorter than 100=
ms) */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state |=3D CHR_TIOCM_CTS;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -389,7 +389,7 @@ static void csrhci_reset(struct csrhci_s *s)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;out_len =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;out_size =3D FIFO_LEN;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;in_len =3D 0;<br>
-=C2=A0 =C2=A0 s-&gt;baud_delay =3D get_ticks_per_sec();<br>
+=C2=A0 =C2=A0 s-&gt;baud_delay =3D NANOSECONDS_PER_SECOND;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;enable =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;in_hdr =3D INT_MAX;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;in_data =3D INT_MAX;<br>
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c<br>
index b590d99..486591b 100644<br>
--- a/hw/char/cadence_uart.c<br>
+++ b/hw/char/cadence_uart.c<br>
@@ -205,7 +205,7 @@ static void uart_parameters_setup(CadenceUARTState *s)<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0packet_size +=3D ssp.data_bits + ssp.stop_bits;<br>
-=C2=A0 =C2=A0 s-&gt;char_tx_time =3D (get_ticks_per_sec() / ssp.speed) * p=
acket_size;<br>
+=C2=A0 =C2=A0 s-&gt;char_tx_time =3D (NANOSECONDS_PER_SECOND / ssp.speed) =
* packet_size;<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;chr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_fe_ioctl(s-&gt;chr, CHR_IOCTL_SE=
RIAL_SET_PARAMS, &amp;ssp);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -479,7 +479,7 @@ static void cadence_uart_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_irq(sbd, &amp;s-&gt;irq);<br>
<br>
-=C2=A0 =C2=A0 s-&gt;char_tx_time =3D (get_ticks_per_sec() / 9600) * 10;<br=
>
+=C2=A0 =C2=A0 s-&gt;char_tx_time =3D (NANOSECONDS_PER_SECOND / 9600) * 10;=
<br>
=C2=A0}<br>
<br>
=C2=A0static int cadence_uart_post_load(void *opaque, int version_id)<br>
diff --git a/hw/char/serial.c b/hw/char/serial.c<br>
index 39e07db..efc93dd 100644<br>
--- a/hw/char/serial.c<br>
+++ b/hw/char/serial.c<br>
@@ -178,7 +178,7 @@ static void serial_update_parameters(SerialState *s)<br=
>
=C2=A0 =C2=A0 =C2=A0ssp.parity =3D parity;<br>
=C2=A0 =C2=A0 =C2=A0ssp.data_bits =3D data_bits;<br>
=C2=A0 =C2=A0 =C2=A0ssp.stop_bits =3D stop_bits;<br>
-=C2=A0 =C2=A0 s-&gt;char_transmit_time =3D=C2=A0 (get_ticks_per_sec() / sp=
eed) * frame_size;<br>
+=C2=A0 =C2=A0 s-&gt;char_transmit_time =3D=C2=A0 (NANOSECONDS_PER_SECOND /=
 speed) * frame_size;<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_fe_ioctl(s-&gt;chr, CHR_IOCTL_SERIAL_SET_PARAM=
S, &amp;ssp);<br>
<br>
=C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;speed=3D%d parity=3D%c data=3D%d stop=3D%=
d\n&quot;,<br>
@@ -217,7 +217,7 @@ static void serial_update_msl(SerialState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 We&#39;ll be lazy and poll only every 10ms, and=
 only poll it at all if MSI interrupts are turned on */<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;poll_msl)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(s-&gt;modem_status_poll, qemu_clock_=
get_ns(QEMU_CLOCK_VIRTUAL) + get_ticks_per_sec() / 100);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(s-&gt;modem_status_poll, qemu_clock_=
get_ns(QEMU_CLOCK_VIRTUAL) + NANOSECONDS_PER_SECOND / 100);<br>
=C2=A0}<br>
<br>
=C2=A0static gboolean serial_xmit(GIOChannel *chan, GIOCondition cond, void=
 *opaque)<br>
@@ -823,7 +823,7 @@ static void serial_reset(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;mcr =3D UART_MCR_OUT2;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;scr =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;tsr_retry =3D 0;<br>
-=C2=A0 =C2=A0 s-&gt;char_transmit_time =3D (get_ticks_per_sec() / 9600) * =
10;<br>
+=C2=A0 =C2=A0 s-&gt;char_transmit_time =3D (NANOSECONDS_PER_SECOND / 9600)=
 * 10;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;poll_msl =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;timeout_ipending =3D 0;<br>
diff --git a/hw/display/vga.c b/hw/display/vga.c<br>
index 555cac6..026b7d1 100644<br>
--- a/hw/display/vga.c<br>
+++ b/hw/display/vga.c<br>
@@ -235,9 +235,9 @@ static void vga_precise_update_retrace_info(VGACommonSt=
ate *s)<br>
<br>
=C2=A0 =C2=A0 =C2=A0r-&gt;total_chars =3D vtotal_lines * htotal_chars;<br>
=C2=A0 =C2=A0 =C2=A0if (r-&gt;freq) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;ticks_per_char =3D get_ticks_per_sec() /=
 (r-&gt;total_chars * r-&gt;freq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;ticks_per_char =3D NANOSECONDS_PER_SECON=
D / (r-&gt;total_chars * r-&gt;freq);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;ticks_per_char =3D get_ticks_per_sec() /=
 chars_per_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;ticks_per_char =3D NANOSECONDS_PER_SECON=
D / chars_per_sec;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0r-&gt;vstart =3D vretr_start_line;<br>
@@ -265,7 +265,7 @@ static void vga_precise_update_retrace_info(VGACommonSt=
ate *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;dots =3D %d\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ticks/char =3D %&quot; PRId64 &quot=
;\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (double) get_ticks_per_sec() / (r-&gt;ticks_pe=
r_char * r-&gt;total_chars),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (double) NANOSECONDS_PER_SECOND / (r-&gt;ticks=
_per_char * r-&gt;total_chars),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0htotal_chars,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hretr_start_char,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hretr_skew_chars,<br>
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c<br>
index 1c4f8df..a06c235 100644<br>
--- a/hw/dma/rc4030.c<br>
+++ b/hw/dma/rc4030.c<br>
@@ -112,7 +112,7 @@ static void set_next_tick(rc4030State *s)<br>
=C2=A0 =C2=A0 =C2=A0tm_hz =3D 1000 / (s-&gt;itr + 1);<br>
<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;periodic_timer, qemu_clock_get_ns(QEMU_=
CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_t=
icks_per_sec() / tm_hz);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOS=
ECONDS_PER_SECOND / tm_hz);<br>
=C2=A0}<br>
<br>
=C2=A0/* called for accesses to rc4030 */<br>
diff --git a/hw/ide/core.c b/hw/ide/core.c<br>
index 241e840..ea614de 100644<br>
--- a/hw/ide/core.c<br>
+++ b/hw/ide/core.c<br>
@@ -976,7 +976,7 @@ static void ide_sector_write_cb(void *opaque, int ret)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 option _only_ to install Windows =
2000. You must disable it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for normal use. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;sector_write_timer,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (get_ticks_per_sec() / 10=
00));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (NANOSECONDS_PER_SECOND /=
 1000));<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_set_irq(s-&gt;bus);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/input/hid.c b/hw/input/hid.c<br>
index 41a9387..874a5f5 100644<br>
--- a/hw/input/hid.c<br>
+++ b/hw/input/hid.c<br>
@@ -96,7 +96,7 @@ void hid_set_next_idle(HIDState *hs)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (hs-&gt;idle) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t expire_time =3D qemu_clock_get_n=
s(QEMU_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_ticks_per_sec() * hs-&gt;idle * 4=
 / 1000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_PER_SECOND * hs-&gt;idle =
* 4 / 1000;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!hs-&gt;idle_timer) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hs-&gt;idle_timer =3D timer=
_new_ns(QEMU_CLOCK_VIRTUAL, hid_idle_timer, hs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c<br>
index 8da4887..3baa94f 100644<br>
--- a/hw/input/tsc2005.c<br>
+++ b/hw/input/tsc2005.c<br>
@@ -291,7 +291,7 @@ static void tsc2005_pin_update(TSC2005State *s)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;precision =3D s-&gt;nextprecision;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;function =3D s-&gt;nextfunction;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;pdst =3D !s-&gt;pnd0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/* Synchronised on internal clock */<br>
-=C2=A0 =C2=A0 expires =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (get_tic=
ks_per_sec() &gt;&gt; 7);<br>
+=C2=A0 =C2=A0 expires =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (NANOSEC=
ONDS_PER_SECOND &gt;&gt; 7);<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;timer, expires);<br>
=C2=A0}<br>
<br>
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c<br>
index d11ef04..437db26 100644<br>
--- a/hw/input/tsc210x.c<br>
+++ b/hw/input/tsc210x.c<br>
@@ -835,7 +835,7 @@ static void tsc210x_pin_update(TSC210xState *s)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;busy =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;precision =3D s-&gt;nextprecision;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;function =3D s-&gt;nextfunction;<br>
-=C2=A0 =C2=A0 expires =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (get_tic=
ks_per_sec() &gt;&gt; 10);<br>
+=C2=A0 =C2=A0 expires =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (NANOSEC=
ONDS_PER_SECOND &gt;&gt; 10);<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;timer, expires);<br>
=C2=A0}<br>
<br>
diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c<br>
index 6f3a863..bb43669 100644<br>
--- a/hw/intc/i8259.c<br>
+++ b/hw/intc/i8259.c<br>
@@ -230,7 +230,7 @@ int pic_read_irq(DeviceState *d)<br>
=C2=A0 =C2=A0 =C2=A0printf(&quot;IRQ%d latency=3D%0.3fus\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (double)(qemu_clock_get_ns(QEMU_C=
LOCK_VIRTUAL) -<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq_=
time[irq]) * 1000000.0 / get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq_=
time[irq]) * 1000000.0 / NANOSECONDS_PER_SECOND);<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;pic_interrupt: irq=3D%d\n&quot;, irq);<br=
>
=C2=A0 =C2=A0 =C2=A0return intno;<br>
diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c<br>
index 339205b..9949209 100644<br>
--- a/hw/misc/arm_sysctl.c<br>
+++ b/hw/misc/arm_sysctl.c<br>
@@ -171,7 +171,7 @@ static uint64_t arm_sysctl_read(void *opaque, hwaddr of=
fset,<br>
=C2=A0 =C2=A0 =C2=A0case 0x58: /* BOOTCS */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0case 0x5c: /* 24MHz */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_V=
IRTUAL), 24000000, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_V=
IRTUAL), 24000000, NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0case 0x60: /* MISC */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0case 0x84: /* PROCID0 */<br>
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c<br>
index 481abdb..83995cc 100644<br>
--- a/hw/misc/macio/cuda.c<br>
+++ b/hw/misc/macio/cuda.c<br>
@@ -145,7 +145,7 @@ static void cuda_update_irq(CUDAState *s)<br>
<br>
=C2=A0static uint64_t get_tb(uint64_t time, uint64_t freq)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return muldiv64(time, freq, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 return muldiv64(time, freq, NANOSECONDS_PER_SECOND);<br>
=C2=A0}<br>
<br>
=C2=A0static unsigned int get_counter(CUDATimer *ti)<br>
@@ -189,7 +189,7 @@ static int64_t get_next_irq_time(CUDATimer *s, int64_t =
current_time)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* current counter value */<br>
=C2=A0 =C2=A0 =C2=A0d =3D muldiv64(current_time - s-&gt;load_time,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CUDA_TIMER_F=
REQ, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CUDA_TIMER_F=
REQ, NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0/* the timer goes down from latch to -1 (period of latc=
h + 2) */<br>
=C2=A0 =C2=A0 =C2=A0if (d &lt;=3D (s-&gt;counter_value + 1)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter =3D (s-&gt;counter_value - d) &am=
p; 0xffff;<br>
@@ -208,7 +208,7 @@ static int64_t get_next_irq_time(CUDATimer *s, int64_t =
current_time)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0CUDA_DPRINTF(&quot;latch=3D%d counter=3D%&quot; PRId64 =
&quot; delta_next=3D%&quot; PRId64 &quot;\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;latch,=
 d, next_time - d);<br>
-=C2=A0 =C2=A0 next_time =3D muldiv64(next_time, get_ticks_per_sec(), CUDA_=
TIMER_FREQ) +<br>
+=C2=A0 =C2=A0 next_time =3D muldiv64(next_time, NANOSECONDS_PER_SECOND, CU=
DA_TIMER_FREQ) +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;load_time;<br>
=C2=A0 =C2=A0 =C2=A0if (next_time &lt;=3D current_time)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next_time =3D current_time + 1;<br>
@@ -531,7 +531,7 @@ static void cuda_adb_poll(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;adb_poll_timer,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_=
clock_get_ns(QEMU_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(get_=
ticks_per_sec() / (1000 / s-&gt;autopoll_rate_ms)));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(NANO=
SECONDS_PER_SECOND / (1000 / s-&gt;autopoll_rate_ms)));<br>
=C2=A0}<br>
<br>
=C2=A0/* description of commands */<br>
@@ -559,7 +559,7 @@ static bool cuda_cmd_autopoll(CUDAState *s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (autopoll) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;adb_poll_ti=
mer,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (get_ticks_per_sec() / (1000 / s-&gt;autopoll_rate_ms)));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (NANOSECONDS_PER_SECOND / (1000 / s-&gt;autopoll_rate_ms)));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_del(s-&gt;adb_poll_ti=
mer);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -585,7 +585,7 @@ static bool cuda_cmd_set_autorate(CUDAState *s,<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;autopoll) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;adb_poll_timer,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_c=
lock_get_ns(QEMU_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (get_ticks_=
per_sec() / (1000 / s-&gt;autopoll_rate_ms)));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (NANOSECOND=
S_PER_SECOND / (1000 / s-&gt;autopoll_rate_ms)));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
@@ -665,7 +665,7 @@ static bool cuda_cmd_get_time(CUDAState *s,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ti =3D s-&gt;tick_offset + (qemu_clock_get_ns(QEMU_CLOC=
K_VIRTUAL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/ get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/ NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0out_data[0] =3D ti &gt;&gt; 24;<br>
=C2=A0 =C2=A0 =C2=A0out_data[1] =3D ti &gt;&gt; 16;<br>
=C2=A0 =C2=A0 =C2=A0out_data[2] =3D ti &gt;&gt; 8;<br>
@@ -687,7 +687,7 @@ static bool cuda_cmd_set_time(CUDAState *s,<br>
=C2=A0 =C2=A0 =C2=A0ti =3D (((uint32_t)in_data[1]) &lt;&lt; 24) + (((uint32=
_t)in_data[2]) &lt;&lt; 16)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + (((uint32_t)in_data[3]) &lt;&lt; 8) + =
in_data[4];<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;tick_offset =3D ti - (qemu_clock_get_ns(QEMU_CLOC=
K_VIRTUAL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/ get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/ NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c<br>
index 42325bf..5071f95 100644<br>
--- a/hw/misc/macio/macio.c<br>
+++ b/hw/misc/macio/macio.c<br>
@@ -253,7 +253,7 @@ static uint64_t timer_read(void *opaque, hwaddr addr, u=
nsigned size)<br>
=C2=A0 =C2=A0 =C2=A0uint64_t systime =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTU=
AL);<br>
=C2=A0 =C2=A0 =C2=A0uint64_t kltime;<br>
<br>
-=C2=A0 =C2=A0 kltime =3D muldiv64(systime, 4194300, get_ticks_per_sec() * =
4);<br>
+=C2=A0 =C2=A0 kltime =3D muldiv64(systime, 4194300, NANOSECONDS_PER_SECOND=
 * 4);<br>
=C2=A0 =C2=A0 =C2=A0kltime =3D muldiv64(kltime, 18432000, 1048575);<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (addr) {<br>
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c<br>
index e847b77..e6c9f98 100644<br>
--- a/hw/net/dp8393x.c<br>
+++ b/hw/net/dp8393x.c<br>
@@ -293,7 +293,7 @@ static void dp8393x_set_next_tick(dp8393xState *s)<br>
<br>
=C2=A0 =C2=A0 =C2=A0ticks =3D s-&gt;regs[SONIC_WT1] &lt;&lt; 16 | s-&gt;reg=
s[SONIC_WT0];<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;wt_last_update =3D qemu_clock_get_ns(QEMU_CLOCK_V=
IRTUAL);<br>
-=C2=A0 =C2=A0 delay =3D get_ticks_per_sec() * ticks / 5000000;<br>
+=C2=A0 =C2=A0 delay =3D NANOSECONDS_PER_SECOND * ticks / 5000000;<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;watchdog, s-&gt;wt_last_update + delay)=
;<br>
=C2=A0}<br>
<br>
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c<br>
index ce90b09..ce2cb89 100644<br>
--- a/hw/ppc/ppc.c<br>
+++ b/hw/ppc/ppc.c<br>
@@ -463,7 +463,7 @@ void ppce500_set_mpic_proxy(bool enabled)<br>
=C2=A0uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_=
offset)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* TB time in tb periods */<br>
-=C2=A0 =C2=A0 return muldiv64(vmclk, tb_env-&gt;tb_freq, get_ticks_per_sec=
()) + tb_offset;<br>
+=C2=A0 =C2=A0 return muldiv64(vmclk, tb_env-&gt;tb_freq, NANOSECONDS_PER_S=
ECOND) + tb_offset;<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t cpu_ppc_load_tbl (CPUPPCState *env)<br>
@@ -504,7 +504,7 @@ uint32_t cpu_ppc_load_tbu (CPUPPCState *env)<br>
=C2=A0static inline void cpu_ppc_store_tb(ppc_tb_t *tb_env, uint64_t vmclk,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t *tb_offs=
etp, uint64_t value)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 *tb_offsetp =3D value - muldiv64(vmclk, tb_env-&gt;tb_freq, =
get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 *tb_offsetp =3D value - muldiv64(vmclk, tb_env-&gt;tb_freq, =
NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0LOG_TB(&quot;%s: tb %016&quot; PRIx64 &quot; offset %08=
&quot; PRIx64 &quot;\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, val=
ue, *tb_offsetp);<br>
=C2=A0}<br>
@@ -638,11 +638,11 @@ static inline uint32_t _cpu_ppc_load_decr(CPUPPCState=
 *env, uint64_t next)<br>
<br>
=C2=A0 =C2=A0 =C2=A0diff =3D next - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<=
br>
=C2=A0 =C2=A0 =C2=A0if (diff &gt;=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 decr =3D muldiv64(diff, tb_env-&gt;decr_freq, =
get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 decr =3D muldiv64(diff, tb_env-&gt;decr_freq, =
NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0} else if (tb_env-&gt;flags &amp; PPC_TIMER_BOOKE) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0decr =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0}=C2=A0 else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 decr =3D -muldiv64(-diff, tb_env-&gt;decr_freq=
, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 decr =3D -muldiv64(-diff, tb_env-&gt;decr_freq=
, NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0LOG_TB(&quot;%s: %08&quot; PRIx32 &quot;\n&quot;, __fun=
c__, decr);<br>
<br>
@@ -674,7 +674,7 @@ uint64_t cpu_ppc_load_purr (CPUPPCState *env)<br>
<br>
=C2=A0 =C2=A0 =C2=A0diff =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - tb_env=
-&gt;purr_start;<br>
<br>
-=C2=A0 =C2=A0 return tb_env-&gt;purr_load + muldiv64(diff, tb_env-&gt;tb_f=
req, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 return tb_env-&gt;purr_load + muldiv64(diff, tb_env-&gt;tb_f=
req, NANOSECONDS_PER_SECOND);<br>
=C2=A0}<br>
<br>
=C2=A0/* When decrementer expires,<br>
@@ -750,7 +750,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint6=
4_t *nextp,<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Calculate the next timer event */<br>
=C2=A0 =C2=A0 =C2=A0now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
-=C2=A0 =C2=A0 next =3D now + muldiv64(value, get_ticks_per_sec(), tb_env-&=
gt;decr_freq);<br>
+=C2=A0 =C2=A0 next =3D now + muldiv64(value, NANOSECONDS_PER_SECOND, tb_en=
v-&gt;decr_freq);<br>
=C2=A0 =C2=A0 =C2=A0*nextp =3D next;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Adjust timer */<br>
@@ -1011,7 +1011,7 @@ static void cpu_4xx_fit_cb (void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Cannot occur, but makes gcc happy */<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 next =3D now + muldiv64(next, get_ticks_per_sec(), tb_env-&g=
t;tb_freq);<br>
+=C2=A0 =C2=A0 next =3D now + muldiv64(next, NANOSECONDS_PER_SECOND, tb_env=
-&gt;tb_freq);<br>
=C2=A0 =C2=A0 =C2=A0if (next =3D=3D now)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next++;<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(ppc40x_timer-&gt;fit_timer, next);<br>
@@ -1042,7 +1042,7 @@ static void start_stop_pit (CPUPPCState *env, ppc_tb_=
t *tb_env, int is_excp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0__func__, ppc40x_timer-&gt;pit_reload);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRT=
UAL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next =3D now + muldiv64(ppc40x_timer-&gt;=
pit_reload,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_ticks_per_sec(), tb_env-&gt;decr_freq);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NANOSECONDS_PER_SECOND, tb_env-&gt;decr_fre=
q);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_excp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next +=3D tb_env-&gt;decr_n=
ext - now;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (next =3D=3D now)<br>
@@ -1107,7 +1107,7 @@ static void cpu_4xx_wdt_cb (void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Cannot occur, but makes gcc happy */<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 next =3D now + muldiv64(next, get_ticks_per_sec(), tb_env-&g=
t;decr_freq);<br>
+=C2=A0 =C2=A0 next =3D now + muldiv64(next, NANOSECONDS_PER_SECOND, tb_env=
-&gt;decr_freq);<br>
=C2=A0 =C2=A0 =C2=A0if (next =3D=3D now)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next++;<br>
=C2=A0 =C2=A0 =C2=A0LOG_TB(&quot;%s: TCR &quot; TARGET_FMT_lx &quot; TSR &q=
uot; TARGET_FMT_lx &quot;\n&quot;, __func__,<br>
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c<br>
index ec81f65..3fcaf01 100644<br>
--- a/hw/ppc/ppc405_uc.c<br>
+++ b/hw/ppc/ppc405_uc.c<br>
@@ -1353,7 +1353,7 @@ static uint32_t ppc4xx_gpt_readl (void *opaque, hwadd=
r addr)<br>
=C2=A0 =C2=A0 =C2=A0case 0x00:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Time base counter */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D muldiv64(qemu_clock_get_ns(QEMU_C=
LOCK_VIRTUAL) + gpt-&gt;tb_offset,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpt-&gt;tb_freq, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpt-&gt;tb_freq, NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case 0x10:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Output enable */<br>
@@ -1408,7 +1408,7 @@ static void ppc4xx_gpt_writel (void *opaque,<br>
=C2=A0 =C2=A0 =C2=A0switch (addr) {<br>
=C2=A0 =C2=A0 =C2=A0case 0x00:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Time base counter */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpt-&gt;tb_offset =3D muldiv64(value, get_tick=
s_per_sec(), gpt-&gt;tb_freq)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpt-&gt;tb_offset =3D muldiv64(value, NANOSECO=
NDS_PER_SECOND, gpt-&gt;tb_freq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- qemu_clock_get_ns(QEMU_CL=
OCK_VIRTUAL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppc4xx_gpt_compute_timer(gpt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c<br>
index a8d4e76..86fafc9 100644<br>
--- a/hw/ppc/ppc_booke.c<br>
+++ b/hw/ppc/ppc_booke.c<br>
@@ -163,7 +163,7 @@ static void booke_update_fixed_timer(CPUPPCState=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0*env,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ticks +=3D delta_tick;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 *next =3D now + muldiv64(ticks, get_ticks_per_sec(), tb_env-=
&gt;tb_freq);<br>
+=C2=A0 =C2=A0 *next =3D now + muldiv64(ticks, NANOSECONDS_PER_SECOND, tb_e=
nv-&gt;tb_freq);<br>
=C2=A0 =C2=A0 =C2=A0if ((*next &lt; now) || (*next &gt; INT64_MAX)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Overflow, so assume the biggest number=
 the qemu timer supports. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*next =3D INT64_MAX;<br>
diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h<br>
index c712daf..161177c 100644<br>
--- a/hw/sd/sdhci-internal.h<br>
+++ b/hw/sd/sdhci-internal.h<br>
@@ -216,7 +216,7 @@<br>
=C2=A0#define SD_HOST_SPECv2_VERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x2401<br>
<br>
=C2=A0#define SDHC_REGISTERS_MAP_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x10=
0<br>
-#define SDHC_INSERTION_DELAY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (get=
_ticks_per_sec())<br>
+#define SDHC_INSERTION_DELAY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (NAN=
OSECONDS_PER_SECOND)<br>
=C2=A0#define SDHC_TRANSFER_DELAY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0100<br>
=C2=A0#define SDHC_ADMA_DESCS_PER_DELAY=C2=A0 =C2=A0 =C2=A0 =C2=A05<br>
=C2=A0#define SDHC_CMD_RESPONSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(3 &lt;&lt; 0)<br>
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c<br>
index 0a6f453..232bdc2 100644<br>
--- a/hw/sparc64/sun4u.c<br>
+++ b/hw/sparc64/sun4u.c<br>
@@ -445,12 +445,12 @@ static void hstick_irq(void *opaque)<br>
<br>
=C2=A0static int64_t cpu_to_timer_ticks(int64_t cpu_ticks, uint32_t frequen=
cy)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return muldiv64(cpu_ticks, get_ticks_per_sec(), frequency);<=
br>
+=C2=A0 =C2=A0 return muldiv64(cpu_ticks, NANOSECONDS_PER_SECOND, frequency=
);<br>
=C2=A0}<br>
<br>
=C2=A0static uint64_t timer_to_cpu_ticks(int64_t timer_ticks, uint32_t freq=
uency)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return muldiv64(timer_ticks, frequency, get_ticks_per_sec())=
;<br>
+=C2=A0 =C2=A0 return muldiv64(timer_ticks, frequency, NANOSECONDS_PER_SECO=
ND);<br>
=C2=A0}<br>
<br>
=C2=A0void cpu_tick_set_count(CPUTimer *timer, uint64_t count)<br>
diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c<br>
index b84a33f..5e61ad5 100644<br>
--- a/hw/timer/i8254.c<br>
+++ b/hw/timer/i8254.c<br>
@@ -53,7 +53,7 @@ static int pit_get_count(PITChannelState *s)<br>
=C2=A0 =C2=A0 =C2=A0int counter;<br>
<br>
=C2=A0 =C2=A0 =C2=A0d =3D muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - =
s-&gt;count_load_time, PIT_FREQ,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_ticks_pe=
r_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_=
PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0switch(s-&gt;mode) {<br>
=C2=A0 =C2=A0 =C2=A0case 0:<br>
=C2=A0 =C2=A0 =C2=A0case 1:<br>
@@ -263,7 +263,7 @@ static void pit_irq_timer_update(PITChannelState *s, in=
t64_t current_time)<br>
=C2=A0#ifdef DEBUG_PIT<br>
=C2=A0 =C2=A0 =C2=A0printf(&quot;irq_level=3D%d next_delay=3D%f\n&quot;,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq_level,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(double)(expire_time - current_ti=
me) / get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(double)(expire_time - current_ti=
me) / NANOSECONDS_PER_SECOND);<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;next_transition_time =3D expire_time;<br>
=C2=A0 =C2=A0 =C2=A0if (expire_time !=3D -1)<br>
diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c<br>
index ed511b8..e18299a 100644<br>
--- a/hw/timer/i8254_common.c<br>
+++ b/hw/timer/i8254_common.c<br>
@@ -47,7 +47,7 @@ int pit_get_out(PITChannelState *s, int64_t current_time)=
<br>
=C2=A0 =C2=A0 =C2=A0int out;<br>
<br>
=C2=A0 =C2=A0 =C2=A0d =3D muldiv64(current_time - s-&gt;count_load_time, PI=
T_FREQ,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_ticks_pe=
r_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_=
PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0switch (s-&gt;mode) {<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0case 0:<br>
@@ -81,7 +81,7 @@ int64_t pit_get_next_transition_time(PITChannelState *s, =
int64_t current_time)<br>
=C2=A0 =C2=A0 =C2=A0int period2;<br>
<br>
=C2=A0 =C2=A0 =C2=A0d =3D muldiv64(current_time - s-&gt;count_load_time, PI=
T_FREQ,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_ticks_pe=
r_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_=
PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0switch (s-&gt;mode) {<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0case 0:<br>
@@ -121,7 +121,7 @@ int64_t pit_get_next_transition_time(PITChannelState *s=
, int64_t current_time)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0/* convert to timer units */<br>
-=C2=A0 =C2=A0 next_time =3D s-&gt;count_load_time + muldiv64(next_time, ge=
t_ticks_per_sec(),<br>
+=C2=A0 =C2=A0 next_time =3D s-&gt;count_load_time + muldiv64(next_time, NA=
NOSECONDS_PER_SECOND,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0PIT_FREQ);<br>
=C2=A0 =C2=A0 =C2=A0/* fix potential rounding problems */<br>
=C2=A0 =C2=A0 =C2=A0/* XXX: better solution: use a clock at PIT_FREQ Hz */<=
br>
diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c<br>
index eb0100a..f9c23df 100644<br>
--- a/hw/timer/mc146818rtc.c<br>
+++ b/hw/timer/mc146818rtc.c<br>
@@ -120,7 +120,7 @@ static void rtc_coalesced_timer_update(RTCState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* divide each RTC interval to 2 - 8 smal=
ler intervals */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int c =3D MIN(s-&gt;irq_coalesced, 7) + 1=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t next_clock =3D qemu_clock_get_ns(=
rtc_clock) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64(s-&gt;period / c, get_t=
icks_per_sec(), RTC_CLOCK_RATE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64(s-&gt;period / c, NANOS=
ECONDS_PER_SECOND, RTC_CLOCK_RATE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;coalesced_timer, next_clo=
ck);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
@@ -166,10 +166,10 @@ static void periodic_timer_update(RTCState *s, int64_=
t current_time)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;period =3D period;<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* compute 32 khz clock */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_clock =3D muldiv64(current_time, RTC_CLOCK=
_RATE, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_clock =3D muldiv64(current_time, RTC_CLOCK=
_RATE, NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next_irq_clock =3D (cur_clock &amp; ~(per=
iod - 1)) + period;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;next_periodic_time =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64(next_irq_clock, get_tic=
ks_per_sec(), RTC_CLOCK_RATE) + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64(next_irq_clock, NANOSEC=
ONDS_PER_SECOND, RTC_CLOCK_RATE) + 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;periodic_timer, s-&gt;nex=
t_periodic_time);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0#ifdef TARGET_I386<br>
diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c<br>
index b303421..3a43863 100644<br>
--- a/hw/timer/omap_gptimer.c<br>
+++ b/hw/timer/omap_gptimer.c<br>
@@ -402,7 +402,7 @@ static void omap_gp_timer_write(void *opaque, hwaddr ad=
dr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;trigger =3D=3D gpt_trigger_none=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap_gp_timer_out(s, s-&gt;=
scpwm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO: make sure this doesn&#39;t overf=
low 32-bits */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;ticks_per_sec =3D get_ticks_per_sec() &l=
t;&lt; (s-&gt;pre ? s-&gt;ptv + 1 : 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;ticks_per_sec =3D NANOSECONDS_PER_SECOND=
 &lt;&lt; (s-&gt;pre ? s-&gt;ptv + 1 : 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap_gp_timer_update(s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
diff --git a/hw/timer/omap_synctimer.c b/hw/timer/omap_synctimer.c<br>
index edd8d98..e554c35 100644<br>
--- a/hw/timer/omap_synctimer.c<br>
+++ b/hw/timer/omap_synctimer.c<br>
@@ -29,7 +29,7 @@ struct omap_synctimer_s {<br>
<br>
=C2=A0/* 32-kHz Sync Timer of the OMAP2 */<br>
=C2=A0static uint32_t omap_synctimer_read(struct omap_synctimer_s *s) {<br>
-=C2=A0 =C2=A0 return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 0x800=
0, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 0x800=
0, NANOSECONDS_PER_SECOND);<br>
=C2=A0}<br>
<br>
=C2=A0void omap_synctimer_reset(struct omap_synctimer_s *s)<br>
diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c<br>
index 3ccb2cb..bdec478 100644<br>
--- a/hw/timer/pl031.c<br>
+++ b/hw/timer/pl031.c<br>
@@ -80,7 +80,7 @@ static void pl031_interrupt(void * opaque)<br>
=C2=A0static uint32_t pl031_get_count(PL031State *s)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int64_t now =3D qemu_clock_get_ns(rtc_clock);<br>
-=C2=A0 =C2=A0 return s-&gt;tick_offset + now / get_ticks_per_sec();<br>
+=C2=A0 =C2=A0 return s-&gt;tick_offset + now / NANOSECONDS_PER_SECOND;<br>
=C2=A0}<br>
<br>
=C2=A0static void pl031_set_alarm(PL031State *s)<br>
@@ -96,7 +96,7 @@ static void pl031_set_alarm(PL031State *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pl031_interrupt(s);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t now =3D qemu_clock_get_ns(rtc_clo=
ck);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(s-&gt;timer, now + (int64_t)ticks * =
get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(s-&gt;timer, now + (int64_t)ticks * =
NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
@@ -204,7 +204,7 @@ static void pl031_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_irq(dev, &amp;s-&gt;irq);<br>
=C2=A0 =C2=A0 =C2=A0qemu_get_timedate(&amp;tm, 0);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;tick_offset =3D mktimegm(&amp;tm) -<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clock_get_ns(rtc_clock) / get_ticks_per_s=
ec();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clock_get_ns(rtc_clock) / NANOSECONDS_PER=
_SECOND;<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;timer =3D timer_new_ns(rtc_clock, pl031_interrupt=
, s);<br>
=C2=A0}<br>
@@ -216,7 +216,7 @@ static void pl031_pre_save(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0/* tick_offset is base_time - rtc_clock base time.=C2=
=A0 Instead, we want to<br>
=C2=A0 =C2=A0 =C2=A0 * store the base time relative to the QEMU_CLOCK_VIRTU=
AL for backwards-compatibility.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0int64_t delta =3D qemu_clock_get_ns(rtc_clock) - qemu_c=
lock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
-=C2=A0 =C2=A0 s-&gt;tick_offset_vmstate =3D s-&gt;tick_offset + delta / ge=
t_ticks_per_sec();<br>
+=C2=A0 =C2=A0 s-&gt;tick_offset_vmstate =3D s-&gt;tick_offset + delta / NA=
NOSECONDS_PER_SECOND;<br>
=C2=A0}<br>
<br>
=C2=A0static int pl031_post_load(void *opaque, int version_id)<br>
@@ -224,7 +224,7 @@ static int pl031_post_load(void *opaque, int version_id=
)<br>
=C2=A0 =C2=A0 =C2=A0PL031State *s =3D opaque;<br>
<br>
=C2=A0 =C2=A0 =C2=A0int64_t delta =3D qemu_clock_get_ns(rtc_clock) - qemu_c=
lock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
-=C2=A0 =C2=A0 s-&gt;tick_offset =3D s-&gt;tick_offset_vmstate - delta / ge=
t_ticks_per_sec();<br>
+=C2=A0 =C2=A0 s-&gt;tick_offset =3D s-&gt;tick_offset_vmstate - delta / NA=
NOSECONDS_PER_SECOND;<br>
=C2=A0 =C2=A0 =C2=A0pl031_set_alarm(s);<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c<br>
index 33449e6..78d1477 100644<br>
--- a/hw/timer/pxa2xx_timer.c<br>
+++ b/hw/timer/pxa2xx_timer.c<br>
@@ -119,11 +119,11 @@ static void pxa2xx_timer_update(void *opaque, uint64_=
t now_qemu)<br>
=C2=A0 =C2=A0 =C2=A0uint64_t new_qemu;<br>
<br>
=C2=A0 =C2=A0 =C2=A0now_vm =3D s-&gt;clock +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64(now_qemu - s-&gt;lastlo=
ad, s-&gt;freq, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64(now_qemu - s-&gt;lastlo=
ad, s-&gt;freq, NANOSECONDS_PER_SECOND);<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 4; i ++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_qemu =3D now_qemu + muldiv64((uint32_=
t) (s-&gt;timer[i].value - now_vm),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 get_ticks_per_sec(), s-&gt;freq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NANOSECONDS_PER_SECOND, s-&gt;freq);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;timer[i].qtimer, new_qemu=
);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
@@ -148,10 +148,10 @@ static void pxa2xx_timer_update4(void *opaque, uint64=
_t now_qemu, int n)<br>
<br>
=C2=A0 =C2=A0 =C2=A0now_vm =3D s-&gt;tm4[counter].clock + muldiv64(now_qemu=
 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0s-&gt;tm4[counter].lastload,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&g=
t;tm4[counter].freq, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&g=
t;tm4[counter].freq, NANOSECONDS_PER_SECOND);<br>
<br>
=C2=A0 =C2=A0 =C2=A0new_qemu =3D now_qemu + muldiv64((uint32_t) (s-&gt;tm4[=
n].tm.value - now_vm),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_=
ticks_per_sec(), s-&gt;tm4[counter].freq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NANO=
SECONDS_PER_SECOND, s-&gt;tm4[counter].freq);<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;tm4[n].tm.qtimer, new_qemu);<br>
=C2=A0}<br>
<br>
@@ -190,7 +190,7 @@ static uint64_t pxa2xx_timer_read(void *opaque, hwaddr =
offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;tm4[tm].tm.value;<br>
=C2=A0 =C2=A0 =C2=A0case OSCR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;clock + muldiv64(qemu_clock_=
get_ns(QEMU_CLOCK_VIRTUAL) -<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 s-&gt;lastload, s-&gt;freq, get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 s-&gt;lastload, s-&gt;freq, NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0case OSCR11: tm ++;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fall through */<br>
=C2=A0 =C2=A0 =C2=A0case OSCR10: tm ++;<br>
@@ -214,7 +214,7 @@ static uint64_t pxa2xx_timer_read(void *opaque, hwaddr =
offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;snapsho=
t =3D s-&gt;tm4[tm - 1].clock + muldiv64(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_clock_get_ns(QEMU_CLOCK_V=
IRTUAL) -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tm4[tm - 1].lastload,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;tm4[tm - 1].freq, get_ticks_pe=
r_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;tm4[tm - 1].freq, NANOSECONDS_=
PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;snapsho=
t =3D s-&gt;tm4[tm - 1].clock;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -222,7 +222,7 @@ static uint64_t pxa2xx_timer_read(void *opaque, hwaddr =
offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;tm4[tm].freq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;tm4[tm].clock;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;tm4[tm].clock + muldiv64(qem=
u_clock_get_ns(QEMU_CLOCK_VIRTUAL) -<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 s-&gt;tm4[tm].lastload, s-&gt;tm4[tm].freq, get_ticks_per_sec())=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 s-&gt;tm4[tm].lastload, s-&gt;tm4[tm].freq, NANOSECONDS_PER_SECO=
ND);<br>
=C2=A0 =C2=A0 =C2=A0case OIER:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;irq_enabled;<br>
=C2=A0 =C2=A0 =C2=A0case OSSR: /* Status register */<br>
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c<br>
index 1b50601..f9a3dd0 100644<br>
--- a/hw/usb/hcd-ehci.c<br>
+++ b/hw/usb/hcd-ehci.c<br>
@@ -2303,10 +2303,10 @@ static void ehci_frame_timer(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we&#39;ve raised int, we speed up t=
he timer, so that we quickly<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * notice any new packets queued up in re=
sponse */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ehci-&gt;int_req_by_async &amp;&amp; =
(ehci-&gt;usbsts &amp; USBSTS_INT)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expire_time =3D t_now + get_tick=
s_per_sec() / (FRAME_TIMER_FREQ * 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expire_time =3D t_now + NANOSECO=
NDS_PER_SECOND / (FRAME_TIMER_FREQ * 4);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ehci-&gt;int_req_by_async =
=3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expire_time =3D t_now + (get_tic=
ks_per_sec()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expire_time =3D t_now + (NANOSEC=
ONDS_PER_SECOND<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (ehci-&gt;async_stepdown+1) / FRAM=
E_TIMER_FREQ);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(ehci-&gt;frame_timer, expire_ti=
me);<br>
diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c<br>
index cd23197..27d9d0b 100644<br>
--- a/hw/usb/hcd-musb.c<br>
+++ b/hw/usb/hcd-musb.c<br>
@@ -564,7 +564,7 @@ static void musb_schedule_cb(USBPort *port, USBPacket *=
packey)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ep-&gt;intv_timer[dir] =3D timer_new_ns(Q=
EMU_CLOCK_VIRTUAL, musb_cb_tick, ep);<br>
<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(ep-&gt;intv_timer[dir], qemu_clock_get_ns(QEM=
U_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0muldi=
v64(timeout, get_ticks_per_sec(), 8000));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0muldi=
v64(timeout, NANOSECONDS_PER_SECOND, 8000));<br>
=C2=A0}<br>
<br>
=C2=A0static int musb_timeout(int ttype, int speed, int val)<br>
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c<br>
index 17ed461..a9bf805 100644<br>
--- a/hw/usb/hcd-ohci.c<br>
+++ b/hw/usb/hcd-ohci.c<br>
@@ -1849,12 +1849,12 @@ static void usb_ohci_init(OHCIState *ohci, DeviceSt=
ate *dev,<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (usb_frame_time =3D=3D 0) {<br>
=C2=A0#ifdef OHCI_TIME_WARP<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_frame_time =3D get_ticks_per_sec();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_bit_time =3D muldiv64(1, get_ticks_per_sec=
(), USB_HZ/1000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_frame_time =3D NANOSECONDS_PER_SECOND;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_bit_time =3D muldiv64(1, NANOSECONDS_PER_S=
ECOND, USB_HZ/1000);<br>
=C2=A0#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_frame_time =3D muldiv64(1, get_ticks_per_s=
ec(), 1000);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_ticks_per_sec() &gt;=3D USB_HZ) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_bit_time =3D muldiv64(1, get=
_ticks_per_sec(), USB_HZ);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_frame_time =3D muldiv64(1, NANOSECONDS_PER=
_SECOND, 1000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (NANOSECONDS_PER_SECOND &gt;=3D USB_HZ) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_bit_time =3D muldiv64(1, NAN=
OSECONDS_PER_SECOND, USB_HZ);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb_bit_time =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c<br>
index c370240..2dbf22b 100644<br>
--- a/hw/usb/hcd-uhci.c<br>
+++ b/hw/usb/hcd-uhci.c<br>
@@ -402,7 +402,7 @@ static int uhci_post_load(void *opaque, int version_id)=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (version_id &lt; 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;expire_time =3D qemu_clock_get_ns(Q=
EMU_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (get_ticks_per_sec() / FRAME_TIM=
ER_FREQ);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (NANOSECONDS_PER_SECOND / FRAME_=
TIMER_FREQ);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
@@ -444,7 +444,7 @@ static void uhci_port_write(void *opaque, hwaddr addr,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* start frame processing *=
/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_usb_uhci_schedule_sta=
rt();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;expire_time =3D qemu_=
clock_get_ns(QEMU_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (get_ticks_per_sec=
() / FRAME_TIMER_FREQ);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (NANOSECONDS_PER_S=
ECOND / FRAME_TIMER_FREQ);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;frame_timer=
, s-&gt;expire_time);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;status &amp;=3D ~UHCI=
_STS_HCHALTED;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!(val &amp; UHCI_CMD_RS)) {<br=
>
@@ -1130,7 +1130,7 @@ static void uhci_frame_timer(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0UHCIState *s =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t t_now, t_last_run;<br>
=C2=A0 =C2=A0 =C2=A0int i, frames;<br>
-=C2=A0 =C2=A0 const uint64_t frame_t =3D get_ticks_per_sec() / FRAME_TIMER=
_FREQ;<br>
+=C2=A0 =C2=A0 const uint64_t frame_t =3D NANOSECONDS_PER_SECOND / FRAME_TI=
MER_FREQ;<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;completions_only =3D false;<br>
=C2=A0 =C2=A0 =C2=A0qemu_bh_cancel(s-&gt;bh);<br>
diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c<br>
index 9f6af90..31d3e5b 100644<br>
--- a/hw/usb/tusb6010.c<br>
+++ b/hw/usb/tusb6010.c<br>
@@ -516,7 +516,7 @@ static void tusb_async_writew(void *opaque, hwaddr addr=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value &amp; TUSB_DEV_OTG_TIMER_ENABLE=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;otg_timer, =
qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0muldiv64(TUSB_DEV_OTG_TIMER_VAL(value),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_ticks_per_se=
c(), TUSB_DEVCLOCK));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_PER_=
SECOND, TUSB_DEVCLOCK));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_del(s-&gt;otg_timer);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -727,7 +727,7 @@ static void tusb6010_power(TUSBState *s, int on)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;intr_ok =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tusb_intr_update(s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;pwr_timer,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + get_ticks_per_sec() / 2);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + NANOSECONDS_PER_SECOND / =
2);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c<br>
index 1c3658e..f54a35a 100644<br>
--- a/hw/watchdog/wdt_diag288.c<br>
+++ b/hw/watchdog/wdt_diag288.c<br>
@@ -79,7 +79,7 @@ static int wdt_diag288_handle_timer(DIAG288State *diag288=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(diag288-&gt;timer,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_c=
lock_get_ns(QEMU_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout * g=
et_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout * N=
ANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case WDT_DIAG288_CANCEL:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!diag288-&gt;enabled) {<br>
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c<br>
index 532530b..532afe8 100644<br>
--- a/hw/watchdog/wdt_ib700.c<br>
+++ b/hw/watchdog/wdt_ib700.c<br>
@@ -64,7 +64,7 @@ static void ib700_write_enable_reg(void *vp, uint32_t add=
r, uint32_t data)<br>
<br>
=C2=A0 =C2=A0 =C2=A0ib700_debug(&quot;addr =3D %x, data =3D %x\n&quot;, add=
r, data);<br>
<br>
-=C2=A0 =C2=A0 timeout =3D (int64_t) time_map[data &amp; 0xF] * get_ticks_p=
er_sec();<br>
+=C2=A0 =C2=A0 timeout =3D (int64_t) time_map[data &amp; 0xF] * NANOSECONDS=
_PER_SECOND;<br>
=C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;timer, qemu_clock_get_ns(QEMU_CLOCK_VIR=
TUAL) + timeout);<br>
=C2=A0}<br>
<br>
diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h<br>
index 7462e20..a2aa704 100644<br>
--- a/include/hw/acpi/acpi.h<br>
+++ b/include/hw/acpi/acpi.h<br>
@@ -155,7 +155,7 @@ void acpi_pm_tmr_reset(ACPIREGS *ar);<br>
=C2=A0static inline int64_t acpi_pm_tmr_get_clock(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), =
PM_TIMER_FREQUENCY,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_=
ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NANO=
SECONDS_PER_SECOND);<br>
=C2=A0}<br>
<br>
=C2=A0/* PM1a_EVT: piix and ich9 don&#39;t implement PM1b. */<br>
diff --git a/include/qemu/timer.h b/include/qemu/timer.h<br>
index d0946cb..384fc6b 100644<br>
--- a/include/qemu/timer.h<br>
+++ b/include/qemu/timer.h<br>
@@ -785,18 +785,13 @@ void cpu_enable_ticks(void);<br>
=C2=A0/* Caller must hold BQL */<br>
=C2=A0void cpu_disable_ticks(void);<br>
<br>
-static inline int64_t get_ticks_per_sec(void)<br>
-{<br>
-=C2=A0 =C2=A0 return 1000000000LL;<br>
-}<br>
-<br>
=C2=A0static inline int64_t get_max_clock_jump(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* This should be small enough to prevent excessive int=
errupts from being<br>
=C2=A0 =C2=A0 =C2=A0 * generated by the RTC on clock jumps, but large enoug=
h to avoid frequent<br>
=C2=A0 =C2=A0 =C2=A0 * unnecessary resets in idle VMs.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 return 60 * get_ticks_per_sec();<br>
+=C2=A0 =C2=A0 return 60 * NANOSECONDS_PER_SECOND;<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
@@ -822,7 +817,7 @@ static inline int64_t get_clock(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0LARGE_INTEGER ti;<br>
=C2=A0 =C2=A0 =C2=A0QueryPerformanceCounter(&amp;ti);<br>
-=C2=A0 =C2=A0 return muldiv64(ti.QuadPart, get_ticks_per_sec(), clock_freq=
);<br>
+=C2=A0 =C2=A0 return muldiv64(ti.QuadPart, NANOSECONDS_PER_SECOND, clock_f=
req);<br>
=C2=A0}<br>
<br>
=C2=A0#else<br>
diff --git a/monitor.c b/monitor.c<br>
index e99ca8c..6bdf174 100644<br>
--- a/monitor.c<br>
+++ b/monitor.c<br>
@@ -1506,9 +1506,9 @@ int64_t dev_time;<br>
=C2=A0static void hmp_info_profile(Monitor *mon, const QDict *qdict)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0monitor_printf(mon, &quot;async time=C2=A0 %&quot; PRId=
64 &quot; (%0.3f)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_t=
ime, dev_time / (double)get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_t=
ime, dev_time / (double)NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0monitor_printf(mon, &quot;qemu time=C2=A0 =C2=A0%&quot;=
 PRId64 &quot; (%0.3f)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_t=
ime, tcg_time / (double)get_ticks_per_sec());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_t=
ime, tcg_time / (double)NANOSECONDS_PER_SECOND);<br>
=C2=A0 =C2=A0 =C2=A0tcg_time =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0dev_time =3D 0;<br>
=C2=A0}<br>
diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c<br>
index d67c169..a095c91 100644<br>
--- a/target-ppc/kvm.c<br>
+++ b/target-ppc/kvm.c<br>
@@ -1336,7 +1336,7 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *r=
un)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Always wake up soon in case the interr=
upt was level based */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(idle_timer, qemu_clock_get_ns(Q=
EMU_CLOCK_VIRTUAL) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(get_ticks_per_sec() / 50));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(NANOSECONDS_PER_SECOND / 50));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* We don&#39;t know if there are more interrupts pendi=
ng after this. However,<br>
@@ -1796,7 +1796,7 @@ uint32_t kvmppc_get_tbfreq(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0char line[512];<br>
=C2=A0 =C2=A0 =C2=A0char *ns;<br>
-=C2=A0 =C2=A0 uint32_t retval =3D get_ticks_per_sec();<br>
+=C2=A0 =C2=A0 uint32_t retval =3D NANOSECONDS_PER_SECOND;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (read_cpuinfo(&quot;timebase&quot;, line, sizeof(lin=
e))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return retval;<br>
--<br>
1.9.1<br>
<br>
</blockquote></div>

--001a1149059865e1c8052ddc6bce--
