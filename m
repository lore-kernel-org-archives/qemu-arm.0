Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp489166wru;
        Fri, 27 Jul 2018 02:30:30 -0700 (PDT)
X-Received: by 2002:a24:4112:: with SMTP id x18-v6mr4734213ita.83.1532683830740;
        Fri, 27 Jul 2018 02:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532683830; cv=none;
        d=google.com; s=arc-20160816;
        b=aGSri1E+3Lo5Deac+ZfpxUwNKNCSQdBOAXavLt6WLLC5+dXxnUBE05xoORzjbBfiD9
         NgZBOjHCSwqxjJXrWpsikjpb4CB4RKPAMKtypIpzMrN/blSaIWc6/KJ7ygZUsLZwqyS1
         rCXwJMfZCPY5eYC84tNJur6CEJ78uHTRbMQDKqZfHowgSrJiU7tDqcRaYSd0YonIUpJx
         /MMGidJSoTFNJcjmBfVdQv7OK49nZvtjGMXU2cXPfX/CM+49BwW/u4BgJ+JiOFMFDqCo
         Uaqj65fvI6PE98WawyrhVMBf9uvbHUoDymWmLBopg3yodVM/xct7dncXg7eO9ACm5IZs
         cvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TDtYNChPANJN4ZQvHf3nmKX5xKpoRNxJDBI3bvleyfo=;
        b=HO64p8v05Hp3Iywbuzyh+eD/FdXOBX0tmwJoBflZEAyITetnrcVgQtvp9wjobWLzW7
         rtdl/SNtOJVfNtEIU+6EO/0hBHfTZTFkxbxTMnef7UtBTVGxovs7rM+pdshp2N7uGkwK
         AFU6/7m8upSPyVM1+IYm7sPQ5Sc4DnvVSpgLLdWFeqg1N7v6n+lLSXGb5dyUoDcmcXRY
         T4d7+lIqZls0ic3/1S52OLcP1G8lXCbwLx3B2b+k4uoGkN+Gug9ebyK49N4v9dQ91eie
         r682XyC5qntoow+tBFrAK1NfiJJ2xFXdHeNwDEpE7zuy7xqqbBFu3J5mDdY1Uzg9cuNa
         pBOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X3zN8G/F";
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 127-v6sor1490408itr.145.2018.07.27.02.30.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jul 2018 02:30:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X3zN8G/F";
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TDtYNChPANJN4ZQvHf3nmKX5xKpoRNxJDBI3bvleyfo=;
        b=X3zN8G/Fb6WF99aiWFP3VqRuftZrUSeojcHDD4KvA3pu1HQK354TMFFGNZADpgmLGc
         rO+PbXZ1g/WgTnnBYYNccyvl1EMbTs0jKz3ap1j06+oHRQ5+npdCx3uuW/w1emPw1ZRt
         JMAWZOuxQYnUOlE2KxPyuz/0TdE/D5woGv6TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TDtYNChPANJN4ZQvHf3nmKX5xKpoRNxJDBI3bvleyfo=;
        b=dn2b6zJ/+PFq2Ez2QaWrC7niyCk+h5bfkT6ySp+IMqK2mmndaEOS20D+7gBK0hCstn
         LUiG9ujV1SY8eW43i2BwD63Fv4sA7816CAMFnsrUZxhtFZxObQW+YQEchH9VZKLHhiXC
         528pnEE0GQuQq99W/7Dp0EPqMz1wRHTTb2KjoBp1Bzq222Ubg9+KuYdm02SB/CfcTGNj
         o+GibLzRQngQHhSNVzyqTUg8FBwr15kXdIO7Dl+FRmtFl2ZuUWZFqMI8N6vGLj1z8/Dp
         5wfvNFuRwtWE9LskRQaYjSUdC9vOxsR6o+lFpQOSc6gHrDgNXGwQWFG5syy8xvly1/j7
         0PWw==
X-Gm-Message-State: AOUpUlEz/p9wrFCGziv8TFut40q4vgsoQsyLfVB6l7Fv6Ez2HP9Q6DvB
	A/P1BftjGI9cndE6buMzzKbgrp4PeKPEVcDQlcM/1iCgxCS1Rta7DDM=
X-Google-Smtp-Source: AAOMgpeTo54uFIUZoXf4cdZyzd65el56Y6J0WRZU9c7TXPmQ0/hPJ185obZxtjaGrqUbveAHC0dZOZR6tW+BX8zLqj0=
X-Received: by 2002:a24:cc07:: with SMTP id x7-v6mr4737729itf.3.1532683830397;
 Fri, 27 Jul 2018 02:30:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Fri, 27 Jul 2018 02:30:29
 -0700 (PDT)
In-Reply-To: <20180726124952.GI22369@redhat.com>
References: <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com> <CAHmQWvC44mLchhEFPU0T0gKWVcjjozp95ZumaKK9EkPwpeehTA@mail.gmail.com>
 <20180726104636.aua3pjsqkqnkvggk@kamzik.brq.redhat.com> <CAFEAcA80549kHSO+8z334PYmoWshzz+EHJcPBxsmhBN_dk+0Rw@mail.gmail.com>
 <CAKv+Gu-m0=MmkaR0UGJ4mmYSNHmk9QQh06Wxx6k2wXWq+QF46w@mail.gmail.com>
 <20180726111354.flyqh2yo4xm5z6m7@kamzik.brq.redhat.com> <d0eb219e-b3cb-d006-1857-a399a65376f8@redhat.com>
 <20180726124952.GI22369@redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Fri, 27 Jul 2018 17:30:29 +0800
Message-ID: <CAHmQWvBTU7OynhOPbfwL-zpnGunjt8se=iDE_BUduRZGE=_e2g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, Andrew Jones <drjones@redhat.com>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: wBcOz9WoAJC6

On 26 July 2018 at 20:49, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wro=
te:
> On Thu, Jul 26, 2018 at 02:23:46PM +0200, Laszlo Ersek wrote:
>> On 07/26/18 13:13, Andrew Jones wrote:
>> > On Thu, Jul 26, 2018 at 12:56:22PM +0200, Ard Biesheuvel wrote:
>> >> On 26 July 2018 at 12:52, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>> >>> On 26 July 2018 at 11:46, Andrew Jones <drjones@redhat.com> wrote:
>> >>>> i440fx and q35 are specific machine types. 'sbsa' is a generic mach=
ine
>> >>>> type that conforms to the SBSA specification. If you weren't trying=
 to
>> >>>> memory map AHCI and EHCI controllers, or if memory mapped AHCI and =
EHCI
>> >>>> controllers were mandated in the SBSA spec, then there wouldn't be
>> >>>> anything to discuss. But that's not the case. You're attempting to
>> >>>> hard code one instance of a generic class of SBSA machines, but the=
n
>> >>>> just call it 'sbsa'.
>> >>>
>> >>> Modelling a 'generic SBSA machine' is not the goal here (I'm
>> >>> not sure that's even possible or useful), so let's just
>> >>> stipulate that we'll call the machine type something else
>> >>> and move on ?
>> >>>
>> >>
>> >> Fine with me. Care to suggest a name? :-)
>> >>
>> >
>> > Also fine by me, but I'm not going to suggest the name. I fear the
>> > backlash I'd receive after this mail thread!
>> >
>>
>> I suggest "showcase2018". (Dead serious.)
>
> Further suggestions
>
>    "refplatform"
>    "sbsareference"
>    "sbsademo"
>    "phys"   (physical counterpart to "virt")
>
I like "sbsareference", some people still like the letters "sbsa" in
the name, and the "reference" sounds good too.
the only drawback is the string seems a bit long, I like this format
"sbsa-reference" but it is longer, "sbsa-ref"?

>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
