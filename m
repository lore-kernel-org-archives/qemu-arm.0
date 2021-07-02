Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1270105lfi;
        Fri, 2 Jul 2021 04:46:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxKldO5dKslcp3/rEcOPs23gO1dPe2TYc3bHK/5iGNxWIXA/OLVjRYQYE+VsPEgZ/9QYkB
X-Received: by 2002:a05:6214:11ae:: with SMTP id u14mr4698887qvv.16.1625226411069;
        Fri, 02 Jul 2021 04:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625226411; cv=none;
        d=google.com; s=arc-20160816;
        b=XQPzXv6EOVP/NAFL2DIMhvLQwPdKiPYL05CMcAnamBsRkm3e9EtfOUvjH3cBZyTTp4
         JLY1aInGEOSlgnlp0hYv//yu+sNchHrmfHiiKLd3Vazoo/1e/pR3+u2rYNGlNLiD6m27
         SI+SSkql5IB39UIFKT6tHqrcVVbu7aInoxUj1fYeKH0EuBkCFG8EEtrks929/PL+pK4D
         NFDStaRHjDtT4LVpNKtF49z9L61O83u+MuWjEMYIfV7ukD/6hTVbSn0dRxwnX9MkVP+O
         LiRNABPQzS5v1x883Pdh8Zwx7hQDAVPYH8KjclZvpCvoIRCTQ/wl90WxE4vMKKqdVU/i
         GWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AxpYy7JVmBwbKTgtQRPtMPMkmVQwfDOZD1FkgXICRiA=;
        b=LCQV1wjuxUFgraRPzOEOWWrZEm2joV0iaXRG1y8qG1+T/XKR4JeuMNAqkdE7OXA1oG
         0bpjW6EJihjfCt6qvX6YKL33I7hk7UeELQM019M5IxHQLWgnii/+sVIipnV8q3qpO8g1
         6nRrKNdmc5zc3WfQMF0Yd5z2ysWriMeq9zXKmDpwq3wOQigLh88RnTQFJO8wMojBjTlr
         z4uhLK9UOr+x0q+/MrV5AtNcBOkypMu6ijLlYVyFyzchZbovTglWigOUA4jd9LmSowzy
         yGAnXL8m1+Jf+7ZWV/IzBp1qDfNXFmHmF6SpRYdzF70SXYbqSscssVjsTQdQzlLmX94v
         YMgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Uy5Q/Jgr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si2165367qtx.392.2021.07.02.04.46.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 04:46:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Uy5Q/Jgr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzHdC-00028K-EM
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 07:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzHcv-00027o-PY
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 07:46:34 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzHct-0002JA-Tb
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 07:46:33 -0400
Received: by mail-ej1-x636.google.com with SMTP id v20so15640549eji.10
 for <qemu-arm@nongnu.org>; Fri, 02 Jul 2021 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AxpYy7JVmBwbKTgtQRPtMPMkmVQwfDOZD1FkgXICRiA=;
 b=Uy5Q/JgrzSssEYlWs1O3oBbpBF5VsScUPiwuZbzrkYFxrdyYr2gVhWICV7qrUNqOqs
 UyEJfkXHlQUqyIZYBq+ZeHj1ANtYdRY404MdAB/mxdaZGo7TJ0MZSKhRDt5UJpZAccRL
 tVTnk8c9KykHriuVTB1ocP1PA9I+Th0g27JPPG/JVgJr6I0ynU69Ih9FSCpEystBsZiV
 E9ngy0JmezTpO2eJXQd1yrD7qQSpJViopRyYk5osoqIr5p73JaVMLbMFojdNjtZMYV7U
 tZjAvgCRlQ5VEX1MX2Mb9mpqAuP8e4/zFoxGHPvMym962nMnESVGCgfd/ErE3yGQvZM5
 gvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AxpYy7JVmBwbKTgtQRPtMPMkmVQwfDOZD1FkgXICRiA=;
 b=m7AOCTaKKsQPvv6hdKOYjB5X58gFQ9zDHZpQ1uGTg7uXT3lUwvKDqy81Iiv8ooA7Go
 i3qd0di92RFVt9yfOSdBnjSrEYZGXZwSjpbrQpbZ3fGKrOrNUyTxfFeAP8fZ435ASFO3
 M1vHZfwUj0L3++rpFHLEsVkXsB1H0fum7TbIl4JHcv9ERxfYu3T7gh/oZLbdfbhoy0in
 9KBVozFJDoUqulbjhpKGjAQqDVWUmvnWYMIKwwN7FWZ5kO4K8+86WNgGvFfwligIRTE3
 UejPGy7rWBEaUXuy3nDrFutWAgwiDv7AFb23Qzs5+EUp+HuMhci9kmfLzdW6yxV6F4qS
 aSZQ==
X-Gm-Message-State: AOAM531nF1/Kl+jjJUssL8Ht+yhwOVWoZgeEgmBIftcqfU/gSA6z9cbV
 V0eZDOO0EyyvGoq3tlMJRfWR3uC2nFx6Dl+I3LOg5g==
X-Received: by 2002:a17:907:7d91:: with SMTP id
 oz17mr4989633ejc.250.1625226388837; 
 Fri, 02 Jul 2021 04:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-4-peter.maydell@linaro.org>
 <52e5cb6e-1be5-cc73-5aab-790c5b9b80bb@amsat.org>
In-Reply-To: <52e5cb6e-1be5-cc73-5aab-790c5b9b80bb@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Jul 2021 12:45:51 +0100
Message-ID: <CAFEAcA9n-3-0V4==-j5-vBFsMHtHmXtkctxsyYEVWi-obipRBw@mail.gmail.com>
Subject: Re: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling
 logic
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nB7hU2a8phtA

On Fri, 2 Jul 2021 at 12:02, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Peter,
>
> On 7/2/21 12:40 PM, Peter Maydell wrote:
> > Currently the pl061_read() and pl061_write() functions handle offsets
> > using a combination of three if() statements and a switch().  Clean
> > this up to use just a switch, using case ranges.
> >
> > This requires that instead of catching accesses to the luminary-only
> > registers on a stock PL061 via a check on s->rsvd_start we use
> > an "is this luminary?" check in the cases for each luminary-only
> > register.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/gpio/pl061.c | 106 ++++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 81 insertions(+), 25 deletions(-)
> >
> > diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> > index a6ace88895d..0f5d12e6d5a 100644
> > --- a/hw/gpio/pl061.c
> > +++ b/hw/gpio/pl061.c
> > @@ -55,7 +55,6 @@ struct PL061State {
> >      qemu_irq irq;
> >      qemu_irq out[N_GPIOS];
> >      const unsigned char *id;
> > -    uint32_t rsvd_start; /* reserved area: [rsvd_start, 0xfcc] */
> >  };
> >
> >  static const VMStateDescription vmstate_pl061 =3D {
> > @@ -151,16 +150,9 @@ static uint64_t pl061_read(void *opaque, hwaddr of=
fset,
> >  {
> >      PL061State *s =3D (PL061State *)opaque;
> >
> > -    if (offset < 0x400) {
> > -        return s->data & (offset >> 2);
> > -    }
> > -    if (offset >=3D s->rsvd_start && offset <=3D 0xfcc) {
> > -        goto err_out;
> > -    }
> > -    if (offset >=3D 0xfd0 && offset < 0x1000) {
> > -        return s->id[(offset - 0xfd0) >> 2];
> > -    }
> >      switch (offset) {
> > +    case 0x0 ... 0x3fc: /* Data */
> > +        return s->data & (offset >> 2);
>
> Don't we need to set pl061_ops.impl.min/max_access_size =3D 4
> to keep the same logic?

I think the hardware intends to permit accesses of any width, but only
at 4-byte boundaries. There is a slight behaviour change here:
accesses to 0x3fd, 0x3fe, 0x3ff now fall into the default case (ie error)
rather than being treated like 0x3fc, and similarly accesses to 0xfdd,
0xfde, 0xfdf are errors rather than treated like 0xfdc. But I think
that it's probably more correct to consider those to be errors.

(We could explicitly check and goto err_out if (offset & 3)
right at the top, I suppose.)

-- PMM
