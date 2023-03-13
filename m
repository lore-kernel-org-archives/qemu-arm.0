Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp153099ejb;
        Mon, 13 Mar 2023 04:22:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4d8a:b0:233:d181:5b75 with SMTP id oj10-20020a17090b4d8a00b00233d1815b75mr34433956pjb.31.1678706552156;
        Mon, 13 Mar 2023 04:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678706552; cv=none;
        d=google.com; s=arc-20160816;
        b=y1EDOatElHPbWQhaMS69/4Uglmq0W3lza6aQDNFrYPZ5/fBHW0LOgwhY1q852h8F/l
         S/zqQ3YfHMS1zhT35fqjWxPDU7A1oN9ptnNXpKoO7hsSsh2yKPxAcnJOqEseT5PZClLS
         E/BboJNfBZ9Era8cADWt0zd1CYrMoUPGTk+6347AmrAGIfIwviPpu2YPfsHaY45obG3q
         2wJl/rL7zyyPRMHidsbQ+LgTBfKugXXez8iv/1/rruHFNd5bdyZn+rF4XD4a+c2UrW6D
         yfMn21Ba8GOoYtyppa3+rnFr/+LwG2OhKehqW0KMB6p1hvwZIl61+L0UZxJW/6SNk/dh
         VlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Jjp0IPjDVjgkZ8bmvKpZIv0/9hsebzJcUCPvBP48yQ=;
        b=GcCL7OJLaFtWEpYIEHhag1s+O+3eTUtLuK8ctwKcYJxmK1NyWhS8sQuKFswSMDGCyn
         lrGhs+xxbzdQy8VL50+ech4G3fhVGaSAtn4jIaXBqXlpTTfZPT97PJ4+f97MVR7x1mAu
         0u+WLr6wPBkS1m3L3oDmXJcyIZ/8BeQOxa2scVG6OrTjk3YRVbodX99u0+4ORW+neG+H
         yq+Fom9XD6HmVvJ+waKaDWdoo6hs3p6bezXzIhPBwQOH985lcIx36cAKq4tRG2J4qevy
         CJPTeL7zhq0wagM0qkrZz3f/RiUDPsFR8uotqCHxXSfcH50Fd1GHnZRORbOpthT+sKGK
         4U0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AMYDPaSj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x24-20020a17090aca1800b0023b3a78aef1sor1663370pjt.29.2023.03.13.04.22.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Mar 2023 04:22:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AMYDPaSj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678706551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jjp0IPjDVjgkZ8bmvKpZIv0/9hsebzJcUCPvBP48yQ=;
        b=AMYDPaSjO1y7vsQs9thCPMwWmmNap9e/HKQiPeVnKN7HD0n17Dj+mRwUca4pzqmTsn
         OibzLZQJ/LTPjoI+rSeKhI2myVuv+CxghYJvNCK3r9gNQrDPrI6qFvwk9EBwqXXKBP71
         4QunV9KdboQ3LfBkVD+LcysKBUEQVvY5lrjeAa8BLYPTp8+43xO/z1bCVNUs79rIAtdw
         FBV4mTE+p+P+loUk0CvuN0SdboxkgyLTt5OlRCaCWJx1nRlp9lUbfTg/1TffFCIegw06
         gY41+4ulT0vOcFwl6psUs7Af2crQpGSHEX4k4+YpxKFwWl1ti2j+IT0JTlW3yRAFlKGy
         Zx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678706551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jjp0IPjDVjgkZ8bmvKpZIv0/9hsebzJcUCPvBP48yQ=;
        b=Z5lSEub1maVH+DErSB0tWGJNK0wTZLM6LV1ayWvn5ILZzNFJ2DUKzyhOjhIT14dWR8
         efLU0l0UYwqaGDp6zhGFCIAb6Kb+6KCQm9ey2WV8qSvwiTsF3E7tqxHH3KGdlqqp+eno
         2wPu97u7RUlCOT3BRlBfqNeFXpVKbLWtWrjWBG9qucgNgf+p8uBjpcO8Ccs2N/CZT2sF
         et9h9b5CxQZdW3e2eMI8wmjnfmvBlTzvJLMSzgN+lYSx3SMr4btfgBOLbUiODAZCJinh
         R9PpheGCnpq2NjrqvNVXuCbpC4t53hco2Nf9rsNibThoAzouP5RJcITXwjQSDQG9Ak6r
         vOsg==
X-Gm-Message-State: AO0yUKX2FYmYOeXW3OxguHdNcYVhqVIUBTuvGdYMdNpetc+5HrD++dQx
	a6k9/k1luQO4ITOXN9dYPuxYtpSSel7Gjtu0ghtD9fLnUqcmkGmG7zI=
X-Google-Smtp-Source: AK7set/68yCaI9xux4n/yisEv3YmWfA8kifJI6mmxM/y5Y+d/JTxDSR77mEmBGnxMJqDzra5DCVbwDfKw2iKdfS9rXI=
X-Received: by 2002:a17:90b:23d2:b0:23d:20c:2065 with SMTP id
 md18-20020a17090b23d200b0023d020c2065mr1135077pjb.1.1678706551656; Mon, 13
 Mar 2023 04:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org> <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de> <87sfeclb8o.fsf@linaro.org>
In-Reply-To: <87sfeclb8o.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 11:22:20 +0000
Message-ID: <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, gdb <gdb@gnu.org>, 
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>, Omair Javaid <omair.javaid@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: KjH7IbwWxjd6

On Fri, 10 Mar 2023 at 18:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> (adding some more gdb types to CC)
>
> Fabiano Rosas <farosas@suse.de> writes:
>
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> >> On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >>>
> >>> You need a very new gdb to be able to run with pauth support otherwis=
e
> >>> your likely to hit asserts and aborts. Disable pauth for now until we
> >>> can properly probe support in gdb.
> >>>
> >>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>
> >> If it makes gdb fall over, then shouldn't we be disabling
> >> the pauth gdbstub stuff entirely ? Otherwise even if our
> >> tests are fine our users will not be...
> >>
> >
> > Have you seem my message on IRC about changing the feature name in the
> > XML? I think the issue is that we're putting the .xml in a "namespace"
> > where GDB expects to only find stuff which it has code to
> > support. Changing from "org.gnu.gdb.aarch64.pauth" to
> > "org.qemu.aarch64.pauth" made it stop crashing and I can read the
> > registers just fine.
>
> That would work, although I would prefer to probe support so we can use
> the official namespace.

I don't think there's a way to probe for this problem. I spoke
to Luis about this, and apparently it's a bug in how gdb handles
the pauth XML description (fixed in gdb commit 1ba3a3222039eb25).
A gdb without any pauth support at all will be fine; a gdb with
the bug will report that it has pauth support but will crash
if you feed it the whole set of XML that QEMU has; a gdb
with the bug fixed will also report pauth support but won't crash.
(The bug only manifests if the full XML includes registers that GDB
doesn't care about, like the system registers; if the stub sends
only registers GDB knows about then it won't crash.)

Luis and I came up with two options:

(1) leave QEMU outputting the pauth xml as-is, and tell people
whose gdb 12 crashes that they should upgrade to a newer gdb

(2) make QEMU output the pauth info under a different XML namespace,
and tell people who need backtraces when pauth is enabled
that they should upgrade to a newer gdb

Neither of these feel great, but on balance I guess 2 is better?

Luis: I think that rather than doing (2) with a QEMU namespace,
we should define a gdb namespace for this. That makes it clear
that this is still a gdb-upstream-sanctioned way of exposing
the pauth registers.

thanks
-- PMM
