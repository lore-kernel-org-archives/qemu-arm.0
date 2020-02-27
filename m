Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4718997lfg;
        Thu, 27 Feb 2020 09:27:13 -0800 (PST)
X-Received: by 2002:aca:54cc:: with SMTP id i195mr102125oib.126.1582824433024;
        Thu, 27 Feb 2020 09:27:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582824433; cv=none;
        d=google.com; s=arc-20160816;
        b=lb1uWoDYaygUHepaRIgV1i1oL0ob8BcLrsYktrY9X7xkXbWXYaOZYkVBpi3XJPjQbK
         7EZ82zBP9WnvoYB7r/MhVh35/UpPA91rL9nwzE31VP217hR8CcDFwmL06SXhsRCoVWo1
         cFuVU1+X/0Ax3j12ngvT8dIcOaAEZ4vnUpdu3r1bg9h4wV2Ea0wA0cOBiw09n4LBpa29
         wMgbikBrVYvHmLwcxmaGq5P/n4fYhlGOBbgYhpMaJ4XKe5U2tZIvcQqgjmxrmEbavmV8
         WDeuDG+hlXBUOpI0YFqG5NzYYj7e6/lmFFb9k9lK3TSVPGbhdmt/iaMDs40jxyR+GyFD
         i/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m9GJkvOTFPmF5ByiAdPJ3FRuMQFMw48QSAuhngnrSXo=;
        b=EihoBkzOhqw5j+MRYyFM7ItmN9EFrQMzhlHNnmD7KawurMOk0/0G/SAZhDDAQoqF1y
         ck2DaeMBj7TZhLhU9LnUg2LL6KftdYL3w/KKmrvxcw+D3XZkkx7F2ebIOZEvwMlZ+B/I
         gnVHvStcg8aNbuYyLIfFSnvTAopjaa3KDquJaYroBU2RbiN9mb40qieHM8FE4jeEHaa7
         8tdFXf0KtGCTE7xsDVTsiQw9WB9/+Fju6lsx864SfAymx4yVYxGxtBqzqbxQSd7/iAo3
         f+7eBlvWgi3kqPFteUgwwaexlw/MHzCk5wiJnIe5idVo+aPfBZUbQh3p+12jOgP5aEuM
         wSbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Og2ck7V5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p3sor55504oic.20.2020.02.27.09.27.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Feb 2020 09:27:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Og2ck7V5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m9GJkvOTFPmF5ByiAdPJ3FRuMQFMw48QSAuhngnrSXo=;
        b=Og2ck7V5aMwa1z894SWLCSUKSDxMHxKk+gZ3tFOqy0sv8DronlEcSapPOVvDNwnj+7
         CtWvVqGObibgJ5rNBCZi7sdB/f+DEY/9m1B8yx8hYh6FrHTxqn3raVjG5fCfyMvYGsZ3
         nUMmLA9lPOjYEpu4idqpSMNrSDsOEZxtx3dg+CKQPvqPH7kvIsG3za1DX9ac12EjpoY2
         3rRLB/1HIk8kIxH49VTtYhJu6ICdzfuKKVtXbaQjicosueFtoMklnUyPm67sDv8jz4Rx
         lqyMwKqqGs/WsCNEhpy8ijkdGzlCABQgS4UdwMqMg3SxwkVN2qb5/3c8e7wp1Gn3ZUt1
         rDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m9GJkvOTFPmF5ByiAdPJ3FRuMQFMw48QSAuhngnrSXo=;
        b=l9C0g+7mY6dNPAr5qeskukKVXE/Iwz65llfZEsZx5VkBYF90POzwQBmQR9FzJHN35h
         0CBuhHHIaTs+eh+07MArLpNwBDN3n+aTSXB7WVMsNNUoxwB9NZSrrxi1kwNGI/TInsRV
         tZ505fTlJman6g0/FaOSUFB52VHqDBwWaHYf+EATIYpgDyDGUMpJEpwGmU2lUnlDcbk8
         A5oaDVZIzIOAoNCJII2YIUVKuyG3Zw/HJoMlBNa85xFo61/wIfIMtYONzspGEb5EgjC0
         /WD2cR0Faab6ZvG7MUZBBf4ZArERGM5ETI4s3aETfVZfemzfQouzpy5Ukqtg2de1GI/1
         VRqQ==
X-Gm-Message-State: APjAAAUF+IEk2+JfhFKzvTMkXVPoxgIftLLNP5hR4BwNo+F8mfKgh/MR
	faUyLQ6FWTkSVMa/Az28KpMXulLe5MVa8uzRH+cRsnpIrhE=
X-Google-Smtp-Source: APXvYqxI+42Qv63LSyl5MxHHQ4otO9wwBXpiQdjCqMMKmhM2Db0/PP+fFPjdsejRmyz5kRV3pplv/MQqRO+5gwtvOeI=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr91087oiy.170.1582824432519;
 Thu, 27 Feb 2020 09:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20200225143923.22297-1-peter.maydell@linaro.org> <87v9nuxv9t.fsf@linaro.org>
In-Reply-To: <87v9nuxv9t.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2020 17:27:01 +0000
Message-ID: <CAFEAcA8LvupcqdsXudKpPyARz52jCJ0C9P2Cc7JeECv_mej0PA@mail.gmail.com>
Subject: Re: [PATCH RISU] aarch64.risu: Add patterns for v8.3-RCPC and
 v8.4-RCPC insns
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: oVFLPf+X7OtD

On Tue, 25 Feb 2020 at 20:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Add patterns for the new instructions in the v8.3-RCPC and
> > v8.4-RCPC extensions.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > This is what I used for testing the RCPC QEMU patches I sent out
> > the other day. Did I get the @ section syntax here right?
>
> Yep ;-)
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks; applied to risu master.

-- PMM
