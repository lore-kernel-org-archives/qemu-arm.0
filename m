Received: by 10.28.91.67 with SMTP id p64csp706904wmb;
        Wed, 28 Feb 2018 07:02:29 -0800 (PST)
X-Received: by 10.157.25.29 with SMTP id j29mr13517380ota.325.1519830149327;
        Wed, 28 Feb 2018 07:02:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519830149; cv=none;
        d=google.com; s=arc-20160816;
        b=n6pSiJv/ARNHXjuPELcjO7MppMEeMtVV/NII6CNmMJXTEYouT0s4LUNDlz910/ZjfY
         bQnE5yfJ3BdZqYJxkkUZcdQOBMIaGqvOFpGwjtvnq04dYBloUIldYHVajNKApE8P5uuM
         iYNiH6EWQCipEZnv1OEdP6L61p8K1qLWkClhsvRQ4Fnd6KnYXNWAXo4L2p1zgWD6RtsN
         FDvnOaux98aYsi7/OmvDRWwpw8+krth6XfoUO1TWuW5B79v015guHaocdiR32B/eds1C
         6aZRC3EI0cmIcqBYkdGFEjWVrlpjTGxzHb4puZWOnj98lXYJPu+b00InifwbuFBVgcfh
         9X2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UlEkn31mPGzCmPRwe3xvQ0wWSjnZ7ZpylKHZyVxqXWw=;
        b=aiHMvWHL+r6PycFVaZhLYBbR0qcs1DPWWo9p1J9WIY0IZlb6CSg9zny2sOsxtw77Dx
         J2yeGJ+ua8gccJHdHZdbadwTulMT5mKwl3xwuahTXTs1xs/5K5HLe5LkpfirlgkIXtu4
         e7S050bdM2b6YKKYfcB/g7D5i5O7aIRnS0P5iNa9cOYUhmxlJcIyTTa/hk8iR8OVFQRZ
         Z1hbNIfuPpA0ny/8LfzzgyydiZJO7lrJhg0iQD+UCjqEBKcnOnyJk5sAAwKOI0rldNqo
         4pYuzh9vz/DcrFJ1hveFQ771q4wUCqefYerj0sgf5fZseFSuTMDeO5lvJjX52J/sA+Vq
         4sBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bKXC9ect;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t26sor719217ote.148.2018.02.28.07.02.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Feb 2018 07:02:29 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bKXC9ect;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UlEkn31mPGzCmPRwe3xvQ0wWSjnZ7ZpylKHZyVxqXWw=;
        b=bKXC9ect8jvGa0XeYFcg+BZeklM4jpOW5lWGq0ewOBIrcRsSRS8l1gX5PtBrtDncrl
         GWJLgYNWqE7HZjFGlcAD5sghWh3S59XON5u4XyrLYosilG8svmiQ0yKQQidC0tfCxwyp
         w+uN5p0flV0CZk1ydmna+Db3th5uNfOLvAdRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UlEkn31mPGzCmPRwe3xvQ0wWSjnZ7ZpylKHZyVxqXWw=;
        b=Wb7JgUUwaUGqt9sBoRrYTm3vs14kdxfdzjZrAKaGzEIWhp88bEhwApFW7vgm2gYvKK
         +UYmWYBzt66O/na6sZQo6q30wVQMj7PnmvNCW5OnO9mUzFGY3f+lVxrkuGyP+SrhCwTB
         tYQ0Ee4FsLoUgsK7Mm2hyyCa+RiVLeBOCI8JSVhAZRjCPlHctH4QpS7fut2rWrM781nb
         flg7QyEhBYzCtcWgNMglRsY/FD/Qh1VLY3VvpNv8YfpWPWV2RzOP36bhU90HJFVx5lg3
         a5b9zQBjkaHSayQExdLczY2wekMYG1mpIfrwMLqU273s9zwu7xbxs62P+4D1Kf85kvo4
         KZhw==
X-Gm-Message-State: APf1xPCAlFyBBru6TSkIX7JbjkmwPX9aHPy9/qHVsebSBJPm++wvs9JO
	8x7A/aUq9IP1xuke6d/LBd47UAAEUBVjnRt45kxxsOOjU4g=
X-Google-Smtp-Source: AG47ELs5E4yOHq5e3O1xz9T60gfM0K2iVwVijWo5FsDwik7BgiUjPJtI5ke7eqHTl5UrN/QFPXcJbirE2ly4j5MS+7k=
X-Received: by 10.157.3.70 with SMTP id 64mr12660807otv.258.1519830148495;
 Wed, 28 Feb 2018 07:02:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Wed, 28 Feb 2018 07:02:07 -0800 (PST)
In-Reply-To: <87woyxutms.fsf@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
 <CAFEAcA8LEG=bzXrj3etTdf_q3-AcMVfCCqSGQ2OkXUPGBHkMBQ@mail.gmail.com> <87woyxutms.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Feb 2018 15:02:07 +0000
Message-ID: <CAFEAcA9LGHjneP9qi0s2jyQE=hz=fa6fadgv-0Znujr62H-0NQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v4 00/31] Add ARMv8.2 half-precision functions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WYaH4iocOrEp

On 28 February 2018 at 13:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> (3) Is this complete fp16 support or are there still more pieces to come=
?
>> I'm assuming it's all done...
>
> All AArch64 is done. I'm not sure how much AArch32 is needed for SVE
> support. The ARM ARM says "When this feature is implemented it is
> implemented in both Advanced SIMD and floating-point, and in AArch64 and
> AArch32 states." but I think it is legal to have a 64 bit only CPU
> without AArch32?

64-bit only is legal, but none of our current implemented CPUs
(including the proposed "max") are 64-bit only :-)
For linux-user it doesn't matter, because the code will only
run as AArch64 anyway, but before we advertise it in the ID
registers for system emulation I would definitely prefer to have
the AArch32 instructions.

Do you have a feel for how much work the AArch32 side is?

thanks
-- PMM
