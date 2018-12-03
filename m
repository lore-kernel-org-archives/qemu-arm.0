Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7330615wrt;
        Mon, 3 Dec 2018 14:20:18 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UF0X6LYOwXzvYkxpI7XrUTRZB1SfIAicX7tVpAlpCnH/6QZu5GEfjCs1kJF9JtlbdbCPDz
X-Received: by 2002:a37:4d03:: with SMTP id a3mr16521669qkb.181.1543875618804;
        Mon, 03 Dec 2018 14:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543875618; cv=none;
        d=google.com; s=arc-20160816;
        b=vrGr8ExB7ZWuhQenDN0LOC3sii0wIx24iq+6CFMQy7wzRkyco9SbsK6vRvhM3p9vY8
         L5b/L7Y4IWk+/kxmNgG51WFDkGs62Eabp76iCydX+U5LIuvC7kac96mkkLzB15lVKVtS
         rNRYgLjSZUXbVSzU/7wH32M9GRsuWH7akJPBD0QT9KesemuZO4MMt6hLDr9CYnHm59DM
         McHReu3hFj6T1zfT5If0c3Nw37ekomvFZ3eeCAWK26OLRCm3a+mhjMTbjWzfVIp7lQ3Q
         BJuTnSfDuGRUIoj45Wb3jpDMNROvX5ne8LKDA7juYDedW8SjhHXzT+P4MCuTh9iVfHBH
         gxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=km0d16H2Vr/ILHXXWFAgC6cPD67saQ04ccI75IKaRv0=;
        b=Xc4pMIW2ADmxmCtVB5wQScbFYbAALV3QEc36fbLdgjzTjmbNEbjtYIb4IDDuG83Usx
         h2nUT3BjudiyECnrX1UzF8NFZNnqC01lglZ7+zsNeMqCp41iEfBP/vwo2gCsuEbLBu8v
         HCKc1drLBo9JOqGPWu3T0Vfg/j7l+QGUXwDL97i6zqd/uJyE1W1PAlZpgfh+yxksPMbi
         QwccoMJvWpr6qvt25K3y6LgVxVqGuJjTHWhAfZjfdRrtbcgStGbUTb4jgTLL7hunCd0z
         e/T2hxn/BRw1ZK7FBkz5f2qu2qV7H1zxt1u2PyDCcNowWtWeXc5q5OTXTxBWSAqof1rs
         R/0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bFgJZ004;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v2si405371qtf.321.2018.12.03.14.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 14:20:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bFgJZ004;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTwZe-00051H-9d
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 17:20:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gTwZP-0004rd-4C
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 17:20:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gTwZO-0001JE-BL
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 17:20:03 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42625)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gTwZO-0001Hx-44
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 17:20:02 -0500
Received: by mail-oi1-x242.google.com with SMTP id w13so12460494oiw.9
	for <qemu-arm@nongnu.org>; Mon, 03 Dec 2018 14:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=km0d16H2Vr/ILHXXWFAgC6cPD67saQ04ccI75IKaRv0=;
	b=bFgJZ004cWjDHmRyeVSFDnlqv+XqGP9zntQxLEUusjRev9TU4uijKgGpK/+biKVahI
	GCtUWTceNYTJ/I2rBH1jwMhohB8NU+D8+sVfP+sRKOuOPTlagPe++p2ByFpU8z0HrVFw
	h1NwaY3KKF4T3UQd3RGMJMUv8h+SD/D1GC1FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=km0d16H2Vr/ILHXXWFAgC6cPD67saQ04ccI75IKaRv0=;
	b=QJ2LwUije8SKaUH1efZDdAo/nGsq+Sa5BXw+rOxoVQWdzcxq6blDWGjYq5JN/bI8h3
	ha8pVKXmXBNuKlWnDrCaxJYrcmBH9Ge0A4qKngdUqEsaFc2URBbB3G1d1pv0PR4u/PZ/
	7rxcBtybO/j2/jAc6secXVcopvkn0ThKriToKhFqqvq5hWEpr3+P4gaxEY0bmIOgPipy
	LbMNwPf6wvvHOLF8ZtMcwIBshXwYIMDgJYSMFEaK+bZNTQgYM6RpwuXxM3c/QyU9YBof
	hUGuw4CVlm92+Ulofnn1CHhQoplaOXgjpzVIrHobf1i5Gy3dd9TZQoJIiqSOdtcQM5aB
	g3Gw==
X-Gm-Message-State: AA+aEWYPX4lcCVbqUSnTIM42fgmQsC5cqPNcjuuAY8sJWmllO5l2JqA8
	tMMjym02fpjX0WF1JVd+7eIpVEOPzqpmit8GRcuL7g==
X-Received: by 2002:aca:b58b:: with SMTP id e133mr10938295oif.25.1543875600662;
	Mon, 03 Dec 2018 14:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-8-aaron@os.amperecomputing.com>
	<CAFEAcA92+6NdqpB+L42cu1Ba7qvvHoLkjSDgcEDLvR=iqpd4gg@mail.gmail.com>
	<20181203204452.GB5549@quinoa.localdomain>
In-Reply-To: <20181203204452.GB5549@quinoa.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Dec 2018 22:19:48 +0000
Message-ID: <CAFEAcA900U3amGOGRKGNu+-j9EDhdrZ1U1U5MtoW5BeTo74iOQ@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v8 07/13] target-arm: Make PMCEID[01]_EL0 64
 bit registers, add PMCEID[23]
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oCASMlVYTFzt

On Mon, 3 Dec 2018 at 20:45, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> On Nov 30 16:10, Peter Maydell wrote:
> > PMCEID2 and PMCEID3 are only defined from ARMv8.1; before that they
> > are UNDEFINED. So these registers need to be only defined if a
> > suitable feature bit or ID register field check passes.
>
> It looks like we don't currently support any ARMv8.1+ CPUs and don't
> have an entry in the `arm_features` enum for it. I'll plan to add
> ARM_FEATURE_V81 and make defining these registers depend on it, assuming
> any future CPUs supporting it will use that, unless you feel I should do
> something different.

I think that the idea going forward is to prefer an ID
register check of some kind -- Richard ?

thanks
-- PMM
