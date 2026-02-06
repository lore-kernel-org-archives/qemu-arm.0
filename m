Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9F0EE6B45
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 17:58:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voQ5G-0004CS-Gr; Fri, 06 Feb 2026 12:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1voQ5E-0004BZ-5D
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 12:57:32 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1voQ5C-0007ZP-CF
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 12:57:31 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-7d18cf89e72so1850452a34.1
 for <qemu-arm@nongnu.org>; Fri, 06 Feb 2026 09:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770400648; cv=none;
 d=google.com; s=arc-20240605;
 b=WDyZHzFTgIuf2QJRPMJi98l2bfc3bR422+5iyvMP2DceDmFzeC2HafRC4kNlrYqSY4
 xyWD+blTbhDY6VntmwCdfUzbvkiLIWPForVy2f9DnLv7XZxgj1PYI5HmNZ0VBVCwDU8V
 40yA1jKzHtwlMdtixSJjXK5bcLQarKK5y9ecadek1sQKx6uw1QlDJHA9aY2fXdfsjiAl
 ejckYFXo2YG3X5cvlyfhZHkp/e2kgcyd5BCNoYyxnlXn4mKjvsGuqWalemBhbHg0NYQW
 G3Y7kblIWNJev3AB2txeqwROR6FCaZIDMVkpXDv1C4tkUGN8zal2dxRzwqmqE/4Kqewb
 QB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0YBih/ZicORW04UORhc/Z/2Kq8EF4UlrY2jP5IEB4O0=;
 fh=/8n0pt3L3K0MFSyOPPCum0t0Y/4IgUMskDVhmB85Z4I=;
 b=dVfeHqv/QraJq5oKVzqIBVZBzH7Zzx4GqbuomQPzvEgHGnelw4qWpT7tM4inzRWdB6
 GjEbqBLa5gz626L9h01wRm12hySgnARDgmCDBA2dQ12dQoNhuIMu4F4hV4U5t3Sin5vq
 5PkOckOSl7J+WqdGy5MQjTIMdAlqw1dPm8HLGYPluPPV3QF8kKTlS7ly0yri2Eo9BIFY
 CycCKnqnj7wrxMWlyZy+0UJxKG2fu69Cv915RI74BvxjBw49ZP3qxh3WhJxb6BbrTi2s
 9mBEw+G7PMZuzzyUgphmkUmRfdZISBIYp1GTBhyas15gm+BVOHNxwFLHif5hmPvTGwCh
 WLwQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770400648; x=1771005448; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0YBih/ZicORW04UORhc/Z/2Kq8EF4UlrY2jP5IEB4O0=;
 b=Rm+aJd+0lLTu13wdAiulseLWyGFuIV7pbD/dUIvM56E+VrPVlMd1TEPesaro/Dj/nd
 7Z2rP81143h9xz5r4MHWy2ydtL2hwi65wsNPuirb8kIW79+xUqV5AMkSHb9ZvGLsw5b8
 NUBEaVCB13Qat+EgDsQCNzIAHVapaytlueTrj6l2A/GverY0bOOwbvb2vlgSDSSdxKGR
 FwSZri7lhRgUgk/kxaoD04LwWfDQ60SqMRO31cNkH+If969+Ri4x0ecHKrXvMj/qidHa
 bMGmuRTBkHg/Mt+TUeu5enNLS1j0U0G+2ACHzul/aYICI/e95A37keEoAuqrJscPsip7
 1ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770400648; x=1771005448;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0YBih/ZicORW04UORhc/Z/2Kq8EF4UlrY2jP5IEB4O0=;
 b=uL5Dd6TP2pHsW7IG1sqo44dM/9+K2sZ0JjK36AiDUMnvGq5J+TQorSENmrM0WaYqQy
 9Y4VFyYpgPK9jKZTtuN7NJ5nQu8FJb8+St3vAxeakOab5sRJoahC8ulpxYcLA/mASo7c
 2vijzNAHr1vQPkAOf95YRXaJXqwwiMx2vKRL1x07eTJCUFPizCsu/eaxUwOoyJQCMDVB
 wkIj98iShhSP8R2QE3l17RmFumAguivNX5bwEp2a92azsAw8VEAGwrURKT0tIxQaur/R
 gytJvY3g6uZUQq0ByVzr6TkTwnRXDRWd2UyZnOR3te3ApodnrPmn5IeQdFPRBDQoREbR
 BISA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWskEmXcWfo0BsqpoSO0EX5gdMPDeQrkhdh+a83KWjX93AYei7GCy5r0CLsJGLAt5qaOOUAIq/89w==@nongnu.org
X-Gm-Message-State: AOJu0YwQsVNG6OW5uJI1tD3GeinpcG/5foN0IK54INXjZD/eMCIerK9Q
 3t7xkZGzUItMGGFD+5BDCrEuO++98fOJwZ0Tg2pjXROv6/MzqvyE5k+Fyf83Rq4B9hhHcJW2HFM
 9/9TsLiMU6L5X02tmv/a5VKVDAHNZ8js=
X-Gm-Gg: AZuq6aKOk6lgGQmDoVBKkC+La4eo6E0j6U/JMXd0RzJwt3bWl6OSREFk4EBkTksy2FV
 9eyx6A0m1FVzjYAu/fcJvl+Y7AH33+hadOclCYPyxkMbZWKlmGLqrny5/+0xgP1H8hjCOt62Tz+
 t3AG1K9zRrXsT8cIaoGH2ooutOt2kpY0I5SW4u2mB1whW/MXI5O3v4TT0Qi16ARcrGbg/kPCszk
 ngCxBIzOUL6f8+dQ3R4uHZGTvNdZz1yPKhU9tn3aJGu6QWggPbPQTAebFNHhCfbZlFojXMSK2C7
 +ugEyoM=
X-Received: by 2002:a05:6820:207:b0:662:fd74:61d5 with SMTP id
 006d021491bc7-66d09abf9b4mr1479918eaf.3.1770400648267; Fri, 06 Feb 2026
 09:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
 <20260205195824.2610192-24-ruslichenko.r@gmail.com>
 <aYUAWw9Rfuu7KWjA@redhat.com>
In-Reply-To: <aYUAWw9Rfuu7KWjA@redhat.com>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Fri, 6 Feb 2026 18:57:16 +0100
X-Gm-Features: AZwV_QhmBnAMee9tSiOrObNARSNoNehaIHvvXYS2fjqFH_Wiz1BvEWDcjz4ULQU
Message-ID: <CAN-aV1E1D_8Q9hCR4OBXx0ZU2uziiQ3jN05aPTUwm-AmFs9=QA@mail.gmail.com>
Subject: Re: [PATCH 23/29] system: Introduce -sync-quantum command line option
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com, 
 takahiro.nakata.wr@renesas.com, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, francisco.iglesias@amd.com, 
 Ruslan_Ruslichenko@epam.com, Paolo Bonzini <pbonzini@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ot1-x32a.google.com
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

On Thu, Feb 5, 2026 at 9:41=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Thu, Feb 05, 2026 at 08:58:18PM +0100, Ruslan Ruslichenko wrote:
> > From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >
> > Add a new global option '-sync-quantum' to specify the maximum time
> > interval, in nanoseconds, between synchronizations with remote peers.
>
> Again, we don't really want to introduced new top level command
> line options, so try to find an existing place that's suitable
> to fit this in, perhaps a prop -machine.
>

Understood, not sure machine options are applicable here,
but encapsulating it within remote-port itself may be possible. I will
investigate it for v2.

> >
> > In co-simulation environments (such as QEMU coupled with a SystemC
> > simulator), time must be synchronized periodically to ensure functional
> > accuracy. The 'sync-quantum' defines the maximum amount of time QEMU
> > can simulate ahead of its remote peers before a mandatory synchronizati=
on
> > event (sync packet) occurs.
> >
> > This value is stored in the global 'global_sync_quantum' variable and
> > serves as a default hint for device models and Remote Port instances
> > to manage their simulation time.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
> > Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> > ---
> >  include/system/system.h |  2 ++
> >  qemu-options.hx         | 11 +++++++++++
> >  system/vl.c             |  8 ++++++++
> >  3 files changed, 21 insertions(+)
> >
> > diff --git a/include/system/system.h b/include/system/system.h
> > index 0cd012004d..f187544147 100644
> > --- a/include/system/system.h
> > +++ b/include/system/system.h
> > @@ -59,6 +59,8 @@ extern MlockState mlock_state;
> >
> >  extern const char *machine_path;
> >
> > +extern uint64_t global_sync_quantum;
> > +
> >  #define MAX_OPTION_ROMS 16
> >  typedef struct QEMUOptionRom {
> >      const char *name;
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index b7dd2a64f0..8ef0c57507 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -765,6 +765,17 @@ SRST
> >      Preallocate memory when using -mem-path.
> >  ERST
> >
> > +DEF("sync-quantum", HAS_ARG, QEMU_OPTION_sync_quantum,
> > +    "-sync-quantum Max time between synchroniation, nanoseconds.\n",
> > +    QEMU_ARCH_ALL)
> > +SRST
> > +``-sync-quantum val``
> > +    Maximum time between synchronization <val>.
> > +    This value is used to drive periodic synchronization with remote p=
ort peers.
> > +    It is also used to set device models sync-quantum properties contr=
olling
> > +    the maximum amount of ahead of time simulation that is prefered (o=
nly a hint).
> > +ERST
> > +
> >  DEF("machine-path", HAS_ARG, QEMU_OPTION_machine_path,
> >      "-machine-path DIR A directory in which to create machine nodes\n"=
,
> >      QEMU_ARCH_ALL)
> > diff --git a/system/vl.c b/system/vl.c
> > index 4750b1cf69..467646c3ff 100644
> > --- a/system/vl.c
> > +++ b/system/vl.c
> > @@ -182,6 +182,7 @@ static QemuPluginList plugin_list =3D QTAILQ_HEAD_I=
NITIALIZER(plugin_list);
> >  static BlockdevOptionsQueue bdo_queue =3D QSIMPLEQ_HEAD_INITIALIZER(bd=
o_queue);
> >  static bool nographic =3D false;
> >  static int mem_prealloc; /* force preallocation of physical target mem=
ory */
> > +uint64_t global_sync_quantum;
> >  const char *machine_path;
> >  static const char *vga_model =3D NULL;
> >  static DisplayOptions dpy;
> > @@ -3129,6 +3130,13 @@ void qemu_init(int argc, char **argv)
> >              case QEMU_OPTION_mem_prealloc:
> >                  mem_prealloc =3D 1;
> >                  break;
> > +            case QEMU_OPTION_sync_quantum:
> > +                if (qemu_strtou64(optarg, &optarg, 10,
> > +                                  &global_sync_quantum)) {
> > +                    error_report("failed to parse sync_quantum");
> > +                    exit(1);
> > +                }
> > +                break;
> >              case QEMU_OPTION_machine_path:
> >                  machine_path =3D optarg;
> >                  break;
> > --
> > 2.43.0
> >
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

--
BR,
Ruslan

