Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3193410ejc;
        Tue, 10 Jan 2023 06:02:30 -0800 (PST)
X-Received: by 2002:a05:6a00:1d10:b0:582:ba01:a3c4 with SMTP id a16-20020a056a001d1000b00582ba01a3c4mr23856810pfx.21.1673359350617;
        Tue, 10 Jan 2023 06:02:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673359350; cv=none;
        d=google.com; s=arc-20160816;
        b=mJOw8FFQGYTiINHgLv0uyJMzyhDCi41gDBgwLs1vonXglptzvK/s20iMeH/y1oC9S8
         vJeEdzdFuYZhTsJmXEI06IqI1fuXF6enDQ1UsA7Rx8wtriTJoHhlcAr9ImEYZEfOgonQ
         sNUTGaYFaYWAp38/FA0gAvfuNyKxT9dnuzqsyrdTguUN9/jjH35rvA2oeme1tTMyWngU
         h5u7/1aNHSGsyPOqHCn6p8MLte4iV371VposPo9vOw4TpEBMNK6dmRP7AJ3tDhYtBJhY
         MbIpFlVwK2Cw/XpYDPz8dN3hM1lNOoWtOwQrXCUiMOjJMtHdqYcq86b2NegvUixXJHAW
         emFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9WC4K7zYh2oZ5YAoZKDUxrgzMbH3Ps3fi5GbO0fyXOo=;
        b=VeXnOZDBPA+DKHT1TLm3H1bwjWFiU++Es5/Mju4KbUuUSyptEHtjPR52qVoflyyABm
         SuN0XavvrI5nkjY3u2aS3v8NzZqWPKlDceS4neG+nEXXabxJdBOuRVp9amFCr8KYVkyn
         XQPOkiGARO2F9pd7XnvNAKSZeqGXyL5nCUqgNES14fPQ/TkVIhame9Ayqy1pxZK+wykR
         x7yGPOmNGpnZU4x7pefAuf2bYy8zOsCvuyRx3dVHFae8V8vg8mU73KyCSrDK6wIm6u4S
         +eAPejpm9nhg5ZVZ+gRrzXyK1tr98NNacP44/n6CkP2/R0cRobtATj5q6g9yBvRGekBj
         b+Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qASrqfIv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a27-20020a056a001d1b00b0058985ed4115sor2599111pfx.95.2023.01.10.06.02.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 06:02:30 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qASrqfIv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9WC4K7zYh2oZ5YAoZKDUxrgzMbH3Ps3fi5GbO0fyXOo=;
        b=qASrqfIv0EG39YHjPe+uGZKQMDwOiJYERxXZmq8M1AHBcLGA9Z/fVF4/IB+iK99Keh
         uiHJoZ9GgaHxuEiMcpzsJaFT/m9Js8RNp6wIN7N8kLkrmFzMJWCJKna9g4Nz/vupLfj+
         ZmZ9rqks3YoNYozebD4SBOsYP5FyQCvivsEvoyv5jniw+EmVt86dLllEGtd3AhooD9wW
         IkFvPLh+4j0+pBOtJUjxp0X7/fkwwylyHXcuY7/dEhquTbKDOVm7ryh+H7Uug4HxBeBl
         JUJN0/YUd64nPffBiqT8x/d2tZqfoaOYmlvvNimiyE0YZhdotWCQpa+o1ysH7h1giMgR
         VBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WC4K7zYh2oZ5YAoZKDUxrgzMbH3Ps3fi5GbO0fyXOo=;
        b=Gz7OGeJ9L2rkhKPoidsrxvLBT6sbvkeDfAvZNqS6jTUtTcS/RLW96CQpeuaMZSiJEk
         0t1kKm1W6pfEYwH/sCJvhCICoNI2OoPYuJgmG9lkmnjdg+45Lelakq6ey21JKhafIIXP
         0kwIPQ7XiPhv9qwiJTmF5eU71tKpOYHqt2455SxgoB11N14WhdaMsPNT76d8N01Emzx8
         T8VuX+iYGf45No2rU7FLTpVPa/3F5X6w7D/ZPdwqgY+et22SrG5wonzhgObQSBxeZqjX
         OuFu+WgQtwo5LRzxfhXKip7KXCnX2I122x9tQ4oqXJDRBGSipQCUcaxXamBltuvY1TrB
         2j3g==
X-Gm-Message-State: AFqh2kojOU9dM6AkZZW3FL8dgs+xlQR55W0pNweIipqkIkMT9anWbnde
	wrBG18V3HvcfQeka40PIMlgKN6DFTkJkvOApxMrdvp/h
X-Google-Smtp-Source: AMrXdXtACAqDWYIAdzi7r1gfQu5djwu2cTcgwIWqvPx62A1mz0GkKX32eR5D9EYs6UFpfDRxnj6HnWZq6ovjR5BVSrg=
X-Received: by 2002:aa7:9485:0:b0:582:bdaa:b575 with SMTP id
 z5-20020aa79485000000b00582bdaab575mr2289819pfk.51.1673359350041; Tue, 10 Jan
 2023 06:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20230109224232.11661-1-farosas@suse.de> <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com> <87sfgia4uj.fsf@suse.de>
In-Reply-To: <87sfgia4uj.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 14:02:18 +0000
Message-ID: <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
To: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, 
	Laurent Vivier <lvivier@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5ajs/Ij58TYV

On Tue, 10 Jan 2023 at 13:36, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
> >>
> >> Thomas Huth <thuth@redhat.com> writes:
> >>
> >> > On 09/01/2023 23.42, Fabiano Rosas wrote:
> >> >> From: Claudio Fontana <cfontana@suse.de>
> >> >>
> >> >> on ARM we currently list and build all machines, even when
> >> >> building KVM-only, without TCG.
> >> >>
> >> >> Until we fix this (and we only list and build machines that are
> >> >> compatible with KVM), only test specifically using the "virt"
> >> >> machine in this case.
> >> >
> >> > Why don't you fix it immediately? ...
> >>
> >> My idea was to have in this series the minimum to unbreak the
> >> --disable-tcg build and later bring the rest of the changes
> >> incrementally.
> >
> > This test is basically checking "all the machines should
> > work". That's an important invariant to maintain, so
> > I don't think we should just skip it for Arm targets.
>
> But what does "all machines" mean in a no-TCG build? The original intent
> of the patch was that only 'virt' should be present and therefore the
> only one tested.

It means "every machine the user can create". If the
machine can't run then either we shouldn't compile it
in, or else we should be compiling in enough extra stuff
to allow it to work.

-- PMM
