Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3631501wrg;
        Tue, 18 Jun 2019 04:59:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydS2KGvWpmVGNrhE7cS4zI8iN3VLrX5hU3VR0araWx3l9PAuqru5OHC+DuO26FaMBLiA0o
X-Received: by 2002:aa7:cfc8:: with SMTP id r8mr25728492edy.273.1560859148795;
        Tue, 18 Jun 2019 04:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560859148; cv=none;
        d=google.com; s=arc-20160816;
        b=AF/Qpx++FtC/d0I0DU5LiC31MavYuPnMBnmxR1AObhU3JGqASkBD4aVVZR4hr7tVL+
         i4vkEIFxP5DhR1TyojuRyuj0FMKvtfSjRhwI9058zq8MIWMyxM2lsmZC5E2GzgfGCBIc
         ogkXPbBYNT2kng1jtlXwfit9GgWc1aImIkapU+gFC7fBXA3Qpi1/p2n/jenugk2Ko7T2
         +DXMsu9k4fbrSHSbdBJj+NYskMqTrX7rHDrPcGfCcow/BPbEfXluAjAU1jn/xqGu9ny9
         1xYh5RSerfAlOp0mI8n7mCEJX5kKQNOlywkSPG6wN0gKBoatx2vJalpr0lhPjG4QO64L
         UudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOzI7vyxmAzItnicrOeD/gq6Ty6mFLLzi0cebA6sp3A=;
        b=iEAtrHbzSRAt18m9qnY0pLHXGQLG0vhdOWuuRHJMazUTzKj+ianf/OSYIp2U8vKffe
         4smKHWwq4wnbJmxrEE5LZl68xe2x3dtaojfhkHzY/vZZhPqlPVe6BqFJWq549OTSmfQC
         MYFVN9q9bQXARGp5MWRlWUkwlhCDZ9qzUXmhMe3H9FBlyrqvOtJsbwAMYmOTVWh7NH8m
         X4WcgdXGQWs7urJggf0dZSm+TQCY4SbgdZkjI6HZ6DD1GHHLHuILyXyhcXDsOejlv4BN
         Wo9hiO1XA/ydh3V1UY13SBoEOJDPFtDwSOFnkDyfYry8qrtMiP61c1t9aBJSBS3x5rtZ
         y6xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oIJ2HHVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c52si10364767edc.251.2019.06.18.04.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 04:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oIJ2HHVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdClX-0001FX-V8
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 07:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52640)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hdClA-0001Eu-99
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 07:58:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hdCl9-00023A-8C
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 07:58:44 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42030)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hdCl9-000224-1y
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 07:58:43 -0400
Received: by mail-ot1-x341.google.com with SMTP id l15so4422548otn.9
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 04:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uOzI7vyxmAzItnicrOeD/gq6Ty6mFLLzi0cebA6sp3A=;
 b=oIJ2HHVda7DE5GOa5SWZBQjf4e7AM7AoLXmq8Ell2whjj3WVts6WM6I8ZkjH8UOy5P
 mQdPKBgXs9NduXVvjNDawY7rmDB0ShC1Zy+AOkBSu6An9vxEBynk4UlxEn4KAzyfjABn
 X69DL1Totq/xLKXya7kCqLDEo2KANGcMPk/4r5hQHfUc9uLmJ/hdC9JDWrtaUy5vGHuY
 i3dSMJELbM07alx2S/dFuWwaMf23CUMWW8ADQrQ2gHqmbvKWHhLA6UViKV69mVK47mwi
 bKqh0690eotiyANmNXd2R6lG3ZmiR1giXfEa2xBtGWfxNwm1lArbFgoLytT8D4ZzGxJK
 +NMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uOzI7vyxmAzItnicrOeD/gq6Ty6mFLLzi0cebA6sp3A=;
 b=KBPyipzZ45khDLjznX9/cb2OMRVqDXIZv19Dflc8+jNKh+/AH57lhptmnI46warO6Q
 2SrbeRJ/1WF1efgc04L4CJcJPkn+I4hE0AT4YcD9R76YvaV9xqH0troB3s2qWpPJReAD
 ffLdRgunJxpsJDrEGl6nY9C7xo97u/itord4OnQYQtJozibgfBrAC23YGyJJjJ+4nyXd
 9bmiSslRrn25UEpNhP7ZE+n0VhcfscwyADodIxvy3b1QPPN3QAAnlQS2/iQzgu9J1FTk
 FHmzuLDkkRez9MIgRkioTOYOc/LJPRDo8cuNplcJ52uHiK9XZr0qTBxarJ3CcLF7BFY7
 Idmw==
X-Gm-Message-State: APjAAAV6P+4f3smdz3BYtfK09uVyzLqAIysDk6OpSLkzFZYQL90ocORR
 8kDMHyFTJWuvvt7JlrPRWrO9jZJBQoWbdlkxE91mAw==
X-Received: by 2002:a9d:6e8d:: with SMTP id a13mr4514002otr.303.1560859121214; 
 Tue, 18 Jun 2019 04:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190618083442.10407-1-drjones@redhat.com>
 <CAFEAcA9bwbev3efZ=LJPGgObBCbW-WX19fySMusLyMNC5ZExvA@mail.gmail.com>
 <20190618115558.uhygiqryxo4lbb5u@kamzik.brq.redhat.com>
In-Reply-To: <20190618115558.uhygiqryxo4lbb5u@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 12:58:30 +0100
Message-ID: <CAFEAcA-66=jnVrdKAkY8EtY7BjoB5EscG1S15ABUd6yQij4YFw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/boot: fix direct kernel
 boot setup
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N8aB6NNK855G

On Tue, 18 Jun 2019 at 12:56, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Jun 18, 2019 at 12:02:37PM +0100, Peter Maydell wrote:
> > On Tue, 18 Jun 2019 at 09:34, Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > We need to check ram_end, not ram_size.
> > >
> > > Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
> > > DTB off the end of RAM")
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > ---
> > >  hw/arm/boot.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > > index b2f93f6beff6..8a280ab3ed49 100644
> > > --- a/hw/arm/boot.c
> > > +++ b/hw/arm/boot.c
> > > @@ -1109,7 +1109,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
> > >                               info->initrd_filename);
> > >                  exit(1);
> > >              }
> > > -            if (info->initrd_start + initrd_size > info->ram_size) {
> > > +            if (info->initrd_start + initrd_size > ram_end) {
> > >                  error_report("could not load initrd '%s': "
> > >                               "too big to fit into RAM after the kernel",
> > >                               info->initrd_filename);
> > > --
> > > 2.20.1
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > I think I missed this because my test case doesn't have an
> > initrd -- direct kernel boot works fine if all you're
> > passing to QEMU is the kernel... I think we could clarify
> > the commit message a little:
>
> I found it using kvm-unit-tests which uses a small initrd to
> pass environment variables to the guest. All the tests started
> to report FAIL.
>
> >
> > hw/arm/boot: fix direct kernel boot with initrd
> >
> > Fix the condition used to check whether the initrd fits
> > into RAM; this meant we were spuriously refusing to do
> > a direct boot of a kernel in some cases if an initrd
> > was also passed on the command line.
>
> Actually I think we need another fix for this error too. We
> weren't actually refusing do direct boot the kernel, but we
> should have been. We're missing the 'exit(1)' after the error
> message.

Hmm, so we are. Do you want to send a v2 then, which fixes
that too and fixes up the commit message?

thanks
-- PMM
