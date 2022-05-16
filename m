Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2060815lfj;
        Mon, 16 May 2022 08:14:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx24l7x61iiHEbGnOIh5Wo82HwqIpPyMsSQ4CD7Sjsbcarrf6/2uB9hSM3XAnZCaGO/rGtB
X-Received: by 2002:a05:622a:18a7:b0:2f3:c715:caf1 with SMTP id v39-20020a05622a18a700b002f3c715caf1mr15499323qtc.226.1652714068384;
        Mon, 16 May 2022 08:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652714068; cv=none;
        d=google.com; s=arc-20160816;
        b=JbYhUIqvlDZnBj+6JgVsTrGfOH9Naqb0NOk/8Q5TBTnOgHHPcPZVkTopJT+li/o7so
         bZSTrLbYlEav/ZwOW7SFoQZtLAgIUKGeh+9R1/CUIpVviJi/eF/wglfs9ICw7xgthfNB
         4wMoKClQDp7YRoEtA2UWk0sKogMuA4AwkZ2Qa9JvioM8RYcLcQy/k/BT1cX5wP0IpIGA
         vtjq8DH6X177pX5bI+qfGeED+yBz417FErfGHLRSi0pDCKPfmQXzM/5OFaTf7j+yQwVk
         BkUYbILbZByJQF5tSJiiQDi99qOAB7/TNqyIjcvPDSJqxF4TShbhoaoY1ao7KHW42h64
         2YHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=N89Sx8/KAkUuHJ7/ED0/EHJX3wQIKDwFFofDvqvUYdA=;
        b=J2bFu4PVayDcM6aVYiyX0Kg1oCbsUkNQ8agvnEuiskEfz2jIyWUAvAk2jFgBFpWa4V
         N0v34s8eCr4MDI6BCop13LnA0C7jD+1m7SLzfrKEcj9BTGjsLX4eD0uSp4P/4Rj1B2JX
         MM9nL5a0pedid+sDkqFZZXfLkgKPjYMSb+C7OEncvHumQbaNb1JPEhT1KwNKUDulCVdQ
         1ekvoZRWStM+lW9lhKCnkzp36kfr8ZN5hFAYZElpqcnvoTf6nIxZ+UHnJbf71UP/bZMO
         uCjxtmIzPqoRMYWMq9QsIiUNHM06draJX3INtbQ5xzCs6t/EjtC1M2lxNkN9olXXZOAd
         KE1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qb1ylrbJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14-20020ac85c8e000000b002f3ddac43a7si6279402qta.578.2022.05.16.08.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 08:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qb1ylrbJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqcQV-0007fT-T6
	for alex.bennee@linaro.org; Mon, 16 May 2022 11:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqc9o-0003cZ-4F
 for qemu-arm@nongnu.org; Mon, 16 May 2022 10:57:12 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:46686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqc9m-0001JO-DI
 for qemu-arm@nongnu.org; Mon, 16 May 2022 10:57:11 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2fb9a85a124so152868057b3.13
 for <qemu-arm@nongnu.org>; Mon, 16 May 2022 07:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N89Sx8/KAkUuHJ7/ED0/EHJX3wQIKDwFFofDvqvUYdA=;
 b=Qb1ylrbJTTk0hEbxeoTx+1+frF7XgddeLFuyHgIhrpSE8amy1lp7xo+1ugDvrw+A5F
 rDopXW/IziDBD9oMjoynND6tCYjWxU7j/yaFeFsxKK8wFQ1dL0x8H17Po2jxP/uoJ40V
 hXaGscsAEkm3Iq8B2evXID9UoP8iP1nqJzwAtxLsUOJvVoYrswNT2AuvTG0oqOUv7JAU
 nRD+aK9U+NmJMsN2fP0pPEnLvfP57Ax/b2nJ7XWrYSQxlrBTXaBPU7KKVviAhsjDoWhh
 okVQMwOVvlCI719OHSaWymZEOysY0vQcPy4OjNe+wnP0U+UaLWT1zsrlGbzuC5KPi38C
 xjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N89Sx8/KAkUuHJ7/ED0/EHJX3wQIKDwFFofDvqvUYdA=;
 b=GXjZok57IvQTeCDxR3hbuyH3IJRXwVBu6nAYJuRgDx3r1GP9Th44zhCFggYJpen8TZ
 EBaxAPDCo1zairR+DbM7/KfozaZmahZr7DKvlJsq+loNLpmhLJMj4ApnEo1xKGqshrxz
 Y/tTHMLzdkQ98fUKKFqO/NkpNn0yYUJTE2am1BQz/utDlFjrpw4QAE1Xng3yDgvLo2Eq
 6lDnOUNwuQNKKf+b/ra4/LZvMRZbrq0l7uBpHNmqEg1iPR9re+QcQE9A1RzgyWKLq8TO
 8Hc0zCYkB/xwdiRR7juzipnZSFUlLKu6ktn7LI0BqPfXYpSzTPSyWknnW1uFWx2WksmP
 q9xQ==
X-Gm-Message-State: AOAM533mE+k/SgkrIwN0aJVv5FyCvJAYGycamXWQxVrDgOIIoEqgHoSk
 1pI1qfJLHAgN7C5NixT1pRqJKI1BviiQrcQZA+lCYw==
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr7743832ywc.329.1652713029278; Mon, 16
 May 2022 07:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220513040220.3657135-1-pdel@fb.com>
 <20220513040220.3657135-3-pdel@fb.com>
 <443933f2-069f-df96-ec62-76c21fc644b2@kaod.org>
 <05F5C72F-8424-476C-82B7-7D30BA48CDEB@fb.com>
In-Reply-To: <05F5C72F-8424-476C-82B7-7D30BA48CDEB@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 15:56:58 +0100
Message-ID: <CAFEAcA_dadj4cuE55K4ng-twgGO98FOcLX7Y=1_Y9Z929NUZLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw: aspeed: Init all UART's with serial devices
To: Peter Delevoryas <pdel@fb.com>
Cc: Iris Chen <irischenlj@fb.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 "zev@bewilderbeest.net" <zev@bewilderbeest.net>, 
 OpenBMC List <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PQ4TT3sn0Esi

On Fri, 13 May 2022 at 22:09, Peter Delevoryas <pdel@fb.com> wrote

> I was actually intentionally skipping that. If serial_hd(i)
> doesn=E2=80=99t exist, the function will return NULL.
>
> Chardev *serial_hd(int i)
> {
>     assert(i >=3D 0);
>     if (i < num_serial_hds) {
>         return serial_hds[i];
>     }
>     return NULL;
> }
>
> So then, the serial device=E2=80=99s CharBackend=E2=80=99s =E2=80=9CChard=
ev *chr=E2=80=9D
> will be initialized as NULL. Looking at all of the
> usage of this attribute in =E2=80=9Chw/char/serial.c=E2=80=9D, I think
> that=E2=80=99s ok, the read/write functions will just be no-ops.
> They all have guards for =E2=80=9Cchr =3D=3D NULL=E2=80=9D.

Yes, this is deliberate. We added these in commit 12051d82f0040
because otherwise lots of board/SoC code would have to create
NullChardev dummy backends (or forget to and then crash depending
on the user's commandline).

thanks
-- PMM
