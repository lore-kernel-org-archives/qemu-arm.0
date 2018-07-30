Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4260471wru;
        Mon, 30 Jul 2018 15:10:33 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfjwfhb0TEV/uzMqAdQ6kYMFv8Xkf+PoE5vJzusWtFYNwFIiVQox13f/Ov9Ujev282oReT/
X-Received: by 2002:a37:6043:: with SMTP id u64-v6mr16956057qkb.160.1532988633674;
        Mon, 30 Jul 2018 15:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532988633; cv=none;
        d=google.com; s=arc-20160816;
        b=OlUXQDOHlOdmf0g+K2pErr1jiZNWHgN2LFmdY5RDfotUE3sbU31vcCdW8K7QsNRbM4
         W+yyemfy1US03zxvxnfq8QwTJPlgSR8IuadMw3M/I/AFIf/zVH2W1n4E7d9h1I9NgxmP
         RB5kQV7zKXo7Jy8TorOFx8pxKoYHNmd2qdKWhnrG/rFKBYsXh7mDIj9A8abPpEk6tWQo
         rorep/zzXd4IqS22jtQ7m3YNMqTG1bAXPiLNP8pykaJidiDzLtakjno8hY8KfbIzqQWl
         j+HAq7OWMGJxupMPx9BPRyKyhXrCMF9KNsIGUBiGBluxsKog/Zl/ty3LbnHB6Jv2yjau
         MD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RitpSNcFO28KN7LNm029qAjySSkkGmxJ0lKi7QsDfRU=;
        b=BtDOzYKFzIGscM/NuJJKe8VlOuofosW36WNDxELK9YH0ZYJluBUX6G1PGYpSpq77DZ
         Pyqjo4oNiiq9L7FjYPPzRMIYgvo908Lx7Y+7eYmb27x9LRs1XxJrOCj07G2uXxzv0TK7
         vmTP83IJgYw97gRbWc5H72kHCckIDNMgzHLsYxbebI6hbswGbpQVqL9fZMLB6VePXcIp
         9aaHkRDTBeBPHtcY+Xdvyx9oZojdecJdfA+5rwddBdDiksVwQw+Zt2qgJV7Uj30tN47v
         oj2zQ6QrQ++S1HjanyoT2r8WnMPqocow0wX1owp52p+ZiqHSy+jTI8glJJ1slMeQ5MWp
         F1CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EP4LCkXf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g25-v6si1420979qkm.263.2018.07.30.15.10.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 15:10:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EP4LCkXf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkGN7-0002wj-5i
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 18:10:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fkGMx-0002wY-4B
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 18:10:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fkGMv-0005iK-HP
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 18:10:23 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40428)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fkGMv-0005hd-4s; Mon, 30 Jul 2018 18:10:21 -0400
Received: by mail-lj1-x241.google.com with SMTP id j19-v6so11870730ljc.7;
	Mon, 30 Jul 2018 15:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RitpSNcFO28KN7LNm029qAjySSkkGmxJ0lKi7QsDfRU=;
	b=EP4LCkXfJN7BDFCyYHEc9Gn8jSQ1xwObYicFeZl1zqHDfQ54m2LJmASV3iXQwgErJV
	6xRsdwC3OI5eMDwztGLvvWB/SM1TMF5r26hNKWpYVLfZtEoz+Hq4bK+SBZz7466psyvv
	5u8JCyS1N7DKHHVOQhbtXl75ysQVg6tthOsfeuLBaOJhAwdi+kfpAfurKOFjIaR2x7yg
	9yxtw2HtP0MPEawZjz1sd+LddQ9mnDEVPS5D2qEczVPYTBFIJQDt1v0Vq33OB1bB57YC
	dykggQ65S0djMPTxNsQw/AvaVk3ThWecfUVTgD8w9XVBhgz7tSkLMQmXGDKmXypu/fqQ
	ojig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RitpSNcFO28KN7LNm029qAjySSkkGmxJ0lKi7QsDfRU=;
	b=H+tzEmOx6EWHr6bVIj3s+xyO7s7raylD3/fyEgyJhfysXIN8RVQuKHnY9GhlBtkJbT
	V5uwVc7vO7h3q0vou8MTy6YdcKyMR8HWziPyo+SZH8azU7nsI5wjPZ0VqPdX8E+GnzCl
	8CO+WDE89T0rOFQAFqytGiTq46gSGLEVIZoh0K24nTBPHpR5gcYVTMceIhGHeke9rSR9
	SU2rXoBeXpOc3CEBgtbVnHDeIx5Jn5HTJHV8iPxdduHbizF1kB1QcDoGLmK1vbpIDGQk
	zZJCA51U6M98DPrniltFCfeIho17EFK8qGPFdIHKsDcN+2dtTVsmF7Kp6Ono9CA2Nxlh
	e1Yw==
X-Gm-Message-State: AOUpUlGm37BfSoZ7RyxyO6RAgpvkmLi6Popi/XUN5Qh7pQY6dhce4uVq
	A9l+YqxD1suL5Z7pJcEaTq8TWZGuNDUJ8ksqRf8=
X-Received: by 2002:a2e:6d0a:: with SMTP id
	i10-v6mr14842138ljc.145.1532988619554; 
	Mon, 30 Jul 2018 15:10:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3e14:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 15:09:48
	-0700 (PDT)
In-Reply-To: <20180730162458.23186-3-peter.maydell@linaro.org>
References: <20180730162458.23186-1-peter.maydell@linaro.org>
	<20180730162458.23186-3-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Jul 2018 15:09:48 -0700
Message-ID: <CAKmqyKO2oUfSoiqWAA_rOWRzjgHE8om_X9sMuDdcZjgkE3q2Gg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/5] hw/misc/mps2-fpgaio:
 Implement PSCNTR and COUNTER
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HkJbcMm9UuHX

On Mon, Jul 30, 2018 at 9:24 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> In the MPS2 FPGAIO, PSCNTR is a free-running downcounter with
> a reload value configured via the PRESCALE register, and
> COUNTER counts up by 1 every time PSCNTR reaches zero.
> Implement these counters.
>
> We can just increment the counters migration subsection's
> version ID because we only added it in the previous commit,
> so no released QEMU versions will be using it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/misc/mps2-fpgaio.h |  6 +++
>  hw/misc/mps2-fpgaio.c         | 97 +++++++++++++++++++++++++++++++++--
>  2 files changed, 99 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
> index ec057d38c76..69e265cd4b2 100644
> --- a/include/hw/misc/mps2-fpgaio.h
> +++ b/include/hw/misc/mps2-fpgaio.h
> @@ -37,6 +37,12 @@ typedef struct {
>      uint32_t prescale;
>      uint32_t misc;
>
> +    /* QEMU_CLOCK_VIRTUAL time at which counter and pscntr were last synced */
> +    int64_t pscntr_sync_ticks;
> +    /* Values of COUNTER and PSCNTR at time pscntr_sync_ticks */
> +    uint32_t counter;
> +    uint32_t pscntr;
> +
>      uint32_t prescale_clk;
>
>      /* These hold the CLOCK_VIRTUAL ns tick when the CLK1HZ/CLK100HZ was zero */
> diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
> index bbc28f641f0..5cf10ebd66a 100644
> --- a/hw/misc/mps2-fpgaio.c
> +++ b/hw/misc/mps2-fpgaio.c
> @@ -43,6 +43,77 @@ static int64_t tickoff_from_counter(int64_t now, uint32_t count, int frq)
>      return now - muldiv64(count, NANOSECONDS_PER_SECOND, frq);
>  }
>
> +static void resync_counter(MPS2FPGAIO *s)
> +{
> +    /*
> +     * Update s->counter and s->pscntr to their true current values
> +     * by calculating how many times PSCNTR has ticked since the
> +     * last time we did a resync.
> +     */
> +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    int64_t elapsed = now - s->pscntr_sync_ticks;
> +
> +    /*
> +     * Round elapsed down to a whole number of PSCNTR ticks, so we don't
> +     * lose time if we do multiple resyncs in a single tick.
> +     */
> +    uint64_t ticks = muldiv64(elapsed, s->prescale_clk, NANOSECONDS_PER_SECOND);
> +
> +    /*
> +     * Work out what PSCNTR and COUNTER have moved to. We assume that
> +     * PSCNTR reloads from PRESCALE one tick-period after it hits zero,
> +     * and that COUNTER increments at the same moment.
> +     */
> +    if (ticks == 0) {
> +        /* We haven't ticked since the last time we were asked */
> +        return;
> +    } else if (ticks < s->pscntr) {
> +        /* We haven't yet reached zero, just reduce the PSCNTR */
> +        s->pscntr -= ticks;
> +    } else {
> +        if (s->prescale == 0) {
> +            /*
> +             * If the reload value is zero then the PSCNTR will stick
> +             * at zero once it reaches it, and so we will increment
> +             * COUNTER every tick after that.
> +             */
> +            s->counter += ticks - s->pscntr;
> +            s->pscntr = 0;
> +        } else {
> +            /*
> +             * This is the complicated bit. This ASCII art diagram gives an
> +             * example with PRESCALE==5 PSCNTR==7:
> +             *
> +             * ticks  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14
> +             * PSCNTR 7  6  5  4  3  2  1  0  5  4  3  2  1  0  5
> +             * cinc                           1                 2
> +             * y            0  1  2  3  4  5  6  7  8  9 10 11 12
> +             * x            0  1  2  3  4  5  0  1  2  3  4  5  0
> +             *
> +             * where x = y % (s->prescale + 1)
> +             * and so PSCNTR = s->prescale - x
> +             * and COUNTER is incremented by y / (s->prescale + 1)
> +             *
> +             * The case where PSCNTR < PRESCALE works out the same,
> +             * though we must be careful to calculate y as 64-bit unsigned
> +             * for all parts of the expression.
> +             * y < 0 is not possible because that implies ticks < s->pscntr.
> +             */
> +            uint64_t y = ticks - s->pscntr + s->prescale;
> +            s->pscntr = s->prescale - (y % (s->prescale + 1));
> +            s->counter += y / (s->prescale + 1);
> +        }
> +    }
> +
> +    /*
> +     * Only advance the sync time to the timestamp of the last PSCNTR tick,
> +     * not all the way to 'now', so we don't lose time if we do multiple
> +     * resyncs in a single tick.
> +     */
> +    s->pscntr_sync_ticks += muldiv64(ticks, NANOSECONDS_PER_SECOND,
> +                                     s->prescale_clk);
> +}
> +
>  static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      MPS2FPGAIO *s = MPS2_FPGAIO(opaque);
> @@ -74,9 +145,12 @@ static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
>          r = counter_from_tickoff(now, s->clk100hz_tick_offset, 100);
>          break;
>      case A_COUNTER:
> +        resync_counter(s);
> +        r = s->counter;
> +        break;
>      case A_PSCNTR:
> -        qemu_log_mask(LOG_UNIMP, "MPS2 FPGAIO: counters unimplemented\n");
> -        r = 0;
> +        resync_counter(s);
> +        r = s->pscntr;
>          break;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,
> @@ -107,6 +181,7 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
>          s->led0 = value & 0x3;
>          break;
>      case A_PRESCALE:
> +        resync_counter(s);
>          s->prescale = value;
>          break;
>      case A_MISC:
> @@ -126,6 +201,14 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
>          now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>          s->clk100hz_tick_offset = tickoff_from_counter(now, value, 100);
>          break;
> +    case A_COUNTER:
> +        resync_counter(s);
> +        s->counter = value;
> +        break;
> +    case A_PSCNTR:
> +        resync_counter(s);
> +        s->pscntr = value;
> +        break;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "MPS2 FPGAIO write: bad offset 0x%x\n", (int) offset);
> @@ -150,6 +233,9 @@ static void mps2_fpgaio_reset(DeviceState *dev)
>      s->misc = 0;
>      s->clk1hz_tick_offset = tickoff_from_counter(now, 0, 1);
>      s->clk100hz_tick_offset = tickoff_from_counter(now, 0, 100);
> +    s->counter = 0;
> +    s->pscntr = 0;
> +    s->pscntr_sync_ticks = now;
>  }
>
>  static void mps2_fpgaio_init(Object *obj)
> @@ -170,12 +256,15 @@ static bool mps2_fpgaio_counters_needed(void *opaque)
>
>  static const VMStateDescription mps2_fpgaio_counters_vmstate = {
>      .name = "mps2-fpgaio/counters",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .needed = mps2_fpgaio_counters_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_INT64(clk1hz_tick_offset, MPS2FPGAIO),
>          VMSTATE_INT64(clk100hz_tick_offset, MPS2FPGAIO),
> +        VMSTATE_UINT32(counter, MPS2FPGAIO),
> +        VMSTATE_UINT32(pscntr, MPS2FPGAIO),
> +        VMSTATE_INT64(pscntr_sync_ticks, MPS2FPGAIO),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> --
> 2.17.1
>
>
