Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2102603lfo;
        Fri, 5 Feb 2021 07:23:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpAL/FekfInBrZIJJdOHfXjGMW80X5G2funLEdEVnIAEyA93dWq1WF4NfA4H8hNJqRG5Y3
X-Received: by 2002:a5b:b0d:: with SMTP id z13mr5971601ybp.488.1612538617931;
        Fri, 05 Feb 2021 07:23:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612538617; cv=none;
        d=google.com; s=arc-20160816;
        b=f9v9GBSF9upZgXHKzBw56vzDA21Lk2k5kouq3zeFVSKsUMy2imWR9wpoqMhCMKojPP
         n/jCO+f8K7GXJk5xvifND1REwUg+0kLEmfEzP/Cxe4uixR8fV1/YMvRDuPSleHyC72MT
         QYyMQ4h7x7tq2tfoSVRU5gD0btlt9EB5ScLeH757Hbw5OptU9Ii/YAS6Zu/WcIzhCCSQ
         UUUHStVI8dRwnKNyU623T0hT0fh/FbfVjnr7Z6cezfsBoYpLlZJszM5dX6zioMfw79La
         +8JJg5vj52DuddsyFbOr4je9engnEC6KqWq8RDHRybTcX2PVzwlCkHio3Jvdx6BdW+eo
         d2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=C0N5wRX1RqfdF7COdMaCLRTf8+LHfPZCzG+oRbJK33w=;
        b=Dg2zWQPiWjBIpL/cAoVFJZb10dF+oMxzLvaTGQRGuOmlA9jxu40BNwHjQFIkOO+Bna
         3vm35wLCzfVzLJ0Nps4ztsDsK7X518v/I+HrUsL00B/N0Ai664qYKwW9I64r5n59gZWM
         m2t3Uo0ApK0zslENpZLP3HHpSgCSaXsYZsUnWjliq4tsqFNIFAD+C1EYT3Z2cj7TaBL4
         5LnId6NS7kJvR2Ipw58Vxn/LMfYPbc1dwF/czgMKIGzNGEPTMOxnHcnP8TDM86huVTjY
         P5s0kEZwNR1wqlOkt7/S9Ikawt0O3Laoqq8sHs3f3K7bpz68G6R0OTc/OeB1NpqmtB3Z
         Nfxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w4fHmI2b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si8570365ybk.43.2021.02.05.07.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 07:23:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w4fHmI2b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l82xN-0003T5-BW
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 10:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l82pU-0001Hi-GC
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:15:29 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l82pO-0007Uu-Pd
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:15:28 -0500
Received: by mail-ed1-x52f.google.com with SMTP id q2so9208506edi.4
 for <qemu-arm@nongnu.org>; Fri, 05 Feb 2021 07:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C0N5wRX1RqfdF7COdMaCLRTf8+LHfPZCzG+oRbJK33w=;
 b=w4fHmI2bjzUIQrPV2Fv5vJFwofArX+ZfU5Vh1su2NQKTgWBvBqAi7cM8fP5ssYooQA
 nv3tZ5TXsX2jHzZRx/nEda1Sw+/RfAYzuwgloxeFIxWSBxdfvREFh9Dc738I+ORsZqko
 mrcsWunW6L+Eal98oop8OOTX/BpPCFj/tEHU6H+GtjoEpQSEgFyoGam7qrIuFy/Sjnwf
 EsPqseFTzMbegTOu+ohe2Ad8VUH8WCmmypx55EXyT/u5h2doubBXqgs4PvXLKkM16Pl3
 hSYhpL1FSMpC1AWBjCGZoR9O+mgGWSzDRxIGpGZWcs0DqNz7Mm6oGegBOOUbHalXDGKR
 XDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C0N5wRX1RqfdF7COdMaCLRTf8+LHfPZCzG+oRbJK33w=;
 b=HZy717WsVn/J6D9Z9tIVJKHaE1H9xIXhngP/b9K+3T2LiZfJAfnk9AtylGvW9KB3h6
 umQtapD/IG3bExFqqLQuOingxgd9t5QQB+vgOHG46Wv/3LSZqMY7mpLC5V+hIxJwDBhz
 oufMwJUO1PSF0jMzqVhoeesuNl4sd3n9SeR6fFPT3DCXBPHh9e1Nwx4YGolhWFToaxm7
 3C2LeTfHaZe9Yp8bo9cQJLcvNsJJxyMJaDI8rJ13Nc7/fesn9LY+2V7nTB8XgM2+10bc
 NgOtUflp3MqUFodYGyEGBqCPlN6H4SZrGLAWNn1WAnauQjnFXZYEhwrnIdtvtAqn2NZ2
 TYWg==
X-Gm-Message-State: AOAM530ooBQHsrgoX1TrsoWzaj6Yx3tQO/e+/7qciGV/RelD23+fN+Zs
 +4SmaB8aUjxNAYW5WbsSh2x3P2WZPppXIQjqYoZw0Q==
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr4070337edc.146.1612538114744; 
 Fri, 05 Feb 2021 07:15:14 -0800 (PST)
MIME-Version: 1.0
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-5-f4bug@amsat.org>
 <20210205150810.feuywlyy7xav56di@kamzik.brq.redhat.com>
In-Reply-To: <20210205150810.feuywlyy7xav56di@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 15:15:03 +0000
Message-ID: <CAFEAcA833bbrwZddoyTNbTP5AcNF5bWh_0U+dmej-nxk8Cwr6g@mail.gmail.com>
Subject: Re: [PATCH 4/9] tests/qtest/cdrom-test: Only allow the Virt machine
 under KVM
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9bP+n5rwS811

On Fri, 5 Feb 2021 at 15:08, Andrew Jones <drjones@redhat.com> wrote:
>
> On Fri, Feb 05, 2021 at 03:43:40PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Only the Virt and Versal machines are supported under KVM.
> > Restrict the other ones to TCG.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  tests/qtest/cdrom-test.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> > index 5af944a5fb7..ac02f2bb4f1 100644
> > --- a/tests/qtest/cdrom-test.c
> > +++ b/tests/qtest/cdrom-test.c
> > @@ -222,9 +222,12 @@ int main(int argc, char **argv)
> >          add_cdrom_param_tests(mips64machines);
> >      } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64"=
)) {
> >          const char *armmachines[] =3D {
> > +#ifdef CONFIG_TCG
> >              "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
> >              "realview-pbx-a9", "versatileab", "versatilepb", "vexpress=
-a15",
> > -            "vexpress-a9", "virt", NULL
> > +            "vexpress-a9",
> > +#endif /* CONFIG_TCG */
> > +            "virt", NULL
> >          };
> >          add_cdrom_param_tests(armmachines);
> >      } else {
> > --
> > 2.26.2
> >
>
> Don't we need to use a runtime check for this? I'd guess we can
> build a QEMU that supports both KVM and TCG and then attempt to
> run this test with KVM, which would still try all these other
> machine types.

More generally, it would be nice to avoid hardcoding into the
tests what accelerators particular machines work with, because
then if we move a machine into or out of the "TCG-only" list
we now have multiple places to update. Ideally we should
be able to just change the main meson.build files and have
everything else cope.

-- PMM
