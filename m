Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2918319qvm;
        Mon, 20 Jan 2020 05:59:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqyb1VVcBf33S7SqOpgX2fHX8PbjrbgsqWSKLmXxqa6pM2cJh9MmocnqVRc8R1nq1caNWucL
X-Received: by 2002:ae9:f819:: with SMTP id x25mr51413379qkh.192.1579528752367;
        Mon, 20 Jan 2020 05:59:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579528752; cv=none;
        d=google.com; s=arc-20160816;
        b=wx1nq2PskNDBVwclMJ+ZYrVblvNavLnZeEXXbhY1m2PpvX0sevW1Fm15FHE5gmBSgX
         muMr5a0ARhdB78O+xPZiDe8Zh/y3PnJnYgrhRMSOrQGdXWVe87E5kRPtylsJiXfJ03Rr
         FR8OHl33ocIKHHW9skpd2JCBp3XVSywuuMRDotHGr84JdHpCN4dKBdajsUTpHl5gIWYS
         EgqH5V3c3GWpDuZ+xAN8bbKEiv44alf1N70E4LDjFapIgGlUKujF+kzhMhurahD1keIO
         D3WANi9Wxi4hHr9PPODfoGQAdjMllkk3KGELU5XSmw3bYoL4VCxbDGtPZEUpTGgX1thy
         irsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jEgzaPkCNNQ5N+IGF5UyFuBEb2jf5dAPic+nQbNMIH0=;
        b=E5Nn+fS80kUwI47Dw0on1kHFzHr3vY8qf8TsGij2dWAvtrB8LO0yIc8YLUxFYWrsOs
         AMmMXgvZCsOlp/0olx4rOlo6xobQE46jwpL4oDrdXSPscUk6koI9zC4/J0YVyjNzJC40
         D1q7GiDkkwJj4auyUCVx3hHq/o+FNrAlgG3tY3nR1R6SCY2w+eLiPbmtTuygYiHnWvqy
         3LaPh+OxXNxjFcto0gyd+g4vkguT8x/NcQWkIrumZyza5XO592rLjuZp01O5CEZzbdp6
         GMzQGNBq7LKABbQxoOyEKIVnTpnjLjSgjD/dsC7bPVYQDNqX0nNHF5nbp6ZKRwC4AHh4
         hiHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ciYy3VL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c44si20291431qte.279.2020.01.20.05.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 05:59:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ciYy3VL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itXaB-00027z-8c
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 08:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itXZy-00027C-Dy
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:58:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itXZw-0006Yz-VF
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:58:58 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:32918)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itXZw-0006YI-OY
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:58:56 -0500
Received: by mail-ot1-x32c.google.com with SMTP id b18so28780857otp.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jan 2020 05:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jEgzaPkCNNQ5N+IGF5UyFuBEb2jf5dAPic+nQbNMIH0=;
 b=ciYy3VL5ceqeOlIoSShkReD3+Jh2ynD2ReZnUPMlt3diTBhNZ0dSTyJUS0IX3/XCHV
 MhWieUh3fc8NDneywqwPs5RCvUsp+8N+xrmhSX/twn2I/EifQazdbMsNxXt7N3/yjYy7
 3PyQ09O1DpJycmnw1Re4Wfsy/gBZDdUphm4gEEN/8rJQl8e3e4y6xx34d+JXTpLRVAKg
 QsuAyuE1+eEOKfGCCJw8IXJYt9UscsXgpu7avtpS5+Ax07cUsFgs1NtgUL6li/ySZQ4R
 v9+nD7UwHJeEvqmaGbxRH8TMydnK0EEkE9NMP77Tj018BDMg3j01sBDJEFzHlM+xY6EE
 RoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jEgzaPkCNNQ5N+IGF5UyFuBEb2jf5dAPic+nQbNMIH0=;
 b=YVdg3UhM5OpuRky9L3QAZA2vgnn+oRLds6aXqWTksdt39huoZTXFwHEipKB3axrAzu
 VSdemXZfj87SFuuBfuXnWkpwOi2HVUKjHKpIw17RIwfX0O5dyYQH99mm4x82lLvvy7SW
 tW3fxnm73qrFcKDXm6TbIdCIZ2Pf1JdsDg/jsU+cPtcgtWXYeCs7YsFvfxoCTpaZR8ge
 Au2iN0TQiPHcrrLKpJBByXzHM/9R4/Ek/YZmBXDHMqPb4j5gakbT3sGtYAmd1HMGNKWO
 rFdwfBrGv1EX2SN2J3yoAYmD7b6ByVZ4uKrJPCJhucemHW2FE7M4rdcJdmHYg0OEU9lN
 y2Ag==
X-Gm-Message-State: APjAAAVD09hppTechxTJ81pO8ibY6C/mRSNt0LqWivikLvyLhpMwGi86
 NouBUgxwle8aYM7AoOy5ekSquJ0QUUteS9Ei29ffpw==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr16017040otd.91.1579528735484; 
 Mon, 20 Jan 2020 05:58:55 -0800 (PST)
MIME-Version: 1.0
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-6-linux@roeck-us.net>
In-Reply-To: <20200118164229.22539-6-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jan 2020 13:58:44 +0000
Message-ID: <CAFEAcA9kK7mK=FQRKc0sDL8rZzibYov9Xm__+-MA06ERCotZ1Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hw/char/exynos4210_uart: Implement Rx FIFO level
 triggers and timeouts
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32c
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t1ieD81+fE9V

On Sat, 18 Jan 2020 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The driver already implements a receive FIFO, but it does not
> handle receive FIFO trigger levels and timeout. Implement the
> missing functionality.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Call exynos4210_uart_rx_timeout_set() from new post_load function
>     to set the receive timeout timer.
>     Add timer to vmstate_exynos4210_uart.
>
>  hw/char/exynos4210_uart.c | 122 ++++++++++++++++++++++++++++++--------
>  hw/char/trace-events      |   3 +-
>  2 files changed, 99 insertions(+), 26 deletions(-)

Since the timeout value depends on s->wordtime, and
exynos4210_uart_update_parameters() can change s->wordtime,
do you need to recalculate the timeout at that point?
This would correspond to if the guest wrote to the
UBRDIV/UFRACVAL/ULCON registers, I think. Maybe this comes
under the heading of "undefined behaviour if the guest does
this odd thing" ? (The exact behaviour of the h/w is probably
undocumented and mildly painful to emulate exactly, so it's
hard to see why QEMU should care about getting it exactly right.)

I did also wonder whether writing the same value to the UCON
timeout-interval field repeatedly really does restart the timer
counting down from 8*(N+1) frames again, but again maybe that's
just weird for a guest to do.

> @@ -553,6 +620,7 @@ static const VMStateDescription vmstate_exynos4210_uart = {
>                         vmstate_exynos4210_uart_fifo, Exynos4210UartFIFO),
>          VMSTATE_UINT32_ARRAY(reg, Exynos4210UartState,
>                               EXYNOS4210_UART_REGS_MEM_SIZE / sizeof(uint32_t)),
> +        VMSTATE_TIMER_PTR(fifo_timeout_timer, Exynos4210UartState),
>          VMSTATE_END_OF_LIST()
>      }
>  };

Unfortunately you can't simply add entries to a VMStateDescription:
it breaks migration compatibility.

The choices here are:
 * the nicest approach if it works is that in the post_load
function you just recalculate the timer timeout. Then there's
no need to migrate the current state of the timer. (In fact
it looks like your code does do this in post_load.)
 * if something really does need adding to the migration state,
then the version_id and minimum_version_id need to be bumped
(so migration fails cleanly rather than confusingly).
 * if you want migration to continue to work across versions
(which we don't care about for the exynos boards but does
apply for boards like 'virt'), this can be done by adding
a 'subsection' to the vmstate.

I think the answer in this case is just "you don't need to
add this line to the vmstate at all". (This does mean that
a vmsave/vmload will slightly extend the rx-timeout and
delay the interrupt because we re-calculate the timer,
but I guess that's OK. If you don't like that and would
prefer the timer to retain the exact timeout value across
migration, then keep the new vmstate array entry, bump the
version fields, and don't call exynos4210_uart_rx_timeout_set()
in post-load.)

thanks
-- PMM
