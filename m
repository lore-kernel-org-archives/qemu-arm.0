Received: by 10.25.208.211 with SMTP id h202csp558024lfg;
        Thu, 10 Mar 2016 09:22:21 -0800 (PST)
X-Received: by 10.98.42.150 with SMTP id q144mr6646601pfq.73.1457630541334;
        Thu, 10 Mar 2016 09:22:21 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id o65si7195969pfo.226.2016.03.10.09.22.20;
        Thu, 10 Mar 2016 09:22:21 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1754291AbcCJRWT (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Thu, 10 Mar 2016 12:22:19 -0500
Received: from mail-qg0-f67.google.com ([209.85.192.67]:33195 "EHLO
	mail-qg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753448AbcCJRWP (ORCPT <rfc822;kvm@vger.kernel.org>);
	Thu, 10 Mar 2016 12:22:15 -0500
Received: by mail-qg0-f67.google.com with SMTP id y89so5635397qge.0
        for <kvm@vger.kernel.org>; Thu, 10 Mar 2016 09:22:14 -0800 (PST)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc;
        bh=KjYL9XO3skWnv6hxd6fROATD3cYtLVFR+8VSvna+l00=;
        b=nWxa05AIEKksDbegk6EZUGYUMxRuiidbCpRpEJ8IKy0T19mwkygP2uri75OlLegDB3
         NULI2trOol+vQwcA9cC6mbbku6GoX3Ud8N+z8mGdp020kMRvDxpYAmdIbflCdsOWhIL6
         xBQW30pRrKT6WARu757oAIIDuM1yn3jllTQc+LH7pZQRt7pfF8Aeh5xg26cfnZlS7oLk
         ly2mtdPVTaKe9b8R5R5+JFhPpqHmbMTcgPPG/y8BYo6RSyIAKJ7+1Zxo1O+AMJviX3Od
         Tuf0bETuAzWcJ+zwCiUbkHfcr/qmDQ5h5hpl6e9WffGu5AeR9BhLXhi+NE0+RQXLNxGj
         q+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
        bh=KjYL9XO3skWnv6hxd6fROATD3cYtLVFR+8VSvna+l00=;
        b=Q0L86b7rlEUrYjllVYqPb7I9YRV/yJUVbWT7uczb3oqEYPpVhLCOiVKsAY+bBTbXzl
         38wTS+d30wLBaml9HqwuANXxIfqlPHipbz0Y/2Sl9iIVRUwLfILTVeDEFwj9lMVcmgs5
         susH3b3aJywboqMKn29y2Cwnh+aOo1GWsQ1ZuiESe0ysCseDYrSZWdIMrPNoUjg6iy6l
         5reBVs6ejJG2OddRtIHkFai5NkG5L9UVirKMsI/Wlb7EYKJ/eOry2ELKgxe3LlFG3D+Y
         FkMmGJwHysxgTh6cLH4tPJT4pZnPZid2eH4LRna0/ox4B4Bo0xwzHOJo0HjstGnMfhuh
         9wxQ==
X-Gm-Message-State: AD7BkJKsTzvUKEB3fxiKpt7D+9PpsYZ7ZX6nQB5dc0VnJi6WXYAFhsb6SswtJUeY6TWvaQ15K2n8LkparMKqKA==
MIME-Version: 1.0
X-Received: by 10.140.44.116 with SMTP id f107mr5755159qga.37.1457630534130;
 Thu, 10 Mar 2016 09:22:14 -0800 (PST)
Received: by 10.140.17.170 with HTTP; Thu, 10 Mar 2016 09:22:14 -0800 (PST)
Date:	Thu, 10 Mar 2016 22:52:14 +0530
Message-ID: <CAFE_T+SrAELFxgmuNPMt_FR9LwBNoNUwy-gVifuHNdrsWbhM-g@mail.gmail.com>
Subject: [PATCH] Replaced get_ticks_per_sec calls with NANOSECONDS_PER_SECOND
From:	rutuja shah <rutu.shah.26@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	samuel.thibault@ens-lyon.org,
	Stefan Hajnoczi <stefanha@redhat.com>, kwolf@redhat.com,
	pbonzini@redhat.com, crosthwaite.peter@gmail.com, rth@twiddle.net,
	mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
	balrogg@gmail.com, jsnow@redhat.com, alistair.francis@xilinx.com,
	agraf@suse.de, jasowang@redhat.com, blauwirbel@gmail.co,
	mark.cave-ayland@ilande.co.uk, kraxel@redhat.com,
	cornelia.huck@de.ibm.com, borntraeger@de.ibm.com,
	lcapitulino@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: Dn5bWirrJ6lB

Hi,
As there are no callers to get_ticks_per_sec() function, definition of
this function could be removed completely?
---
 backends/baum.c           |  2 +-
 block/qed.c               |  2 +-
 cpus.c                    |  6 +++---
 hw/acpi/core.c            |  4 ++--
 hw/arm/omap1.c            | 14 +++++++-------
 hw/arm/spitz.c            |  2 +-
 hw/arm/stellaris.c        |  2 +-
 hw/arm/strongarm.c        |  2 +-
 hw/block/fdc.c            |  2 +-
 hw/block/pflash_cfi02.c   |  4 ++--
 hw/bt/hci-csr.c           |  4 ++--
 hw/char/cadence_uart.c    |  4 ++--
 hw/char/serial.c          |  6 +++---
 hw/display/vga.c          |  6 +++---
 hw/dma/rc4030.c           |  2 +-
 hw/ide/core.c             |  2 +-
 hw/input/hid.c            |  2 +-
 hw/input/tsc2005.c        |  2 +-
 hw/input/tsc210x.c        |  2 +-
 hw/intc/i8259.c           |  2 +-
 hw/misc/arm_sysctl.c      |  2 +-
 hw/misc/macio/cuda.c      | 16 ++++++++--------
 hw/misc/macio/macio.c     |  2 +-
 hw/net/dp8393x.c          |  2 +-
 hw/ppc/ppc.c              | 18 +++++++++---------
 hw/ppc/ppc405_uc.c        |  4 ++--
 hw/ppc/ppc_booke.c        |  2 +-
 hw/sd/sdhci-internal.h    |  2 +-
 hw/sparc64/sun4u.c        |  4 ++--
 hw/timer/i8254.c          |  4 ++--
 hw/timer/i8254_common.c   |  6 +++---
 hw/timer/mc146818rtc.c    |  6 +++---
 hw/timer/omap_gptimer.c   |  2 +-
 hw/timer/omap_synctimer.c |  2 +-
 hw/timer/pl031.c          | 10 +++++-----
 hw/timer/pxa2xx_timer.c   | 14 +++++++-------
 hw/usb/hcd-ehci.c         |  4 ++--
 hw/usb/hcd-musb.c         |  2 +-
 hw/usb/hcd-ohci.c         | 10 +++++-----
 hw/usb/hcd-uhci.c         |  6 +++---
 hw/usb/tusb6010.c         |  4 ++--
 hw/watchdog/wdt_diag288.c |  2 +-
 hw/watchdog/wdt_ib700.c   |  2 +-
 include/hw/acpi/acpi.h    |  2 +-
 include/qemu/timer.h      |  4 ++--
 monitor.c                 |  4 ++--
 target-ppc/kvm.c          |  4 ++--
 47 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/backends/baum.c b/backends/baum.c
index c11320e..20b49f2 100644
--- a/backends/baum.c
+++ b/backends/baum.c
@@ -336,7 +336,7 @@ static int baum_eat_packet(BaumDriverState *baum,
const uint8_t *buf, int len)

         /* Allow 100ms to complete the DisplayData packet */
         timer_mod(baum->cellCount_timer,
qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                       get_ticks_per_sec() / 10);
+                       NANOSECONDS_PER_SECOND / 10);
         for (i = 0; i < baum->x * baum->y ; i++) {
             EAT(c);
             cells[i] = c;
diff --git a/block/qed.c b/block/qed.c
index 404be1e..6fa7e1f 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -345,7 +345,7 @@ static void qed_start_need_check_timer(BDRVQEDState *s)
      * migration.
      */
     timer_mod(s->need_check_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                   get_ticks_per_sec() * QED_NEED_CHECK_TIMEOUT);
+                   NANOSECONDS_PER_SECOND * QED_NEED_CHECK_TIMEOUT);
 }

 /* It's okay to call this multiple times or when no timer is started */
diff --git a/cpus.c b/cpus.c
index bc774e2..17be5de 100644
--- a/cpus.c
+++ b/cpus.c
@@ -275,7 +275,7 @@ void cpu_disable_ticks(void)
    fairly approximate, so ignore small variation.
    When the guest is idle real and virtual time will be aligned in
    the IO wait loop.  */
-#define ICOUNT_WOBBLE (get_ticks_per_sec() / 10)
+#define ICOUNT_WOBBLE (NANOSECONDS_PER_SECOND / 10)

 static void icount_adjust(void)
 {
@@ -326,7 +326,7 @@ static void icount_adjust_vm(void *opaque)
 {
     timer_mod(icount_vm_timer,
                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                   get_ticks_per_sec() / 10);
+                   NANOSECONDS_PER_SECOND / 10);
     icount_adjust();
 }

@@ -665,7 +665,7 @@ void configure_icount(QemuOpts *opts, Error **errp)
                                         icount_adjust_vm, NULL);
     timer_mod(icount_vm_timer,
                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                   get_ticks_per_sec() / 10);
+                   NANOSECONDS_PER_SECOND / 10);
 }

 /***********************************************************/
diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 3d9e5c4..5ea3b3b 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -389,7 +389,7 @@ uint16_t acpi_pm1_evt_get_sts(ACPIREGS *ar)
        acpi_pm_tmr_update function uses ns for setting the timer. */
     int64_t d = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     if (d >= muldiv64(ar->tmr.overflow_time,
-                      get_ticks_per_sec(), PM_TIMER_FREQUENCY)) {
+                      NANOSECONDS_PER_SECOND, PM_TIMER_FREQUENCY)) {
         ar->pm1.evt.sts |= ACPI_BITMASK_TIMER_STATUS;
     }
     return ar->pm1.evt.sts;
@@ -483,7 +483,7 @@ void acpi_pm_tmr_update(ACPIREGS *ar, bool enable)

     /* schedule a timer interruption if needed */
     if (enable) {
-        expire_time = muldiv64(ar->tmr.overflow_time, get_ticks_per_sec(),
+        expire_time = muldiv64(ar->tmr.overflow_time, NANOSECONDS_PER_SECOND,
                                PM_TIMER_FREQUENCY);
         timer_mod(ar->tmr.timer, expire_time);
     } else {
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 6f68130..8073950 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -107,7 +107,7 @@ static inline uint32_t omap_timer_read(struct
omap_mpu_timer_s *timer)

     if (timer->st && timer->enable && timer->rate)
         return timer->val - muldiv64(distance >> (timer->ptv + 1),
-                                     timer->rate, get_ticks_per_sec());
+                                     timer->rate, NANOSECONDS_PER_SECOND);
     else
         return timer->val;
 }
@@ -125,7 +125,7 @@ static inline void omap_timer_update(struct
omap_mpu_timer_s *timer)
     if (timer->enable && timer->st && timer->rate) {
         timer->val = timer->reset_val; /* Should skip this on clk enable */
         expires = muldiv64((uint64_t) timer->val << (timer->ptv + 1),
-                           get_ticks_per_sec(), timer->rate);
+                           NANOSECONDS_PER_SECOND, timer->rate);

         /* If timer expiry would be sooner than in about 1 ms and
          * auto-reload isn't set, then fire immediately.  This is a hack
@@ -133,7 +133,7 @@ static inline void omap_timer_update(struct
omap_mpu_timer_s *timer)
          * sets the interval to a very low value and polls the status bit
          * in a busy loop when it wants to sleep just a couple of CPU
          * ticks.  */
-        if (expires > (get_ticks_per_sec() >> 10) || timer->ar)
+        if (expires > (NANOSECONDS_PER_SECOND >> 10) || timer->ar)
             timer_mod(timer->timer, timer->time + expires);
         else
             qemu_bh_schedule(timer->tick);
@@ -613,14 +613,14 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr addr,
                 now -= s->ulpd_gauge_start;

                 /* 32-kHz ticks */
-                ticks = muldiv64(now, 32768, get_ticks_per_sec());
+                ticks = muldiv64(now, 32768, NANOSECONDS_PER_SECOND);
                 s->ulpd_pm_regs[0x00 >> 2] = (ticks >>  0) & 0xffff;
                 s->ulpd_pm_regs[0x04 >> 2] = (ticks >> 16) & 0xffff;
                 if (ticks >> 32) /* OVERFLOW_32K */
                     s->ulpd_pm_regs[0x14 >> 2] |= 1 << 2;

                 /* High frequency ticks */
-                ticks = muldiv64(now, 12000000, get_ticks_per_sec());
+                ticks = muldiv64(now, 12000000, NANOSECONDS_PER_SECOND);
                 s->ulpd_pm_regs[0x08 >> 2] = (ticks >>  0) & 0xffff;
                 s->ulpd_pm_regs[0x0c >> 2] = (ticks >> 16) & 0xffff;
                 if (ticks >> 32) /* OVERFLOW_HI_FREQ */
@@ -3026,7 +3026,7 @@ static void omap_mcbsp_source_tick(void *opaque)

     omap_mcbsp_rx_newdata(s);
     timer_mod(s->source_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                   get_ticks_per_sec());
+                   NANOSECONDS_PER_SECOND);
 }

 static void omap_mcbsp_rx_start(struct omap_mcbsp_s *s)
@@ -3072,7 +3072,7 @@ static void omap_mcbsp_sink_tick(void *opaque)

     omap_mcbsp_tx_newdata(s);
     timer_mod(s->sink_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                   get_ticks_per_sec());
+                   NANOSECONDS_PER_SECOND);
 }

 static void omap_mcbsp_tx_start(struct omap_mcbsp_s *s)
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 607cb58..d8ecb9c 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -404,7 +404,7 @@ static void spitz_keyboard_tick(void *opaque)
     }

     timer_mod(s->kbdtimer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                   get_ticks_per_sec() / 32);
+                   NANOSECONDS_PER_SECOND / 32);
 }

 static void spitz_keyboard_pre_map(SpitzKeyboardState *s)
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index de8dbb2..a7ba43c 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -100,7 +100,7 @@ static void gptm_reload(gptm_state *s, int n, int reset)
         tick += (int64_t)count * system_clock_scale;
     } else if (s->config == 1) {
         /* 32-bit RTC.  1Hz tick.  */
-        tick += get_ticks_per_sec();
+        tick += NANOSECONDS_PER_SECOND;
     } else if (s->mode[n] == 0xa) {
         /* PWM mode.  Not implemented.  */
     } else {
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 3b17a21..52a7481 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -1024,7 +1024,7 @@ static void
strongarm_uart_update_parameters(StrongARMUARTState *s)
     ssp.parity = parity;
     ssp.data_bits = data_bits;
     ssp.stop_bits = stop_bits;
-    s->char_transmit_time =  (get_ticks_per_sec() / speed) * frame_size;
+    s->char_transmit_time =  (NANOSECONDS_PER_SECOND / speed) * frame_size;
     if (s->chr) {
         qemu_chr_fe_ioctl(s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
     }
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 9838d21..1624260 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1939,7 +1939,7 @@ static void fdctrl_handle_readid(FDCtrl *fdctrl,
int direction)

     cur_drv->head = (fdctrl->fifo[1] >> 2) & 1;
     timer_mod(fdctrl->result_timer,
-                   qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(get_ticks_per_sec() / 50));
+                   qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(NANOSECONDS_PER_SECOND / 50));
 }

 static void fdctrl_handle_format_track(FDCtrl *fdctrl, int direction)
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index aaa697a..39d887c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -432,7 +432,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
             pfl->status = 0x00;
             /* Let's wait 5 seconds before chip erase is done */
             timer_mod(pfl->timer,
-                           qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(get_ticks_per_sec() * 5));
+                           qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(NANOSECONDS_PER_SECOND * 5));
             break;
         case 0x30:
             /* Sector erase */
@@ -447,7 +447,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
             pfl->status = 0x00;
             /* Let's wait 1/2 second before sector erase is done */
             timer_mod(pfl->timer,
-                           qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(get_ticks_per_sec() / 2));
+                           qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(NANOSECONDS_PER_SECOND / 2));
             break;
         default:
             DPRINTF("%s: invalid command %02x (wc 5)\n", __func__, cmd);
diff --git a/hw/bt/hci-csr.c b/hw/bt/hci-csr.c
index 0189b0a..2e970b6 100644
--- a/hw/bt/hci-csr.c
+++ b/hw/bt/hci-csr.c
@@ -363,7 +363,7 @@ static int csrhci_ioctl(struct CharDriverState
*chr, int cmd, void *arg)
     switch (cmd) {
     case CHR_IOCTL_SERIAL_SET_PARAMS:
         ssp = (QEMUSerialSetParams *) arg;
-        s->baud_delay = get_ticks_per_sec() / ssp->speed;
+        s->baud_delay = NANOSECONDS_PER_SECOND / ssp->speed;
         /* Moments later... (but shorter than 100ms) */
         s->modem_state |= CHR_TIOCM_CTS;
         break;
@@ -389,7 +389,7 @@ static void csrhci_reset(struct csrhci_s *s)
     s->out_len = 0;
     s->out_size = FIFO_LEN;
     s->in_len = 0;
-    s->baud_delay = get_ticks_per_sec();
+    s->baud_delay = NANOSECONDS_PER_SECOND;
     s->enable = 0;
     s->in_hdr = INT_MAX;
     s->in_data = INT_MAX;
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index b590d99..486591b 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -205,7 +205,7 @@ static void uart_parameters_setup(CadenceUARTState *s)
     }

     packet_size += ssp.data_bits + ssp.stop_bits;
-    s->char_tx_time = (get_ticks_per_sec() / ssp.speed) * packet_size;
+    s->char_tx_time = (NANOSECONDS_PER_SECOND / ssp.speed) * packet_size;
     if (s->chr) {
         qemu_chr_fe_ioctl(s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
     }
@@ -479,7 +479,7 @@ static void cadence_uart_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);

-    s->char_tx_time = (get_ticks_per_sec() / 9600) * 10;
+    s->char_tx_time = (NANOSECONDS_PER_SECOND / 9600) * 10;
 }

 static int cadence_uart_post_load(void *opaque, int version_id)
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 39e07db..efc93dd 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -178,7 +178,7 @@ static void serial_update_parameters(SerialState *s)
     ssp.parity = parity;
     ssp.data_bits = data_bits;
     ssp.stop_bits = stop_bits;
-    s->char_transmit_time =  (get_ticks_per_sec() / speed) * frame_size;
+    s->char_transmit_time =  (NANOSECONDS_PER_SECOND / speed) * frame_size;
     qemu_chr_fe_ioctl(s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);

     DPRINTF("speed=%d parity=%c data=%d stop=%d\n",
@@ -217,7 +217,7 @@ static void serial_update_msl(SerialState *s)
        We'll be lazy and poll only every 10ms, and only poll it at
all if MSI interrupts are turned on */

     if (s->poll_msl)
-        timer_mod(s->modem_status_poll,
qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + get_ticks_per_sec() / 100);
+        timer_mod(s->modem_status_poll,
qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + NANOSECONDS_PER_SECOND / 100);
 }

 static gboolean serial_xmit(GIOChannel *chan, GIOCondition cond, void *opaque)
@@ -823,7 +823,7 @@ static void serial_reset(void *opaque)
     s->mcr = UART_MCR_OUT2;
     s->scr = 0;
     s->tsr_retry = 0;
-    s->char_transmit_time = (get_ticks_per_sec() / 9600) * 10;
+    s->char_transmit_time = (NANOSECONDS_PER_SECOND / 9600) * 10;
     s->poll_msl = 0;

     s->timeout_ipending = 0;
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 555cac6..026b7d1 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -235,9 +235,9 @@ static void
vga_precise_update_retrace_info(VGACommonState *s)

     r->total_chars = vtotal_lines * htotal_chars;
     if (r->freq) {
-        r->ticks_per_char = get_ticks_per_sec() / (r->total_chars * r->freq);
+        r->ticks_per_char = NANOSECONDS_PER_SECOND / (r->total_chars
* r->freq);
     } else {
-        r->ticks_per_char = get_ticks_per_sec() / chars_per_sec;
+        r->ticks_per_char = NANOSECONDS_PER_SECOND / chars_per_sec;
     }

     r->vstart = vretr_start_line;
@@ -265,7 +265,7 @@ static void
vga_precise_update_retrace_info(VGACommonState *s)
         "dots = %d\n"
         "ticks/char = %" PRId64 "\n"
         "\n",
-        (double) get_ticks_per_sec() / (r->ticks_per_char * r->total_chars),
+        (double) NANOSECONDS_PER_SECOND / (r->ticks_per_char * r->total_chars),
         htotal_chars,
         hretr_start_char,
         hretr_skew_chars,
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index 1c4f8df..a06c235 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -112,7 +112,7 @@ static void set_next_tick(rc4030State *s)
     tm_hz = 1000 / (s->itr + 1);

     timer_mod(s->periodic_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                   get_ticks_per_sec() / tm_hz);
+                   NANOSECONDS_PER_SECOND / tm_hz);
 }

 /* called for accesses to rc4030 */
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 241e840..ea614de 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -976,7 +976,7 @@ static void ide_sector_write_cb(void *opaque, int ret)
            option _only_ to install Windows 2000. You must disable it
            for normal use. */
         timer_mod(s->sector_write_timer,
-                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(get_ticks_per_sec() / 1000));
+                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(NANOSECONDS_PER_SECOND / 1000));
     } else {
         ide_set_irq(s->bus);
     }
diff --git a/hw/input/hid.c b/hw/input/hid.c
index 41a9387..874a5f5 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -96,7 +96,7 @@ void hid_set_next_idle(HIDState *hs)
 {
     if (hs->idle) {
         uint64_t expire_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                               get_ticks_per_sec() * hs->idle * 4 / 1000;
+                               NANOSECONDS_PER_SECOND * hs->idle * 4 / 1000;
         if (!hs->idle_timer) {
             hs->idle_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
hid_idle_timer, hs);
         }
diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 8da4887..3baa94f 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -291,7 +291,7 @@ static void tsc2005_pin_update(TSC2005State *s)
     s->precision = s->nextprecision;
     s->function = s->nextfunction;
     s->pdst = !s->pnd0; /* Synchronised on internal clock */
-    expires = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(get_ticks_per_sec() >> 7);
+    expires = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(NANOSECONDS_PER_SECOND >> 7);
     timer_mod(s->timer, expires);
 }

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index d11ef04..437db26 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -835,7 +835,7 @@ static void tsc210x_pin_update(TSC210xState *s)
     s->busy = 1;
     s->precision = s->nextprecision;
     s->function = s->nextfunction;
-    expires = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(get_ticks_per_sec() >> 10);
+    expires = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
(NANOSECONDS_PER_SECOND >> 10);
     timer_mod(s->timer, expires);
 }

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 6f3a863..bb43669 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -230,7 +230,7 @@ int pic_read_irq(DeviceState *d)
     printf("IRQ%d latency=%0.3fus\n",
            irq,
            (double)(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) -
-                    irq_time[irq]) * 1000000.0 / get_ticks_per_sec());
+                    irq_time[irq]) * 1000000.0 / NANOSECONDS_PER_SECOND);
 #endif
     DPRINTF("pic_interrupt: irq=%d\n", irq);
     return intno;
diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index 339205b..9949209 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -171,7 +171,7 @@ static uint64_t arm_sysctl_read(void *opaque, hwaddr offset,
     case 0x58: /* BOOTCS */
         return 0;
     case 0x5c: /* 24MHz */
-        return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
24000000, get_ticks_per_sec());
+        return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
24000000, NANOSECONDS_PER_SECOND);
     case 0x60: /* MISC */
         return 0;
     case 0x84: /* PROCID0 */
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index 481abdb..83995cc 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -145,7 +145,7 @@ static void cuda_update_irq(CUDAState *s)

 static uint64_t get_tb(uint64_t time, uint64_t freq)
 {
-    return muldiv64(time, freq, get_ticks_per_sec());
+    return muldiv64(time, freq, NANOSECONDS_PER_SECOND);
 }

 static unsigned int get_counter(CUDATimer *ti)
@@ -189,7 +189,7 @@ static int64_t get_next_irq_time(CUDATimer *s,
int64_t current_time)

     /* current counter value */
     d = muldiv64(current_time - s->load_time,
-                 CUDA_TIMER_FREQ, get_ticks_per_sec());
+                 CUDA_TIMER_FREQ, NANOSECONDS_PER_SECOND);
     /* the timer goes down from latch to -1 (period of latch + 2) */
     if (d <= (s->counter_value + 1)) {
         counter = (s->counter_value - d) & 0xffff;
@@ -208,7 +208,7 @@ static int64_t get_next_irq_time(CUDATimer *s,
int64_t current_time)
     }
     CUDA_DPRINTF("latch=%d counter=%" PRId64 " delta_next=%" PRId64 "\n",
                  s->latch, d, next_time - d);
-    next_time = muldiv64(next_time, get_ticks_per_sec(), CUDA_TIMER_FREQ) +
+    next_time = muldiv64(next_time, NANOSECONDS_PER_SECOND, CUDA_TIMER_FREQ) +
         s->load_time;
     if (next_time <= current_time)
         next_time = current_time + 1;
@@ -531,7 +531,7 @@ static void cuda_adb_poll(void *opaque)
     }
     timer_mod(s->adb_poll_timer,
                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                   (get_ticks_per_sec() / (1000 / s->autopoll_rate_ms)));
+                   (NANOSECONDS_PER_SECOND / (1000 / s->autopoll_rate_ms)));
 }

 /* description of commands */
@@ -559,7 +559,7 @@ static bool cuda_cmd_autopoll(CUDAState *s,
         if (autopoll) {
             timer_mod(s->adb_poll_timer,
                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                      (get_ticks_per_sec() / (1000 / s->autopoll_rate_ms)));
+                      (NANOSECONDS_PER_SECOND / (1000 / s->autopoll_rate_ms)));
         } else {
             timer_del(s->adb_poll_timer);
         }
@@ -585,7 +585,7 @@ static bool cuda_cmd_set_autorate(CUDAState *s,
     if (s->autopoll) {
         timer_mod(s->adb_poll_timer,
                   qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                  (get_ticks_per_sec() / (1000 / s->autopoll_rate_ms)));
+                  (NANOSECONDS_PER_SECOND / (1000 / s->autopoll_rate_ms)));
     }
     return true;
 }
@@ -665,7 +665,7 @@ static bool cuda_cmd_get_time(CUDAState *s,
     }

     ti = s->tick_offset + (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
-                           / get_ticks_per_sec());
+                           / NANOSECONDS_PER_SECOND);
     out_data[0] = ti >> 24;
     out_data[1] = ti >> 16;
     out_data[2] = ti >> 8;
@@ -687,7 +687,7 @@ static bool cuda_cmd_set_time(CUDAState *s,
     ti = (((uint32_t)in_data[1]) << 24) + (((uint32_t)in_data[2]) << 16)
          + (((uint32_t)in_data[3]) << 8) + in_data[4];
     s->tick_offset = ti - (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
-                           / get_ticks_per_sec());
+                           / NANOSECONDS_PER_SECOND);
     return true;
 }

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 42325bf..5071f95 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -253,7 +253,7 @@ static uint64_t timer_read(void *opaque, hwaddr
addr, unsigned size)
     uint64_t systime = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     uint64_t kltime;

-    kltime = muldiv64(systime, 4194300, get_ticks_per_sec() * 4);
+    kltime = muldiv64(systime, 4194300, NANOSECONDS_PER_SECOND * 4);
     kltime = muldiv64(kltime, 18432000, 1048575);

     switch (addr) {
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index e847b77..e6c9f98 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -293,7 +293,7 @@ static void dp8393x_set_next_tick(dp8393xState *s)

     ticks = s->regs[SONIC_WT1] << 16 | s->regs[SONIC_WT0];
     s->wt_last_update = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    delay = get_ticks_per_sec() * ticks / 5000000;
+    delay = NANOSECONDS_PER_SECOND * ticks / 5000000;
     timer_mod(s->watchdog, s->wt_last_update + delay);
 }

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index ce90b09..ce2cb89 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -463,7 +463,7 @@ void ppce500_set_mpic_proxy(bool enabled)
 uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_offset)
 {
     /* TB time in tb periods */
-    return muldiv64(vmclk, tb_env->tb_freq, get_ticks_per_sec()) + tb_offset;
+    return muldiv64(vmclk, tb_env->tb_freq, NANOSECONDS_PER_SECOND) +
tb_offset;
 }

 uint64_t cpu_ppc_load_tbl (CPUPPCState *env)
@@ -504,7 +504,7 @@ uint32_t cpu_ppc_load_tbu (CPUPPCState *env)
 static inline void cpu_ppc_store_tb(ppc_tb_t *tb_env, uint64_t vmclk,
                                     int64_t *tb_offsetp, uint64_t value)
 {
-    *tb_offsetp = value - muldiv64(vmclk, tb_env->tb_freq,
get_ticks_per_sec());
+    *tb_offsetp = value - muldiv64(vmclk, tb_env->tb_freq,
NANOSECONDS_PER_SECOND);
     LOG_TB("%s: tb %016" PRIx64 " offset %08" PRIx64 "\n",
                 __func__, value, *tb_offsetp);
 }
@@ -638,11 +638,11 @@ static inline uint32_t
_cpu_ppc_load_decr(CPUPPCState *env, uint64_t next)

     diff = next - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     if (diff >= 0) {
-        decr = muldiv64(diff, tb_env->decr_freq, get_ticks_per_sec());
+        decr = muldiv64(diff, tb_env->decr_freq, NANOSECONDS_PER_SECOND);
     } else if (tb_env->flags & PPC_TIMER_BOOKE) {
         decr = 0;
     }  else {
-        decr = -muldiv64(-diff, tb_env->decr_freq, get_ticks_per_sec());
+        decr = -muldiv64(-diff, tb_env->decr_freq, NANOSECONDS_PER_SECOND);
     }
     LOG_TB("%s: %08" PRIx32 "\n", __func__, decr);

@@ -674,7 +674,7 @@ uint64_t cpu_ppc_load_purr (CPUPPCState *env)

     diff = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - tb_env->purr_start;

-    return tb_env->purr_load + muldiv64(diff, tb_env->tb_freq,
get_ticks_per_sec());
+    return tb_env->purr_load + muldiv64(diff, tb_env->tb_freq,
NANOSECONDS_PER_SECOND);
 }

 /* When decrementer expires,
@@ -750,7 +750,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu,
uint64_t *nextp,

     /* Calculate the next timer event */
     now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    next = now + muldiv64(value, get_ticks_per_sec(), tb_env->decr_freq);
+    next = now + muldiv64(value, NANOSECONDS_PER_SECOND, tb_env->decr_freq);
     *nextp = next;

     /* Adjust timer */
@@ -1011,7 +1011,7 @@ static void cpu_4xx_fit_cb (void *opaque)
         /* Cannot occur, but makes gcc happy */
         return;
     }
-    next = now + muldiv64(next, get_ticks_per_sec(), tb_env->tb_freq);
+    next = now + muldiv64(next, NANOSECONDS_PER_SECOND, tb_env->tb_freq);
     if (next == now)
         next++;
     timer_mod(ppc40x_timer->fit_timer, next);
@@ -1042,7 +1042,7 @@ static void start_stop_pit (CPUPPCState *env,
ppc_tb_t *tb_env, int is_excp)
                     __func__, ppc40x_timer->pit_reload);
         now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         next = now + muldiv64(ppc40x_timer->pit_reload,
-                              get_ticks_per_sec(), tb_env->decr_freq);
+                              NANOSECONDS_PER_SECOND, tb_env->decr_freq);
         if (is_excp)
             next += tb_env->decr_next - now;
         if (next == now)
@@ -1107,7 +1107,7 @@ static void cpu_4xx_wdt_cb (void *opaque)
         /* Cannot occur, but makes gcc happy */
         return;
     }
-    next = now + muldiv64(next, get_ticks_per_sec(), tb_env->decr_freq);
+    next = now + muldiv64(next, NANOSECONDS_PER_SECOND, tb_env->decr_freq);
     if (next == now)
         next++;
     LOG_TB("%s: TCR " TARGET_FMT_lx " TSR " TARGET_FMT_lx "\n", __func__,
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index ec81f65..3fcaf01 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1353,7 +1353,7 @@ static uint32_t ppc4xx_gpt_readl (void *opaque,
hwaddr addr)
     case 0x00:
         /* Time base counter */
         ret = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + gpt->tb_offset,
-                       gpt->tb_freq, get_ticks_per_sec());
+                       gpt->tb_freq, NANOSECONDS_PER_SECOND);
         break;
     case 0x10:
         /* Output enable */
@@ -1408,7 +1408,7 @@ static void ppc4xx_gpt_writel (void *opaque,
     switch (addr) {
     case 0x00:
         /* Time base counter */
-        gpt->tb_offset = muldiv64(value, get_ticks_per_sec(), gpt->tb_freq)
+        gpt->tb_offset = muldiv64(value, NANOSECONDS_PER_SECOND, gpt->tb_freq)
             - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         ppc4xx_gpt_compute_timer(gpt);
         break;
diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index a8d4e76..86fafc9 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -163,7 +163,7 @@ static void booke_update_fixed_timer(CPUPPCState
      *env,
         ticks += delta_tick;
     }

-    *next = now + muldiv64(ticks, get_ticks_per_sec(), tb_env->tb_freq);
+    *next = now + muldiv64(ticks, NANOSECONDS_PER_SECOND, tb_env->tb_freq);
     if ((*next < now) || (*next > INT64_MAX)) {
         /* Overflow, so assume the biggest number the qemu timer supports. */
         *next = INT64_MAX;
diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index c712daf..161177c 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -216,7 +216,7 @@
 #define SD_HOST_SPECv2_VERS             0x2401

 #define SDHC_REGISTERS_MAP_SIZE         0x100
-#define SDHC_INSERTION_DELAY            (get_ticks_per_sec())
+#define SDHC_INSERTION_DELAY            (NANOSECONDS_PER_SECOND)
 #define SDHC_TRANSFER_DELAY             100
 #define SDHC_ADMA_DESCS_PER_DELAY       5
 #define SDHC_CMD_RESPONSE               (3 << 0)
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 0a6f453..232bdc2 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -445,12 +445,12 @@ static void hstick_irq(void *opaque)

 static int64_t cpu_to_timer_ticks(int64_t cpu_ticks, uint32_t frequency)
 {
-    return muldiv64(cpu_ticks, get_ticks_per_sec(), frequency);
+    return muldiv64(cpu_ticks, NANOSECONDS_PER_SECOND, frequency);
 }

 static uint64_t timer_to_cpu_ticks(int64_t timer_ticks, uint32_t frequency)
 {
-    return muldiv64(timer_ticks, frequency, get_ticks_per_sec());
+    return muldiv64(timer_ticks, frequency, NANOSECONDS_PER_SECOND);
 }

 void cpu_tick_set_count(CPUTimer *timer, uint64_t count)
diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index b84a33f..5e61ad5 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -53,7 +53,7 @@ static int pit_get_count(PITChannelState *s)
     int counter;

     d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) -
s->count_load_time, PIT_FREQ,
-                 get_ticks_per_sec());
+                 NANOSECONDS_PER_SECOND);
     switch(s->mode) {
     case 0:
     case 1:
@@ -263,7 +263,7 @@ static void pit_irq_timer_update(PITChannelState
*s, int64_t current_time)
 #ifdef DEBUG_PIT
     printf("irq_level=%d next_delay=%f\n",
            irq_level,
-           (double)(expire_time - current_time) / get_ticks_per_sec());
+           (double)(expire_time - current_time) / NANOSECONDS_PER_SECOND);
 #endif
     s->next_transition_time = expire_time;
     if (expire_time != -1)
diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c
index ed511b8..e18299a 100644
--- a/hw/timer/i8254_common.c
+++ b/hw/timer/i8254_common.c
@@ -47,7 +47,7 @@ int pit_get_out(PITChannelState *s, int64_t current_time)
     int out;

     d = muldiv64(current_time - s->count_load_time, PIT_FREQ,
-                 get_ticks_per_sec());
+                 NANOSECONDS_PER_SECOND);
     switch (s->mode) {
     default:
     case 0:
@@ -81,7 +81,7 @@ int64_t pit_get_next_transition_time(PITChannelState
*s, int64_t current_time)
     int period2;

     d = muldiv64(current_time - s->count_load_time, PIT_FREQ,
-                 get_ticks_per_sec());
+                 NANOSECONDS_PER_SECOND);
     switch (s->mode) {
     default:
     case 0:
@@ -121,7 +121,7 @@ int64_t
pit_get_next_transition_time(PITChannelState *s, int64_t current_time)
         break;
     }
     /* convert to timer units */
-    next_time = s->count_load_time + muldiv64(next_time, get_ticks_per_sec(),
+    next_time = s->count_load_time + muldiv64(next_time,
NANOSECONDS_PER_SECOND,
                                               PIT_FREQ);
     /* fix potential rounding problems */
     /* XXX: better solution: use a clock at PIT_FREQ Hz */
diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
index eb0100a..f9c23df 100644
--- a/hw/timer/mc146818rtc.c
+++ b/hw/timer/mc146818rtc.c
@@ -120,7 +120,7 @@ static void rtc_coalesced_timer_update(RTCState *s)
         /* divide each RTC interval to 2 - 8 smaller intervals */
         int c = MIN(s->irq_coalesced, 7) + 1;
         int64_t next_clock = qemu_clock_get_ns(rtc_clock) +
-            muldiv64(s->period / c, get_ticks_per_sec(), RTC_CLOCK_RATE);
+            muldiv64(s->period / c, NANOSECONDS_PER_SECOND, RTC_CLOCK_RATE);
         timer_mod(s->coalesced_timer, next_clock);
     }
 }
@@ -166,10 +166,10 @@ static void periodic_timer_update(RTCState *s,
int64_t current_time)
         s->period = period;
 #endif
         /* compute 32 khz clock */
-        cur_clock = muldiv64(current_time, RTC_CLOCK_RATE,
get_ticks_per_sec());
+        cur_clock = muldiv64(current_time, RTC_CLOCK_RATE,
NANOSECONDS_PER_SECOND);
         next_irq_clock = (cur_clock & ~(period - 1)) + period;
         s->next_periodic_time =
-            muldiv64(next_irq_clock, get_ticks_per_sec(), RTC_CLOCK_RATE) + 1;
+            muldiv64(next_irq_clock, NANOSECONDS_PER_SECOND,
RTC_CLOCK_RATE) + 1;
         timer_mod(s->periodic_timer, s->next_periodic_time);
     } else {
 #ifdef TARGET_I386
diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
index b303421..3a43863 100644
--- a/hw/timer/omap_gptimer.c
+++ b/hw/timer/omap_gptimer.c
@@ -402,7 +402,7 @@ static void omap_gp_timer_write(void *opaque, hwaddr addr,
         if (s->trigger == gpt_trigger_none)
             omap_gp_timer_out(s, s->scpwm);
         /* TODO: make sure this doesn't overflow 32-bits */
-        s->ticks_per_sec = get_ticks_per_sec() << (s->pre ? s->ptv + 1 : 0);
+        s->ticks_per_sec = NANOSECONDS_PER_SECOND << (s->pre ? s->ptv + 1 : 0);
         omap_gp_timer_update(s);
         break;

diff --git a/hw/timer/omap_synctimer.c b/hw/timer/omap_synctimer.c
index edd8d98..e554c35 100644
--- a/hw/timer/omap_synctimer.c
+++ b/hw/timer/omap_synctimer.c
@@ -29,7 +29,7 @@ struct omap_synctimer_s {

 /* 32-kHz Sync Timer of the OMAP2 */
 static uint32_t omap_synctimer_read(struct omap_synctimer_s *s) {
-    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 0x8000,
get_ticks_per_sec());
+    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 0x8000,
NANOSECONDS_PER_SECOND);
 }

 void omap_synctimer_reset(struct omap_synctimer_s *s)
diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
index 3ccb2cb..bdec478 100644
--- a/hw/timer/pl031.c
+++ b/hw/timer/pl031.c
@@ -80,7 +80,7 @@ static void pl031_interrupt(void * opaque)
 static uint32_t pl031_get_count(PL031State *s)
 {
     int64_t now = qemu_clock_get_ns(rtc_clock);
-    return s->tick_offset + now / get_ticks_per_sec();
+    return s->tick_offset + now / NANOSECONDS_PER_SECOND;
 }

 static void pl031_set_alarm(PL031State *s)
@@ -96,7 +96,7 @@ static void pl031_set_alarm(PL031State *s)
         pl031_interrupt(s);
     } else {
         int64_t now = qemu_clock_get_ns(rtc_clock);
-        timer_mod(s->timer, now + (int64_t)ticks * get_ticks_per_sec());
+        timer_mod(s->timer, now + (int64_t)ticks * NANOSECONDS_PER_SECOND);
     }
 }

@@ -204,7 +204,7 @@ static void pl031_init(Object *obj)
     sysbus_init_irq(dev, &s->irq);
     qemu_get_timedate(&tm, 0);
     s->tick_offset = mktimegm(&tm) -
-        qemu_clock_get_ns(rtc_clock) / get_ticks_per_sec();
+        qemu_clock_get_ns(rtc_clock) / NANOSECONDS_PER_SECOND;

     s->timer = timer_new_ns(rtc_clock, pl031_interrupt, s);
 }
@@ -216,7 +216,7 @@ static void pl031_pre_save(void *opaque)
     /* tick_offset is base_time - rtc_clock base time.  Instead, we want to
      * store the base time relative to the QEMU_CLOCK_VIRTUAL for
backwards-compatibility.  */
     int64_t delta = qemu_clock_get_ns(rtc_clock) -
qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    s->tick_offset_vmstate = s->tick_offset + delta / get_ticks_per_sec();
+    s->tick_offset_vmstate = s->tick_offset + delta / NANOSECONDS_PER_SECOND;
 }

 static int pl031_post_load(void *opaque, int version_id)
@@ -224,7 +224,7 @@ static int pl031_post_load(void *opaque, int version_id)
     PL031State *s = opaque;

     int64_t delta = qemu_clock_get_ns(rtc_clock) -
qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    s->tick_offset = s->tick_offset_vmstate - delta / get_ticks_per_sec();
+    s->tick_offset = s->tick_offset_vmstate - delta / NANOSECONDS_PER_SECOND;
     pl031_set_alarm(s);
     return 0;
 }
diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 33449e6..78d1477 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -119,11 +119,11 @@ static void pxa2xx_timer_update(void *opaque,
uint64_t now_qemu)
     uint64_t new_qemu;

     now_vm = s->clock +
-            muldiv64(now_qemu - s->lastload, s->freq, get_ticks_per_sec());
+            muldiv64(now_qemu - s->lastload, s->freq, NANOSECONDS_PER_SECOND);

     for (i = 0; i < 4; i ++) {
         new_qemu = now_qemu + muldiv64((uint32_t) (s->timer[i].value - now_vm),
-                        get_ticks_per_sec(), s->freq);
+                        NANOSECONDS_PER_SECOND, s->freq);
         timer_mod(s->timer[i].qtimer, new_qemu);
     }
 }
@@ -148,10 +148,10 @@ static void pxa2xx_timer_update4(void *opaque,
uint64_t now_qemu, int n)

     now_vm = s->tm4[counter].clock + muldiv64(now_qemu -
                     s->tm4[counter].lastload,
-                    s->tm4[counter].freq, get_ticks_per_sec());
+                    s->tm4[counter].freq, NANOSECONDS_PER_SECOND);

     new_qemu = now_qemu + muldiv64((uint32_t) (s->tm4[n].tm.value - now_vm),
-                    get_ticks_per_sec(), s->tm4[counter].freq);
+                    NANOSECONDS_PER_SECOND, s->tm4[counter].freq);
     timer_mod(s->tm4[n].tm.qtimer, new_qemu);
 }

@@ -190,7 +190,7 @@ static uint64_t pxa2xx_timer_read(void *opaque,
hwaddr offset,
         return s->tm4[tm].tm.value;
     case OSCR:
         return s->clock + muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) -
-                        s->lastload, s->freq, get_ticks_per_sec());
+                        s->lastload, s->freq, NANOSECONDS_PER_SECOND);
     case OSCR11: tm ++;
         /* fall through */
     case OSCR10: tm ++;
@@ -214,7 +214,7 @@ static uint64_t pxa2xx_timer_read(void *opaque,
hwaddr offset,
                 s->snapshot = s->tm4[tm - 1].clock + muldiv64(
                                 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) -
                                 s->tm4[tm - 1].lastload,
-                                s->tm4[tm - 1].freq, get_ticks_per_sec());
+                                s->tm4[tm - 1].freq, NANOSECONDS_PER_SECOND);
             else
                 s->snapshot = s->tm4[tm - 1].clock;
         }
@@ -222,7 +222,7 @@ static uint64_t pxa2xx_timer_read(void *opaque,
hwaddr offset,
         if (!s->tm4[tm].freq)
             return s->tm4[tm].clock;
         return s->tm4[tm].clock +
muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) -
-                        s->tm4[tm].lastload, s->tm4[tm].freq,
get_ticks_per_sec());
+                        s->tm4[tm].lastload, s->tm4[tm].freq,
NANOSECONDS_PER_SECOND);
     case OIER:
         return s->irq_enabled;
     case OSSR: /* Status register */
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 1b50601..f9a3dd0 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -2303,10 +2303,10 @@ static void ehci_frame_timer(void *opaque)
         /* If we've raised int, we speed up the timer, so that we quickly
          * notice any new packets queued up in response */
         if (ehci->int_req_by_async && (ehci->usbsts & USBSTS_INT)) {
-            expire_time = t_now + get_ticks_per_sec() / (FRAME_TIMER_FREQ * 4);
+            expire_time = t_now + NANOSECONDS_PER_SECOND /
(FRAME_TIMER_FREQ * 4);
             ehci->int_req_by_async = false;
         } else {
-            expire_time = t_now + (get_ticks_per_sec()
+            expire_time = t_now + (NANOSECONDS_PER_SECOND
                                * (ehci->async_stepdown+1) / FRAME_TIMER_FREQ);
         }
         timer_mod(ehci->frame_timer, expire_time);
diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index cd23197..27d9d0b 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -564,7 +564,7 @@ static void musb_schedule_cb(USBPort *port,
USBPacket *packey)
         ep->intv_timer[dir] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
musb_cb_tick, ep);

     timer_mod(ep->intv_timer[dir], qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                   muldiv64(timeout, get_ticks_per_sec(), 8000));
+                   muldiv64(timeout, NANOSECONDS_PER_SECOND, 8000));
 }

 static int musb_timeout(int ttype, int speed, int val)
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 17ed461..a9bf805 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1849,12 +1849,12 @@ static void usb_ohci_init(OHCIState *ohci,
DeviceState *dev,

     if (usb_frame_time == 0) {
 #ifdef OHCI_TIME_WARP
-        usb_frame_time = get_ticks_per_sec();
-        usb_bit_time = muldiv64(1, get_ticks_per_sec(), USB_HZ/1000);
+        usb_frame_time = NANOSECONDS_PER_SECOND;
+        usb_bit_time = muldiv64(1, NANOSECONDS_PER_SECOND, USB_HZ/1000);
 #else
-        usb_frame_time = muldiv64(1, get_ticks_per_sec(), 1000);
-        if (get_ticks_per_sec() >= USB_HZ) {
-            usb_bit_time = muldiv64(1, get_ticks_per_sec(), USB_HZ);
+        usb_frame_time = muldiv64(1, NANOSECONDS_PER_SECOND, 1000);
+        if (NANOSECONDS_PER_SECOND >= USB_HZ) {
+            usb_bit_time = muldiv64(1, NANOSECONDS_PER_SECOND, USB_HZ);
         } else {
             usb_bit_time = 1;
         }
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index c370240..2dbf22b 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -402,7 +402,7 @@ static int uhci_post_load(void *opaque, int version_id)

     if (version_id < 2) {
         s->expire_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-            (get_ticks_per_sec() / FRAME_TIMER_FREQ);
+            (NANOSECONDS_PER_SECOND / FRAME_TIMER_FREQ);
     }
     return 0;
 }
@@ -444,7 +444,7 @@ static void uhci_port_write(void *opaque, hwaddr addr,
             /* start frame processing */
             trace_usb_uhci_schedule_start();
             s->expire_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                (get_ticks_per_sec() / FRAME_TIMER_FREQ);
+                (NANOSECONDS_PER_SECOND / FRAME_TIMER_FREQ);
             timer_mod(s->frame_timer, s->expire_time);
             s->status &= ~UHCI_STS_HCHALTED;
         } else if (!(val & UHCI_CMD_RS)) {
@@ -1130,7 +1130,7 @@ static void uhci_frame_timer(void *opaque)
     UHCIState *s = opaque;
     uint64_t t_now, t_last_run;
     int i, frames;
-    const uint64_t frame_t = get_ticks_per_sec() / FRAME_TIMER_FREQ;
+    const uint64_t frame_t = NANOSECONDS_PER_SECOND / FRAME_TIMER_FREQ;

     s->completions_only = false;
     qemu_bh_cancel(s->bh);
diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index 9f6af90..31d3e5b 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -516,7 +516,7 @@ static void tusb_async_writew(void *opaque, hwaddr addr,
         if (value & TUSB_DEV_OTG_TIMER_ENABLE)
             timer_mod(s->otg_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                             muldiv64(TUSB_DEV_OTG_TIMER_VAL(value),
-                                     get_ticks_per_sec(), TUSB_DEVCLOCK));
+                                     NANOSECONDS_PER_SECOND, TUSB_DEVCLOCK));
         else
             timer_del(s->otg_timer);
         break;
@@ -727,7 +727,7 @@ static void tusb6010_power(TUSBState *s, int on)
         s->intr_ok = 0;
         tusb_intr_update(s);
         timer_mod(s->pwr_timer,
-                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
get_ticks_per_sec() / 2);
+                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
NANOSECONDS_PER_SECOND / 2);
     }
 }

diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
index 1c3658e..f54a35a 100644
--- a/hw/watchdog/wdt_diag288.c
+++ b/hw/watchdog/wdt_diag288.c
@@ -79,7 +79,7 @@ static int wdt_diag288_handle_timer(DIAG288State *diag288,
         }
         timer_mod(diag288->timer,
                   qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                  timeout * get_ticks_per_sec());
+                  timeout * NANOSECONDS_PER_SECOND);
         break;
     case WDT_DIAG288_CANCEL:
         if (!diag288->enabled) {
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
index 532530b..532afe8 100644
--- a/hw/watchdog/wdt_ib700.c
+++ b/hw/watchdog/wdt_ib700.c
@@ -64,7 +64,7 @@ static void ib700_write_enable_reg(void *vp,
uint32_t addr, uint32_t data)

     ib700_debug("addr = %x, data = %x\n", addr, data);

-    timeout = (int64_t) time_map[data & 0xF] * get_ticks_per_sec();
+    timeout = (int64_t) time_map[data & 0xF] * NANOSECONDS_PER_SECOND;
     timer_mod(s->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + timeout);
 }

diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 7462e20..a2aa704 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -155,7 +155,7 @@ void acpi_pm_tmr_reset(ACPIREGS *ar);
 static inline int64_t acpi_pm_tmr_get_clock(void)
 {
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), PM_TIMER_FREQUENCY,
-                    get_ticks_per_sec());
+                    NANOSECONDS_PER_SECOND);
 }

 /* PM1a_EVT: piix and ich9 don't implement PM1b. */
diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index d0946cb..ea38a71 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -796,7 +796,7 @@ static inline int64_t get_max_clock_jump(void)
      * generated by the RTC on clock jumps, but large enough to avoid frequent
      * unnecessary resets in idle VMs.
      */
-    return 60 * get_ticks_per_sec();
+    return 60 * NANOSECONDS_PER_SECOND;
 }

 /*
@@ -822,7 +822,7 @@ static inline int64_t get_clock(void)
 {
     LARGE_INTEGER ti;
     QueryPerformanceCounter(&ti);
-    return muldiv64(ti.QuadPart, get_ticks_per_sec(), clock_freq);
+    return muldiv64(ti.QuadPart, NANOSECONDS_PER_SECOND, clock_freq);
 }

 #else
diff --git a/monitor.c b/monitor.c
index e99ca8c..6bdf174 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1506,9 +1506,9 @@ int64_t dev_time;
 static void hmp_info_profile(Monitor *mon, const QDict *qdict)
 {
     monitor_printf(mon, "async time  %" PRId64 " (%0.3f)\n",
-                   dev_time, dev_time / (double)get_ticks_per_sec());
+                   dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
     monitor_printf(mon, "qemu time   %" PRId64 " (%0.3f)\n",
-                   tcg_time, tcg_time / (double)get_ticks_per_sec());
+                   tcg_time, tcg_time / (double)NANOSECONDS_PER_SECOND);
     tcg_time = 0;
     dev_time = 0;
 }
diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index d67c169..a095c91 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -1336,7 +1336,7 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)

         /* Always wake up soon in case the interrupt was level based */
         timer_mod(idle_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                       (get_ticks_per_sec() / 50));
+                       (NANOSECONDS_PER_SECOND / 50));
     }

     /* We don't know if there are more interrupts pending after this. However,
@@ -1796,7 +1796,7 @@ uint32_t kvmppc_get_tbfreq(void)
 {
     char line[512];
     char *ns;
-    uint32_t retval = get_ticks_per_sec();
+    uint32_t retval = NANOSECONDS_PER_SECOND;

     if (read_cpuinfo("timebase", line, sizeof(line))) {
         return retval;
-- 
1.9.1

Regards
Rutuja Shah
