Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp635395lff;
        Wed, 16 Jun 2021 12:20:15 -0700 (PDT)
X-Received: by 2002:aa7:cac9:: with SMTP id l9mr1510296edt.373.1623871215528;
        Wed, 16 Jun 2021 12:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623871215; cv=none;
        d=google.com; s=arc-20160816;
        b=cTFm1c9HlSaKxwjXjQwjLeWMlu93ZcZcBbz4kQ/9Hym7d3uHDXsp1fh+bMLhwqcxPW
         ZpoPVi2kDdZqwb7mqHdC8zo+bNm+GUYoIHGH1tr9B387hRk7k1rA/jLgqlfIFDIpqUxH
         vp21fu5H342zt/fg03Az8TEIbyGftYZa64+xsLjs5mnW6OW27FvxJKznOWQPBF7ILCBo
         irD318w31Af60go3fuSDa5AMTLrs/dLoq5cHTUnvu/CCz12+EoykMT3h4hPNoQD5ZLiP
         3s1LxPnymb9ZJLqSLfBbWLykCq8cYngXCXA7JauWj1sOJky4FrP4nWaMAoyhvgdgVaNU
         hT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pX5gL407y/AbP5Q9O0yMSPRFA0LA88Hz1+noJ2ARdvQ=;
        b=HCHhL78LJNQY+oSLbyvIuI3z4RUno0QBFnKCPBwO2vY2S4DK5h7fOW9SovpaMtERG2
         drHBsriNGMSGz9hBpO5iECnKHM/XrHvd3BenXTVs6YVkMI7HHhSRq2epDlksw8rjAGKm
         anJtcEZZMTpKzpDj7l9zkTPHMeECZD+5lWMBI9azqZU2uo09umedAodfJEz1CFhJC5t3
         5CMvyxVAQl1SBGlSbSkY1vbz5s7bv/eQl78D6A7os2MCiyPEaYtG2QNKOsfpToA5yrX5
         wvQaYeKYSLd7t1pDkUoyFFubDuAVngIoFCqO+6+5fO9I3+v2EFz1IDnzL2czy/xjeinb
         6D1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iGyPF/LE";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id be13sor3254985edb.6.2021.06.16.12.20.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Jun 2021 12:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iGyPF/LE";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pX5gL407y/AbP5Q9O0yMSPRFA0LA88Hz1+noJ2ARdvQ=;
        b=iGyPF/LEPQccB+TJCKoZpk0sUaE+n7/3dQgvOnwLsPc6JLyhjzW7DHI1krvS7H19vy
         nrp50TOQlNAH70jSzkSnlAd5qHuYebqSSDt3KmPoMnnUOlHUrTqzWBxk/kfC3DfGclJd
         v45baqoPPMIBWLoQfzpnCAe6p2ujkmReGlwQPA8/u0dqRiNwBnyWxe7kG0AnAru4FFw+
         /97Aqpuv+Pyg+rPtGBA3oxqfRYoFe6j/84hUqzgnBPe50zVRm99KNOH0qn8z3sMABSEt
         DhHJozo9hgcCWN91XqI6Q/AJWbo0lcvoOzuDF27vcVMLQCZVyF/JdDdOl8vigvaa9ruz
         ha3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pX5gL407y/AbP5Q9O0yMSPRFA0LA88Hz1+noJ2ARdvQ=;
        b=EFUGehiO7eqZfmG/WVFNyQaVRj+wjRX5VmLNWxGI3M6xo7ZIqnP2p9H5bvNKLQBMWz
         qaGZDRVtJ3vl6m8Qfmw6PCxHXj2weAi/02yLXcZ1n5jMBr6VUvU9ahfMRhnJJ54NR4v8
         Y3Kjp9I3aV/MWoI/v+imoC/d6achOV9bxdaYR4QPXPNfZdKe/ZcrLrwMaQBPCjFfEqru
         xMmbYDsSvnX/x7thH57ZDh8dVrJzTn1hStLDODHTww+P/z4r96epXw5ubsTyhNKaoUO0
         iHiYIb8VXxWkhk/5CVRRlk7fVM9XMRAvVd6bN9t9JjoSAWZuT7+Slk+XgtfwGYX/oIsd
         /ZiA==
X-Gm-Message-State: AOAM531oZl9PdRLxb4A5RWIpbvd993ksGgKzCjM5WKZwJEvIhqj4Zghq
	BQFOoFp8OeujtYdqdl6ma+n2H4u7YBmiY98gNffQp8NEtff2EkoT
X-Google-Smtp-Source: ABdhPJzLCHMqtf8JqtW+wlMsg8vVdisgVEQa0/okTwJ4i6hG45ijNupJMBmtfZ03TdNcxwzCySg1D5U6xlWqSU8eG7k=
X-Received: by 2002:a05:6402:220d:: with SMTP id cq13mr1607405edb.52.1623871215203;
 Wed, 16 Jun 2021 12:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210615160652.29485-1-peter.maydell@linaro.org> <878s3bgkgg.fsf@linaro.org>
In-Reply-To: <878s3bgkgg.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Jun 2021 20:19:40 +0100
Message-ID: <CAFEAcA_c0J4S6MwME3gLuMifht71v6g38gz4f3Bywf4rpmOoJg@mail.gmail.com>
Subject: Re: [PATCH] docs/system/arm: Document which architecture extensions
 we emulate
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: a84LTtnotWLu

On Tue, 15 Jun 2021 at 17:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > These days the Arm architecture has a wide range of fine-grained
> > optional extra architectural features. We implement quite a lot
> > of these but by no means all of them. Document what we do implement,
> > so that users can find out without having to dig through back-issues
> > of our Changelog on the wiki.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > The FEAT_ lists are in the order the features are listed in
> > the Arm ARM; alternatively we could alphabetize them?
>
> Maybe a slight preference for alphabetical order. And crossed fingers
> the ARM ARM doesn't change it's names again ;-)

Yeah, I guess alpha-order is better: that way we have a
reasonable chance at being consistent or at least fixing
our mistakes when we add new entries to the list.

Also, I just realized I missed
- The Scalable Vector Extension v2 (SVE2)

off the list...

-- PMM
