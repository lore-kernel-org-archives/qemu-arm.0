Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2522696wru;
        Thu, 2 Aug 2018 15:05:19 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd0jRIH2jO8wJ3Zd/OHAYb9MjjhkAdp7vGywyOG06orE0e2J38IiiLQYLytuHONxn2UnwZY
X-Received: by 2002:a0c:c489:: with SMTP id u9-v6mr1297116qvi.11.1533247519611;
        Thu, 02 Aug 2018 15:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533247519; cv=none;
        d=google.com; s=arc-20160816;
        b=WNwqlqkW7bWIi2zcqUtor/H01/4zXNguY4fdJpeLUz4BZKF9pLO6VoGLhDHJHjsoM3
         8GFymbeu4b//nhGs514v2Bn6VjMhQ46u7A8QlRYgedLr1jlE4Qg7iZMzaW3kPWbybOU9
         czdUzc8Y5iuPqZsG3CzHlcaZ2IC2DHaSjJSSl5NMf5SRmetrUv+iAqFquK7MmJ90Ze7N
         9ZfIpt4raW1Werfb6/+VhBLf101Nu2F3kcRaI7NtRTTCF/kDdZffyhJi7+JQWEs0MlUQ
         0y40zNzQD6KfNuFFou1W05qoVvknw1Cc8wz7SkWVHFfPQ62MCzm1i3iPOB1GRndq3VQg
         tp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fXeNYpXTG88j6s+09nI8ffB3UvbGeFmbNE6hS8TekN8=;
        b=bA6PlzLl0vKeGwgMWK07M/7wPNbXdu5wWnL2O8ui5/wb/BXd1SjcsYa6TxglyNFhKb
         VzYB2zetm43rYX9EULjeTxuGeEb4Wsxg/X7ZqnC3iTeJuit/ocNf3t3AObp5fgtvINnf
         uYmXIB3AuMQn63kSNPtK8KGvIijMXWMfnyxIOB1twv775ehO17S57kU8bI2e4ik5e4IX
         gG+fy1WpS+zS+OB5dReXljJv+2Yemb/gasZw9G5kWUIrsJ+4VPf8IOdGvsM6xOuN2EeS
         Rr2DkSZAdwWrNI6FnUbEMCNBgTLsifMf0BDLZ3hbGoTNTUM+tGEoiWYvu80PtjVgC5B9
         MPSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZPVXcT6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c42-v6si2382548qve.19.2018.08.02.15.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Aug 2018 15:05:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZPVXcT6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flLih-00043H-6t
	for alex.bennee@linaro.org; Thu, 02 Aug 2018 18:05:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1flLiW-00041O-RM
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 18:05:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1flLiV-000477-Uf
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 18:05:08 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:41532)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1flLiV-00046e-OI
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 18:05:07 -0400
Received: by mail-oi0-x243.google.com with SMTP id k12-v6so6300092oiw.8
	for <qemu-arm@nongnu.org>; Thu, 02 Aug 2018 15:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fXeNYpXTG88j6s+09nI8ffB3UvbGeFmbNE6hS8TekN8=;
	b=ZPVXcT6NHOdnpu+1NCKV7+2J07hR0MkmJT+oxKMRN2mLkJ3yZNDDRp3PSvhlxlGysw
	U/0QFI1y3Ou0r/v6L0fkmdyp4fd/8PyoqBbc2lraZNKYdjQ/bgiBT2N+2oIKaeNcwlPO
	NlkyBmCGeMXOmTnzatRnXJ1zt66QTlWhKBGrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fXeNYpXTG88j6s+09nI8ffB3UvbGeFmbNE6hS8TekN8=;
	b=OF/6l8D2eExA2msVTWSqeDe0GSc3YUDOPNaDyQ7DvdEkKWKVZvYCuQ5XNyn2lzf7Dc
	LbZc64zB9WDZ6lN93pA17ijPOXewv+YOC+OFDv+fEUPYuLH+PhKNoJM0OnRxbp6cq8bT
	s2PIf/AV0IMZPUBS+v49pvywFgoIpTjtuNP5vTVXHj7gw4olxCN5jr0YtSt5dK5+bLKT
	Lk3va//ZhWJx4Ii5hHvGTTAQWyBOThvi6SbN+hhDO4x65dbgyJt+iuOgRBNFmXLjRzKs
	CTQ2MmXiZ9LTgC1g34wEkSNgiM4/x1GMvBkGDBTnY42ukNnl5vr7HCjxvoAWSY6bN7h/
	W1zg==
X-Gm-Message-State: AOUpUlE2jpoMgO8+sMewJFhoK2e5ijtT3k4eE0pUQED/z/i3o28nKpul
	LIF4IEnQy/8dEoilDfT1EWs30Ztv/mMvQQpIOs7JNQ==
X-Received: by 2002:aca:5f0a:: with SMTP id
	t10-v6mr581881oib.337.1533247507018; 
	Thu, 02 Aug 2018 15:05:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Thu, 2 Aug 2018 15:04:46 -0700 (PDT)
In-Reply-To: <20180802124345.GA25289@stefanha-x1.localdomain>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-7-stefanha@redhat.com>
	<CAFEAcA8m2f-DRiDNF0ry4nMH9bzZ1gODV4MTgtLwR5jTNdgeJA@mail.gmail.com>
	<20180802124345.GA25289@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Aug 2018 23:04:46 +0100
Message-ID: <CAFEAcA9SHbSf8=UhS697fkTe9h2bBBoF66DVj04_i9t53YvOOg@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 6/7] loader: Implement .hex
 file loader
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Udbc8roj7SX2

On 2 August 2018 at 13:43, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Mon, Jul 30, 2018 at 07:01:53PM +0100, Peter Maydell wrote:
>> I'm still not convinced we want to add another random
>> special case only-works-on-one-architecture-and-some-boards
>> feature to the -kernel command line option.
>>
>> Adding it to the "generic loader" device might be more plausible?
>
> I'm not sure I understand the purpose of the generic loader.
>
> As a user -kernel <myfile> is easier than -device
> loader,file=<myfile>,cpu-num=1.
>
> Can you explain the advantage to moving hex file loading to the generic
> loader?

It means we have a command line option for loading hex files
that works for every board and every CPU architecture.
(Similarly, if you want a way to load an ELF file that
works the same way for all boards and CPUs, the generic
loader is it -- -kernel will not reliably do the job.
You can also use it to load more than one ELF file or
to load different ELF files for different CPUs, neither
of which you can do with -kernel.)

-kernel, like all our legacy short options, is, yes,
easier to use; it's also a twisted mess of different
"do what I mean" functionality that varies depending
on the guest CPU architecture and subtype, the machine
being emulated, and other random things like "did the
user also tell us to start a BIOS image". It mostly means
"run a Linux kernel", with some extras wedged in on the
side where we thought we could do it without breaking the
kernel case. Oh, and we don't document anywhere what
it actually does. I'm reluctant to add yet another layer of
"do what I mean" to it that only has an effect on a subset
of Arm boards.

thanks
-- PMM
