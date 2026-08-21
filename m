Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B88DC5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:38:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMdw-00016b-7Q; Fri, 21 Aug 2026 06:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander@mihalicyn.com>)
 id 1wxMdv-00015I-7n
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:38:35 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander@mihalicyn.com>)
 id 1wxMdt-00009U-3r
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:38:34 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c15c42a45adso327780966b.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787308711; cv=none;
 d=google.com; s=arc-20260327;
 b=HC4in2We66iGXG6wGX9k+eK9YYEdzX7a+G0GSiO8T0KkJcskZ2hS042agYrJCaut+d
 SuKKMj4uEJ7Cu+kSuZ3SlTRrRnBkq6R6RyXsR8imrd57ug2Fps+gCs5ehl/gK139hUcp
 U6IdHbRsIWW/LBHh6ID/QFeS9yvAoF0V42UHjwQVp7JDCUj6HweUVaH4VlKUJ+dgEYS3
 FtNE1H4wDh3nHc76gBHBLcvdDClNt7BBaXZYij5lOEvXQkMxbv9X+/1buQmjlLHc61+J
 4/vvgg8Y1/IggC3brwIIvGbzM1ANtDzzqSZxxZmC64JnfyEQQ7tmxKnyCLHCuYy+zZa8
 WdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YDiTFJFgXmJVItqIZoQblfN5qchlanA5Lo23Yv5j74E=;
 fh=p1NQkEJqnwpxV7empgaMr3UZrFGc3wCPoNw8zp3fRms=;
 b=U6vfSc8cOdDsTHzgSd5HjArA9rW2jB7CtHDh4KGmJQDWsDBzq+DaTktZFIw1dOXJ4I
 0TXjVFxjxsrCzefp9M2Q78UibUyMkdXQP/lLjUP+MVB+BBZ5yxaH3TAhEJMh/ja8uSrz
 YqQxvk5lIKcRzLy+ZK52aaNdFXgnHJCm4KKqev2fsMEqRcmABrau+0Gm82IY8YQ4uOFg
 V+WpAF7zysdGIIhvK/T7EBvRcHE2Ov53jxbtRn8qv/2yvJ9X0VFwv5LQfYQunm9VIiaF
 smtmCuLe2cSvaCU7EOJCI3gvgyFRgSlGKQ0uLBASW8z2ndG+ZiKOKSrHPgkGp0qakSg/
 PNJg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mihalicyn.com; s=mihalicyn; t=1787308711; x=1787913511; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=YDiTFJFgXmJVItqIZoQblfN5qchlanA5Lo23Yv5j74E=;
 b=VIO89pKpyUD85uFss7L3WAsExvX3505i3ItfZERYN35eq5JwG0AG5EgB35KlGAH0wa
 rzoj2ZWe9y3OZNY1CV0/Kxa4bFQKjvHIN3lunmojTCKhu9XVgMhaBckNXX/WAreYlc9U
 PSoIyTN0UEvRR3yJhY91As18v7z7Gsc9DXXt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787308711; x=1787913511;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YDiTFJFgXmJVItqIZoQblfN5qchlanA5Lo23Yv5j74E=;
 b=EoBycDaED2CxkTo/xYNfwWET4AZ4+KiA8lCYll7MTixBpFQlMxcW0G70+10hN3eIIl
 v0x0qrufkMw3h3cWpAwquAT7h8ejKdOO7tWfPPmCrVCkS0G9/Onu6QLtZN0c8Ig5rofE
 4u7vr8pTIT9+nt/Li5EUJRs541HL8PGbhe+jw1/GSa9VfQ4ZOHpk82dCRoouNrJrzyzO
 zaARANPoKUP1gDv0OcUkPRbUwA74VVwOAezh09nc8hhRVAPpojjWuQMQNsShnPH1KOFy
 KjqK1Km5p6BtiSyZk9fZXk3Cd/z9bC3cIt2WlEzMTgL4zKAzqFL9cdA5MnwnOfWkgNtR
 2CVw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoiuQvxfj/hQTVBPV+d48hxihDa2FEA6ojDYsFzA44ZdY8QFZoRip4iF/9Cpm6Svg0glvNuxyBPXw==@nongnu.org
X-Gm-Message-State: AFuF++l8DQyEDfFXwqrS/nk1NE2ss0BsY9EXIGiwObnApfF0pgHnmyIg
 WVjr2cVR7L1GidMnNoywytnLYjOfn8YAzU4SaivkYNauZrZ/oYiz/5gd/YogiRn/lsYLYzKQ64S
 y12DIi/BnT5jQKzfUzR0xEKsm03Gbf5PllNQbUUglCQ==
X-Gm-Gg: AR+sD10/nmNa3boPjBtkB7W9NVUF679r7blqEUXthPsFqT1rdb9BKVXUFTde5oOGJPN
 q1QkLX+CmVeObKyg3HyHJjho0doeuYlaIN85TkBJ7/QH+mlcAESjtVjdq4gYbGay4RHHH7Goou4
 E5e9O3N+skjRm7wmi3NjoiCYkx3OxueE0E1IFCxDklsAFwtanc1vg1u4Gz8dHRsQAovqxDr4aUQ
 k8GdcL02R9rOBd3gorwSqxEIasjpfmD0ATtsvqZa4mknyJ/E9BpOYzgSkkcuDHprC+NOgAiLNRl
 YgefH/zXCfv+d6ve+Abjpzw6LllzqOsQT/E4ov1xRlH/RpG9+bi0bRllElrYPWd3VwbgqO3tK3g
 3
X-Received: by 2002:a17:907:e8c:b0:c20:f85f:e7c6 with SMTP id
 a640c23a62f3a-c244d69f833mr955306666b.8.1787308710528; Fri, 21 Aug 2026
 03:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260817113349.103833-1-alexander@mihalicyn.com>
 <CAFEAcA-BsxOCC4eM1ohcnr3_xmCabKNWQchtdsVzO91stiir-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-BsxOCC4eM1ohcnr3_xmCabKNWQchtdsVzO91stiir-Q@mail.gmail.com>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Fri, 21 Aug 2026 12:38:18 +0200
X-Gm-Features: AcwNN1WDP8i18Z9l7PTydhOY1B1ZEJmaUUSq_o2UY3hV1AztTS_gaDrP8QiwNrY
Message-ID: <CAJqdLrpdp1mfFU9ci62z4Ck29o9LMAbCOgq22xdCBvezkrov4g@mail.gmail.com>
Subject: Re: [PATCH v3] hw/char/pl011: support backend hotswap
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alexander@mihalicyn.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am Fr., 21. Aug. 2026 um 11:57 Uhr schrieb Peter Maydell
<peter.maydell@linaro.org>:
>
> On Mon, 17 Aug 2026 at 12:33, Alexander Mikhalitsyn
> <alexander@mihalicyn.com> wrote:
> >
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
> > v3:
> >         - introduced pl011_set_handlers()
> >           [ as suggested by Alex Benn=C3=A9e ]
> >         - introduced pl011_set_break()
> >           [ as suggested by Philippe Mathieu-Daud=C3=A9 ]
> > v2:
> >         - fixed a typo in commit author name
> >           [ I did `git format-patch` and copied this patch from my Rasp=
berry PI
> >             dev/test machine and it turns out that I have a stupid typo=
 in my
> >             `git config get user.name` on that machine. ]
> >         - added RWB tag from Alex Benn=C3=A9e
> >         - adjusted a commit message
>
> I have one review suggestion here:
>
> > +static inline int pl011_set_break(PL011State *s, uint64_t lcr)
> > +{
> > +    int break_enable =3D lcr & LCR_BRK;
> > +
> > +    qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK, &break_enab=
le);
> > +
> > +    return break_enable;
> > +}
>
> I think this would be better with a similar API to
> pl011_loopback_break(): make it take a bool brk_enable,
> and return void. (pl011_loopback_break() takes an int,
> but we shouldn't copy that: it uses it as a bool, so it
> ought to take a bool.)

Dear Peter,

Sure, I've changed this ;-) The only thing is that I kept brk_enable
as int, because in serial_chr_ioctl we have:
static int serial_chr_ioctl(Chardev *chr, int cmd, void *arg)
{
<...>
    case CHR_IOCTL_SERIAL_SET_BREAK:
        {
            int enable =3D *(int *)arg; // << int is assumed
            if (enable) {
                tcsendbreak(fioc->fd, 1);
            }
        }

I'll send -v4 in a moment.

Kind regards,
Alex

>
> >  static void pl011_write(void *opaque, hwaddr offset,
> >                          uint64_t value, unsigned size)
> >  {
> > @@ -462,9 +471,7 @@ static void pl011_write(void *opaque, hwaddr offset=
,
> >              pl011_reset_tx_fifo(s);
> >          }
> >          if ((s->lcr ^ value) & LCR_BRK) {
> > -            int break_enable =3D value & LCR_BRK;
> > -            qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK,
> > -                              &break_enable);
> > +            int break_enable =3D pl011_set_break(s, value);
> >              pl011_loopback_break(s, break_enable);
>
> Then this code becomes something like
>     bool break_enable =3D value & LCR_BRK;
>     pl011_set_break(s, break_enable);
>     pl011_loopback_break(s, break_enable);
>
> which is more straightforward than passing the raw LCR value
> to pl011_set_break and relying on it returning the "is BRK set?"
> information that we then pass to pl011_loopback_break().

+

>
> > +static int pl011_be_change(void *opaque);
>
> > +static inline void pl011_set_handlers(PL011State *s)
> > +{
> > +    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive=
,
> > +                             pl011_event, pl011_be_change, s, NULL, tr=
ue);
> > +}
> > +
> > +static int pl011_be_change(void *opaque)
> > +{
> > +    PL011State *s =3D opaque;
> > +
> > +    pl011_set_handlers(s);
> > +    pl011_set_break(s, s->lcr);
>
> and here we would then pass in s->lcr & LCR_BRK.

+

>
> > +
> > +    return 0;
> > +}
>
> thanks
> -- PMM

