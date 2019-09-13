Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp770272wrp;
        Fri, 13 Sep 2019 06:48:46 -0700 (PDT)
X-Received: by 2002:a9d:7a95:: with SMTP id l21mr29604922otn.31.1568382526612;
        Fri, 13 Sep 2019 06:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568382526; cv=none;
        d=google.com; s=arc-20160816;
        b=gHXDHphnnCZURVnVI59aPVdkwJU6NWvhLqqAv9oAbYThqfgkmWR8blKrEi1418LLJe
         8kqaQE31raQ7LU0Yo3Zq0KgKZbJ65bqeyYu7uRqKUA+DMz8PjW6KeK5jn1CYenL8YAR6
         ANpJXi7NxWy9m4jov8MV3Xx8ZGeLB3eu8UDIms5sxhGH6opK44sIEPKTMxFapek9cOQ1
         oK810udKffcZl4wQ4R14IV1TxVo1IddCuWSbvPHgJblJwZ5dnoqEECq3Fago/PdfeHSj
         gwZS9XFbpeN7EoP9yrY+6uSf4fxN1NZuc7r2PlxQPpM70IwMcO+Dxb+C/HP2M1Q1QzNu
         VWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iHTQSc+IpmrUdQ6C+Hj5cjmyPorY7fb5j5//5nIq1U=;
        b=zbL+B9Lt6Pt9Bju73W31SzICsD50YWjCggTujtMdzw4uSnUuVuP0RtbA5mRxt/eOM+
         BUC0cK0qw1An9ukWVRsi4IVETyy+YWP5scjjLZwiKe2PU21bvEU0JKd9HIK/NRCssL1s
         tDnHyUe45CgEuzvcqo5cbfzl9xZ7XIk6AzBQ0Etoe92UfE14vCPIRhr0080dK9t1wdkW
         zbZ/+vBgIDbYTm66XVl52T7AO4qIYJyj6Ii6sO+b8dMPiDyXAwi4KzPit2HBOTzvpoDe
         bWhD8bMFp8Gvsm45a+Bs8800lM5wmY5GA/YncO+xGsjYTBYhk/HO4S2yXxH7PmAAZaRy
         ieyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K493QvoR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 61sor6992467oth.102.2019.09.13.06.48.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Sep 2019 06:48:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K493QvoR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6iHTQSc+IpmrUdQ6C+Hj5cjmyPorY7fb5j5//5nIq1U=;
        b=K493QvoRvbQwcrlIEShj2FmR99yLBj80vAT03MGhQkJIDrbEbnqRyp+g0Or7Zrsxvb
         Q/0rNsI/Kz34mcqV/LrpVOTL5MxtiUGf2umIKO1rwDQjFTj7DvaCLK6iUIOI9Pd6rZB4
         7N+FRgWusuPjTJTClhQgX3H0GCUk63PRKsLwy6AFlZjr3HlPEbAF7ETAEddOYR78ddKg
         w+FQPUntTdPdh9wPnCLRVbewngmk8eXjGT6RkCz1ncT3EmgvO0nqak0zW0GLV6k5445Z
         W88DVKoaYb2gMVQBoa+z7HFLWjynPtPcvsU6xZGDkrWodH9fxNjuuZdm/cV4UhR0uEU1
         L3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6iHTQSc+IpmrUdQ6C+Hj5cjmyPorY7fb5j5//5nIq1U=;
        b=G/kfG3cHMujIiC9g08qEiTBWQcAFHzm3ZTD8bsUrbzdpdEYQANkCSY1aQZLTvz4R9+
         1zy862Rb9XFpzz2TJ65vf6HpURj/LlP1Sz6Wj1REw1Vo5JBM6UtLs6NViYh6QPuv2pZD
         QccM+QWzG+P2UeLcvxaqCiW2NkfxN4TNxwOR3tZ5Qj05R0syFaXHJ6RlehTNeYAxN/3/
         P0SVmPGzua6KKVCCsM9+Fq//utRPDjVpfxyLj4qWx7BPSZyZWWokS98i64VZLaws/s1O
         DAsZPm1bcOqrW1fkoH5gyiWyY1gvrwnF0j5bEhAZBXo89/mex7nL3HdSS2kOYqYTkJMU
         T/3Q==
X-Gm-Message-State: APjAAAV88w0tDzwWXvCsy/jZM2OGi4q0fRQeOoKi/lGaeVUvcsytBCq/
	SWXWNaG6t6lXUi4HaEqj1ZtKZKYRXDduLRF61dqGHL2LIMi2xw==
X-Google-Smtp-Source: APXvYqzbfFPcSzDrm2UHoxQ/ujld+qQTgCiO5OwP/+Ns6/lRTcnI1kGwReaSmaO96OV6Kk1c9mkNpY/Z6FKrrn6moZ0=
X-Received: by 2002:a9d:68d6:: with SMTP id i22mr32258894oto.232.1568382526156;
 Fri, 13 Sep 2019 06:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190911164959.11003-1-alex.bennee@linaro.org>
 <20190911164959.11003-3-alex.bennee@linaro.org> <CAFEAcA8NsdpEMOH1MFDta0LUswyqSDHCgtOh6g5k3+EU0FVuHA@mail.gmail.com>
 <875zlwz5o1.fsf@linaro.org> <CAFEAcA-6BmxkFND4nZBFs70nVPEFzSFrE6RMQ1O3ftqozYYoBA@mail.gmail.com>
In-Reply-To: <CAFEAcA-6BmxkFND4nZBFs70nVPEFzSFrE6RMQ1O3ftqozYYoBA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Sep 2019 14:48:34 +0100
Message-ID: <CAFEAcA_21a5mCk8Oh11pyY=0wtqbzTargSjrob21k5TkoXgL1w@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] target/arm: handle M-profile semihosting at
 translate time
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: I65JCC7b/g/7

On Fri, 13 Sep 2019 at 14:31, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Fri, 13 Sep 2019 at 14:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> > > This is still disabling semihosting for the linux-user-mode
> > > build for M-profile, isn't it ?
> >
> > Sure - as rth suggested. But m-profile doesn't run Linux so why would w=
e
> > support it in linux-user?
>
> (a) Linux does support Cortex-M, since it has no-mmu uCLinux style
> support these days
> (b) gcc test case binaries, which tend to get run on linux-user
> even though in theory they're not actually Linux binaries

also I think (c) general principle -- don't change behaviour in what
looks like it's just a refactoring patchset.

thanks
-- PMM
