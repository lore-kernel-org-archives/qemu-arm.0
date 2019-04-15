Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2415783wrx;
        Mon, 15 Apr 2019 01:34:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5cL4uoHfpZnZhFXp+JO3cV4vpiGXp+2IU0oCPA3JPUKNZBb9RmVw5s0qLUxcG7gFpcmpA
X-Received: by 2002:a1c:2348:: with SMTP id j69mr20138359wmj.35.1555317291691;
        Mon, 15 Apr 2019 01:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555317291; cv=none;
        d=google.com; s=arc-20160816;
        b=tBuE0FxveuqgGo19wwG9+7zhZ8HtSCAv6TOD2pqvAmWx5NhANDtcEGJuCtDWrLRANH
         fWPw0Sx5z5DXLsy0XNItu8Qsig1ZwN14SJ597+C4BdMcTcr4pIBXvDl/DJR+CliKwxl6
         /A0wGrnjdUXX6DdQhTHc0ZI9CZLHj0ZOWvCGpRxOonhwLyh0mTxYFI4ZTBG4OMeagV8z
         DtY0GkjYwYcOaz84YFsRR+L5yES/HG19+bDKzTbhaHVFAEx0ipZwoTs5mOROzdl571yy
         rQHlsDxjWQMNRO3ZzlHv3rFLH//oe/sMC/fwBHDnzkUf9NcsRjrnWloxvAu+ztid5Dhb
         /+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TuUca3hUw8C2EF45NztL9SJGg+Xg2+IwmjG5gTf7Ez4=;
        b=luqv+eTb1CqZlKyy65fH2SArZAMIaS4uRQcBLFJzOeSQwFVci6310UDkg0j7jXWRo5
         oZVwx/gffWFBLOzi7ON8+9tIV2bvP5oqvYqYjToC9FLcP/AS4hSsSlm8mHhQu+s5dpna
         NGWrq7QTqbHyRlXKD++dBGIpoA39y8yiuzOtjnkLPvdDgYw5gH2/rofVVnMcdxHl7HAF
         v7HvY02hh8WCUWUI6V37q55lflR3A3aUMt+syP78Usi4AqmYOwCq2O1bjkcrezXvN9vK
         n3I9j/bS5H2DQgbfN3UHJHBtlHXhnjC0QcjpOPvlOhqdzoUyISY9EYnUfQlBXLh4a0DD
         jWkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DMq/XEN6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si33794807wro.54.2019.04.15.01.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 01:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DMq/XEN6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:46683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFx4k-00073f-Q7
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 04:34:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hFx4X-000737-KU
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 04:34:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hFx4W-0004LA-RV
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 04:34:37 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:46130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hFx4W-0004JP-IA
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 04:34:36 -0400
Received: by mail-oi1-x22a.google.com with SMTP id x188so13028861oia.13
	for <qemu-arm@nongnu.org>; Mon, 15 Apr 2019 01:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TuUca3hUw8C2EF45NztL9SJGg+Xg2+IwmjG5gTf7Ez4=;
	b=DMq/XEN6fpWkcO3EhrRYmBVh8LV2iCPAPCcvbxS+L5bDzrRXoS8d4ZPeI8n/ZQ5EQM
	j/uFq1hApiq+gWPy8Xk8+6wXIdFnFk0WPL3JVByKdadc/VEHwMzRcYETLkf/XUlaSJsd
	shZM/E0za+kB23pSQilXv7HgR8EqF4d6FSte22viFDvAt4qp6rrjbpu7JY+QpVz8/NNr
	K4icPpKxeJ2+oTFYJbrGQZgs0Sl82Q9Je20SGp+V+AstplDFyXRKKsM+ywsYUeag934V
	xmVsa2iTb/AtUkbMEBYUnhnjzjsHwm+fWEqg3HBCVsgTU3rCYRuFB2cFuFS1/IHHNi9h
	JwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TuUca3hUw8C2EF45NztL9SJGg+Xg2+IwmjG5gTf7Ez4=;
	b=GZ09mshZH0ojBoNoxyEQBjf8dXkzHiJPcgGjlJ4GDxEvPMqW5VDJQ8Svsj5+KWEpWS
	N4fYETPmk2ynsiick8cFrerbL2vtEhTZU9W6puqd74ggox/nA3Lvd1Oz8WY8IIlD0BPf
	eXLqmr0ZM/ujrLY0OzPwGiGsu+tPJYyAQoKcfBhvfpXxvCAFTXzwtx7zwnOlMredKtaE
	LgpCdbDdTpD0H2NfyFWkpi30fwYaAcaGv+3mYmy7ablbLSUcpIc2UX6UewRBwniEDmXH
	fCzUiFMhfbndzko0pqEgvWaprU5MgMpbmlAxmAE8cM089iwXw4b7s9U6yx5KapcgCnP+
	Mgyw==
X-Gm-Message-State: APjAAAUWIjPE9KZZgPf7tIpM4JgLS3Y+FhwVvO8lAGBdFnc7jDqw+Jez
	S1jT4KITtEjlreZQ3S4tSi3e/fc0Vtdg3+XbeGPMvg==
X-Received: by 2002:aca:e054:: with SMTP id x81mr18146241oig.146.1555317275751;
	Mon, 15 Apr 2019 01:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190411153942.4533-1-peter.maydell@linaro.org>
	<53930e87-3bb1-fdd5-a8fe-8603c0adecc2@linaro.org>
	<CAFEAcA-dbGvhgTrBKEtx-CPS7f2NJO5X+dj=mdcm+NrkF=uynQ@mail.gmail.com>
	<0ee4fdc6-c782-d5f5-ec40-9e25c1c9dd1f@linaro.org>
In-Reply-To: <0ee4fdc6-c782-d5f5-ec40-9e25c1c9dd1f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Apr 2019 09:34:24 +0100
Message-ID: <CAFEAcA-0oCc+9=LnpMJ9HmhsiSCTM9wA_prNS9MdNp6_157y6g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Implement NSACR
 gating of floating point
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WMhery180ZNj

On Sun, 14 Apr 2019 at 20:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/14/19 8:02 AM, Peter Maydell wrote:
> > There's similar wording for the effect of NSACR on CPACR, so
> > again I think we need to actually make the bits RAZ/WI
> > regardless of their underlying value, not just force them
> > to 0.
>
> I don't see that language for CPACR, just "the corresponding bits in the CPACR
> ignore writes and read as 0b00".  I'm willing to believe the manual is sloppy
> on this point though, and the "correct" language appears only once, somewhere.

It's in the documentation of CPACR cp10/cp11.

thanks
-- PMM
