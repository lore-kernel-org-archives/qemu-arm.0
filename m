Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11567219wrv;
        Fri, 26 Jul 2019 00:37:16 -0700 (PDT)
X-Received: by 2002:a05:6638:517:: with SMTP id i23mr21170418jar.71.1564126636212;
        Fri, 26 Jul 2019 00:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564126636; cv=none;
        d=google.com; s=arc-20160816;
        b=zJXLqua+0McTNPw4GapcmQGOYRXy9Gb/0W+Jd6diNCZUDpSJ+RdAigdUQDVfDjOPve
         KbxPeYY4zwzn8xzqwqeCyMv1gXIWqNt8gq8eLbz6wSLRz3meOsYhPOfpOXBlsfXYBrdT
         uRYmxvyru3PVOuoIdStCEO3PIcTcYIic7EGE8Z8jMtM477v6ZTFGNy9kK4muxt3eI/bS
         r2A2IRE1Qy04dWIAbsUd3teAYYvTU9RId2zxChlpcYcAzKiyrcQ0CW5FeTZ580/IfGoq
         DYZABxRmH6xBYMFmYxOvh23AJ+Z6P0fHkm59qkkJFsYXGJMlT+n5JeQpWSGA/2AW62Rn
         1vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8K0Ad6jbY/ZDFZrzoCMpFV+gdACtgN/1HWWCc6ETVY=;
        b=euQkhfX7e+u+hcnkImv1M88W+Sj2tuhbH9ShIzWl2UZiv2octJQnsd4vaAISfTSx0j
         kBrbh3ax6Xp5pQPynz7/P5mSf42ounfUPBENH5ZPor3+0LwruBx0DObraWCog7PJRrrV
         4t5IgGAWKgBuONrR/Dssm6JiYvrynv5uY/4Hq1GKsp9EcJqIgawyYY6AuG8ed1JD7Qb+
         hFvEQgQxVoKz0KDRWNSvZO0ks2BebMg2ytOlsVqsIFrgTZaf5hfrpfcBIirVjy5rv7Am
         p4ACgUNw5SDVQUCqx0VAvtjtncpuUtVZogwxl3wJCPF/zyoTDioZZMwPjMxr7FCmAwlW
         ixYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bSVFyeFz;
       spf=pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=laurent.desnogues@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <laurent.desnogues@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v12sor36377140iop.32.2019.07.26.00.37.15
        (Google Transport Security);
        Fri, 26 Jul 2019 00:37:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bSVFyeFz;
       spf=pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=laurent.desnogues@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j8K0Ad6jbY/ZDFZrzoCMpFV+gdACtgN/1HWWCc6ETVY=;
        b=bSVFyeFzQYV13GWYYaQpZq4BDCTL1+tx7RO2FE1uu9zKCIPq6azEEo9mCBbP9p5Yaj
         h5DNBxg6CU9t2HouoST309KkCxEStXyEmepSIij7hyT3IwM90wOcaqzH70aIYWPOrHAF
         Ikc5yNfhJt5YcXKhHTPjtTlCtshSuk5lxjqTwooogbcnUYsrDTIncVy1US4Z4n9sgkx/
         +MpLs6NDMJtdm1CF3MijBTfmtTz1WhUhyh6V0nR2uiUCG7iilXfOnXyhMjIcUNav45a2
         a4wruIEz3RNgRrLm93uazeEN6RKNgC68mCSFsZJCp7GsLo4+RDiewNjGpg/PisASMRUi
         rbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j8K0Ad6jbY/ZDFZrzoCMpFV+gdACtgN/1HWWCc6ETVY=;
        b=q7jYXykNX+bBjkz9W56gZGVQLbv0Ju+QLaRb+KMIZwvwDKuM5b1kJsiubPo6OS9O4Z
         /cpXJ46jpoMDXaGq/hufN3xvihPeUWKx/7DtUyoHPrHuba+RN/bYj7rFwbe20PHegoO1
         suyDm+6+n+pmprOlEGmGZtCxbGSmNw6zz3YMfYrMgrriwfHRYIIRHDjd2YP1XIAnL6dd
         57zNgnVP6M1wNlAKAhZMg2o3WRduzu80/jUzeSqThdUqxWJJeRXOgm4K5lyjrOp1p8LY
         ubBEeQIHAKq64ECtlkpqYT5INZA2+yNzfeoHH3BTtOwkkKxoRLSmhhQROsNkqXdxQb8f
         XH1Q==
X-Gm-Message-State: APjAAAXW5qeA8gaK2Aq0F25p6b/S4QERvqDbcbiV64hiCMgeekxQpm0N
	1sZv5dKIV3CaDXfxYL35OXY0nazjkvawlhq9f/azXA==
X-Google-Smtp-Source: APXvYqz/SkKYw/Q4g5ptbO+K6Nh4Xruww9CvBsp4U3opBWQyi+ng59gPpHAIL603zYoUCO6xwFFa8elchpH9AzQJdg0=
X-Received: by 2002:a5d:9752:: with SMTP id c18mr16658845ioo.22.1564126635250;
 Fri, 26 Jul 2019 00:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190723113301.16867-1-alex.bennee@linaro.org>
 <CAFEAcA9CP0cUkDR4qOKVgM1b2U1KNot=A-5OPEAOKu3=KpMyuw@mail.gmail.com> <8736iti7hn.fsf@linaro.org>
In-Reply-To: <8736iti7hn.fsf@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Fri, 26 Jul 2019 09:37:02 +0200
Message-ID: <CABoDooPYw5JccST8f9gVSmtA8ijeqmaVrqoDcqucbbctt5QvyA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH for 4.2] target/arm: generate a custom MIDR
 for -cpu max
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: MhgoBlYR0OZS

On Fri, Jul 26, 2019 at 9:24 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 23 Jul 2019 at 12:33, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
[...]
> >  /*
> >   * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a re=
al
> >   * one and try to apply errata workarounds or use impdef features we
> >   * don't provide.
> >   * An IMPLEMENTER field of 0 means "reserved for software use";
> >   * ARCHITECTURE must be 0xf indicating "v7 or later, check ID register=
s
> >   * to see which features are present";
> >   * the VARIANT, PARTNUM and REVISION fields are all implementation
> >   * defined and we choose to leave them all at zero.
> >   */
> >
> > It's also a bit inconsistent to do an explicit deposit of 0
> > for the IMPLEMENTER field but not for the VARIANT/PARTNUM/REVISION.
> >
> > I wonder if we should put 0x51 (ascii 'Q') in the PARTNUM field;
> > then if somebody really needs to distinguish QEMU from random
> > other software-models they have a way to do it.
>
> Q is reserved for Qualcomm - It would be nice if ARM could assign QEMU a
> code but I suspect that's not part of the business model.

That was my reaction at first too, but that Q is reserved for the
Implementer field, while Peter is proposing to put it in the PartNum
field :-)

Laurent
