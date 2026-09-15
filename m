Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049FDC88E75
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 17:47:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6XF9-0002xc-MH; Tue, 15 Sep 2026 13:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1x6XEz-0002x2-Bi
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 13:46:45 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1x6XEx-000203-Pm
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 13:46:45 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4aae3147so24113d50.1
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 10:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494402; cv=none;
 d=google.com; s=arc-20260327;
 b=RqG3C3Q29jlDe/JpnM5JLBkT0z4IqwfSlqvUUVLiqAnecLnx/vgeRl/Ep2TvI7/t/H
 B4pNKxYIQFvGBH/Y4UdknJqHVLOn7B+rppBUsJERdko2ywalh+DSM76auSMr2l9XliYR
 YbCIOGOVMq4L699PQwKPFmyWDCq2PPNbu58Q8a8qrcMlQNYLFklEiEw0PjtitUv6mIAH
 LauVkJpUIxqiUP0tc0z/dODB/Gdfo9RffPPCqdFLWkw/G62l+2ydBs1Wuf836L6snQu6
 4x968hQ2JByDue9dtWA9Z6XwTTL71o3JlWHQmcD2onOIpMpb/Y04nuytjvDGLcUCvDrB
 Ok5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=JqnbvjRKaNs4t7UaOgr9WJqmBpRK5gzPC9BLZmCBw2s=;
 fh=JuvjeklEozbvbrgE7J9UoavVap0AkTzdcFH61GTpxzE=;
 b=rEKI9hKNytX4vrIrUF/r3XkEgkQLEy+lXtR6HxVkDT7gjUeeQiWBZLwAsWY7jFL21d
 Vwa8jTDAB61aQHnOIgQjzw8P3su/iRHNke5GWsoVMeyiL7ZC8N3QUMAeaFscy8dxloI+
 pBAKARlBIzsrEj/yxnPBB/ksm59XvP2xE4c0eY0zF+dVjr1s6Rgykf/P9TKmfD8GQbLV
 8GiJGTQw6X8UtKWquicSHt9NdOxBpBOiYqQzAjKVyh1FFzPDMBzENeVlkz8HF2CQg2S3
 HZDEbnY+RoEx/KKXY20q7nYhWGqTvhYdN1k6SU7LcfSD2FdEiQltG6BcaWtTBLCaKqpq
 suQg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789494402; x=1790099202; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=JqnbvjRKaNs4t7UaOgr9WJqmBpRK5gzPC9BLZmCBw2s=;
 b=Fz8PZML47Fs2rClhvqPmte8B3Kl67FpwWyVWyL+9gOMvcAiyFOeEznFwQdqR44BhjK
 qDdD4Cse/69Ps+GT41bU/uraBJ4nWASTJfdA+ltG84xckPU2Sv9i43N6oMBkJG9Aveas
 NOAqK3kAeJcfTioJTd+RwPUGtlAkVlgDfyY92UnkuxOjRxjYUzvrSvRkGVqhTedSjUKg
 rB+OGO/tBUrrIDI2X2ZEhFbHZOK0+KvX6oDRL5O2vGp7KE8uyTKVLc+FBpSotjUH5iKm
 aEs8UxoszBliQECQ38Q1ZUlzkIuZ3WmprbG+e8QehTGT32S/v3vtSnUutxQxT95CwjL+
 FxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789494402; x=1790099202;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=JqnbvjRKaNs4t7UaOgr9WJqmBpRK5gzPC9BLZmCBw2s=;
 b=ry7uKKoGt1v3i/RMmvXlnibnKqov2zlW3Rmtx20rv+5Xq9eLmPfKdD2XFVZ1KKDN3m
 59Tdnj1Ff9JLj4zUfi0+VH1XvyOTO+mavlTUkuc6bCvGtmARJOr1YXOwCpIIYpKN1mJV
 tMPjOUkVKhJJMxofY4ddGRUEq9he2mCgrf20tkqAgb5S1FF0p+FyTMYwXKf3kX0rVstA
 Ixa6yAZ0GYzmddQv4EOcsexx7BmCJHLpu2fu4oAFw2BmyjmwMKZidtt9IHBC9HJSGli5
 AbqgI12mO3bang8L+HOFiW3lzzxxWw0FcJSTDuIkelZxhE92qI0k3nXRsCy7LKyQxtjC
 MkPw==
X-Forwarded-Encrypted: i=1;
 AKwUvByBku8B/S0Tk8UNK/rjljAXTXGzK4gB+IJRS7L1M4f4SCjCWuDapTLDHwI0Todvx8++KWniMZEhXw==@nongnu.org
X-Gm-Message-State: AFuF++mjisf/sHza4aaI/1L+1w3h9wc8QE9aajO4XM3a5mGcZROoxX+8
 mcuSuBHkIqi4m8kXPm3ijEMXpWIY4rcQf4zPMGb9py7YyfsIH4CTKYOIVkaeGLoOPIlCHBnIs4T
 H/wgBszQFoH1WKqsjraZrvjeh3atC35I=
X-Gm-Gg: AYBFou0osz3M5ZXAmX+sMoxs9yN71Q7dGHwincZUXZn/kVaGyu7BGET4az/zyogcCVy
 6T+yCfT+L9jFxWAvtL1hQZllk5Ub0XdT59lOD0qG9MAEafCDjDNzGqniDp7GGV23aCzQVFr6uci
 PElto8UqHSipDzQBi1ubV2CSKLCunwfNgsp0a85jYf3QIdaGyD6iiTtFIlkQu6atvnhePjyPEMw
 zFOE5i9zMXN66APefp+eQQjlb0X4o+a99qma7yRTNUSGa1MPzOkTLF7oAz+5XJZ/9trTTon5ql2
 JhJKcgo8Av4G0+Djf/RuorcsedDJ0a37ctMMW+TQ65tnmGN4quw40a7a
X-Received: by 2002:a05:690e:1246:b0:671:3bca:6afb with SMTP id
 956f58d0204a3-6715ee536a8mr376492d50.54.1789494401862; Tue, 15 Sep 2026
 10:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260913-allwinner-gpio-v3-0-a9affa474b3b@gmail.com>
 <20260913-allwinner-gpio-v3-1-a9affa474b3b@gmail.com>
 <CAFEAcA-TOjsMHDpThkBP_Mjbt+gA23SoXabOpAUVMdoFbRGjow@mail.gmail.com>
In-Reply-To: <CAFEAcA-TOjsMHDpThkBP_Mjbt+gA23SoXabOpAUVMdoFbRGjow@mail.gmail.com>
From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Date: Tue, 15 Sep 2026 19:46:30 +0200
X-Gm-Features: AcwNN1WMEfReOA_p7LXyaSv7o0a0puUzAm3Mc1MLADl6ECMXJ13i89FmSaZzwZQ
Message-ID: <CABtshVRxVrN7jgp6EwQAb8ss+SsS=DbQEaeqSjtOpZaFButYxg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/gpio: Allwinner A10 GPIO emulation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Jack wang <163wangjack@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000269119065b89228a"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-yx2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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

--000000000000269119065b89228a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 5:24=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Sun, 13 Sept 2026 at 19:17, Strahinja Jankovic
> <strahinja.p.jankovic@gmail.com> wrote:
> >
> > This patch implements Allwinner A10 GPIO peripheral emulation.
> >
> > The emulation focuses on input/output and interrupt functionality,
> > whereas the drive and pull up/down functionality is not emulated.
> >
> > Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>
> > +static inline void allwinner_gpio_update_all_output_lines(AWGPIOState
> *s)
> > +{
> > +    for (int port =3D 0; port < AW_GPIO_PORTS_NUM; port++) {
> > +        port_update_output_lines(s, port);
> > +    }
> > +}
>
> This doesn't compile on clang because this function has no callers:
>
> ../../hw/gpio/allwinner-gpio.c:257:20: error: unused function
> 'allwinner_gpio_update_all_output_lines' [-Werror,-Wunused-function]
>   257 | static inline void
> allwinner_gpio_update_all_output_lines(AWGPIOState *s)
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
>
> Should it be being called somewhere, or is it just a leftover
> from an earlier revision of the series?
>

Correct, it was used only in the reset function, but I removed the call
after your comment that
the reset function should not update outbound gpio lines.

I will remove this function in the next revision.

Best regards,
Strahinja


>
> thanks
> -- PMM
>

--000000000000269119065b89228a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15, 2026=
 at 5:24=E2=80=AFPM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 13 Sept 2026 at 19=
:17, Strahinja Jankovic<br>
&lt;<a href=3D"mailto:strahinja.p.jankovic@gmail.com" target=3D"_blank">str=
ahinja.p.jankovic@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch implements Allwinner A10 GPIO peripheral emulation.<br>
&gt;<br>
&gt; The emulation focuses on input/output and interrupt functionality,<br>
&gt; whereas the drive and pull up/down functionality is not emulated.<br>
&gt;<br>
&gt; Signed-off-by: Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p.ja=
nkovic@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&gt;<=
br>
<br>
&gt; +static inline void allwinner_gpio_update_all_output_lines(AWGPIOState=
 *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 for (int port =3D 0; port &lt; AW_GPIO_PORTS_NUM; port+=
+) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 port_update_output_lines(s, port);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
<br>
This doesn&#39;t compile on clang because this function has no callers:<br>
<br>
../../hw/gpio/allwinner-gpio.c:257:20: error: unused function<br>
&#39;allwinner_gpio_update_all_output_lines&#39; [-Werror,-Wunused-function=
]<br>
=C2=A0 257 | static inline void<br>
allwinner_gpio_update_all_output_lines(AWGPIOState *s)<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
1 error generated.<br>
<br>
Should it be being called somewhere, or is it just a leftover<br>
from an earlier revision of the series?<br></blockquote><div><br></div><div=
>Correct, it was used only in the reset function, but I removed the call af=
ter your comment that=C2=A0</div><div><span style=3D"background-color:trans=
parent">the reset function should not update outbound gpio lines.</span></d=
iv><div><span style=3D"background-color:transparent"><br></span></div><div>=
<span style=3D"background-color:transparent">I will remove this function in=
 the next revision.</span></div><div><span style=3D"background-color:transp=
arent"><br></span></div><div>Best regards,</div><div>Strahinja</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>
</div>

--000000000000269119065b89228a--

