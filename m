Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp429884dlb;
        Wed, 7 Aug 2024 09:36:16 -0700 (PDT)
X-Received: by 2002:adf:e34d:0:b0:36b:3563:15f4 with SMTP id ffacd0b85a97d-36bbc1c7bafmr16890276f8f.56.1723048576501;
        Wed, 07 Aug 2024 09:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723048576; cv=none;
        d=google.com; s=arc-20160816;
        b=hYNA9eC7c16tVsYoh8LLMSeWnazixCknEJWr7AjxYpS6qUdE3nT8r4Qa5QNTV1tsJS
         G16D2djiGcV6gh0CVZhRcQynHkuzOYbhoaozA9f08jSQKpiHYD0uz87lHeBHU7b3+hd7
         JznP3Cb+ki9SKWa5ddQUhDS4DstJlHHWT9N+3a3fnn8XmB3k0PoBHiROCNvdn+dp+Dzn
         8b0czL5um6y3Vlcp9rBezH65FaWmttbLkeWSY6lvIt8wUI00Mm+B5Af61208Ql4C6URU
         i41CgGG1+W9d9P3N2qJFeUH3BOhusR97cKMkVEWQw2ZCObFmY4bYiHITZWXpyujQ/rru
         7nNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mJ8LCe1+plhUUu6H9V2WEWLNxi6HPNP2OFWpG7Ub0sI=;
        fh=goWflzWmXHsIMkUCGDaLrnAJicgv0wRyoa9BOwnKobg=;
        b=iegiiw9GYjqTecJ2KoKAnagxADkL+4Bjkuk3WWtDbdqNonl4+jwGiTicRNv4/a/Skb
         kxjpgqiRnkVeokS6b+78CO+rgbrXElVOiQUDek1BENgR+kV7kg4J7QXQb624p+DIusK4
         1SfiEyTdSa1iU/QFVjQbeX3t2ArK8xwCK2WLt3XgZE8E35kh1JnuLuo/xUthJiIYon2G
         YFqFLjF1CwK8EJcOkIiV3kp294M3QhlFALA0abyOzCbGNdFHRwPZ0qYjzRBOk7V+YpcY
         jmQvL548y96859EP3YrZmbH9Y3ut7gjLkMZri3CU9p1o2LBUPJrgMC/FT1zQZIhS/BQB
         mvAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="O6/AdfB3";
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <tavip@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36bbd01ff6esor4327295f8f.1.2024.08.07.09.36.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Aug 2024 09:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="O6/AdfB3";
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723048576; x=1723653376; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ8LCe1+plhUUu6H9V2WEWLNxi6HPNP2OFWpG7Ub0sI=;
        b=O6/AdfB3u9jKrDkALCN4zhF/kZ/H0dY0Bnr96SmIl1LvJl5Tosznv6a6YJjmAPsBzY
         7aise4T8CKPqdo8hhh6HrBaVpLCYnh5FrXKPyXBJhrTfOa3cw5sr4VC386fYz8KsVBVw
         H7NFTMXkixBOWMq0GE4PBpw7ptycXFZFyBMPyeIym6M/+HwCAwF5EdiIrJlMUQR+mHmT
         TiOubejghdNyUq8BZWLpFT0BUaoNuyoQoapFWtTAxQMossZjlAAK+G0MeBxvxC459s/1
         W/IqiONghtiTH/dJX/zMyuPJRvNJrnuZaldLfRsE+cRCrPZzK1LdkGp+7DDR3Ic7VmTl
         sFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723048576; x=1723653376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJ8LCe1+plhUUu6H9V2WEWLNxi6HPNP2OFWpG7Ub0sI=;
        b=WDXdEZJ0ajOENa5doOSR/TyDb7Rh4Sx5o5K05NX/8k65vpXrOtJIphHpf8AhOlCkut
         cOEZg6NZA9oy2XNTgpUOqYlWt61jNm04jL6T7Gl3xRyQ2OQHXwZo6JcDbvV1CS2uASZg
         k5emTF5Ga3O7JF3EX+KteWNAe7qJVoKi1tZimk1YQVhz3D6K/O0Jxo+bHr+K5h6FZf9h
         MVh6UdtNXafXXVkFcSZ71C18YnlNoVogmLg6W+HuFnZWLGLrH/6AmI3NYigjhW9oxCiq
         TEWL1AIKCgt3fBJ63a0D5wW9EkNW/1GzWbniRXevARTBeip8gW0GJheR3S1Ov1WuGznh
         0mng==
X-Gm-Message-State: AOJu0YzWxvhmgG3irhH1V4GPFgJsEoVmImkL6MZ4l5X75wrYC4S6qJgq
	mFIGm8dumnrFkxLtYw595ww+BPqnINpk1petnbHU84wlYB81KjKqgVwIFhgIWp7twzHjxgAjlTg
	N8DXoIn+fuoIzblmPMkrivYSoNXsFX2aC0uEN
X-Google-Smtp-Source: AGHT+IErbkqXI8kkxAfYk+pkz/huGNKrg2+PkMX8HACm6/0OFr7t63CpGY6378rTDyo9Vjg/cL5HEWR7efHDXz4Tub0=
X-Received: by 2002:a5d:6945:0:b0:360:75b1:77fb with SMTP id
 ffacd0b85a97d-36bbc0e0c33mr14663912f8f.8.1723048575568; Wed, 07 Aug 2024
 09:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-5-tavip@google.com>
 <87sevhrbjm.fsf@draig.linaro.org> <CAGWr4cTPqtzEvbd5s7xfMOzid90Gje6NSTGw1qR7r=Ao0xeAcw@mail.gmail.com>
 <ea6d7058-1460-49f2-967f-666650de1cce@linaro.org>
In-Reply-To: <ea6d7058-1460-49f2-967f-666650de1cce@linaro.org>
From: Octavian Purdila <tavip@google.com>
Date: Wed, 7 Aug 2024 09:36:04 -0700
Message-ID: <CAGWr4cSUG4Yh=ynrO8A7KNiDo2RRRnc75PNMiboZOK+ts8X4Sg@mail.gmail.com>
Subject: Re: [RFC PATCH 04/23] hw/arm: add SVD file for NXP i.MX RT595
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, jsnow@redhat.com, 
	crosa@redhat.com, bleal@redhat.com, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: GZdcJdv72pzi

On Wed, Aug 7, 2024 at 4:24=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> On 6/8/24 22:31, Octavian Purdila wrote:
> > On Tue, Aug 6, 2024 at 7:06=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@li=
naro.org> wrote:
> >>
> >> Octavian Purdila <tavip@google.com> writes:
> >>
> >>> Picked from:
> >>>
> >>> https://github.com/nxp-mcuxpresso/mcux-soc-svd/blob/main/MIMXRT595S/M=
IMXRT595S_cm33.xml
> >>>
> >>> NOTE: the file is truncated to keep the email size reasonable. Please
> >>> use the link above and download the full file if you want to try out
> >>> the patch.
> >>>
> >>> Signed-off-by: Octavian Purdila <tavip@google.com>
> >>> ---
> >>>   hw/arm/svd/MIMXRT595S_cm33.xml | 224052
> >>> ++++++++++++++++++++++++++++++
> >>
> >> I guess one thing we need to decide is if the source XML should live i=
n
> >> the repository as the preferred method of making changes or just the
> >> translations generated by the tool.
> >>
> >
> > I think we might want to store the XML in the qemu repo, even if we
> > don't use it to generate the header files at compile time. This avoids
> > issues with the original XML moving, going away, changed in
> > incompatible ways, etc.
>
> Until now we tracked external sources with git submodules or meson
> wrap files (see commit 2019cabfee) forked into our GitLab namespace
> (https://gitlab.com/qemu-project/) at a particular commit, so if
> the external project is modified, we aren't disturbed, or have to
> adapt our source to update the submodule. Isn't it good enough?
>

Yes, this should definitely work. Thanks for pointing out the wrap
files, I'll give it a try.

> >
> > As for generating the headers at compile time, I don't have a strong
> > preference. I like it because there is slightly less work to do and it
> > avoids dealing with resolving changes on both the SVD and the
> > generated headers. For example, the initial headers are committed,
> > then some changes are done directly to the headers and then we want to
> > pick up a new SVD from the vendor to support a new hardware revision.
> >
> > There are disadvantages as well: pysvd dependency for building qemu,
> > hard to review if the vendor dumps a new version with lots of changes
> > and we want to update to it for a new hardware revision, slight
> > increase in build time.
> >
> >>>   1 file changed, 224052 insertions(+)
> >>>   create mode 100644 hw/arm/svd/MIMXRT595S_cm33.xml
> >>>
> >>> diff --git a/hw/arm/svd/MIMXRT595S_cm33.xml b/hw/arm/svd/MIMXRT595S_c=
m33.xml
> >>> new file mode 100644
> >>> index 0000000000..8943aa3555
> >>> --- /dev/null
> >>> +++ b/hw/arm/svd/MIMXRT595S_cm33.xml
> >>> @@ -0,0 +1,1725 @@
> >>> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> >>> +<device schemaVersion=3D"1.3" xmlns:xs=3D"http://www.w3.org/2001/XML=
Schema-instance" xs:noNamespaceSchemaLocation=3D"CMSIS-SVD.xsd">
> >>> +  <vendor>nxp.com</vendor>
> >>> +  <name>MIMXRT595S_cm33</name>
> >>> +  <version>1.0</version>
> >>> +  <description>MIMXRT595SFAWC,MIMXRT595SFFOC</description>
> >>> +  <licenseText>
> >>> +Copyright 2016-2023 NXP
> >>> +SPDX-License-Identifier: BSD-3-Clause
> >>> +  </licenseText>
> >>
> >> This certainly seems compatible. XML is not the medium I personally
> >> would have chosen as a register specification language but I guess the=
re
> >> are no other alternatives?
> >>
> >
> > I agree that the choice of XML is unfortunate but I am not aware of
> > alternatives, this is what vendors will provide.
>
