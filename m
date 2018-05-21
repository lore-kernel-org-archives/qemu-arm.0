Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp689301wme;
        Mon, 21 May 2018 13:41:26 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqLw8Jl862OzJ/Jx/iQ4pL8upcdjoxNDif6dNBk9thXgRwwtfOiLvyX3tMD8EToNZOcWVxq
X-Received: by 2002:a37:6cc6:: with SMTP id h189-v6mr18623232qkc.2.1526935286426;
        Mon, 21 May 2018 13:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526935286; cv=none;
        d=google.com; s=arc-20160816;
        b=BNsZf2lrwITooEFqr7lrcoY6IgMNIXMbHJ/8IQ1X/n3kbQOsSBF3Ffeley/k9R8OxN
         tyTguMHiR4EXABYmBz0LPGAeWcNVxjORQBZBaHtmFPtu51GbnXvjWAsFAnGzwW4SZSC/
         5Myk/EBmapDgIFd6CVIrdvDYfVA3FJbQ1IF+y2sspyvzN4ij24s+LsTIX3ZqnX8WHP8A
         JyxXJjK1mVzCOaeNmoqBLEDrmICAjc0l7LnKvaxMiuWTg1kukIXVOC/g1litQIh87qMK
         33cizLv3kNLrSsmERPRJkgDLYNuWEROtR+GZlR1tfGWIsZRdwbxbS1xK7CjBEPnOw2G/
         Jvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=y0/8D0eej0fpExiJuGZSMRXCQUniSOiSs1uEvIma2fg=;
        b=UQmDuzRl54VZgxe+4zn0UgPEAwDXjBZfw2iPhbJfKs8XxExjWKgN0Q6Zl2oE2gN0jo
         CeSsSmL6XDX3Qkk5MWFTDFQL73drRaxWKKquTGSmk6ho6tUbVRM64fUOnEU16o+blrBs
         pYqyEQCHyhpNsLydoTDG7uutqE3+QxZPVb1jz0IST22iLNg9+UsToUT5a/I44vKLvW5S
         HAE9cG1qdDf3Z1E9hJ8wjCPu45ef60FZsHSo+H6pZ0vM9x58NPg1v38QbGIitjDAsFLF
         uz8bYi0OzO7jpWWFkg4wDtENv/rajpSTqjjwqqQp2lD5MKAZMbsFlybTqTrjnit3G34s
         jrPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (invalid public key) header.i=@tinylabs.io header.s=default header.b=cs92lI/x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i189-v6si1037802qkd.225.2018.05.21.13.41.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 May 2018 13:41:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (invalid public key) header.i=@tinylabs.io header.s=default header.b=cs92lI/x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fKrcT-0006RJ-V0
	for alex.bennee@linaro.org; Mon, 21 May 2018 16:41:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <elliot@tinylabs.io>) id 1fKrcM-0006RC-TX
	for qemu-arm@nongnu.org; Mon, 21 May 2018 16:41:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <elliot@tinylabs.io>) id 1fKrcI-0000RO-Tn
	for qemu-arm@nongnu.org; Mon, 21 May 2018 16:41:18 -0400
Received: from server.tinylabs.io ([162.144.34.248]:35560)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <elliot@tinylabs.io>) id 1fKrcI-0000Qe-Jn
	for qemu-arm@nongnu.org; Mon, 21 May 2018 16:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tinylabs.io
	; s=default;
	h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:
	In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=y0/8D0eej0fpExiJuGZSMRXCQUniSOiSs1uEvIma2fg=;
	b=cs92lI/xe9pOMX6ZmsOoYzcJ/a
	TOiUT40umRlISXpqwr2Fr71cSw3UIuJYsPeXixFUompj4gXKz4cRrmGEHULoj4d+9gGN4JBTEIw62
	MJlopVXltGVSUmbCEfS2UUU5oKv5yD6pJkDs7gqIZ5u6Nr9AN8n96tP6G6RRyAb60MUiQy6qwK3sr
	LedqY9TZQBxhzfvZdmloHDzljB5r+RGA3x5d9mwm+Srfw7G2wBMZPtqgei3ofSjK6uSJI5cpzS5kf
	69dnUUTAyoFT83XXNkR+FGQug8jKksMJ/ww72D5YO4RxAbhIdBy8BNje/sBn4TTCnrgznvcffXPJN
	cDL/qXYA==;
Received: from mail-lf0-f47.google.com ([209.85.215.47]:38395)
	by server.tinylabs.io with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
	(envelope-from <elliot@tinylabs.io>) id 1fKrcE-0003HT-GO
	for qemu-arm@nongnu.org; Mon, 21 May 2018 20:41:10 +0000
Received: by mail-lf0-f47.google.com with SMTP id z142-v6so25817012lff.5
	for <qemu-arm@nongnu.org>; Mon, 21 May 2018 13:41:11 -0700 (PDT)
X-Gm-Message-State: ALKqPweJ69vBg8iIZVKpUeJV9AoY/wVTXPckeuhML8vBzIqu3mIKVpyv
	ZfSQ1BDt/726rf9tfcVVtdHS9xfRNnVhLNzsHjI=
X-Received: by 2002:a19:9389:: with SMTP id
	w9-v6mr29527925lfk.75.1526935269948; 
	Mon, 21 May 2018 13:41:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.179.0.104 with HTTP; Mon, 21 May 2018 13:41:09 -0700 (PDT)
In-Reply-To: <CAFEAcA9r8XgxPGhqHoECVnp62wVm717Ux67N7_yn85MJT6Cqrw@mail.gmail.com>
References: <CA+ALrx4bN1o=2oduB0uhs8acjVWOO0KYkduiP69ZZm54wP6fVw@mail.gmail.com>
	<CAFEAcA8hsrXXBp_KRxqjg5hj8L8Z3Pd5wNfbwnkxJqLJivFupQ@mail.gmail.com>
	<CA+ALrx6BmOyjH+v__TckKeDEyQefFZeQT9F=5BCHnY2tjqhmrQ@mail.gmail.com>
	<CA+ALrx4QBZOpRe8CBZzgsrqpmV_5eb0tKh00aMGSjZkPUJ99Cg@mail.gmail.com>
	<CAFEAcA9r8XgxPGhqHoECVnp62wVm717Ux67N7_yn85MJT6Cqrw@mail.gmail.com>
From: Elliot Buller <elliot@tinylabs.io>
Date: Mon, 21 May 2018 13:41:09 -0700
X-Gmail-Original-Message-ID: <CA+ALrx4n2Wqrp0hMOCiVJG2OaPp+uQ9GsZXp9N5U2Od==+JLEg@mail.gmail.com>
Message-ID: <CA+ALrx4n2Wqrp0hMOCiVJG2OaPp+uQ9GsZXp9N5U2Od==+JLEg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005c45b5056cbd527c"
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
X-TUID: ZVuxhBdhJJP7

--0000000000005c45b5056cbd527c
Content-Type: text/plain; charset="UTF-8"

Ok, thanks for the clarification. It's definitely breaking on the MPUFault
ISR when I try and single step over an instruction that causes a fault.
I'll debug on the GDB side to see why this is.
Best,
Elliot

On Mon, May 21, 2018 at 11:14 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 21 May 2018 at 19:04, Elliot Buller <elliot@tinylabs.io> wrote:
> > Sorry I misspoke. I still need the MM fault active since my handler does
> > some register patching necessary for normal operation. I just need to
> > disable gdb from breaking when entering the ISR.
>
> I don't think gdb will break by default when the guest enters
> an exception handler, unless you ask it to. So I'm not entirely
> sure what you're after here.
>
> thanks
> -- PMM
>



-- 
Founder
Tiny Labs - Small Space Big Ideas
http://tinylabs.io

--0000000000005c45b5056cbd527c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Ok, thanks for the clarification. It&#39;s def=
initely breaking on the MPUFault ISR when I try and single step over an ins=
truction that causes a fault. I&#39;ll debug on the GDB side to see why thi=
s is.</div><div class=3D"gmail_default" style=3D"font-family:monospace,mono=
space;font-size:small">Best,</div><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace;font-size:small">Elliot<br></div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, May 21, 2018 at =
11:14 AM, Peter Maydell <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.mayde=
ll@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 21 May 2018 at 1=
9:04, Elliot Buller &lt;<a href=3D"mailto:elliot@tinylabs.io">elliot@tinyla=
bs.io</a>&gt; wrote:<br>
&gt; Sorry I misspoke. I still need the MM fault active since my handler do=
es<br>
&gt; some register patching necessary for normal operation. I just need to<=
br>
&gt; disable gdb from breaking when entering the ISR.<br>
<br>
</span>I don&#39;t think gdb will break by default when the guest enters<br=
>
an exception handler, unless you ask it to. So I&#39;m not entirely<br>
sure what you&#39;re after here.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><font=
 size=3D"2"><span style=3D"font-family:monospace,monospace">Founder<br>Tiny=
 Labs - Small Space Big Ideas<br></span></font></div><div><font size=3D"2">=
<span style=3D"font-family:monospace,monospace"><a href=3D"http://tinylabs.=
io" target=3D"_blank">http://tinylabs.io</a><br></span></font></div><font s=
ize=3D"2"><span style=3D"font-family:monospace,monospace"></span></font></d=
iv></div></div></div></div></div></div></div>
</div>

--0000000000005c45b5056cbd527c--
