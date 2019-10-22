Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp233594wrq;
        Tue, 22 Oct 2019 10:56:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJaCM0hdIGSXBRLgeGXQkeBO9cxkrRnFYRyTUOOtDq9Ad5q8VHfNsEIyO28sN5yO8oKq4m
X-Received: by 2002:ac8:1859:: with SMTP id n25mr4508976qtk.333.1571767000807;
        Tue, 22 Oct 2019 10:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571767000; cv=none;
        d=google.com; s=arc-20160816;
        b=dQLdEZO5fyeUZrYvNNU28QXYQ0jb+y+SCuiFvhOJ52xk7xTS5NvqNQWCD50sp/NOu1
         I8jZ6bIY1QjD6G1IBYkoX2Mos6kT+Yq6kMcLp7rgmAFE4mxlcp+iGjDXT7ZC5STorhHe
         okknbMjIWdrNadDzjWnnffGyxrYlcAbK4co/LjV1GhnXknb5DFoHwq2FU08kg6GO30mS
         5IBuHYL9loWLzu8ShfCxpKBtL1O8XipOdy21qAp0MhSj6m0LhBH+DWTbVOTqlcILeQxh
         KdtkPxviH7Zf7YPKQimkcTb0tpyAUVby822WJFj/rfXG0/ezld1fj5KL28C5wkolvsvL
         kTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=oWIQEzr1TvvMozekqdp+qXRuGS68XFytA0A8deVY8T8=;
        b=q46Rfo90Qjw0g+7w2va7RsHyuGIkl2WddlESyhU0ViWOMIaPJGHzo6ZGwoPkgUAnML
         deDKhdvvq/kvlQR6B50ecVm7R0Er4Q93xGuMDb+9zmsP4dzKX3HqUkHituZOThQWByFD
         PGrj5WIoeS6ndLfsHymsdUoNIUg+90C51g/7RwJxtMgje19T+xosf5/Iv6Z4HV66edB6
         DLLKpiyw3wCpQDdXdEw83EzOSXKzW199bzxIitEOpAZTGNFfhxzF7L1SXHg1GX3vlbPs
         NrKKhvoQTf9Z5Cii1c5cLvnQ1JPAZqVHP7aSrMW2WX6FaaXGvt1EucwKavM3RZa8sX6u
         EgKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23si14809615qta.40.2019.10.22.10.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 10:56:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMyOe-0006FT-5V
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 13:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iMyOK-0006CU-6P
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:56:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iMyOH-0003ei-7N
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:56:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48360)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iMyOG-0003dT-Ub
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:56:17 -0400
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 29A89C049E1A
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 17:56:15 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id g6so8978788otn.3
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 10:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oWIQEzr1TvvMozekqdp+qXRuGS68XFytA0A8deVY8T8=;
 b=nUiu0nOqVspeIMhVefPKxHFLz4SAp/CPCoCTGKpqEu2mHwLGqW9UffKE2zW2uxuamR
 4q3RYSDrIWQB7dSu2XXRsMplmbdf+HjViLrOskjcaKzVL6tnQNHNK6rJFwXWT99P1rYy
 pO8l94hoeknCPUQHwdeMpOq46bJaLQdGbKpdwaBqXyFwVHUWdg3lNOu4ud+sZk8esq9X
 TayBejlNyc+XBuNNqMcKLOEYbzyz6W9NSd004/3pXQuLooqfqwILZ8LLbB+5l3ySV03Q
 V+S6bCtQi5ftBtCFsO2q3+EGOkOIwasD/fvbyXHJS1YW0HAAhvFOkn6FyMjJ254JcO8+
 4GAg==
X-Gm-Message-State: APjAAAVIsrPk7sW8j6P/+A7Kak8cE1Yhi0s1Ybvg2NWaCx7GNPVNzq2D
 a2lIwZ5eKKuKy8SZl68D4uPLFAXhbW2PoaFnzQonhhnG8kB9ydu5R1cJ0eNspERPaBKa6lNRhCT
 HVmQLd0rgszGJr71p1Wj94uTJQH2z
X-Received: by 2002:a9d:7d16:: with SMTP id v22mr3440090otn.331.1571766974687; 
 Tue, 22 Oct 2019 10:56:14 -0700 (PDT)
X-Received: by 2002:a9d:7d16:: with SMTP id v22mr3440079otn.331.1571766974507; 
 Tue, 22 Oct 2019 10:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
 <20191022162137.27161-24-marcandre.lureau@redhat.com>
 <CAFEAcA8A4-wEy3ueq+Tz3oN3Fpyy_vXdQ4k_mmOXYiVwjDEe_w@mail.gmail.com>
In-Reply-To: <CAFEAcA8A4-wEy3ueq+Tz3oN3Fpyy_vXdQ4k_mmOXYiVwjDEe_w@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 22 Oct 2019 19:56:03 +0200
Message-ID: <CAMxuvawXOgauQJoSuJ+3Vbk1OkSh3rUgUkwp8QdxZ7Cra-THrw@mail.gmail.com>
Subject: Re: [PATCH v2 23/28] smbus-eeprom: remove PROP_PTR
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S/6l5cXrSPvf

Hi

On Tue, Oct 22, 2019 at 7:19 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Tue, 22 Oct 2019 at 17:24, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Instead, set the initial data field directly.
> >
> > (the initial data is an array of 256 bytes. As I don't know if it may
> > change over time, I keep the pointer to original buffer as is, but it
> > might be worth to consider to copy it instead)
>
> All the callers to smbus_eeprom_init_one() allocate the
> memory for the initial data, populate it, pass the pointer
> to smbus_eeprom_init_one() and do not save the pointer
> anyway. So we effectively "own" the data -- we could choose
> to copy the data and make the callers free the memory instead.
>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> I'd still like to know what the right QOM way to pass
> 256 bytes of constant data to a device as a property is.
>

A property with a uint list visitor is the closest thing we have I
guess. We can probably have a specialized QObject to hold a fixed
array, but string form will probably remain a list, I guess.

I can try that, but this is quite complicated to pass 256 bytes internally.=
.
