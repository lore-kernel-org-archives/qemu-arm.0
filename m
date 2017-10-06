Received: by 10.223.197.9 with SMTP id q9csp1678126wrf;
        Fri, 6 Oct 2017 06:57:28 -0700 (PDT)
X-Received: by 10.200.41.38 with SMTP id y35mr2907844qty.216.1507298248446;
        Fri, 06 Oct 2017 06:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507298248; cv=none;
        d=google.com; s=arc-20160816;
        b=xM6ZrEq59559HqNsM1dV0Y7OfhyPDEKQUM3CGI1o2TTFEXfPZ65wgdeZpjhQXdBLw0
         wMiJPuGBgf1B/5sydEQcdHAvTGb08at4u23YdXPJ0EnfYLnEtMlIbkkSbyVCWQWHuTmS
         NEOPthmo4xFlc/dvWRwt/x5ce1bYo31WcgMj2zrTaC2oVbbcuO3Jg21oxqpd5+QTiMVC
         0iL6TQjQ1vO75aGnqjHBhyaPHKiN9XhAE84I6UGDJwf8BB3QEHoqpeULWRavvXR4J7Vy
         giGv8CY7r7uVMHeJOJFCgbAnseZntnfS4/aWiv+4IWPrIdJj0ARvH/GdltJtUzwipCsd
         Yx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dzNrkPpoXmQvU/hkvxbwyGnMm/CcARh5nhXUwD8rZ1E=;
        b=YUyY5l4Qgotw/koBiWrHfADkR8iX4rL6xz5NP7qPTYSFgl2iJVyfJsfjoEL+R8KDh3
         5TX1ChoLykjgFe6Qv8EMJ6zrJm+ZlH44lnawQe/bAYSl3IDgRrnB+RQZLfm/gU9W6XLM
         tb8K8IVsVjQlDfsULk5Dl10UEiCxTRNF+Y0hWT1PZP7wDRkVTjdGjJ1S5f3FsHo3FJj6
         a3Ln2cxhQ47XcDSYmU3dDmySgi7yWTus/h1o/m888NQ7DVsUKb5Sh/0uJLODpu2/MCOd
         qQ7fctPy8QKVnwOvYS6emvbvr4VGZX6Qv+F5ydgTijFM1nhEUBV762if2Mcg5hpGosxi
         YXRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iOwkzE1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1si1183058qkd.373.2017.10.06.06.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 06:57:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iOwkzE1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0T83-0008Ah-UO
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 09:57:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0T7u-00089e-Ks
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:57:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0T7t-00047s-Ai
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:57:18 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:49220)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0T7s-00046c-Ul
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:57:17 -0400
Received: by mail-wr0-x22b.google.com with SMTP id p10so11294829wrc.6
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dzNrkPpoXmQvU/hkvxbwyGnMm/CcARh5nhXUwD8rZ1E=;
	b=iOwkzE1YZrykQOO2TUX+TquxEu22z7ysjnthm5HAEhZ/2iFm0dZPlUjR/fUJONfzjz
	mwvn2u+13lGLqPGvT0euIVGyTkenfo9Fd9vraugY4wETJcvE7IQBxCzGZEwRmV4uD9KI
	hxNPavm4pGL4yRQTXrw4aaegSnYQZdxbIiANc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dzNrkPpoXmQvU/hkvxbwyGnMm/CcARh5nhXUwD8rZ1E=;
	b=fvbZlVRLKxTQuJokbFOziD8hfV7AtPqFSxQdYCaJUAtjx4++gGyMM97LMUpRPZnjOC
	eVPJhynlTqCXW6bBNHOAYJAVuvdYXzjla8WvIwOa84YHdLB9dsGO0ARHZzQQZWOd6sja
	DTgoukJiV4kYb87v7q7PUwPUsny3cBNJ9WHNPH0T+0fWbfAE29Z92woUGxX/MGAr7u/S
	6HtmX8ThCZ05xjkhD1fr6RciGup/U/68KugWmz5hnyEj4kL1P08ONA6uuyGQD/l2sfWA
	bSg8V1BquxXdLPabdGEs5y7Y3vhpw3LtBmNKkeZj226qYBqYb0c/uszJtNjbCRmdG0Lc
	w1+w==
X-Gm-Message-State: AMCzsaXsJSoHsxXA2rSN7KyPTq+2Yks50hvPUf3/7RJOmFSyfdYeJgao
	/UYgIzzE9MLRdSF9CjzvYv8YaNIRYskBWYWhkPRJnw==
X-Google-Smtp-Source: AOwi7QAeLJiacvLZTfBcb0xhS1R5DV6zgJmqHj31LPgN/uq2qLgYH7bYS0x04TLX9qKmj/AglNaFGLeMwyGSZzDjeuw=
X-Received: by 10.223.175.56 with SMTP id z53mr2378767wrc.177.1507298235737;
	Fri, 06 Oct 2017 06:57:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 06:56:55 -0700 (PDT)
In-Reply-To: <20170918195100.17593-5-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-5-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 14:56:55 +0100
Message-ID: <CAFEAcA-_E2aV78AnODfAvjObYpHdWXwxBxJLHDR9qS8yR9YM3g@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-arm] [PATCH 04/17] imx_fec: Change queue flushing
 heuristics
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /vDbAy7q1BTm

On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> In current implementation, packet queue flushing logic seem to suffer
> from a deadlock like scenario if a packet is received by the interface
> before before Rx ring is initialized by Guest's driver. Consider the
> following sequence of events:
>
>         1. A QEMU instance is started against a TAP device on Linux
>            host, running Linux guest, e. g., something to the effect
>            of:
>
>            qemu-system-arm \
>               -net nic,model=imx.fec,netdev=lan0 \
>               netdev tap,id=lan0,ifname=tap0,script=no,downscript=no \
>               ... rest of the arguments ...
>
>         2. Once QEMU starts, but before guest reaches the point where
>            FEC deriver is done initializing the HW, Guest, via TAP
>            interface, receives a number of multicast MDNS packets from
>            Host (not necessarily true for every OS, but it happens at
>            least on Fedora 25)
>
>         3. Recieving a packet in such a state results in
>            imx_eth_can_receive() returning '0', which in turn causes
>            tap_send() to disable corresponding event (tap.c:203)
>
>         4. Once Guest's driver reaches the point where it is ready to
>            recieve packets it prepares Rx ring descriptors and writes
>            ENET_RDAR_RDAR to ENET_RDAR register to indicate to HW that
>            more descriptors are ready. And at this points emulation
>            layer does this:
>
>                  s->regs[index] = ENET_RDAR_RDAR;
>                  imx_eth_enable_rx(s);
>
>            which, combined with:
>
>                   if (!s->regs[ENET_RDAR]) {
>                      qemu_flush_queued_packets(qemu_get_queue(s->nic));
>                   }
>
>            results in Rx queue never being flushed and corresponding
>            I/O event beign disabled.
>
> Change the code to remember the fact that can_receive callback was
> called before Rx ring was ready and use it to make a decision if
> receive queue needs to be flushed.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/net/imx_fec.c         | 6 ++++--
>  include/hw/net/imx_fec.h | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 84085afe09..767402909d 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -544,8 +544,9 @@ static void imx_eth_enable_rx(IMXFECState *s)
>
>      if (rx_ring_full) {
>          FEC_PRINTF("RX buffer full\n");
> -    } else if (!s->regs[ENET_RDAR]) {
> +    } else if (s->needs_flush) {
>          qemu_flush_queued_packets(qemu_get_queue(s->nic));
> +        s->needs_flush = false;
>      }
>
>      s->regs[ENET_RDAR] = rx_ring_full ? 0 : ENET_RDAR_RDAR;
> @@ -930,7 +931,8 @@ static int imx_eth_can_receive(NetClientState *nc)
>
>      FEC_PRINTF("\n");
>
> -    return s->regs[ENET_RDAR] ? 1 : 0;
> +    s->needs_flush = !s->regs[ENET_RDAR];
> +    return !!s->regs[ENET_RDAR];
>  }
>
>  static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf,
> diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
> index 62ad473b05..4bc8f03ec2 100644
> --- a/include/hw/net/imx_fec.h
> +++ b/include/hw/net/imx_fec.h
> @@ -252,6 +252,7 @@ typedef struct IMXFECState {
>      uint32_t phy_int_mask;
>
>      bool is_fec;
> +    bool needs_flush;
>  } IMXFECState;

This looks odd -- I don't think you should need extra
state here. Conceptually what you want is:

 * in the can_receive callback, test some function of
various bits of device state to decide whether you can
take data
 * in the rest of the device, whenever the device state
changes such that you were previously not able to take
data but now you can, call qemu_flush_queued_packets().

You shouldn't need any extra state to do this, you just
need to fix the bug where you have a code path that
flips ENET_RDAR from 0 to 1 without calling flush
(you might for instance have a helper function for
"set ENET_RDAR" that encapsulates setting the state
and arranging that flush is called).

thanks
-- PMM
