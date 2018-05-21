Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp428425wme;
        Mon, 21 May 2018 08:56:53 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpU/XD0YBdbCVv3RNBQCCaNoif/khxH0iCg959bNAHkvjoZg+20KoPkJEQ3BVq7s1WkTMV/
X-Received: by 2002:a37:8641:: with SMTP id i62-v6mr17732481qkd.192.1526918213360;
        Mon, 21 May 2018 08:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526918213; cv=none;
        d=google.com; s=arc-20160816;
        b=zxO+r0BSG+LjREb57NHyEAl43LAQ0UsNGGK8nklLKBBHf7uVoWh7665HtsjIHCOX4I
         laRPvz/4dFGxO8kRJwtS0vowtZLCY18Tzv/gSy61Xnb11H9bg4rZarSXjVB/nPTlbqHG
         DbopL7K+9SBEhk+OASoIh8uqE+RVJ8h7Yh9Nl0v1TUrgRk0aHnfQ+iS2rsdvVtyvmGr2
         ONdHhRHu1ES3OUrhvthoes7fDiNBewtX/yGzE+ryMNejpREh5mc7lTcS7jyw5ot/6dhR
         VOOZEo7kDCoEX6Dden42416DBQzyXHgY/6Hxw8oIwDJ76ZDg3PEmhN0sF6gqaPfneoWF
         vf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=bbdqflJwK1qYrhxRRZOW8+2ZQlEeRzNdL96EXhttBZY=;
        b=jVoweeoU26U6BO9kCoZpQRaNuuBsdRqsZMuxgiDrlb5esNBa003U2oO0A1RM6yPoI+
         xdt1ayHRLKFTJgTgFsmSgfWdQbc5rM+Y2ncXn0Q/UyeUNMJCdCJdfdafT9qip2kOL5jj
         3jdiAu8ETDp6Bm9zijKCHq2C3TrkaxE3GvMjJE7l+NHavpRmeSSnItApK8K173GUvr9B
         1Ke8jSTQQ89MNI0QaedENs1lH8Njb6800YG/67s+SRzWLRPrmEmL5/3Cm3YntqVpo52c
         mmnEFgcQVIT/XRRT2DrmD4f88JPhr8Q6kWgNgEaqOyxyOF1nBVenqxlZkAZZvPACCgeZ
         Jw/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (invalid public key) header.i=@tinylabs.io header.s=default header.b=L4uehMBU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11-v6si3437852qtg.81.2018.05.21.08.56.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 May 2018 08:56:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (invalid public key) header.i=@tinylabs.io header.s=default header.b=L4uehMBU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fKnB6-0006j6-Sx
	for alex.bennee@linaro.org; Mon, 21 May 2018 11:56:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <elliot@tinylabs.io>) id 1fKmmv-00081W-Hg
	for qemu-arm@nongnu.org; Mon, 21 May 2018 11:31:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <elliot@tinylabs.io>) id 1fKmms-0002w6-Em
	for qemu-arm@nongnu.org; Mon, 21 May 2018 11:31:53 -0400
Received: from server.tinylabs.io ([162.144.34.248]:34068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <elliot@tinylabs.io>) id 1fKmms-0002My-4r
	for qemu-arm@nongnu.org; Mon, 21 May 2018 11:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tinylabs.io
	; s=default;
	h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bbdqflJwK1qYrhxRRZOW8+2ZQlEeRzNdL96EXhttBZY=;
	b=L4uehMBUI0pv6MEB+CF8VQzM5o
	Bw5nubODUZIPznt23zuE9Siq+Ebmc2MH8TsnSLWnsiYoJXTUfgWfuXL8OrLT4wCwD5auIwarfOQh3
	fydjnMUUbJV8SdPkaE5fImAMY2Cfvs4VPnPltlRBhF/Y/t4TutN7QRQncW7kTbIt0+uvBodRdfcsy
	sw7yQyXrM1mbd2Kmo/5y3pRIptux5gq6qT4qr2qcby9QPLctCXnOxEOpxR7y7xGfbNLUpi7n9m8xZ
	GdQ78NGYkOzGY4LaCge07bA9NDz6pyPvIlF0gvWbw/GhvV1OeZRnlyhXXLSgAos+Gt9vgSO97DAfe
	WEEp2d3w==;
Received: from mail-lf0-f54.google.com ([209.85.215.54]:36452)
	by server.tinylabs.io with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
	(envelope-from <elliot@tinylabs.io>) id 1fKmm7-0000t3-Qn
	for qemu-arm@nongnu.org; Mon, 21 May 2018 15:31:04 +0000
Received: by mail-lf0-f54.google.com with SMTP id e9-v6so7602502lfb.3
	for <qemu-arm@nongnu.org>; Mon, 21 May 2018 08:31:04 -0700 (PDT)
X-Gm-Message-State: ALKqPwc8ZDCKkzL/NMwh6VvEA/A0Pw89Tlq4B+0iQhi74hQW3Hex5Z1Z
	2yjg/lBxFSVq83cl0o48Y74dKJelIIFfSn2Nrrs=
X-Received: by 2002:a2e:700c:: with SMTP id
	l12-v6mr12959245ljc.68.1526916663464; 
	Mon, 21 May 2018 08:31:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.179.0.104 with HTTP; Mon, 21 May 2018 08:31:02 -0700 (PDT)
From: Elliot Buller <elliot@tinylabs.io>
Date: Mon, 21 May 2018 08:31:02 -0700
X-Gmail-Original-Message-ID: <CA+ALrx4bN1o=2oduB0uhs8acjVWOO0KYkduiP69ZZm54wP6fVw@mail.gmail.com>
Message-ID: <CA+ALrx4bN1o=2oduB0uhs8acjVWOO0KYkduiP69ZZm54wP6fVw@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000053dcdb056cb8fd32"
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
X-Mailman-Approved-At: Mon, 21 May 2018 11:56:42 -0400
Subject: [Qemu-arm] ARMv7-M MemManage vector trap
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7qOQSA+KUmXF

--00000000000053dcdb056cb8fd32
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm working on a body of code that relies heavily on the MPU faulting
mechanism on cortex-m processors. This makes debugging other aspects
difficult as GDB often traps in MPU fault while single stepping.

On a real target it appears I can mask this by setting bit 4 of DEMCR
(Debug Exception and Monitor Control Register). This looks to be
unimplemented in QEMU. Does anyone have any ideas/guidance of where I
should start looking to add support or another mechanism for disabling GDB
trapping this ISR vector?

Thanks,
Elliot

-- 
Founder
Tiny Labs - Small Space Big Ideas
http://tinylabs.io

--00000000000053dcdb056cb8fd32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hello,<br><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:monospace,monospace;font-size:small">I&#39;m workin=
g on a body of code that relies heavily on the MPU faulting mechanism on co=
rtex-m processors. This makes debugging other aspects difficult as GDB ofte=
n traps in MPU fault while single stepping. <br><br>On a real target it app=
ears I can mask this by setting bit 4 of DEMCR (Debug Exception and Monitor=
 Control Register). This looks to be unimplemented in QEMU. Does anyone hav=
e any ideas/guidance of where I should start looking to add support or anot=
her mechanism for disabling GDB trapping this ISR vector?<br><br></div><div=
 class=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size=
:small">Thanks,<br></div><div class=3D"gmail_default" style=3D"font-family:=
monospace,monospace;font-size:small">Elliot<br clear=3D"all"></div><br>-- <=
br><div class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><font size=3D"2"=
><span style=3D"font-family:monospace,monospace">Founder<br>Tiny Labs - Sma=
ll Space Big Ideas<br></span></font></div><div><font size=3D"2"><span style=
=3D"font-family:monospace,monospace"><a href=3D"http://tinylabs.io" target=
=3D"_blank">http://tinylabs.io</a><br></span></font></div><font size=3D"2">=
<span style=3D"font-family:monospace,monospace"></span></font></div></div><=
/div></div></div></div></div></div>
</div>

--00000000000053dcdb056cb8fd32--
