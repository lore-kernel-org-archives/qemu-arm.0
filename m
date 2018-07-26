Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp173448wru;
        Thu, 26 Jul 2018 02:46:24 -0700 (PDT)
X-Received: by 2002:a6b:3d7:: with SMTP id e84-v6mr897369ioi.297.1532598384060;
        Thu, 26 Jul 2018 02:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532598384; cv=none;
        d=google.com; s=arc-20160816;
        b=KA7TsvoEXVSVDWZuvtZozlLO2Ju9VewMI4KyKP8J8xA4opBpdL+X4bgT61e7Pw2BAg
         AVKFk35jmbqQjuuw7PzglyboRUuxy88I2QIXX8+NCKUcMMbADe1qyyQQROzfXOquF7X9
         1l1gj9EcNTTbX+5HfWO0wcNdMxbNIYD5JCM0l52GVahlgVQMqKVsjNIPLdQA7Q0oeP7b
         CoxxJS3WJoD5Mg7zl9hPtgeTi0bWeIE1qwELvD2ZX5dvopVT76J8Ms3YsLz8EG1b09OQ
         VG95Nl0VsVSMfNT3w4Cz3BQ/e5hRnmfrwgWJEbuwLbVOSq5lzx/KEt7kybVLN/Bqfhme
         fcmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=siVq0WJ/jV/tly/qBfzqPiBFc/Ddos5+ZxM9EKyXi44=;
        b=B196BuvVwh9N3m86kFqh4ljz+bsGYrqFM/SCKjFvH9IR5HdHpHxZ/KtGkt608eCkv+
         tXRAoDbspyRdqXfCLaxPsMXAM1BX6KZ2MZLMR+C6jxN2sjtQc3y/h6nF6MgEeRkbKpOW
         55J2QqaIu6P7HdXDFSNni03xddyX34OvsxmoAruPzJD88aazA94+uFfB89RmEyMUlZDn
         h3a1qeKz4Q5/YFPzRPOA6ZHIYLUd0ibcJuTK7fcHejZuCpAT4/sv0AVQGVxHdC5+CRoJ
         UPiiLvBaYyRPFjZmQn6hZ8OE/tdSy8UV/7oODkn7q5VUMPV7dm9V+RTFpCjMBCghdgnx
         mN+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CXftFSH3;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 129-v6sor517299itw.75.2018.07.26.02.46.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 02:46:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CXftFSH3;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=siVq0WJ/jV/tly/qBfzqPiBFc/Ddos5+ZxM9EKyXi44=;
        b=CXftFSH37hLUXCyHW9sbvpUhMjcqwF4oSeZkEWX394YyZciadDUnzILc16PkfXdmZh
         YsdvQGFTnFjIBn08jEiDQ6dAi5mVSxhx4NxfGks2WqAvBGu61f/FY68TgB0gWLFCflKr
         7+4yj1pC0KyRJniMyose5XLrOuiPLbs4DWe9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=siVq0WJ/jV/tly/qBfzqPiBFc/Ddos5+ZxM9EKyXi44=;
        b=r2ov99gzreCvUBFihwAgtIHZWfXp0PWMtODMQU6cOkKBWqXCekJ73n5w5iHFfmxjOo
         VY575LgMOuoplC6xYArlbZjnNx2lSbRzyJ7OnPGogKXYrVRSvrPm6MhRpC6HJZI8X3px
         Xdqjks+LO3/mLpQRT0gS/+LObelXur3SGjiQ+hIWL+TYjalQIpM57iW94+DO2yYq92iX
         nry70BIy62w+PM9aHvWk51DVBHSEKWh20UwqKTXAgpTCRS7XY77xFoiFVj5QpdbRqhy5
         TMfe3ld5vY3z+3AsUcN/wIr4zpe4s+VB7W70vJ4KZSVNlIKFcY4vXBiKmMxyWdJ190Hc
         V3NA==
X-Gm-Message-State: AOUpUlFWmOG9V/6f43dyQdzotlEc7R9fKC9noi0fZCxSqJYyl69glTj6
	yG7JpZxrTCCz2MbKHPr4Xh4XbEZgzOuSvxECjAT0wPz1
X-Google-Smtp-Source: AAOMgpeUJU9cyIaUXBXGRPF/YX/gaEYTGsv+0KPtu/MKce3N++hlegTUvllDugtI/wML1CYOs1TKPaQv+cLkyos3NO4=
X-Received: by 2002:a24:cc07:: with SMTP id x7-v6mr1237159itf.3.1532598383687;
 Thu, 26 Jul 2018 02:46:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 02:46:23
 -0700 (PDT)
In-Reply-To: <20180725140824.vnkejw5emkxwktaz@kamzik.brq.redhat.com>
References: <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com> <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
 <20180725124700.GF12855@redhat.com> <20180725125944.5nd5ydm4x4e3vvjw@kamzik.brq.redhat.com>
 <CAKv+Gu-pbJj59wH7wgZ6Uq+Uko9wYEBqSF=WaC3LL68CFkbxEw@mail.gmail.com>
 <20180725133810.gsgfu4x6emygu5o5@kamzik.brq.redhat.com> <CAKv+Gu_91nXP4TSvrLf0e8kfX5X3ZNPcmx5UzT1jf5A_rVj8pQ@mail.gmail.com>
 <20180725140824.vnkejw5emkxwktaz@kamzik.brq.redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 26 Jul 2018 17:46:23 +0800
Message-ID: <CAHmQWvDY6hb7-a2X8e7CbJ=vhHKni1RUwSH4C7quccGTOZxm+w@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: UeTALo+zIf6M

On 25 July 2018 at 22:08, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Jul 25, 2018 at 03:46:01PM +0200, Ard Biesheuvel wrote:
>> On 25 July 2018 at 15:38, Andrew Jones <drjones@redhat.com> wrote:
>> > On Wed, Jul 25, 2018 at 03:03:40PM +0200, Ard Biesheuvel wrote:
>> >> On 25 July 2018 at 14:59, Andrew Jones <drjones@redhat.com> wrote:
>> >> > On Wed, Jul 25, 2018 at 01:47:00PM +0100, Daniel P. Berrang=C3=A9 w=
rote:
>> >> >> Would iut make any sense to call the machine  "refplatform"  or "r=
efboard"
>> >> >> to indicate it is a generic reference platform, not specifically f=
ollowing
>> >> >> any particular real impl, albeit influence by the sbsa spec.
>> >> >>
>> >> >
>> >> > That would indeed stop me from whining about a machine model with a=
n
>> >> > 'sbsa' name not strictly implementing a minimal SBSA machine :-)
>> >> >
>> >>
>> >> I still don't get why only a minimal machine is worth considering,
>> >> given that a real-world minimal SBSA machine is not capable of doing
>> >> anything useful.
>> >
>> > One definition of an SBSA machine can be quite different than another.
>> > If we only hard code the required [useless] base, but also provide a
>> > readconfig for the rest, then we get a useful machine without loss of
>> > flexibility.
>> >
>> > That flexibility comes at the cost of platform-bus code (since we need
>> > to add devices to the system bus) and a less concise command line. The
>> > platform-bus code may indeed be too expensive for this purpose, but
>> > we may need to see patches to be sure. I understand the desire to have
>> > a shorter command line, but this is QEMU :)
>> >
>>
>> My concern is not the QEMU side. It is the code that we will need to
>> add to UEFI and ARM-TF to deal with the dynamic nature of the
>> underlying platform. That code has no counterpart in real world
>> hardware, but will surely turn up in production firmware nonetheless
>> if we end up having to add that to our SBSA reference codebase.
>
> It sounds like there's already some sort of informal SBSA reference
> instance specification that UEFI and ARM-TF intend to support. If
> that instance specification were slightly more formal, i.e. documented
> somewhere and given a more descriptive name (not just 'sbsa'), then
> I think it would be a lot more palatable to hard code those specification=
s
> directly into a QEMU machine model of the same name.
>
Root cause is requirement. This platform and virt serve different use cases=
.

As to command line and readconfig, my opinion is they are suitable for
change slightly some base/typical platforms, not for change one to
another with big difference, otherwise we can even reduce some
platforms in qemu I guess.

> Thanks,
> drew
