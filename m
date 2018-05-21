Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp553569wme;
        Mon, 21 May 2018 11:04:40 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqBmaK1xly7gtGxkP37ST2KgrK4ad5z84C0SkzztdSyGnjNn+rCdt5AuAzdm6vd7soX3BoU
X-Received: by 2002:aed:3c6e:: with SMTP id u43-v6mr20109698qte.59.1526925880096;
        Mon, 21 May 2018 11:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526925880; cv=none;
        d=google.com; s=arc-20160816;
        b=bZFY5uh7rcWUJ/JGT+WOQJNNT0l5C9lTY090FGKZ3ShN/XGpQArFk7PQpd2EmyRzwT
         6czSD4h+8bvj98bQXmWrZmTLGwtHPNSiQ4zYMfkkvNO+qWIHbEm7Rhv+fr4gqLeITU1z
         OKPp2wUyHVAMu1eBTdcWH2MDcnCo8VA+gZA0pztx5GgTlnx8YrRghFVYAt/ruSdlGZQe
         NdihB7YmMwBMgJjtolLKnUs9TmCAcGPADBWA/wXvwY23GRWSc4waA9Y71ytx7FCSuQoe
         5Aqu3k3BmYAemcITPu6bJ03LzxUM5mv1NR/uue2WU9U5E5ZFcH764kGkuopJnGPt3+vE
         VAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=uR/JAjgrKmK1Fe5ItTksxi50br5LH2g4y+2nuYzkcKk=;
        b=AmR7VKCDZCguuGJRkpAdeLNgkruYpCmG6nY/HNo4MDXABWiw+Jtj1Va4qVHi2WTpX2
         wkSCD89s2ivMXRnibilk1FxImkkGGtlt8TD5zsuyiUW6FA/JY1wv5S3aUj1AOWZ25Yj3
         5S3mh6GHaea5PwI6J7W9FSDCPGnuDwWay3Q5skvg62BUUmTwsY/j4L+zUGyKBZO1/kBE
         0TmD5YP6rAcI1+o779V6YmJa0Le/nd4LMfEeXRSsD96GUJACaOkEwNkfp93D+iizziUp
         t8ouAJass1gqm5JrFYyeHGbvLA2tWFZBywl/mO419OyQvEZH5K9RoAGZevaEYt+tOEzY
         ZS0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (invalid public key) header.i=@tinylabs.io header.s=default header.b=M5Ieq6QR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m39-v6si5391973qtk.28.2018.05.21.11.04.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 May 2018 11:04:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (invalid public key) header.i=@tinylabs.io header.s=default header.b=M5Ieq6QR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fKpAl-00043h-Mk
	for alex.bennee@linaro.org; Mon, 21 May 2018 14:04:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <elliot@tinylabs.io>) id 1fKpAf-00043c-12
	for qemu-arm@nongnu.org; Mon, 21 May 2018 14:04:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <elliot@tinylabs.io>) id 1fKpAb-0003kB-2h
	for qemu-arm@nongnu.org; Mon, 21 May 2018 14:04:33 -0400
Received: from server.tinylabs.io ([162.144.34.248]:34696)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <elliot@tinylabs.io>) id 1fKpAa-0003jL-QV
	for qemu-arm@nongnu.org; Mon, 21 May 2018 14:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tinylabs.io
	; s=default;
	h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uR/JAjgrKmK1Fe5ItTksxi50br5LH2g4y+2nuYzkcKk=;
	b=M5Ieq6QR1S2RwkwXLKhCyok7XW
	UbtbwMYoA2scSn1wAbQ5IU+fYfTeF1XDtinI9XV96M3hwv6hlYA7Fy4GhmCw6bCUD/Vau3gKRISfQ
	iH6GRaJKgvZre9VjbWFgfoeEcjbsUe9saCF89V24O8TSqbB2ekpnCBmpoqiqWAwUlJZKs/8SMDive
	5b8m0u2epKHkTKwWE/U8fAk0Norqg4ji/NE/ejVElkM7uOAI+LRcA13vJY548HWv9LZKY8Xa5B3T1
	fpujpL3xtymdjN0Nyew9whh6jZMO8ca9Z3jUYjzyVt2cH+OhygOh9897vk97aWZ/JY19RvSQFDqHz
	5ktTZzfQ==;
Received: from mail-lf0-f54.google.com ([209.85.215.54]:44263)
	by server.tinylabs.io with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
	(envelope-from <elliot@tinylabs.io>) id 1fKpAX-000282-2o
	for qemu-arm@nongnu.org; Mon, 21 May 2018 18:04:25 +0000
Received: by mail-lf0-f54.google.com with SMTP id h197-v6so25182670lfg.11
	for <qemu-arm@nongnu.org>; Mon, 21 May 2018 11:04:26 -0700 (PDT)
X-Gm-Message-State: ALKqPwfoNbmFL9FkMG1RVoSVcprjq6SteAF5M6VN3XeiXfAuO+765yu3
	x8uUEql65y8IXzQvgZTG+Qe2XmHL/Yb5eRyg3LY=
X-Received: by 2002:a2e:6e10:: with SMTP id
	j16-v6mr13362090ljc.61.1526925864589; 
	Mon, 21 May 2018 11:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+ALrx4bN1o=2oduB0uhs8acjVWOO0KYkduiP69ZZm54wP6fVw@mail.gmail.com>
	<CAFEAcA8hsrXXBp_KRxqjg5hj8L8Z3Pd5wNfbwnkxJqLJivFupQ@mail.gmail.com>
	<CA+ALrx6BmOyjH+v__TckKeDEyQefFZeQT9F=5BCHnY2tjqhmrQ@mail.gmail.com>
In-Reply-To: <CA+ALrx6BmOyjH+v__TckKeDEyQefFZeQT9F=5BCHnY2tjqhmrQ@mail.gmail.com>
From: Elliot Buller <elliot@tinylabs.io>
Date: Mon, 21 May 2018 12:04:13 -0600
X-Gmail-Original-Message-ID: <CA+ALrx4QBZOpRe8CBZzgsrqpmV_5eb0tKh00aMGSjZkPUJ99Cg@mail.gmail.com>
Message-ID: <CA+ALrx4QBZOpRe8CBZzgsrqpmV_5eb0tKh00aMGSjZkPUJ99Cg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c1e44a056cbb21d8"
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.tinylabs.io
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tinylabs.io
X-Get-Message-Sender-Via: server.tinylabs.io: authenticated_id:
	smtp@tinylabs.io
X-Authenticated-Sender: server.tinylabs.io: smtp@tinylabs.io
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 162.144.34.248
Subject: Re: [Qemu-arm] ARMv7-M MemManage vector trap
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iqpDdnnw5RNI

--000000000000c1e44a056cbb21d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry I misspoke. I still need the MM fault active since my handler does
some register patching necessary for normal operation. I just need to
disable gdb from breaking when entering the ISR.

On Mon, May 21, 2018 at 11:59 AM Elliot Buller <elliot@tinylabs.io> wrote:

> Hi Peter,
>
> Yes, the current setup is qemu gdbstub connected to a local gdb instance.
> My first thought was to disable the corresponding signal in gdb to preven=
t
> it from trapping on the MM fault ISR but had no luck there (always
> stopped). I think the current behavior is probably what most users would
> want so it=E2=80=99s probably not worth patching upstream. If you could p=
oint me to
> a quick and dirty patch to disable MM faults on armv7-m that would be
> greatly appreciated. I=E2=80=99ve been looking at the code for a few days=
 but
> haven=E2=80=99t made much progress...
> Thanks,
> Elliot
>
> On Mon, May 21, 2018 at 10:07 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On 21 May 2018 at 16:31, Elliot Buller <elliot@tinylabs.io> wrote:
>> > I'm working on a body of code that relies heavily on the MPU faulting
>> > mechanism on cortex-m processors. This makes debugging other aspects
>> > difficult as GDB often traps in MPU fault while single stepping.
>> >
>> > On a real target it appears I can mask this by setting bit 4 of DEMCR
>> (Debug
>> > Exception and Monitor Control Register). This looks to be unimplemente=
d
>> in
>> > QEMU. Does anyone have any ideas/guidance of where I should start
>> looking to
>> > add support or another mechanism for disabling GDB trapping this ISR
>> vector?
>>
>> Is this gdb connected to QEMU's gdb stub?
>>
>> DEMCR is part of the architectural support for halting debug. We
>> don't implement that, and our gdbstub doesn't work via halting
>> debug, so DEMCR is not what you're looking for.
>>
>> I think that gdb-triggered accesses shouldn't actually cause us to
>> generate
>> guest CPU exceptions (because the virt-to-phys calculation goes through
>> arm_cpu_get_phys_page_attrs_debug() and cpu_memory_rw_debug() rather tha=
n
>> the guest CPU's load/store codepaths). But it seems reasonable to me
>> that if the guest CPU can't read from an address then gdb reads should
>> also fail: this is how we handle it for other guest CPUs, I think.
>>
>> thanks
>> -- PMM
>>
> --
> Founder
> Tiny Labs - Small Space Big Ideas
> http://tinylabs.io
>
--=20
Founder
Tiny Labs - Small Space Big Ideas
http://tinylabs.io

--000000000000c1e44a056cbb21d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><div>Sorry I misspoke. I still need the MM fault active since my =
handler does some register patching necessary for normal operation. I just =
need to disable gdb from breaking when entering the ISR.</div></div></div><=
div><div><br><div class=3D"gmail_quote"><div>On Mon, May 21, 2018 at 11:59 =
AM Elliot Buller &lt;<a href=3D"mailto:elliot@tinylabs.io" target=3D"_blank=
">elliot@tinylabs.io</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div><div dir=3D"auto">Hi Peter,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yes, the current setup is qemu gdbstub connected to a local gdb i=
nstance. My first thought was to disable the corresponding signal in gdb to=
 prevent it from trapping on the MM fault ISR but had no luck there (always=
 stopped). I think the current behavior is probably what most users would w=
ant so it=E2=80=99s probably not worth patching upstream. If you could poin=
t me to a quick and dirty patch to disable MM faults on armv7-m that would =
be greatly appreciated. I=E2=80=99ve been looking at the code for a few day=
s but haven=E2=80=99t made much progress...</div><div dir=3D"auto">Thanks,<=
/div><div dir=3D"auto">Elliot</div></div><div><br><div class=3D"gmail_quote=
"><div>On Mon, May 21, 2018 at 10:07 AM Peter Maydell &lt;<a href=3D"mailto=
:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On 21 May 2018 at 16:31, =
Elliot Buller &lt;<a href=3D"mailto:elliot@tinylabs.io" target=3D"_blank">e=
lliot@tinylabs.io</a>&gt; wrote:<br>
&gt; I&#39;m working on a body of code that relies heavily on the MPU fault=
ing<br>
&gt; mechanism on cortex-m processors. This makes debugging other aspects<b=
r>
&gt; difficult as GDB often traps in MPU fault while single stepping.<br>
&gt;<br>
&gt; On a real target it appears I can mask this by setting bit 4 of DEMCR =
(Debug<br>
&gt; Exception and Monitor Control Register). This looks to be unimplemente=
d in<br>
&gt; QEMU. Does anyone have any ideas/guidance of where I should start look=
ing to<br>
&gt; add support or another mechanism for disabling GDB trapping this ISR v=
ector?<br>
<br>
Is this gdb connected to QEMU&#39;s gdb stub?<br>
<br>
DEMCR is part of the architectural support for halting debug. We<br>
don&#39;t implement that, and our gdbstub doesn&#39;t work via halting<br>
debug, so DEMCR is not what you&#39;re looking for.<br>
<br>
I think that gdb-triggered accesses shouldn&#39;t actually cause us to gene=
rate<br>
guest CPU exceptions (because the virt-to-phys calculation goes through<br>
arm_cpu_get_phys_page_attrs_debug() and cpu_memory_rw_debug() rather than<b=
r>
the guest CPU&#39;s load/store codepaths). But it seems reasonable to me<br=
>
that if the guest CPU can&#39;t read from an address then gdb reads should<=
br>
also fail: this is how we handle it for other guest CPUs, I think.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>-- <br><div class=3D"m_7751149763374373580m_-95465=
7706771113658gmail_signature" data-smartmail=3D"gmail_signature"><div><div>=
<div><div><div><div><div><div><font size=3D"2"><span style=3D"font-family:m=
onospace,monospace">Founder<br>Tiny Labs - Small Space Big Ideas<br></span>=
</font></div><div><font size=3D"2"><span style=3D"font-family:monospace,mon=
ospace"><a href=3D"http://tinylabs.io" target=3D"_blank">http://tinylabs.io=
</a><br></span></font></div><font size=3D"2"><span style=3D"font-family:mon=
ospace,monospace"></span></font></div></div></div></div></div></div></div><=
/div></blockquote></div></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div di=
r=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><fon=
t size=3D"2"><span style=3D"font-family:monospace,monospace">Founder<br>Tin=
y Labs - Small Space Big Ideas<br></span></font></div><div><font size=3D"2"=
><span style=3D"font-family:monospace,monospace"><a href=3D"http://tinylabs=
.io" target=3D"_blank">http://tinylabs.io</a><br></span></font></div><font =
size=3D"2"><span style=3D"font-family:monospace,monospace"></span></font></=
div></div></div></div></div></div></div></div>

--000000000000c1e44a056cbb21d8--
