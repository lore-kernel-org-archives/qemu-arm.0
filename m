Received: by 10.223.159.82 with SMTP id f18csp3841467wrg;
        Tue, 28 Nov 2017 23:17:17 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZQlpNEQdrwSO3M3IyHtBJ6mPhuW3dvfilPzp2kvgNq06zNYpDPY1+hs9zC660YBMjTJFC7
X-Received: by 10.129.68.38 with SMTP id r38mr1245130ywa.312.1511939837794;
        Tue, 28 Nov 2017 23:17:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511939837; cv=none;
        d=google.com; s=arc-20160816;
        b=OZ6Z4D6c+kuQHtM2VoMBZDVDUEhUmxT1dXcES5pw90QfknJOtXvhQze7uq71h88hxv
         V/xTZZYcia4AJaBkW1Z8uBfBFQB0GhwevWCimfSPMi9YZErvK7LTRMyuFHWd5kVvDj02
         Ah4Bfxb8KN6P+RL3EFmBXNEcIrwlGj+FanToSxMQ9AFM6+5DUBHDvq1BP9O831k630gK
         zLaomT9H78FYpRI6i6mdtiKPt1qOtvFgmljDKJS3JypeyanXQF3zonutRoVvv8CUn3+E
         1qm1FPQa6oAc4NN6z2NcVRYchBeqo3Tz5s+FWOfdSdhb9PceW/REZ5aqxrq246VccSrL
         M/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=S46bbwGDXWyM4aKpc5aypmtDMLf2uBkQcaQaX7FTGPQ=;
        b=NGi4lvJf0QyuEhcTPXIBCIV0/6oqkesrOFXWRSxrf1P2ENFWRymCxuAcLUT6VRbFP1
         Rad1ZgXjFyfdv9tErGTqCGJRKIUwICdj01Gpz0oWHk8x9y7NyAkw/5JUoRZsyPe46b5G
         YmLhMFa52vOMna6uob1tQWlDuIiNsxNqHxnAuulSFGio2z6Z9ucPHJKJTUFd4R+zrOju
         r29533Z2uyQX/bFLAYrkDMNCLum2I6laa8degc6mZZJpYBKJ+4EdKMEWOKUpkDIJZ0/l
         KeG5GnuZJH43GycZM+lxoGgBN1uym3iWkKE358bXOdFCY/LmIA2hMmX29egZ1nnsIMuH
         Wu0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WQAdVJds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7si216041ywe.605.2017.11.28.23.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 23:17:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WQAdVJds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJwcO-0007Ld-1s
	for alex.bennee@linaro.org; Wed, 29 Nov 2017 02:17:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1eJwcG-0007Ky-4z
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 02:17:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1eJwcF-0006kj-8P
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 02:17:08 -0500
Received: from mail-pl0-x232.google.com ([2607:f8b0:400e:c01::232]:37377)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1eJwcD-0006hc-1S; Wed, 29 Nov 2017 02:17:05 -0500
Received: by mail-pl0-x232.google.com with SMTP id v41so1566802plg.4;
	Tue, 28 Nov 2017 23:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S46bbwGDXWyM4aKpc5aypmtDMLf2uBkQcaQaX7FTGPQ=;
	b=WQAdVJdsvCHst5luQi+EeruSM9/kl2vNMAbAq8XEtDaX5Ppb8sKSa9XqlxRNak3GNi
	+XKIbZ4vzz7etyXyuDYazSscF7fRQh5OvmhBHiceVwb7qoKFxsSgw6y5/oxezHo6zBPT
	9yYxgAzPLaCD1j2AcqzfX6j92ji4zuUa8yNiiSMRsAZuxMvg53mfu7lkkmCLYRUWOicL
	D3V0Wczq4hbiz4FqnuF8ujAdayBiRcbqfWnYjkcYAxzHANk1/tdymyDT2PTd1jlpoDb1
	GBRpW9IIG57TLeOqkQJ3WANjUxdF30/z5uqsT8OIsxOYw4ISZMLvFwWX68LRN9MDK4pL
	d01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S46bbwGDXWyM4aKpc5aypmtDMLf2uBkQcaQaX7FTGPQ=;
	b=GzeRwdHzQGiD6C88kT90HjklXcwZLFynx3RxU/FJTuUlffa8gPDv4eWWCj4S4FRqxG
	3bxxtMdemmyRh/abhTzpZqPxHbjOrliPj5v9fmPTqYlxVlLUEXMGTTrg8FowWMx0wrMs
	PfjFJa7zwA8lJwxOP/ppy/Hch1bY02MWaPB9AGS3l1vVg0i31W5owuC09wRHBDpqVlVh
	RseWkszLNyitQ1jJY3vquWFAc14UtYYrg76fQON4UETHcGLR8pC6lXebpH2yYRUGENr8
	jTjMp1nnbB1Lmmg43ghu3q4xq+AhJONTi2+x34JYkOGuBftREd0NM/vOVsA0gOHlzMqJ
	Fs8w==
X-Gm-Message-State: AJaThX7Tzd6TlSA8CTLdEuE1YKGgg/FZ6di8Znj95Rpfn4I9ZnIiKWur
	k+v2zHyKtxvVJcBNFe6bgTYunf0C1zH1K1SrMj0=
X-Received: by 10.84.236.12 with SMTP id q12mr1954474plk.314.1511939824045;
	Tue, 28 Nov 2017 23:17:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.204 with HTTP; Tue, 28 Nov 2017 23:17:03 -0800 (PST)
In-Reply-To: <CAFEAcA8iM_Qq=OMr_eo_MnUphzinrfhYNJtmuXx9nkK979H3Rg@mail.gmail.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
	<MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
	<CAFEAcA8iM_Qq=OMr_eo_MnUphzinrfhYNJtmuXx9nkK979H3Rg@mail.gmail.com>
From: bzt bzt <bztemail@gmail.com>
Date: Wed, 29 Nov 2017 08:17:03 +0100
Message-ID: <CADYoBw13OR7CXP5xhbFZsZn00y44EeWE5dtPmW53tq=zua=icg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="f403045fd1d6225379055f19ec9c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::232
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BQ8q2jgVoR4U

--f403045fd1d6225379055f19ec9c
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 28, 2017 at 12:56 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 28 November 2017 at 11:26, bzt bzt <bztemail@gmail.com> wrote:
> > (Although I have a question. I'm not sure what's the preferred
> > way to get MachineClass* object in bcm2836. Use a MachineState* cast on
> it's
> > Object* argument with MACHINE_GET_CLASS() or should I use the
> parameterless
> > qdev_get_machine() instead?)
>
> bcm2836.c should be a self contained object, which its caller creates
> and configures. The MachineClass is the board model object, and the
> SoC object shouldn't have to access it. If there's something (like the
> CPU model string) that the SoC needs, the SoC object should have a
> property which the board model sets.
>
> hw/arm/stm32f205_soc.c has an example of this (as do some of the
> other SoC objects -- 'git grep cpu-type hw/arm' should bring them up).
>

Okay, thanks a lot! I'll check them!


>
> thanks
> -- PMM
>

--f403045fd1d6225379055f19ec9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 28, 2017 at 12:56 PM, Peter Maydell <span dir=3D"ltr">&lt;<=
a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@=
linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On=
 28 November 2017 at 11:26, bzt bzt &lt;<a href=3D"mailto:bztemail@gmail.co=
m" target=3D"_blank">bztemail@gmail.com</a>&gt; wrote:<br>
&gt; (Although I have a question. I&#39;m not sure what&#39;s the preferred=
<br>
&gt; way to get MachineClass* object in bcm2836. Use a MachineState* cast o=
n it&#39;s<br>
&gt; Object* argument with MACHINE_GET_CLASS() or should I use the paramete=
rless<br>
&gt; qdev_get_machine() instead?)<br>
<br>
</span>bcm2836.c should be a self contained object, which its caller create=
s<br>
and configures. The MachineClass is the board model object, and the<br>
SoC object shouldn&#39;t have to access it. If there&#39;s something (like =
the<br>
CPU model string) that the SoC needs, the SoC object should have a<br>
property which the board model sets.<br>
<br>
hw/arm/stm32f205_soc.c has an example of this (as do some of the<br>
other SoC objects -- &#39;git grep cpu-type hw/arm&#39; should bring them u=
p).<br></blockquote><div><br></div><div>Okay, thanks a lot! I&#39;ll check =
them!<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div></div>

--f403045fd1d6225379055f19ec9c--
