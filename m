Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3086429wrw;
        Mon, 12 Nov 2018 04:56:27 -0800 (PST)
X-Received: by 2002:a05:6830:1408:: with SMTP id v8mr436903otp.211.1542027387351;
        Mon, 12 Nov 2018 04:56:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542027387; cv=none;
        d=google.com; s=arc-20160816;
        b=a5R9l0rt5kwAZZ0D/xrk2eXkZmB2sBMSiTSzsO5B0XEPT2EyILzAo/emSxyULCZwvd
         J7Y00tu+tBACd7r3NP//GJzBKXH0nJ7NPSA4kWwBuLmEibwNfZnR75UqxmBSXv5SJ2Mo
         K3ld0T85MKG31jkNVlFWm9Eaq0NT4cALsz7k8lMtHPtak5fjwbQqI3jsZ+FTx6Qb4cSn
         CQy1f1V5guWoF5mcIHgwD6Fkoa35P6OKmmqgWv1llar4JxxHfenwvrwtzgBRYllcnU1Z
         fgYha9P32buwirK0vS9TeztzAE6ngziIf/1eWItraj2/+XsQUrsFKMx11LkPlsanqhEl
         Cjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=BK2d7+EAraWJNjStiRfNjQxSIDRp+5PSpWhbNdINyeg=;
        b=OIgOSP3jOQ24xrF3ax8KMmCSDORyAeZZmov9X2R1eF5SRzRtZwu/p18fpoFu8KuObM
         Sb/etdaiGRNcNk8Ln+CPhdKHYzwt3Ia0lrYdRxu1pALRAn7h8mK2W1RH3s8zWb9aA+tP
         r5CvGzXWm9hBmdE8k24ZDigwC1LUtPYvbzD7GCtP7DqCir/daOtZodH/N95oEV5fNx1Q
         bL5kTO2ptDRfbRm/9raE/gk5GqgHdkmZH0VGwa6dT4PkfjTZTsROofiU+/mUjKrzHk5a
         3u4Bm8zmVFS7Jk0rP5r9jmBXS0zDvCZBzWAwZAUWC94ZsgYhVCPE+vsDDVlIFLLEbmpx
         riww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=En4Tjg54;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f29sor8369840oth.80.2018.11.12.04.56.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 Nov 2018 04:56:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=En4Tjg54;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BK2d7+EAraWJNjStiRfNjQxSIDRp+5PSpWhbNdINyeg=;
        b=En4Tjg54cvu/EezlbxWbn3RRdWCGLdX88g8UovExkhbrsRNFdHzldJK2F2v/E7dFvp
         nczMdEc1zq/S6hU7tyzdlyXb9ZsrKLLYpEZDAtnmstDW4Nmq8cTPGP0QwAsTRYCeM8v1
         g4qSDqDBkYiEZAtfoBqycat5PhnRMtVkY7RzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BK2d7+EAraWJNjStiRfNjQxSIDRp+5PSpWhbNdINyeg=;
        b=LJ0EKqraWzKZTi3sErTbAwQgWSDhSxwF04p9Eyhcoo5Z2UK37OXZz4uAfOw9Wl9e6y
         pgcAab1ZSZptkQlDr9mgarxCQGnQKdoMuPH/GVSBvrsWEjmsl+caGCsJGOUpGn4jS0eI
         4FbbLfGV0fr8gM/z+ryUdbRR2nRfRHqp8ow5XnwkKImB8O1CvKk5JKcbdC3QX8hnZPgF
         HGRRU2VnG2/JD9WVDdxILwU4DRxpvSvcK+qFvvhf35kI5G7/aXKA+OtmmkVd4yAUWeii
         Sk6wjU0vtlhiGqt9+aCEfsDuyGsNG4N1x08WkjRY7TNROyMyYoexfK1lapRtGnmtckwo
         EMKQ==
X-Gm-Message-State: AGRZ1gI9zHBi4BAdWGKDnxx5Rrkxd5ead44pJw3WbCsIgYR+sOoV6oNR
	hlBGSXK0I3rq4kMBtx7IGUAmGrdo0mnja/rL374g2/8rxNmrxw==
X-Google-Smtp-Source: AJdET5ed/ugTYI7Io3uQhhi9pH/BE3aEfMJu7tdh+jJ/+mKCgflkvfe3K8i4+5a0/R5tsm4B7RhPIoEWnqdaLisVYm0=
X-Received: by 2002:a9d:217a:: with SMTP id l55mr455052otd.316.1542027386829;
 Mon, 12 Nov 2018 04:56:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Mon, 12 Nov 2018 04:56:06
 -0800 (PST)
In-Reply-To: <20181109152119.9242-1-alex.bennee@linaro.org>
References: <20181109152119.9242-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Nov 2018 12:56:06 +0000
Message-ID: <CAFEAcA9AEzCseAt8gxx_3jKpi1R=UPS+YGzik_KbcusvhRBXTA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] KVM Guest Debug fixes (plus TCG EL2 debug tweaks)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: tNykLfV7TQV8

On 9 November 2018 at 15:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Hi,
>
> I missed a fix I'd applied locally from v2 so this is a resend with
> some additional tags, some changes suggested by rth and one more fix
> for the test case.
>
> So these are fixes for guest debug when running under KVM. While
> re-spinning these I came across an anomaly which pointed to a kernel bug
> that caused the 1st single-step to fail. This is being discussed at on
> the kvm-arm list:
>
>   Subject: [RFC PATCH] KVM: arm64: don't single-step for non-emulated fau=
lts
>   Date: Wed, 7 Nov 2018 17:10:31 +0000
>   Message-Id: <20181107171031.22573-1-alex.bennee@linaro.org>
>
> It looks like there will be another patch series on its way to address
> this.
>
> As debugging HYP mode code is next to impossible on real hardware I
> tried re-creating the single-step bug under TCG. As a result I ran into
> some debug and EL2 cases that failed. The final two patches are some
> fixes but I'm still seeing some weird behaviour although it is currently
> obscured by timer interrupts constantly firing as I enter the to be
> single-stepped guest EL1 instruction so they can probably be skipped for
> 3.1.
>
> The following patches still need review:
>  0001/target arm64 properly handle DBGVR RESS bits.patch
>  0005/tests guest debug don t use symbol resolution for.patch
>  0007/arm fix aa64_generate_debug_exceptions to work wi.patch

Richard had a review comment on 5, so I'm applying 1-4 and 6-7 to
target-arm.next and will let you respin 5.

thanks
-- PMM
