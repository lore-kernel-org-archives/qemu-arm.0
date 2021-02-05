Received: by 2002:a0c:aac5:0:0:0:0:0 with SMTP id g5csp585396qvb;
        Fri, 5 Feb 2021 11:31:35 -0800 (PST)
X-Received: by 2002:aca:a915:: with SMTP id s21mr4256513oie.108.1612553495228;
        Fri, 05 Feb 2021 11:31:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612553495; cv=none;
        d=google.com; s=arc-20160816;
        b=Ap8cfCVSGYP4Gy19oAo+HZxhwZLtoKnCc9x7euFOjUARECF39jUFtwjYbNzSdZ/WxD
         9CzJ/WDz1tKVGKtGupgKudCMRJi6fOwo9UwOzPVR0z5RkLy8xbycbbMrCxZj7BYHJgGh
         Oohkx/5sXZWK/IUtqIBGX/n0g6s1yX4o9kj5u6kqWSKqKYdkLOpc/p/iBf6dWy3WNs1x
         g43KPthdI1sTSInbd4Jpp3qNU5gGd1rq4Ew4Q0OUYRvORDwzam+0KRV1treVelGWlJ5+
         m4ndQjyp0ldtUBBQRZOFuBBGHThNzJqOQuqcyC4XDpE/QWmpJhRsVsM/bZr0aIwgb86L
         4ACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=cwFa1USdzW0+VscxRo5AApRRcXP6vpeFrhMNguXPAw8=;
        b=FBiOQzzdmEkapUjx8HW8eTUZZqVxwWMGrvbCtZoegiAXNfCfgdSdfxk7xohoNqiFuy
         M+YEyCDRYKoTpNQIt/hklPr4Rhn3h2GQf1fhJMqbA5tGvwfy/7osuTnSQrKfcxSGdD/B
         KuPgDcOvd0ehtOrFeDWtrSgX3Zik1oD3bUP38BpWSnsZpKX0zGxnIA8CHHp1jw4JqYo7
         WS2P1Y66kkaVWpzcwNMwDZqe7wi5+5PWXfyuBtXyJn/AN2u88e5G8N2Cekph51hUaEkO
         qOvIE+rE3HkhhXI7qdi4alO06PYerRIFlvuDv7wHUFTpLdZeAnvncljZ7xi7tCCUn9PQ
         ryCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a20sor2699550oii.112.2021.02.05.11.31.34
        (Google Transport Security);
        Fri, 05 Feb 2021 11:31:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cwFa1USdzW0+VscxRo5AApRRcXP6vpeFrhMNguXPAw8=;
        b=RgBwpdtAuT1KeJFDiaPtKDfbvicFPYJR6hBhaUJwCRFaGuUBSOJHLFU4NVJh9PauQf
         FIt0MH8zOrsR2sovkBdVnr0I2QruxJguVnCo99IWnK9HyGDNHb5ievufbOTuuGmKavID
         v1pLJIL7HB8M5z8u78aLgdlWKa/P3JLZIJ5E/3JxFYGsG706sMV1p+0Vr3goHBE1ub3i
         5o+xeep4l34diczX2juAJ4FbMEIglNfN+RhXrj+pgyhdLSykMlgsyt6O8/1JazGrbWvY
         Fx3cNZxvVoQV8Xd5pAbL1Hk3qcXihoFKHmFC8bEueyWZI3AYpPowShXV0mFOK9a5I11Y
         YChQ==
X-Gm-Message-State: AOAM532KkrXAqurEWN64vjLVGFlzQupKzX+mbA1q2JBv+G06SRZqHOdy
	4yttAswxi1s4TOE1UuXHo3R5OJ/TqWCTDxJotPXqVj6C
X-Google-Smtp-Source: ABdhPJxHzKTk5u/AM3YXmnd1mjMo8HFxUW8N7k7fj4iUFvBvllvm1D2NC2F+1E+pvsHbgwiicjjlCGprU2RLIWGUg0w=
X-Received: by 2002:aca:5e84:: with SMTP id s126mr4176187oib.175.1612553494713;
 Fri, 05 Feb 2021 11:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org> <CAFEAcA_qZ-k7jZQ7NUxQ+BXQ5LtLC1ogorKaE1iwz2Mm00Xwcw@mail.gmail.com>
In-Reply-To: <CAFEAcA_qZ-k7jZQ7NUxQ+BXQ5LtLC1ogorKaE1iwz2Mm00Xwcw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 5 Feb 2021 20:31:23 +0100
Message-ID: <CAAdtpL5Aq_1nQhXPPEinosdoD6sUV20d-kDWTZcKhiQZtr94Fw@mail.gmail.com>
Subject: Re: [PATCH 00/24] hw/arm: New board model mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Daniel P . Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: /wG47j1VCyhF

On Fri, Feb 5, 2021 at 8:21 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
> On Fri, 5 Feb 2021 at 18:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> > On 2/5/21 5:59 PM, Peter Maydell wrote:
> > > (The selftest is part of the AN524
> > > download so it's behind a EULA click-through and we can't put it
> > > into an acceptance test. We might be able to get something
> > > based on Zephyr or Arm TFM.)
> >
> > Wondering about that... If anyone can go/click/accepts the EULA and
> > download artifacts, then I'd like these tests to be committed to the
> > repository, with a comment containing the download link, and the test
> > can use the skipUntil(BLOB_PATH && BLOB_HASH) syntax to assert the
> > binary I downloaded is the same you used for your test.
>
> I would rather not get into that. The selftest doesn't actually
> exercise as much of the emulation as you might think anyway.

This was clear from the previous paragraph, I was asking about the possibil=
ity
to have developers/maintainers individually accept EULA to download artifac=
ts
for integration testing.

>
> -- PMM
