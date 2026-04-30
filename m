Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10094FF8873
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 15:20:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wITAq-0007oc-Rc; Thu, 30 Apr 2026 11:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wITAg-0007ma-0W
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:19:23 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wITAb-00058Y-Mv
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:19:19 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-7982c3b7dfcso11185927b3.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 08:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777562356; cv=none;
 d=google.com; s=arc-20240605;
 b=Nikp0unRzonC+f0iXF7wvRhn/LcOdQqKqIOSLEndMvMKObC/1t4VK1lFsIHNtKnCQw
 xqbbZ2FLIGGZCXQEUtZBJ2FeesFPEuroCSdVkQmRgawcfK7yQEelYo+EnnwB8r+VxsMD
 yweNjyishx8SeSx49OKHHt0tREjU8zeiEh6QSpeIyaG/xPtUnXcsL9zbHD1ePD05Cfqb
 +6g9v158Vi1/RNWIgJG3T5xEhnU7Es2WmrsvOohbv1ugMebcvsga7Dq4tGeC287Rzwfb
 XkgZ9f4rQzvIphBsevqLCF/2IoRMA6tdo8GAdSNQKeNk5QDEu/ozO89SF/I7XmGMNWKq
 tZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/JG22Ej56EUWFFEmowD0xO80QDs/wj1cEGKJ/VNon7c=;
 fh=h7QKGDsiTCSRE/0WMdOYSTXo250LmVrrYTcuDFzvMqE=;
 b=CgiGObOxPjXz4vbyy6BwC6U7VJKPllwroywV0/PNbGMznUF2Miz0BmX8r/V5U7cfu+
 mLg7OdZYb3Oy9HvV+7AQQ8tuRcRgYO72rf4WSCkaTPlJBewM3H6I994pKK3njlAyk2F+
 cKUJVL4TdFyOLuGR+S4ZJy460QEXG3jYaZXd7JZiYA6raF7oJmjHihkl2PY9sJsTigKS
 wWSPAsms7qIXZjf/GknYuXXF65HgU8TKkk8tv95g3n8+GVUj1q/zrfsjGnb+NU5iP0lA
 ja2OQRocw8Mae5Hn5ISYXAmsH8bMIq+I304ravrzwYRpUZn2UNzjZlcxYSxWqs78M1bM
 C7Sw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777562356; x=1778167156; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/JG22Ej56EUWFFEmowD0xO80QDs/wj1cEGKJ/VNon7c=;
 b=qc6tBiCrTIC76Jdj9Zie91aHqUb4rDUKN44bEq5sYUDj5hLc7NIt/d5jDyfCIrMuTM
 SMniVTpyfXuzPHCQIK/VRzRirLzzEr3RcKKXxPPi1uJi/HljOK1I8U7y05x9p8oSLnOo
 5R9qETKuuMCUDcBshqnSQ9AbiykdjDBa99arjryZWKYL7rV9e3Qj6a3d8dpYn7W5zBxi
 yAmVN+d4Dqmf+RmbDETRoq0vvTmIcDxV/kb/ZrToH6uPfmtuFG1qpgAurQ5FbGQ7QNzQ
 eH3rWkTABVEVr5vf01yFht5MHCm8EgP7MXgTjgRtuVX0IWlBfnlVb1KRpNRHadGRJYer
 Jhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777562356; x=1778167156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/JG22Ej56EUWFFEmowD0xO80QDs/wj1cEGKJ/VNon7c=;
 b=o0k/WbohpEZLAhl4q9+Out4TgEHOzj/p7AeU/NNA5NjZUMuSwigi0iYxUP8WxsDsut
 6KewXGOOD4E8HErLq/p7Kamlr/py0mmhiJMq2DHo2JdSWdrCKvGAXZ2aS692Kk7UUpuS
 6SAPWJDCGCRGSqiK2lDxeFlchL4zcFGCs60f/sXXv8eDo3BdpUWs61fq6Ek7Xn1KW9qP
 4Mw5871ttHLl5sB+VIhEldGRsCn+fOpzNTX70HAwtKim0K3r+uMrytnLBUVl3U8pI2QF
 pEL9rSSZqAomCgdadVqZZJKADjE8EluZF9OQtTqWaICTLDPBr7MazzKQTe5TCdoSrR2f
 8w1A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/aC0CBLrNUwsnM2bdKQjZhILsLuolmAPLYRqBWVGjsBI+c/O6pvG7yOdVDbmQeEQ8Gl4Bo2hIQgA==@nongnu.org
X-Gm-Message-State: AOJu0YxvVVUfjXhAv8G5IVn5VIes8cDZh+Wd4BxE2c7S3y6H032ySsy+
 OteOJaxrdl08rJG+gbqZHYXLnw2DK6+nF2Uwg32kdpDLvmRVmol8AQpKeeUcTrXhjKPp8EDXbMe
 Syfpn+O3GryU/z3xWTqxPB2SJYDNqYyeg03MBMlCY7g==
X-Gm-Gg: AeBDiet83522bYXIF+UhAZ02cpiBDzH1SbSQMsCngpeGgTMyxq3SXkuNrkmueoeAdmq
 aRZ5FgsEuQQuEIwY4FR2ZJT/W6RD+h/a4QdRLH2YMlZ4Koe8RxHT9QHpte3mnz4fupSEtznFdHL
 f046DwNaF+uH8l+51IiTwt6hJaKk5NIQ1hh9uu22WmR+Rl5QzwbnjMKy172novVNE4f2gSJz/nK
 AsJ4MMXJwQ+VMbC3I4fut6o5BJcU7u+8sCaALlpw9Zgq+obqDPrXBJfg2aQlmXX9ZlrWkFMPreB
 Xzt6LCqbBOzq5DXNXo8eFpRlUjmJidxDcF+0yCgxrJam91QTSd+t8vFDIVnStMTGsiNBqweX5Tc
 tzw==
X-Received: by 2002:a05:690e:1698:b0:651:c782:6a8 with SMTP id
 956f58d0204a3-65c18b3e650mr2689922d50.15.1777562355894; Thu, 30 Apr 2026
 08:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260428093339.2087081-1-peter.maydell@linaro.org>
 <20260428093339.2087081-3-peter.maydell@linaro.org>
 <22ce7f65-39ee-45cb-a021-ac275d036f38@linaro.org>
 <CAFEAcA8SpD+X0kLg-6kQ+TR2VSJqhtMpzQrfsOqEZE_EzfkW3Q@mail.gmail.com>
 <afNyLaTjM2uz_wX8@x1.local>
In-Reply-To: <afNyLaTjM2uz_wX8@x1.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 16:19:04 +0100
X-Gm-Features: AVHnY4L8ffegCxy6WgVelwFpiPEguSAXzWiZn8Q-5hseD1q-jQs-MWIgp5jjCDs
Message-ID: <CAFEAcA8V0p4TqLFhhh8Aokw2g=vqKkU4wc-kDnKSG1ceG-bqNA@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/npcm7xx_fiu: Specify .impl for
 npcm7xx_fiu_flash_ops
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 30 Apr 2026 at 16:16, Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Apr 29, 2026 at 01:26:36PM +0100, Peter Maydell wrote:
> > On Wed, 29 Apr 2026 at 08:38, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> > >
> > > On 28/4/26 11:33, Peter Maydell wrote:
> > > > Currently npcm7xx_fiu_flash_ops provides no .impl substruct; this
> > > > means that it gets the default of "implements 1, 2 and 4 byte align=
ed
> > > > accesses".  This is more constrained than the device permits in its
> > > > .valid substruct, and also narrower than the functions are written =
to
> > > > handle.
> > > >
> > > > Add a .impl substruct matching the .valid substruct; this means tha=
t
> > > > all guest accesses are handled directly by the read and write
> > > > functions, and are never synthesized by the memory subsystem
> > > > performing multiple accesses to the device (which would not behave
> > > > correctly, as these read and write fucntions have side effects).
> > >
> > > Typo "functions".
> > >
> > > >
> > > > Based-on-a-patch-by: CJ Chen <cjchen@igel.co.jp>
> > > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > > ---
> > > >   hw/ssi/npcm7xx_fiu.c | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
> > > > index 02707de350..2d5bed005a 100644
> > > > --- a/hw/ssi/npcm7xx_fiu.c
> > > > +++ b/hw/ssi/npcm7xx_fiu.c
> > > > @@ -250,6 +250,11 @@ static const MemoryRegionOps npcm7xx_fiu_flash=
_ops =3D {
> > > >       .read =3D npcm7xx_fiu_flash_read,
> > > >       .write =3D npcm7xx_fiu_flash_write,
> > > >       .endianness =3D DEVICE_LITTLE_ENDIAN,
> > > > +    .impl =3D {
> > > > +        .min_access_size =3D 1,
> > > > +        .max_access_size =3D 8,
> > >
> > > IMO this device should be adapted to have byte granularity ops handle=
rs,
> > > thus .max_access_size =3D 1.
> >
> > Looking at the implementation that doesn't look like it
> > would be possible. The implementation does operations
> > to start an SSI transfer, then transfers the number
> > of bytes written. That makes "guest does an 8 byte
> > write" different from "guest does 8 separate byte writes",
> > and so the read/write fns need to really handle all
> > the possible access sizes.
>
> I tend to agree.
>
> AFAIU, a split could cause non-atomic issues (even I'm not sure if there'=
s
> any need of it in reality..). Since the use of deposit64/extract64 should
> mean they're ready for 8B accesses, then it sounds wise to support 8B.

My guess from the fact this device previously didn't set .impl
at all is that the author didn't realize (and we didn't catch
in code review) that to define an MR that accepts the full
range of widths and alignment you need to specify both .impl
and .valid, and then they didn't notice it in testing because
it works for 1..4 byte widths. Adding the .impl matching the
existing .valid is I think changing the code to match the
author intention.

thanks
-- PMM

