Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C722C5CFDB
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 08:54:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtiF0-0006HR-A8; Tue, 11 Aug 2026 04:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander@mihalicyn.com>)
 id 1wtiEz-0006H2-KZ
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 04:53:45 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander@mihalicyn.com>)
 id 1wtiEw-00029E-F5
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 04:53:45 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-69c600f76ccso3919681a12.0
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 01:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786438421; cv=none;
 d=google.com; s=arc-20260327;
 b=LIKptJ2Ti+EElJKQ8inRGatJ35WQ5n3kmIy/eNlfVo0DjPAp5X1ilToIT44B3XR+GI
 0RmlhhavpEUPTe1Cdkfr9B6N2LVex25yaAM9oQYPrVYhaP9V0PnXBgJnJygXSTtmZ8j2
 MS5RCoV54QUa8At3V9hQVuhF60+vF7lZvAx9OFsKOJX/Aa7ruOXgjeRIxolvz3G02Ds2
 oI28kB6WbvXdbY0NdFVFpthO0Mxlr1Uy+BRK/+fNXU7IXZLv5ANTajSZdUbHdprx4t3Y
 YlFuB1hwSjrzTsVNFaGKmw+hUdaKmSpuveohq+4fa+wAyRCvIMFEB6rfclMstgfb64Fn
 oKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KntnWJht4JWG8q/8KPwv0R938uhXWrIG6b5ejF9Y9mk=;
 fh=tNnQpfu8My6YIorx7g0XwROYYXBDaOFzut7At4GRP5Y=;
 b=Bsf0IMNCvjkIDy1yAw0iDodruddMw8fHYzJMBQ4OXLydJGT2Z1o2Jg+91NvZW4EDSq
 1zwUTTHc9gBrjkcrOb7Ayb4LLfu8CF0xdbb0tRmu80M29B0SU0HSnvQZVc99pQ/3UVg9
 MkuMfpDqqKwE2Taj3Cie44qxWV2eDzC8r5CJz7hfZgs6Jidvm4UKuWSYpCY25CgIwx7L
 sGbIKa0Ej0ibRr0kUq5rqPviztTvj0+5JoYqij+XddSdXF6BxObvRtGQrN+ssJ4WxdNV
 E4AkruKBiDHqGPnTrd4hqTzGnT7nw4ARH9zK/SpiVroTguqO1w1q/IBvVhFyPIumOKlH
 tzrA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mihalicyn.com; s=mihalicyn; t=1786438421; x=1787043221; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KntnWJht4JWG8q/8KPwv0R938uhXWrIG6b5ejF9Y9mk=;
 b=e7AIUayAUnjhirqD8uzHxnuevpPQMWIhm0J54ywlsu6AWWnip2Tu7BXajaHAqJ93VG
 RcK0Z1NgURa9NH0YEzdx3++TTtoL0AEugQzE46XB1KIEJVwUPTKhybHnlafSK3y8O9le
 Y+4HLaVPZIe7BsSgc5kQQLrxm5ADTfOCKsyCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786438421; x=1787043221;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KntnWJht4JWG8q/8KPwv0R938uhXWrIG6b5ejF9Y9mk=;
 b=FW2fvA1J27W3TAbDtEeul+DY6EiVz7KIxBzfle5qT6SfLoTkqfmztIyrmW6/z60WZS
 0E7jV430e23EQHrf1AsVuT5wy9hPTlm6jAkwLney8Ros7Ptjz9lrpnDkx4CAW/pjD00D
 6S4cd+fkXGMBcECWSDPH7QVV5lyLeGJaN7yfuMNlyqdrIFl5TxucwF2s7+WGFUqbssa3
 HOjCEW1nB/M6At0dsskrvOcIdmhPAqG4tDC3R8FguU2LZwvIR0WhOdBqO7vodce4+Wj/
 Y6zmPxmwwmQ7N09Ljpc2jjBfblCTssJUj3U1JzXUSjUNc75/5CYAid2n0sa/1HT+3T0n
 OlFA==
X-Forwarded-Encrypted: i=1;
 AHgh+RofqjpxEePIS42dX684dpjyWM+/b0QvrjrH5boGq2nU1Z+MfkewMQW9rhZxs2Mkf+AwGUTmslKoQg==@nongnu.org
X-Gm-Message-State: AOJu0YxPUGerGeHmK86Ef4OPWNImkJMCQcgNqa5DN5whida2GeKNz5KB
 9YrcxPt/kyHJvrHA8GbAnI8NmLt8Wup7ArTF5CGfYZcNd/7CTkPYSK8NoSsB0XCFJIoUdvNgJa6
 mXk91QimPOkmvsvkHElISEy6KenbtYQ174d7vGrz1PA==
X-Gm-Gg: AR+sD11Z42fEeVUKr+pOniSD8ucCQ3F8/dPrin+Z7UAJ8TGwByG7hhAuBBv68K4YuXA
 cRappu/UzM7TB0hAPlM5rkqOevp3rQkrKDLfk2eYsAFeZuu72HobjShWsh0zkL/JolXdKw+yIho
 3LWYsWNezm5qdMb+nidPSyeKnJQCOWg5ep81VXTJ8b0F8ZJTuAEIYX+RPfkGaOFqzw0jUE2IMFy
 /OKNyeN1AA76Bg1tkoRJnjL82RaMi0IM/lF36kvZuDP5lbeYHFy+egXBMTgv/nXBiQYDZCVzHE8
 gufC3y0QIFd16X2jPnpsLk5Syb7QIb4EeyD/RzX7ykBChLUVByc77I+OLdWqRNWCvqaGtmbG1qg
 Hx2MMeallVU0=
X-Received: by 2002:a17:906:f583:b0:c20:3733:a8c5 with SMTP id
 a640c23a62f3a-c20e608810cmr75748266b.8.1786438420382; Tue, 11 Aug 2026
 01:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260811081401.51771-1-alexander@mihalicyn.com>
 <33a61f97-d058-466c-9793-98e2618790ba@oss.qualcomm.com>
In-Reply-To: <33a61f97-d058-466c-9793-98e2618790ba@oss.qualcomm.com>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Tue, 11 Aug 2026 10:53:28 +0200
X-Gm-Features: AUfX_myjHJrHUTybz8dXpWu44oX0xd9tthWOxjy7dmUdCYZpJpY4rs-m2Q505l4
Message-ID: <CAJqdLroHhv05B_4105eX1GsFGOdD-qfP9ijF36WWg9keuuYnUg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/char/pl011: support backend hotswap
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-arm@nongnu.org, =?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>, 
 Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alexander@mihalicyn.com; helo=mail-ed1-x530.google.com
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

Am Di., 11. Aug. 2026 um 10:30 Uhr schrieb Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com>:
>
> Hi Alexander,
>
> On 11/8/26 10:14, Alexander Mikhalitsyn wrote:
> > From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
> >
> > Currently, when Incus issues "chardev-change" QMP command to change
> > chardev backend from ringbuf to socket it receives an error (with aarch=
64 VM):
> > "Chardev user does not support chardev hotswap" [1], [2]
> >
> > Let's fix this by properly implementing BackendChangeHandler for pl011.
> >
> > Please, note that we have to "replay" CHR_IOCTL_SERIAL_SET_BREAK, becau=
se
> > if BRK bit was set before backend change (i.e. (s->lcr & LCR_BRK) is tr=
ue),
> > then after change we need to send break to a new backend too.
> >
> > Link: https://discuss.linuxcontainers.org/t/unable-to-connect-to-vm-con=
sole-on-arm-architecture/23096/3 [1]
> > Link: https://github.com/lxc/distrobuilder/issues/892 [2]
> > Reported-by: St=C3=A9phane Graber <stgraber@stgraber.org>
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion=
.io>
> > ---
> > v2:
> >       - fixed a typo in commit author name
> >         [ I did `git format-patch` and copied this patch from my Raspbe=
rry PI
> >           dev/test machine and it turns out that I have a stupid typo i=
n my
> >           `git config get user.name` on that machine. ]
> >       - added RWB tag from Alex Benn=C3=A9e
> >       - adjusted a commit message
> > ---
> >   hw/char/pl011.c | 16 +++++++++++++++-
> >   1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> > index cb12c3e224f..3622248ec0c 100644
> > --- a/hw/char/pl011.c
> > +++ b/hw/char/pl011.c
> > @@ -660,12 +660,26 @@ static void pl011_init(Object *obj)
> >       s->id =3D pl011_id_arm;
> >   }
> >
> > +static int pl011_be_change(void *opaque)
> > +{
> > +    PL011State *s =3D opaque;
> > +    int break_enable =3D s->lcr & LCR_BRK;
> > +
> > +    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive=
,
> > +                             pl011_event, pl011_be_change, s, NULL, tr=
ue);
> > +
> > +    qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK,
> > +                      &break_enable);
>

Dear Philippe,

thank you for the review!

> Could we factor the common code used in pl011_write() in a common
> helper?

yep, I think we can factor out CHR_IOCTL_SERIAL_SET_BREAK call
together with break_enable variable.

Please, can you look into our thread with Alex Benn=C3=A9e:
https://lore.kernel.org/qemu-devel/87h5l22faq.fsf@draig.linaro.org/

It would be great to have your opinion there.

Kind regards,
Alex

>
> > +
> > +    return 0;
> > +}
> > +
> >   static void pl011_realize(DeviceState *dev, Error **errp)
> >   {
> >       PL011State *s =3D PL011(dev);
> >
> >       qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receiv=
e,
> > -                             pl011_event, NULL, s, NULL, true);
> > +                             pl011_event, pl011_be_change, s, NULL, tr=
ue);
> >   }
> >
> >   static void pl011_reset(DeviceState *dev)
>

