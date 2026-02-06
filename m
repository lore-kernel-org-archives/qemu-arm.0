Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52D4EE6B44
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 17:46:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voPty-00085Q-2R; Fri, 06 Feb 2026 12:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1voPtw-00084u-S0
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 12:45:52 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1voPtu-00052o-2N
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 12:45:52 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-66a4780b4abso311941eaf.3
 for <qemu-arm@nongnu.org>; Fri, 06 Feb 2026 09:45:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770399949; cv=none;
 d=google.com; s=arc-20240605;
 b=D1H+gSIIgkD2IxitjNnqNyUjZ76omPyi5UHgSyo4OAFC39ddbxaiCJ3Zme0bcQKxPx
 mSMwnqrOvoxrbFnWgznNcE1/OLmJAC7SPULmcXS0yASK4dqZ0r/FYrUpNQQqYxCyTWwV
 7aRo+BleKQBFyQ/thjjBg+57X3090NkpwxpZgZk0dgSFF+kSnbwnEzU62NVR4xSsxDNh
 W4p/7PLOehnNdFnvByAaWXbQIffB1ZBWK0ViU6NfsryD60h1//QbXf0QYhg3mtPKjSTw
 yuNIwWpTjkHtfKWm3RDnPeZQqpw3JOFssg6r9PbMFJp0ayNYX6+Mk1noGBPkEn8GY/xr
 YFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Eo7CP+XVtidcjtLY5cGx7zYrM1SKz8QfuI3uW5LNb9c=;
 fh=P8xGAO6dJbahPQ7XPC/D+6hMRG4tHM2d317KWUUvLtY=;
 b=Jb6a2lf93AcBUFf95nzrTbUmTG1c8YbGgTDNPijypU3joljgQuNKllTSCItw+ZptiM
 lBrSxBHutpVHaDBavCr0n2kyGtRAVYLybltKqrZJ5sT/ZhTDminjNjHk/6YZ6weIkUZe
 ZwvNLjBF/fLB9bMMjtG/qwf5LKgd4cnaZ6gm/i5wgyWfFaJhvv1leGGyrLNOxQdRcWaC
 4EmYOgjCZ4ZIvPL+YQ0csVUsqVpOxlGwh+Lyyx8tvBb5yQoRLPcd1Ieaep6BMBanr+SN
 BqyheeZldpnsLA+tjgQMr9bzbmpSgYWrSP5KaUi7yT1cSeZMmukL2aImL9fiEZ4zKcko
 94/w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770399949; x=1771004749; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eo7CP+XVtidcjtLY5cGx7zYrM1SKz8QfuI3uW5LNb9c=;
 b=cjqRaxJmDnr6pjmmcW2ORZVXY0lKsAuhTQbJWagT+graUtrkjT6OPHDUVxlGWEAZw8
 xBtOTBO4tzMfLWYgE8QTuZGgSou4xoUzPreM2oJqxVQ0qJdkeDP4N6Ef+Frco0EQWx2r
 TGufIZQmG0WLvBatYPTR+cPYAZ5t1g7pZbDkDY1tHELxB2AF3zOpfKXUZIf95tDv3P4r
 +vPuETgB02Or7eQUuIF1kajt7WFFObmgaxBDUfJTZ2M6GjbL0z0lXlT+gRfn11f5eLJh
 mMD2zgmkpzuRWeEvFm/L/6Cqnm6w5qQdvVQwgTe0AGEXkxMbv1jP3pXZkWIrlpqIgg/7
 3foQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770399949; x=1771004749;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Eo7CP+XVtidcjtLY5cGx7zYrM1SKz8QfuI3uW5LNb9c=;
 b=EwaM96p5XFVxY1U7MrqCq3K8nA9eiGtDerTy4w0hdeJUAiL14kEa0AKZ6g41ypHAeB
 UD2lD9bskWtuhqwv9k9rgaTJqeBxq/Um0wJitj58aFlo6hA0rFpXTf5tGoBS6RE65ZW8
 L8/WdHvTFjInWf9AQsZCDZhfYCcBJdDgVxN+DjA4jF2o6YAJANmtZePuxodcWw33M0Qr
 VSxpUt/5R5nxm07sirTGgIra2gwPlqisOcJo+2L5Kr41j3OuYbMRFqq0CVPieZ/dxJm3
 UOUWM8He4r5q28yBjyxfLIFDp6mkwGaWGN/w1lpSEHTgppsslq/1l2Sg+ux/JkWM0uvm
 rizg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE0knx0uqC777MnqXd1NuDp2nqLE6+0Nd1MeZEwm+HnlMzPpUqiI4QFq2s6TnUUDnhojYe69DvyQ==@nongnu.org
X-Gm-Message-State: AOJu0YzNGcN2hDAXsvrjbcLEooiwsS+oaJbOouzYuxq3ymJ/ZQZT8RQa
 XFP5pp+6Dr9e3ntFRxUCFMHV17B3WDo074V4sWnIfAB455GHg/cna7N1Vs0nnHD6BfvAYmyqYs+
 gLauJD47waq/fYFQmXOhbxPB0RN7SfrM=
X-Gm-Gg: AZuq6aJVeFxbqbIO5pBcFK/LoK9+0qzEevuKh/NdXiGdBMAx7I4prIpwUPehqxbLc7g
 Btvs+t8XCdim84LbwykoadDNBvPcyNcIcjwzPU5eXY8YuoOnON96Pwx/+yD6LL0dl0Lr18CpcWc
 acT9VxNwJgCQWshqzvdCvsolj1js/LB8+y0l6eIXYlG6NQEVWg2Kz1DqUDW7dZRH7ixNMH/RCAT
 bstdyTp84WdjSUL4asJnqubExdzGVUgCHk/alVvBf+kLqtBiDsRXYYddYHGUSxXoOlBjp2c
X-Received: by 2002:a05:6820:818b:b0:662:f42e:7cfe with SMTP id
 006d021491bc7-66d0bea535fmr1624778eaf.54.1770399948687; Fri, 06 Feb 2026
 09:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
 <20260205195824.2610192-2-ruslichenko.r@gmail.com>
 <aYT_4NYQDbCyfS1c@redhat.com>
In-Reply-To: <aYT_4NYQDbCyfS1c@redhat.com>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Fri, 6 Feb 2026 18:45:37 +0100
X-Gm-Features: AZwV_QjB54-VahsoPMF85sMfreSW76Ko_2BCkX6qMXSB3cTC5fW0uU4KRDmkStY
Message-ID: <CAN-aV1HdTaJEtLU8uWcatB-9EZkNu=AkB_ZC5CdwMo6zXe9yXQ@mail.gmail.com>
Subject: Re: [PATCH 01/29] hw/core: Add Remote Port protocol packet definition
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com, 
 takahiro.nakata.wr@renesas.com, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, francisco.iglesias@amd.com, 
 Ruslan_Ruslichenko@epam.com, "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Feb 5, 2026 at 9:39=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Thu, Feb 05, 2026 at 08:57:56PM +0100, Ruslan Ruslichenko wrote:
> > From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >
> > Introduce packet definition for Remote Port protocol.
> >
> > Remote Port is a socket based inter-simulation protocol
> > designed to connect QEMU to external simulator (such as
> > SystemC models, RTL simulators, etc) for hardware co-
> > simulation.
> >
> > The protocol supports bidirectional communication for:
> > - Connection setup, version negotiation (Hello/Cfg packets)
> > - Memory and MMIO transactions (Read/Write packets)
> > - Interrupts and GPIO signaling (Interrupt packets)
> > - Time synchronization (Sync packets)
> >
> > The patch introduces header file with packet definition
> > used by protocol.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
> > Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> > ---
> >  include/hw/core/remote-port-proto.h | 305 ++++++++++++++++++++++++++++
> >  1 file changed, 305 insertions(+)
> >  create mode 100644 include/hw/core/remote-port-proto.h
> >
> > diff --git a/include/hw/core/remote-port-proto.h b/include/hw/core/remo=
te-port-proto.h
> > new file mode 100644
> > index 0000000000..cbe1498df0
> > --- /dev/null
> > +++ b/include/hw/core/remote-port-proto.h
> > @@ -0,0 +1,305 @@
> > +// SPDX-License-Identifier: MIT
>
> Preferrably stick this inside the comment block below instead of
> mixing C and C++ style comments.
>
> > +/*
> > + * QEMU remote port protocol parts.
> > + *
> > + * Copyright (c) 2013 Xilinx Inc
> > + * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a copy
> > + * of this software and associated documentation files (the "Software"=
), to deal
> > + * in the Software without restriction, including without limitation t=
he rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/o=
r sell
> > + * copies of the Software, and to permit persons to whom the Software =
is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be incl=
uded in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT S=
HALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALI=
NGS IN
> > + * THE SOFTWARE.
>
> Including this is OK, since IIUC in this case you're carrying on
> with someone else's code, and so aren't permitted to remove their
> license comment.
>
> If there are any files later in the series that you wrote yourself
> from scratch though, they can omit any license comments, only the
> SPDX is need.
>

Understood.
Basically all headers in the patch series were already present, which
is the reason I left them.

>
> > + */
> > +#ifndef REMOTE_PORT_PROTO_H__
> > +#define REMOTE_PORT_PROTO_H__
> > +
> > +/*
> > + * Remote-Port (RP) is an inter-simulator protocol. It assumes a relia=
ble
> > + * point to point communcation with the remote simulation environment.
> > + *
> > + * Setup
> > + * In the SETUP phase a mandatory HELLO packet is exchanged with optio=
nal
> > + * CFG packets following. HELLO packets are useful to ensure that both
> > + * sides are speaking the same protocol and using compatible versions.
> > + *
> > + * CFG packets are used to negotiate configuration options. At the mom=
ent
> > + * these remain unimplemented.
> > + *
> > + * Once the session is up, communication can start through various oth=
er
> > + * commands. The list can be found further down this document.
> > + * Commands are carried over RP packets. Every RP packet contains a he=
ader
> > + * with length, flags and an ID to track potential responses.
> > + * The header is followed by a packet specific payload. You'll find th=
e
> > + * details of the various commands packet layouts here. Some commands =
can
> > + * carry data/blobs in their payload.
> > + */
> > +
> > +
> > +#define RP_VERSION_MAJOR 4
> > +#define RP_VERSION_MINOR 3
> > +
> > +#if defined(_WIN32) && defined(__MINGW32__)
> > +/* mingw GCC has a bug with packed attributes.  */
> > +#define PACKED __attribute__ ((gcc_struct, packed))
> > +#else
> > +#define PACKED __attribute__ ((packed))
> > +#endif
>
> Is this comment & conditional #define still relevant today ?
>
> For the rest of QEMU we just use  QEMU_PACKED whose definition matches
> the #else clause. Ideally change the patch to use QEMU_PACKED, if not,
> mention in the commit message why it can't be used.
>

I will double check. Might be some old mingw version which is not actual to=
day.

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

