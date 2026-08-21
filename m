Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DC6C5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 09:57:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxM09-0005it-8v; Fri, 21 Aug 2026 05:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxM08-0005iN-4b
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 05:57:28 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxM05-0004c8-2Z
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 05:57:27 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66ceaade3f1so247086d50.1
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 02:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787306243; cv=none;
 d=google.com; s=arc-20260327;
 b=FJ5txtD7DylJCvU1hbieFHt8Y59DqS1IL8iI+N8PMEWu4c6HaYG0ESDEQ511w+qwXL
 G+UYuEHsVOr7yL16MnPcjCG2Sf7ucjJpyMzsMKfFBet5LWTMOMnhLivdKQRG9Yo/gthL
 o6VVlF5gq7BnZpAWlPgz1fmD0lboTIOklaBubMCnjgdPsdIDQNJ7YEMAFBqgF7ZyTUsQ
 9KHmlQR9hZYirZm5xiteQeTS+jMZjs2wwo3MK+FXc4TGC0SRcrcv10HDg+KUL9JlDfQv
 +BQz0Vx9IupwkuJzWUqpUDKkci0xSexoxZoUHhCzHS8SPxSoPdYko6s3wuD5aAQLOLzw
 QY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QlwE2BZT0vFPaM9sreHJ6Q5FEFcI6GiSfHphOHDg26c=;
 fh=Hnlhg+k1LNaT0Fp5jeLZ1WK+LMTgXBaN0Tox1F5Gw9s=;
 b=ofXerq2QKOVrobjHbksCUQc9M2XKjGO8GdT6s75uBF8ye8ig9RN+qJYCFb5yGG8N6d
 zmdFWrXjP6UlbdAdoyrYpkITOgMpkzBa1feN0WPHzZlFyuthZELomDNGSafyy9uqRunT
 xijHyINsfOu/bfOZaDPD1QIR63Rna1+8BjDZk3JDhnVK4C7N4t94eL6LpixqpG/ZP+vv
 kO2dkauCU3myw5k/kqyhYukdNPxqlenTdFoEQrB1S0UIFUA9kHPVnyATCE5a3eIw22rf
 387qptjxTUfbBuLoUnblP2RiCVoRSg1aFdfPbLLq6POmtKlQbvpyJi476mvDevFv3yDE
 lvhA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787306243; x=1787911043; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QlwE2BZT0vFPaM9sreHJ6Q5FEFcI6GiSfHphOHDg26c=;
 b=xCW2u4Wsxe5Zotj/kBQUAVn3q4jsLfnJGTj1gIVhmdDDDHtbBMI+HBpc92hkgPqTpn
 7XX2z5qn9qTZMpAkVBIyL08JjW9YyVDqAfrkE7i9Nl/NjllVx4tzXwlNGUYTWM8a+azd
 /rG6Upm5T4fC0myNsTi25vWsdkUcqsgYtER9/O7zOHcNNOULtwO21+8Qfk+ShwK6rMld
 H0gw9T3OOVOw1xxPSOAt1LSKDGfo+hRvmOiE26rD2MGMFXTkoutxfB0Q7/OIv/zucPcf
 dpIs/zO14qboFR0/53EHPkLp6a+4eeuveEd8Pmi7aJv3p+DaJQ5NwZ3TgQBMZY72IeCS
 GZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787306243; x=1787911043;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QlwE2BZT0vFPaM9sreHJ6Q5FEFcI6GiSfHphOHDg26c=;
 b=D5TdUwNZ2knIhsmg5WUcgbSEIEsSEFdn8CfCYm5TCPwuPlz0oUekvt4OgGTQ6CvlvA
 eFnJJAcI47PQ6HT4y1I7mwDANk71wiGjl8pz2jxL3f2lYklYSR+dfiTZOkgeEbUE91FO
 Vot0cF3Xtl6r+RcgCNjCOb4X99i6w0fAuVUBGljgDrieqFMvg33vtS92MHE/BiHIs/QL
 ZQfq60xz/cXPqH8yJ56lhreZidut0DFHZ3pOPOISuQrlGPK7p+JpQh8IyHBaFiRX6G8i
 weU+puWp/As6HzWg1vUVwSwELeC5EEzfJrqSSLbvKvERZVECzZcj0x19YsqXfzJhDArA
 coMw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqHfuQ+3IE7cSdyV7Zgq5jg71fk7/EQZcjU0mmU6pc4bkOu7b38XsfiZh6MqJC05ZABTs64PUiFCQ==@nongnu.org
X-Gm-Message-State: AFuF++llckHXtZJgwP7RURoCZtrp9AcHjeXI6+2+g8y0Da6EA4KAuusd
 rZA5j8Out7Rtl59Ol3WIbdwF8yF046rLj/Uns6BsfdDPtTbwEUpApPqDJ5QawYzWAedqpiyv9Gm
 rJrb9iHAGv8/7lJ9h226gTpA1gUlwgN2W9PiSkNsPsg==
X-Gm-Gg: AR+sD10X6lWOrSTQul6+3tYFjCdCzQIh3nkOrgrRACxIZ+OU8aHIVRDiqbbBKUfr8Ex
 YfADH8f9sMhzg291EeHw58YswSuvkYdOhDRecthMgkjugY6R2IX/rrYncYyqxWYX4OOMk/tE3Iv
 x9rIseS8GAv0hxyy9LGeb4IZcVu32IP1+/zFOSdR0nDgiwO+5IckAOxcmmKcqBoFwhTOR/1l2nw
 1idFJ/kaexOij4Ts4aiNqfcHLzU2iG/xnDBWTG/6irP5SDpGs3PeLwiG+v02XueQY6Fpc+3pUtq
 quxIMukpjIXSNoXnx4VPchww8GTl0AcvUkTVXJp+8EIZMPDFmaosiFMP7wa4eBZtHgpaWZYUwbY
 b1ekL6jGe/dqZVGPKtoIC6aL5TPar
X-Received: by 2002:a05:690e:1c0c:b0:66b:2f08:db1f with SMTP id
 956f58d0204a3-66ce4a54085mr2022772d50.19.1787306243478; Fri, 21 Aug 2026
 02:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260817113349.103833-1-alexander@mihalicyn.com>
In-Reply-To: <20260817113349.103833-1-alexander@mihalicyn.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Aug 2026 10:57:10 +0100
X-Gm-Features: AcwNN1X-J4scuRABFwA-0Icsm2oGAxxK0j1_zYAKmr-eyqDSlvc_c65wnUXDd2A
Message-ID: <CAFEAcA-BsxOCC4eM1ohcnr3_xmCabKNWQchtdsVzO91stiir-Q@mail.gmail.com>
Subject: Re: [PATCH v3] hw/char/pl011: support backend hotswap
To: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Mon, 17 Aug 2026 at 12:33, Alexander Mikhalitsyn
<alexander@mihalicyn.com> wrote:
>
> From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
>
> Currently, when Incus issues "chardev-change" QMP command to change
> chardev backend from ringbuf to socket it receives an error (with aarch64=
 VM):
> "Chardev user does not support chardev hotswap" [1], [2]
>
> Let's fix this by properly implementing BackendChangeHandler for pl011.
>
> Please, note that we have to "replay" CHR_IOCTL_SERIAL_SET_BREAK, because
> if BRK bit was set before backend change (i.e. (s->lcr & LCR_BRK) is true=
),
> then after change we need to send break to a new backend too.
>
> Link: https://discuss.linuxcontainers.org/t/unable-to-connect-to-vm-conso=
le-on-arm-architecture/23096/3 [1]
> Link: https://github.com/lxc/distrobuilder/issues/892 [2]
> Reported-by: St=C3=A9phane Graber <stgraber@stgraber.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.i=
o>
> ---
> v3:
>         - introduced pl011_set_handlers()
>           [ as suggested by Alex Benn=C3=A9e ]
>         - introduced pl011_set_break()
>           [ as suggested by Philippe Mathieu-Daud=C3=A9 ]
> v2:
>         - fixed a typo in commit author name
>           [ I did `git format-patch` and copied this patch from my Raspbe=
rry PI
>             dev/test machine and it turns out that I have a stupid typo i=
n my
>             `git config get user.name` on that machine. ]
>         - added RWB tag from Alex Benn=C3=A9e
>         - adjusted a commit message

I have one review suggestion here:

> +static inline int pl011_set_break(PL011State *s, uint64_t lcr)
> +{
> +    int break_enable =3D lcr & LCR_BRK;
> +
> +    qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK, &break_enable=
);
> +
> +    return break_enable;
> +}

I think this would be better with a similar API to
pl011_loopback_break(): make it take a bool brk_enable,
and return void. (pl011_loopback_break() takes an int,
but we shouldn't copy that: it uses it as a bool, so it
ought to take a bool.)

>  static void pl011_write(void *opaque, hwaddr offset,
>                          uint64_t value, unsigned size)
>  {
> @@ -462,9 +471,7 @@ static void pl011_write(void *opaque, hwaddr offset,
>              pl011_reset_tx_fifo(s);
>          }
>          if ((s->lcr ^ value) & LCR_BRK) {
> -            int break_enable =3D value & LCR_BRK;
> -            qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK,
> -                              &break_enable);
> +            int break_enable =3D pl011_set_break(s, value);
>              pl011_loopback_break(s, break_enable);

Then this code becomes something like
    bool break_enable =3D value & LCR_BRK;
    pl011_set_break(s, break_enable);
    pl011_loopback_break(s, break_enable);

which is more straightforward than passing the raw LCR value
to pl011_set_break and relying on it returning the "is BRK set?"
information that we then pass to pl011_loopback_break().

> +static int pl011_be_change(void *opaque);

> +static inline void pl011_set_handlers(PL011State *s)
> +{
> +    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
> +                             pl011_event, pl011_be_change, s, NULL, true=
);
> +}
> +
> +static int pl011_be_change(void *opaque)
> +{
> +    PL011State *s =3D opaque;
> +
> +    pl011_set_handlers(s);
> +    pl011_set_break(s, s->lcr);

and here we would then pass in s->lcr & LCR_BRK.

> +
> +    return 0;
> +}

thanks
-- PMM

