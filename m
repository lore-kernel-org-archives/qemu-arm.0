Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7100321eje;
        Wed, 19 Jul 2023 06:38:15 -0700 (PDT)
X-Received: by 2002:ac2:4e0d:0:b0:4f8:58ae:8ea8 with SMTP id e13-20020ac24e0d000000b004f858ae8ea8mr4373405lfr.58.1689773895559;
        Wed, 19 Jul 2023 06:38:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689773895; cv=none;
        d=google.com; s=arc-20160816;
        b=aEYpi2oxBeSQYMZAd4cuN3xPU3m99k7ixXflXmU2QUmJOgZ1fQ2KzTCPgUmaT5VclZ
         uhXYJzH3jeKaGbqyvpM6WM0w7iZX42XFyOWlqytt20txqrmJg5Kl/PxmtiDr1pCFfOVI
         91RklThIhwE6RaOqPbu2H63cVx7TOXGlMiskw3K3Xp38l1zTB9EfDLcAqK9jp1iQdIW5
         uuT2adRfoQ9IraMCFy8jp9wLSPqFhAfI7NMhQCMynr5J+7iumOc+/rq78Zyq0oDiU+mS
         HSuHsoTSR1RZF8bWE3Ng8Mw+GAIuJNI2Q5Vn/szpsexVup4JA7maZhN6cu96k1bsGkGB
         ljyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E6PIeKIxwAxcX5ItBhje1uMfoQiWyL+2badkajclqqY=;
        fh=qQmj9evPFb8Dt3HT1bZ/dLhIYOe3xQ9XklUft24yFak=;
        b=crUC80lV6PmgSxRVCMPwhiYNSHz6SdzVqyCAZEmS+g7tnwd6uguDb4X5BRXnRkSWjz
         uLNDWKN1f6QWUPTfQdlrCg54wCIUWrRAszS0p6Ih1vDimFIQ/1SUiGrzDTcVpKGXjoT9
         UQ6a6Q7XazLl2FyKq+2U8tCsG+iauALekpzH1kFuSvqM/owPubJ53VRPCXX08PnhTpBv
         vcD1FZt0uFkt1czUVXPlw/oW9aIibOtfML0SI/Mvy91l4PQj700kRLeHcIK5G0KIGTEc
         3/Ra0wdLvdqss+FfuEuTWU9asFi2Yb7Ag3HP+hVSvK+5mLMaSouBiHQP5TEW81kymQW2
         qFtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rbXqQHji;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 23-20020a508757000000b00521d274fc78sor3147edv.6.2023.07.19.06.38.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Jul 2023 06:38:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rbXqQHji;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689773895; x=1690378695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6PIeKIxwAxcX5ItBhje1uMfoQiWyL+2badkajclqqY=;
        b=rbXqQHjiUsWL9bglEi4ZNKHIewWQG0BPYVpGpmk4JEW+hZRjeOOe2E/BwGYttSr35q
         6SPs1+6N05//AMK3qi6xXnMuTWrhqvtSCnjKK7u2CJbFmk6bCGlusBcOw8ftPcty+9O+
         nJONlrqoLPXuNA4Hh5DaTy2bWaM2prqLXOEf4IS5mW4RbXfk3E82hbJR6+FNx4PDt/Ju
         EMXBrnT/U1gDDsR0ucZ8A8lC7FOBFe/PNmPhBAjRvpjXxpcCCMP5Xgrtvc0ZpO3uAhKd
         A81Hb8Ec0yBFfKM6MXslnfr0KGfrx5w3w3F9P4GFbPXL9+XhpBTJCYWK12z2I0rGbwMt
         56ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689773895; x=1690378695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6PIeKIxwAxcX5ItBhje1uMfoQiWyL+2badkajclqqY=;
        b=ArTHW+m9AoB6qLfii9EVHuxmiQbxUd5x0iD/Odz4n1rmNZej2A1GWEVScxDpQChgOq
         OHut+LgYviILo8MAHLgiKxN1mEA4AyVmH0ntZ0XzGOYU7J9TiIuK3USA3Z+sAfl5mBOQ
         XilY6NgCo/H7rmZESpMQTf3m9e/9+2KPeaP7Ccm4mOKKcNAKRyVWkdxyiv/b598xDJyE
         ZTgfQnDORR0jGQOOdLvjGO4KC9JpS69S3JLlVxf667RQBIbNSqUBLDGi0lZiYOt6zMfD
         EbnuYKaE7G8zNkKAKWbplF9F4B/5QiOZROzroU5jfwoMQel6YrN/btyx6FAJT7jfFGDy
         eJPw==
X-Gm-Message-State: ABy/qLabXV3sSGIPVxv0vcxniCsyZ56IxH6yoaLGREEwfvP+Iv5qI1Ni
	sdBPKj2OEh8N0LFnvMYATqr/D5ZMKzr2o/fF9hrtYViPVXCvLgNOFcAnzw==
X-Google-Smtp-Source: APBJJlFdgforOEKXDT52gelq5MSsDOuhH5mt8oZvBFikVUs87UJFWdBv+EHGSpvZcscyUixrq2zr0OhVMZ+Eu4GY0ts=
X-Received: by 2002:a05:6402:5175:b0:51d:f589:9c7a with SMTP id
 d21-20020a056402517500b0051df5899c7amr2519433ede.17.1689773895213; Wed, 19
 Jul 2023 06:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230717182859.707658-1-berrange@redhat.com> <20230717182859.707658-5-berrange@redhat.com>
 <67db8111-8e86-0b63-e3a3-8e89a0862a61@redhat.com>
In-Reply-To: <67db8111-8e86-0b63-e3a3-8e89a0862a61@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Jul 2023 14:38:04 +0100
Message-ID: <CAFEAcA-gM=KTFi6+SebD5Su6yG_LMJ9wiYd6g9+ESy8GgtZ2Bw@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] qtest: bump npcm7xx_pwn-test timeout to 5 minutes
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: zJPTz3XgKpI9

On Wed, 19 Jul 2023 at 14:06, Thomas Huth <thuth@redhat.com> wrote:
>
> On 17/07/2023 20.28, Daniel P. Berrang=C3=A9 wrote:
> > The npcm7xx_pwn-test takes 3 & 1/2 minutes in a --enable-debug build.
> > Bumping to 5 minutes will give more headroom.
> >
> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > ---
> >   tests/qtest/meson.build | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index ecbf515d50..e28f0925e1 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -1,7 +1,7 @@
> >   slow_qtests =3D {
> >     'bios-tables-test' : 120,
> >     'migration-test' : 300,
> > -  'npcm7xx_pwm-test': 150,
> > +  'npcm7xx_pwm-test': 300,
> >     'qom-test' : 900,
> >     'test-hmp' : 120,
> >   }
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>
> (we should maybe still have a look at this test later to see why it is so
> slow, though)

It seems to be doing a massively OTT amount of work to test
a single device. Nuvoton maintainers, can you have a look at
cutting it down, please?

thanks
-- PMM
