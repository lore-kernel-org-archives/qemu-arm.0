Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1358934wro;
        Thu, 14 Mar 2019 15:30:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMH1PrtCewN2GRxZMue1x6qDN7LYbMzQ7TGRBaZO/Q3e/IBsUW6oWFynYL1oSeSJqq87wF
X-Received: by 2002:adf:8367:: with SMTP id 94mr185740wrd.46.1552602614104;
        Thu, 14 Mar 2019 15:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552602614; cv=none;
        d=google.com; s=arc-20160816;
        b=ssr7hxkIY4jzaQsN/GN1VXq0FE0k4jRXL3+lT9eJcANrfJ1QFPtgIceBBhjYTbVyjE
         ompu7c8xfQrPx51bqFh8GyK/OfYQCjaNcJ18vk7ORT+t7Hkg+jHaSz91Hi/cBolbh/ne
         YCpU2yKI4rXOWJokCaJDCCDxPCE5d17kUXAG1s13Y6+DKNi8OPmJS22lbNo0644VC7Ht
         WQnrLh9sxN96uz0OLvEXdPI2SKj5fFU0p6om+erGC8WWIK//tEK8sJgvVJZH67qasQEo
         87FD7yMwsW3qrTDzPR/hV45HL35GRpOdwzQLUibqmfCRnK9RGbMMIfXvHX/HbNRnGM2N
         F8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=yoZbQQYiCPRpHW/PptRAvEOvuctRbvVMK3dXD3s7KVk=;
        b=mQt+PDEmDlnWH6WABaQjMhCsMD1ndnHScEePXjJ/Fm3s2HLPYeTAsNTukFtyB6lPoT
         3M225ql9HUOVbju/g8TPLt/0H+PrFw0qXOWfAEGOJF7SQJczYW9fr23e0Cu9iTsmHUUC
         szvelMaCRhG23eXi7MAOYT8iPma8FXszD8tsqM8xwSDq60r4/3C0MSiuDqSk+TRnpAwq
         rXTQnqS5ZNqdDhpdDBW3KdkZscwdg+JwfOUGYDf+Q3/VQg1EVYeK6P/NEhnAD6hCv8xM
         iTwLquTBsnysS5QWHuupcXI/uk2f7owJUAAR2xHRKKCqqBEDEZmpn2m5bGW7oAJXzkbR
         iOzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bLgVBn6d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si52109wmf.104.2019.03.14.15.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 15:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bLgVBn6d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:45937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Yrd-0005NH-4Q
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 18:30:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cialdi@gmail.com>) id 1h4YFy-0000uz-0e
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 17:51:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cialdi@gmail.com>) id 1h4YB9-00056S-Ie
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 17:46:21 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:36467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <cialdi@gmail.com>) id 1h4YB8-00053x-1H
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 17:46:19 -0400
Received: by mail-qk1-x72b.google.com with SMTP id k130so4336855qke.3
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 14:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=yoZbQQYiCPRpHW/PptRAvEOvuctRbvVMK3dXD3s7KVk=;
	b=bLgVBn6dhXDQdjl2uYFyGSEYqZtA2mA6WFL2SAvmVv4h0f+BPySl8iM/AHZ5S+EY67
	+qlXw/++ffCApdUadFPxQkAMt1MLXK9wLsBXMvVfc1cpFw9fGjCpIorBwnv5C+xAF/96
	JWRmRW05F2jNEBDW/BhS3zAxFsXUsCxoqM3eMFSeHj7pfUijlQD4gN0a5nOYquY1FFLd
	Wvxlg+dGD+Tzz5wBzJTyzQcdQWYCkpsUGshfWriNPNYDJ3FI80sWp4gBKrC+Sf7FSGh3
	BzBEtjkpZlpL0gC2JGbFIjttZkX7vjcdJB5+HH5wTj2VaSxZbZjRI2YNj9MzxbF3jyQI
	jyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yoZbQQYiCPRpHW/PptRAvEOvuctRbvVMK3dXD3s7KVk=;
	b=tIxur+VUKMXQiXV59MWLRMFFVW+561xvvqeBpK7/uiIY9d8HfkPuKKSP1A5poLVGRY
	Qo0jDZOkecDMVnsxXuSFWMgk2ZgDO8uGmARHn9t7DKQfsngZnWHMF0DSvrdRn3/f6Kd0
	QNbND7xMfhN2iCPqQtsAetNlFUnM/gfTPlAKKi85rH+sDduSWOGJcj9rK389WLEe4lMd
	Z0oBODlZbGOH8tY3nM5lCA7WfiPjeLhzhNyjvWNLWsk7fWe52S/38TK7fZHuT2KZmdxD
	UeL5ubeoA3c+kbbh70XPz+eg6bP81QwpxvNxsVtCcZVVeHwAUmhC1WEp6l/KFFyiE1ME
	laFQ==
X-Gm-Message-State: APjAAAVH+fcQZ8VlW8IuiS/WSQ4JgNUKaTMAAyctTQXJWTiHeiUYMXZf
	C5/HkLL8Teg5SVk1lYFyUQYmUy9YbYB19GoE23xG+CQOJio=
X-Received: by 2002:a37:d459:: with SMTP id l86mr375483qki.37.1552599976301;
	Thu, 14 Mar 2019 14:46:16 -0700 (PDT)
MIME-Version: 1.0
From: Massimiliano Cialdi <cialdi@gmail.com>
Date: Thu, 14 Mar 2019 22:46:04 +0100
Message-ID: <CABgYhWf=unSbmTksO+gkUuX+UL3g8HvEuDAeDdxBQVbzci05DQ@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000010d826058414da93"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::72b
X-Mailman-Approved-At: Thu, 14 Mar 2019 18:29:54 -0400
Subject: [Qemu-arm] QEMU user mode for cortex M
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
X-TUID: DvUKpYhidyw0

--00000000000010d826058414da93
Content-Type: text/plain; charset="UTF-8"

hello,
I would like to try some algorithms on cortex M (especially cortex M4). I
don't need to emulate the whole machine, I just need the user mode.
To test the feasibility, I wrote the trivial "hello world".

I can compile it with arm-none-eabi-gcc, but the newlib associated with it
does not implement any syscall.
So I tried, on ubuntu, with the cross compiler arm-linux-gnueabihf-gcc and
its libc6, but the latter is only distributed for cortex A.

What do you suggest? Should I recompile the libc6 for cortex M (or do I
find it pre-compiled)? Should I implement (and how?) syscalls on newlib?

In summary, I would need a step-by-step guide to running Cortex M code on
QEMU arm user mode.

best regards
Max

-- 
Et nunc, auxilium solis, vincam!
Oppugnatio solaris!
VIS!

Massimiliano Cialdi
cialdi@gmail.com

--00000000000010d826058414da93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r">hello,</div><div dir=3D"ltr">I would like to try some algorithms on cort=
ex M (especially cortex M4). I don&#39;t need to emulate the whole machine,=
 I just need the user mode.</div><div dir=3D"ltr">To test the feasibility, =
I wrote the trivial &quot;hello world&quot;.</div><div dir=3D"ltr"><br></di=
v><div dir=3D"ltr">I can compile it with arm-none-eabi-gcc, but the newlib =
associated with it does not implement any syscall.</div><div dir=3D"ltr">So=
 I tried, on ubuntu, with the cross compiler arm-linux-gnueabihf-gcc and it=
s libc6, but the latter is only distributed for cortex A.</div><div dir=3D"=
ltr"><br></div><div dir=3D"ltr">What do you suggest? Should I recompile the=
 libc6 for cortex M (or do I find it pre-compiled)? Should I implement (and=
 how?) syscalls on newlib?</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
>In summary, I would need a step-by-step guide to running Cortex M code on =
QEMU arm user mode.</div><div dir=3D"ltr"><br></div><div>best regards</div>=
<div>Max<br clear=3D"all"></div><div dir=3D"ltr"><br>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">Et nunc, auxilium solis, vincam!<br>Oppugnatio =
solaris!<br>VIS!<br><br>Massimiliano Cialdi<br><a href=3D"mailto:cialdi@gma=
il.com" target=3D"_blank">cialdi@gmail.com</a></div></div></div></div></div=
></div></div></div></div></div>

--00000000000010d826058414da93--
