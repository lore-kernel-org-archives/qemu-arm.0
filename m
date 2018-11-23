Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2301032wrt;
        Fri, 23 Nov 2018 09:10:09 -0800 (PST)
X-Google-Smtp-Source: AJdET5fvLayviVOU3QWywmoU26O367CeIbCA7zVLRUAKRs4HMFG9Yp2dFXyFavffQF0eOYYOEu6p
X-Received: by 2002:a81:b2c8:: with SMTP id q191-v6mr16800490ywh.313.1542993009692;
        Fri, 23 Nov 2018 09:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542993009; cv=none;
        d=google.com; s=arc-20160816;
        b=QCkii13yVfIObqDxS72DyaXsvfUTt2KIdnRnw4A5ckSAvB/bBZ8sqByTF+qxEpqP9N
         PAI66KZV8yvgfRZsPCZ/SWcGIpvRqvUSum35CtkT+Kv9ODfEqCQv23ZYKMcW2xL/CoEO
         pww3gNmYGZfvGzuCZ93y776Zvv5W+P4GdzoXdqG+7/X+Vrfv6ynGArguUyVE5DBA7WhA
         ESHxb86RLNnw7cOuz/VleVU+H1koC/HYn66vOfxdB9le7S991dRKw5QImJr4FjnoJgF9
         wcdN/TcV+tRQCWsDeWPSzBvL6LlUvATAT996ljCZIuaILQ1RlZuyw8d9OORrGo75ljJL
         xBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=374TnMyyD5Zq9DqHYSz0THmoYmbcvIe24khGdy5puRs=;
        b=B6nhF4fBUIbAfiva75aEoWBcgu2HsijCMZ9zo0evi6ZJdz6nVlI3Dinchto5FSEgBI
         OhNxzBfKbhvEntcf+hGh6crwa9Wf9OeA19tVUGBAki31e7VsHvmfgcDqttwj98GkE9jM
         bv9109ZH/V8QdpBuXzxPIebJuezURZw8/EaUg7yiXvtHoQndsnl9MsSDPL9SoJERcAd6
         //VzshMKnOq6cZ9e3gPMIOMIiQj5P/4BWNOxvKAp2jrC1MDVhfBVuBwE4OZ7/EJU3Jnp
         raX8vgdJfNfvRwY6gSNoFqx7PfQ/3WUxI07zujHdrAGgRfOYa9RGCIALnCNSwihYbSzM
         IWkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TRuXfJyw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g15-v6si31927961ybq.110.2018.11.23.09.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 09:10:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TRuXfJyw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQEy1-0005n4-2H
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 12:10:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gQExl-0005ka-QG
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 12:09:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gQExk-0006uo-1L
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 12:09:53 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34336)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gQExi-0006mm-1A
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 12:09:51 -0500
Received: by mail-ot1-x344.google.com with SMTP id t5so11210383otk.1
	for <qemu-arm@nongnu.org>; Fri, 23 Nov 2018 09:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=374TnMyyD5Zq9DqHYSz0THmoYmbcvIe24khGdy5puRs=;
	b=TRuXfJywpte+w5BMvoyCuu58EoZgx6klH72bBS5GnOxbs8O2BMMBBx5KtnJSgEKkbY
	5SFA9kC8GSJynflcQsTS+OypU4MuEaBDMH40mbf6PorDZwzEEcZ9vJDzo4P9akZTXfnq
	WBERhFsCpctQvWk5lN+eRFEcXm9vWwiXEo1TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=374TnMyyD5Zq9DqHYSz0THmoYmbcvIe24khGdy5puRs=;
	b=j4BjpDUj1K7EvkKZ9rDtK0sPlCo7Z9csky6445NViB8943FqYWMLBLkKOKX5tofrZu
	yZPznz74SQHYC8MZwfJ0fRxKLM1Qeg4JMQOy2cIdz5wrEgcWbEJjVK3T/2vIOeZe0+9c
	pcbiIiPRx3gsB8JWCLzVaXB2aDacRLZJr6CnmsS6ooGABthR/x6eWRrhhxjyiJdB3SXf
	phWKcT7ot1znWEEoZVComqsWdOK5ar48O6bk5y9ZLieRaZvVSgeWPZibGKqGJCAohwQZ
	q4oV9i1+MF3g8CBgRTE6nd0MfFMG8Z63c0cDKDKvmjaEDcFguxd+b9Pag9kwhX9HQQTk
	QAyA==
X-Gm-Message-State: AA+aEWbod5AAzowd//ZEIrmbfX2EAi3oVaQjiZjgqdmD7CGUrgXmuYu1
	D/SS7C5GCTWZQ1ErhevxR2/ertO2QimpGBvQqeHtww==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr9397042oth.238.1542992986685; 
	Fri, 23 Nov 2018 09:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20181123135450.24829-1-edgar.iglesias@gmail.com>
	<20181123135450.24829-2-edgar.iglesias@gmail.com>
	<75bcddbc-da2d-aeb3-71d3-52b635520d2a@redhat.com>
	<20181123165945.GM1148@toto>
In-Reply-To: <20181123165945.GM1148@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Nov 2018 17:09:35 +0000
Message-ID: <CAFEAcA8vWT5sayyBzbU7S8BwA06Kj=G1izioufjHFJdsEkyq4g@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v1 1/1] net: cadence_gem: Remove incorrect
 assert()
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>, mbilal <muhammad_bilal@mentor.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GnS0bMXL/Jsl

On Fri, 23 Nov 2018 at 16:59, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> Not sure if it's too late to even get the removal of the assert into this release? Peter?

If you're happy that removing the assert is the correct fix,
yes, this could go in before rc3 next week.

thanks
-- PMM
