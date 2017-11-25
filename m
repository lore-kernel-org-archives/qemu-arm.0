Received: by 10.223.159.82 with SMTP id f18csp3430843wrg;
        Sat, 25 Nov 2017 08:43:56 -0800 (PST)
X-Google-Smtp-Source: AGs4zMardUOt3Zi6R42Chp1/lVRBWZ8RVrqSNJJho1+NddMIv7TRqtV7oJi8+GEyaidadK8LxHJw
X-Received: by 10.37.124.193 with SMTP id x184mr18063912ybc.219.1511628236730;
        Sat, 25 Nov 2017 08:43:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511628236; cv=none;
        d=google.com; s=arc-20160816;
        b=OkfFFC9DbiiZIZiN8ow2qUkdWfeK7h5kluTe81LPvCSNUV/gjPXNVFuc0jJqrRxjIF
         vSVWa+tVHo7EfITT+1wcxlikuC9tBdCjqgWDNpaq8LxDVcHPuKZnhXSuEkiFMhb5iHR8
         9aNOXKV8ELVs9FA6sj8WCN3f1lJ3JoiuSyw+HVD7oROP4zI3mrKW7nEjYtiQsnkuAjII
         huu4vECm6ZHoScZjYU/hJvZR+0G6B8g7n9fWhLbz2PMzrEKTPkAnWBWrKyjWuqh8+lYv
         D/WosviiM2GkDtd/j5I5sHkPh7+OIXfslwKuzUiAH0b0F7U/e9wpC2BDRkYA3cXHEwvT
         wmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UVo95x9qJC0FYvjOYazWc1OTkkXN/UNoI8yVxHcfWf8=;
        b=h0eHG6024ShXLpqlvxnhVVrjacBrpM4T7oXGMFDv4wapOUzxV1UksIaKPGe0DzNedI
         3b4iDPvyrssjAGrEXHi6jCYWacVQsPiBZRPP7Ivzpk0SZ4Oau6u8rL+8K6sc8H6Nj+3Y
         YLik80jMecAuPb7ed7LKO4LSvdaIq+e3AUxQ6s9asejYy+qUuyBAs6reqh02DWPzfZRG
         1Y0FVqQqxx6Cv5m2C0hZIuQQTGnPaqCMoOAkCxePJ9pUX+ZrNKSbcPqdDf/CvuxlJmJN
         RocXdLFTwkmfk43NqXXYCX+7GOpel4+Yn3Kqmkjnh4Wxk5vOGGT+gIYHZ/YBrrLgu6Uq
         uEZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rtDCdUfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h21si3903474ywa.500.2017.11.25.08.43.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Nov 2017 08:43:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rtDCdUfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIdYa-0002uT-5K
	for alex.bennee@linaro.org; Sat, 25 Nov 2017 11:43:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1eIdYK-0002sT-St
	for qemu-arm@nongnu.org; Sat, 25 Nov 2017 11:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1eIdYJ-0000w5-Nw
	for qemu-arm@nongnu.org; Sat, 25 Nov 2017 11:43:40 -0500
Received: from mail-pl0-x236.google.com ([2607:f8b0:400e:c01::236]:36746)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1eIdYG-0000v6-M4; Sat, 25 Nov 2017 11:43:36 -0500
Received: by mail-pl0-x236.google.com with SMTP id b12so6022298plm.3;
	Sat, 25 Nov 2017 08:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UVo95x9qJC0FYvjOYazWc1OTkkXN/UNoI8yVxHcfWf8=;
	b=rtDCdUfxeEK/OvUzz8muwWVakO1Afpc/84lNLlMzNCErkOMzdushxfKSDchQ/jEHcR
	p826cAKOvXt8QTUZOKvF2GaV//QlWVLOMInUXfdS1tjfIVhYb/X33lszB/iv+pKy/aNv
	8mA/TSZQOlsSNvdlE8oYhWKqIDCf7pSzbvk7ZengrNp0CMykdpsASlrfKKGpuu8UIKDK
	agMLW4QvR4tfK/lgoY15Buwh7nMt2mBvoy+tl/CHsZAYdSVZxlTwIThjy/56M0O6XBJd
	rtttBEYyxO7QHaMOJFNnQXutIk9DH7vomgu4WyyD/6a3ZO7ifCTlMcbR3zbtWhPfXczn
	rAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UVo95x9qJC0FYvjOYazWc1OTkkXN/UNoI8yVxHcfWf8=;
	b=Kwo7p/oS6FA5/6r0Pma8bCXdodjpCpTej2171XSX/jRQWu+rGKBDhhi4Bbg1JHX79x
	Nh+0n6wSBfwzy23pnWBNUJA/NAHOpyFoNjZ+gNiVAaeFDIjbnKYs/UXCS/e9RbXRa1Gc
	mOMuShb3wva9OGcSIGiuelTwYPAkwwEzUWYoAdmRpu6N98dXZ96ycBVuB4lPI+6666dc
	KpbvlKT/pmNoEIkw9dnJnrTYNNgRrRW1WJBjmYpx9iDdaUfxFuFj2uTYf3V7wTIEmVrm
	IBamF8amevAFCEM6APJ7BxOuApbpZXHPKaE6kcL9PCSe0htR4UgRpZu5Hviv6Ryg7xKD
	SgfQ==
X-Gm-Message-State: AJaThX4JOTe6a1RwOeot8YuDkRG3tL7TUYrcDS7veKRaNmJPjlTTrGHi
	pGqMgsbJz651AHVoj3x+BtJ8BwPovpMonuI3IlY=
X-Received: by 10.159.255.74 with SMTP id u10mr9199181pls.116.1511628215136;
	Sat, 25 Nov 2017 08:43:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.204 with HTTP; Sat, 25 Nov 2017 08:43:34 -0800 (PST)
In-Reply-To: <CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
From: bzt bzt <bztemail@gmail.com>
Date: Sat, 25 Nov 2017 17:43:34 +0100
Message-ID: <CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: multipart/alternative; boundary="94eb2c1eebd0cbb68b055ed15e4d"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] BCM2837 and machine raspi3
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oxR/CQnwBaIE

--94eb2c1eebd0cbb68b055ed15e4d
Content-Type: text/plain; charset="UTF-8"

Dear Andrew,

A month passed, and the maintainers didn't gave a damn about raspi3 support
in qemu. Any ideas?

On Wed, Oct 25, 2017 at 10:52 AM, bzt bzt <bztemail@gmail.com> wrote:

> Hi Andrew!
>
> On Tue, Oct 24, 2017 at 6:44 PM, Andrew Baumann <
> Andrew.Baumann@microsoft.com> wrote:
> [...]
>
>> I see. The address space size sounds like it would affect the SoC
>> (although is there really 40 bits of usable physical address space beyond
>> the core?). If it's like pi2, however, the wifi and BT are both behind USB,
>> so that would be handled more naturally in the board model (raspi.c) than
>> the SoC.
>>
> [...]
>
>>
>> Right, but as I wrote above if those devices are behind USB that's not
>> part of the SoC model, and belongs in the board logic. If "more registers"
>> just refers to the CPU, then that's irrelevant. If there are really more
>> devices / device registers on the system bus, then that calls for a deeper
>> change in the SoC model and perhaps a new implementation.
>>
>
> True, but even if it's behind USB, somehow the USB system should know
> which one to emulate. Originally for clear code I was thinking along the
> line of
> if( TYPE(soc) == TYPE_BCM2836 ) {
> ...
> }
> if( TYPE(soc) == TYPE_BCM2837 ) {
> ...
> }
> when the two are not separated and shares common code. But we are not
> there yet, let's focus on one step at a time :-)
>
> [...]
>
>> I'm more open to the need for evolution in the machine init logic
>> (raspi.c), so splitting there makes more sense to me than in bcm2836/7.
>>
>> I see you just posted another patch. FWIW, this isn't quite what I was
>> proposing -- rather than have bcm2736.c take a version number that is 2 or
>> 3, I would just pass it the CPU model to instantiate. But at this point I
>> think it's best waiting for one of the Qemu maintainers to chime in and see
>> what they prefer.
>>
>
> Again you are right. But I saw Alistair's patch
> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg04153.html When
> it makes through, the bcm2836.c could simply use mc->default_cpu_type and
> would be no need for anything else in BCM2836State, neither a version nor a
> CPU model.
>
> Okay, for now let's see what the maintainers prefer!
>
> Cheers,
> bzt
>
>
>> Andrew
>>
>
>

--94eb2c1eebd0cbb68b055ed15e4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear Andrew,<br><br></div>A month passed, and the mai=
ntainers didn&#39;t gave a damn about raspi3 support in qemu. Any ideas?<br=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Oc=
t 25, 2017 at 10:52 AM, bzt bzt <span dir=3D"ltr">&lt;<a href=3D"mailto:bzt=
email@gmail.com" target=3D"_blank">bztemail@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Andrew!<br><div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Oct 24, 2017 =
at 6:44 PM, Andrew Baumann <span dir=3D"ltr">&lt;<a href=3D"mailto:Andrew.B=
aumann@microsoft.com" target=3D"_blank">Andrew.Baumann@microsoft.com</a>&gt=
;</span> wrote:<br><div>[...] <br></div><span class=3D""><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">I see. The address space size sounds like =
it would affect the SoC (although is there really 40 bits of usable physica=
l address space beyond the core?). If it&#39;s like pi2, however, the wifi =
and BT are both behind USB, so that would be handled more naturally in the =
board model (raspi.c) than the SoC.<br></blockquote></span><div>[...]<br></=
div><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"m_430725915788442554gmail-"><br>
</span>Right, but as I wrote above if those devices are behind USB that&#39=
;s not part of the SoC model, and belongs in the board logic. If &quot;more=
 registers&quot; just refers to the CPU, then that&#39;s irrelevant. If the=
re are really more devices / device registers on the system bus, then that =
calls for a deeper change in the SoC model and perhaps a new implementation=
.<br></blockquote></span><div><div><br>True, but even if it&#39;s behind US=
B, somehow the USB system should=20
know which one to emulate. Originally for clear code I was thinking along t=
he line of<br></div><div>if( TYPE(soc) =3D=3D TYPE_BCM2836 ) {<br>...<br>}<=
br></div><div>if( TYPE(soc) =3D=3D TYPE_BCM2837 ) {<br>...<br>} <br></div>w=
hen the two are not separated and shares common code. But we are not there =
yet, let&#39;s focus on one step at a time :-) <span class=3D"m_43072591578=
8442554gmail-"><br><br>[...]<br></span><span class=3D"m_430725915788442554g=
mail-"></span></div><span class=3D""><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><span class=3D"m_430725915788442554gmail-">
</span>I&#39;m more open to the need for evolution in the machine init logi=
c (raspi.c), so splitting there makes more sense to me than in bcm2836/7.<b=
r>
<br>
I see you just posted another patch. FWIW, this isn&#39;t quite what I was =
proposing -- rather than have bcm2736.c take a version number that is 2 or =
3, I would just pass it the CPU model to instantiate. But at this point I t=
hink it&#39;s best waiting for one of the Qemu maintainers to chime in and =
see what they prefer.<br></blockquote><div><br></div></span><div>Again you =
are right. But I saw Alistair&#39;s patch <a href=3D"https://lists.gnu.org/=
archive/html/qemu-devel/2017-10/msg04153.html" target=3D"_blank">https://li=
sts.gnu.org/archive/<wbr>html/qemu-devel/2017-10/<wbr>msg04153.html</a> Whe=
n it makes through, the bcm2836.c could simply use mc-&gt;default_cpu_type =
and would be no need for anything else in BCM2836State, neither a version n=
or a CPU model.<br><br></div><div>Okay, for now let&#39;s see what the main=
tainers prefer!<br><br></div><div>Cheers,<br></div><div>bzt<br></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"m_430725915788442554gmail-HOEnZb"><font color=3D"#888888"><b=
r>
Andrew<br>
</font></span></blockquote></div><br></div></div></div>
</blockquote></div><br></div>

--94eb2c1eebd0cbb68b055ed15e4d--
