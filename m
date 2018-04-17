Received: by 10.28.4.212 with SMTP id 203csp905wme;
        Tue, 17 Apr 2018 14:52:31 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/0+vRinxbHYZf9jEKQSyZAiRoBNbSNVIIkli8Nr4wXCMFlB7+xjeRpTTQ5QE7XpT9L1eum
X-Received: by 10.200.30.129 with SMTP id c1mr1150965qtm.359.1524001951684;
        Tue, 17 Apr 2018 14:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524001951; cv=none;
        d=google.com; s=arc-20160816;
        b=MnAVQeglLcGSh/fXZhdPOU5zMJliBT2dCM1FDM5ZGobVfVNyDu9S4mDznTYl/ykIo4
         gFBQKVetD1O/FQhnT5gf73cS1GdINHaGUdYXIWWklIvnfrJ6frB5VWupdFsQSvyF6BVY
         rx3K3r+F42TRknOLXeRbZP0O+bkkQpFveY/OMjhVVja7RnxP3adnwb8CeqqCLmJT8zM2
         JZuZWOgclIbVr7qAI5hdH4HcY4mJ4BpVItyYxSmJwlU1bEw76K5020y5reOPk3dU4MQG
         a6PIDapN1Vl11SYo5fSYJ2AezgbLx4FtVqvidj0GDn/SfuVTSIoxtnoTZEzihpLCYMqy
         5jvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5QABkwO6uqnVIzVaw0Gf6Fp9OD5RWQ8gDBs7X/G3Gt4=;
        b=DMYk4FRscScdfYSWhZ6TmG5a1jrbbzy69RlFLumzdMhv6WP8zWKWtzvGp1i8lJw9Gi
         4LCLvBh/dVasulBeFoWi0bZiZZdnm//pq0zS7Nqy5licdoid8CP3rLUzpTQ8c7F5qKAw
         q+eobWZw87NmMmXyx+WXhXPDj/eic7VD0xi1MoTdOXl60E6iUGmfFCai4EOJdxiFXAAa
         RcTn3ZMH5H2s+qkbzXHV1tGLuox4kdVBZ4NXItsLJZ+/xODwk8MLpwdUzuPDPXlzyGDp
         ff8VYS0TAPIREPmtMN4prPTK/WdZLae8NrqSOwq06m8qhdBR4H1AMqHVPglyuA7fj+ZL
         JjQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LPlBM20u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g17si12457694qtc.244.2018.04.17.14.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 14:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LPlBM20u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8YWd-0001I3-83
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 17:52:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8YWL-0001HU-9V
	for qemu-devel@nongnu.org; Tue, 17 Apr 2018 17:52:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8YWK-00062E-G5
	for qemu-devel@nongnu.org; Tue, 17 Apr 2018 17:52:13 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:42507)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f8YWK-0005z0-B3
	for qemu-devel@nongnu.org; Tue, 17 Apr 2018 17:52:12 -0400
Received: by mail-ot0-x243.google.com with SMTP id h55-v6so23082971ote.9
	for <qemu-devel@nongnu.org>; Tue, 17 Apr 2018 14:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5QABkwO6uqnVIzVaw0Gf6Fp9OD5RWQ8gDBs7X/G3Gt4=;
	b=LPlBM20uooWZitRcJPJUVJi+H+Lnb4SjhL0NggUt8njmbOTK3cUT/LUZ7+vZtR+tFp
	9WE6Nei0EDRBkfbqm6czQzmoqBcvgXmKZrES26ZqtA5f2KsTOuNojjnqVzwGlOOomzfD
	J3qiXZr6+AWt8gZC6h66F5DdS3Cvn1FQnXF4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5QABkwO6uqnVIzVaw0Gf6Fp9OD5RWQ8gDBs7X/G3Gt4=;
	b=gjMd0Mg3GvB5Iz5Y7T0+7tYU75irVvduQR+Nb+VY2c6tcJQxm2J1YnnerYq2aNpv1S
	2Y4iXVvozgqCnk2PogvPeZiocv8s4DYX3XRfV7PGTIs9QMWZ4iqoiA2ZPwKQMvbqZVOq
	YRT04sL14x6g1uHPJMr3E+EBOVAPamE+eApcYZl3ECmtWndkFsn63p5o9EluS2vSM9+s
	3zGcDZVhjUCtWhGghll9kZjECDswB3HCLANLrTvDaC5HLBLrnFSvaQjDg2FqAZ1jgov/
	idX2OpMnYuvMjolRABdMs+2/AxpgPGOxrU2tfZqnUBf05WL0mf/LSIha0os09tI1AJWi
	A0QA==
X-Gm-Message-State: ALQs6tAb+2T2P1nq2+/i0EU+LFenbTLj+1pcH5kMbawz1LCPy1ZICYhW
	kEsNG7PJfh5bcZzn93BTXoXyIIFoJQevrz9/1cyOVw==
X-Received: by 2002:a9d:5cc1:: with SMTP id
	r1-v6mr2215953oti.258.1524001931516; 
	Tue, 17 Apr 2018 14:52:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 17 Apr 2018 14:51:51
	-0700 (PDT)
In-Reply-To: <CAOuPqTFJABMcDHmQcNoNZioBBJ8RcreeevsRfh5b46ZgKZLetw@mail.gmail.com>
References: <CAOuPqTFJABMcDHmQcNoNZioBBJ8RcreeevsRfh5b46ZgKZLetw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Apr 2018 22:51:51 +0100
Message-ID: <CAFEAcA8cWYPjN8sxCwzCXhNBucXyhCBMFDA-AJ2zUCr-FKLT1A@mail.gmail.com>
To: Henry Wertz <hwertz10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [Qemu-arm] ARM memory barrier patch
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fhCg1hw3Urn4

On 17 April 2018 at 22:32, Henry Wertz <hwertz10@gmail.com> wrote:
> Please find submitted a patch for ARM memory barriers.  This patch is
> against qemu-2.12-rc2 but I do believe it should apply for anything from
> 2.11.x to current. (the code being patched was added in for 2.11 series.)
>
>
> I found with qemu 2.11.x or newer that I would get an illegal instruction
> error running some Intel binaries on my ARM chromebook.  On investigation,
> I found it was quitting on memory barriers.
> qemu instruction:
> mb $0x31
> was translating as:
> 0x604050cc:  5bf07ff5  blpl     #0x600250a8
>
> After patch it gives:
> 0x604050cc:  f57ff05b  dmb      ish
>
> In short, I found INSN_DMB_ISH (memory barrier for ARMv7) appeared to be
> correct based on online docs, but due to some endian-related shenanigans it
> had to be byte-swapped to suit qemu; it appears INSN_DMB_MCR (memory barrier
> for ARMv6) also should be byte swapped  (and this patch does so).
> I have not checked for correctness of aarch64's barrier instruction.
>
> Signed-off-by: Henry Wertz <hwertz10@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Richard, did you want to take this via the tcg tree?

thanks
-- PMM
