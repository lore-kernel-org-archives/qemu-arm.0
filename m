Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72AFCCD1AA
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 12:30:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBBUa-0006PM-Os; Tue, 21 Oct 2025 08:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vBBUY-0006Og-8B
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 08:29:30 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vBBUU-0005UV-Lg
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 08:29:29 -0400
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-87c21c5d3eeso79583136d6.2
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 05:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761049764; x=1761654564; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gm2bgRbXqNYoH7i2Kl2IVut4p4qZ+g6dMNSfs6kxRsM=;
 b=IvtVZRJf+nhPZaMlRCuRMs6Ij0S3aVwdbIHkouA+qzhoEGQ8/gqt7uwUzm4/2qV+x1
 h7kLrMq5/ytTZ/F9f7VQTtFZiEJgoqbaAKCAN3nhN+Av3HZSs9O06Q5VBCu6eonM30z3
 USxgNbb2ICT8i5w4yYcau6Jgco6RS6GoV2XY6VlRD0piR2X7G0ieoRqIqcuyjcxE0G2o
 9st1RRin1SVPCPf+ZJMmA589yfawZDZx/0vrcRs9nx9gmb5R8eW8omqffpgej7zlVqff
 YM4hq3xz3TwMpiNcd2kA3km0/RBhn3CpU4oZfw9vOccmKh7NjPUwT6xn+xw6fLDG7xOT
 Yijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761049764; x=1761654564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gm2bgRbXqNYoH7i2Kl2IVut4p4qZ+g6dMNSfs6kxRsM=;
 b=Y/ywDX59my5nI3BBxMN7Y0MXg2Wwhivsrc5nri3lMaMhOKso1fVLUylK9IazeHvkI0
 YigMFmR4ijylTY0FhKk6vGpjWqtKylWaHuynu3T/aAcq2MhOo0yjRrhyEPh0kqzDFhU5
 s+kQfa+or+We9t42UJDJbyO6Q83Xotq/NjSDLFhMKT6JyUffZZcnY4qvYrhaMHZMKLrp
 tk8dkJqW6p05Q55v9H/BlEZb9TULW3U8kDQBWlrecuEhx0/yg02mTxWNY+/7//XTz+Dp
 1BWoz3quHqlJW2yeJUfrzdxCsdWMG3NyKV7wcP1rJsywks+E5NkBegXRna3eZ4Z5iEHK
 NIEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX20RzBhaJmY6GSeJPBgAmMQ/V/p5Sk5Vgl2jqf3Cty5nOaMgQmSoeH6ilCfNN6EBAetHQKH1WXHQ==@nongnu.org
X-Gm-Message-State: AOJu0YwsRgEoksJhfz96oZBk70Rd8+qnPpv6Damk+0hYh12T4sguoFVS
 /zfx8OEaVtGjgSTYWkiSnDiC87iCnockDmtsOGobZBvg1S8dztWg3iosBISEOyTB9CP1Aq/4lxo
 f9Fp6uVP+sdhFccj9VrBCOHTCoPc+pkM=
X-Gm-Gg: ASbGncu7gjs25jk+63FD2JwRuF4KzYPr+ND4QBy6yAhNF0zTYQ0RN5gD/Le6ua0fGWO
 rl+DDuuTltvLsDLfGFnyKzYEpUYb325k92v0+H5U6R1i8cIcoP0sx4AmcP1wgkBL1BElBtOyIch
 heuwx9z0MImqK7pcr8ClPiERnjaDeoan9kpC3+9i9yWqY2GbHqjHvsmHd89aU8wF8/k+lsaIXcl
 olhKl+JNlV+Ny/Rk6JqQzbflOPpPDmOGwuBGqypHVGwEPpYNX8dQJtwh9ccxhiuZ5zKdCdxKwJz
 8OuvXGeA1Qxiv7k4wc1+TDuYggT5e4Appuan3Q==
X-Google-Smtp-Source: AGHT+IFv8PZM3YfxoSmPMh0Pw/lSm35eTcvCQZ3JQS5k3Tw//wxGbGVTUdRyb4uYGjgP9yQ1tvBwffkRi5V6uak+00U=
X-Received: by 2002:ac8:57c5:0:b0:4e8:a3aa:7a89 with SMTP id
 d75a77b69052e-4e8a3aa7fd9mr149566901cf.45.1761049764336; Tue, 21 Oct 2025
 05:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251021090317.425409-1-marcandre.lureau@redhat.com>
 <20251021090317.425409-36-marcandre.lureau@redhat.com>
 <e8232530-ce04-c542-d39e-c0e2dc5014b3@eik.bme.hu>
In-Reply-To: <e8232530-ce04-c542-d39e-c0e2dc5014b3@eik.bme.hu>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Oct 2025 16:29:13 +0400
X-Gm-Features: AS18NWBWN7thwGXI43W55M8O3dkWxFowMSZ74iDgxZB19s7F_XZGhK72gJ9LCkM
Message-ID: <CAJ+F1CJ8Ojiwen+rPrrFAineLYX0-qyXVysCaUSNeSytWPSYkg@mail.gmail.com>
Subject: Re: [PATCH 35/43] audio: rename QEMUSoundCard -> AudioFE
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>, 
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Tue, Oct 21, 2025 at 4:13=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:
>
> On Tue, 21 Oct 2025, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> > audio/audio.h                       | 20 ++++++++++----------
> > audio/audio_int.h                   |  6 +++---
> > audio/audio_template.h              |  4 ++--
> > hw/audio/lm4549.h                   |  2 +-
> > include/hw/audio/asc.h              |  2 +-
> > include/hw/audio/virtio-snd.h       |  2 +-
> > include/hw/display/xlnx_dp.h        |  2 +-
> > include/hw/isa/vt82c686.h           |  2 +-
> > include/hw/qdev-properties-system.h |  2 +-
> > audio/audio.c                       | 10 +++++-----
> > hw/audio/ac97.c                     |  6 +++---
> > hw/audio/adlib.c                    |  6 +++---
> > hw/audio/asc.c                      |  6 +++---
> > hw/audio/cs4231a.c                  |  4 ++--
> > hw/audio/es1370.c                   |  6 +++---
> > hw/audio/gus.c                      |  6 +++---
> > hw/audio/hda-codec.c                |  6 +++---
> > hw/audio/lm4549.c                   |  2 +-
> > hw/audio/pcspk.c                    |  4 ++--
> > hw/audio/sb16.c                     |  4 ++--
> > hw/audio/via-ac97.c                 |  4 ++--
> > hw/audio/virtio-snd.c               |  4 ++--
> > hw/audio/wm8750.c                   |  6 +++---
> > hw/core/qdev-properties-system.c    |  4 ++--
> > hw/display/xlnx_dp.c                |  2 +-
> > hw/usb/dev-audio.c                  |  6 +++---
> > 26 files changed, 64 insertions(+), 64 deletions(-)
> >
> > diff --git a/audio/audio.h b/audio/audio.h
> > index 845e078169..a43ca0700c 100644
> > --- a/audio/audio.h
> > +++ b/audio/audio.h
> > @@ -70,18 +70,18 @@ struct AudioBEClass {
> > };
> >
> > typedef struct AudioBE AudioBE;
> > -typedef struct QEMUSoundCard {
> > +typedef struct AudioFE {
>
> You could also leave it as it is. While it's a bit odd naming it's clear
> enough and not at least the local variables now called "card" match the
> type which would not be the case if you rename it to Audiodev or somethin=
g
> else but not rename all the locals. So maybe it does not worth the churn
> to change this type name.

I think it's still worth it. Local variables are locals, and usually
easy to understand by the context and using their types. It's easy to
rename "card" to "audio_fe" or "frontend" though, I can do this in
this change too.



--=20
Marc-Andr=C3=A9 Lureau

