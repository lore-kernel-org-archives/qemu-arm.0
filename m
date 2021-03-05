Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp257043lfg;
        Fri, 5 Mar 2021 03:32:56 -0800 (PST)
X-Received: by 2002:adf:fac1:: with SMTP id a1mr9217801wrs.98.1614943976427;
        Fri, 05 Mar 2021 03:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614943976; cv=none;
        d=google.com; s=arc-20160816;
        b=vGUl2xqHoO/NYA816vRC72cLuwcY/Hz59gKbpu2WDY4Hnl/cA/p0fVq30tT4ngRONh
         BM5DtxMIzuyvWRbhskex8F0bKxRSXEZkcTmEOietX8VYZaOp1s7DohToVRXuxjsoAVJb
         myk98BYfoMEWzKlxWblAi2sEVK5siha1pj9am2J32rO1SUjs6OyQ/yNBt2YiJG9WvHB2
         qbWPNu8enBi5PNuxGDtUbIu8HLbp8WYeudOR5MH1ZrpO3nTLp8LL70s6dSoiSayosSEy
         sF6pCaaXeisXPhfF0yyP0q/aOyGPtdUmKv+49cz7B4qoF3fBKIoGeifDbpnNCuJf4oFB
         y7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lZVhhR3YgpTzjn8evdkRljvwW27x0grWX/6TbXEihkQ=;
        b=ixR9/8DbmO2uhonTI1NC6hexsG55TpbQ/IIZoCJJhZ5eB5ith0EnynhVhV7HxrMWiG
         5nF3sTGPUqJYDl3ZaCzFSem91PLJlCeBvPc77E/SH9omOyiI2i/9N/p7dCOefUVBjHBw
         FpyohXFraQo79VvY/UiJ3bNRbzth372PfPJ9pTFsf8s/n1bTUWOmHII0h5kUQXzYdois
         T3lxezNmNksCYB4GzayuyBDNQr/9/JC7ONjphBjAfAqo+U8mtCnttf+rjWEjMIyaQIan
         /hjpCgOa2P+SzGk1nBmVCxyeGQdcJqRSMK1/FVzIy2duNQ4AagDNIUi+oajDEfH5E3A4
         mqUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEZ4lBZj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 1sor1087130wmg.5.2021.03.05.03.32.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Mar 2021 03:32:56 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEZ4lBZj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lZVhhR3YgpTzjn8evdkRljvwW27x0grWX/6TbXEihkQ=;
        b=bEZ4lBZjN9FQo1zZ7gUgBaPF+bSHLSMkGawzRBNGsq935l2vkvEHkOk9Jc2AszjCjG
         QGWkCidKGSdOlNXIV4/ZWL5UVM5abBEaOPX/U5IUZZLE/2zSB1hfvMVtOkL+02vgT7jU
         nUBbxqH/stcweQh266KoA6KAYrHGX17bhb/Nsab74GsEy+jhZRrcm7N9W51TuDcE+me6
         po3+ZvQnYd1T5N+srcbKYwjb6Bc2XlbDY4OKd5RmwN5hiaR+XSOIK8KgA7W+Z5aO0zpd
         yowZ0fEtS3rnZdGFg2gZQn/HByuTcnNoKCkGJc5j+EY/IVLTSbD/Jw+WYPhv95Id1cG4
         2t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lZVhhR3YgpTzjn8evdkRljvwW27x0grWX/6TbXEihkQ=;
        b=GwlWE3KDzFura/Yf4e9ua2ay1mjx+Gnr1UbQ6X9AJjE5nUEhGB4N6Ooo4Dc/qnlK6T
         2EoNspWz/OUWcXz0lyhTijkjJxxh9nT7CL+e1JN3xGxA1NioRJjlPvGyf6kLDMBiiTPF
         gnqSggxYiCZFPXWdYvi1CAnES4VsSiMZlTpQZtfbQhHHuv85xCYLhZmQmX4scUTEKrKb
         CgBGZVdzx7r7S9fzI4Sh8QcDQcnxgXjv+g/LkpEuiotqoBFDt3ngxGkYO3rSQlHQ8YGV
         f5793MVaimKXMHWXD5MDNknt1lo2r0VF/RQoDNyukK0cG0/sFVSD2Zoc1Z/1p/0FpuYZ
         2v7g==
X-Gm-Message-State: AOAM531DpYGPtRQRwV9Fo7o0TnhFFzLSjvHLgDoAo9s4bqtYSWCdkL5v
	6WipZBUBPsGxGKuiP/Fld0bKvQHHP/4RAyO5k6w41HY4ie/vNg==
X-Google-Smtp-Source: ABdhPJw2qt1D6hMMlStPzeaYXtOfFqRRbDSramqnHqzihdygL2qUFbqPvUTZEwB6M5vjoGiW9+i0ft8BgY7YwgKnDHw=
X-Received: by 2002:a17:906:1ecc:: with SMTP id m12mr1817959ejj.4.1614943976226;
 Fri, 05 Mar 2021 03:32:56 -0800 (PST)
MIME-Version: 1.0
References: <20210224230532.276878-1-richard.henderson@linaro.org> <874ki0bhi1.fsf@linaro.org>
In-Reply-To: <874ki0bhi1.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:32:40 +0000
Message-ID: <CAFEAcA8OFQJxCeGB9aF1P3UwJTddRb6fMuOJbNKMYs+ktw+izg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Speed up aarch64 TBL/TBX
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: P+v7J6qo9YA7

On Thu, 25 Feb 2021 at 09:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > Always perform one call instead of two for 16-byte operands.
> > Use byte loads/stores directly into the vector register file
> > instead of extractions and deposits to a 64-bit local variable.
> >
> > In order to easily receive pointers into the vector register file,
> > convert the helper to the gvec out-of-line signature.  Move the
> > helper into vec_helper.c, where it can make use of H1 and clear_tail.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Looked marginally slower on the (1!) run I did but probably in the noise
> and the generated code looks nicer.



Applied to target-arm.next, thanks.

-- PMM
