Received: by 10.25.190.12 with SMTP id o12csp178163lff;
        Wed, 18 Jan 2017 01:17:15 -0800 (PST)
X-Received: by 10.200.45.5 with SMTP id n5mr1793591qta.174.1484731035752;
        Wed, 18 Jan 2017 01:17:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l126si18656440qkd.76.2017.01.18.01.17.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Jan 2017 01:17:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTmMj-0005lb-6E
	for alex.bennee@linaro.org; Wed, 18 Jan 2017 04:17:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cTmMd-0005kq-2q
	for qemu-arm@nongnu.org; Wed, 18 Jan 2017 04:17:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cTmMc-0005Is-3E
	for qemu-arm@nongnu.org; Wed, 18 Jan 2017 04:17:07 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34482)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cTmMZ-0005Hy-V9; Wed, 18 Jan 2017 04:17:04 -0500
Received: by mail-qk0-x243.google.com with SMTP id e1so939370qkh.1;
	Wed, 18 Jan 2017 01:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9tmI1T6gGaTOicx/z1/pDhsXhGR5AbEeJphS8nQgMbE=;
	b=oTmJOT4Ls2XA2zc04Bp9uoPhlF+vAGScJG6EuLiZkJWX0w+31SPcCcbg9EUt8r2AGt
	pR3xd20giQ4bl07d12/2+Eki8Z6XQEehap0qjNcFP3qVilkWNGU0fe69h97IgvfBaMGL
	m+cS8y5n17xxqT+7R0STaIaqk1X+CNeZNpqIRGzfpwJUfv55Se0WwZJ3p26NeJgSDk7g
	8xvehcoSu67MhtMyswwZwqwdd0j3pNPr8ElIl6VCyYxNr26zSPydmBFfyXqfzyZL8GIk
	VH+fFVyik887f4eVPygxupGsTC1Lm6y81Gbf7Awt8iCbOg5fGhpU1+CPu2B3ma8vGalA
	bLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9tmI1T6gGaTOicx/z1/pDhsXhGR5AbEeJphS8nQgMbE=;
	b=mjPP+EIz31XrHZ3xcOjQqQX2L6FhyERLUyfNLS+Q90WT/ZO2CEKMOWEipBTwaO1jrT
	p4mS5RreMD3djHAC8omznoxz1EfZ8M26/9zedM4QyA+Cx6ovoxIvg/T2pQEXznIT8rqe
	N7eZDKXCLsfNsWKjr9hyxjTGgRUCE9edoLBxrRG0pby2O0hiIFOcZwhrpOFEirWqKAgu
	nEvlTxx39beQt+PqYjuYL0TGGWovmpKc7UgtDLAdVdjtFrZy67K2R/VzVSdK6e70e3bQ
	LJRCBeu2DOu7rFNLQekxWWxN2lvA/8kOm0wS60gunPeOAlkmDah4PTGPdEEtlKkIeO23
	5QNw==
X-Gm-Message-State: AIkVDXLZpefpY9eE5a8I5P85VAssvieUil5ZNPkEqw42/cf5hsBoWrN9yrDk/UbfRxwTUwPRQ7rGNZuIHD1ljg==
X-Received: by 10.55.16.214 with SMTP id 83mr1819234qkq.192.1484731022018;
	Wed, 18 Jan 2017 01:17:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.82.11 with HTTP; Wed, 18 Jan 2017 01:17:01 -0800 (PST)
Received: by 10.140.82.11 with HTTP; Wed, 18 Jan 2017 01:17:01 -0800 (PST)
In-Reply-To: <CAFEAcA9N_YXFCPo8ja-Nan3roL=gdNpFQHoLk_aw6tDixwoT3w@mail.gmail.com>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9N_YXFCPo8ja-Nan3roL=gdNpFQHoLk_aw6tDixwoT3w@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 18 Jan 2017 10:17:01 +0100
Message-ID: <CAJy5ezpYPaEdWG_4JQaQTL56EZYDT-TCYLaFtrKzpZUcu9DKHg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=001a113adb14278eca05465ae1a4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v2 00/18] arm: Add virtualization to GICv3,
 and enable EL2 on 64-bit CPUs
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
Cc: Andrew Jones <drjones@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PhwXzpcBmfFv

--001a113adb14278eca05465ae1a4
Content-Type: text/plain; charset=UTF-8

Hi Peter,  I'm on holidays and won't have time to review for a couple of
weeks at least...

Cheers,
Edgar

---
Sent from my phone

On 17 Jan 2017 14:08, "Peter Maydell" <peter.maydell@linaro.org> wrote:

> On 9 January 2017 at 16:05, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > This patchset adds support for the Virtualization extensions to QEMU's
> > GICv3 emulation. This was the last missing piece that was stopping
> > us from turning on the EL2 support in the CPU model, so the patchset
> > also adds support for enabling it all on the virt board via the
> > '-machine virtualization=on' option.
>
> > Patches 1, 4-13, 15, 16 still need review.
>
> So is anybody interested in reviewing the complicated
> bits in the middle of this patchset (5-13) or shall I
> just throw it into target-arm.next? :-)
>
> thanks
> -- PMM
>
>

--001a113adb14278eca05465ae1a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Peter, =C2=A0I&#39;m on holidays and won&#39;t have ti=
me to review for a couple of weeks at least...<div dir=3D"auto"><br></div><=
div dir=3D"auto">Cheers,=C2=A0</div><div dir=3D"auto">Edgar=C2=A0<br><br><d=
iv data-smartmail=3D"gmail_signature" dir=3D"auto">---<br>Sent from my phon=
e</div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On 17 Jan 2017 14:08, &quot;Peter Maydell&quot; &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br type=3D"a=
ttribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On 9 January 2017 at 16:05, Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br>
&gt; This patchset adds support for the Virtualization extensions to QEMU&#=
39;s<br>
&gt; GICv3 emulation. This was the last missing piece that was stopping<br>
&gt; us from turning on the EL2 support in the CPU model, so the patchset<b=
r>
&gt; also adds support for enabling it all on the virt board via the<br>
&gt; &#39;-machine virtualization=3Don&#39; option.<br>
<br>
&gt; Patches 1, 4-13, 15, 16 still need review.<br>
<br>
So is anybody interested in reviewing the complicated<br>
bits in the middle of this patchset (5-13) or shall I<br>
just throw it into target-arm.next? :-)<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div>

--001a113adb14278eca05465ae1a4--
