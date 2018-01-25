Received: by 10.28.71.27 with SMTP id u27csp1970645wma;
        Thu, 25 Jan 2018 07:11:03 -0800 (PST)
X-Google-Smtp-Source: AH8x225gCoaITW3UF9n1P4tOO/Cz71PYvBICvLe6MoXsE7hZjLxGTqfJhvuXNaXbRVvWs0aNSbRk
X-Received: by 10.37.116.20 with SMTP id p20mr8630623ybc.194.1516893063291;
        Thu, 25 Jan 2018 07:11:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516893063; cv=none;
        d=google.com; s=arc-20160816;
        b=ttvkbJtCwUg9LYCQ46G4/f5zNexwM7b/WRQ/K2RDCplS8itDrSugF51yJNjx2JOpqn
         wCI6R4+/43n76E8suMuCyIWLOzt6+089YJkNIDGirQ4XVdXWUg5fWkR31nQFwY9EWm78
         9XJGujRejFGS0+hwjwDO2qRia/vs4Zza0bg8TGzhFeVaSHegYFpn+xTaNb8pqw/GgSXp
         lYHYFiKwpn8JqOCfvrVUgdPxzxDzkhRX5jq39emRaoNuPO1U4iBF7Z9mxOuM9w1gcgJN
         wRrNB1SYr+eAUvqLAz0x3EiyIzj2cXFfuYn0pctrNeS2vkNRPluY+ClztSgaNUY+geyh
         BjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JbTuBY/91g3yBFUfK1z+qbSCc0F2zZjnqVwhj9GxIc8=;
        b=Qvx8zvy9Y40ZPImh2uEp4iQQZTN4qzAn+V7ulROnruAcIrskd0sl8fYloVU+oCwPx+
         dgZDanDdHFbld+mRDCLR501qS1hgAuP20BBJXSuYbatvshET6h0o2qa0579CFbHlthj/
         GO1ddXdh/hMHNhDNdBmaLQ+E95QCwUK8gLXhkouIKzpBtpP44Gh55uWxpmCC/aB7xI6W
         kYbKswODUTV4Fs4zUwRMFlFyG/TMrzoqB6/hLCX11iuFXCf/7N4CvDcaMlKkYX9qJUlS
         1buBE6jAmy5a7Z90646KoF3gQOSZvdxTbRhTgXyhATCAkDbMQQ/4NGI+jXORMnvyKxh3
         9HFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OQz+hLdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z3si503129ywf.712.2018.01.25.07.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Jan 2018 07:11:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OQz+hLdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eejB8-0003Dk-M8
	for alex.bennee@linaro.org; Thu, 25 Jan 2018 10:11:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eejB0-0003DO-5u
	for qemu-arm@nongnu.org; Thu, 25 Jan 2018 10:10:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eejAz-0005N1-Ad
	for qemu-arm@nongnu.org; Thu, 25 Jan 2018 10:10:54 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:42079)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eejAz-0005Me-4g
	for qemu-arm@nongnu.org; Thu, 25 Jan 2018 10:10:53 -0500
Received: by mail-oi0-x243.google.com with SMTP id c8so5424439oiy.9
	for <qemu-arm@nongnu.org>; Thu, 25 Jan 2018 07:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JbTuBY/91g3yBFUfK1z+qbSCc0F2zZjnqVwhj9GxIc8=;
	b=OQz+hLdP3abE2I0u8VkvGk6hgg63jkSzZc8fVpAX/s0zeHDi3uLxhBcsZ7tsmWOnEx
	AIS5ZGnncgCD2hUhjHwJp2YkYUlrpeEQeQVCeXY0YfcSsFnMZebOw/Yrn9Kw3Zy1ZjZZ
	lB5yeTA8fI2eU3qQPM+5+RMvUNITy5Oll/yCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JbTuBY/91g3yBFUfK1z+qbSCc0F2zZjnqVwhj9GxIc8=;
	b=Gjt5gmnFQQ50Xv8tIt2H6ycS6fVG0wyfnj2wClMJxI86exih8qD9yITLWRdLow/qAr
	fZPl5Hp7xy1NS7suXQMo+602Jwx+kYWvxuWyfwvnOkVHVSsuoFWEqHzUpvJCvXPqmSEV
	x3CwYBNLlDsqMTTXxXinWnSTnDYGQzOUXJZ5VyVQquUdrr7yX68+0Ibrq4POEItBbnKN
	MpRAWjQAO84JkvahBJI3iGejdw/8Pvf9ZVOeINXhfzpXWo/WMkXGeTmLEu/NmV3QBT+/
	kOYkns7WsoFHnsvAfu7HpeWqDv3nH3MCZCJmQpEC3HwiJ9u8n21oLU4FXMVMm5mh8G3j
	l/Lw==
X-Gm-Message-State: AKwxytcreyiSUDjuLq/nenFX/dD9sQgU97apY6pRUoeckyDI7X6+MN2D
	0X5bna4v+UlD+CWPW+kUTY2aLxSX3RJ1uHVgzIpCAA==
X-Received: by 10.202.96.212 with SMTP id u203mr1572938oib.63.1516893052396;
	Thu, 25 Jan 2018 07:10:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Thu, 25 Jan 2018 07:10:31 -0800 (PST)
In-Reply-To: <CAFEAcA8pGXMs3hMxSs-t7qGfeR__H-CQ1roRVe5NFMCP8R2vjw@mail.gmail.com>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
	<20171209010811.GJ3037@localhost.localdomain>
	<CAFEAcA9oG=+mJ+jSGTM_z54S09gjHoFowDkOvofdkhJd+g3=Cw@mail.gmail.com>
	<20180122183301.GA31237@localhost.localdomain>
	<CAFEAcA8pGXMs3hMxSs-t7qGfeR__H-CQ1roRVe5NFMCP8R2vjw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jan 2018 15:10:31 +0000
Message-ID: <CAFEAcA96N1Nuh9rXVtWnmnmm_+xQRFiesdSLbTx4yJBGYEVJaQ@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and
 gic-version=max)
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
	"patches@linaro.org" <patches@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4RvXVipW/T9B

On 25 January 2018 at 14:41, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 22 January 2018 at 18:33, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> About QOM type names:
>>
>> On x86, all CPU models are resolved to "<model>-<suffix>", and
>> i386 and x86_64 have different suffixes.  So the QOM type name is
>> "max-x86_64-cpu" on qemu-system-x86_64, and "max-i386-cpu" on
>> qemu-system-i386.
>
> OK. Looking at the target/arm code we do a similar suffix
> trick, but we seem to have cut-n-pasted the handling in
> aarch64_cpu_register(), so it uses the TYPE_ARM_CPU as the
> suffix, rather the TYPE_AARCH64_CPU.

...and that's not as simple a fix as I thought, because the
code in helper.c for implementing arch_query_cpu_definitions() and
arm_cpu_list() assumes it can create the QOM type name by appending
TYPE_ARM_CPU. The ARM_CPU_TYPE_NAME() macro which we use pretty
extensively also assumes the suffix is the same regardless of
what CPU type it's being applied to.

Looking at x86 it seems that TYPE_X86_CPU expands to a different
string for qemu-system-x86_64 and qemu-system-i386. I could do
that, but it seems very confusing: I would expect a QOM type
name like TYPE_FOO to always mean the same QOM type.

Given that the type names don't appear to the user, I think
we can go ahead with implementing "-cpu max" for Arm without
having to first disentangle this? "max" isn't in any worse
a position than the existing "host" and "any" types.

thanks
-- PMM
