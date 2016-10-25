Received: by 10.80.166.35 with SMTP id d32csp3195347edc;
        Tue, 25 Oct 2016 06:38:35 -0700 (PDT)
X-Received: by 10.237.48.164 with SMTP id 33mr20088311qtf.95.1477402715688;
        Tue, 25 Oct 2016 06:38:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si13550409qtu.127.2016.10.25.06.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 06:38:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz1w2-0008NR-Ub
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 09:38:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz1tE-00067G-FR
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 09:35:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz1t9-0001al-Ld
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 09:35:40 -0400
Received: from mail-ua0-x22d.google.com ([2607:f8b0:400c:c08::22d]:33555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bz1t9-0001aW-9l
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 09:35:35 -0400
Received: by mail-ua0-x22d.google.com with SMTP id 6so33124147uat.0
	for <qemu-arm@nongnu.org>; Tue, 25 Oct 2016 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WNwoS/bfheWt2sfMN2Py2tbuGgX9CDDBFMlMQbcvAgc=;
	b=RmEm0geDWqN+jzEZcWNHJZ49WQdCpukETrQ/u9WzbSwmGx1I+HD6HPMhpikJTvWU4Q
	5hGlz3hMWakWclcNm30OnsopSegQnlOGoDYdcpppq14Phlwl+tk5kdhZ9C0MJ1pkMyyx
	9U/mcgXGtIiPKGunrqa6NzIw1p4XTRAViToUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WNwoS/bfheWt2sfMN2Py2tbuGgX9CDDBFMlMQbcvAgc=;
	b=cEMLWEz3BlQh6IZ9zvf9zyt5UaQTVR3yDT7/PW35SJZfM93ROC1WYE8g29js5QIwpF
	mAKtkEj+Z+JHPV4PpsjejGNItepzc98uRfYya7UJcUz3z2otKwLgswisfoklvtDsquFV
	zI5GicamSLQ+Cn6qvb7vyUFvnlX0Ef2CnkQg6pQJ+6A6rPnHEG7BBdIDAKViWJx0/Zwx
	e9ITmiz6zSwVdfOk2LRtWF+zqklv6LyQO2ZG5Nxf08AwC7vfdVQCGETaRVScxJy21Nt0
	/yNmUkdP9RMRP6peCLIwE5WL2eyGnHynCrVyuKJCD5ndOUwsdpLxnYzuejecwC2nabif
	gKuA==
X-Gm-Message-State: ABUngvdOQ3YD2xp0EUIohUDjL4teiz32Abi58W2W/XRzjl6SMCgQfGX4eoNpgjckuQHyn1mdDRln1W4VRgUW37pd
X-Received: by 10.176.67.196 with SMTP id l62mr175547ual.164.1477402534478;
	Tue, 25 Oct 2016 06:35:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 25 Oct 2016 06:35:13 -0700 (PDT)
In-Reply-To: <1477398120-9000-1-git-send-email-ppandit@redhat.com>
References: <1477398120-9000-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2016 14:35:13 +0100
Message-ID: <CAFEAcA-UT0Xj9YyyHzbO=69HDwVkOYeqPo7K9S+Ja0U7E4KZFg@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22d
Subject: Re: [Qemu-arm] [PATCH] net: smc91c111: check packet number and data
 register index
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
Cc: Azure Yang <azureyang@tencent.com>, Jason Wang <jasowang@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Qemu Developers <qemu-devel@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OU6SKK2kMfYh

On 25 October 2016 at 13:22, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> SMSC91C111 Ethernet interface emulator has registers to store
> 'packet number' and a 'pointer' to Tx/Rx FIFO buffer area.
> These two are used to derive an address to access into 'data'
> registers. If they are not set correctly, they could lead to
> OOB r/w access beyond packet 'data' area. Add check to avoid it.
>
> Reported-by: Azure Yang <azureyang@tencent.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/net/smc91c111.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
> index 3b16dcf..2425da1 100644
> --- a/hw/net/smc91c111.c
> +++ b/hw/net/smc91c111.c
> @@ -418,7 +418,7 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
>              /* Ignore.  */
>              return;
>          case 2: /* Packet Number Register */
> -            s->packet_num = value;
> +            s->packet_num = value & (NUM_PACKETS - 1);

This is inconsistent with how we handle out of range
packet numbers read from the rx_fifo[] in the read/write code
below. Here we are effectively masking to squash the value
into range, but below we will ignore a write or read as 0x80
if there is an out of value packet number. Unfortunately the
data sheet doesn't say how bad packet numbers are handled,
but we should probably try for consistency.

The data sheet says that there are 6 valid bits in the
packet number register, not 3, which suggests masking to
NUM_PACKETS-1 here isn't the right thing.

Q: what about attempts to use packet numbers that have not
been allocated by the 91c111's MMU ?

>              return;
>          case 3: case 4: case 5:
>              /* Should be readonly, but linux writes to them anyway. Ignore.  */
> @@ -444,7 +444,10 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
>                  } else {
>                      p += (offset & 3);
>                  }
> -                s->data[n][p] = value;
> +                if (n < NUM_PACKETS
> +                    && p < sizeof(s->data[n]) / sizeof(s->data[n][0])) {
> +                    s->data[n][p] = value;
> +                }
>              }
>              return;
>          case 12: /* Interrupt ACK.  */
> @@ -590,7 +593,12 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
>                  } else {
>                      p += (offset & 3);
>                  }
> -                return s->data[n][p];
> +
> +                if (n < NUM_PACKETS
> +                    && p < sizeof(s->data[n]) / sizeof(s->data[n][0])) {

This looks like it's reinventing ARRAY_SIZE(s->data[n]).
In any case, rather than doing this check on p I would
suggest that we should do:

                p = s->ptr;
                if (s->ptr & 0x4000) {
                    s->ptr = (s->ptr & 0xf800) | ((s->ptr + 1) & 0x7ff);
                } else {
                    p += (offset & 3);
                }
                p &= 0x7ff;

(ie move the mask operation down a bit), which will ensure p is
always within bounds. Ditto in read code. Perhaps it would be
better to factor out the "find the address in the data buffer"
code since it's fairly long and duplicated between read and write
paths.

> +                    return s->data[n][p];
> +                }
> +                return 0x80;

Why 0x80 ?

>              }
>          case 12: /* Interrupt status.  */
>              return s->int_level;

There's also an access to s->data[] in smc91c111_do_tx() which needs
some kind of guard.

smc91c111_release_packet() also assumes the packet number it
is passed is sane.

Do we need to guard against bad packet numbers in incoming
VMState data? The answer is no if we're using the "always
check packet_num at point of use" approach, but yes if you're
trying to ensure s->packet_num is always a valid value.

Do we need to sanitize s->allocated in incoming vmstate data?

thanks
-- PMM
