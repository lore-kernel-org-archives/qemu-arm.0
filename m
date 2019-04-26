Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp893794wrh;
        Fri, 26 Apr 2019 11:20:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNAxAEIUEa1y3iUoMcJhwIx/osaNEnLdDMQ/uxYuFaXG1N6L2ijl97Y3a0m3V6mevlHgCc
X-Received: by 2002:a5d:6386:: with SMTP id p6mr10018448wru.306.1556302823064;
        Fri, 26 Apr 2019 11:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556302823; cv=none;
        d=google.com; s=arc-20160816;
        b=M4hGdl/EpVXrIbBoV9fE2Cbp853jtUUwf/eQVdeOTaSfHPoexud6Q93oUejAH1iSJl
         XUfyhs2Cd5sC+1d8Nwt1k5IJ7P2Do9KS/qic0y0+Ak2zTTPeX/+G0lQc5npcy6tNttZh
         lSkgJqHhshYNYTDtE3xVD+mFtQ6HBiQomyX84nwATpK8+iFJGrXqo2UIpFYP2wLkfqBJ
         /dVJpmI3fYGRksuAFgST//4gEEn9O8XzOigNqowVv2kGc5Mjclu5YxNKhB6gV5kBRoCF
         bDFFpk5P20Js5S6uzVje7CTP9zsNX/AflA+d55zzSS75POsAvpsWtYq3HpLOgKmw6nW9
         6OJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :sensitivity:importance:date:to:from:message-id:mime-version
         :dkim-signature;
        bh=EJrbwx88PcHaRiAoZ/3/TlwmqMHkDJkjC5ZO/Bzg9Dk=;
        b=v7xjZxEJe184SZ1OMzKnBvobz2G6GPYmDrHIZ0orTvBbUjEqJOHJXPIbQ6RgEVgLq+
         8D1P9sTzVcO5ANChcSud9rBfa7dJNrg7ypfn9kkUqhbnHk+QL0cCHFJYipaz22fRXPI0
         PPz5bbQfljrzkJH2yQp8a4KQ+VBUU8cXbfF/kvrcPrTgFE6Ez3sxecwItTBhMuk6ntkS
         78PbeHuDWF1+7sYOL4o5qV+Uo2WDuKVgkmhhZ1n8lFbwzb7w5/66ocIULWsQSs5WCAcn
         D071TVG28wMozjSSClNUIcrppg4gA+5qSzpfHeOM39Ls9tZkJZ6Fw1TLDBY9N2j7rMW+
         btXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=pEuzu33q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si6379931wmc.194.2019.04.26.11.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Apr 2019 11:20:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=pEuzu33q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:50512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hK5SQ-00059m-6e
	for alex.bennee@linaro.org; Fri, 26 Apr 2019 14:20:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bjoern.M.Haase@web.de>) id 1hK5SE-000598-VS
	for qemu-arm@nongnu.org; Fri, 26 Apr 2019 14:20:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bjoern.M.Haase@web.de>) id 1hK5SD-0004cx-Vy
	for qemu-arm@nongnu.org; Fri, 26 Apr 2019 14:20:10 -0400
Received: from mout.web.de ([212.227.17.11]:40873)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <Bjoern.M.Haase@web.de>)
	id 1hK5SD-0004b2-JC
	for qemu-arm@nongnu.org; Fri, 26 Apr 2019 14:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1556302805;
	bh=EJrbwx88PcHaRiAoZ/3/TlwmqMHkDJkjC5ZO/Bzg9Dk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pEuzu33qA6drly/o1T9jB2WE2+GgQ0uyNcowAnG7Qm1ev/7Omgw4iVbJgGoKNBjvr
	Y7loPeGcx7z0jddmnv3+Ps4DglHBQ8zZqM+06Ov5eAz5AA45xP5aculG1u+RBDuymD
	EasuTBK1VMSk91SJg+rbaPHm4xSo2s+nid0tvYC0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [109.90.240.132] ([109.90.240.132]) by web-mail.web.de
	(3c-app-webde-bap58.server.lan [172.19.172.145]) (via HTTP); Fri, 26 Apr
	2019 20:20:05 +0200
MIME-Version: 1.0
Message-ID: <trinity-d1a9db92-6382-4db0-bbdd-1732d86106f3-1556302805332@3c-app-webde-bap58>
From: =?UTF-8?Q?=22Bj=C3=B6rn_Haase=22?= <Bjoern.M.Haase@web.de>
To: "Peter Maydell" <peter.maydell@linaro.org>
Content-Type: text/html; charset=UTF-8
Date: Fri, 26 Apr 2019 20:20:05 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAFEAcA_bS_Oz+shCU1U5rN_DMP9_osQXXmh470OP1r-9GQ4=ag@mail.gmail.com>
References: <trinity-1f7e0bc4-e787-4b8e-9ba2-9e458d88c7ca-1556216041544@3c-app-webde-bs13>
	<CAFEAcA_bS_Oz+shCU1U5rN_DMP9_osQXXmh470OP1r-9GQ4=ag@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:HkEk69s+LWWC0w2xGSchGT8JTtLGR7U3DIf65qLLIgJlcyDXENXV7LbcflQVrj0ivt88c
	41zsQDfR5jcRBSAUn2ykrWcNdpl5xW+lE60StLmmbRumSZ1rx4Ov10pthoWtArKcAdyMPV3ts3oo
	kLXMYjnBOPOUxL5TTCFNiFarD4q2pXmuiEotIbthF3aoaDp5hHmndavpro8uIvnSi2ZW9Nvc+Gop
	LwM25Oj1ux7plYcl5HGh3Kt2GqyMib9hNtUDJ1ysJGTekigrljf7hJeoou58/vcTLv5Fg+WiK7hM
	ek=
X-UI-Out-Filterresults: notjunk:1;V03:K0:VxO1vNu2bGU=:Ftc93xNqLM2USTnqi40+1j
	jVVeucU5Wc7FqDWoiNIKUobTqIrKXZx5OXalaUaDIQlCiD4kyr2UTfEvlxXkLf7Eqy1BhVzWj
	dl2AzHHlycRZuelxtxHm341ABwqO/0W1292P4KnDnjnAJgFjyIsQ/W8UQJHnI+V0XudK47nbT
	TpB+I79o7eCSw5iCGGJb8cqAMImjVmn4LZERk5Oste5aGoyICO/ToLJbZFKa+8XTtwEzqC/7g
	dQkjeS1yX0J/htozGYT9thsb/KLA1RNDyITIaustGs0/qebqUkMYDo31hiZrEX7HX2BSVzjI0
	J50C6Ru4tRd7Yy2d0mY0CHksrhgZbgCoMAGdBZQxhGKcCSjr/3Gj83zAb3cHO7JZml4PgkADP
	m5cb3nm0zjY+ccBl+CIcYQO4wwHsi31MtV4yR4h3YB4dSAV2KdP3Z/GGCPhU4VQDRRiYOPSS2
	fEFKmAnG8sl/yzv4bb2Px/mkpx0P9dKAve8QgZx7B9y9Ak9IcwkoAEaBaWHHO5sDywj2nFXuP
	/g/adTc79bs31Ndu7i2mMiU0yuWxyjy4ysdNcYUgXtz620D+pFSJxAvGEHkkM0sWHhkG4oz9S
	gtIed/ZHbVYgKguTNCpqWDzPGHyLoK5f1nNz4ERQQ8YA6PbRXL76kzkQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.11
Subject: Re: [Qemu-arm] Regression tests for Assembly libraries for
 Cortex-M: More recent qemu versions core-dump or fail with warnings
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
X-TUID: 0LpFCseuxitb

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>&nbsp;
<div>
<div>Thank you peter for your helpful reply!</div>

<div>&nbsp;</div>

<div>
<div name="quoted-content">Maybe I could make some effort of trying to boil down the testsuite code to 16 MByte of memory and use a linker script for one of the larger Cortex-M3 sytems.</div>

<div name="quoted-content">&nbsp;</div>
</div>

<div>
<div name="quoted-content">&gt;&gt; Also I believe that semihosting will not be supported on any of the native cortex-m machines? Any advice would be very appreciated.<br/>
&gt;<br/>
&gt;All the cortex-m systems support semihosting. (Note<br/>
&gt;that the ABI for M-profile semihosting is not quite<br/>
&gt;the same as the A-profile ABI -- it uses a breakpoint<br/>
&gt;insn, rather than an SVC insn.) You need to enable<br/>
&gt;it with the -semihosting option, and you can&#39;t use<br/>
&gt;it from non-privileged code (this is the same as the<br/>
&gt;A-profile semihosting).</div>

<div name="quoted-content">&nbsp;</div>

<div>You don&#39;t actually know whether someby has actually used this together with the syscall implementations in newlib/libgloss? I somehow fear that my older implementation only did work because it was using the SWI interface ...&nbsp; However, I have seen that libgloss seems to provide different versions of the &quot;Angel&quot; interface. One of these also seems to use a breakpoint instruction.</div>

<div>&nbsp;</div>

<div>Do you know of any publicly available target project that actually uses semihosting on a Cortex-M? This might be a good starting point for analysis.</div>
</div>

<div>&nbsp;</div>

<div>Thanks again for your advice!</div>
&nbsp;

<div>Yours,</div>

<div>&nbsp;</div>

<div>Bj&ouml;rn.</div>
</div>
</div></div></body></html>
