Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp170561wru;
        Tue, 17 Jul 2018 18:34:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc2VXs1cusVZ0cbs1d388FM2Nxn0ukBMA6IWGuUv5CueGdrReWhWp9cx04huge6iRJ332LD
X-Received: by 2002:ae9:edc5:: with SMTP id c188-v6mr3619792qkg.92.1531877696920;
        Tue, 17 Jul 2018 18:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531877696; cv=none;
        d=google.com; s=arc-20160816;
        b=h5oB6hza0278Skz5ozQMAMY0TkxUGyBAlTBzK9QqXK2dWs1yi7jrKYCQTIV3nHtTrl
         4J8tCbL9kHUB/B4KoYSiP6cVHfscNJZJmNOIumBQkdnkUcnMIg18ExOkGXcyrsaUS46x
         DB7NXqSC4KwnUn35vRfkyD8xkWkCWEjR7sUa3MsJfC4CDAHDd+MSOk15FSOAxfEaO4nv
         LUBDp7qApe92Vo1HT/9ZH1HqedP5cfICTaVmt1VJlNrrTqZoRFNFbUlO5/TsWerIz7fG
         ZEO9wViPfbxRn2jg+cJbSOzLPz+gt1pj9KLRrNM3Wa5HAcH4ASVo0dKCxz/DX6nbQ+TT
         z2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tLHrrvH1jExe+fs9xMGwbc4GqBLdjpqi77giAfEaLks=;
        b=NwaGybBcX51J1n0JniseGbjvvEZpJN7Z1Kcenybat80uf7KChEbmag0lBiI+IWSYY8
         6cGjFZu6alaHBq4/kbvWBo/YEmu7UBiTLU15p7WBJpYJqFt+wfVA1DRs5eVCaA78Wxcq
         JLmFUHwUiyjNA21lxXDtCSeTLIpYsvOYUDM4SP99q4bfmyg2QVe/XeMDG0C7yOWXwy8+
         rq3I5wffbzitIjeOlx0LOPH8+QwkGsppgM3oZwa65Vwlacqupnj8rzC028RAZ+uMIhyt
         xt2FtuETAIsSD5qNLaCePlOtzm72HH7kSVgyPegmFAWFhL6NtNHQMaCCOBRqOLl9zT0w
         BDDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@umich.edu header.s=relay-2016-05-12 header.b=JR+Yo9ae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=umich.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b132-v6si1971456qkg.12.2018.07.17.18.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 18:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@umich.edu header.s=relay-2016-05-12 header.b=JR+Yo9ae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=umich.edu
Received: from localhost ([::1]:34201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffbMm-00073Y-Ee
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 21:34:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevlough@umich.edu>) id 1ffbMd-00071k-5m
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 21:34:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevlough@umich.edu>) id 1ffbMb-0005ms-5i
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 21:34:47 -0400
Received: from smtp.mail.umich.edu ([141.211.12.86]:45844
	helo=tombraider.mr.itd.umich.edu)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <kevlough@umich.edu>)
	id 1ffbMV-0005XR-5Y; Tue, 17 Jul 2018 21:34:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2016-05-12; t=1531877672;
	bh=tLHrrvH1jExe+fs9xMGwbc4GqBLdjpqi77giAfEaLks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JR+Yo9aeK3Ha6VhLrkjpDt31mutsbO5lnpiYJyyS1pj1eGfb+Y0Hs0FTBASQy5ec5
	Znwk9rE0M4jruzwefLRPddkrlMbzW6qaEkdr+FpdKAQAUkRtT+0rDGjF/jGWCDfRMr
	LoGKQWX56+PCinbXzCK9g1CMJpwuQM3UMNNmjxzlabHMGka79CRLBJBz8ZUMgTm/nU
	SdVTdZ52P+k/uCgouldJ5Ib+NtOCajnl0h1t439BCiKwlUayIDvos0SBAA9jOa8Btp
	POJTlhsfCj/uqtODEjuAc0541BB0kdaRHwo3Wtu//wt67hTF1nIe60QAbeBh0gXgjA
	u5uXjb7luRNpQ==
Authentication-Results: tombraider.mr.itd.umich.edu;
	iprev=pass policy.iprev=74.125.82.48 (mail-wm0-f48.google.com);
	auth=pass smtp.auth=kevlough
Received: FROM mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	By tombraider.mr.itd.umich.edu ID 5B4E9927.C0629.9062;
	Authuser kevlough; Tue, 17 Jul 2018 21:34:32 -0400
Received: by mail-wm0-f48.google.com with SMTP id c14-v6so1080375wmb.4;
	Tue, 17 Jul 2018 18:34:31 -0700 (PDT)
X-Gm-Message-State: AOUpUlEe75eNc/NA/F2DFhcWI5qeprrZkM77fhs74cu28M9fRbQlkBt9
	IyKaR2P7wE61AjIOdb7fz9jrDFd6FurIXCURMdA=
X-Received: by 2002:a1c:2352:: with SMTP id
	j79-v6mr244569wmj.124.1531877670225; 
	Tue, 17 Jul 2018 18:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAB30WPccergMTSWWrwj-WhTCcaMvvW7vnAMO3qvy9b9B53N=zA@mail.gmail.com>
	<CAFEAcA8v762p3JSQ=9Vu68-evYS5MMH467pAo8=XZWsw+x6s7Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8v762p3JSQ=9Vu68-evYS5MMH467pAo8=XZWsw+x6s7Q@mail.gmail.com>
From: Kevin Loughlin <kevlough@umich.edu>
Date: Tue, 17 Jul 2018 21:34:18 -0400
X-Gmail-Original-Message-ID: <CAB30WPfKKesSfvyEx9ZpSUQShnXJnH1YCXgZgp0OoY888r0K4w@mail.gmail.com>
Message-ID: <CAB30WPfKKesSfvyEx9ZpSUQShnXJnH1YCXgZgp0OoY888r0K4w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005f8ba805713c1045"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x [fuzzy]
X-Received-From: 141.211.12.86
Subject: Re: [Qemu-arm] [Qemu-devel] Native Memory Virtualization in
 qemu-system-aarch64
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, "Mickens,
	James" <mickens@g.harvard.edu>, qemu-discuss@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hDCzVS27WaMx

--0000000000005f8ba805713c1045
Content-Type: text/plain; charset="UTF-8"

I am indeed attempting to implement a non-standard extension to the ARMv8
architecture for experimental purposes. My high-level goal for the
extension is to completely isolate *N* execution environments (for example,
I even prohibit inter-environment communication) using purely HW-based
isolation mechanisms (i.e. no monitor software to help enforce/configure
isolation).

As part of my design, I want to take a single set of physical memory
hardware (e.g., RAM chips, MMUs, etc.) and

   1. partition the resources *N* ways, creating *N* views of the available
   physical resources, and then
   2. be able to dynamically switch the current view that is "active,"
   i.e., visible to the CPU and other devices

Under my setup, the CPU's MMU translates from VAs to IPAs, and an external
memory controller then intercepts all memory transactions and translates
these IPAs to true PAs. This allows the memory controller to enforce
physical isolation of environments, and does not expose true PAs to the
CPU/system software.

The CPU object would initialize and store an AddressSpace object for each
environment in its field "cpu_ases." Additionally, each environment's
memory map would follow identical offsets. That is, if RAM/flash/etc starts
at offset X in one environment, it will start at offset X in the other as
well. Therefore, my controller only ever needs to perform IPA-to-PA
translations via a simple, hard-wired base+bounds policy that is based on
the active environment.

My question is how best to emulate the memory controller given this desired
setup. I have three primary ideas, and I would love to get feedback on
their feasibility.

   1. Implement the controller as an IOMMU region. I would be responsible
   for writing the controller's operations to shift and forward the target
   address to the appropriate subregion. Would it be possible to trigger
   the IOMMU region on every access to system_memory? For example, even during
   QEMU's loading process? Or would I only be able to trigger the IOMMU
   operations on access to the subregions that represent my environments? My
   understanding of the IOMMU regions is shaky. Nonetheless, this sounds
   like the most promising approach, assuming I can provide the shifting and
   forwarding operations and hide the PAs from the CPU's TLB as desired.

   2. Go into the target/arm code, find every instance of accesses to
   address spaces, and shift the target physical address accordingly. This
   seems ugly and unlikely to work.

   3. Use overlapping subregions with differing priorities, as in done in
   QEMU's TrustZone implementation. However, these priorities would have to
   change on an environment context switch, and I don't know if that would
   lead to chaos.


Thanks,

Kevin

P.S. Note that my virtualization actually occurs *beneath* the TrustZone
layer. While creating "nested" TrustZones within each of my partitions is
theoretically possible, it's not an explicit goal of my design. Naturally,
I do use some isolation techniques similar to those deployed in TrustZone,
but ultimately my extension is designed for different purposes than
TrustZone.

On Fri, Jul 13, 2018 at 11:22 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 12 July 2018 at 17:48, Kevin Loughlin <kevlough@umich.edu> wrote:
> > I know TrustZone has support for memory virtualization in AArch64, but
> I'm
> > looking to create a different model. Namely, I'd like to fully virtualize
> > the memory map for the "virt" board.
> >
> > As a basic example of what I want, assuming an execution environment that
> > runs in a 1GB physical address space (0x0 - 0x3FFFFFFF), I'd like to be
> > able to switch to a second execution environment with a distinct SW stack
> > that runs in the second GB of a board memory (0x40000000 - 0x7FFFFFFF).
> The
> > key points for my desired memory virtualization are the following...
> >
> >    1. Both of these environments should have distinct virtual address
> spaces
> >    2. The OS in each environment should believe it is running on physical
> >    addresses 0x0 - 0x3FFFFFFF in both cases.
> >    3. Neither environment should have access to the physical memory state
> >    of the other
> >
> > I initialize distinct AddressSpace and MemoryRegion structures for each
> of
> > these GB blocks. Because all I want is a simple shift of physical address
> > for one environment, I hesitate to mirror the (relatively) complex
> address
> > translation process for TrustZone. Does anyone know if it would be better
> > to either (a) provide custom read/write functions for the shifted
> > MemoryRegion object, or (b) modify the target/arm code, such as adding a
> > shift to get_phys_addr() in target/arm/helper.c?
>
> I'm a bit confused about what you're trying to do. Without TrustZone,
> by definition there is only one physical address space (ie all of
> memory/devices/etc are addressed by a single 64-bit physaddr).
> There's no way to cause the CPU to not have access to it.
> With TrustZone, you can think of the system as having two physical
> address spaces (so to access something you need to specify both
> a 64-bit physaddr and the TZ secure/nonsecure bit), and the CPU
> and the system design cooperate to enforce that code running in the
> nonsecure world can't get at things in the system it should not have
> access to.
>
> The whole point of TZ is to allow you to do this sort of partitioning.
> Without it there's no way for the system (RAM or whatever) to know which
> environment is running on the CPU.
>
> You could in theory design and implement a non-standard extension to
> the architecture to do equivalent things to what TZ is doing I suppose,
> but that would be a lot of work and a lot of fragile modifications
> to QEMU.
>
> thanks
> -- PMM
>

--0000000000005f8ba805713c1045
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am indeed attempting to implement a non-standard ex=
tension to the ARMv8 architecture for experimental purposes. <span style=3D=
"font-size:small;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">My high-leve=
l goal for the extension is to completely isolate <i>N</i> execution enviro=
nments (for example, I even prohibit inter-environment communication) using=
 purely HW-based isolation mechanisms (i.e. no monitor software to help enf=
orce/configure isolation).</span></div><div><span style=3D"font-size:small;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline"><br></span></div><div><span s=
tyle=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">As pa=
rt of my design, I want</span>=C2=A0to take a single set of physical memory=
 hardware (e.g., RAM chips, MMUs, etc.) and</div><div><div style=3D"font-si=
ze:small;text-decoration-style:initial;text-decoration-color:initial"><ol><=
li>partition the resources <i>N</i> ways, creating <i>N</i> views of the av=
ailable physical resources, and then</li><li>be able to dynamically switch =
the current view that is &quot;active,&quot; i.e., visible to the CPU and o=
ther devices</li></ol></div></div><div><span style=3D"font-size:small;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline"><span style=3D"text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">Under m=
y setup, the CPU&#39;s MMU translates from VAs to IPAs, and an external mem=
ory controller then intercepts all memory transactions and translates these=
 IPAs to true PAs. This allows the memory controller to enforce physical is=
olation of environments, and does not expose true PAs to the CPU/system sof=
tware.</span></span></div><div><span style=3D"font-size:small;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline"><span style=3D"text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline"><br></span></sp=
an></div><div>The CPU object would initialize and store an AddressSpace obj=
ect for each environment in its field &quot;cpu_ases.&quot; Additionally, e=
ach environment&#39;s memory map would follow identical offsets. That is, i=
f RAM/flash/etc starts at offset X in one environment, it will start at off=
set X in the other as well. Therefore, my controller only ever needs to per=
form IPA-to-PA translations via a simple, hard-wired base+bounds policy tha=
t is based on the active environment.=C2=A0<br></div><div><br></div><div>My=
 question is how best to emulate the memory controller given this desired s=
etup. I have three primary ideas, and I would love to get feedback on their=
 feasibility.</div><div><ol><li>Implement the controller as an IOMMU region=
. I would be responsible for writing the controller&#39;s operations to shi=
ft and forward the target address to the appropriate=C2=A0subregion. <span =
style=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline"><spa=
n>Would it be possible to trigger the IOMMU region on every access to syste=
m_memory? For example, even during QEMU&#39;s loading process? Or would I o=
nly be able to trigger the IOMMU operations on access to the subregions tha=
t represent my environments? My understanding of the IOMMU regions is shaky=
.=C2=A0<span style=3D"font-size:small;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">Nonetheless, this sounds like the most promising approach, assumin=
g I can provide the shifting and forwarding operations and hide the PAs fro=
m the CPU&#39;s TLB as desired.<br></span><span style=3D"font-size:small;te=
xt-decoration-style:initial;text-decoration-color:initial">=C2=A0</span></s=
pan></span><br></li><li>Go into the target/arm code, find every instance of=
 accesses to address spaces, and shift the target physical address accordin=
gly. This seems ugly and unlikely to work.<br><br></li><li>Use overlapping =
subregions with differing priorities, as in done in QEMU&#39;s TrustZone im=
plementation. However, these priorities would have to change on an environm=
ent context switch, and I don&#39;t know if that would lead to chaos.</li><=
/ol></div><div><br></div>Thanks,<div><br></div><div>Kevin</div><div><br></d=
iv><div>P.S. Note that my virtualization actually occurs *beneath* the Trus=
tZone layer. While creating &quot;nested&quot; TrustZones within each of my=
 partitions is theoretically possible, it&#39;s not an explicit goal of my =
design. Naturally, I do use some isolation techniques similar to those depl=
oyed in TrustZone, but ultimately my extension is designed for different pu=
rposes than TrustZone.</div><div><br></div><div><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Fri, Jul 13, 2018 at 11:22 AM Peter Maydell &lt;<a href=
=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 12 July 2018 at 17:48, Kevin Loughlin &lt;<a href=3D"mailto:kevlough=
@umich.edu" target=3D"_blank">kevlough@umich.edu</a>&gt; wrote:<br>
&gt; I know TrustZone has support for memory virtualization in AArch64, but=
 I&#39;m<br>
&gt; looking to create a different model. Namely, I&#39;d like to fully vir=
tualize<br>
&gt; the memory map for the &quot;virt&quot; board.<br>
&gt;<br>
&gt; As a basic example of what I want, assuming an execution environment t=
hat<br>
&gt; runs in a 1GB physical address space (0x0 - 0x3FFFFFFF), I&#39;d like =
to be<br>
&gt; able to switch to a second execution environment with a distinct SW st=
ack<br>
&gt; that runs in the second GB of a board memory (0x40000000 - 0x7FFFFFFF)=
. The<br>
&gt; key points for my desired memory virtualization are the following...<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 1. Both of these environments should have distinct virtua=
l address spaces<br>
&gt;=C2=A0 =C2=A0 2. The OS in each environment should believe it is runnin=
g on physical<br>
&gt;=C2=A0 =C2=A0 addresses 0x0 - 0x3FFFFFFF in both cases.<br>
&gt;=C2=A0 =C2=A0 3. Neither environment should have access to the physical=
 memory state<br>
&gt;=C2=A0 =C2=A0 of the other<br>
&gt;<br>
&gt; I initialize distinct AddressSpace and MemoryRegion structures for eac=
h of<br>
&gt; these GB blocks. Because all I want is a simple shift of physical addr=
ess<br>
&gt; for one environment, I hesitate to mirror the (relatively) complex add=
ress<br>
&gt; translation process for TrustZone. Does anyone know if it would be bet=
ter<br>
&gt; to either (a) provide custom read/write functions for the shifted<br>
&gt; MemoryRegion object, or (b) modify the target/arm code, such as adding=
 a<br>
&gt; shift to get_phys_addr() in target/arm/helper.c?<br>
<br>
I&#39;m a bit confused about what you&#39;re trying to do. Without TrustZon=
e,<br>
by definition there is only one physical address space (ie all of<br>
memory/devices/etc are addressed by a single 64-bit physaddr).<br>
There&#39;s no way to cause the CPU to not have access to it.<br>
With TrustZone, you can think of the system as having two physical<br>
address spaces (so to access something you need to specify both<br>
a 64-bit physaddr and the TZ secure/nonsecure bit), and the CPU<br>
and the system design cooperate to enforce that code running in the<br>
nonsecure world can&#39;t get at things in the system it should not have<br=
>
access to.<br>
<br>
The whole point of TZ is to allow you to do this sort of partitioning.<br>
Without it there&#39;s no way for the system (RAM or whatever) to know whic=
h<br>
environment is running on the CPU.<br>
<br>
You could in theory design and implement a non-standard extension to<br>
the architecture to do equivalent things to what TZ is doing I suppose,<br>
but that would be a lot of work and a lot of fragile modifications<br>
to QEMU.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div></div>

--0000000000005f8ba805713c1045--
