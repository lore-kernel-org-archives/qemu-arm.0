Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp807656lfq;
        Thu, 17 Sep 2020 11:16:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD2WmAcBp8/Dr3YV4dABWijrpKwwbRqhipD9fHMNcch+MXLyZouyGvBtkOSVjgIHXmw2lv
X-Received: by 2002:a25:cc92:: with SMTP id l140mr17388859ybf.276.1600366561955;
        Thu, 17 Sep 2020 11:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600366561; cv=none;
        d=google.com; s=arc-20160816;
        b=wHvzhEoQVkS5NPPliiP7KhPQg0A5bhuC6ycI8l/ej1Dov3r4KEdSaEGYEguZBVUP5Q
         HwIyRhYLi+tE37QK5Pe8A9Gqpo+LGS6aw14/rRL1nMEK4tli9tZth+79edMTlwgnLcZl
         DBQrIavpBmXzBwR2to+ysI1+dtm5d3TVZEI1h6Vt+rN5RLI3qVLpn55DUbdpqjJAbMEw
         6hXvGfv2w2y1Vg3+GtiV/E8+fgU9k3CNHuWBvmUiJmyTp7/Zw4WL7Rg9G6nFETcv5DBm
         /Y2cZvwDCrclm2rjhhR5PjjXFCy2zdPsdJQ0+3+3+p79XpIst9QlgLvnvZhhwwzSoE2p
         C5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:subject:references
         :in-reply-to:message-id:to:from:date:dkim-signature;
        bh=FKWguQTrs6XTXccnT79eOxu/8C1r1K580GbaTpsuQfM=;
        b=mRUMeD0CayjaMdSNIi+nby+GeIGvrzKIISye6jRuU4KvK5eMdBYMKIdJfE2rRQh4Wc
         NNqIrc7V/wMoMR6CoC4MWF8MsGZqPbVVNStkat5vYdKmjGu+L+q/siNpSSHtodVWuv2w
         HWexODVeASRuRIY8MWtRW/N61hSFY4sa+q0q3EfTcy/IspGWvtmQKfqQNB3T3FWZLLsD
         EyslMWtGshwOJ4r//8ObrCK0DAkLXiIEmSYkNB2ppG8fveK+zR6DXKPec+O7UivCjkY6
         FZ4vgv7r6JkmNB9InqEcNeG7VZNM9rDojPB2EcU0fzYme0mwSUeS5DIUYC4tz6xWTVoV
         GwHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WqJG0Joz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si313766ybu.44.2020.09.17.11.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 11:16:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WqJG0Joz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIyRt-0000NN-8W
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 14:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kIyRJ-0000Ls-Do
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 14:15:26 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:38668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kIyRE-0007s9-O0
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 14:15:25 -0400
Received: by mail-qk1-x744.google.com with SMTP id d20so3245592qka.5
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2020 11:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=FKWguQTrs6XTXccnT79eOxu/8C1r1K580GbaTpsuQfM=;
 b=WqJG0JozGcTbfKB+xCXypbUD58CeV47e+0JdfE5DlEExHnmqp7HVkIrbXfF1igL7tT
 Z/TzwShod85/QYm3dM52VINSkRH72FGEAleeDxd0T2N3Anl6Zryj02mMiRkKUSjipaLL
 oJ8GxCoS+sRHCsW4cyO0rUe1c7U0lkl7Gca7R3ao1Lp1pqu2ycjewIzU7Ki9X48R7KfL
 NaXLBthpC6ttrp8odJF91C/gsxE+cWXdnAnbzPMYZ1zRoSDJztyUoEKRc+N3XkikZpni
 WC7xzU958ko0Ra7YYMB7HzZ9M4qj4YoFEd3eMKoZT5O6Um/DBD5dU4VwFvzhg7SxM4eU
 4Y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=FKWguQTrs6XTXccnT79eOxu/8C1r1K580GbaTpsuQfM=;
 b=my7Xl2doh4hqQCDQhzCtXn8buE5gGkZTkFJJU7xbdq2FrHFK/pE2Ik/tKCirNRZna3
 3urzwK7vdIgFkGhlCF5fye6rjC9FIRziWZU8G5L4hgp6Y4LlHNtN++FutbaiuRM/ucei
 ZSWehSn4i5TFpvwfrfY2NiyVxK8n7NTEGo+53ESSXTRKKhDtU/9DGkOYOj9FUKFRXDLD
 Ui1Lee6/ed3rajbUSTFduSzxN8UaKxF0fWGaHaihlUv4GyVS/OQ9xAATdvSkukzHxYxV
 9VShU1ZFy/ddOCbWwJz9itg3Lh7i5a9BfqiNTV2bs937F9MVM4eV55lsqRDL4jiXR6WX
 uhKQ==
X-Gm-Message-State: AOAM533nT/v2tk6+MtYIUZ/iUlcMlJdpGpPluXLmaaSPjSElLhfYw+nU
 aEha3+uWF/kpAmvEyz/wUgrgim/NI6tkoQ==
X-Received: by 2002:a05:620a:410:: with SMTP id
 16mr27949379qkp.133.1600366517112; 
 Thu, 17 Sep 2020 11:15:17 -0700 (PDT)
Received: from master ([2607:fea8:e2a0:e950::661])
 by smtp.gmail.com with ESMTPSA id h65sm327944qtd.58.2020.09.17.11.15.16
 for <qemu-arm@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Sep 2020 11:15:16 -0700 (PDT)
Date: Thu, 17 Sep 2020 14:15:11 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: "=?utf-8?Q?peter.maydell=40linaro.org?=" <peter.maydell@linaro.org>, 
 "=?utf-8?Q?leif=40nuviainc.com?=" <leif@nuviainc.com>, 
 "=?utf-8?Q?rad=40semihalf.com?=" <rad@semihalf.com>
Message-ID: <10A40BDC-1950-4728-BF3A-C96E9535DA95@getmailspring.com>
In-Reply-To: <20200917022338.49056-1-shashi.mallela@linaro.org>
References: <20200917022338.49056-1-shashi.mallela@linaro.org>
Subject: Re: [PATCH] Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5f63a7af_171a186f_2084"
Received-SPF: pass client-ip=2607:f8b0:4864:20::744;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x744.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "=?utf-8?Q?qemu-arm=40nongnu.org?=" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5V25jbYZ5D6g

--5f63a7af_171a186f_2084
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello All,

My last patch was sent with mis-formatted subject line.Please ignore the last mail and consider the latest rectified patch mail sent for your review.
Thanks
Shashi

Sent from Mailspring (https://link.getmailspring.com/link/10A40BDC-1950-4728-BF3A-C96E9535DA95@getmailspring.com/0?redirect=https%3A%2F%2Fgetmailspring.com%2F&recipient=cWVtdS1hcm1Abm9uZ251Lm9yZw%3D%3D), the best free email app for work
On Sep 16 2020, at 10:23 pm, Shashi Mallela <shashi.mallela@linaro.org> wrote:
> hw/watchdog: Implement generic watchdog device model as per ARM BSAv0.9
> hw/arm/sbsa-ref : Include SBSA watchdog device in sbsa-ref platform
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
> hw/arm/Kconfig | 1 +
> hw/arm/sbsa-ref.c | 23 ++
> hw/watchdog/Kconfig | 4 +
> hw/watchdog/meson.build | 1 +
> hw/watchdog/wdt_sbsa_gwdt.c | 343 ++++++++++++++++++++++++++++
> include/hw/watchdog/wdt_sbsa_gwdt.h | 68 ++++++
> 6 files changed, 440 insertions(+)
> create mode 100644 hw/watchdog/wdt_sbsa_gwdt.c
> create mode 100644 include/hw/watchdog/wdt_sbsa_gwdt.h
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index f303c6bead25..6b97e64595d3 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -210,6 +210,7 @@ config SBSA_REF
> select PL031 # RTC
> select PL061 # GPIO
> select USB_EHCI_SYSBUS
> + select WDT_SBSA_GWDT
>
> config SABRELITE
> bool
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index ac68b4640d0d..652079a12e37 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -40,6 +40,7 @@
> #include "hw/qdev-properties.h"
> #include "hw/usb.h"
> #include "hw/char/pl011.h"
> +#include "hw/watchdog/wdt_sbsa_gwdt.h"
> #include "net/net.h"
> #include "qom/object.h"
>
> @@ -64,6 +65,9 @@ enum {
> SBSA_GIC_DIST,
> SBSA_GIC_REDIST,
> SBSA_SECURE_EC,
> + SBSA_GWDT,
> + SBSA_GWDT_REFRESH,
> + SBSA_GWDT_CONTROL,
> SBSA_SMMU,
> SBSA_UART,
> SBSA_RTC,
> @@ -111,6 +115,8 @@ static const MemMapEntry sbsa_ref_memmap[] = {
> [SBSA_GIC_DIST] = { 0x40060000, 0x00010000 },
> [SBSA_GIC_REDIST] = { 0x40080000, 0x04000000 },
> [SBSA_SECURE_EC] = { 0x50000000, 0x00001000 },
> + [SBSA_GWDT_REFRESH] = { 0x50010000, 0x00001000 },
> + [SBSA_GWDT_CONTROL] = { 0x50011000, 0x00001000 },
> [SBSA_UART] = { 0x60000000, 0x00001000 },
> [SBSA_RTC] = { 0x60010000, 0x00001000 },
> [SBSA_GPIO] = { 0x60020000, 0x00001000 },
> @@ -140,6 +146,7 @@ static const int sbsa_ref_irqmap[] = {
> [SBSA_SECURE_UART_MM] = 9,
> [SBSA_AHCI] = 10,
> [SBSA_EHCI] = 11,
> + [SBSA_GWDT] = 12,
> };
>
> static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
> @@ -454,6 +461,20 @@ static void create_rtc(const SBSAMachineState *sms)
> sysbus_create_simple("pl031", base, qdev_get_gpio_in(sms->gic, irq));
> }
>
> +static void create_wdt(const SBSAMachineState *sms)
> +{
> + hwaddr rbase = sbsa_ref_memmap[SBSA_GWDT_REFRESH].base;
> + hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
> + DeviceState *dev = qdev_new(TYPE_WDT_SBSA_GWDT);
> + SysBusDevice *s = SYS_BUS_DEVICE(dev);
> + int irq = sbsa_ref_irqmap[SBSA_GWDT];
> +
> + sysbus_realize_and_unref(s, &error_fatal);
> + sysbus_mmio_map(s, 0, rbase);
> + sysbus_mmio_map(s, 1, cbase);
> + sysbus_connect_irq(s, 0, qdev_get_gpio_in(sms->gic, irq));
> +}
> +
> static DeviceState *gpio_key_dev;
> static void sbsa_ref_powerdown_req(Notifier *n, void *opaque)
> {
> @@ -737,6 +758,8 @@ static void sbsa_ref_init(MachineState *machine)
>
> create_rtc(sms);
> + create_wdt(sms);
> +
> create_gpio(sms);
>
> create_ahci(sms);
> diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
> index 293209b291d6..94ac0d5b76b1 100644
> --- a/hw/watchdog/Kconfig
> +++ b/hw/watchdog/Kconfig
> @@ -17,3 +17,7 @@ config WDT_DIAG288
>
> config WDT_IMX2
> bool
> +
> +config WDT_SBSA_GWDT
> + bool
> + default y if SBSA_REF
> \ No newline at end of file
> diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
> index 9b8725e64288..a9a23307acfe 100644
> --- a/hw/watchdog/meson.build
> +++ b/hw/watchdog/meson.build
> @@ -5,3 +5,4 @@ softmmu_ss.add(when: 'CONFIG_WDT_IB700', if_true: files('wdt_ib700.c'))
> softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
> softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
> softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
> +softmmu_ss.add(when: 'CONFIG_WDT_SBSA_GWDT', if_true: files('wdt_sbsa_gwdt.c'))
> diff --git a/hw/watchdog/wdt_sbsa_gwdt.c b/hw/watchdog/wdt_sbsa_gwdt.c
> new file mode 100644
> index 000000000000..eb3be0862cf1
> --- /dev/null
> +++ b/hw/watchdog/wdt_sbsa_gwdt.c
> @@ -0,0 +1,343 @@
> +/*
> + * Generic watchdog device model for SBSA
> + *
> + * Copyright Linaro.org 2020
> + *
> + * Authors:
> + * Shashi Mallela <shashi.mallela@linaro.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at your
> + * option) any later version. See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "sysemu/reset.h"
> +#include "sysemu/watchdog.h"
> +#include "hw/watchdog/wdt_sbsa_gwdt.h"
> +#include "qemu/timer.h"
> +#include "migration/vmstate.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +
> +static WatchdogTimerModel model = {
> + .wdt_name = TYPE_WDT_SBSA_GWDT,
> + .wdt_description = "sbsa_gwdt device for sbsa_ref platform",
> +};
> +
> +static const VMStateDescription vmstate_sbsa_gwdt = {
> + .name = "vmstate_sbsa_gwdt",
> + .version_id = 1,
> + .minimum_version_id = 1,
> + .fields = (VMStateField[]) {
> + VMSTATE_TIMER_PTR(timer, SBSA_GWDTState),
> + VMSTATE_BOOL(enabled, SBSA_GWDTState),
> + VMSTATE_BOOL(ws0, SBSA_GWDTState),
> + VMSTATE_BOOL(ws1, SBSA_GWDTState),
> + VMSTATE_UINT32(wrr, SBSA_GWDTState),
> + VMSTATE_UINT32(wcs, SBSA_GWDTState),
> + VMSTATE_UINT32(worl, SBSA_GWDTState),
> + VMSTATE_UINT32(woru, SBSA_GWDTState),
> + VMSTATE_UINT32(wcvl, SBSA_GWDTState),
> + VMSTATE_UINT32(wcvu, SBSA_GWDTState),
> + VMSTATE_END_OF_LIST()
> + }
> +};
> +
> +static uint64_t sbsa_gwdt_rread(void *opaque, hwaddr addr, unsigned int size)
> +{
> + uint32_t ret;
> +
> + if (addr == SBSA_GWDT_WRR) {
> + /* watch refresh read has no effect and returns 0 */
> + ret = 0;
> + } else {
> + fprintf(stderr, "bad address in refresh frame read : 0x%x\n",
> + (int)addr);
> + }
> + return ret;
> +}
> +
> +static uint64_t sbsa_gwdt_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> + SBSA_GWDTState *s = SBSA_GWDT(opaque);
> + uint32_t ret = 0;
> +
> + switch (addr) {
> + case SBSA_GWDT_WCS:
> + ret = s->wcs;
> + break;
> + case SBSA_GWDT_WOR:
> + ret = s->worl;
> + break;
> + case SBSA_GWDT_WORU:
> + ret = s->woru;
> + break;
> + case SBSA_GWDT_WCV:
> + ret = s->wcvl;
> + break;
> + case SBSA_GWDT_WCVU:
> + ret = s->wcvu;
> + break;
> + case SBSA_GWDT_W_IIDR:
> + ret = s->id;
> + break;
> + default:
> + fprintf(stderr, "bad address in control frame read : 0x%x\n",
> + (int)addr);
> + }
> + return ret;
> +}
> +
> +static void sbsa_gwdt_update_timer(SBSA_GWDTState *s, bool refresh,
> + bool expired)
> +{
> + uint64_t timeout = 0;
> +
> + if (s->enabled) {
> + if ((refresh) || (expired && !s->ws0)) {
> + /*
> + * Extract the upper 16 bits from woru & 32 bits from worl
> + * registers to construct the 48 bit offset value
> + */
> + timeout = s->woru & SBSA_GWDT_WOR_MASK;
> + timeout <<= 32;
> + timeout |= s->worl;
> + timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +
> + /* store the current timeout value into compare registers */
> + s->wcvu = timeout >> 32;
> + s->wcvl = timeout;
> + } else {
> + timeout = s->wcvu;
> + timeout <<= 32;
> + timeout |= s->wcvl;
> + }
> +
> + if (!s->ws0) {
> + timer_del(s->timer);
> + timer_mod(s->ptimer,
> + timeout * NANOSECONDS_PER_SECOND);
> + } else {
> + timer_del(s->ptimer);
> + timer_mod(s->timer,
> + timeout * NANOSECONDS_PER_SECOND);
> + }
> + } else {
> + timer_del(s->ptimer);
> + timer_del(s->timer);
> + }
> +}
> +
> +static void sbsa_gwdt_rwrite(void *opaque, hwaddr offset, uint64_t data,
> + unsigned size) {
> + SBSA_GWDTState *s = SBSA_GWDT(opaque);
> +
> + if (offset == SBSA_GWDT_WRR) {
> + s->wrr = data;
> + s->wcs &= ~SBSA_GWDT_WCS_WS0;
> + s->wcs &= ~SBSA_GWDT_WCS_WS1;
> + s->ws0 = false;
> + s->ws1 = false;
> + sbsa_gwdt_update_timer(s, true , false);
> + } else {
> + fprintf(stderr, "bad address in refresh frame write : 0x%x\n",
> + (int)offset);
> + }
> +}
> +
> +static void sbsa_gwdt_write(void *opaque, hwaddr offset, uint64_t data,
> + unsigned size) {
> + SBSA_GWDTState *s = SBSA_GWDT(opaque);
> + bool enable;
> +
> + switch (offset) {
> + case SBSA_GWDT_WCS:
> + enable = data & SBSA_GWDT_WCS_EN;
> + if (enable) {
> + s->wcs |= SBSA_GWDT_WCS_EN;
> + s->enabled = true;
> + } else {
> + s->wcs &= ~SBSA_GWDT_WCS_EN;
> + s->enabled = false;
> + s->ws0 = false;
> + s->ws1 = false;
> + }
> + sbsa_gwdt_update_timer(s, false, false);
> + break;
> +
> + case SBSA_GWDT_WOR:
> + s->worl = data;
> + /*
> + * TODO:- setting woru to 0 and triggering update timer(below) is a
> + * temporary workaround to handle current linux driver which is
> + * based on earlier version of BSA specification.Once the linux
> + * driver is updated to BSA v0.9 will remove these next 2 lines.
> + */
> + s->woru = 0;
> + sbsa_gwdt_update_timer(s, true , false);
> + break;
> +
> + case SBSA_GWDT_WORU:
> + s->woru = data;
> + sbsa_gwdt_update_timer(s, true , false);
> + break;
> +
> + case SBSA_GWDT_WCV:
> + s->wcvl = data;
> + break;
> +
> + case SBSA_GWDT_WCVU:
> + s->wcvu = data;
> + break;
> +
> + default:
> + fprintf(stderr, "bad address in control frame write : 0x%x\n",
> + (int)offset);
> + }
> + return;
> +}
> +
> +static void wdt_sbsa_gwdt_reset(DeviceState *dev)
> +{
> + SBSA_GWDTState *s = SBSA_GWDT(dev);
> +
> + timer_del(s->ptimer);
> + timer_del(s->timer);
> +
> + s->enabled = false;
> + s->ws0 = false;
> + s->ws1 = false;
> + s->wcs &= ~SBSA_GWDT_WCS_EN;
> + s->wcs &= ~SBSA_GWDT_WCS_WS0;
> + s->wcs &= ~SBSA_GWDT_WCS_WS1;
> + s->wcvl = 0;
> + s->wcvu = 0;
> + s->worl = 0;
> + s->woru = 0;
> + s->id = SBSA_GWDT_ID;
> +}
> +
> +static void sbsa_gwdt_reset(void *opaque)
> +{
> + DeviceState *sbsa_gwdt = opaque;
> +
> + wdt_sbsa_gwdt_reset(sbsa_gwdt);
> +}
> +
> +static void sbsa_gwdt_timer_sysinterrupt(void *opaque)
> +{
> + SBSA_GWDTState *s = SBSA_GWDT(opaque);
> +
> + s->wcs |= SBSA_GWDT_WCS_WS0;
> + s->ws0 = true;
> + qemu_set_irq(s->irq, 1);
> + sbsa_gwdt_update_timer(s, false, true);
> +}
> +
> +static void sbsa_gwdt_timer_sysreset(void *dev)
> +{
> + SBSA_GWDTState *s = SBSA_GWDT(dev);
> + s->wcs |= SBSA_GWDT_WCS_WS1;
> + s->ws1 = true;
> + qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
> + /*
> + * Reset the watchdog only if the guest gets notified about
> + * expiry. watchdog_perform_action() may temporarily relinquish
> + * the BQL; reset before triggering the action to avoid races with
> + * sbsa_gwdt instructions.
> + */
> + switch (get_watchdog_action()) {
> + case WATCHDOG_ACTION_DEBUG:
> + case WATCHDOG_ACTION_NONE:
> + case WATCHDOG_ACTION_PAUSE:
> + break;
> + default:
> + wdt_sbsa_gwdt_reset(dev);
> + }
> + watchdog_perform_action();
> +}
> +
> +static const MemoryRegionOps sbsa_gwdt_rops = {
> + .read = sbsa_gwdt_rread,
> + .write = sbsa_gwdt_rwrite,
> + .endianness = DEVICE_LITTLE_ENDIAN,
> + .valid.min_access_size = 4,
> + .valid.max_access_size = 4,
> + .valid.unaligned = false,
> +};
> +
> +static const MemoryRegionOps sbsa_gwdt_ops = {
> + .read = sbsa_gwdt_read,
> + .write = sbsa_gwdt_write,
> + .endianness = DEVICE_LITTLE_ENDIAN,
> + .valid.min_access_size = 4,
> + .valid.max_access_size = 4,
> + .valid.unaligned = false,
> +};
> +
> +static void wdt_sbsa_gwdt_realize(DeviceState *dev, Error **errp)
> +{
> + SBSA_GWDTState *s = SBSA_GWDT(dev);
> + SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> + memory_region_init_io(&s->rmmio, OBJECT(dev),
> + &sbsa_gwdt_rops, s,
> + "sbsa_gwdt.refresh",
> + SBSA_GWDT_RMMIO_SIZE);
> +
> + memory_region_init_io(&s->cmmio, OBJECT(dev),
> + &sbsa_gwdt_ops, s,
> + "sbsa_gwdt.control",
> + SBSA_GWDT_CMMIO_SIZE);
> +
> + sysbus_init_mmio(sbd, &s->rmmio);
> + sysbus_init_mmio(sbd, &s->cmmio);
> +
> + sysbus_init_irq(sbd, &s->irq);
> +
> + qemu_register_reset(sbsa_gwdt_reset, s);
> +
> + s->ptimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sbsa_gwdt_timer_sysinterrupt,
> + dev);
> + s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sbsa_gwdt_timer_sysreset,
> + dev);
> +}
> +
> +static void wdt_sbsa_gwdt_unrealize(DeviceState *dev)
> +{
> + SBSA_GWDTState *s = SBSA_GWDT(dev);
> +
> + timer_del(s->ptimer);
> + timer_free(s->ptimer);
> +
> + timer_del(s->timer);
> + timer_free(s->timer);
> +}
> +
> +static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, void *data)
> +{
> + DeviceClass *dc = DEVICE_CLASS(klass);
> +
> + dc->realize = wdt_sbsa_gwdt_realize;
> + dc->unrealize = wdt_sbsa_gwdt_unrealize;
> + dc->reset = wdt_sbsa_gwdt_reset;
> + dc->hotpluggable = false;
> + set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> + dc->vmsd = &vmstate_sbsa_gwdt;
> +}
> +
> +static const TypeInfo wdt_sbsa_gwdt_info = {
> + .class_init = wdt_sbsa_gwdt_class_init,
> + .parent = TYPE_SYS_BUS_DEVICE,
> + .name = TYPE_WDT_SBSA_GWDT,
> + .instance_size = sizeof(SBSA_GWDTState),
> +};
> +
> +static void wdt_sbsa_gwdt_register_types(void)
> +{
> + watchdog_add_model(&model);
> + type_register_static(&wdt_sbsa_gwdt_info);
> +}
> +
> +type_init(wdt_sbsa_gwdt_register_types)
> diff --git a/include/hw/watchdog/wdt_sbsa_gwdt.h b/include/hw/watchdog/wdt_sbsa_gwdt.h
> new file mode 100644
> index 000000000000..8044646fa62d
> --- /dev/null
> +++ b/include/hw/watchdog/wdt_sbsa_gwdt.h
> @@ -0,0 +1,68 @@
> +#ifndef WDT_SBSA_GWDT_H
> +#define WDT_SBSA_GWDT_H
> +
> +#include "qemu/bitops.h"
> +#include "hw/sysbus.h"
> +#include "hw/irq.h"
> +
> +#define TYPE_WDT_SBSA_GWDT "sbsa_gwdt"
> +#define SBSA_GWDT(obj) \
> + OBJECT_CHECK(SBSA_GWDTState, (obj), TYPE_WDT_SBSA_GWDT)
> +#define SBSA_GWDT_CLASS(klass) \
> + OBJECT_CLASS_CHECK(SBSA_GWDTClass, (klass), TYPE_WDT_SBSA_GWDT)
> +#define SBSA_GWDT_GET_CLASS(obj) \
> + OBJECT_GET_CLASS(SBSA_GWDTClass, (obj), TYPE_WDT_SBSA_GWDT)
> +
> +/* SBSA Generic Watchdog register definitions */
> +/* refresh frame */
> +#define SBSA_GWDT_WRR 0x000
> +
> +/* control frame */
> +#define SBSA_GWDT_WCS 0x000
> +#define SBSA_GWDT_WOR 0x008
> +#define SBSA_GWDT_WORU 0x00C
> +#define SBSA_GWDT_WCV 0x010
> +#define SBSA_GWDT_WCVU 0x014
> +
> +/* Watchdog Interface Identification Register */
> +#define SBSA_GWDT_W_IIDR 0xFCC
> +
> +/* Watchdog Control and Status Register Bits */
> +#define SBSA_GWDT_WCS_EN BIT(0)
> +#define SBSA_GWDT_WCS_WS0 BIT(1)
> +#define SBSA_GWDT_WCS_WS1 BIT(2)
> +
> +#define SBSA_GWDT_WOR_MASK 0x0000FFFF
> +
> +/* Watchdog Interface Identification Register definition*/
> +#define SBSA_GWDT_ID 0x1043B
> +
> +/* 2 Separate memory regions for each of refresh & control register frames */
> +#define SBSA_GWDT_RMMIO_SIZE 0x1000
> +#define SBSA_GWDT_CMMIO_SIZE 0x1000
> +
> +typedef struct SBSA_GWDTState {
> + /* <private> */
> + SysBusDevice parent_obj;
> +
> + /*< public >*/
> + MemoryRegion rmmio;
> + MemoryRegion cmmio;
> + qemu_irq irq;
> +
> + QEMUTimer *ptimer, *timer;
> +
> + uint32_t id;
> + uint32_t wrr;
> + uint32_t wcs;
> + uint32_t worl;
> + uint32_t woru;
> + uint32_t wcvl;
> + uint32_t wcvu;
> + bool enabled;
> + bool ws0, ws1;
> +
> + /*< public >*/
> +} SBSA_GWDTState;
> +
> +#endif /* WDT_SBSA_GWDT_H */
> --
> 2.18.4
>


--5f63a7af_171a186f_2084
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hello All,</div><br><div>My last patch was sent with mis-formatted s=
ubject line.Please ignore the last mail and consider the latest rectified=
 patch mail sent for your review.</div><br><div>Thanks</div><div>Shashi</=
div><br><div><signature id=3D=22initial=22><div><div>Sent from <a href=3D=
=22https://link.getmailspring.com/link/10A40BDC-1950-4728-B=463A-C96E9535=
DA95=40getmailspring.com/0=3Fredirect=3Dhttps%3A%2=46%2=46getmailspring.c=
om%2=46&amp;recipient=3DcWVtdS1hcm1Abm9uZ251Lm9yZw%3D%3D=22>Mailspring</a=
>, the best free email app for work</div></div></signature></div><div cla=
ss=3D=22gmail=5Fquote=5Fattribution=22>On Sep 16 2020, at 10:23 pm, Shash=
i Mallela &lt;shashi.mallela=40linaro.org&gt; wrote:</div><blockquote><di=
v><div>hw/watchdog: Implement generic watchdog device model as per ARM BS=
Av0.9</div><div>hw/arm/sbsa-ref : Include SBSA watchdog device in sbsa-re=
f platform</div><br><div>Signed-off-by: Shashi Mallela &lt;shashi.mallela=
=40linaro.org&gt;</div><div>---</div><div>hw/arm/Kconfig =7C 1 +</div><di=
v>hw/arm/sbsa-ref.c =7C 23 ++</div><div>hw/watchdog/Kconfig =7C 4 +</div>=
<div>hw/watchdog/meson.build =7C 1 +</div><div>hw/watchdog/wdt=5Fsbsa=5Fg=
wdt.c =7C 343 ++++++++++++++++++++++++++++</div><div>include/hw/watchdog/=
wdt=5Fsbsa=5Fgwdt.h =7C 68 ++++++</div><div>6 files changed, 440 insertio=
ns(+)</div><div>create mode 100644 hw/watchdog/wdt=5Fsbsa=5Fgwdt.c</div><=
div>create mode 100644 include/hw/watchdog/wdt=5Fsbsa=5Fgwdt.h</div><br><=
div>diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig</div><div>index f303c6be=
ad25..6b97e64595d3 100644</div><div>--- a/hw/arm/Kconfig</div><div>+++ b/=
hw/arm/Kconfig</div><div>=40=40 -210,6 +210,7 =40=40 config SBSA=5FRE=46<=
/div><div>select PL031 =23 RTC</div><div>select PL061 =23 GPIO</div><div>=
select USB=5FEHCI=5FSYSBUS</div><div>+ select WDT=5FSBSA=5FGWDT</div><br>=
<div>config SABRELITE</div><div>bool</div><div>diff --git a/hw/arm/sbsa-r=
ef.c b/hw/arm/sbsa-ref.c</div><div>index ac68b4640d0d..652079a12e37 10064=
4</div><div>--- a/hw/arm/sbsa-ref.c</div><div>+++ b/hw/arm/sbsa-ref.c</di=
v><div>=40=40 -40,6 +40,7 =40=40</div><div>=23include =22hw/qdev-properti=
es.h=22</div><div>=23include =22hw/usb.h=22</div><div>=23include =22hw/ch=
ar/pl011.h=22</div><div>+=23include =22hw/watchdog/wdt=5Fsbsa=5Fgwdt.h=22=
</div><div>=23include =22net/net.h=22</div><div>=23include =22qom/object.=
h=22</div><br><div>=40=40 -64,6 +65,9 =40=40 enum =7B</div><div>SBSA=5FGI=
C=5FDIST,</div><div>SBSA=5FGIC=5FREDIST,</div><div>SBSA=5FSECURE=5FEC,</d=
iv><div>+ SBSA=5FGWDT,</div><div>+ SBSA=5FGWDT=5FRE=46RESH,</div><div>+ S=
BSA=5FGWDT=5FCONTROL,</div><div>SBSA=5FSMMU,</div><div>SBSA=5FUART,</div>=
<div>SBSA=5FRTC,</div><div>=40=40 -111,6 +115,8 =40=40 static const MemMa=
pEntry sbsa=5Fref=5Fmemmap=5B=5D =3D =7B</div><div>=5BSBSA=5FGIC=5FDIST=5D=
 =3D =7B 0x40060000, 0x00010000 =7D,</div><div>=5BSBSA=5FGIC=5FREDIST=5D =
=3D =7B 0x40080000, 0x04000000 =7D,</div><div>=5BSBSA=5FSECURE=5FEC=5D =3D=
 =7B 0x50000000, 0x00001000 =7D,</div><div>+ =5BSBSA=5FGWDT=5FRE=46RESH=5D=
 =3D =7B 0x50010000, 0x00001000 =7D,</div><div>+ =5BSBSA=5FGWDT=5FCONTROL=
=5D =3D =7B 0x50011000, 0x00001000 =7D,</div><div>=5BSBSA=5FUART=5D =3D =7B=
 0x60000000, 0x00001000 =7D,</div><div>=5BSBSA=5FRTC=5D =3D =7B 0x6001000=
0, 0x00001000 =7D,</div><div>=5BSBSA=5FGPIO=5D =3D =7B 0x60020000, 0x0000=
1000 =7D,</div><div>=40=40 -140,6 +146,7 =40=40 static const int sbsa=5Fr=
ef=5Firqmap=5B=5D =3D =7B</div><div>=5BSBSA=5FSECURE=5FUART=5FMM=5D =3D 9=
,</div><div>=5BSBSA=5FAHCI=5D =3D 10,</div><div>=5BSBSA=5FEHCI=5D =3D 11,=
</div><div>+ =5BSBSA=5FGWDT=5D =3D 12,</div><div>=7D;</div><br><div>stati=
c uint64=5Ft sbsa=5Fref=5Fcpu=5Fmp=5Faffinity(SBSAMachineState *sms, int =
idx)</div><div>=40=40 -454,6 +461,20 =40=40 static void create=5Frtc(cons=
t SBSAMachineState *sms)</div><div>sysbus=5Fcreate=5Fsimple(=22pl031=22, =
base, qdev=5Fget=5Fgpio=5Fin(sms-&gt;gic, irq));</div><div>=7D</div><br><=
div>+static void create=5Fwdt(const SBSAMachineState *sms)</div><div>+=7B=
</div><div>+ hwaddr rbase =3D sbsa=5Fref=5Fmemmap=5BSBSA=5FGWDT=5FRE=46RE=
SH=5D.base;</div><div>+ hwaddr cbase =3D sbsa=5Fref=5Fmemmap=5BSBSA=5FGWD=
T=5FCONTROL=5D.base;</div><div>+ DeviceState *dev =3D qdev=5Fnew(TYPE=5FW=
DT=5FSBSA=5FGWDT);</div><div>+ SysBusDevice *s =3D SYS=5FBUS=5FDEVICE(dev=
);</div><div>+ int irq =3D sbsa=5Fref=5Firqmap=5BSBSA=5FGWDT=5D;</div><di=
v>+</div><div>+ sysbus=5Frealize=5Fand=5Funref(s, &amp;error=5Ffatal);</d=
iv><div>+ sysbus=5Fmmio=5Fmap(s, 0, rbase);</div><div>+ sysbus=5Fmmio=5Fm=
ap(s, 1, cbase);</div><div>+ sysbus=5Fconnect=5Firq(s, 0, qdev=5Fget=5Fgp=
io=5Fin(sms-&gt;gic, irq));</div><div>+=7D</div><div>+</div><div>static D=
eviceState *gpio=5Fkey=5Fdev;</div><div>static void sbsa=5Fref=5Fpowerdow=
n=5Freq(Notifier *n, void *opaque)</div><div>=7B</div><div>=40=40 -737,6 =
+758,8 =40=40 static void sbsa=5Fref=5Finit(MachineState *machine)</div><=
br><div>create=5Frtc(sms);</div><br><div>+ create=5Fwdt(sms);</div><div>+=
</div><div>create=5Fgpio(sms);</div><br><div>create=5Fahci(sms);</div><di=
v>diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig</div><div>index =
293209b291d6..94ac0d5b76b1 100644</div><div>--- a/hw/watchdog/Kconfig</di=
v><div>+++ b/hw/watchdog/Kconfig</div><div>=40=40 -17,3 +17,7 =40=40 conf=
ig WDT=5FDIAG288</div><br><div>config WDT=5FIMX2</div><div>bool</div><div=
>+</div><div>+config WDT=5FSBSA=5FGWDT</div><div>+ bool</div><div>+ defau=
lt y if SBSA=5FRE=46</div><div>=5C No newline at end of file</div><div>di=
ff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build</div><div>in=
dex 9b8725e64288..a9a23307acfe 100644</div><div>--- a/hw/watchdog/meson.b=
uild</div><div>+++ b/hw/watchdog/meson.build</div><div>=40=40 -5,3 +5,4 =40=
=40 softmmu=5Fss.add(when: 'CON=46IG=5FWDT=5FIB700', if=5Ftrue: files('wd=
t=5Fib700.c'))</div><div>softmmu=5Fss.add(when: 'CON=46IG=5FWDT=5FDIAG288=
', if=5Ftrue: files('wdt=5Fdiag288.c'))</div><div>softmmu=5Fss.add(when: =
'CON=46IG=5FASPEED=5FSOC', if=5Ftrue: files('wdt=5Faspeed.c'))</div><div>=
softmmu=5Fss.add(when: 'CON=46IG=5FWDT=5FIMX2', if=5Ftrue: files('wdt=5Fi=
mx2.c'))</div><div>+softmmu=5Fss.add(when: 'CON=46IG=5FWDT=5FSBSA=5FGWDT'=
, if=5Ftrue: files('wdt=5Fsbsa=5Fgwdt.c'))</div><div>diff --git a/hw/watc=
hdog/wdt=5Fsbsa=5Fgwdt.c b/hw/watchdog/wdt=5Fsbsa=5Fgwdt.c</div><div>new =
file mode 100644</div><div>index 000000000000..eb3be0862cf1</div><div>---=
 /dev/null</div><div>+++ b/hw/watchdog/wdt=5Fsbsa=5Fgwdt.c</div><div>=40=40=
 -0,0 +1,343 =40=40</div><div>+/*</div><div>+ * Generic watchdog device m=
odel for SBSA</div><div>+ *</div><div>+ * Copyright Linaro.org 2020</div>=
<div>+ *</div><div>+ * Authors:</div><div>+ * Shashi Mallela &lt;shashi.m=
allela=40linaro.org&gt;</div><div>+ *</div><div>+ * This work is licensed=
 under the terms of the GNU GPL, version 2 or (at your</div><div>+ * opti=
on) any later version. See the COPYING file in the top-level directory.</=
div><div>+ *</div><div>+ */</div><div>+</div><div>+=23include =22qemu/osd=
ep.h=22</div><div>+=23include =22sysemu/reset.h=22</div><div>+=23include =
=22sysemu/watchdog.h=22</div><div>+=23include =22hw/watchdog/wdt=5Fsbsa=5F=
gwdt.h=22</div><div>+=23include =22qemu/timer.h=22</div><div>+=23include =
=22migration/vmstate.h=22</div><div>+=23include =22qemu/log.h=22</div><di=
v>+=23include =22qemu/module.h=22</div><div>+</div><div>+static WatchdogT=
imerModel model =3D =7B</div><div>+ .wdt=5Fname =3D TYPE=5FWDT=5FSBSA=5FG=
WDT,</div><div>+ .wdt=5Fdescription =3D =22sbsa=5Fgwdt device for sbsa=5F=
ref platform=22,</div><div>+=7D;</div><div>+</div><div>+static const VMSt=
ateDescription vmstate=5Fsbsa=5Fgwdt =3D =7B</div><div>+ .name =3D =22vms=
tate=5Fsbsa=5Fgwdt=22,</div><div>+ .version=5Fid =3D 1,</div><div>+ .mini=
mum=5Fversion=5Fid =3D 1,</div><div>+ .fields =3D (VMState=46ield=5B=5D) =
=7B</div><div>+ VMSTATE=5FTIMER=5FPTR(timer, SBSA=5FGWDTState),</div><div=
>+ VMSTATE=5FBOOL(enabled, SBSA=5FGWDTState),</div><div>+ VMSTATE=5FBOOL(=
ws0, SBSA=5FGWDTState),</div><div>+ VMSTATE=5FBOOL(ws1, SBSA=5FGWDTState)=
,</div><div>+ VMSTATE=5FUINT32(wrr, SBSA=5FGWDTState),</div><div>+ VMSTAT=
E=5FUINT32(wcs, SBSA=5FGWDTState),</div><div>+ VMSTATE=5FUINT32(worl, SBS=
A=5FGWDTState),</div><div>+ VMSTATE=5FUINT32(woru, SBSA=5FGWDTState),</di=
v><div>+ VMSTATE=5FUINT32(wcvl, SBSA=5FGWDTState),</div><div>+ VMSTATE=5F=
UINT32(wcvu, SBSA=5FGWDTState),</div><div>+ VMSTATE=5FEND=5FO=46=5FLIST()=
</div><div>+ =7D</div><div>+=7D;</div><div>+</div><div>+static uint64=5Ft=
 sbsa=5Fgwdt=5Frread(void *opaque, hwaddr addr, unsigned int size)</div><=
div>+=7B</div><div>+ uint32=5Ft ret;</div><div>+</div><div>+ if (addr =3D=
=3D SBSA=5FGWDT=5FWRR) =7B</div><div>+ /* watch refresh read has no effec=
t and returns 0 */</div><div>+ ret =3D 0;</div><div>+ =7D else =7B</div><=
div>+ fprintf(stderr, =22bad address in refresh frame read : 0x%x=5Cn=22,=
</div><div>+ (int)addr);</div><div>+ =7D</div><div>+ return ret;</div><di=
v>+=7D</div><div>+</div><div>+static uint64=5Ft sbsa=5Fgwdt=5Fread(void *=
opaque, hwaddr addr, unsigned int size)</div><div>+=7B</div><div>+ SBSA=5F=
GWDTState *s =3D SBSA=5FGWDT(opaque);</div><div>+ uint32=5Ft ret =3D 0;</=
div><div>+</div><div>+ switch (addr) =7B</div><div>+ case SBSA=5FGWDT=5FW=
CS:</div><div>+ ret =3D s-&gt;wcs;</div><div>+ break;</div><div>+ case SB=
SA=5FGWDT=5FWOR:</div><div>+ ret =3D s-&gt;worl;</div><div>+ break;</div>=
<div>+ case SBSA=5FGWDT=5FWORU:</div><div>+ ret =3D s-&gt;woru;</div><div=
>+ break;</div><div>+ case SBSA=5FGWDT=5FWCV:</div><div>+ ret =3D s-&gt;w=
cvl;</div><div>+ break;</div><div>+ case SBSA=5FGWDT=5FWCVU:</div><div>+ =
ret =3D s-&gt;wcvu;</div><div>+ break;</div><div>+ case SBSA=5FGWDT=5FW=5F=
IIDR:</div><div>+ ret =3D s-&gt;id;</div><div>+ break;</div><div>+ defaul=
t:</div><div>+ fprintf(stderr, =22bad address in control frame read : 0x%=
x=5Cn=22,</div><div>+ (int)addr);</div><div>+ =7D</div><div>+ return ret;=
</div><div>+=7D</div><div>+</div><div>+static void sbsa=5Fgwdt=5Fupdate=5F=
timer(SBSA=5FGWDTState *s, bool refresh,</div><div>+ bool expired)</div><=
div>+=7B</div><div>+ uint64=5Ft timeout =3D 0;</div><div>+</div><div>+ if=
 (s-&gt;enabled) =7B</div><div>+ if ((refresh) =7C=7C (expired &amp;&amp;=
 =21s-&gt;ws0)) =7B</div><div>+ /*</div><div>+ * Extract the upper 16 bit=
s from woru &amp; 32 bits from worl</div><div>+ * registers to construct =
the 48 bit offset value</div><div>+ */</div><div>+ timeout =3D s-&gt;woru=
 &amp; SBSA=5FGWDT=5FWOR=5FMASK;</div><div>+ timeout &lt;&lt;=3D 32;</div=
><div>+ timeout =7C=3D s-&gt;worl;</div><div>+ timeout +=3D qemu=5Fclock=5F=
get=5Fns(QEMU=5FCLOCK=5FVIRTUAL);</div><div>+</div><div>+ /* store the cu=
rrent timeout value into compare registers */</div><div>+ s-&gt;wcvu =3D =
timeout &gt;&gt; 32;</div><div>+ s-&gt;wcvl =3D timeout;</div><div>+ =7D =
else =7B</div><div>+ timeout =3D s-&gt;wcvu;</div><div>+ timeout &lt;&lt;=
=3D 32;</div><div>+ timeout =7C=3D s-&gt;wcvl;</div><div>+ =7D</div><div>=
+</div><div>+ if (=21s-&gt;ws0) =7B</div><div>+ timer=5Fdel(s-&gt;timer);=
</div><div>+ timer=5Fmod(s-&gt;ptimer,</div><div>+ timeout * NANOSECONDS=5F=
PER=5FSECOND);</div><div>+ =7D else =7B</div><div>+ timer=5Fdel(s-&gt;pti=
mer);</div><div>+ timer=5Fmod(s-&gt;timer,</div><div>+ timeout * NANOSECO=
NDS=5FPER=5FSECOND);</div><div>+ =7D</div><div>+ =7D else =7B</div><div>+=
 timer=5Fdel(s-&gt;ptimer);</div><div>+ timer=5Fdel(s-&gt;timer);</div><d=
iv>+ =7D</div><div>+=7D</div><div>+</div><div>+static void sbsa=5Fgwdt=5F=
rwrite(void *opaque, hwaddr offset, uint64=5Ft data,</div><div>+ unsigned=
 size) =7B</div><div>+ SBSA=5FGWDTState *s =3D SBSA=5FGWDT(opaque);</div>=
<div>+</div><div>+ if (offset =3D=3D SBSA=5FGWDT=5FWRR) =7B</div><div>+ s=
-&gt;wrr =3D data;</div><div>+ s-&gt;wcs &amp;=3D =7ESBSA=5FGWDT=5FWCS=5F=
WS0;</div><div>+ s-&gt;wcs &amp;=3D =7ESBSA=5FGWDT=5FWCS=5FWS1;</div><div=
>+ s-&gt;ws0 =3D false;</div><div>+ s-&gt;ws1 =3D false;</div><div>+ sbsa=
=5Fgwdt=5Fupdate=5Ftimer(s, true , false);</div><div>+ =7D else =7B</div>=
<div>+ fprintf(stderr, =22bad address in refresh frame write : 0x%x=5Cn=22=
,</div><div>+ (int)offset);</div><div>+ =7D</div><div>+=7D</div><div>+</d=
iv><div>+static void sbsa=5Fgwdt=5Fwrite(void *opaque, hwaddr offset, uin=
t64=5Ft data,</div><div>+ unsigned size) =7B</div><div>+ SBSA=5FGWDTState=
 *s =3D SBSA=5FGWDT(opaque);</div><div>+ bool enable;</div><div>+</div><d=
iv>+ switch (offset) =7B</div><div>+ case SBSA=5FGWDT=5FWCS:</div><div>+ =
enable =3D data &amp; SBSA=5FGWDT=5FWCS=5FEN;</div><div>+ if (enable) =7B=
</div><div>+ s-&gt;wcs =7C=3D SBSA=5FGWDT=5FWCS=5FEN;</div><div>+ s-&gt;e=
nabled =3D true;</div><div>+ =7D else =7B</div><div>+ s-&gt;wcs &amp;=3D =
=7ESBSA=5FGWDT=5FWCS=5FEN;</div><div>+ s-&gt;enabled =3D false;</div><div=
>+ s-&gt;ws0 =3D false;</div><div>+ s-&gt;ws1 =3D false;</div><div>+ =7D<=
/div><div>+ sbsa=5Fgwdt=5Fupdate=5Ftimer(s, false, false);</div><div>+ br=
eak;</div><div>+</div><div>+ case SBSA=5FGWDT=5FWOR:</div><div>+ s-&gt;wo=
rl =3D data;</div><div>+ /*</div><div>+ * TODO:- setting woru to 0 and tr=
iggering update timer(below) is a</div><div>+ * temporary workaround to h=
andle current linux driver which is</div><div>+ * based on earlier versio=
n of BSA specification.Once the linux</div><div>+ * driver is updated to =
BSA v0.9 will remove these next 2 lines.</div><div>+ */</div><div>+ s-&gt=
;woru =3D 0;</div><div>+ sbsa=5Fgwdt=5Fupdate=5Ftimer(s, true , false);</=
div><div>+ break;</div><div>+</div><div>+ case SBSA=5FGWDT=5FWORU:</div><=
div>+ s-&gt;woru =3D data;</div><div>+ sbsa=5Fgwdt=5Fupdate=5Ftimer(s, tr=
ue , false);</div><div>+ break;</div><div>+</div><div>+ case SBSA=5FGWDT=5F=
WCV:</div><div>+ s-&gt;wcvl =3D data;</div><div>+ break;</div><div>+</div=
><div>+ case SBSA=5FGWDT=5FWCVU:</div><div>+ s-&gt;wcvu =3D data;</div><d=
iv>+ break;</div><div>+</div><div>+ default:</div><div>+ fprintf(stderr, =
=22bad address in control frame write : 0x%x=5Cn=22,</div><div>+ (int)off=
set);</div><div>+ =7D</div><div>+ return;</div><div>+=7D</div><div>+</div=
><div>+static void wdt=5Fsbsa=5Fgwdt=5Freset(DeviceState *dev)</div><div>=
+=7B</div><div>+ SBSA=5FGWDTState *s =3D SBSA=5FGWDT(dev);</div><div>+</d=
iv><div>+ timer=5Fdel(s-&gt;ptimer);</div><div>+ timer=5Fdel(s-&gt;timer)=
;</div><div>+</div><div>+ s-&gt;enabled =3D false;</div><div>+ s-&gt;ws0 =
=3D false;</div><div>+ s-&gt;ws1 =3D false;</div><div>+ s-&gt;wcs &amp;=3D=
 =7ESBSA=5FGWDT=5FWCS=5FEN;</div><div>+ s-&gt;wcs &amp;=3D =7ESBSA=5FGWDT=
=5FWCS=5FWS0;</div><div>+ s-&gt;wcs &amp;=3D =7ESBSA=5FGWDT=5FWCS=5FWS1;<=
/div><div>+ s-&gt;wcvl =3D 0;</div><div>+ s-&gt;wcvu =3D 0;</div><div>+ s=
-&gt;worl =3D 0;</div><div>+ s-&gt;woru =3D 0;</div><div>+ s-&gt;id =3D S=
BSA=5FGWDT=5FID;</div><div>+=7D</div><div>+</div><div>+static void sbsa=5F=
gwdt=5Freset(void *opaque)</div><div>+=7B</div><div>+ DeviceState *sbsa=5F=
gwdt =3D opaque;</div><div>+</div><div>+ wdt=5Fsbsa=5Fgwdt=5Freset(sbsa=5F=
gwdt);</div><div>+=7D</div><div>+</div><div>+static void sbsa=5Fgwdt=5Fti=
mer=5Fsysinterrupt(void *opaque)</div><div>+=7B</div><div>+ SBSA=5FGWDTSt=
ate *s =3D SBSA=5FGWDT(opaque);</div><div>+</div><div>+ s-&gt;wcs =7C=3D =
SBSA=5FGWDT=5FWCS=5FWS0;</div><div>+ s-&gt;ws0 =3D true;</div><div>+ qemu=
=5Fset=5Firq(s-&gt;irq, 1);</div><div>+ sbsa=5Fgwdt=5Fupdate=5Ftimer(s, f=
alse, true);</div><div>+=7D</div><div>+</div><div>+static void sbsa=5Fgwd=
t=5Ftimer=5Fsysreset(void *dev)</div><div>+=7B</div><div>+ SBSA=5FGWDTSta=
te *s =3D SBSA=5FGWDT(dev);</div><div>+ s-&gt;wcs =7C=3D SBSA=5FGWDT=5FWC=
S=5FWS1;</div><div>+ s-&gt;ws1 =3D true;</div><div>+ qemu=5Flog=5Fmask(CP=
U=5FLOG=5FRESET, =22Watchdog timer expired.=5Cn=22);</div><div>+ /*</div>=
<div>+ * Reset the watchdog only if the guest gets notified about</div><d=
iv>+ * expiry. watchdog=5Fperform=5Faction() may temporarily relinquish</=
div><div>+ * the BQL; reset before triggering the action to avoid races w=
ith</div><div>+ * sbsa=5Fgwdt instructions.</div><div>+ */</div><div>+ sw=
itch (get=5Fwatchdog=5Faction()) =7B</div><div>+ case WATCHDOG=5FACTION=5F=
DEBUG:</div><div>+ case WATCHDOG=5FACTION=5FNONE:</div><div>+ case WATCHD=
OG=5FACTION=5FPAUSE:</div><div>+ break;</div><div>+ default:</div><div>+ =
wdt=5Fsbsa=5Fgwdt=5Freset(dev);</div><div>+ =7D</div><div>+ watchdog=5Fpe=
rform=5Faction();</div><div>+=7D</div><div>+</div><div>+static const Memo=
ryRegionOps sbsa=5Fgwdt=5Frops =3D =7B</div><div>+ .read =3D sbsa=5Fgwdt=5F=
rread,</div><div>+ .write =3D sbsa=5Fgwdt=5Frwrite,</div><div>+ .endianne=
ss =3D DEVICE=5FLITTLE=5FENDIAN,</div><div>+ .valid.min=5Faccess=5Fsize =3D=
 4,</div><div>+ .valid.max=5Faccess=5Fsize =3D 4,</div><div>+ .valid.unal=
igned =3D false,</div><div>+=7D;</div><div>+</div><div>+static const Memo=
ryRegionOps sbsa=5Fgwdt=5Fops =3D =7B</div><div>+ .read =3D sbsa=5Fgwdt=5F=
read,</div><div>+ .write =3D sbsa=5Fgwdt=5Fwrite,</div><div>+ .endianness=
 =3D DEVICE=5FLITTLE=5FENDIAN,</div><div>+ .valid.min=5Faccess=5Fsize =3D=
 4,</div><div>+ .valid.max=5Faccess=5Fsize =3D 4,</div><div>+ .valid.unal=
igned =3D false,</div><div>+=7D;</div><div>+</div><div>+static void wdt=5F=
sbsa=5Fgwdt=5Frealize(DeviceState *dev, Error **errp)</div><div>+=7B</div=
><div>+ SBSA=5FGWDTState *s =3D SBSA=5FGWDT(dev);</div><div>+ SysBusDevic=
e *sbd =3D SYS=5FBUS=5FDEVICE(dev);</div><div>+</div><div>+ memory=5Fregi=
on=5Finit=5Fio(&amp;s-&gt;rmmio, OBJECT(dev),</div><div>+ &amp;sbsa=5Fgwd=
t=5Frops, s,</div><div>+ =22sbsa=5Fgwdt.refresh=22,</div><div>+ SBSA=5FGW=
DT=5FRMMIO=5FSIZE);</div><div>+</div><div>+ memory=5Fregion=5Finit=5Fio(&=
amp;s-&gt;cmmio, OBJECT(dev),</div><div>+ &amp;sbsa=5Fgwdt=5Fops, s,</div=
><div>+ =22sbsa=5Fgwdt.control=22,</div><div>+ SBSA=5FGWDT=5FCMMIO=5FSIZE=
);</div><div>+</div><div>+ sysbus=5Finit=5Fmmio(sbd, &amp;s-&gt;rmmio);</=
div><div>+ sysbus=5Finit=5Fmmio(sbd, &amp;s-&gt;cmmio);</div><div>+</div>=
<div>+ sysbus=5Finit=5Firq(sbd, &amp;s-&gt;irq);</div><div>+</div><div>+ =
qemu=5Fregister=5Freset(sbsa=5Fgwdt=5Freset, s);</div><div>+</div><div>+ =
s-&gt;ptimer =3D timer=5Fnew=5Fns(QEMU=5FCLOCK=5FVIRTUAL, sbsa=5Fgwdt=5Ft=
imer=5Fsysinterrupt,</div><div>+ dev);</div><div>+ s-&gt;timer =3D timer=5F=
new=5Fns(QEMU=5FCLOCK=5FVIRTUAL, sbsa=5Fgwdt=5Ftimer=5Fsysreset,</div><di=
v>+ dev);</div><div>+=7D</div><div>+</div><div>+static void wdt=5Fsbsa=5F=
gwdt=5Funrealize(DeviceState *dev)</div><div>+=7B</div><div>+ SBSA=5FGWDT=
State *s =3D SBSA=5FGWDT(dev);</div><div>+</div><div>+ timer=5Fdel(s-&gt;=
ptimer);</div><div>+ timer=5Ffree(s-&gt;ptimer);</div><div>+</div><div>+ =
timer=5Fdel(s-&gt;timer);</div><div>+ timer=5Ffree(s-&gt;timer);</div><di=
v>+=7D</div><div>+</div><div>+static void wdt=5Fsbsa=5Fgwdt=5Fclass=5Fini=
t(ObjectClass *klass, void *data)</div><div>+=7B</div><div>+ DeviceClass =
*dc =3D DEVICE=5FCLASS(klass);</div><div>+</div><div>+ dc-&gt;realize =3D=
 wdt=5Fsbsa=5Fgwdt=5Frealize;</div><div>+ dc-&gt;unrealize =3D wdt=5Fsbsa=
=5Fgwdt=5Funrealize;</div><div>+ dc-&gt;reset =3D wdt=5Fsbsa=5Fgwdt=5Fres=
et;</div><div>+ dc-&gt;hotpluggable =3D false;</div><div>+ set=5Fbit(DEVI=
CE=5FCATEGORY=5FMISC, dc-&gt;categories);</div><div>+ dc-&gt;vmsd =3D &am=
p;vmstate=5Fsbsa=5Fgwdt;</div><div>+=7D</div><div>+</div><div>+static con=
st TypeInfo wdt=5Fsbsa=5Fgwdt=5Finfo =3D =7B</div><div>+ .class=5Finit =3D=
 wdt=5Fsbsa=5Fgwdt=5Fclass=5Finit,</div><div>+ .parent =3D TYPE=5FSYS=5FB=
US=5FDEVICE,</div><div>+ .name =3D TYPE=5FWDT=5FSBSA=5FGWDT,</div><div>+ =
.instance=5Fsize =3D sizeof(SBSA=5FGWDTState),</div><div>+=7D;</div><div>=
+</div><div>+static void wdt=5Fsbsa=5Fgwdt=5Fregister=5Ftypes(void)</div>=
<div>+=7B</div><div>+ watchdog=5Fadd=5Fmodel(&amp;model);</div><div>+ typ=
e=5Fregister=5Fstatic(&amp;wdt=5Fsbsa=5Fgwdt=5Finfo);</div><div>+=7D</div=
><div>+</div><div>+type=5Finit(wdt=5Fsbsa=5Fgwdt=5Fregister=5Ftypes)</div=
><div>diff --git a/include/hw/watchdog/wdt=5Fsbsa=5Fgwdt.h b/include/hw/w=
atchdog/wdt=5Fsbsa=5Fgwdt.h</div><div>new file mode 100644</div><div>inde=
x 000000000000..8044646fa62d</div><div>--- /dev/null</div><div>+++ b/incl=
ude/hw/watchdog/wdt=5Fsbsa=5Fgwdt.h</div><div>=40=40 -0,0 +1,68 =40=40</d=
iv><div>+=23ifndef WDT=5FSBSA=5FGWDT=5FH</div><div>+=23define WDT=5FSBSA=5F=
GWDT=5FH</div><div>+</div><div>+=23include =22qemu/bitops.h=22</div><div>=
+=23include =22hw/sysbus.h=22</div><div>+=23include =22hw/irq.h=22</div><=
div>+</div><div>+=23define TYPE=5FWDT=5FSBSA=5FGWDT =22sbsa=5Fgwdt=22</di=
v><div>+=23define SBSA=5FGWDT(obj) =5C</div><div>+ OBJECT=5FCHECK(SBSA=5F=
GWDTState, (obj), TYPE=5FWDT=5FSBSA=5FGWDT)</div><div>+=23define SBSA=5FG=
WDT=5FCLASS(klass) =5C</div><div>+ OBJECT=5FCLASS=5FCHECK(SBSA=5FGWDTClas=
s, (klass), TYPE=5FWDT=5FSBSA=5FGWDT)</div><div>+=23define SBSA=5FGWDT=5F=
GET=5FCLASS(obj) =5C</div><div>+ OBJECT=5FGET=5FCLASS(SBSA=5FGWDTClass, (=
obj), TYPE=5FWDT=5FSBSA=5FGWDT)</div><div>+</div><div>+/* SBSA Generic Wa=
tchdog register definitions */</div><div>+/* refresh frame */</div><div>+=
=23define SBSA=5FGWDT=5FWRR 0x000</div><div>+</div><div>+/* control frame=
 */</div><div>+=23define SBSA=5FGWDT=5FWCS 0x000</div><div>+=23define SBS=
A=5FGWDT=5FWOR 0x008</div><div>+=23define SBSA=5FGWDT=5FWORU 0x00C</div><=
div>+=23define SBSA=5FGWDT=5FWCV 0x010</div><div>+=23define SBSA=5FGWDT=5F=
WCVU 0x014</div><div>+</div><div>+/* Watchdog Interface Identification Re=
gister */</div><div>+=23define SBSA=5FGWDT=5FW=5FIIDR 0x=46CC</div><div>+=
</div><div>+/* Watchdog Control and Status Register Bits */</div><div>+=23=
define SBSA=5FGWDT=5FWCS=5FEN BIT(0)</div><div>+=23define SBSA=5FGWDT=5FW=
CS=5FWS0 BIT(1)</div><div>+=23define SBSA=5FGWDT=5FWCS=5FWS1 BIT(2)</div>=
<div>+</div><div>+=23define SBSA=5FGWDT=5FWOR=5FMASK 0x0000=46=46=46=46</=
div><div>+</div><div>+/* Watchdog Interface Identification Register defin=
ition*/</div><div>+=23define SBSA=5FGWDT=5FID 0x1043B</div><div>+</div><d=
iv>+/* 2 Separate memory regions for each of refresh &amp; control regist=
er frames */</div><div>+=23define SBSA=5FGWDT=5FRMMIO=5FSIZE 0x1000</div>=
<div>+=23define SBSA=5FGWDT=5FCMMIO=5FSIZE 0x1000</div><div>+</div><div>+=
typedef struct SBSA=5FGWDTState =7B</div><div>+ /* &lt;private&gt; */</di=
v><div>+ SysBusDevice parent=5Fobj;</div><div>+</div><div>+ /*&lt; public=
 &gt;*/</div><div>+ MemoryRegion rmmio;</div><div>+ MemoryRegion cmmio;</=
div><div>+ qemu=5Firq irq;</div><div>+</div><div>+ QEMUTimer *ptimer, *ti=
mer;</div><div>+</div><div>+ uint32=5Ft id;</div><div>+ uint32=5Ft wrr;</=
div><div>+ uint32=5Ft wcs;</div><div>+ uint32=5Ft worl;</div><div>+ uint3=
2=5Ft woru;</div><div>+ uint32=5Ft wcvl;</div><div>+ uint32=5Ft wcvu;</di=
v><div>+ bool enabled;</div><div>+ bool ws0, ws1;</div><div>+</div><div>+=
 /*&lt; public &gt;*/</div><div>+=7D SBSA=5FGWDTState;</div><div>+</div><=
div>+=23endif /* WDT=5FSBSA=5FGWDT=5FH */</div><div>--</div><div>2.18.4</=
div></div></blockquote><img class=3D=22mailspring-open=22 alt=3D=22Sent f=
rom Mailspring=22 width=3D=220=22 height=3D=220=22 style=3D=22border:0; w=
idth:0; height:0;=22 src=3D=22https://link.getmailspring.com/open/10A40BD=
C-1950-4728-B=463A-C96E9535DA95=40getmailspring.com=3Fme=3D2a4b90d6&amp;r=
ecipient=3DcWVtdS1hcm1Abm9uZ251Lm9yZw%3D%3D=22>
--5f63a7af_171a186f_2084--

