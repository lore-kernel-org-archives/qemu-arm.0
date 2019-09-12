Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2063237wrp;
        Thu, 12 Sep 2019 05:09:47 -0700 (PDT)
X-Received: by 2002:aca:b48a:: with SMTP id d132mr8334841oif.98.1568290187004;
        Thu, 12 Sep 2019 05:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568290187; cv=none;
        d=google.com; s=arc-20160816;
        b=KsiZKZEf3CSsp5ewic7g8Wb2mSt5seib/NGBIhiXc/4+HdXd+S1+RrrsQOu/oR2l4H
         uqykkB5K98vwlf3xjmd9LaJ78urMBQSX2dlCXEzxC4R/EcxlpbpaLi7C8ULBfLBZ/6c1
         xQxYOwjc/rivQkMAoaVQk/ifNYCPHZN72H/onpH9ym+K9HJTC/5I0tP1MMIhtj1wr2ms
         qc5op3nlpLpKQuUHdkO3H2Avzbl6bFHGQX1XHsPawHURWeVICEMFP0n2lgnkLS9CEdpd
         EkKYZyTMdu30AjEvebC3wSylXEcNahyUi63qClyVWM6MvVTmooDwxELJ6alqBcGhMyyN
         urtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BvDSlGW/ljIwdifZ8OqpxQdh3CICFSkI/PVi7XKfK1o=;
        b=l6gwDPFLktFShGsuki7l4KfRy/fmqg2GXPzbeW8mT+hHn6Wu4Xq60vp1Q9AxgFnI42
         PPrqiTVZpnx8STVLgYy1fs5osiOutvlx7twCDv5jKBvV7Ly2mssqjr8GYssU7DQSDthk
         nR924OwD1ET6AWUfMKdR/mdcCVai6hrvmd92asaO90kT652faWuE0+i1M93cgWwiw24v
         bjqM3iHdWAMVGtZMJa0da1oqQpKzy1qzCOngZVk456vC/YFZFbba50s3tBFlL1jLdvP6
         ZMhQpmIM7mRPX6sMZ7t3/esCqWIltOyjnEbeDfatQ3qaiAPaWBtrbXP6jrpUxcKZO1ya
         McCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GLiRQyBe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k19sor13144627otr.135.2019.09.12.05.09.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2019 05:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GLiRQyBe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BvDSlGW/ljIwdifZ8OqpxQdh3CICFSkI/PVi7XKfK1o=;
        b=GLiRQyBeV4DzzolsndUHa443wn0jwTMmgacxxetC5zRwKStPItxRx2ErLFcg43mHEU
         Qar12lD7Vpd+F0yjQQUbeLnDp43IpVyL86CHMNS5YVmWbMGlGknZff7p68fqEPsejXGb
         oc1K9Ek931XYAo+33xjHoEQHWOOsvV4ekNhkzP7x4e7I4dtBCxS0I1S1M93tYaeop+ca
         Upv5RA+y++H7wYVms/Aiu8Eer0rmxCY6IxxJiRicXgcTz9DAz8S2HGrfpKEkeReh/BDq
         UG786GbfFHuN/PZMWmGaWZ8TyOZsX7SwDY55h8EvuhFxCWBqzKrqkPsdZ5Z4SaQxlDj1
         mBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BvDSlGW/ljIwdifZ8OqpxQdh3CICFSkI/PVi7XKfK1o=;
        b=Ie2BkrUUeqGXTRSfQtma5QVQbs52KOVTO7yIMgTGPUzdCyiKDQi5vdBqo56dAxplOg
         2VD3cI0uikhS1BuI25OUtRw7XYhP3AYRHg+zjR7PRd2WCgjUrJa1lfkx2iur1pw9D+0v
         kbtJ0a9azSvAWXeIcTXj+MP6yubgX7tVP0ITODtDkyAi4ul2mtiiX0CtUP8nLpEs4BFg
         ImbZ4UH7jOWaGjP3iBAwD8x0PBUi07LG7RZqv6tDc0oh9/1Kyxf9LSBVQJ5dS+PX5JtF
         2UOM6io/LzxIkyvWbOVpTJyhKZvZERhhGAbFSzHdBILtYmKimzSrp4jcSSMZxTojD/af
         T18Q==
X-Gm-Message-State: APjAAAVdYhY43X0uncTKNTNi7m2igbi2azIENLRvOV8uLPWYUA8/Yhem
	o4RjqhkKccOCUoy7a9fnWyi9vH7SqqNqw5C+MvU2FCsHST2eJg==
X-Google-Smtp-Source: APXvYqx37i6VSB2VQxGr9a67rh0O28pqtNcxrNxCqACQOjW5sW+wNKDhbLB6TrcJc8XHxwb4KEV6YGXSpBAzY2+cy9A=
X-Received: by 2002:a9d:68d6:: with SMTP id i22mr26801018oto.232.1568290186464;
 Thu, 12 Sep 2019 05:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-13-peter.maydell@linaro.org> <87a7b9zpmr.fsf@linaro.org>
In-Reply-To: <87a7b9zpmr.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 13:09:35 +0100
Message-ID: <CAFEAcA_=s0Ua9S7oB-weoX1z7Vks54h5opWtuKnsNknmvaXg6g@mail.gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 12/13] target/arm/arm-semi:
 Implement SH_EXT_STDOUT_STDERR extension
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: V9VDSueHYiuZ

On Thu, 12 Sep 2019 at 13:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > +            /*
> > +             * We implement SH_EXT_STDOUT_STDERR, so:
> > +             *  open for read =3D=3D stdin
> > +             *  open for write =3D=3D stdout
> > +             *  open for append =3D=3D stderr
> > +             */
>
> I love the way the spec documents field2 as an ISO C fopen() mode and
> then an extension literally subverts the meaning to be something else.
> Where the designers worried about adding a SYS_OPEN_TTY function to the
> interface?

It's just extending the existing convention of "open ::tt as
read for stdin and write for stdout" a bit. IIRC some existing
implementations actually did this as a sort of undocumented
extra.

thanks
-- PMM
