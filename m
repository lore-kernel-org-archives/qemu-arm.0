Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1480905lfg;
        Tue, 25 Feb 2020 02:19:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqzzjTj2Ryxax7ZdOsoLgePH9PShsInAwS/UpDMsIH09jH+rPa/1Nxa60mH8OIvlEegdpjet
X-Received: by 2002:ac8:42d7:: with SMTP id g23mr52213397qtm.206.1582625963033;
        Tue, 25 Feb 2020 02:19:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582625963; cv=none;
        d=google.com; s=arc-20160816;
        b=LJlLwjkcg3WEPjisIZKRXIB/6i2tipe9sExrbZucUwvTWnSzirzaKizS2R1CWtZXWE
         5GKRpZDENddZo8M6B2B2uhGLMphnjswnzTmb72U56IJjLUpg/Bz8pwhKyBA4H2x+IzyE
         HwJh6fSQPvIb51uObQf5n6Eaxn5iyQA7u7OpeEL2rm/jdVE5iYx3vWO/vHFyUVUjkkRw
         Z1Dc/LvsS+nrrD7VaQR4+hZeV+j/oBoz+1oxvJ7U7S3NEiqSF3YVR6MOFzDAS8HSdqPy
         nEv+jhxM6WUWMvRqud42o5c1ssiDifimXf6KLYyncw4SiQX+KkdoNhbFxqWavWCwbUiO
         EkoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TdkyP/waG7yMrG/55LzQ/BCApLNTU/cpSkgd5WpaZ5s=;
        b=w7dMVEYfH2nMfupbnt3zg8vLq0eQKL/99/KtZ4qMm8oeKivqnDzvltOWckqsC8DvDN
         pCy0InpgR+0ceuuIqMJYTITj8IoD+b6jB+/O30aETXw5z5qouzv5P9sBgIm2VOx9VZvg
         njwiWzAg9nJLKMYftt7zrY2E5JPOhpGkNvn0LqZCyifpGqwUx43aS2BZnpXadvSXTVH5
         buw8ytzLzcN0CKI2VZwhuNfS494XANhXq0m7NiUxsSge+7kHt3wBKXg8/1WCuHBOXjZD
         A9UKVf8btmu8TegkubSLgj6CZllLSKNMhlXolAhvKt4/j+9TyDcD9BNOQllMQDbAMhgw
         AGIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aJWGuqcs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si6461486qvq.175.2020.02.25.02.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 02:19:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aJWGuqcs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6XJC-0004WK-E9
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 05:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6XJ2-0004QW-7u
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 05:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6XJ0-0002lw-Td
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 05:19:11 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34669)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6XJ0-0002lV-NT
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 05:19:10 -0500
Received: by mail-oi1-x241.google.com with SMTP id l136so12030908oig.1
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 02:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TdkyP/waG7yMrG/55LzQ/BCApLNTU/cpSkgd5WpaZ5s=;
 b=aJWGuqcsByu/PctTrI4xgpYxuFAB4bA2DPvEp3HYGzFo5ooSb3oYOA9ZD3ooOz8jTZ
 Y0fCOWTOpLCQwEx6se80O62AQIFRkGDPjvvupqwQ/rz59l9S4EKjaJJE15ywIBHDcEyn
 ZuTStkywfr+S7igr9M8vyOiyfiEzwtS9FQY7mm3gvJvwJoQf3j9LWJCtn7YQVwteQAm6
 tf49t02Hsdr8klM5iUQPvGSGOpa6EMJRKiqS8X6GrlFdAvy7tA3SfcXcTv4fFw7kzgBG
 4itfHuaO9EDGCfMZuOafXebRWkDoQJiVwT53U8JHN0kfXuxk2gLA0qZEN4zZY5FXfWSK
 f+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TdkyP/waG7yMrG/55LzQ/BCApLNTU/cpSkgd5WpaZ5s=;
 b=Jom/1yscsK8a/2nRJz2tNS5X4JL5OUltLCXkfKbnd9YRLKC4FEIOEb1NvCMQQ28sFO
 nhKrNeXeZok48DnFLE2SWGqRk323FgL+9aAcuDJ2b6HOxEXZBeqx2O6OLZx+vmqDlpsT
 I7w7oFoVmiOosSoxXxhrO45PCJe7QGU+QOnZyICfbk8h+8QQak4C8/Essckp+7RfnuHb
 t4z7SxwGXR4FlWvB17B9z3i1W6LcdKz3AHy9YX3dQT5tECjfOakUrstTW0djSoAsyByn
 Ud11nrQUsu3/9wSiMxLXsEeE9PXKNqegA1tUKY3Hvhug52Uk0++9Q+hqhLdKzAl4HYVs
 tq/A==
X-Gm-Message-State: APjAAAXJ9V0Moqbf25xuvMsqA28TSWO87vvHJ+1nEabwg79l/BZ04mLZ
 DLaApTsTQ56DA1TtVSDBna29WvDl5DlN4etrfBkohg==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr3029042oiy.170.1582625949753; 
 Tue, 25 Feb 2020 02:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20200225025923.19328-1-kuhn.chenqun@huawei.com>
 <9206dda7-0e12-b68e-87ca-1985b61381bc@redhat.com>
In-Reply-To: <9206dda7-0e12-b68e-87ca-1985b61381bc@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 10:18:58 +0000
Message-ID: <CAFEAcA-W+brVEmGr29i6JO4GFrnoLAce-qoMQpQc56x6B4BY3A@mail.gmail.com>
Subject: Re: [PATCH] hw/net/imx_fec: write TGSR and TCSR3 in imx_enet_write()
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sAzKqsorLeqR

On Tue, 25 Feb 2020 at 05:41, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/2/25 =E4=B8=8A=E5=8D=8810:59, Chen Qun wrote:
> > The current code causes clang static code analyzer generate warning:
> > hw/net/imx_fec.c:858:9: warning: Value stored to 'value' is never read
> >          value =3D value & 0x0000000f;
> >          ^       ~~~~~~~~~~~~~~~~~~
> > hw/net/imx_fec.c:864:9: warning: Value stored to 'value' is never read
> >          value =3D value & 0x000000fd;
> >          ^       ~~~~~~~~~~~~~~~~~~
> >
> > According to the definition of the function, the two =E2=80=9Cvalue=E2=
=80=9D assignments
> >   should be written to registers.
> >
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> > ---
> > I'm not sure if this modification is correct, just from the function
> >   definition, it is correct.
> > ---
> >   hw/net/imx_fec.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> > index 6a124a154a..92f6215712 100644
> > --- a/hw/net/imx_fec.c
> > +++ b/hw/net/imx_fec.c
> > @@ -855,13 +855,13 @@ static void imx_enet_write(IMXFECState *s, uint32=
_t index, uint32_t value)
> >           break;
> >       case ENET_TGSR:
> >           /* implement clear timer flag */
> > -        value =3D value & 0x0000000f;
> > +        s->regs[index] =3D value & 0x0000000f;
> >           break;

Hi; the datasheet for this SoC says that these bits
of the register are write-1-to-clear, so while this
is definitely a bug I don't think this is the right fix.

> >       case ENET_TCSR0:
> >       case ENET_TCSR1:
> >       case ENET_TCSR2:
> >       case ENET_TCSR3:
> > -        value =3D value & 0x000000fd;
> > +        s->regs[index] =3D value & 0x000000fd;
> >           break;

Here bit 7 is write-1-to-clear, though bits 0 and
2..5 are simple write-the-value.

> >       case ENET_TCCR0:
> >       case ENET_TCCR1:
>
>
> Applied.

Could you drop this from your queue, please?

thanks
-- PMM
