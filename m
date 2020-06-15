Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1587304lfm;
        Mon, 15 Jun 2020 04:04:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrMkwG6kfiZ9GFJjKhh3ey0P9gBfmPctFhj6yOoWYHdkhOu2siMiI0IpmPI2n9dIHAq/jY
X-Received: by 2002:a25:2488:: with SMTP id k130mr42188024ybk.241.1592219095824;
        Mon, 15 Jun 2020 04:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592219095; cv=none;
        d=google.com; s=arc-20160816;
        b=lRd4A5JkgSS0Gc23+HVwt5+Wqo77pa++Y+kFNOMy1DTX1IifmH4WOuAGO12rTfwP67
         HsDP60s/fhwh5UroBmadF1Uo7JOXhz5pot8ZwUG1fT3nELv/pB8z5T9gI/3ZSTxjZikA
         KCA/MR0IEv5C3tyCMkI5pf+sdY632/ul1nE9YtadWJ43kaNAH1r5y2FLJ3/rbJVgoiM5
         ZIpdnIh0oh0eCyY5I1e94KhJVLBGOGpAdBI/eXhmOpG6DUs26tWA5xqbEu5Yt1S4cP/F
         GYQFPJeCZJ8jKbDHQCcfUNtibviF0AKIIU2DyKOn0uutyah+BSiGM0AhynwZn8upKn2B
         O7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IVf/Kn5dhClrebtEPL3ia6ygu/P0VQbssj01F791Qlc=;
        b=BJVXdadZabiPJPqQ/cniOKowQXDk4a0DV8UqvLKfpWzVT6/E5eT3XpepyCz2QM/QPN
         JDSYkwga7o4nEilKPrYK9o+CvYyw01edQiDhxSGTgersx6wEjL7Ic+h5lsXZO7kZR8bO
         a+rQWYevD8SUiFuVMj9iv/7cqu7qgpkipZuLOnavL5qdSgdrLH2/thI2W/4qk89WUFXk
         DxwHoNKf3cfaV9R9+FmXWLoPkhBg/By/scQdjqtciSWu4yAmHDICRAa5Nf5IrBQDbbHv
         rbvGU1FbHJP/Os311tAdhgN9sE2ZKDdi6211b087CLZxjrQb7xSIhX9n2tkM/a+2KViW
         IEmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M6QQ/DCk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j81si13104840ybg.136.2020.06.15.04.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 04:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M6QQ/DCk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkmv9-00081O-7n
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 07:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkmuu-000806-Mq
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 07:04:40 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkmus-0003b5-3c
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 07:04:40 -0400
Received: by mail-oi1-x243.google.com with SMTP id a21so15480133oic.8
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 04:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IVf/Kn5dhClrebtEPL3ia6ygu/P0VQbssj01F791Qlc=;
 b=M6QQ/DCkWsWdbZQZRQ27lCPMGYEgd7+TckUk+k/R7ktyghdsbBHaQDGNndJ6JEkDWl
 GstVPNM906UC1ZCyVPbhcdhrYvOP4C5LudMNjKQb7lCO2G44t79tdVK56encpRLUq6Iq
 neju4Wjm/n7OlDQVpGTJEhVY1vjenKikdv4PrOkk++pb75JUZGNN0ObSsdqmwxMKB8FI
 YPulanHhH6aQxjOw8BmiO0HkGDPNEg34CQyBaDQV+QXTXtQWxhW/Wd7AVe36Ani/CYBQ
 y45h3Y8+bPAI5cnmm9eP1nF3W49DAFicJVf6A4+6uGNgBxV0ss4Xq7trJ1diLnWB5JZP
 irew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVf/Kn5dhClrebtEPL3ia6ygu/P0VQbssj01F791Qlc=;
 b=GopMQM7N2tDj3xKOisCgD2W9njdzIVY7pXQsIeC+4e7LoXwUho2QNWVaau4pF43A5R
 hqpLWKbvQP94Pr2PufcgkKwvJElU435uANhExdqVY4SfZ4mhBWNlC89/tLXS9d20QFZv
 ipKAgzFek/zJA43VLWJr+OI+kAVwCFSR/rqTEl5F25Fc0N+tYgNO98jK7TTapoe8fuHg
 zueKib2oS3uT8GRCrua8MSD6NgP2xlB9CtOGcvW8rJNVpFUHqG6K2EUfFqhYo2dkYup8
 deuavP1fOUW9qTQ3u5egL1sTP+PrX+4bQNFMoid6gjJjkA4TAe/7iOPgWTnytkYPsQEI
 mVuA==
X-Gm-Message-State: AOAM532TtWdAknRwXZNL9xWfDc1NNx+5aqc+FRC5Uo+C9TNNghWsMpAI
 La7NO1NTnX7ElPvqeasgIjAqYuTsX7jUrEjU95/1/w==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr8348577oia.163.1592219076585; 
 Mon, 15 Jun 2020 04:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200610084551.28222-1-vav@sysgo.com>
In-Reply-To: <20200610084551.28222-1-vav@sysgo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 12:04:25 +0100
Message-ID: <CAFEAcA9uF01LnFy6o4Yy=aeuy9ixyGWZFVGtR66ah3w1458O5g@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/a9gtimer: Clear pending interrupt, after the
 clear of Event flag
To: Vaclav Vanc <vav@sysgo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FpT6YxTkMpNC

On Wed, 10 Jun 2020 at 09:47, Vaclav Vanc <vav@sysgo.com> wrote:
>
> A9 Global Timer is used with Edge triggered interrupts (This is true
> at least for Zynq and i.MX6 processors).
> When Event Flag is cleared in Interrupt Status Register and new interrupt
> was supposed to be scheduled, interrupt request is never cleared.
> Since interrupt in GIC is configured as Edge triggered, new interrupts
> are not registered (because interrupt is stuck at pending and GIC thinks
> it was already serviced). As a result interrupts from timer does not work
> anymore.
>
> Note: This happens only when interrupt was not serviced before the next
> interrupt is suppose to be scheduled. This happens for example during
> the increased load of the host system.
>
> Interrupt is now always cleared when Event Flag is cleared.
> This is in accordance to A9 Global Timer documentation.
>
> Signed-off-by: Vaclav Vanc <vav@sysgo.com>
> ---
>  hw/timer/a9gtimer.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
> index 7233068a37..732889105e 100644
> --- a/hw/timer/a9gtimer.c
> +++ b/hw/timer/a9gtimer.c
> @@ -206,6 +206,9 @@ static void a9_gtimer_write(void *opaque, hwaddr addr, uint64_t value,
>      case R_INTERRUPT_STATUS:
>          a9_gtimer_update(s, false);
>          gtb->status &= ~value;
> +        if (gtb->status == 0) {
> +            qemu_set_irq(gtb->irq, 0);
> +        }
>          break;

Hi; thanks for this patch. I can see the situation you're trying to address,
but I can't find anything in the docs that convinces me that this change
is the right way to fix it.

The problem we have is that the a9_gtimer_update() function (which is
going to get called after this code at the end of the a9_gtimer_write()
function) updates the gtb->status bit based on whether the timer has
currently passed the compare value. So effectively we do the "has the
count gone past the compare value" check not only when the timer expires
but also at every register write. My best guess is that the real hardware
only does an expiry-check when it does a counter value update. If that's
the case then in the situation you outline the guest clearing the event
flag should mean that the interrupt is not re-asserted until the counter
next increments past the compare value (ie not for a little while) whereas
with your patch it will be instantly re-asserted.

(Unfortunately the A9 TRM is not clear on the behaviour here. It would
probably be possible to write some test code to check the real h/w
behaviour.)

thanks
-- PMM
