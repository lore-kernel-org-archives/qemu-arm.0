Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1971848wrh;
        Sat, 27 Apr 2019 13:44:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyWzCnLFi295gvyYrMkma3UgPWQG5QAwHVpCFHQBoipwvVW2Mgt5Zq5ZA2pH4+weUjNoPGJ
X-Received: by 2002:a1c:f910:: with SMTP id x16mr3581326wmh.122.1556397878903;
        Sat, 27 Apr 2019 13:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556397878; cv=none;
        d=google.com; s=arc-20160816;
        b=oohOJMghaBgrNMVqyzNX+pGtiXBqdIRPsjJbFGws+rBQlQDczRflpMUtXwdCWNlIz/
         MK4cci8Zwgds3Yr8b+5S+h1Y/S8N9EAC42k8TygJiHh4r5JyKzKF0KU8OSGhqaVKWR3Z
         C0YcqLxm8L1Gs+HslWgkh6b3KR53Yo5XRXM7TQF2QhnJWLzw+Q7eYFTZMt/CJYeuHPlj
         6YN15w8HV2izaV4zDXFq6ArQ/NfAiRNjMDH5mVjhqEHKYET9o2wgmWzGVXfK1vYph0FZ
         HQ0cvlds4XVa0CGj0FTGeKfugR+JIpDTUtold4Ag3JTmTDVy83ZMKjjOwiDkHORRymc6
         WXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=+A9b0bBCVUvDKDyKIqjZGszuRSITl+SksedlqW2/pfw=;
        b=cCT6cWpVPdQnQ4E6adB6QI7Euu44B5k420Z1b4nM1s91HsbFwj5fFNsJH7xRAztZZJ
         HEWasBiQdmFpwSPIjfxxn6V0SCUk2ZNBz5r2Eu1zpcdH+kp5629JQDrRbGSfUPq8/vv+
         Ickk3t5tf38Xdw15HTg2zfRqFOLhXSC5+YPUi2teNSjmZ3WEUF8CuSJeL5n2EwKTTifR
         CDn/pWL+WnnnjuyQ713NFdmAbJ/bSg9mNVD7erALckkvGkbL4fJxMCSkgi9YYb1rXV+V
         VrZxfqizMbPCKhnOo7jF/ZrnsEsoiRwIVrd/SyCLJsMnEfSrDPyFBUjbU1VbRLvwivCs
         hJVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQdeCj55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si19751147wmf.77.2019.04.27.13.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Apr 2019 13:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQdeCj55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hKUBa-0004UJ-2g
	for alex.bennee@linaro.org; Sat, 27 Apr 2019 16:44:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hKUBQ-0004Sf-15
	for qemu-arm@nongnu.org; Sat, 27 Apr 2019 16:44:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hKU8k-0004Sm-Kp
	for qemu-arm@nongnu.org; Sat, 27 Apr 2019 16:41:44 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:45807)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hKU8k-0004NG-D1
	for qemu-arm@nongnu.org; Sat, 27 Apr 2019 16:41:42 -0400
Received: by mail-oi1-x230.google.com with SMTP id t189so2554805oih.12
	for <qemu-arm@nongnu.org>; Sat, 27 Apr 2019 13:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+A9b0bBCVUvDKDyKIqjZGszuRSITl+SksedlqW2/pfw=;
	b=qQdeCj55VhkFhIyJxk2kUfAwNQbou4/AO7tLPcKslVTXpo8LPxZJB4oHFaAXtEpYWy
	7B8ZuX2S/vLS5s/NS+etPcn8e5QhI3mwFV4nWUH5UU0jLAHAGxLZPcnMOEOZvL92pbbg
	z10mZEfSGg7j5aT9+p+bWFOniExgxJ68oeBPhwMAF/bVEAs8Nbjv4XTg0rVoY8AfB7JC
	qzIjVCql7nuJeM3BQ/fnAZNnAY/VpTV7kblykHfsywkHsomMVkAfZy+EincPC0Ex/X5b
	GLuuDOie05fy2R3j6f9Uo/iaTIL7xpppqjo6TM8CtN57XHrusPd0nYJyRu/ITrT97QRD
	XThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+A9b0bBCVUvDKDyKIqjZGszuRSITl+SksedlqW2/pfw=;
	b=iFeiNMjVanhfMFKg2KCRt8BoJM/H9XwXHsVtMdfARRjhFvmYSGLu/fag7xeWr6hwtU
	Qj52/vGynT8tl+VZbg02i0dwmOwjxJVwk8OhUAxiF73E9UVWfiE5bjRQGrzqEWVabVrG
	hB1BR25AOvoUEd5N8oiZ0S1SHxN/E2N6NqzNt/O5gBz0xfZ0wdVc3P12Vt8DQvj8+wNC
	lMDqhQ37osOVxWdskeOWJ54VZRp/yO7/lBdmYg2ZyVHuymqxJCsukWWp0TSeOpt1zIZI
	zGAItai1Zf5rHo62iXoSFha+HecXYJcY+UzKklSwb2CLW/o/qQoLh6w5FArO3MgQUeFR
	hqfg==
X-Gm-Message-State: APjAAAXgNq432autIKh5qXh3s2RZFkXy6OvDibqR470VE9646YIxjkOe
	kV5xkRcA1NAdI40vVt0Q/nEdYnB00HMXJTb34x/dVA==
X-Received: by 2002:aca:e054:: with SMTP id x81mr11045123oig.146.1556397692607;
	Sat, 27 Apr 2019 13:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-1f7e0bc4-e787-4b8e-9ba2-9e458d88c7ca-1556216041544@3c-app-webde-bs13>
	<CAFEAcA_bS_Oz+shCU1U5rN_DMP9_osQXXmh470OP1r-9GQ4=ag@mail.gmail.com>
	<trinity-d1a9db92-6382-4db0-bbdd-1732d86106f3-1556302805332@3c-app-webde-bap58>
In-Reply-To: <trinity-d1a9db92-6382-4db0-bbdd-1732d86106f3-1556302805332@3c-app-webde-bap58>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 27 Apr 2019 21:41:21 +0100
Message-ID: <CAFEAcA9F7y3C_04FjPtthf-0BA+HQKpHESN15h7pE7CUvVO6Zg@mail.gmail.com>
To: =?UTF-8?B?QmrDtnJuIEhhYXNl?= <Bjoern.M.Haase@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::230
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
X-TUID: kqi4t39v0aKP

On Fri, 26 Apr 2019 at 19:20, "Bj=C3=B6rn Haase" <Bjoern.M.Haase@web.de> wr=
ote:

> >All the cortex-m systems support semihosting. (Note
> >that the ABI for M-profile semihosting is not quite
> >the same as the A-profile ABI -- it uses a breakpoint
> >insn, rather than an SVC insn.) You need to enable
> >it with the -semihosting option, and you can't use
> >it from non-privileged code (this is the same as the
> >A-profile semihosting).
>
> You don't actually know whether someby has actually used this together wi=
th the syscall implementations in newlib/libgloss? I somehow fear that my o=
lder implementation only did work because it was using the SWI interface ..=
.  However, I have seen that libgloss seems to provide different versions o=
f the "Angel" interface. One of these also seems to use a breakpoint instru=
ction.

I would certainly expect libgloss/newlib to use the
correct semihosting interface if built for M-profile,
and we've never had any QEMU users who've said "my
M-profile code assumes SWI but QEMU doesn't implement
that", which I think we would have done if libgloss/newlib
were buggy in this way.
I just haven't actually personally gone and tested it.
The only thing I can think of is that if you accidentally
link against an A-profile newlib/libgloss you'll get the
wrong semihosting ABI.

thanks
-- PMM
