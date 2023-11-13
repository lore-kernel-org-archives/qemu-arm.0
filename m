Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1320242ejc;
        Mon, 13 Nov 2023 05:11:33 -0800 (PST)
X-Received: by 2002:a50:ec95:0:b0:53e:29c1:ae1f with SMTP id e21-20020a50ec95000000b0053e29c1ae1fmr5136676edr.19.1699881093745;
        Mon, 13 Nov 2023 05:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699881093; cv=none;
        d=google.com; s=arc-20160816;
        b=XiCtMRyCLyGfBUmxbf72eGTWSzJE30Uk+4H3tJp5utlyvHX04DgE7DWqDwUHlD34E2
         v20FqtMq9t4S8a1P8GnJMOrjiApNEwhAJCZlupuTjjzxOx8MPj9oI5ww5FWNt0hj6UFZ
         ldIrqqGgLm2ERPiSAey7pq0V0OZwFqctBuGwe/RM+kSydnMieLmdkW4FWOBKkoGo+HJ9
         PYBj4lK2rUVRSuu4KIRJGrv7SR/aLeSDl1drTXTxyvlS/oK6sFxf83RzD6fuRS+/tPz7
         IuwctvrK0vB41SsnZyb5pjal4mFX24U+g1aVeYyFVfqYimb+tDV1aC3YnlNWc/e5mfSW
         1YjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZgTbo620SzKFbNfoBUClJikuB7okF3V9knnrZKTMLY8=;
        fh=P+Jxe+ydfSl1cP30TqtBnnQeiBkeQtzeFH1r/b1mTHI=;
        b=LZ51tpM+c2q7MNLAOUJ3KcdhuIZdFUFk3hNfBhf0x4/ls2Trfk+4ioR/45TTpgyHB2
         HgXS2xP5EVel1Y8dzx7J23Hv+eMbZd8/UKU4NIHKd4zP39oHwNcKslvR0RDjDrIMI+yC
         2FHK/lBKCpGBixZ6o5I5OERljQjgU1E5ZwfNj+Ik/Ztv4O2hle28U8ALfHRVOiec0enE
         ZZ4IWP0mNGC23lMtG49HbCwqa/4iBFXfzHF6gkOn9KqBSM+ChkQ2X7zs2ZfO74KcocgC
         f78EPQJqFvx3AjX9b77VAcmfQ/0ZZQ+FjXmqIsJMsW23Y4vetIsFE6XKUIgAuCrXnJkF
         KHAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ve+3ffVv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w18-20020a50d792000000b00537fa220bfesor945286edi.3.2023.11.13.05.11.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 05:11:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ve+3ffVv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699881093; x=1700485893; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgTbo620SzKFbNfoBUClJikuB7okF3V9knnrZKTMLY8=;
        b=Ve+3ffVvIDDM2i1jDhO5ZnlGKjY8yK+7BxVl2BWoL3wjGNnssltkEqP3f4tWZsI0Nk
         T7txKrZbnIh9Dcnnovo23LfKq1ZpgKtqeTAZNQVgLcxnivMpe4VihLMSE7QPdtWODZ70
         RupduulLFPf6PQGy4eLtFNj9VU7TvEVAGDfcAyedzPCqN3bR5bvGAgrTDW/89wvC7WDv
         JGaAvSeRo4jXq4g+HS5h5PCQI4xFZaQkuI+RUTUm1hjCFaN9oNWNs1dMoBW7iHWv8+73
         fGP2y4GdtWAaQ2FEa29NMjoU3da4rA9dSB1XX+1sk1GCmLPyp4XlupJu60irHWGFp+KV
         4wNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699881093; x=1700485893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgTbo620SzKFbNfoBUClJikuB7okF3V9knnrZKTMLY8=;
        b=neVv4EZd71xkFM4kkJuV4eJdWMvvTWcWxex32eIYFkU4d/Ys8o9haR4gdeaBSu/chZ
         KCDijTh3Yxql9MYoU5Jf1dGRJgB2L4XUlxh1wVtjPC8yhk+GO+IbIA9c7/W6uvJcm28q
         jvTtNOE4SYdCMJkfwFw++4U7sUVaIh96W/0EinsT+SU3nJZ5tGobS2LPwUzbOz7lh5DT
         YhfgaQozCKhIm2VmBvx9PzJaNSMYCwTkXOBFh/B0Vrmema2QauODk+txTlj49IO0cd77
         dPZkxh+IZyg9Ve5jt9WyTZsHU7YEMHYIiYbFkBQK4EpbOxKDvXseyvCGlOuImMIuxSLp
         OaQg==
X-Gm-Message-State: AOJu0YxwUlV5KnqsRy9yARS+B1UmrrUBkPbswY6zbklul8qELeeXNtVI
	ydGiyWtaUdqBGepa3RFkytbC9HzjyavXlLEPlzRGRA5f
X-Google-Smtp-Source: AGHT+IGeHKTmo24CQjCp6K1A7yRD9bgbQEfImpd8W+JHoeSUbzXOKe3aMFQgnVQvNjRN5z50PvNl++uWDB8FEqC8tLI=
X-Received: by 2002:a05:6402:26c7:b0:530:77e6:849f with SMTP id
 x7-20020a05640226c700b0053077e6849fmr6012174edd.27.1699881093359; Mon, 13 Nov
 2023 05:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20231109192814.95977-1-philmd@linaro.org> <CAFEAcA8MJeX1Jk_-ONP1nNgHYadL7Oa8P3jGQXwNoofQnJWk8g@mail.gmail.com>
 <4ffed8f5-6624-4488-a74f-567cbd926b78@linaro.org>
In-Reply-To: <4ffed8f5-6624-4488-a74f-567cbd926b78@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Nov 2023 13:11:22 +0000
Message-ID: <CAFEAcA_0BfGVDZWJUPs8hwYRKS8FmzppQgY+s83qxBXHjLJvnw@mail.gmail.com>
Subject: Re: [PATCH-for-8.2 v4 00/10] hw/char/pl011: Implement TX (async) FIFO
 to avoid blocking the main loop
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: yX09vjF+ZS+b

On Thu, 9 Nov 2023 at 20:59, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi Peter,
>
> On 9/11/23 20:29, Peter Maydell wrote:
> > On Thu, 9 Nov 2023 at 19:28, Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org> wrote:
> >>
> >> Missing review: #10
> >>
> >> Hi,
> >>
> >> This series add support for (async) FIFO on the transmit path
> >> of the PL011 UART.
> >
> > Hi; what's the rationale for the "for-8.2" targeting here?
> > What bug are we fixing?
>
> The bug is on Trusted Substrate when the ZynqMP machine is used:
> https://linaro.atlassian.net/browse/TRS-149?focusedCommentId=3D149574

And have we confirmed that the async FIFO support fixes that problem?
That bug report seems to have mostly just speculation in it that
maybe this XXX comment is why...

-- PMM
