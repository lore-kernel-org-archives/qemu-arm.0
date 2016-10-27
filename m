Received: by 10.80.166.35 with SMTP id d32csp658565edc;
        Thu, 27 Oct 2016 07:55:00 -0700 (PDT)
X-Received: by 10.31.86.132 with SMTP id k126mr6531963vkb.11.1477580100193;
        Thu, 27 Oct 2016 07:55:00 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 65si2108072uak.253.2016.10.27.07.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 07:55:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzm55-00008G-5v
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 10:54:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzlyO-0003zp-Di
	for qemu-devel@nongnu.org; Thu, 27 Oct 2016 10:48:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzlyK-0003Zh-He
	for qemu-devel@nongnu.org; Thu, 27 Oct 2016 10:48:04 -0400
Received: from mail-ua0-x229.google.com ([2607:f8b0:400c:c08::229]:33865)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bzlyK-0003ZF-D8
	for qemu-devel@nongnu.org; Thu, 27 Oct 2016 10:48:00 -0400
Received: by mail-ua0-x229.google.com with SMTP id 51so12786674uai.1
	for <qemu-devel@nongnu.org>; Thu, 27 Oct 2016 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+UEZA1GdXjCD6wSBCDNJ6unM2S5FcipH+ZMI1+53I+M=;
	b=QP7ZSdWA8n2glCuvJiUOomMYw7NC1OxNA4diiou7TU5+ZUFZOdTC2t/1fnteQwRFBr
	6lddVzmNpXJuozlacFtBVsoSNLOhhitYKJFdQXaAINAXXBJKyeH+cccDNauzGDGXYr1W
	3YySJauflBGXIS2WAx4nQDCLzVnunaqB4Wa+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+UEZA1GdXjCD6wSBCDNJ6unM2S5FcipH+ZMI1+53I+M=;
	b=aDLVtMLFGRpoddUfIJ7S6r9Q2yWnKD1hauS009iD9wOnA7X5O6tmLLAvhB6zUslkFF
	CAm1pHM07aMIvJJjmezxCV2NZCWg9xbBKB5sQ+K2myGqND3PBbK5MJXakyA3yHaxYKCH
	B75/UCr3Te3oMh6chgzBokqCdObzl0MPU4RfwcAatAFUJgKFbuXZbyceIboEvbB5dc+i
	xfP5SgDgHyKFuxBO1QdnBq9d9DAqMd53I2tWZa6pv8E5EXAXRE9GK67cfT9cOwKfGR7v
	nAJl6LB4gXjmoEwVS4JaLPLkJHO2HzSiKuoBa5yn6HZ3nhYIR9iXqqbkoIDXXyD0+JIx
	P0iA==
X-Gm-Message-State: ABUngvdqh4+9FExR91dgq1DjL98QXSWXXgqux7f/Bc7cgW384ENzlMbXQhPadCqx+MVi0ea//YzUOls/pmU7dLzz
X-Received: by 10.176.80.101 with SMTP id z34mr6490407uaz.140.1477579679607;
	Thu, 27 Oct 2016 07:47:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 27 Oct 2016 07:47:39 -0700 (PDT)
In-Reply-To: <1477512169-7737-1-git-send-email-ppandit@redhat.com>
References: <1477512169-7737-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Oct 2016 15:47:39 +0100
Message-ID: <CAFEAcA9qFZ2zteebogs1HL96OfYJCMAOk7FmEUv3FbdYy8aNiQ@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::229
Subject: Re: [Qemu-devel] [PATCH v3] net: smc91c111: check packet number and
 data register index
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Azure Yang <azureyang@tencent.com>, Jason Wang <jasowang@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Qemu Developers <qemu-devel@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 80Yu17Y9fsNJ

On 26 October 2016 at 21:02, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> SMSC91C111 Ethernet interface emulator has registers to store
> 'packet number' and a 'pointer' to Tx/Rx FIFO buffer area.
> These two are used to derive an address to access into 'data'
> registers. If they are set incorrectly, they could lead to an
> OOB r/w access beyond packet 'data' area. Add check to avoid it.
>
> Reported-by: Azure Yang <azureyang@tencent.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/net/smc91c111.c | 32 ++++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)
>
> Update per: add check to _release_packet and for 's->allocated'
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg06530.html
>
> diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
> index 3b16dcf..e9b37c2 100644
> --- a/hw/net/smc91c111.c
> +++ b/hw/net/smc91c111.c
> @@ -203,6 +203,9 @@ static void smc91c111_pop_tx_fifo_done(smc91c111_state *s)
>  /* Release the memory allocated to a packet.  */
>  static void smc91c111_release_packet(smc91c111_state *s, int packet)
>  {
> +    if (packet >= NUM_PACKETS

Negative numbers ?

> || !(packet & s->allocated)) {

Is this supposed to be checking "is the bit number corresponding
to 'packet' in s->allocated set" ? It doesn't do that.

This change seems likely to break the normal operation of
the device -- how are you testing this patch?

> +        return;
> +    }
>      s->allocated &= ~(1 << packet);
>      if (s->tx_alloc == 0x80)
>          smc91c111_tx_alloc(s);
> @@ -224,6 +227,9 @@ static void smc91c111_do_tx(smc91c111_state *s)
>          return;
>      for (i = 0; i < s->tx_fifo_len; i++) {
>          packetnum = s->tx_fifo[i];
> +        if (packetnum >= NUM_PACKETS || !(packetnum & s->allocated)) {
> +            return;
> +        }

Ditto.

>          p = &s->data[packetnum][0];
>          /* Set status word.  */
>          *(p++) = 0x01;
> @@ -418,7 +424,7 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
>              /* Ignore.  */
>              return;
>          case 2: /* Packet Number Register */
> -            s->packet_num = value;
> +            s->packet_num = value & 0x03F;
>              return;
>          case 3: case 4: case 5:
>              /* Should be readonly, but linux writes to them anyway. Ignore.  */
> @@ -438,13 +444,17 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
>                      n = s->rx_fifo[0];
>                  else
>                      n = s->packet_num;
> -                p = s->ptr & 0x07ff;
> +                p = s->ptr;
>                  if (s->ptr & 0x4000) {
>                      s->ptr = (s->ptr & 0xf800) | ((s->ptr + 1) & 0x7ff);
>                  } else {
>                      p += (offset & 3);
>                  }
> -                s->data[n][p] = value;
> +                p &= 0x07ff;
> +                if (s->allocated < NUM_PACKETS
> +                    && n < NUM_PACKETS && n & s->allocated) {

This condition makes no sense. s->allocated is a bitmap, so
checking whether it is < NUM_PACKETS doesn't do anything
useful.

> +                    s->data[n][p] = value;
> +                }
>              }
>              return;
>          case 12: /* Interrupt ACK.  */
> @@ -517,7 +527,8 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
>                  int i;
>                  int n;
>                  n = 0;
> -                for (i = 0; i < NUM_PACKETS; i++) {
> +                for (i = 0;
> +                     s->allocated < NUM_PACKETS && i < NUM_PACKETS; i++) {

This isn't doing anything sensible either.

>                      if (s->allocated & (1 << i))
>                          n++;
>                  }
> @@ -558,9 +569,9 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
>          case 0: case 1: /* MMUCR Busy bit.  */
>              return 0;
>          case 2: /* Packet Number.  */
> -            return s->packet_num;
> +            return s->packet_num & 0x3F;

No point masking on register-reads.

>          case 3: /* Allocation Result.  */
> -            return s->tx_alloc;
> +            return s->tx_alloc < NUM_PACKETS ? s->tx_alloc : 0;
>          case 4: /* TX FIFO */
>              if (s->tx_fifo_done_len == 0)
>                  return 0x80;
> @@ -584,13 +595,18 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
>                      n = s->rx_fifo[0];
>                  else
>                      n = s->packet_num;
> -                p = s->ptr & 0x07ff;
> +                p = s->ptr;
>                  if (s->ptr & 0x4000) {
>                      s->ptr = (s->ptr & 0xf800) | ((s->ptr + 1) & 0x07ff);
>                  } else {
>                      p += (offset & 3);
>                  }
> -                return s->data[n][p];
> +                p &= 0x07ff;
> +                if (s->allocated < NUM_PACKETS
> +                    && n < NUM_PACKETS && n & s->allocated) {
> +                    return s->data[n][p];
> +                }
> +                return 0;
>              }
>          case 12: /* Interrupt status.  */
>              return s->int_level;
> --
> 2.7.4

thanks
-- PMM
