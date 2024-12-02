Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2700393njk;
        Mon, 2 Dec 2024 03:04:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCHpVSL2daGYPkjH8afK3os/Deo2aGEUSGIJiWxfUpfOPIdgjR/OOipjs+iH54eP296f0hok8gbrf89g==@linaro.org
X-Received: by 2002:a5d:5f45:0:b0:385:f38e:c0c3 with SMTP id ffacd0b85a97d-385f38ec33fmr2538857f8f.6.1733137473585;
        Mon, 02 Dec 2024 03:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733137473; cv=none;
        d=google.com; s=arc-20240605;
        b=W0vu2iIQazI2OqsprTxmfdepw5DEunzXfKIIRIy8AuWFCFdMzrq0JLi0/+DOBQJs5L
         CdYDQCkFQUw7FhlXd88ln9vDsE5iBlKmPt0so4lfEedyj4EVNuBi3ZK26Iu+BSzaP0X1
         PvmkAoSfLwSJyf/DhILe1SfYObVsRt3B1Uk+VeXtPSkL8HtSD5y6LtZ+c7NYLAGrZueE
         CADvSrA7ENb0SO0wh7l0s3Ek5y1DwTqKKWzhGq/z3P2882Ul/8EPCWqTZRIEn4ji+zBp
         iX1hOCS57jAKoq3DsJpPvdhyJZy0oXEFW5mSv8Sl58ubLIpSoFpyBa0JHjK31tmYBoRq
         vuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XIgWN38KMu5LfcA2A4mfWyrUaVBJ1N/G44J8mNqA9Yc=;
        fh=DrqWUBjD2G0dCy2Ncqs4zQDJk6RJLr64EnNydxY7ggw=;
        b=GbMTrbf04CLQkKozplUA148q0et6K8nO/FIhve0LFNkgwDmU/nwPi87eCN6Tt2XiIF
         qm4pckXY/Vb4vH8bZqDhTtTW2jMSlOvTaEuFMSduEXF0ZepkIfsmhpn0Fj1dYCFPfbrB
         JCre6cjBlOZM73wpz8Qc9P2AAfRJkZCSe+5AYSFj3iED1OTa5tj+rvHDKlM8XFOLVZH/
         p99tTj4Qni3eIda5T9duoeOdCgGnqeTriOQ8jRv+To14DxK6D0aBSMRFAjcvBBLgApIJ
         J+ANNpUrgNZCKlil5haFepXW6eyWZVEeLc8RNGKl9FkUnTs+i4MaFiSBuUMV8M1W8Q6W
         UnUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tPJPdIJF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5d097dac9basor2995195a12.5.2024.12.02.03.04.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 03:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tPJPdIJF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733137473; x=1733742273; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XIgWN38KMu5LfcA2A4mfWyrUaVBJ1N/G44J8mNqA9Yc=;
        b=tPJPdIJFwi0vI+Q6IwA+xEtYtjohrfSDnwwOm4lQwrWapuuJbwz9xFrLqtXj24b6yh
         k78rfOKSYbA8jIZOGN0+zDMol/bw0BE8Jk2QIa65l+zNhYCG/i1uvoSJoed4pjn7RQ/3
         xEdalMunn6uaANoAVVcGoETQONAKXvNG2aOnF8JYVBj+eql7aOqHv6CSibeTEtj3rhDx
         RDtgKRY//P3PaM7+4ZRGrmyCZ0tuNUcQbv1GjuG+cpwqJxxD9Sqzn6dqvnQ2rgW4vAKR
         bSYuUSf8dYy8p5CUKeLO7eHjthRndVTWH/EfFz50uS4vAKCSg4yQuK5NV8PyiEsfkQ6N
         DuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733137473; x=1733742273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIgWN38KMu5LfcA2A4mfWyrUaVBJ1N/G44J8mNqA9Yc=;
        b=hhEYI35R8Kp+LkrECoypghmhx725DccSnXW5znlsfMNnj15pZZFbDvLdElBMmaw+HP
         F5LLOTO9rHx9/IRB0DfnY/VOVsCmftD8VQzKZX7QOCdE7tv3kH/Mwz5mliKHCg0NVZGE
         wfKe/rS4bHHfTGxrXcpuPmIUgxSXQqeiG53fuz5lmIS+Tw91sh+wzVaZZpL7Tbk1lz3D
         8E8ABg4fqPGzhNGmkj4g+puD1rc2aowAwQdVHLjIIMdrYhxCcVPT9uTJd7CaEaB8UXyN
         8Gtv01AQuBOpc+MZb9es0JDr7ly90NyFSe5BmTiMhmWpCsKxjezerAkPukeXn7BgnzKQ
         w4hg==
X-Forwarded-Encrypted: i=1; AJvYcCWWO2lP2kr+UiJ2lfX278xnhrm9GteiFSHXYof5bCDDM0ajoLSwfLyJPbTmBEENCsjbJtJh2msfsj5pJA==@linaro.org
X-Gm-Message-State: AOJu0YyPLr25DvmAsoTU+Iwwkg3r2pwWw6AxTZBcOz+uPiomKKbmdhTO
	ONYpAgFwg8NLtcP4X/Ns+UzonoYqPkMiCqQOwDBDV6tfT/T5QDLP0FVPgeNDueABAmJqgvLwlRL
	x4Gyg8dI9oaZkmpZHCHyeQF5dujHNxjdd8ir0B495
X-Gm-Gg: ASbGncs8mpokkr6NFY3IiE/uZiS1un/xx2SSyjgVYkIHuqhskXl3I1Jlv0A0zE2FAPj
	D9aD3jC41DGMI4TBJpK80ebDKjBmNsCG5
X-Google-Smtp-Source: AGHT+IHrwpLh+sek1XYebFX80pmk3soqyuLKkOSoqt+wQ/9TQa28NiCOQYa5CsQ+oCv8UAZg/eDVa6RxafcpGmkg61E=
X-Received: by 2002:a05:6402:40c6:b0:5d0:bd2a:fc18 with SMTP id
 4fb4d7f45d1cf-5d0bd2afeb5mr16062852a12.30.1733137472997; Mon, 02 Dec 2024
 03:04:32 -0800 (PST)
MIME-Version: 1.0
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org> <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
 <21d8399a-91bf-4599-a73d-351f9f0c147c@linaro.org>
In-Reply-To: <21d8399a-91bf-4599-a73d-351f9f0c147c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2024 11:04:22 +0000
Message-ID: <CAFEAcA-4_tnm9iPCf_3E4HKKXJ9h6w9oMiYaN0Y4s9wmpji3Jg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, alex.bennee@linaro.org, 
	Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Steven Lee <steven_lee@aspeedtech.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ZbyUjfPRSQdH

On Mon, 2 Dec 2024 at 10:58, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> W dniu 1.12.2024 o 19:09, Pierrick Bouvier pisze:
> > Hi Marcin,
> >
> > On 12/1/24 05:34, Marcin Juszkiewicz wrote:
>
> >> So RME tests probably need longer timeouts or would not run at all.
> >>
> >
> > By any chance, are you running those tests in debug mode?
>
> zOMG, thanks! Turned out that I left "--enable-debug" in my local build
> and forgot to remove it.
>
> 90s vs 2974s is a difference ;D

That is a particularly awful debug-to-non-debug performance
difference; it might be worth looking into what exactly
is causing it.

-- PMM
