Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3015717lfm;
        Mon, 29 Jun 2020 07:03:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhcQPBsSY7J984lLJlFA6LTZxHmeCpjZbjUlGcCcR5NOrMPIhElhMAD6MKEGQPCSqiYf4i
X-Received: by 2002:a25:c646:: with SMTP id k67mr27364412ybf.110.1593439426650;
        Mon, 29 Jun 2020 07:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593439426; cv=none;
        d=google.com; s=arc-20160816;
        b=nk7MtUEmTYMgdEQ3iuUF8EHpbzCKbrveR19HNFHrQNB7B7NBh7rmijPf8QOovZDaQp
         XJyRYq7Tc21ImpvvIU6lLETDNu9ULlTSz5C0L5cLh74zlLKP2xbhmQ0jX2cLwjgoFKKd
         ySHvyMWTGNbQ0EiwrPNcRX7enTVVbnNCO6pHbhxSaiuwzIkWHvJULKr5B6Aomuc0ZNKL
         UNk0Z9Nei6t8eWTpdZzFDRi+3WgRT+Pc8/G4zwuPQEeuEmFGusTR6S0dCv1VsEDbynzn
         kwT7/P+eyZlxXTRhBkYmf5s3pd2+rfBKvJcrs9egWeacYKD9dniTtHexYZdfat0unODU
         98kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MIJJlagxHPmOgfuISOsEBqz+aj54Iz3tGWYgmF5TVnU=;
        b=Qs0LZQC+vEupTLbpA5lom1LrWv/wxcBUjh3d3b6GoWEK30wP3SLbWoUcwk20FG6mra
         1zRkVxm5oG8mLmH8yobm9eqhnxaraO+52KyRCpdVMvK9My+e104uP4RibVy76BAXWd8R
         9ldbNMsD1cf+oWRneWzZ5NWjUMxNg1EoVLox1FZDwK8l/7WgkxvUgOdKFaWwj9++Q5p4
         HVuwT1IX59Vww1sI05wFKO6iZdrhBI/YfgMwGQdLFNKprC91tQQTO+p6jAggYKhnwWHc
         B7OrW26auO73Cgl9ZrumS1c8x7D7+VN/Py4A2SCBgUUIK9szBluEUb2JqcbHBuNMz0Ky
         PnGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rfeWayyp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si32397948ybo.264.2020.06.29.07.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 07:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rfeWayyp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpuNu-0002Fa-1X
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 10:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpuNl-0002FJ-QR
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:03:37 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpuNk-0003he-3j
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:03:37 -0400
Received: by mail-ot1-x343.google.com with SMTP id k15so15553667otp.8
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2020 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MIJJlagxHPmOgfuISOsEBqz+aj54Iz3tGWYgmF5TVnU=;
 b=rfeWayypfFKzvw8ffYQ3rszSXtsjiKBvvarrdvhJJgrgRFty3bBVt6G1IZLVTyE21Z
 XolgXYv/OPQylx3nBXwjf2LB4i7llCJpwt7ktlDJFeR7mmB5MOd5Hf1/FKHt4g+JcdRL
 DXWH1yFBOsvQIln/haDrkLZn5XnjZ32LNcbwu5GeCzbcEaQ3l0UVXSNiupqoiI8bAloU
 y2cIAO0XDdEuxSn1FJt8OLrqrlUqy9ziKr/pla2mctHsVJM+5YTi60JcQdzSjJRYWvzm
 Mh/8uPKf1YZW3Yw0P4Febj+EcdGPMcz9iiLoWZvO6LBQPQvrRTwnjYKBFZJGEqvOe3E5
 ZTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MIJJlagxHPmOgfuISOsEBqz+aj54Iz3tGWYgmF5TVnU=;
 b=G/54WlK6ZCKbhASoTvDdTdbiLI2OrcyXFUD9MVm2Cnvq+7XWwxNxeuJMDQT1zCWjA4
 DVVeVI5EdA0163g/PzypXY3b78acrRvjJd7xIfFCQavGO1zN4nELhjxjoaifBtGaBCcE
 WXt6Kf7Qxmdn/LYF89rVwy5kD2e5shcMRitoWq/ZAj/zbEyTfgsB2yflau54Q9EelNAN
 6erf/yzUvS8Gr0zsBuijKuCZgQ4pBMyC8OnX3Ot/9yBgefZh1NBy8AOX2LlEThvrRzf+
 tKJrMWO+7GXJtjmMqqMQ2q1Cm1oG3ImDL7senLKxDyErAMutXh1ugdBzt7QD8e7aZaW/
 /i7w==
X-Gm-Message-State: AOAM530yISuhdvbCTl3d2qribtn3oDjKA41ni/vh5mfvYx/G9aGXeAeD
 wFCPKhtWAy3sGjXc0rJkEu+HdiogTAlMthp2bKYmsPdvH1s=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr7681518otk.221.1593439402966; 
 Mon, 29 Jun 2020 07:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-3-peter.maydell@linaro.org>
 <115c9299-8694-469d-e787-d03f12dc417c@amsat.org>
In-Reply-To: <115c9299-8694-469d-e787-d03f12dc417c@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jun 2020 15:03:12 +0100
Message-ID: <CAFEAcA9sC6QgidJ833X6-5cp5mCNkTyBcwxQPbAk0csJatMKiA@mail.gmail.com>
Subject: Re: [PATCH 02/17] hw/arm/spitz: Create SpitzMachineClass abstract
 base class
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X8YLO/3t80ab

On Mon, 29 Jun 2020 at 09:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 6/28/20 4:24 PM, Peter Maydell wrote:
> > For the four Spitz-family machines (akita, borzoi, spitz, terrier)
> > create a proper abstract class SpitzMachineClass which encapsulates
> > the common behaviour, rather than having them all derive directly
> > from TYPE_MACHINE:
> >  * instead of each machine class setting mc->init to a wrapper
> >    function which calls spitz_common_init() with parameters,
> >    put that data in the SpitzMachineClass and make spitz_common_init
> >    the SpitzMachineClass machine-init function
> >  * move the settings of mc->block_default_type and
> >    mc->ignore_memory_transaction_failures into the SpitzMachineClass
> >    class init rather than repeating them in each machine's class init
> >
> > (The motivation is that we're going to want to keep some state in
> > the SpitzMachineState so we can connect GPIOs between devices created
> > in one sub-function of the machine init to devices created in a
> > different sub-function.)
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/arm/spitz.c | 91 ++++++++++++++++++++++++++++++--------------------
> >  1 file changed, 55 insertions(+), 36 deletions(-)
> >
> > diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> > index 9eaedab79b5..c70e912a33d 100644
> > --- a/hw/arm/spitz.c
> > +++ b/hw/arm/spitz.c
> > @@ -33,6 +33,26 @@
> >  #include "exec/address-spaces.h"
> >  #include "cpu.h"
> >
> > +enum spitz_model_e { spitz, akita, borzoi, terrier };
> > +
> > +typedef struct {
> > +    MachineClass parent;
> > +    enum spitz_model_e model;
>
> Nitpick, I'd drop the not very useful typedef and use
> directly ...:
>
>        enum { spitz, akita, borzoi, terrier } model

This is just code motion, I didn't want to mess with the
existing way this enum was defined.


> > -static void spitz_common_init(MachineState *machine,
> > -                              enum spitz_model_e model, int arm_id)
> > +static void spitz_common_init(MachineState *machine)
> >  {
> > +    SpitzMachineClass *smc =3D SPITZ_MACHINE_GET_CLASS(machine);
> > +    enum spitz_model_e model =3D smc->model;
>
> ... and use 'smc->model' in place.

Similarly here I used smc->arm_id in-place because there
was only one user, but went for model =3D smc->model because
there were multiple users and it would have put extra
changed lines into the patch that I didn't think were
necessary.

thanks
-- PMM
