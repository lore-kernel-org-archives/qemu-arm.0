Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5209162wru;
        Tue, 31 Jul 2018 10:19:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdFqLl0926ovOlEJ39qTuw3rfkzJ5m/c0eMWuehmUYJ3SLqp/E5UeknFoKHUPO3fLUHWyT2
X-Received: by 2002:aed:25a2:: with SMTP id x31-v6mr21589372qtc.228.1533057541459;
        Tue, 31 Jul 2018 10:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533057541; cv=none;
        d=google.com; s=arc-20160816;
        b=WFWGS/4BOssDFVDyMbMeSZ1d15YRYQcmc82TrLEb0KqsYXsi1NCTsYy+Iojw+kFSCf
         vdzlLdykjziKtH5gSVbHWY0SPSEDuVRUBTY+X4puAqNgm0rl6XMf9XXHKCMUDt/Kx8H8
         mtfja8rwhoQhKEH2N+ozBI5117AsYp9Gqo28j7MFJIGp1rfYv6VayuPailyKNldkf9WE
         5BEJX6m9iPl1/SC4FE3m4s70gSWPhbfnll8Iu4nCHbSXLHyxiWzERWo3SiOsgOiXI1OS
         qpR6WXGeZ3GG/A725yZA3nsfM72Ah+BdzzMT9Q074wDAMkyBpkeoeqV8MQMiWQ4Xb6qf
         e4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=SG/e0iJLYZDMgzwWThnCE2TbE3TuPqZ01UY/Ukz9MbY=;
        b=nQKUyBPA0kJnrd5FBQV6c0dBoYgi3U5e2dS4rExM/EJJSTCtx7TSTX90kOIY8VKaT9
         /EsYagyAARBELc8BpdnijFqn8z7ZFH5oi8+kXy+dj/vDZ+I/3Ay+hNHN3S+9L5v1ebVf
         zUujSVU6BR2N/VZLXMyxgXGMG1z7RKYRtIk5d7W4vCCgUnF7IhooGraDpHp5nyIxuqct
         SVt+bDt12XOjSgb1ugxFH72ngM1+fHGXUh6sE/nQkdOVw385Zh54y1uI10wEBRlvy5kZ
         8SSOltdGQC38VVrHuUjZzV4Rn6XICYQh0X0MNWKrtojDDni2e55E2+KkuyoBvtj5eOe3
         vbqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A71o9Ljt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i37-v6si6716787qvd.67.2018.07.31.10.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jul 2018 10:19:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A71o9Ljt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkYIW-0004GN-Sv
	for alex.bennee@linaro.org; Tue, 31 Jul 2018 13:19:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkYIK-0004Fw-3T
	for qemu-arm@nongnu.org; Tue, 31 Jul 2018 13:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkYIJ-0006z3-6U
	for qemu-arm@nongnu.org; Tue, 31 Jul 2018 13:18:48 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:43741)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fkYIJ-0006y7-0j
	for qemu-arm@nongnu.org; Tue, 31 Jul 2018 13:18:47 -0400
Received: by mail-oi0-x244.google.com with SMTP id b15-v6so29359266oib.10
	for <qemu-arm@nongnu.org>; Tue, 31 Jul 2018 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SG/e0iJLYZDMgzwWThnCE2TbE3TuPqZ01UY/Ukz9MbY=;
	b=A71o9Ljtn/KmzZe/cohrYJVQ/l1qVMb+ov7Q3WEB0pVubLz+l6qLg8MgWfoS2bfPy8
	EsVjrz2rAblvtYPWT5su49fMvPzjEvSKGHKxGpT7WSqaxTyO15qOBhyD827x6sWFq2Dh
	3BEexFgQafz2BppWYXzPtQ40Wyw/HLiG1mkXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SG/e0iJLYZDMgzwWThnCE2TbE3TuPqZ01UY/Ukz9MbY=;
	b=YBAXql2bH6m6z+mUPBneREPjktFW3/bKq5l7vFXPhHT/v77xa+bRDg7HN8ICmZ51Xs
	EhAtncBsQz6pYLJM9E/DFqZULs+I+p4//OZA+QSHJT507uKfVFfy141/aLzhM9eJCCBr
	8sGNqDlm5fAn+PSySySrdFvUx/JP5+kY9RvbzDkl6KzREe1XSRseO4uwzNw3ILIcjBsz
	wNaamvqgFg/qss3GRLjCdqj0MlVqR5iSEWNrlTSF+smJUBbXuWvns/e1GDZgGRIaLFBh
	YdeqplkoGzedaQqhFCLH83boBeCgiIS8A7ecgX7oAUzSiTFVy+sJiKOuSSK5201kKB/Q
	veqA==
X-Gm-Message-State: AOUpUlEinNjvhs5CeFx0aYk4ThECX1mD/VzUJZftvF4izeNDF8TTQBxF
	J965tF5tM57IAUOrY6aybgGYhPJETtdS/1mxOEZ92w==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr24478069oig.13.1533057526308; 
	Tue, 31 Jul 2018 10:18:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 31 Jul 2018 10:18:25
	-0700 (PDT)
In-Reply-To: <20180725085944.11856-4-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-4-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Jul 2018 18:18:25 +0100
Message-ID: <CAFEAcA9C9BwPYHeXcX0R2MvEKb=ZKObskaTrHuFi7_0rNnecuA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3 3/7] hw/arm: make bitbanded IO optional on
 ARM M Profile
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
	Su Hang <suhang16@mails.ucas.ac.cn>, Liviu Ionescu <ilg@livius.net>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nqU8bwVirDG5

On 25 July 2018 at 09:59, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Some ARM CPUs have bitbanded IO, a memory region that allows convenient
> bit access via 32-bit memory loads/stores.  This eliminates the need for
> read-modify-update instruction sequences.
>
> This patch makes this optional feature a ARMMProfile qdev property,
> allowing boards to choose whether they want bitbanding or not.
>
> Status of boards:
>  * iotkit (Cortex M33), no bitband
>  * mps2 (Cortex M3), bitband
>  * msf2 (Cortex M3), bitband
>  * stellaris (Cortex M3), bitband
>  * stm32f205 (Cortex M3), bitband
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

This fixes a bug in the MPS2 boards, incidentally, where the
Ethernet controller is inaccessible because it's hidden by
the shouldn't-be-present bitbanding region...

thanks
-- PMM
