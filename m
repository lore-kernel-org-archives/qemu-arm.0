Received: by 10.223.159.82 with SMTP id f18csp2772301wrg;
        Tue, 28 Nov 2017 03:26:58 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbHX/cvC1KsGcoSCfQxqUVNOz0UluwHDNj60Awxfav53FE3zw2FTIvRu8gOihoRF4DdcUki
X-Received: by 10.37.66.75 with SMTP id p72mr27666791yba.63.1511868418694;
        Tue, 28 Nov 2017 03:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511868418; cv=none;
        d=google.com; s=arc-20160816;
        b=bm3gyxcz8HECbRIvCF0/8NVdau44bVOsYYlDXxNV4QEbYbDnjyN4weYPuV38Vqco96
         vA4VQQOVKCwImjENpX1g6uHI85GfT5TbyaVnjCjzcsGiES9sLZACBoHxihqxhYdYTQ8m
         50+8UHpg5GCYBOJLZfJ4gk4snCKfDGvv0CMpCu/5bwqjyJ9m18ZIpegbRCbooYC3EHs4
         WVcIdte0UkHo2/bRBJlogbSoobcVi5PLtwuXcVlkMg90zV8aNKT7TaOIKRoIkR1FY5UM
         sm105aq1JLattWHBe9riChv7i9pMiloJxW2u8YxfyPbC8PVqChqGo62xtZ/SHc8tTGjc
         vy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=HeW/prKNbQ/HHg0CNjslxKEymSsRG0ljm/jmQmjlY6Q=;
        b=m/cImxrnxon/J9J0/1GAwkqUIysX1grrvaOPj/IDzF7PTgeC1IPX6KCwuFI7mDdcJ/
         E5/85lgt+9drLI3PgAPakqWO+5hEQ672nvz4C/fvJhSVdSOz8PLeMbpVFHvt2bE3lX63
         KXz24d+cI1PRJRZbG35rWATiF/Y9i4qFuq4V13NvCeUWcX8iWCf+5H9w163+a9QM7Oe4
         ltRvxR0Sdy4wz9R/09KIy+JZ8gC/kS5by18iEJLoHJYqn5Lq/VgzX2rvq7ji1YC+l4rN
         kzD9X3mvFJhSmnK7Rr8saMnG0xYXzJQXtBlpYlj5VGRiEcf6E9Xf6C1GSJA7rztOMpbe
         C99g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sqzRk3/u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a204si6674888yba.429.2017.11.28.03.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 03:26:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sqzRk3/u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJe2U-0003f0-53
	for alex.bennee@linaro.org; Tue, 28 Nov 2017 06:26:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1eJe2I-0003co-H1
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 06:26:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1eJe2H-00060F-9g
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 06:26:46 -0500
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231]:44619)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1eJe2E-0005uj-HC; Tue, 28 Nov 2017 06:26:42 -0500
Received: by mail-pf0-x231.google.com with SMTP id r14so12296837pfl.11;
	Tue, 28 Nov 2017 03:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HeW/prKNbQ/HHg0CNjslxKEymSsRG0ljm/jmQmjlY6Q=;
	b=sqzRk3/uSe0sem7EKGKqhCq8RTHqGCPY/jH5WjS9/qd0My7QUnmnsuQ0jzcyBAzlkK
	eqi5O5hWWP9qJ0X31h/j0eQC93SnBRqrfO0N8WLoutOuIVho9B/Bd4GNgJxMiSS7X4xN
	++TGyH1L6pN/fosWevuowXxQ1qo0OHeV5SYiiOV/3umGNE1Rk3hGieYCRXClNDGfYevm
	BRCfJbinsCX9V5YaMWE+fBPPK1A3WginxmuvQYVIcjRnGQJM/TAflXBzf15JgZW8jlmm
	6R+c59M9cxBKi7dqENTNmfR3ZrznYCqiKzL6507od3Hnli8bIE/UnM96xoRNjhcoohml
	6sFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HeW/prKNbQ/HHg0CNjslxKEymSsRG0ljm/jmQmjlY6Q=;
	b=PkMacximqIqsfIrSjpkkTybbBH9hMQc32bt8VoC31FzaoGyF9K+G1rekMLg1tRfY6w
	BOfg92pEFR8ewT3kd59seGkFtPPx6PbgyN5A4xTxfRXArRfBCX+39ZUXjK0beKfQHKpj
	6mOxbrc5F1feOzmlPg9HKp+/IJA4qbrHChqAlTRmoF9MTVDiT4Ith7jxBQC/Pv/uR1mh
	OQP1zBlC6FHgMcBJw9xl1btRZ2MSZSxpMFVMmqD7yJNWjaWUGNsiV0yYbS/ExyplPIdN
	6C2pdWGDC4GMY77Uxc4Fx/OI/xpo27gnVXKHkpdfB+THOIJMqQEmxF3yC1rnpo0g1N2C
	EfBA==
X-Gm-Message-State: AJaThX6uOb5ZtBy0LLPZo75PF13Hvb2AvNx26+AaxGLVh/2xmnKbsAuX
	x0Qd9srKfLP2EO/7unpd7au+DJn50VUFIdrBAUk=
X-Received: by 10.98.181.25 with SMTP id y25mr9172637pfe.206.1511868401345;
	Tue, 28 Nov 2017 03:26:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.204 with HTTP; Tue, 28 Nov 2017 03:26:40 -0800 (PST)
In-Reply-To: <MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
	<MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
From: bzt bzt <bztemail@gmail.com>
Date: Tue, 28 Nov 2017 12:26:40 +0100
Message-ID: <CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: multipart/alternative; boundary="f403043bf7640268fa055f094b8a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::231
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
X-TUID: 95J2bfMYFfPn

--f403043bf7640268fa055f094b8a
Content-Type: text/plain; charset="UTF-8"

Hi Andrew!

[...]

>
> In that case, IIRC my high-level suggestion was to either parameterise
> bcm2836 to take a CPU model string, or else move the CPU creation out of
> bcm2836.c into the board file. From what I've understood thus far about
> pi3, it does not seem necessary to have a separate bcm2837 implementation.
> I suspect at that point the patch would be small enough that it didn't
> require further splitting.
>

Yes, I agree. I've provided a parameterised version on Oct 24, which does
not have a separate bcm2837 implementation. Is that patch ok? Or should I
wait for Alistair's patch (
https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg04153.html)?
I would prefer the latter, if I may, and I'm willing to rewrite raspi3
support using the CPU model string in mc->default_cpu_type introduced by
that patch. (Although I have a question. I'm not sure what's the preferred
way to get MachineClass* object in bcm2836. Use a MachineState* cast on
it's Object* argument with MACHINE_GET_CLASS() or should I use the
parameterless qdev_get_machine() instead?)


> > PS: if you send a new patch, send it as a new top level
> > thread -- if you send it as a reply/followup to the
> > first patch it's liable to not be noticed.
>
> Please also CC me on the new patch as I am not very reliable at monitoring
> qemu-devel.
>

Noted :-) Thank you for your help! I'm sure qemu users appreciate it very
much!

bzt


>
> Thanks!
> Andrew
>

--f403043bf7640268fa055f094b8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrew!<br><div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">[...]<span class=3D"gmail-"></span><br><span class=3D"gm=
ail-"></span><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><span class=
=3D"gmail-">
<br>
</span>In that case, IIRC my high-level suggestion was to either parameteri=
se bcm2836 to take a CPU model string, or else move the CPU creation out of=
 bcm2836.c into the board file. From what I&#39;ve understood thus far abou=
t pi3, it does not seem necessary to have a separate bcm2837 implementation=
. I suspect at that point the patch would be small enough that it didn&#39;=
t require further splitting.<br></blockquote><div><br></div><div>Yes, I agr=
ee. I&#39;ve provided a parameterised version on Oct 24, which does not hav=
e a separate bcm2837 implementation. Is that patch ok? Or should I wait for=
 Alistair&#39;s patch (<a href=3D"https://lists.gnu.org/archive/html/qemu-d=
evel/2017-10/msg04153.html">https://lists.gnu.org/archive/html/qemu-devel/2=
017-10/msg04153.html</a>)?<br>I would prefer the latter, if I may, and I&#3=
9;m willing to rewrite raspi3 support using the CPU model string in mc-&gt;=
default_cpu_type introduced by that patch. (Although I have a question. I&#=
39;m not sure what&#39;s the preferred way to get MachineClass* object in b=
cm2836. Use a MachineState* cast on it&#39;s Object* argument with MACHINE_=
GET_CLASS() or should I use the parameterless qdev_get_machine() instead?)<=
br><br></div><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">
<span class=3D"gmail-"><br>
&gt; PS: if you send a new patch, send it as a new top level<br>
&gt; thread -- if you send it as a reply/followup to the<br>
&gt; first patch it&#39;s liable to not be noticed.<br>
<br>
</span>Please also CC me on the new patch as I am not very reliable at moni=
toring qemu-devel.<br></blockquote><div><br></div><div>Noted :-) Thank you =
for your help! I&#39;m sure qemu users appreciate it very much!<br><br></di=
v><div>bzt<br>=C2=A0<br></div><blockquote style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_qu=
ote">
<br>
Thanks!<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">Andrew<br>
</font></span></blockquote></div><br></div></div></div>

--f403043bf7640268fa055f094b8a--
