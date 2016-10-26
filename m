Received: by 10.80.166.35 with SMTP id d32csp68893edc;
        Wed, 26 Oct 2016 06:34:42 -0700 (PDT)
X-Received: by 10.31.106.194 with SMTP id f185mr1022635vkc.118.1477488882206;
        Wed, 26 Oct 2016 06:34:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si699946uas.13.2016.10.26.06.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 06:34:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzOLp-0002Ym-H1
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 09:34:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzOLd-0002Ua-1w
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 09:34:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzOLY-0000xR-5y
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 09:34:28 -0400
Received: from mail-ua0-x232.google.com ([2607:f8b0:400c:c08::232]:39502)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bzOLY-0000xG-15
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 09:34:24 -0400
Received: by mail-ua0-x232.google.com with SMTP id 20so4633143uak.6
	for <qemu-arm@nongnu.org>; Wed, 26 Oct 2016 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OdCdF627d5UAJ5v3udhh1mAVVtkQfAQ3IxcBt3Zh9lc=;
	b=Dff5c/HUrLkto7/2GwvhHyijKbuA5QWy4RK0YTFI5EmhJyO0T6buBzXsn6dSbW06kV
	unCK6fg/ugcQLbgUNDZYMt4dinbUvDCIgt4sl+0h26pBIgK5EC3yTYR0/a3xbxdf4i8S
	ZEKwbY5E1HDEWmA+tlFr9kZ2koTjqsBR3wdZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OdCdF627d5UAJ5v3udhh1mAVVtkQfAQ3IxcBt3Zh9lc=;
	b=TQ8UmPMP9IbSieLaWj+/S88ej9DlcVtXny0MOdJ+pEjsUfhrXDBEgYFpgsvAte9OFr
	3elP5Y4PuwSTVcD0wIzKJmtA3kABoAZWfFPJmV6dprHQ51AnDWkCYY75+qERmI7z8WZh
	oxu1tlqCLVwN3yOVk2kIvXYEehVR2b8UIcGhJPvWZWTF0K15jYWMjbed5kBuUxCz6YGs
	b+PMYZAGMOzb2MpRtSlYOTdCowmS3kN/w4OmJsMhZsO9KErXxnZoyROwsIdnyvS9EUf4
	GfnIFvUdxG3ggWXaUzMtdSPI+sb51GIP2KM9yezl/OEp/q2nQYTmyN+VoTEbv5VONkxM
	sZ2w==
X-Gm-Message-State: ABUngvfbW1E13RQllo0DDGLQ0p4Pkd2U8bVWBvo4eOgu4E1ba/M9jGQ9jAPq2nuTe3GqCx4auGaHS5sic+p5cmN3
X-Received: by 10.176.2.50 with SMTP id 47mr1064493uas.8.1477488863006; Wed,
	26 Oct 2016 06:34:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 26 Oct 2016 06:34:02 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610261749330.346@wniryva>
References: <1477398120-9000-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA-UT0Xj9YyyHzbO=69HDwVkOYeqPo7K9S+Ja0U7E4KZFg@mail.gmail.com>
	<alpine.LFD.2.20.1610261749330.346@wniryva>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Oct 2016 14:34:02 +0100
Message-ID: <CAFEAcA8L2Yy14OkPOEMZD5zg6J7PVgf4sWdehUHUHhpDEnmJBQ@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::232
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
	qemu-arm <qemu-arm@nongnu.org>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M8KvV9LZvA28

On 26 October 2016 at 13:33, P J P <ppandit@redhat.com> wrote:
>   Hello,
>
> +-- On Tue, 25 Oct 2016, Peter Maydell wrote --+
> | >          case 2: /* Packet Number Register */
> | > -            s->packet_num = value;
> | > +            s->packet_num = value & (NUM_PACKETS - 1);
> |
> | The data sheet says that there are 6 valid bits in the
> | packet number register, not 3, which suggests masking to
> | NUM_PACKETS-1 here isn't the right thing.
>
>   NUM_PACKETS macro is used at most places to limit access into 'data' array.
>
> | Q: what about attempts to use packet numbers that have not
> | been allocated by the 91c111's MMU ?
>
>   Added 'n & s->allocated' in patch v2.
>
> | In any case, rather than doing this check on p I would
> | suggest that we should do:
> |
> |                 p = s->ptr;
> |                 if (s->ptr & 0x4000) {
> |                     s->ptr = (s->ptr & 0xf800) | ((s->ptr + 1) & 0x7ff);
> |                 } else {
> |                     p += (offset & 3);
> |                 }
> |                 p &= 0x7ff;
> |
> | (ie move the mask operation down a bit), which will ensure p is
> | always within bounds. Ditto in read code.
>
>   Done in patch v2.
>
>
> | > +                return 0x80;
> |
> | Why 0x80 ?
>
>   Changed it to 0.
>
> | There's also an access to s->data[] in smc91c111_do_tx() which needs
> | some kind of guard.
>
>   Rotuine 'smc91c111_queue_tx' which calls 'smc91c111_do_tx' has a guard in
> place before calling _do_tx,

The queue_tx function checks s->tx_fifo_len (because
it's about to put something into s->tx_fifo[]), but it
does not check anything about the values it puts into
tx_fifo[]. The do_tx function then does
   packetnum = s->tx_fifo[i];
   p = &s->data[packetnum][0];
where packetnum could be out of bounds.

>     static void smc91c111_queue_tx(smc91c111_state *s, int packet)
>     {
>         if (s->tx_fifo_len == NUM_PACKETS)
>             return;
>         s->tx_fifo[s->tx_fifo_len++] = packet;
>         smc91c111_do_tx(s);
>     }
>
> | smc91c111_release_packet() also assumes the packet number it
> | is passed is sane.
>
>   It seems to have check in place for s->allocated which
> checks if given
> packet number is allocated.

If the passed 'packet' value is greater than 31 or
negative then the function will invoke undefined
behaviour. If it's less than 32 but bigger than the
max number of packets then it will set allocated to
a value it ought not to be able to hold, which makes
the rest of the code harder to reason about.

> | Do we need to guard against bad packet numbers in incoming
> | VMState data? The answer is no if we're using the "always
> | check packet_num at point of use" approach, but yes if you're
> | trying to ensure s->packet_num is always a valid value.
>
>   IMO second is better.
>
> | Do we need to sanitize s->allocated in incoming vmstate data?
>
>   Not sure. It does not seem to be set by user.

It can be set by malicious incoming vmstate data
(and by arranging for release_packet() to be called
with various out-of-bounds values, as described above).

I think a bogus allocated bitmap is not exploitable,
but it does make the code a bit harder to reason about.

thanks
-- PMM
