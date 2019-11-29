Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9203707lfc;
        Fri, 29 Nov 2019 08:06:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwrbPEBdpMtF3KeAc6mHen7aelG7QHDvCU6RnWR1QL0hBFPDnp8cYeCzI0mC479WoTq2oLn
X-Received: by 2002:a2e:144b:: with SMTP id 11mr24904943lju.216.1575043569548;
        Fri, 29 Nov 2019 08:06:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575043569; cv=none;
        d=google.com; s=arc-20160816;
        b=S66ENkBzitHl6OLzaWm1F0M+2MHO1yJKn/7UTDEEpbl8A/VYB65Tvr25JXmuQT4pcM
         m0zNm7F1XMnEwaqUc7qUPW4W5SgxYrmovWyhg0m+g5el8h61eiTooVOMzvRea6BXv/gc
         XS7fJphhWGT44ZndSToBPuJyHVnad9ArPuOFsAzcxPo1tfQgNiiXPSAXBQKF+DHiuSlZ
         JjqvMwpofXDxkNa/vzAebLQ4/1nmLZVC0U4DYyhZOH8YDSfqUT0Jj+3muCuAeWB5AV9N
         5ospuVJy+fsclaIf9nywEtC+5D/v8Na1msJAwrHU9epThlGCE6ooDSOQAavmdxobgJBS
         7Q/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zg8HBt8/v556Px1AquN+KYHYk63ghRTuJn/glDQ/6mE=;
        b=FzKzQ/zpmnKSz/bnljauVuRyH2R2SlSrsm0HMuQoDRhD+c3XES0v0G43JK92nkBGRW
         r0tQ9jk0lbE+IwE42q0LIvVxm39rEIpZR8a9EKOTFhCf2n7jfCRkgewBFbOQnBkEdKU4
         yz2ywDrMUxrT4dase3n6r8igm2VXQw5xKvcDRw8bFMi6XkGrMuMJeoeEnn8ptIbH6yn2
         8dcVm6O6mVaR087RIqV1rP9xGuZ+G3vEb0RCwtO9uCPlmhUd2tJPjrsHn7+IKubSXCyL
         6Fcl1NkbkLzh+ifFqbEK4R/grhgQxVXut9NYJF0HmtRYns24voCikU4CXQ4IPX5XCAO4
         fykQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EqQNTK2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15si3524285edx.429.2019.11.29.08.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 08:06:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EqQNTK2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaimW-0005jb-Cp
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 11:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35629)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pmathieu@redhat.com>) id 1iailr-0004uY-Sv
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 11:05:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1iailH-00089B-Cz
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 11:04:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52497
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1iailH-00084X-8o
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 11:04:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575043489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zg8HBt8/v556Px1AquN+KYHYk63ghRTuJn/glDQ/6mE=;
 b=EqQNTK2NsenAVGHUY1pA4HimCWIXQD77str7Z2X9hVEsslJkzS5L37xmzgJVuecAvCaPsy
 wiGW+tZafR0vojB5dpbarDL620HUBcW/x1tP3tSgLyl7+Db9Fj5klFsSh5lZVKF7SfRjQY
 ZZlnQhHY+oVhQU3BsIFz4Q2rOQGt2So=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-_szglWd3Omi_Zwue2G-L3A-1; Fri, 29 Nov 2019 11:04:48 -0500
Received: by mail-wr1-f71.google.com with SMTP id q6so15778528wrv.11
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2019 08:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zg8HBt8/v556Px1AquN+KYHYk63ghRTuJn/glDQ/6mE=;
 b=NQG2Anoy/NqUbswIsy9rHv8KlJdTq9Gum99Mv6M+ogZecBK/ztUP29rW+LCZZMw4VX
 HFqa2FZkVxqxeI8GwRIHB9jyut67SU6w0F8fTxrYkEs3EbL0Ai0uJuL9Www9KcLIPizg
 AdS4lHFqyFQXLOKHqjK2c26c0q/PNUxJTxyV/R+cA205cPZvHCTVYrcxqKoLP7x7dJ0e
 xgYjj+nTry9I8JBJdHW2PRW7gVCpGaI6INFbutJpryhPNwrU1PmbLUhhI/7dt5wQ8lA+
 TZpQWH6DXsTHFfI+hWDTXYe8l72zr3D748FcaH/eK0pkrogi3vjmYB6nL5qg/bMGpeg+
 xTDg==
X-Gm-Message-State: APjAAAVy3HRnV78u/ti8JZwhTh3aZSUxI2JNifpCOfxvhNShm+54SUND
 pUvl6As+p7bBRS5lxhc6QUPR4vvXOKAFTqs/r+fMDK545rI8Ibnf+2J5W4XQy3AyZCwjtyouzwx
 64WL+YUQxxzq74AZoXxOISSJiI/ZQ
X-Received: by 2002:a1c:46:: with SMTP id 67mr16423601wma.51.1575043486162;
 Fri, 29 Nov 2019 08:04:46 -0800 (PST)
X-Received: by 2002:a1c:46:: with SMTP id 67mr16423551wma.51.1575043485738;
 Fri, 29 Nov 2019 08:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20191129150508.24404-1-bilalwasim676@gmail.com>
 <afe9efde-7ac1-8607-446a-8fbf10accece@redhat.com>
 <8c956ae31e8f44a2b831a5030b2448b4@SVR-IES-MBX-03.mgc.mentorg.com>
In-Reply-To: <8c956ae31e8f44a2b831a5030b2448b4@SVR-IES-MBX-03.mgc.mentorg.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 29 Nov 2019 17:04:34 +0100
Message-ID: <CAP+75-X_POJfTO=gOUu1zCPtcfnQ5yemQo0hqB_s3jy_C17o9g@mail.gmail.com>
Subject: Re: [PATCH] net/imx_fec: Updating the IMX_FEC IP to support loopback
 mode.
To: "Wasim, Bilal" <Bilal_Wasim@mentor.com>
X-MC-Unique: _szglWd3Omi_Zwue2G-L3A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "aa1ronham@gmail.com" <aa1ronham@gmail.com>,
 "jcd@tribudubois.net" <jcd@tribudubois.net>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "bilalwasim676@gmail.com" <bilalwasim676@gmail.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IUV2k83Vztxb

On Fri, Nov 29, 2019 at 4:59 PM Wasim, Bilal <Bilal_Wasim@mentor.com> wrote=
:
>
> Thanks for the pointers philippe.. Is the patch okay to be merged without=
 it or do I need to do a re-submission with the updated username ?

If there are no review comments on your patch, I think the maintainer
taking your patch can fix this details directly, no need to resend.

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 [mailto:philmd@redhat.com]
> Sent: Friday, November 29, 2019 8:38 PM
> To: bilalwasim676@gmail.com; qemu-devel@nongnu.org
> Cc: peter.maydell@linaro.org; aa1ronham@gmail.com; jcd@tribudubois.net; q=
emu-arm@nongnu.org; Wasim, Bilal <Bilal_Wasim@mentor.com>; linux@roeck-us.n=
et; Jason Wang <jasowang@redhat.com>
> Subject: Re: [PATCH] net/imx_fec: Updating the IMX_FEC IP to support loop=
back mode.
>
> Hi Bilal,
>
> Cc'ing Jason, the maintainer of network devices.
>
> On 11/29/19 4:05 PM, bilalwasim676@gmail.com wrote:
> > From: bwasim <bilal_wasim@mentor.com>
>
> Your git setup misses your 'user.name', you could fix it running:
>
>    git config user.name "Bilal Wasim"
>
> (eventually with the --global option).
>
> The patch looks good otherwise.
>
> Thanks!
>
> > Loopback mode only works when specific conditions (as dictated by the
> > IP guide) are met, i.e. the MII_MODE is set and the RMII_MODE is
> > cleared. If not, we simply send the packet on the output queue (for TX
> > to the host network). Tested by running a custom RTOS and TXing a ton
> > of packets. The same packets were received on the RX side..
> >
> > Signed-off-by: Bilal Wasim <bilal_wasim@mentor.com>
> > ---
> >   hw/net/imx_fec.c | 27 +++++++++++++++++++++++++--
> >   1 file changed, 25 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c index
> > bd99236864..c51e7f7363 100644
> > --- a/hw/net/imx_fec.c
> > +++ b/hw/net/imx_fec.c
> > @@ -256,6 +256,29 @@ static const VMStateDescription vmstate_imx_eth =
=3D
> > {
> >
> >   static void imx_eth_update(IMXFECState *s);
> >
> > +/*
> > + * Function to check if the MAC is configured to run in loopback mode.
> > + * If so, invoke the "receive" routine.
> > + * Else write to the output.
> > + * */
> > +static void send_pkt(IMXFECState *s, uint8_t *frame, int frame_size)
> > +{
> > +    NetClientState *nc =3D qemu_get_queue(s->nic);
> > +
> > +    /*
> > +     * Loopback or Normal mode ?
> > +     * Per the FEC Manual: If loopback is enabled, the MII_MODE
> > +     * should be SET and the RMII_MODE should be cleared. Loopback
> > +     * will only work if this criterion is met. If not met,
> > +     * we will send the frame on the output queue. */
> > +    if ((s->regs[ENET_RCR] & ENET_RCR_LOOP) && (s->regs[ENET_RCR] & EN=
ET_RCR_MII_MODE)
> > +            && !(s->regs[ENET_RCR] & ENET_RCR_RMII_MODE)) {
> > +        nc->info->receive(nc, frame, frame_size);
> > +    } else {
> > +        qemu_send_packet(nc, frame, frame_size);
> > +    }
> > +}
> > +
> >   /*
> >    * The MII phy could raise a GPIO to the processor which in turn
> >    * could be handled as an interrpt by the OS.
> > @@ -488,7 +511,7 @@ static void imx_fec_do_tx(IMXFECState *s)
> >           frame_size +=3D len;
> >           if (bd.flags & ENET_BD_L) {
> >               /* Last buffer in frame.  */
> > -            qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_s=
ize);
> > +            send_pkt(s, (uint8_t *)&s->frame, frame_size);
> >               ptr =3D s->frame;
> >               frame_size =3D 0;
> >               s->regs[ENET_EIR] |=3D ENET_INT_TXF; @@ -586,7 +609,7 @@
> > static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
> >               }
> >               /* Last buffer in frame.  */
> >
> > -            qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_s=
ize);
> > +            send_pkt(s, (uint8_t *)&s->frame, frame_size);
> >               ptr =3D s->frame;
> >
> >               frame_size =3D 0;
> >
>

