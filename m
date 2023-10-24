Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2156590ejb;
        Tue, 24 Oct 2023 09:08:30 -0700 (PDT)
X-Received: by 2002:a7b:c4d8:0:b0:408:36bb:5b0c with SMTP id g24-20020a7bc4d8000000b0040836bb5b0cmr14343157wmk.7.1698163709894;
        Tue, 24 Oct 2023 09:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698163709; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlN3Brn57CkEs8NtNjCv4+NHFnDAKT4UDU2mSwU0bPKxCkD/4EW19lRgQNhTNNXUoC
         2889hw+AiSrVcawCMT08Nezt96Mgm325BHWQ0wS7flCMme28OLetXn0Ufj/BoUWKlkZd
         ASXnF8qfaj7ulqlJQnxQMDFAm4WFlonhLtFfeymJCjqblSZFqF4K1F5J0l8qN8dDI5i5
         t948i/GGy0hd3riY2A9nz/lcRxOm4TCK4+PelfkEKjxWDE6Uzg2oAGv2UId8BAM7FmAn
         GGsgdtUdvc1+kPg4LrPQD/7yvOwlyoaZQbAxN1IinbMUkHnZeiN4KRczOHa3QtLUasDD
         uRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2js/JElsVO5jqQBxYFXdXpYOV6Y8lfDs5qXzeoDvbwI=;
        fh=etmI74VRozCvp6mjBPkAWoXKZ4sHzXeFSGKzkJfBlWs=;
        b=z/BQFxfNyyNQ5G5DO9QCehCvto2iMVSXq/0fMTf1z3A5X+0RrrUD6Bta1EMyUd4dxd
         VggY5tZkZpzvUhOQpDnb9NfT8uj2V/lVfGbGu/y16h3fJA/EzK6zzm9glmTpTcUPVda8
         b/gr8sTP2FPocyNU3rfrXvKnqSZzMasCM9PY25qr6m20VZDKP2mIdSjSBXbW4TES1LYv
         fjfXaKb5VdWhw1Xrg3cEslgVbCUFBOKCiJmoZ/txk198GCbH62mFdQPwjYqBPh++OjGB
         sdFoJ5lzZmd3z520n65iO1gzZiRgX/uOJYbrfRuOWeSuadj0G5nHcUSra854XX7C6jqt
         mzZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PffZnPs0;
       spf=pass (google.com: domain of titusr@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=titusr@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <titusr@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a1-20020a05600c068100b00406497fbe40sor3350554wmn.6.2023.10.24.09.08.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 24 Oct 2023 09:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of titusr@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PffZnPs0;
       spf=pass (google.com: domain of titusr@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=titusr@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698163709; x=1698768509; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2js/JElsVO5jqQBxYFXdXpYOV6Y8lfDs5qXzeoDvbwI=;
        b=PffZnPs0PWGNzRXb5T9RKu4228iog9UssqpYD420XLoWu5r8hGBLOEQbK6a92G1Hgo
         rAd7V1Q8zpjI+sJhO9t3mh3HnE+Yh6asYHXfGMy7shhJGajhiKtj99UFf5KiuHloX4yL
         02p2zJWqqKYxtW61r0iO2+xCLCPPabwLHXI2DEhlDJ0WWGDXAU6vZuqnXmi9v1zndNZ1
         XcvUHp5C0Js6c6l2/2yRTIl5CI0qLncysevcyI2UUEFzZTMuwug6CjPIZy6awDqShr3J
         3pH+6XmpytPOfjY0UVXtXr2QRfSryz/mXBPcEWdQ7zYQ9YLN5oIeWk77c8m7GxrtAWxB
         IrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698163709; x=1698768509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2js/JElsVO5jqQBxYFXdXpYOV6Y8lfDs5qXzeoDvbwI=;
        b=e4L8mXVDLtfCW84LR0fjQwEHSEUVFIm2CUSBgDTCFMey94aIczAHPKUekzqxjS1hbR
         P72hb8eIAteMeHLAJ49fy/hzG+8g7J6TZFDSKHnjFdx8L6ZuD51ZFqDjD/9AleqF4z+m
         PuOQfqcdsKhhCTdt8sp46GBN5eQzLxSIZlCrc/9NMRV+rXnDO/MXD1e5/V+BhlYdaIFv
         gVHmwLpfs5KWIJsM9r0ac8d385Gnr48FL8d0+XF9/KgFR8B6t4u2iIq3BmYG5DyoPvb7
         n39fSK5HL3Sf+jZ8jpfoIg3dZBQPNDkLus7isRXqE2z6z675YrTeLZnurBbl035WKyZQ
         L+yw==
X-Gm-Message-State: AOJu0YwNqDxPCX3w7VT/A8kyzpkzkM9mCAQXu8nq/Xum0ZYlzPT+LgpJ
	fY/HNlHvW1h/xK1V7UbtsbJf9Qe/5JCCnS+PTYQGxQ==
X-Google-Smtp-Source: AGHT+IHr3/fMnYeVgYpbgVZ03va1SGLHbEZjqitQ8LxLIvVfS5u+EuHKVLZ+bYuwqpWxvutXMRnPZ3FVygh9/3mlw1Q=
X-Received: by 2002:a5d:46c9:0:b0:32d:de87:1085 with SMTP id
 g9-20020a5d46c9000000b0032dde871085mr14561900wrs.10.1698163709291; Tue, 24
 Oct 2023 09:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231023180837.91785-1-titusr@google.com> <874jih40a3.fsf@linaro.org>
 <CAMvPwGpXZxyoX1WNypgNCW+Uj+bcVPn99vF71Myx7jn_c2Fjdg@mail.gmail.com>
 <87zg082twp.fsf@linaro.org> <c87866ad-568b-1917-7617-c63b137a196a@linaro.org>
In-Reply-To: <c87866ad-568b-1917-7617-c63b137a196a@linaro.org>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 24 Oct 2023 09:07:52 -0700
Message-ID: <CAMvPwGpyE0BVKJVEo+bZsQz99W_O61fW4TzEwm7A6bCd0bsJ0g@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] PMBus fixes and new functions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	minyard@acm.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: dv7sag7I6p8G

On Tue, 24 Oct 2023 at 04:50, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 24/10/23 12:06, Alex Benn=C3=A9e wrote:
>
> > A pull request is really just a GPG signed tag that you push to a repo.
> > You can use the existing git tooling to create the cover letter for it.
> >
> > I've included my exact steps at the end of the email but really it come=
s
> > down to:
> >
> >    git tag --sign your-pr-tag
> >    git push your-pr-tag
> >    git format-patch <series details>
> >    git request-pull origin/master your_repo_details your-pr-tag
> >
> > and finally
> >
> >    git send-email
> >
> > My personal exact steps are integrated with my editor but are:
>
>
> > 8 Preparing a QEMU Pull Request
> > =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
>
> > 9 And send the pull request
> > =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90
>
> For these steps I just do:
>
> $ git publish -b origin/master \
>      --pull-request --sign-pull --keyid=3D0xMYKEY
>
> which uses .gitpublish from commit 08bb160e02,
> calling get_maintainer.pl for each patch.
>
> Using GSuite, I also have in ~/.gitconfig:
>
> [sendemail]
>      smtpServer =3D smtp.gmail.com
>      smtpBatchSize =3D 1
>      smtpReloginDelay =3D 3

Thanks all, I'll do some dry runs to walk through these approaches.

-Titus
