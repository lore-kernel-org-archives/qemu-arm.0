Received: by 10.25.208.137 with SMTP id h131csp1170197lfg;
        Mon, 16 May 2016 02:18:47 -0700 (PDT)
X-Received: by 10.140.93.103 with SMTP id c94mr27472066qge.74.1463390327389;
        Mon, 16 May 2016 02:18:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c15si21969106qka.239.2016.05.16.02.18.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 02:18:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2Efm-0004h5-SG
	for alex.bennee@linaro.org; Mon, 16 May 2016 05:18:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2Efj-0004fF-PX
	for qemu-arm@nongnu.org; Mon, 16 May 2016 05:18:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2Efi-0005pi-3Y
	for qemu-arm@nongnu.org; Mon, 16 May 2016 05:18:43 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:36738)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2Efh-0005pS-F5
	for qemu-arm@nongnu.org; Mon, 16 May 2016 05:18:42 -0400
Received: by mail-vk0-x234.google.com with SMTP id s184so205678960vkb.3
	for <qemu-arm@nongnu.org>; Mon, 16 May 2016 02:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ucrXdxJqGyaZZt17SRPaGSWOKNRAaLj/X748B1Pdatw=;
	b=UYKH0RaVn7MFywVBw2MKcwUho3p7peEBvZgkCM4MdvplzSad7kPpHGciBYIYfbWngb
	qGvErvqo8NcxNBfAzlK368kr+BWLjTgPtqRuwUwYfYdxXfRyrpjGUcM/7Kmazx2RqIas
	GC4fOXIfqPH3ShSt3AyTFOBZQ0f+lkNkbNDb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ucrXdxJqGyaZZt17SRPaGSWOKNRAaLj/X748B1Pdatw=;
	b=IVChqnxZOh55OhtdBcLBf6rJ7dzwhmEaUGjSfsm5J8naLV9/hk9sw5c4vIj2PqbYqi
	7mBaFUYW3B5Hbz+KElxlUHMP+uJ9Ausm2HIzNXciz0cMiN85jYhgwhDaURVC2RYZq4Q6
	++ZTZAmSGc/BQi0YdfVsNnkAcDOR6aCL6L5OBM2En64v/irbvbcU+IlrJdv1kdVYmhM5
	iO0X9aYdENq169QoJ1A8Z/snpW5s/B9R34iD+RctH6Zp/LJmANN+Q1DhXKTwcwhebp3y
	g4u/bQ3aMbEWnD4mAIprA+PnCxB/X4U9oveoJcBT3X96n8iLmLLQLkQobEQOSsbjb41k
	RskA==
X-Gm-Message-State: AOPr4FXVC8CCk/behTS0ZapemHRxxME61iopQXKFgPqrvjoRif7jpHO8LMUxY3vngSupvb18zqou3DbI0XyLwwq0
X-Received: by 10.159.54.232 with SMTP id p95mr12843336uap.107.1463390320969; 
	Mon, 16 May 2016 02:18:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 16 May 2016 02:18:21 -0700 (PDT)
In-Reply-To: <2b8f6d83.266f6.154b846f92c.Coremail.21521131@zju.edu.cn>
References: <2b8f6d83.266f6.154b846f92c.Coremail.21521131@zju.edu.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2016 10:18:21 +0100
Message-ID: <CAFEAcA9uFmxf-Ddyut+1_YxTtqcgsXoWw5rkvFrCKkXGqRjm9A@mail.gmail.com>
To: 21521131@zju.edu.cn
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] help! I have downloaded
 "debian-8.4.0-armel-CD-1.iso" from
 "http://get.debian.org/cdimage/release/current/armel/iso-cd/"
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
X-TUID: YOKJipw+pm6+

On 16 May 2016 at 07:35,  <21521131@zju.edu.cn> wrote:
> Hello! I have downloaded an iso image file from website
> "http://get.debian.org/cdimage/release/current/armel/iso-cd/", I downloaded
> the "debian-8.4.0-armel-CD-1.iso", but i don't know how to use
> qemu-system-arm to run it. Is it supported?
> How to boot the iso image using qemu-system-arm?

This sounds like a question to ask the Debian folks, not us.
Whether you can boot this on one of QEMU's board models
depends on what platforms Debian's armel CD supports
(which you should be able to find in their release notes).

thanks
-- PMM
