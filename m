Received: by 10.223.161.27 with SMTP id o27csp1447869wro;
        Wed, 25 Oct 2017 01:52:35 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Sw3Bg3093Wa36ancUDwb0uA+lhjF4kdeB9PU2C9n98CRAGhPbetkIWYJDh1zBv1dGrOULG
X-Received: by 10.129.51.74 with SMTP id z71mr4254868ywz.169.1508921555262;
        Wed, 25 Oct 2017 01:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508921555; cv=none;
        d=google.com; s=arc-20160816;
        b=IepAycu2puWXNW7TGpToLF2ZePL/anb8QPtWo4aVz/KE5dqlXoLiJ+NV1fWrvT7gT4
         rR9PRumQ3eEBiFr7I79qL7bybW/qMli+RM/HZP5MMSpPqaC6IrapJB3Mj8FFt+E4ncLf
         ONfNRG9ZXUEB2lQcRvy3fyxmOitgjz9JFYbzkCdmIvXslnZMDHxnLxXRE65p4cfFE7aP
         Xngpiti/e3D8kdzjE2tCqcnHcl8y7TXwmCa0uuGhY6Kl0kN5u/kyVtvSd/dlqrVM9Itv
         QwCvA7ppzkmpHzALPfJjdXsZayjkgJ7PNw/6PRSgIn6n+9mvW6s0PW9gCAujV9IebFWg
         FKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=oxBrcLT9k61H8k8NNQEjHrTf+4iR8hpFmSzwP4hNBAc=;
        b=fZRRZWhHj/XsrE05+Q/LeKv/GFda1zRS+TPZa2qBGiFGn9qimsmvc7wLBGReW96xFQ
         yGEEW2s0T6ARzjwDOczLEHAM5sBnLDe0eo5AFZFPxDp2eI6Yw7C3YbVITEggWYzumvMU
         cLOpoMx5qk88N5D7RZTU8cs1nUpY4Alba+fOx09dN9SIbnRg5hpWEAsvuObFLz7dewRc
         IWyZ/Jxfw5XEc2KcGSUy25BgIrika2nyHnQ/r0wbkP4OG/KRlALsL/yOPrEbzTNlQ39q
         X+DlzeKNG8Jetv7SHBV2n7SfRTg7oPIhZ/qllQYAPlagC/GF9dQPDAyu/GzvijbmFejz
         4VMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pms7hzYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si343378ybm.622.2017.10.25.01.52.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Oct 2017 01:52:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pms7hzYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7HQQ-0001js-Jw
	for alex.bennee@linaro.org; Wed, 25 Oct 2017 04:52:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1e7HQB-0001im-G3
	for qemu-arm@nongnu.org; Wed, 25 Oct 2017 04:52:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1e7HQ9-0008Lm-FT
	for qemu-arm@nongnu.org; Wed, 25 Oct 2017 04:52:18 -0400
Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b]:54056)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1e7HQ6-0008Ij-3h; Wed, 25 Oct 2017 04:52:14 -0400
Received: by mail-pf0-x22b.google.com with SMTP id t188so21739662pfd.10;
	Wed, 25 Oct 2017 01:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oxBrcLT9k61H8k8NNQEjHrTf+4iR8hpFmSzwP4hNBAc=;
	b=pms7hzYfbTTrxWMo5glmeAAy52sfrZ9K3q8XicauabMLTGGbzLKkbzSZBs3/SQqF4a
	6eE0Chp2v+knXeTNvhnwJHSbTWw6dYhX81+q5iSrMXhdRJv62ciZ+aCrLYyiaO2/zlQE
	w0hyVIkwEVw24QORGCCxfNPMr3FuA9PiSZRab9RQgYtbf9bls/4nqUU5fIsr8SV86Rnn
	2dDy4pPtWJ8bJtv7i983aM5gFO+r5waOPeoSxcDHcrIeZWRwxf1aoatT5Jnsr+ICk9+c
	GTOIT/HYhlKcV2BHG5HhZH2Ndgd8wF6hluOIwmjeKcan6x9goKWJkWIB3NoF+jAZ1E8y
	6UAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oxBrcLT9k61H8k8NNQEjHrTf+4iR8hpFmSzwP4hNBAc=;
	b=d+uFvSlgTxaur0GVIWZWxtjTjciCbwxKw5eMwosIjguquvbvMyak4LGGHyki1WONYL
	kQorrbUoU+BlTypY626cm6tWcSoL7JbyZhQ8hZroreFkAJTx93TMlbh1Sq+ejqxbeI4J
	hzkJnTYBRaTZjnBHiOVDw4Dvtdb1lbEz0xvu1JoD/pbJiHu3rB6JlBVuS1QKb/HxcH0B
	szYMPmnwRND4U7/rOSpSi3WGoX48/BvyButZ2NKunCrEqAwsMUDEg//QD8rQxu+/iFFt
	pfxvQ684sHg8HcSFYbo86nBrkErmyzn8QOpgEZwvqKignloFfDg05Ye8fp+5Rfd3lKt+
	QELA==
X-Gm-Message-State: AMCzsaUqGHJPQVpPDOadCXhULCzMDIF7EwdtBJA+GkXKekhGwgOHDoh+
	55JozFVwIuDvLJDRnXsjgJN7NhB4Zbrr2C0qGWWJ8gn7
X-Received: by 10.98.32.206 with SMTP id m75mr1531008pfj.231.1508921533004;
	Wed, 25 Oct 2017 01:52:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.155.102 with HTTP; Wed, 25 Oct 2017 01:52:12 -0700 (PDT)
In-Reply-To: <MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
From: bzt bzt <bztemail@gmail.com>
Date: Wed, 25 Oct 2017 10:52:12 +0200
Message-ID: <CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: multipart/alternative; boundary="001a114768e6f800d9055c5b2b83"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22b
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
X-TUID: 3BMQZiD3upRk

--001a114768e6f800d9055c5b2b83
Content-Type: text/plain; charset="UTF-8"

Hi Andrew!

On Tue, Oct 24, 2017 at 6:44 PM, Andrew Baumann <
Andrew.Baumann@microsoft.com> wrote:
[...]

> I see. The address space size sounds like it would affect the SoC
> (although is there really 40 bits of usable physical address space beyond
> the core?). If it's like pi2, however, the wifi and BT are both behind USB,
> so that would be handled more naturally in the board model (raspi.c) than
> the SoC.
>
[...]

>
> Right, but as I wrote above if those devices are behind USB that's not
> part of the SoC model, and belongs in the board logic. If "more registers"
> just refers to the CPU, then that's irrelevant. If there are really more
> devices / device registers on the system bus, then that calls for a deeper
> change in the SoC model and perhaps a new implementation.
>

True, but even if it's behind USB, somehow the USB system should know which
one to emulate. Originally for clear code I was thinking along the line of
if( TYPE(soc) == TYPE_BCM2836 ) {
...
}
if( TYPE(soc) == TYPE_BCM2837 ) {
...
}
when the two are not separated and shares common code. But we are not there
yet, let's focus on one step at a time :-)

[...]

> I'm more open to the need for evolution in the machine init logic
> (raspi.c), so splitting there makes more sense to me than in bcm2836/7.
>
> I see you just posted another patch. FWIW, this isn't quite what I was
> proposing -- rather than have bcm2736.c take a version number that is 2 or
> 3, I would just pass it the CPU model to instantiate. But at this point I
> think it's best waiting for one of the Qemu maintainers to chime in and see
> what they prefer.
>

Again you are right. But I saw Alistair's patch
https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg04153.html When it
makes through, the bcm2836.c could simply use mc->default_cpu_type and
would be no need for anything else in BCM2836State, neither a version nor a
CPU model.

Okay, for now let's see what the maintainers prefer!

Cheers,
bzt


> Andrew
>

--001a114768e6f800d9055c5b2b83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrew!<br><div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Tue, Oct 24, 2017 at 6:44 PM, Andrew Baumann <span di=
r=3D"ltr">&lt;<a href=3D"mailto:Andrew.Baumann@microsoft.com" target=3D"_bl=
ank">Andrew.Baumann@microsoft.com</a>&gt;</span> wrote:<br><div>[...] <br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">I see. The address s=
pace size sounds like it would affect the SoC (although is there really 40 =
bits of usable physical address space beyond the core?). If it&#39;s like p=
i2, however, the wifi and BT are both behind USB, so that would be handled =
more naturally in the board model (raspi.c) than the SoC.<br></blockquote><=
div>[...]<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail-"><br>
</span>Right, but as I wrote above if those devices are behind USB that&#39=
;s not part of the SoC model, and belongs in the board logic. If &quot;more=
 registers&quot; just refers to the CPU, then that&#39;s irrelevant. If the=
re are really more devices / device registers on the system bus, then that =
calls for a deeper change in the SoC model and perhaps a new implementation=
.<br></blockquote><div><div><br>True, but even if it&#39;s behind USB, some=
how the USB system should=20
know which one to emulate. Originally for clear code I was thinking along t=
he line of<br></div><div>if( TYPE(soc) =3D=3D TYPE_BCM2836 ) {<br>...<br>}<=
br></div><div>if( TYPE(soc) =3D=3D TYPE_BCM2837 ) {<br>...<br>} <br></div>w=
hen the two are not separated and shares common code. But we are not there =
yet, let&#39;s focus on one step at a time :-) <span class=3D"gmail-"><br><=
br>[...]<br></span><span class=3D"gmail-"></span></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><span class=3D"gmail-">
</span>I&#39;m more open to the need for evolution in the machine init logi=
c (raspi.c), so splitting there makes more sense to me than in bcm2836/7.<b=
r>
<br>
I see you just posted another patch. FWIW, this isn&#39;t quite what I was =
proposing -- rather than have bcm2736.c take a version number that is 2 or =
3, I would just pass it the CPU model to instantiate. But at this point I t=
hink it&#39;s best waiting for one of the Qemu maintainers to chime in and =
see what they prefer.<br></blockquote><div><br></div><div>Again you are rig=
ht. But I saw Alistair&#39;s patch <a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2017-10/msg04153.html">https://lists.gnu.org/archive/html/=
qemu-devel/2017-10/msg04153.html</a> When it makes through, the bcm2836.c c=
ould simply use mc-&gt;default_cpu_type and would be no need for anything e=
lse in BCM2836State, neither a version nor a CPU model.<br><br></div><div>O=
kay, for now let&#39;s see what the maintainers prefer!<br><br></div><div>C=
heers,<br></div><div>bzt<br></div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
Andrew<br>
</font></span></blockquote></div><br></div></div></div>

--001a114768e6f800d9055c5b2b83--
