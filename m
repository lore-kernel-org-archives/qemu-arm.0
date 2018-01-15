Received: by 10.28.173.206 with SMTP id w197csp2535071wme;
        Mon, 15 Jan 2018 02:01:28 -0800 (PST)
X-Google-Smtp-Source: ACJfBov/6qkBE/4sJ4ulN22jGhRjy2iOnYeXW+OZzWXyTHNM/R3NPa/1Gr6VQY7yOwVJsuMRp9c6
X-Received: by 10.37.13.215 with SMTP id 206mr16376215ybn.362.1516010488179;
        Mon, 15 Jan 2018 02:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516010488; cv=none;
        d=google.com; s=arc-20160816;
        b=Ne9wb9XB6dQJDMx2dvVs/VhoP2CEPSGXFqm+pRsGsMpCzH4x4EqIoBxuobBGPFYFqT
         2mSO8AjAXdwxKLPFburwUplgRq4XCZLGUsCsgqyo1x5NUrNeTTBRt4y8LM45VioIm/co
         T0aUsQ/2btMDM1WhJ5jlYY97t3RN4n7iVXVw2Nz57wdv44m+hoHcwYSBPPrwlWVA+xb5
         pvlu6wvK99EczJs+rfi/Y+NwAGaFdg4Qu4Za1e3A4jhfG0gnDJE3swyzgba2sSM56GU/
         pF8iRbZu+XoJlF2z20cLNPSWAxghLNffxEqyPOWQs49fsa/byan7qvZnqfhqMFfldsOF
         07Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OzikO5l/mvDmNficLHjhJPUO7+zyQW9Kn8QKVUNNc8I=;
        b=rcTySQ8TxhRxNuQvBmcjF813hr0bzKb+YBRspE6KLxHbbC6Nyn7l0ihBoEjlFihaKa
         4VlFx5Nb8SoCDgESXBUyXy9gnh9hkQC/kR61C6plzqedoaofBte63A26ecSOv3di28yv
         /ojkoGmyb7JGx64Pwn6zsZrOTWHsDKcoosG7DuG+8aZavZCL5DdBWBffvPiJ3cLjNCIN
         bpASyHiUdd0eiK1UZxpGmXYiqjdvzXKfSEcXCf6DTyfeVR2w40BCG/Kq0ErwE9tKm6w0
         9kgwlkHRSp8C5+AsY/jcgDpR/NtuIzHEl/2BikCL5nGcMPsMeRtQKgTnFiJbpknrGiFq
         IPGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X4mg0OH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f127si510476ywf.805.2018.01.15.02.01.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 02:01:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X4mg0OH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb1a3-0000y6-JP
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 05:01:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb1Zk-0000uK-Lf
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 05:01:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb1Zg-00064V-Q4
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 05:01:08 -0500
Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a]:45873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb1Zg-00064A-Ka
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 05:01:04 -0500
Received: by mail-ot0-x22a.google.com with SMTP id r4so6348413oti.12
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 02:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OzikO5l/mvDmNficLHjhJPUO7+zyQW9Kn8QKVUNNc8I=;
	b=X4mg0OH+XI/07RYF+0pzS4D4rinMv66cnwQzURWrS3GrnJN3oGTfVmVVOKQXZga4ol
	hirCh2PsMIehSlXWMTDjoRB6/WYcvH+XnxqsJ2d8SOHwxXiFn2KSobyTbQpvOweOx/+2
	5CD3rZoysHWQh/tZtjGfCzTBnJLeRGQlrp4gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OzikO5l/mvDmNficLHjhJPUO7+zyQW9Kn8QKVUNNc8I=;
	b=i1EGa8YvEWOy2KR/ZmjY58k/o/YtiNezt13JOOGOv7INP9c6rzKr5rr+SGtWa+xKzX
	rDxlqD26KfCheGMisrwlkUwLTLmQJIbLkr2wj0tISonvLtgDbNxyAcq2F99NUjbPbOcU
	HWQp62k/dMZncb6Sn1+wVU4e0HYDZTKDwiPLdGxM7eRvQjU0IP3NlAM6zOdSqPRXQSGi
	wZDiJPQE1UBQ97S4fR/zC5g6kaQb4zAPj9zVuMELJZqY53qBiUcoxLlWwoGHkzZmyYL4
	sRqU9NAzHPwkg296jQ2kBkJsgJ3kpjs+hdK2BQ3L8ui0rzQdKO/QyhuYsw9RXHYzHj3k
	NJvQ==
X-Gm-Message-State: AKwxytdKJ5WFp+EyPUvtRsHE2T0MgDIkO21zHh6ummeNaJ2q7PYRiFs0
	334sIdqeGH/bQtX7XCgmB9FyalW6QlTP8N8VN2bHOQ==
X-Received: by 10.157.2.8 with SMTP id 8mr1918090otb.116.1516010463818; Mon,
	15 Jan 2018 02:01:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 02:00:43 -0800 (PST)
In-Reply-To: <CAFEAcA8QfZBfujPdZ+n89x6rF0m7ohz+KsVX527d4xMnOu-5XA@mail.gmail.com>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-9-richard.henderson@linaro.org>
	<CAFEAcA8QfZBfujPdZ+n89x6rF0m7ohz+KsVX527d4xMnOu-5XA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 10:00:43 +0000
Message-ID: <CAFEAcA8e7BDCW5nF_SzrnUTGZJiRoUnMZ5APG=g7rOPCzRXM+Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22a
Subject: Re: [Qemu-arm] [PATCH 8/9] target/arm: Add ZCR.LEN to tb->flags
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
X-TUID: UfI1U/FPAOeW

On 12 January 2018 at 18:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> For purposes of not having to mess with migration state too frequently,
> I think this patch should define zcr_el[4] (and add that to the
> migration subsection for 'has SVE').

I realized over the weekend that this suggestion isn't right --
ZCR_ELx are sysregs accessible via the usual msr/mrs, so they'll
be migrated via the sysreg migration mechanism, not with
explicit fields in the migration structs. So I think we're
OK to leave this as TODO for the moment.

thanks
-- PMM
