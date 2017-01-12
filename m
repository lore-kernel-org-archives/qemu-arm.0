Received: by 10.25.205.13 with SMTP id d13csp1453074lfg;
        Thu, 12 Jan 2017 13:51:02 -0800 (PST)
X-Received: by 10.233.232.202 with SMTP id a193mr15257263qkg.113.1484257862605;
        Thu, 12 Jan 2017 13:51:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7si7041003qta.64.2017.01.12.13.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jan 2017 13:51:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRnGw-0005vO-2Q
	for alex.bennee@linaro.org; Thu, 12 Jan 2017 16:51:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cRnGs-0005vE-3U
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 16:50:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cRnGr-0007IG-Aj
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 16:50:58 -0500
Received: from mail-ua0-x22a.google.com ([2607:f8b0:400c:c08::22a]:35958)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cRnGq-0007GO-RH
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 16:50:57 -0500
Received: by mail-ua0-x22a.google.com with SMTP id 96so24206685uaq.3
	for <qemu-arm@nongnu.org>; Thu, 12 Jan 2017 13:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qvoA8A/UUniHC7svL7euyAaOZCRxYI7PigYGdav/6Bk=;
	b=BERaYRCqDuBnM6hJ8KLv8KQ5Le29FDSMLrnIAlgFShX33cNUdloc6/ROo1jhTDkf/6
	sHex5VQeVehC3ZyrrdLqJ0u4bjMmVmTSggEmY7Keqx4AYpBbuSzasEnA4rlGz+oDEqIS
	1TukWutt+FHg0mRE/XRL2yHAuXPpMVev88C8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qvoA8A/UUniHC7svL7euyAaOZCRxYI7PigYGdav/6Bk=;
	b=S+1gnmGmRGUG3pOyzdAaC8ieLRxJ3oHP6n1JGxZhTX/hMHl8fO6N9kN6504eQm1qm4
	2pAAYid+Z/k+lFsocBddGjr+uqh1DOkvzaRPyHotPzHt5PMJ0yF/m9TZWQDAjY+qJom5
	XP2kdOBIiOxxWpO1RCykkarvH3VwHyjM3bXpSawk1PXg00zFV34YyjRPyJIVFDrdZjZD
	xmYVCKn3vh+sC514eRfMIV2zeegoKAzFH3XZEOx8Fe2VUnMQ5OmkorArnFIMavnaTxZn
	uxK5HbMdjVOZHw6Fcykm/DLYdY4jOSmIRz9O3wsJwGhzOdldyaqxg6SWwsIGZaHjTDSF
	HkXA==
X-Gm-Message-State: AIkVDXKZtul9acHGM4ZYxkd3QX4N6/pDSErsyrIfwgBJug7bXg0wZR+Cr+erWJzXQilZyRP2brz1UyGwNty+V6ht
X-Received: by 10.159.48.203 with SMTP id k11mr8726229uab.42.1484257855918;
	Thu, 12 Jan 2017 13:50:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Thu, 12 Jan 2017 13:50:35 -0800 (PST)
In-Reply-To: <20170112204109.GY9606@toto>
References: <1484073849-32666-1-git-send-email-peter.maydell@linaro.org>
	<1484073849-32666-2-git-send-email-peter.maydell@linaro.org>
	<20170112204109.GY9606@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2017 21:50:35 +0000
Message-ID: <CAFEAcA9RZTXZPeYwPvwgEG3cWA+h_ev4LesxCdO+YkncdsfLiw@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22a
Subject: Re: [Qemu-arm] [PATCH 1/3] target/arm: A32,
 T32: Create Instruction Syndromes for Data Aborts
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KRwDUx5Top34

On 12 January 2017 at 20:41, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Tue, Jan 10, 2017 at 06:44:07PM +0000, Peter Maydell wrote:
>> Add support for generating the ISS (Instruction Specific Syndrome)
>> for Data Abort exceptions taken from AArch32. These syndromes are
>> used by hypervisors for example to trap and emulate memory accesses.
>>
>> This is the equivalent for AArch32 guests of the work done for AArch64
>> guests in commit aaa1f954d4cab243.
>
> Hi,
>
> I haven't checked the the details but I think the structure looks good.
> The patch is a large and has a few things that I think could be broken
> out into separate patches (or dropped).
>
> For example these kind of refactoring could be a separate patch:
>> +                bool pbit = insn & (1 << 24);
> ...
>> -                if (insn & (1 << 24))
>> +                if (pbit) {

That one should be the only refactoring, but yeah I can split it out.

>
> There's also a few whitespace changes that could be broken out or dropped..

Oops; I'll get rid of those.

thanks
-- PMM
