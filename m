X-Received: by 2002:a25:ad16:0:b0:624:f3ab:3fa6 with SMTP id y22-20020a25ad16000000b00624f3ab3fa6mr1099182ybi.410.1645644497518;
        Wed, 23 Feb 2022 11:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645644497; cv=none;
        d=google.com; s=arc-20160816;
        b=P32NXausacb1OTIsPL2MO4loVDsDtJ8Y6dV4hY+kEvly6UVnTJkpBqolP3ISHBSXoY
         dNWukNOI1nWFvuuaDbMk8CaJC6LRppVQ8gIrkwciYq3gLIptyPKobF0qnd/ZcQ26U21G
         Qa766ixCYpAKfzvVAfkjGZSl6GYhbWzVQnMIBwk26HAm236Iati36Fts+qZAFtWVP0bh
         35dSe8F1NEqNBIFLW0Ot9DMCw9Z14cMPFaLnB+Payb9wB1Syedgylex4PUoytf+YfCA3
         TDBYdlv8iTve9ZL0m9eMBsspnmt9LVUuVNYylrRAzATHIZMfLQ0GFoIGkG/UOJVpEeCY
         kGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GQRCu/J6VFf04KDh6uR9YcZj4zH+auOhoAGtMBrdPZw=;
        b=auL6cI0BCJdzp2ml0TnAdJiPiZA+hLEBhfFo2oLxLnS1A1GSlhFE4QI3TI7yI9jTmR
         9eFBnfy7T3dB1J8lvMgeEOF1gn8J2sYdzn2fB1O+kNTM7rhh+dCOFsPFdvdgytMpIixn
         66IFJ1ru9wyXwzVtjfEYHY4zQV+TqRjqVYqiaMOvD5FbRA7hkaFKAyaSFmw9YTx7GEk2
         1V/9h8v77LNp9kDVQYX+JC39gKnwgkB77jhPUPrh7+1sg5gD/o7JikDxANFdQ40IYjA2
         4PWGa/l1CypokvEkMz5VjnGDMpPdAJGc0w4nuEcES81EoFe6QhLs6GROM6fRsQDyrVQZ
         GV4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iyezxr9R;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x5sor286211ybt.35.2022.02.23.11.28.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 11:28:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iyezxr9R;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GQRCu/J6VFf04KDh6uR9YcZj4zH+auOhoAGtMBrdPZw=;
        b=iyezxr9R9IFvovwuKDmK5Mi9SG6g+elGpP5tAWFVGQS6tFIbYH2t22e3WwUwU0MUj9
         b6jTotwrAD7a1canJ3LN41vZNB3/+2QAv8EVhCr7Y4iw7hg+VGEZ+XvoicejdzWWd7Up
         8rXrLtUcK52+20b30//uN4St9Ld4cXGynfMCTsnJvgWc4r7Lj2dsVQ26pW7yLiVrH2Q/
         ZCSO4Jf1rAYHwy6y7RDIFSu0uKA1doi3tp3BIH3dnYNWHpWUI2jwjez8ELUy17XtVk4t
         DeIPLxMZPvUpQLpkNab/G2zAu9fe7fe6JxzeXscbH9YogCc3TK17x3T/C1dr8baCHmma
         ETxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GQRCu/J6VFf04KDh6uR9YcZj4zH+auOhoAGtMBrdPZw=;
        b=dhrQIKAKdWCI+XHuImlkdVpi3JBbmVV2cg4yg24aj2uFQf7e8RziQHUfHfNzi49xAi
         0YK/drBam4febf5x8fswrBj48OfA1SJnsxCCJE1Wg/bZTryr9rafAKsL0Z9HNFNZS4pk
         vVwx1mOO1TwgyTusw+lRs+F6pEjEN2ul8aXqkcl8U6eq5qi5cbjyHdebEGP4VeevmT/K
         6YABpCW3xXaYWGR94ib9BD+tdSD7VW+ds++2ozwwfCW7nMEl0/6dWrWaNuBHKdBW5a2a
         9+2d/0eO9qGEB8MGejYALWBVfjnEl7Aw01AUbMRpml5c4w296OOX//iP+QXcHFGNlAxJ
         77bA==
X-Gm-Message-State: AOAM530asFXTd9Mpe1Jyk21AbgtyZi6OKxP2qKOIGYrqRk9RfmWpqGq1
	qxbmaYLFPdEX7wjWUEDCAMt6kt4ZBv59Zp3O7TB4Kh+w
X-Google-Smtp-Source: ABdhPJyCtnNG/2yWH591ZkN+lf43OOsx24XWLprf0zXIrAY9cGfPT4qGLgOjRnwWfibeDIP2pJoiB6D8txB6VD+w/+Q=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr1134932ybb.288.1645644497190; Wed, 23
 Feb 2022 11:28:17 -0800 (PST)
MIME-Version: 1.0
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com> <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <YhYVVnVSL8K1S4MC@redhat.com> <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
 <fb9999be-e1e2-8e8c-3c74-347c948635d6@redhat.com>
In-Reply-To: <fb9999be-e1e2-8e8c-3c74-347c948635d6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Feb 2022 19:28:06 +0000
Message-ID: <CAFEAcA-AvCDtM+evmTm5AsT-R2Hifc6-fPBWQ_vffOT7daBY_A@mail.gmail.com>
Subject: Re: Analysis of slow distro boots in check-avocado (BootLinuxAarch64.test_virt_tcg*)
To: Laszlo Ersek <lersek@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <cleber@redhat.com>, 
	Oleg Vasilev <me@svin.in>, Richard Henderson <richard.henderson@linaro.org>, Emilio Cota <cota@braap.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Idan Horowitz <idan.horowitz@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: t2qlV9MZZ3Nn

On Wed, 23 Feb 2022 at 16:38, Laszlo Ersek <lersek@redhat.com> wrote:
> BTW I still don't understand the problem with the DEBUG firmware builds;
> in the test suite, as many debug messages should be printed as possible,
> for helping with the analysis of any new issue that pops up. I've
> re-read Alex's message that I got first CC'd on, and I can't connect the
> dots, sorry.

As well as the performance question, these images aren't purely
used by the test suite -- we install them for end-users via
'make install'. If we want debug-images for use with the
test suite as well as generally usable ones, we should label
them appropriately and not install them.

-- PMM
