Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp297492ejb;
        Tue, 31 Oct 2023 06:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgioSd+/Rr+UTabum1YGlA/Kq8rX06LL6Y7dmYW0eqX/xXQFTwOSKLJOmtA1LkxeyJn2Bd
X-Received: by 2002:ad4:5ce3:0:b0:66d:5b50:44d with SMTP id iv3-20020ad45ce3000000b0066d5b50044dmr19928859qvb.57.1698760567804;
        Tue, 31 Oct 2023 06:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698760567; cv=none;
        d=google.com; s=arc-20160816;
        b=MPgiKTQ0LWqFpUFHyAD0h++jA71dEFMnGcIc0GCAQ1RT8Who8xboJWLovlfI1task6
         Sz09lwTQXQ90SXBQnHtARxWnjIS3mesxvnkY1it0nWydRJ11qEU4vY6ZJTF3aDxciDJt
         /xPkxeZjU37T7n1uxPqbtVhgXcpVo1GxG+uluFh40FmmAX0cz4PzFfJ/D2H9gU72sfH8
         Rcs2JfkKlxLNoDpJjkTWNaiOjW4o56r/Az8oReQoYB7q0n4kAqLmviZIiGE+/WoXxfgM
         shFl7GjyQgMmPXBimsk92Her7UdSMJcbWUhzpm9CVf+0kT/pCbjzMWs09ocxSz4U61Fw
         tr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mS2UNgnPcFMlj8ETZ/dlqbFi7v/mKjcFcXiUAGOAbsU=;
        fh=at3qcA7oya2MgdEBTf03GisTwzl2EcSANM6tYwvqDuA=;
        b=w4U+tUUt8PnDem4DwW/kDvezU0NlhvK5wPDPg3D3E8MRTElD98kGF958Y0Vu70mi44
         SPcy5niNFOZBjDU/fxr9+wLM8e69p0/8trYqpA1jRrLU8JrjBX1AHyK3GySS3K6RSYWR
         teJirLvNQiwgyNQvmfA69HAWnQKl+wDrVvX+FYhCwFOYtI4Y1DFe0PxhisuwxN3TTthj
         1Bxtpgr6W8Lg5Bf+vC2srY/lNNgRDkD/xcvLX+NBBznNF4srZWVqLGci5170XPKeYUCx
         wP4jP4b/Iijs/MxCUM5UCoJQOtUUklbCynWJwK9HZU5XJS/UFZiqJtgkUa/3ggYZVA8U
         AbDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iyO8vy1P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020ac87c47000000b00418e6893fcasi1113444qtv.614.2023.10.31.06.56.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 06:56:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iyO8vy1P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxpDp-0000Rs-2s; Tue, 31 Oct 2023 09:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxpDl-0000Nz-0B
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 09:55:53 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxpDi-0000kT-DN
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 09:55:52 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53ed4688b9fso8855421a12.0
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 06:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698760546; x=1699365346; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mS2UNgnPcFMlj8ETZ/dlqbFi7v/mKjcFcXiUAGOAbsU=;
 b=iyO8vy1Pbok0edip3S2waHly70mjUQqeiypsDqctJB/qWx1+zgvCgKPxkoXbeYKjPJ
 Dch1I/lrKhhXrNDhGzeNNZbjyEx37722+Q/7a+g1jIganSihRQW5NsurmxqofuSi1dMk
 KtG6cHRBkXQoeQ+ITuBPgUmb0tlYaqKQVytqxySL0JrxCyLH/Ps70GUo3+e9dLbsl1U2
 XKzegEIW2FITsN0HdlZdTINoqpy+nGBnu6GC/GX4Qfa3ylrxPs5Qz86foX2dYOZHyAXW
 gbzS/zrDMRD2ejTZUv/jAeP70eqD8Cx/lJYQZ2S4CM4p8SQDNYFQsdHV5N/nTcltdnCh
 KCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698760546; x=1699365346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mS2UNgnPcFMlj8ETZ/dlqbFi7v/mKjcFcXiUAGOAbsU=;
 b=X+3ci3TWFWP/cAjYXYytuEwWJLuMpKLADe71+Sy05omvAUC3uEfPE5bxKs8ERZ6TjQ
 gKZLkqFA1k+PDekBIOflzkuosqmqKE/tJvLMY8UyK9cONLCqsssK/2Esa01R5zQrXMX0
 1guBH8YRl7k07mbH/fIW/f4l5O0RSptWJGZGZRTbBpUWRZoC7flxGpulU8/IxLREi/1q
 HJeadFqBCOi1ItoPiLLOIivAa/E52pPKv2X8+NkVFlNz47eAmorpaBLw3+FaAIUqU+wq
 1GcN2Oup8E6P3iEs5yGJnfkUGwxNfnt8LAnTmzguKriAmVU/9RllbwNmWYRkiTSI+Eqs
 TDDg==
X-Gm-Message-State: AOJu0YzFXhc3pn6224PDbyAGRBJV8rKfSVPNilxlFy3DVy+pOYWEn/Lt
 PUNTyXIZ7mCdzQTLgp3+2RRdbeGbuu/rfuT0CairQQ==
X-Received: by 2002:aa7:d74f:0:b0:53e:3b8f:8a5a with SMTP id
 a15-20020aa7d74f000000b0053e3b8f8a5amr9099063eds.39.1698760545910; Tue, 31
 Oct 2023 06:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231030114802.3671871-1-peter.maydell@linaro.org>
 <20231030114802.3671871-6-peter.maydell@linaro.org>
 <9ea5c9b8-d740-4cec-9896-568babeca9aa@ilande.co.uk>
In-Reply-To: <9ea5c9b8-d740-4cec-9896-568babeca9aa@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2023 13:55:34 +0000
Message-ID: <CAFEAcA9dJnp0CVOzVWV+Q-U4ji9c8=14ggztKGktCSsDDp_F0g@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] hw/input/stellaris_input: Convert to qdev
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +s/U8ZryZq8n

On Mon, 30 Oct 2023 at 20:38, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 30/10/2023 11:48, Peter Maydell wrote:
>
> > Convert the hw/input/stellaris_input device to qdev.
> >
> > The interface uses an array property for the board to specify the
> > keycodes to use, so the s->keycodes memory is now allocated by the
> > array-property machinery.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> > v1->v2: drop private/public comment lines
> > ---
> >   include/hw/input/stellaris_gamepad.h | 22 ++++++++-
> >   hw/arm/stellaris.c                   | 26 +++++++---
> >   hw/input/stellaris_gamepad.c         | 73 +++++++++++++++++++--------=
-
> >   3 files changed, 89 insertions(+), 32 deletions(-)
> >
> > diff --git a/include/hw/input/stellaris_gamepad.h b/include/hw/input/st=
ellaris_gamepad.h
> > index 23cfd3c95f3..6140b889a28 100644
> > --- a/include/hw/input/stellaris_gamepad.h
> > +++ b/include/hw/input/stellaris_gamepad.h
> > @@ -11,8 +11,26 @@
> >   #ifndef HW_INPUT_STELLARIS_GAMEPAD_H
> >   #define HW_INPUT_STELLARIS_GAMEPAD_H
> >
> > +#include "hw/sysbus.h"
> > +#include "qom/object.h"
> >
> > -/* stellaris_gamepad.c */
> > -void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
> > +/*
> > + * QEMU interface:
> > + *  + QOM array property "keycodes": uint32_t QEMU keycodes to handle
> > + *  + unnamed GPIO outputs: one per keycode, in the same order as the
> > + *    "keycodes" array property entries; asserted when key is down
> > + */
> > +
> > +#define TYPE_STELLARIS_GAMEPAD "stellaris-gamepad"
> > +OBJECT_DECLARE_SIMPLE_TYPE(StellarisGamepad, STELLARIS_GAMEPAD)
> > +
> > +struct StellarisGamepad {
> > +    SysBusDevice parent_obj;
>
> Minor style comment: for QOM types there should be an empty line after pa=
rent_obj to
> aid identification (as per
> https://qemu.readthedocs.io/en/master/devel/style.html#qemu-object-model-=
declarations).

Fixed.

> > +static const TypeInfo stellaris_gamepad_info =3D {
> > +    .name =3D TYPE_STELLARIS_GAMEPAD,
> > +    .parent =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(StellarisGamepad),
> > +    .class_init =3D stellaris_gamepad_class_init,
> > +};
> > +
> > +static void stellaris_gamepad_register_types(void)
> > +{
> > +    type_register_static(&stellaris_gamepad_info);
> > +}
> > +
> > +type_init(stellaris_gamepad_register_types);
>
> Is it worth converting this to use DEFINE_TYPES() during the conversion? =
I know Phil
> has considered some automation to remove the type_init() boilerplate for =
the majority
> of cases.

I could, I guess. It seems a bit awkward that DEFINE_TYPES()
wants you to pass it an array even when you only have one type,
though, which is going to be a very common use case.

-- PMM
