Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6702470wrp;
        Mon, 30 Sep 2019 03:36:25 -0700 (PDT)
X-Received: by 2002:a9d:2387:: with SMTP id t7mr13100491otb.335.1569839785082;
        Mon, 30 Sep 2019 03:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569839785; cv=none;
        d=google.com; s=arc-20160816;
        b=qXksy4dqQxzWW5b0Z/HYfmt8KxD7m6ydDxajtVNFl7k1kjq7rsX+uy6Nl7U5yxGPzY
         Mw2g+XkmqLRRTc/9PHJUexD3h+YRN+tl549IppivPFKf41mSrUQUvqwRF6DK/RKJM9p5
         90twdWjD0Y4hItzpDxlAx3Qdc0e91VHTXacXpby1d026u+iLk/zIDgnCvh2vjPuE7uKo
         x+Zr6OoTZvnFNf/o8RBWacxrShoPrwoOXuR3iCBBIRLnra7yhFDzY1yb1WJchEPbo6Kn
         h4+OOlC9nFi/8bYq1J/zP5Ug5nLZ6eJjqvk7AHPweAdiR+q/eBAO/kvrCSmDsFqWNPp/
         2VUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RIpIdKusdl+IE2Li/qyUEzusAPTfzSa89LvtdLMUo0g=;
        b=bXfdU4PlkBgWgkL+X4cA5SSHlcAkBeMsfHbkzpNHlFnYZ1LdgTvNFvgscwx13tVO8n
         WMuG1yEI1MKB+WfQlQMxCYW+o/Ti3dvsUMwhFMogCIIsuSbXFtBjHJ0DZs0AZ+pceXAa
         z7kt2AMYR5e7uIFXrT9UNMkiTpjkwlUF++lmoKcXQ0uX8D5WJvvR0mW5oLRnGKICsw2w
         4ktNz+iQa3geRxuiRb6u+/+Sh1n7ihdks6DRlgomZco2iqJKxEit47Go/p3zJ+/6o7Eg
         HO22QGC/RgvobPz1GjcnMCi2z8Gx4ZQEuYxp2i0D+jb3doDTHZfT2M76X9UuHMIAayr3
         wtLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcXan2xJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z6sor7048893oib.20.2019.09.30.03.36.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2019 03:36:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcXan2xJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RIpIdKusdl+IE2Li/qyUEzusAPTfzSa89LvtdLMUo0g=;
        b=gcXan2xJP+z7JjARjErViz2CERrDuoztTZzKjyjJK8bI4YGb/FgB6+/L+RuyWE3sBZ
         O60PaQyQbG+vI2gDEk7pMyhzs1xOhQ3pZuZGBgliijP2kJuiAICf2dQlbZBDWofDHTSO
         zyipQVAuTFix0feS0Pho2617ib+M9uC8mCprFcjIoxobBMFWh7f/WFZst203p29W33y3
         Y3egtDXOuynsGn3Lp6C0/3Y3Nkk7JkhcRa1daminunout5uOc/ysZUCWejcp5py8BHw4
         H4XxWTZmZDUpdehFumvqFURMWF2dA23i/TrTrnRUIccstB43BbbXavG/KTYW4P0tmAKB
         GHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RIpIdKusdl+IE2Li/qyUEzusAPTfzSa89LvtdLMUo0g=;
        b=GaDHrHGYJnrEHIFvYxSM20QtJe2r2lB4Ff2F0pCmgYBl2ZxtLaNAsmrP7Ng7Kdc/QA
         lv1JuWuzy5MVl2vfJJWacHhVcLWiFAcnHqLxMoh0VxUX6JrbjR2YWLu0z1tl0q2ViCGC
         NCMEkKRxevIsq13cBVt9iQZuCIcm8G1OgkMr6gTj1GW4dO+RZtc8PWlMEWahuvQhohmL
         hS/ir32MaohIFo9A5oXNlFjFkyF4SJbmAptmPzpXD0PpuWSIqp50ecN7C9Xue3SRJWbm
         bqgFEZ4cY2Ig+VvUD/6ktkV0RjlEaEtR4TMTEKrcdOe32FILwejJGAZzAERChJHFaQve
         mFPQ==
X-Gm-Message-State: APjAAAW6mgQ4FIW49aU3tVJLcTm+g5p5kCjDq6k7pbQuygx93spnJiDg
	0QJtMzWV18wTXmkfIpIjApNPc3wYvZNO+Ip1jFvJJV3zdLdutQ==
X-Google-Smtp-Source: APXvYqxYhOUnByla57bN4hLMfMV17by52x9MiPYPYIVih0/mKA/kbkkOpU9BEJDpUHnKoOQJrp64OCAfYLeF0MNxSJU=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr17817001oih.170.1569839784454;
 Mon, 30 Sep 2019 03:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190925233013.6449-1-alex.bennee@linaro.org> <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org> <20190930092519.GB11996@redhat.com>
 <87impakrky.fsf@linaro.org>
In-Reply-To: <87impakrky.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Sep 2019 11:36:13 +0100
Message-ID: <CAFEAcA9TT9hpRF29CVdZ8h83+b_rwc0bRWeVNjC4PLPJkzdFOA@mail.gmail.com>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>, 
	qemu-s390x <qemu-s390x@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 4xe+K5+nWvRB

On Mon, 30 Sep 2019 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> So if lots of people still want 32 bit host support for TCG guests we
> can probably come up with something that keeps existing functionality
> ticking over while leaving the newer architectural features to 64 bit
> hosts only.

I don't think we should do that -- QEMU should offer the same
(emulated) functionality regardless of host.

thanks
-- PMM
