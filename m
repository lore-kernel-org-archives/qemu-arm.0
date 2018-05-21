Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp547966wme;
        Mon, 21 May 2018 10:59:58 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq7/t0zeVkRw2Vz2GaGZ4mj+B77P8SBdBRrcmRgsrMdyN7Q0bfGg+r9y4DXLgznJPfWhdbo
X-Received: by 2002:a0c:d6c1:: with SMTP id l1-v6mr18424563qvi.45.1526925598571;
        Mon, 21 May 2018 10:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526925598; cv=none;
        d=google.com; s=arc-20160816;
        b=Md2eCe4qyW6OADn5tVhSPWjuZ05nDhfUbsRji+rJy9KW8H9c0GeFMFFObHTT3tlG1P
         flqjIXc5F9IsUO8QCh2zf3FpSbZOXP5iqaqNETP+5TefaBxoELUNQ9yq0TXkhJ0zCiM6
         lxtQZGi9w6/gLjdQPx6eEhWrm0kVtMSoplt/L5P1/2GaQccFDkhWlDsytR0XmjHds47b
         B1sZN1FhM7QbrP+5/hsvd/nm03cLlyYk9PxQDOLHYr3wHLcQiQvoi+/sE8bW3Zllp3s2
         SSi8wwbTrPPF2/m7sMrTl/EG7UZdit9rGECNQmiQ2WRbseJtdjyizxzdq2Ou7ScnueJi
         yLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=yY/LAF+evlMj6smCqJDrGOrDwnZrQpTGqSVcQLTlvGY=;
        b=qQXvssWVMJOfLptUqmqClD1WWEhCXcv1wWAiQb5JZYE42EvHtDso+mF0XVg3i54McX
         NaPIEiHwGk7rdlmI+bmi+erajmLosk67EewbeB4XTpxqTaaP7dbnlpzozGZD4peEv8BO
         uI2EOaFm2hGbLk46p6T6wBiZISiMivnZsRXWXpQNbz/t4dU2aMkLqgOuQNfW+Jgg/zPe
         0FDGoMY/0ifSFIi1G/z3B4ghs3HZ+Umv+xGZhqCm6Lknt8zxL6/G9eMIphA4izlO9/rJ
         T74fQIYapBcqpLQvIWU+HaqTZ4lcbn30b8PMz2qVEi1G4zRSdzzyddZw1yNoVTrqtLes
         4Rzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (invalid public key) header.i=@tinylabs.io header.s=default header.b=WHmSLu2z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7-v6si1182320qtk.187.2018.05.21.10.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 May 2018 10:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (invalid public key) header.i=@tinylabs.io header.s=default header.b=WHmSLu2z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fKp6E-0001qo-3x
	for alex.bennee@linaro.org; Mon, 21 May 2018 13:59:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <elliot@tinylabs.io>) id 1fKp64-0001os-8O
	for qemu-arm@nongnu.org; Mon, 21 May 2018 13:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <elliot@tinylabs.io>) id 1fKp60-0000dd-A7
	for qemu-arm@nongnu.org; Mon, 21 May 2018 13:59:48 -0400
Received: from server.tinylabs.io ([162.144.34.248]:34666)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <elliot@tinylabs.io>) id 1fKp5z-0000ZS-Tz
	for qemu-arm@nongnu.org; Mon, 21 May 2018 13:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tinylabs.io
	; s=default;
	h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yY/LAF+evlMj6smCqJDrGOrDwnZrQpTGqSVcQLTlvGY=;
	b=WHmSLu2z3TIAmU+megV/G5eMeG
	z7Kjg+uYGCu896BZP02lHYXYxfSJeestz+1JogDhoE4NBM+WWjLHiOYzYBaUQsUhFIMCqmHbBHWfT
	d5hGyp8GuG6hdM0dtxjWMaip0m9dgHMI39Ys7D8d2VAMkyliVZLNlQKnsE36ay2I+bmitXAHoXlSK
	a8XRA6oHV5ENI/+RqjFO+uxUkyY/imOgq1kJvK44Ofe1qQDWS7mcq1jIAKCwyMjPWTHzP0p2km2nQ
	v9DT0S6K3mDeZ+XjRLy4lc6DvsPUABUe3yjO/hoPniuffnG4RIRcVXB/lrZLkEWElgCL8I1XI8Pzb
	HWEytJAA==;
Received: from mail-lf0-f44.google.com ([209.85.215.44]:39839)
	by server.tinylabs.io with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
	(envelope-from <elliot@tinylabs.io>) id 1fKp5w-00025J-Bz
	for qemu-arm@nongnu.org; Mon, 21 May 2018 17:59:40 +0000
Received: by mail-lf0-f44.google.com with SMTP id j193-v6so25165687lfg.6
	for <qemu-arm@nongnu.org>; Mon, 21 May 2018 10:59:41 -0700 (PDT)
X-Gm-Message-State: ALKqPweWB+S4D8bQBTYW2cOz1509Q9UWNxSFt6saag2S9d0o+EJ0QMQz
	ikF1cilua3vDZPuVxA+Uou/HsF6GsDBjJ/NDBIo=
X-Received: by 2002:a2e:99cf:: with SMTP id
	l15-v6mr13338204ljj.148.1526925579936; 
	Mon, 21 May 2018 10:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+ALrx4bN1o=2oduB0uhs8acjVWOO0KYkduiP69ZZm54wP6fVw@mail.gmail.com>
	<CAFEAcA8hsrXXBp_KRxqjg5hj8L8Z3Pd5wNfbwnkxJqLJivFupQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8hsrXXBp_KRxqjg5hj8L8Z3Pd5wNfbwnkxJqLJivFupQ@mail.gmail.com>
From: Elliot Buller <elliot@tinylabs.io>
Date: Mon, 21 May 2018 11:59:28 -0600
X-Gmail-Original-Message-ID: <CA+ALrx6BmOyjH+v__TckKeDEyQefFZeQT9F=5BCHnY2tjqhmrQ@mail.gmail.com>
Message-ID: <CA+ALrx6BmOyjH+v__TckKeDEyQefFZeQT9F=5BCHnY2tjqhmrQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ca74e0056cbb10ec"
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
X-TUID: sBbpUHkGLUnN

--000000000000ca74e0056cbb10ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Yes, the current setup is qemu gdbstub connected to a local gdb instance.
My first thought was to disable the corresponding signal in gdb to prevent
it from trapping on the MM fault ISR but had no luck there (always
stopped). I think the current behavior is probably what most users would
want so it=E2=80=99s probably not worth patching upstream. If you could poi=
nt me to
a quick and dirty patch to disable MM faults on armv7-m that would be
greatly appreciated. I=E2=80=99ve been looking at the code for a few days b=
ut
haven=E2=80=99t made much progress...
Thanks,
Elliot

On Mon, May 21, 2018 at 10:07 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 21 May 2018 at 16:31, Elliot Buller <elliot@tinylabs.io> wrote:
> > I'm working on a body of code that relies heavily on the MPU faulting
> > mechanism on cortex-m processors. This makes debugging other aspects
> > difficult as GDB often traps in MPU fault while single stepping.
> >
> > On a real target it appears I can mask this by setting bit 4 of DEMCR
> (Debug
> > Exception and Monitor Control Register). This looks to be unimplemented
> in
> > QEMU. Does anyone have any ideas/guidance of where I should start
> looking to
> > add support or another mechanism for disabling GDB trapping this ISR
> vector?
>
> Is this gdb connected to QEMU's gdb stub?
>
> DEMCR is part of the architectural support for halting debug. We
> don't implement that, and our gdbstub doesn't work via halting
> debug, so DEMCR is not what you're looking for.
>
> I think that gdb-triggered accesses shouldn't actually cause us to genera=
te
> guest CPU exceptions (because the virt-to-phys calculation goes through
> arm_cpu_get_phys_page_attrs_debug() and cpu_memory_rw_debug() rather than
> the guest CPU's load/store codepaths). But it seems reasonable to me
> that if the guest CPU can't read from an address then gdb reads should
> also fail: this is how we handle it for other guest CPUs, I think.
>
> thanks
> -- PMM
>
--=20
Founder
Tiny Labs - Small Space Big Ideas
http://tinylabs.io

--000000000000ca74e0056cbb10ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hi Peter,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yes, the current setup is qemu gdbstub connected to a local gdb i=
nstance. My first thought was to disable the corresponding signal in gdb to=
 prevent it from trapping on the MM fault ISR but had no luck there (always=
 stopped). I think the current behavior is probably what most users would w=
ant so it=E2=80=99s probably not worth patching upstream. If you could poin=
t me to a quick and dirty patch to disable MM faults on armv7-m that would =
be greatly appreciated. I=E2=80=99ve been looking at the code for a few day=
s but haven=E2=80=99t made much progress...</div><div dir=3D"auto">Thanks,<=
/div><div dir=3D"auto">Elliot</div><br><div class=3D"gmail_quote"><div>On M=
on, May 21, 2018 at 10:07 AM Peter Maydell &lt;<a href=3D"mailto:peter.mayd=
ell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On 21 May 2018 at 16:31, Elliot Buller &lt;<a href=3D"=
mailto:elliot@tinylabs.io" target=3D"_blank">elliot@tinylabs.io</a>&gt; wro=
te:<br>
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
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><font size=3D"2=
"><span style=3D"font-family:monospace,monospace">Founder<br>Tiny Labs - Sm=
all Space Big Ideas<br></span></font></div><div><font size=3D"2"><span styl=
e=3D"font-family:monospace,monospace"><a href=3D"http://tinylabs.io" target=
=3D"_blank">http://tinylabs.io</a><br></span></font></div><font size=3D"2">=
<span style=3D"font-family:monospace,monospace"></span></font></div></div><=
/div></div></div></div></div></div>

--000000000000ca74e0056cbb10ec--
