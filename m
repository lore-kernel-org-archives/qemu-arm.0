Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5393265wrs;
        Tue, 27 Aug 2019 08:37:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUgJpERhFjAqDD3t7J82UuuaLFR+Px3rtPws3OMJJUPLz+G83Zs6h+0152VHNwkdOChL/S
X-Received: by 2002:a50:8806:: with SMTP id b6mr25348954edb.305.1566920255552;
        Tue, 27 Aug 2019 08:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566920255; cv=none;
        d=google.com; s=arc-20160816;
        b=D/SLMnC7+iFliF2AFrDYFNBzH8mCajI5A6ECpsktOH7tH/LsISOMX9dEihSPAYgJA/
         e0/KG7ShWpizZapSnZWgMRuyB1wb3OcM9FLVG8l+A6LIDmnPieueP6j+Mbxd7D2/asDE
         SJSLnzUgBbEBqyJ2vMounZ3lwUiZcOQ6du5E/VWnrLIOCOJvU2KfuPVf6Ofhdp7YEURT
         2nXTlGX+5FwqgHkweF1NT2UfQynf6hSi+QRnGDLHoij5RDOL/ewCuwb8JzBJrtmGGxMI
         JLQb6xwdAgP2mK57Ov0OSg/hT2XPGLQxT0MTWLWxV5NQofQQCpjh1BoUls2SjbngtmcM
         EQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=t5I3HKsguqHeB727TvHpayH/w/G2mmJD9HCQWuDpFC0=;
        b=hdMKzr8YGC8IBWKkNF2DtWpgU7yXgVlDGAA426loQMeRwnpY8JbkjP1+dKxdjC07k7
         VWTz4ZrgDcQy15mGN7JmR1U9Ci67frE89m76mztY/LP5sCAy0aaUp5WQKvlC1EXH7Skq
         SGhqQdCzFKF1FCd9PBvib4zsEjN/bsD+6KCm11dBafLCs6u+VSrx2LlAcp+BLKSMXQfo
         XYlZpa5/qR/rrgXMlGBUYqR9Lod2i3vClmGiNJDixd/gG/NOr+BDZDFguZi5Y6BWwSs9
         6SWVadWHGX4UvTmfG1GQcSvjYjf0tGgROTISW8/ZRqMJf9Oh4vUgmk29/MjVAD9n+30H
         bCSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cQRvZ4+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21si9313529edd.23.2019.08.27.08.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 08:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cQRvZ4+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2dXJ-0000kH-1w
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 11:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2dX4-0000fC-F0
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 11:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2dX3-0006d4-0T
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 11:37:18 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38591)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2dX2-0006cn-Pz
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 11:37:16 -0400
Received: by mail-oi1-x244.google.com with SMTP id q8so15004549oij.5
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t5I3HKsguqHeB727TvHpayH/w/G2mmJD9HCQWuDpFC0=;
 b=cQRvZ4+ElY5CWnkv4GxSJqqTeKSnzToVRc6Ez414WNgQsfrYnqu7GgpxKJEcdd7PMJ
 JZSJ6Z5HVY9CGoNjXU6sd/uCvOAcDIM/jw65poN98s3+OZsPnu1499aHryP9+rnIkVJh
 NyY+LqgImCSJRtdvz6l9Mc7h+0sYA70XF/do1Wz7pFmpr6jBezXJyoo2poSA3O/jZYUb
 sQMhOVvTgfl1ZhSGJvFo3NXKe89vBp+TkPC66tn5MdtujLGy/ulFaHEzGugCfhQX3ni7
 U4tGZqvkoKRTp7SKchGvQXrVfeOs5uu4tuDFK0BPcpTKu9lhvMrjH3/HvVc7F7OEiPVg
 wN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t5I3HKsguqHeB727TvHpayH/w/G2mmJD9HCQWuDpFC0=;
 b=PdorKM1m4JKVpJQ78PS3DHnMKNh770LznV72bZykkzhtHlF0LYWk0kNUJZKPwRrWnu
 S3Cy4JcKAxlptWtRYAiQeFHSEFPXLcI6+MbDVRTWfJZvcetN0qDEG+f0XD+D9qV1s+9H
 tWLRqiASOAb3U56gz7UMseZEZB34568JZTYEX+wtk2zc6yo8/JxVL32yCNm3uKgWdscM
 2t/0XDsIclazm8UaOJ7ZvDz+fgEJrKv60SdTStsM4SRgpDKCCX+6PdrOShMNQloKCMqP
 ogAUolqf1dhGKKffl38mA+KAjCYOfyneDFoBxcN6oLPYGd63zt0iUx22ZHCzqmaCRMUb
 ExUw==
X-Gm-Message-State: APjAAAWyG+iaOYGklkDqm1+6bzGFHzX/e9faq+nbqXOg0In64g5rGaD7
 n5ETjaGXY8U3OmVpgAGdykwVR+N8dkY3quEn21vE9A==
X-Received: by 2002:aca:4814:: with SMTP id v20mr16737854oia.98.1566920235745; 
 Tue, 27 Aug 2019 08:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190704055150.4899-1-clg@kaod.org>
 <cd1f8a48-27cb-5cc5-1fd2-46f1597a7094@redhat.com>
 <20190704101345.GC1609@stefanha-x1.localdomain>
 <b304e4bd-1315-b1be-6c48-add99df92626@redhat.com>
 <CACPK8XdFUO6+Fx17Dry0D2QFhM885DugdvOkWnhgjxPc9VgG2Q@mail.gmail.com>
 <CACPK8XfZq1FvMBXLgS-WHoJy4s_L9k19hLW-XgBNoiY-DhGhWA@mail.gmail.com>
 <f5ed785c-027d-66fe-aba2-d03001b44162@redhat.com>
 <CACPK8XcG4JRq0hAUPu4+vv-j1TFNwwsu5iv6X9M-qAgm0atTRA@mail.gmail.com>
In-Reply-To: <CACPK8XcG4JRq0hAUPu4+vv-j1TFNwwsu5iv6X9M-qAgm0atTRA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 16:37:04 +0100
Message-ID: <CAFEAcA_zt-=BKZa3CnnP0XNjurxwd1svsda5LnsJ+YsKHdRL_Q@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 4.1] aspeed/timer: Provide
 back-pressure information for short periods
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rC1fyv94nCrB

On Wed, 21 Aug 2019 at 04:16, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 16 Jul 2019 at 07:02, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
> > On 7/16/19 9:00 AM, Joel Stanley wrote:
> > > On Tue, 16 Jul 2019 at 06:54, Joel Stanley <joel@jms.id.au> wrote:
> > >> On Thu, 4 Jul 2019 at 12:26, Paolo Bonzini <pbonzini@redhat.com> wro=
te:
> > >>> On 04/07/19 12:13, Stefan Hajnoczi wrote:
> > >>>> On Thu, Jul 04, 2019 at 11:26:53AM +0200, Philippe Mathieu-Daud=C3=
=A9 wrote:
> > >>>>> CC'ing Stefan & Paolo for a non-ARM view on this...
> > >>>>
> > >>>> I'm not familiar with the various clock smoothing techniques imple=
mented
> > >>>> in QEMU and KVM, but this looks okay given that Linux guests expec=
t
> > >>>> this.
> > >>>
> > >>> Yeah, even KVM applies a minimum period of 200us to the x86 LAPIC t=
imer.
> > >>
> > >> Can we please merge this so guests can boot on 4.1?
> > >
> > > C=C3=A9dric pointed out this lacks my reviewed by. I had not provided=
 it in
> > > the past as I wondered if we could come up with a better fix. However=
,
> > > I consider this a good fix for 4.1, and if sometime finds time to
> > > further rework the timer model in the future then we can do that work
> > > later.
> >
> > Agreed.
> >
> > >
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > Tested-by: Joel Stanley <joel@jms.id.au>
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> HI Peter,
>
> Is this one still in your queue?



Applied to target-arm.next, thanks.

-- PMM
