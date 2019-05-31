Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp732272pjq;
        Fri, 31 May 2019 07:38:15 -0700 (PDT)
X-Received: by 2002:aca:a846:: with SMTP id r67mr106189oie.104.1559313495608;
        Fri, 31 May 2019 07:38:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559313495; cv=none;
        d=google.com; s=arc-20160816;
        b=o64kdQuSxODJC444trnY9coG7aQU3F5oLHC1k6hXj6r9vZIDbn/6HRtWEpUoqsMaq9
         V7LdLOddohAxcQlWoez/P7I+GfsVlhlRuybRCDsfyTwOan0UGFi8OxM/3RlF6aYhYVQl
         uPU3NsIWZ4DAUOKrAQKUc2TPM2p3bH5e7VrEKDorsBpSpVj1ws4L3tgJkVmwBeIy58WX
         IKsfrFt14NIXWYZJ/GVDPPeiy/uLLNFbHmNwi1hwDFqfOXYBJ9o0H/NZdfAXR+7Y76LX
         Rto/tTAkuignG1R/H9bQ7Ym15C+PeqdavuP42U0pN1s27XMBf9QJNGMIFkU6NhzhYGpK
         6DyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k9imRTc2KnybCNJm8nEbnNoJcOizofvIciZMP+z2kNg=;
        b=J1JX+0Bo99W9sG1AuBPY0MBXbWwCkEuN1TMKWQ4ftsG8bsyrg6J/vfmYZ8gHkEnmYc
         7pWFHbri7CmeeZqz6HvQTSt6IKKJ2z/0jHPwALdb8byffLbqbe2ClDnA6F1VWdWEvqEl
         gHPXyRyADAPwf/Z7dPImo3urUbGFVhs+5E9Ww5gtsJCCQu1KbX47u0gfzyjmBv24RkSu
         Q0vNGpU2gnkedusUCQPh9qcnLygW/XIpWinIKfmr40p02ePooQ7sVwLOW7Ah2wShp9Hp
         VlPoFqy8PhsxOBRRwsV/Akoan66hlpH4KgPyjL5VCLTqqiMDe6HJ/RqvyS8Jt3iv3bIT
         jx5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l5GwML/0";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r21sor3001141otn.151.2019.05.31.07.38.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 May 2019 07:38:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l5GwML/0";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k9imRTc2KnybCNJm8nEbnNoJcOizofvIciZMP+z2kNg=;
        b=l5GwML/0Ioc3k7JrOsYxbumFbW0IrpF0yS90LJB04ot0Gzyo6mJbGs/qFJ2w786oez
         jmP39V80UG3ratuDzfJwkRF1TJeT3VQ8j9BSIjcC58nvjTg0X8VeyasPGdKELawNDIf8
         fRrhnh7xibhLL9DoefhvJ0EjlpI12/PRKu1hvK6FuJfUQ1HP+8jSh4Wa6EDOax56L50o
         DBTupM6kgylEORr+0ukqitRRw9bTBqIfOsYAjrJcJO9xrVR8PsHgmFs5LNEkHgz9pIHC
         imtX7MmeeXxzVUVp9CTpwi8FUkdGAQ8foKU0Czm+lDV9ZBZ81DNborBoP3VkpLscKvl8
         k+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k9imRTc2KnybCNJm8nEbnNoJcOizofvIciZMP+z2kNg=;
        b=O1QGJ9nJQWrD178eZSonAODUm6B1J+ZC9/oBhGhZK9mfavBA4R8qkp0qjLqWKvGKgs
         QStkOBingy0SFnm0JwsXpMCZmwP1/PIpei5V8AL1H7kGs4Z0e02aLJQiG9FAP6h83GNt
         ez3jFTKuFu66HyI0jqmdikK9GtfN01AKn978g8bCzD7q1RJ82WYeQU3vKX8bTQsdQSLb
         NT29ZMHt9Y63vhMOExo1OTlYPoOg2mPR2FvwZDxZiWxFsi2hbg5UzXUxzjTLZ2UQqMDV
         lQRludoI4nHELwzClVIL89gMqnnq+aMYDKyJPXZU9bNTCA1KmngTAXPnM2w6As9dEGhK
         062w==
X-Gm-Message-State: APjAAAUcuYOPuM0RT491Cv99OwZLY0hckG5Wql/1MDC1HmnohaIw4Pas
	pheGBFHNcnT1gS0k04Wzv86uhA9ESWmG84Xivkl1RsB1tBeoOg==
X-Google-Smtp-Source: APXvYqy3g/5VQtwlPGzXkI2xmSGFdP7hk1u+DgG8xuvSvccJTitBX2pUadayHgfTEGkB88j+nDPKKQfbODwYeQDzhRQ=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr2193778otk.232.1559313495087;
 Fri, 31 May 2019 07:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190514155301.16123-1-alex.bennee@linaro.org>
 <20190514155301.16123-7-alex.bennee@linaro.org> <20190531091204.tjmq622gw457xbdr@lws.brq.redhat.com>
 <87sgsu51bd.fsf@zen.linaroharston> <833530119.25503992.1559302089822.JavaMail.zimbra@redhat.com>
 <874l5aahmx.fsf@zen.linaroharston> <627031963.25549126.1559311169316.JavaMail.zimbra@redhat.com>
 <87o93i8zrh.fsf@zen.linaroharston>
In-Reply-To: <87o93i8zrh.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 May 2019 15:38:04 +0100
Message-ID: <CAFEAcA9UGSM_eNFErNHtx4vqosgTyPJ85mQ2t=QnnkpnGN7rDg@mail.gmail.com>
Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common
 interface for WRITE0/WRITEC in arm-semi
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Miroslav Rezanina <mrezanin@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: h+HMTCj+7K7M

On Fri, 31 May 2019 at 15:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Miroslav Rezanina <mrezanin@redhat.com> writes:
> >From: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> >> OK - so from the upstream source tree CONFIG_SEMIHOSTING is still =3Dy
> >> (but I can see most of them are now =3Dn). Isn't the simplest solution=
 to
> >> fix-up your version of the default_config file to include SEMIHOSTING?
> >>
> >
> > It's fix but it goes against our policy of handling CONFIG options so w=
e
> > would prefer to have this fixed - otherwise there's no meaning in havin=
g
> > config option if you can't disable it.
>
> Is that what it means? For my part it means we don't build in
> CONFIG_SEMIHOSTING for the arches that don't need it (which we were
> before). Granted it only really simplified the vl.c parsing and dropped
> support for semihosting for the linux-user targets (except ARM).

Yes, that would be my interpretation of it. If we had
a 'config FOO' stanza for CPUs, then Arm CPUs would
"select SEMIHOSTING". If RedHat would like it to be possible
to build Arm CPUs without CONFIG_SEMIHOSTING then they're
free to submit patches for that, but that's a new feature
upstream doesn't currently support, not a bug in upstream.
(Also I'd be a bit dubious because it means that previously working
guest setups that use semihosting will break.)

PS: if we had a 'config FOO' stanza for CPUs that would also
allow us to say "building Arm CPUs requires the NVIC" and
similarly for things which in QEMU are devices but which are
architecturally tightly-coupled non-optional parts of the CPU.

thanks
-- PMM
