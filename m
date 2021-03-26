Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1410133lfg;
        Fri, 26 Mar 2021 07:28:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwED4CmbR4kxSUEdofeK6Y92gbGwu96WS0vravUVfeewgtGv3IcekP9jC8YX1U8OKDyn4Zf
X-Received: by 2002:a05:6e02:12a4:: with SMTP id f4mr10472743ilr.67.1616768912958;
        Fri, 26 Mar 2021 07:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616768912; cv=none;
        d=google.com; s=arc-20160816;
        b=HsjkilB+gICetoCLycZON+lV4Mg+ePkI5aIkk6AODwjsAEXS+Cc9oAPtOOATAqybbq
         SXJkz6O4y5waWzC2to8GJUb6OdR2o5v68pHcUaCz7QV1SPumPGQqOmiDRACDl9rl7X2A
         Hu4eu30OKvVdLXm3YpEDTaeT6T3u44xKm6BxdtVmrSQVzhaezLZixvej4ciK2sB32J9g
         J2TlD1GoaezgLAhCwDjTr/knA+1bQMn7i/VWMBcEAaKuSE9jwXGhPCglhxyi1fRyUUB/
         U9dtKVz8pXGOeNC4Umaucv5Lrp9SRhXunvq5ClKsWbtL/k7D4XxCFJ4fL3HvWmErqJxy
         g4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vLMn8xhrRdrsk18NxgS6s3dNqz6uk8Tg1YM50czx3I8=;
        b=OYntVJ45PamnVwOmMEilId8Lg2VszBDU9rxlhdEw1ONIXE5e7PNb8+LtRXTxAFIuOs
         pUqMths3X+xALW5IHIIIS3DCqTjV3ZVVnSLd+BM5nmD2JRPr/StuGyqDEOayS8lkJpzV
         Dxt5Wr+khPE/cpnthAyborAlNrf/+/cJgTmT+xYLWn2jhzeARyZBVRcLyCRCn2Jo/arX
         TzcRDsUq3DpcdgMlsfcMewlEIFvPEPglvDxMPBwbLt1B/OZBVumcZ/9AkBwWBXCYCt8v
         XrXK4jrJrglAHJMSjIvN6cNv260QV3yNzd9YbjJpSIYG/aSWrr7MErMWDLQxC0kMgoYh
         /MaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fpOqzneZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si7491954ilm.45.2021.03.26.07.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 07:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fpOqzneZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPnRw-0007vv-8K
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 10:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPnRm-0007su-4L
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 10:28:22 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPnRk-0003Ny-6L
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 10:28:21 -0400
Received: by mail-ej1-x629.google.com with SMTP id w3so8714877ejc.4
 for <qemu-arm@nongnu.org>; Fri, 26 Mar 2021 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vLMn8xhrRdrsk18NxgS6s3dNqz6uk8Tg1YM50czx3I8=;
 b=fpOqzneZ9YZOtgK/iiNdnxxaz3WuSEAvHqyBWL7TIJDSG0qCLUoGKIhgkR4EvTmmEE
 TbTT8tjfpu5LXw0oLquE7WZSowNcpVIo3XvX1R6H3MJ4hAbT9Z6JVEcWjLXTAeX3vp83
 Dm/fZ5eckZmlwn/9TznjM4Am9B3l5UPeIrVl3hxSEVD+EIFXH0nCloMJuqfDPcYdevjW
 VB7HJSm2KnhG5pyRcjMSVxDo5c851lwJQD9olU543oJvE5AwwN1PZR2Otx4xeX1ZNxur
 j1884s/zqt08+vZki+X5cJB9QyOldMIIdmXZOfay1nYcbj6/RjKgqbljgLPY65A7GFnS
 vuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vLMn8xhrRdrsk18NxgS6s3dNqz6uk8Tg1YM50czx3I8=;
 b=bpFA5XJDksSnZPv0/WOdAVgCkuK48Tn+W63uj4peoMDPMGAWEY/oVsJKe/reuSn37r
 WI7pp7LoMNSPOTwYniEcKH+XK0XXAn3TF6Qt896aCUBKYYtc1a1EGqLKN/t8fF9kWxzC
 PijQNVz1uDnQC4iusRbcOC833Dk8hZwjlQ8Xb/mbn4FGe99+HRQxIocut+2MpfRDncT0
 OCsE7uLNNEdvxxcsy9hZFekMxn+u3MjitIB/LGWFVLPWu3tvqO3WpdPSyL7mCoYgM8uD
 yUxdvl76A14fM2UNUcXpIans9Q+el+lzPRkXgU9So+aOiNVnu2dVXjPGEsSTFu0NGcxW
 ApCQ==
X-Gm-Message-State: AOAM533t1Bg0T+EKM+O1A2laN2GhYqsEUIKhYV2lV2oeot1d0tsDO9A2
 b1o+EgzLLd/APY+WKijhT+TjsxQelBjemHfO9pxpgg==
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr15463675ejc.407.1616768898526; 
 Fri, 26 Mar 2021 07:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210323161443.245636-1-f4bug@amsat.org>
 <20210323161443.245636-2-f4bug@amsat.org>
In-Reply-To: <20210323161443.245636-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 14:27:49 +0000
Message-ID: <CAFEAcA8hKY2XGUhWoyvB8wb+mqc8nhUJHhM7J2=0EUiMBXsstQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/display/bcm2835_fb: Resize console on reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hFIGbWX7l3kH

On Tue, 23 Mar 2021 at 16:14, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We want to remove the bcm2835_fb_reset() call in bcm2835_fb_realize()
> but doing triggers:
>
>   hw/display/bcm2835_fb.c:131:13: runtime error: store to null pointer of=
 type 'uint32_t' (aka 'unsigned int')
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/display/bcm2=
835_fb.c:131:13 in
>   AddressSanitizer:DEADLYSIGNAL
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   =3D=3D195864=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x00=
0000000000 (pc 0x555d1d51e6d6 bp 0x7ffd25a31160 sp 0x7ffd25a30fb0 T0)
>   =3D=3D195864=3D=3DThe signal is caused by a WRITE memory access.
>   =3D=3D195864=3D=3DHint: address points to the zero page.
>      #0 0x555d1d51e6d6 in draw_line_src16 hw/display/bcm2835_fb.c:131:30
>      #1 0x555d1dd88d5f in framebuffer_update_display hw/display/framebuff=
er.c:107:13
>      #2 0x555d1d51d081 in fb_update_display hw/display/bcm2835_fb.c:203:5
>      #3 0x555d1ccb93d6 in graphic_hw_update ui/console.c:279:9
>      #4 0x555d1dbc92cb in gd_refresh ui/gtk.c:492:5
>      #5 0x555d1ccef1fc in dpy_refresh ui/console.c:1734:13
>      #6 0x555d1ccee09c in gui_update ui/console.c:209:5
>      #7 0x555d201f3cf2 in timerlist_run_timers util/qemu-timer.c:586:9
>      #8 0x555d201f4061 in qemu_clock_run_timers util/qemu-timer.c:600:12
>      #9 0x555d201f5029 in qemu_clock_run_all_timers util/qemu-timer.c:682=
:25
>     #10 0x555d200c6f6c in main_loop_wait util/main-loop.c:541:5
>     #11 0x555d1f06ba93 in qemu_main_loop softmmu/runstate.c:725:9
>     #12 0x555d1cafe6ae in main softmmu/main.c:50:5
>     #13 0x7f6e6991b081 in __libc_start_main (/lib64/libc.so.6+0x27081)
>     #14 0x555d1ca249ed in _start (/mnt/scratch/qemu/sanitizer_aa64/qemu-s=
ystem-aarch64+0x22999ed)
>
>   AddressSanitizer can not provide additional info.
>   SUMMARY: AddressSanitizer: SEGV hw/display/bcm2835_fb.c:131:30 in draw_=
line_src16
>   =3D=3D195864=3D=3DABORTING
>
> The graphic console timer kicks before the display device is realized.
> By calling qemu_console_resize() in bcm2835_fb_reset() we force the
> creation of the graphic console surface early enough.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/display/bcm2835_fb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
> index 2be77bdd3a0..3e63d58e0b2 100644
> --- a/hw/display/bcm2835_fb.c
> +++ b/hw/display/bcm2835_fb.c
> @@ -399,6 +399,7 @@ static void bcm2835_fb_reset(DeviceState *dev)
>      s->config =3D s->initial_config;
>
>      s->invalidate =3D true;
> +    qemu_console_resize(s->con, s->initial_config.xres, s->initial_confi=
g.yres);
>      s->lock =3D false;
>  }

I don't really understand how the commit message and the code
change relate. reset happens after realize, and realize
already calls qemu_console_resize(), so how can adding a
call to resize here in reset cause the console surface to
be created any earlier than it already is ?

I also don't understand how the GUI timer can call us before
the device is realized, given that we only register ourselves
via graphics_console_init() in the device realize.

More generally, I think we should probably start by figuring out
what the requirements on graphics devices vs the UI layer
are or should be. Is it possible to get the UI layer to
not start calling into graphics devices until after the
system has been reset for the first time, for instance?
Gerd, do you have any views here ?

thanks
-- PMM
