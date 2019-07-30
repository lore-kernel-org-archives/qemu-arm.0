Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4406289wrv;
        Tue, 30 Jul 2019 06:44:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9w/uU6LxCXohn0Wyfa5dv7ozXi/MXI8ckGeRQfxvTQ2kI0EjJPELNICxtjAnuP97PeJQH
X-Received: by 2002:ac8:6c59:: with SMTP id z25mr85719539qtu.43.1564494294510;
        Tue, 30 Jul 2019 06:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564494294; cv=none;
        d=google.com; s=arc-20160816;
        b=Kgbilt5Qk/8D/ZcJsjkVwaPMc++gE5vvLJn2b29ObZeKlEVcLNATPY9gS8FHUafbnv
         it+ELxtp9mivYjO4tq2f7zDjpKpI8is1ZuSnqpLMPxv0CthVfuTeEf22dbQL2QaOXt3I
         /UUNGR6ChxOzEmW43SWy+rnPTwm1pwkHLiuR/kESjEbGt1u4JreWCy8JhmhuA5CTnUmE
         u72iKc+QJQddybLSgAMK+UF0kDwTIEHzEbmjBzXmiqyAvy0CjaJRtKpyztTP9vDBmeLJ
         ztgeU0MVf0U/IuTRBkXl7LILXIzw9jBe3S4GLqdht9YnIMT+xTqyVLJvj6KkjuAuw0QH
         ef+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J7rrvofl9pFv1q1kmCicmzCjHC/lfB+Hj2dddYPvq5k=;
        b=mamfYYBEemZg+4y6fHRpNHZNhd+KgDVUtusdUmk7aux5VrtTAhUpCsLAwgdLEG+P2s
         A7CtEfaiRrdxK5tqHeMrWCfTFmfUesSkPgJvZUUkuXZ6YVFkVVdsrkjX7G4CBvBj5vh+
         qW7WYwEGDsIscVhbijDIu+idkvniQjHXNRN8QFo7yvhzeXywmsy4z5LHOLyN1JlfKkv0
         XGFRHXU06Yxg2kETQx6wpHi94sBKRYqoYHG0kG+Yn9y01yP8LclykCyfDpBH9FCjJaKL
         jdjK7h/UNpVptAlV4ZIcIEcHM6wkKlSz3iQ8LJNEfaXuvAGXBpleWzxjwa8oqMDhscBn
         b77Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Khx2ocOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3si39533551qtk.265.2019.07.30.06.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 06:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Khx2ocOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsSQw-00023Q-2J
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 09:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52012)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hsSQg-0001oy-8b
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 09:44:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hsSQe-0000G1-Dt
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 09:44:38 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36618)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hsSQe-0000EI-1h
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 09:44:36 -0400
Received: by mail-oi1-x241.google.com with SMTP id q4so18742192oij.3
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2019 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7rrvofl9pFv1q1kmCicmzCjHC/lfB+Hj2dddYPvq5k=;
 b=Khx2ocObOyQwrZV0tP3Z6cN83aS+tE20KgRogDcimPfPzXUCBcLpz8n/NITywkqn7D
 2em97yoVX45EkGz2CJrp2J4MxeJO5l+eGhbZ8YJN+FkT8LsoQylgGJglJHirChpFAbf3
 j4hZh2DdNAkWthIwzWGKImwaj77BO2dv9tg+cJVJvdjR0bx9Dov+aQbWw1kk18js+Yf2
 s+HYvQndhw5zEhqf+6RVzsWqPhEx0E6hCzRVuiRJlq/3Uat0RSyOt2aqU21yyWsHv5pE
 Y1RgRwLAR7H76+1dEmksGB8ugn1y+6E00a/RVS/zFqPc15UwnvEbzqB9Dj3oKiQ51cVZ
 wnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7rrvofl9pFv1q1kmCicmzCjHC/lfB+Hj2dddYPvq5k=;
 b=ENqUDEF5mj4TS6LxdeCWLk09C1nprzJQ7dJWCwK9s6EzlxgkORcH8+nul+Zet/e84N
 0Ft/g4yF5IPv4CWiCX6EizKgrCroR/QzW8rkP6ra0es0X2FMqJ5Krz92Uw4EH/k49ruq
 gt+BF5akUDNORnas3YyoqvgJl92BMKbtPNUg/zhOLGKqI2Vl+WLJ+kdAV/N8YC4Q34mX
 o9OdTXOnwVPuQbiPSYdj0/ClQKBuFOcWx9xiS8RiiuXsrL1H+Mi5V8fg8eA+CO93ClQt
 zixOG+IgakrGkRzRLCOdrVHsMVd5N5d4/dSqFJ4K4Kbf4WX0xwO+WwfzmxnQyimZ+IHo
 Uz9A==
X-Gm-Message-State: APjAAAWwemrwPZkFVizTb9zhwP3RR6NA0Z3WN4+gkYkuDLipd8xj4VTY
 fX5x5MYBALN0b2kSvx2W9kIBQzsDQvmldDqWjeYjFQ==
X-Received: by 2002:aca:5cd7:: with SMTP id
 q206mr51661163oib.146.1564494272629; 
 Tue, 30 Jul 2019 06:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-2-damien.hedde@greensocs.com>
 <20190730154209.2049f10a.cohuck@redhat.com>
In-Reply-To: <20190730154209.2049f10a.cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jul 2019 14:44:21 +0100
Message-ID: <CAFEAcA-rwBiXkDEDuT-=KQVJ2A2ob16=P0obbZBPUfZeYXy+dQ@mail.gmail.com>
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v3 01/33] Create Resettable QOM interface
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K9mZCtWEPofQ

On Tue, 30 Jul 2019 at 14:42, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Mon, 29 Jul 2019 16:56:22 +0200
> Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> (...)
>
> > +/*
> > + * ResettableClass:
> > + * Interface for resettable objects.
> > + *
> > + * The reset operation is divided in several phases each represented by a
> > + * method.
> > + *
> > + * Each Ressetable must maintain a reset counter in its state, 3 methods allows
> > + * to interact with it.
> > + *
> > + * @phases.init: should reset local state only. Takes a bool @cold argument
> > + * specifying whether the reset is cold or warm. It must not do side-effect
> > + * on others objects.
>
> I'm having a hard time figuring out what a 'cold' or a 'warm' reset is
> supposed to be... can you add a definition/guideline somewhere?

Generally "cold" reset is "power on" and "warm" is "we were already
powered-on, but somebody flipped a reset line somewhere".

thanks
-- PMM
