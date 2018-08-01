Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp465684wru;
        Wed, 1 Aug 2018 01:09:44 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcPGfrBoWG3s9nnaU9N0qNA9S534H0uHkEFX2mxrsBiiHJ7M97nxcM414/9KPuQdYZ09omT
X-Received: by 2002:a0c:ac85:: with SMTP id m5-v6mr22181965qvc.197.1533110984848;
        Wed, 01 Aug 2018 01:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533110984; cv=none;
        d=google.com; s=arc-20160816;
        b=sltPYUT/R+hkkQiXa3d/nbCHAa4RtTUeoW6e84hwHmSVZ/mqyOBbwqe1hWrrKILlBu
         WukUNG0+dWh98P0/QO5ZlHOGKQ01LG0+0gpMTYajNW6dSGSkmXsitV3J3B7QKhFMu+a7
         FGZ3109ImIDI9H0MYJMM7cnC0hSsL9LIJbDC+b+fxy3tgtYxPUBgL6UhBikEnFVUVMX0
         gUJmee/LF0dbOT5kAe7i+2vCCF0Z9UE9v29T37r363qwc4xWrE19Et5WHhO4rEfPkuAx
         tPPpQlgT26y7mn4b/n6IuI/c9rPdt0zNF4IMf5YUZKWvAjKonKkTrKp3dV86FpoZJpZg
         epBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/deAU/bnaJ1uTTEatOVynS5ttoBt1w8WGHwS7W3nXH0=;
        b=av5+Y5gWSozPiMHlrwnVHWaGbSod6GNN5Sx0HIhm3SYXDCxTSXZ+b6/8txdFVwv7G9
         URxsfrXpuSNI05jhv5xPelA3Nq3gIzM0TZo4T1sfVaLWMHShmYlPDUTLiquuwpj1ULHp
         POwPx60UtxcCXR/jOHdw+AewH+bV/tAjQJUVrpJpjEaTnFWgC6yyePDyyZMAHLbBP1iQ
         cmSMo4qC9h8MWaoOZvwDcVN6u+8Cr6z8CX5mcVs9DG5K19CxILbkcm7r2PTehqbtdDD6
         vRRgS35VefRXtBGUa8gAr4ZEfiCmsjkz86EvVaorpzblHX0HP4T3yGm4p5YT57sChJMu
         WlaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=icJ7K2UM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z9-v6si275082qvn.174.2018.08.01.01.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 01:09:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=icJ7K2UM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkmCW-0003Jx-8a
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 04:09:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharata.rao@gmail.com>) id 1fkmCJ-0003IE-2o
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 04:09:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharata.rao@gmail.com>) id 1fkmCH-00067l-Lu
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 04:09:31 -0400
Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232]:45633)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bharata.rao@gmail.com>)
	id 1fkmCE-000672-6t; Wed, 01 Aug 2018 04:09:26 -0400
Received: by mail-oi0-x232.google.com with SMTP id q11-v6so32990474oic.12;
	Wed, 01 Aug 2018 01:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/deAU/bnaJ1uTTEatOVynS5ttoBt1w8WGHwS7W3nXH0=;
	b=icJ7K2UMGbbb+Nu8FYyLKOa9pEk9ZuqDUqGVBYfl6WIGvm5p5jmJPyX7Y74iJe8zgl
	vR7ttSGFPwukgbYcrXsEIjBXieLGy7sZQ8Vh0JBKRrng7D3mf0y8UJiZPVGTKSsermcW
	g/4H1nfYMWkZ2hBHBpBO/T2TflDiTmk9Eyu76VcwWCNh/p2J5xxoQoJxWIjzDNikgSg+
	2k7mEckIQzwbhEabF6yQxax4hZfLnCr0jVrFAZCR8WTIwOry5oNlkuYaad3fPMh0iIoC
	J/hTwBzggEKeXaJvoPXRSJIx42F5H4tkbQJ+V/PFWdg2W/BAh2nuvbDetwTY7Yxp7Rn/
	/nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/deAU/bnaJ1uTTEatOVynS5ttoBt1w8WGHwS7W3nXH0=;
	b=lxog9ymuEwIgPddIU9i5/mBy55KBuNms2VBNRlPgZ/kXqqhKLl1KLwCe5XoWweybC9
	vjQ0SQRmRp7PK1KdpB5FDDvBY6fLoYQXSBgZ5zK6OYeSIB0x4RJ3Z4+2Xq2Z2wklV+VQ
	zXN9xOeQweSAwPJbdBsWyH7qZN5aeoggDAWCCirnCBAtwlWOBQmJ6D6z+mJivw0l9iDP
	fA0ClWRHO/7tKGrr8NhmQHwHi27m6LYCE9pXkMsZijBrPQHJMVLADrPDrTpCO1zyj36f
	FyIish/sxzX1O6S92Wora8/r3IouwfqRggcqULeRgPD5CFNH04e8RiAMJsCZYbqyE3fk
	OKNA==
X-Gm-Message-State: AOUpUlGloQ2wVBo/3rRhzOd2jKhDMd2NL8vqF1IAwGEGnjsXz5rJDRdU
	ewe9Ase5VXkhjrnQHGs4iqYRrGKm058NjQQagrQ=
X-Received: by 2002:aca:be56:: with SMTP id
	o83-v6mr2532383oif.301.1533110965207; 
	Wed, 01 Aug 2018 01:09:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:28f2:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 01:09:24 -0700 (PDT)
In-Reply-To: <20180731122710.142a97c4@redhat.com>
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
	<20180227104708.GA11391@cbox>
	<ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
	<20180227124604.GA2373@cbox>
	<20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
	<b589d714-4f12-e450-7ca5-e55fed4d1705@oracle.com>
	<74427c65-b860-d576-04f9-766253285210@arm.com>
	<20180725122806.g2gpvdbrbdkriprg@kamzik.brq.redhat.com>
	<202a2c63-1a3e-7f01-850c-4fb5e48f43e7@arm.com>
	<20180731122710.142a97c4@redhat.com>
From: Bharata B Rao <bharata.rao@gmail.com>
Date: Wed, 1 Aug 2018 13:39:24 +0530
Message-ID: <CAGZKiBqDSz8EAz6hJp9ifRy0SMJj+f-KwGL3ymi6E2Kyt+DWMA@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007b87a305725b36ae"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::232
Subject: Re: [Qemu-arm] [Qemu-devel] VCPU hotplug on KVM/ARM
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
Cc: bthakur@codeaurora.org, Christoffer Dall <cdall@cs.columbia.edu>,
	Andrew Jones <drjones@redhat.com>, Christoffer Dall <cdall@kernel.org>,
	Maran Wilson <maran.wilson@oracle.com>,
	Marc Zyngier <marc.zyngier@arm.com>, cohuck@redhat.com,
	david@redhat.com, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
	Christoffer Dall <christofferdall@christofferdall.dk>,
	qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	kvmarm@lists.cs.columbia.edu, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WDMQeN+93cur

--0000000000007b87a305725b36ae
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 31, 2018 at 3:57 PM, Igor Mammedov <imammedo@redhat.com> wrote:

> On Wed, 25 Jul 2018 14:07:12 +0100
> Marc Zyngier <marc.zyngier@arm.com> wrote:
>
> > On 25/07/18 13:28, Andrew Jones wrote:
> > > On Wed, Jul 25, 2018 at 11:40:54AM +0100, Marc Zyngier wrote:
> > >> On 24/07/18 19:35, Maran Wilson wrote:
> > >>> It's been a few months since this email thread died off. Has anyone
> > >>> started working on a potential solution that would allow VCPU
> hotplug on
> > >>> KVM/ARM ? Or is this a project that is still waiting for an owner
> who
> > >>> has the time and inclination to get started?
> > >>
> > >> This is typically a project for someone who would have this particular
> > >> itch to scratch, and who has a demonstrable need for this
> functionality.
> > >>
> > >> Work wise, it would have to include adding physical CPU hotplug
> support
> > >> to the arm64 kernel as a precondition, before worrying about doing it
> in
> > >> KVM.
> > >>
> > >> For KVM itself, particular area of interests would be:
> > >> - Making GICv3 redistributors magically appear in the IPA space
> > >> - Live resizing of GICv3 structures
> > >> - Dynamic allocation of MPIDR, and mapping with vcpu_id
> > >
> > > I have CPU topology description patches on the QEMU list now[*]. A next
> > > step for me is to this MPIDR work. I probably won't get to it until the
> > > end of August though.
> > >
> > > [*] http://lists.nongnu.org/archive/html/qemu-devel/2018-
> 07/msg01168.html
> > >
> > >>
> > >> This should keep someone busy for a good couple of weeks (give or
> take a
> > >> few months).
> > >
> > > :-)
> > >
> > >>
> > >> That being said, I'd rather see support in QEMU first, creating all
> the
> > >> vcpu/redistributors upfront, and signalling the hotplug event via the
> > >> virtual firmware. And then post some numbers to show that creating all
> > >> the vcpus upfront is not acceptable.
> > >
> > > I think the upfront allocation, allocating all possible cpus, but only
> > > activating all present cpus, was the planned approach. What were the
> > > concerns about that approach? Just vcpu memory overhead for too many
> > > overly ambitious VM configs?
> >
> > I don't have any ARM-specific concern about that, and I think this is
> > the right approach. It has the good property of not requiring much
> > change in the kernel (other than actually supporting CPU hotplug).
> for x86 we allocate VCPUs dynamically (both QEMU and KVM)
> CCing ppc/s390 folks as I don't recall how it's implemented there.
>
> but we do not delete vcpus in KVM after they were created
> (as it deemed to be too complicated), we are just deleting QEMU part
> of it and keep kvm's vcpu for reuse with future hotplug.
>

Same with PPC, we too dynamically create vcpus and during unplug keep the
KVM's vcpus for reuse.

Regards,
Bharata.

--0000000000007b87a305725b36ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jul 31, 2018 at 3:57 PM, Igor Mammedov <span dir=3D"ltr">&lt;<a href=3D=
"mailto:imammedo@redhat.com" target=3D"_blank">imammedo@redhat.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div =
class=3D"h5">On Wed, 25 Jul 2018 14:07:12 +0100<br>
Marc Zyngier &lt;<a href=3D"mailto:marc.zyngier@arm.com">marc.zyngier@arm.c=
om</a>&gt; wrote:<br>
<br>
&gt; On 25/07/18 13:28, Andrew Jones wrote:<br>
&gt; &gt; On Wed, Jul 25, 2018 at 11:40:54AM +0100, Marc Zyngier wrote:=C2=
=A0 <br>
&gt; &gt;&gt; On 24/07/18 19:35, Maran Wilson wrote:=C2=A0 <br>
&gt; &gt;&gt;&gt; It&#39;s been a few months since this email thread died o=
ff. Has anyone <br>
&gt; &gt;&gt;&gt; started working on a potential solution that would allow =
VCPU hotplug on <br>
&gt; &gt;&gt;&gt; KVM/ARM ? Or is this a project that is still waiting for =
an owner who <br>
&gt; &gt;&gt;&gt; has the time and inclination to get started?=C2=A0 <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This is typically a project for someone who would have this p=
articular<br>
&gt; &gt;&gt; itch to scratch, and who has a demonstrable need for this fun=
ctionality.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Work wise, it would have to include adding physical CPU hotpl=
ug support<br>
&gt; &gt;&gt; to the arm64 kernel as a precondition, before worrying about =
doing it in<br>
&gt; &gt;&gt; KVM.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; For KVM itself, particular area of interests would be:<br>
&gt; &gt;&gt; - Making GICv3 redistributors magically appear in the IPA spa=
ce<br>
&gt; &gt;&gt; - Live resizing of GICv3 structures<br>
&gt; &gt;&gt; - Dynamic allocation of MPIDR, and mapping with vcpu_id=C2=A0=
 <br>
&gt; &gt; <br>
&gt; &gt; I have CPU topology description patches on the QEMU list now[*]. =
A next<br>
&gt; &gt; step for me is to this MPIDR work. I probably won&#39;t get to it=
 until the<br>
&gt; &gt; end of August though.<br>
&gt; &gt; <br>
&gt; &gt; [*] <a href=3D"http://lists.nongnu.org/archive/html/qemu-devel/20=
18-07/msg01168.html" rel=3D"noreferrer" target=3D"_blank">http://lists.nong=
nu.org/<wbr>archive/html/qemu-devel/2018-<wbr>07/msg01168.html</a><br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This should keep someone busy for a good couple of weeks (giv=
e or take a<br>
&gt; &gt;&gt; few months).=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; :-)<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; That being said, I&#39;d rather see support in QEMU first, cr=
eating all the<br>
&gt; &gt;&gt; vcpu/redistributors upfront, and signalling the hotplug event=
 via the<br>
&gt; &gt;&gt; virtual firmware. And then post some numbers to show that cre=
ating all<br>
&gt; &gt;&gt; the vcpus upfront is not acceptable.=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; I think the upfront allocation, allocating all possible cpus, but=
 only<br>
&gt; &gt; activating all present cpus, was the planned approach. What were =
the<br>
&gt; &gt; concerns about that approach? Just vcpu memory overhead for too m=
any<br>
&gt; &gt; overly ambitious VM configs?=C2=A0 <br>
&gt; <br>
&gt; I don&#39;t have any ARM-specific concern about that, and I think this=
 is<br>
&gt; the right approach. It has the good property of not requiring much<br>
&gt; change in the kernel (other than actually supporting CPU hotplug).<br>
</div></div>for x86 we allocate VCPUs dynamically (both QEMU and KVM)<br>
CCing ppc/s390 folks as I don&#39;t recall how it&#39;s implemented there.<=
br>
<br>
but we do not delete vcpus in KVM after they were created<br>
(as it deemed to be too complicated), we are just deleting QEMU part<br>
of it and keep kvm&#39;s vcpu for reuse with future hotplug.<br></blockquot=
e></div><br></div><div class=3D"gmail_extra">Same with PPC, we too dynamica=
lly create vcpus and during unplug keep the KVM&#39;s vcpus for reuse.<br><=
br></div><div class=3D"gmail_extra">Regards,<br></div><div class=3D"gmail_e=
xtra">Bharata.<br></div></div>

--0000000000007b87a305725b36ae--
