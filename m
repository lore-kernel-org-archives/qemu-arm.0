Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1094243wrt;
        Tue, 27 Nov 2018 02:40:58 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UUQTqYFGWwK/634hg3ElYlE+6sRbKrG6Lz9Z4d9XM/K/orjdEzcmxp60NOYu913pbs5E1t
X-Received: by 2002:a81:d201:: with SMTP id x1mr24007486ywi.9.1543315258766;
        Tue, 27 Nov 2018 02:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543315258; cv=none;
        d=google.com; s=arc-20160816;
        b=lSvmOcOGBN1EpW44URhJAKN+rdHwAJ2BH0SAD0PJRGA9lvWZ9ZdM7URiNwmuok6Juo
         +jxDJt9VEgaO/qRLQK4ufYOR6hP9kZoiVNQPycQ4ZxrKrkSuwt7ZD2itMnhllTo96DIJ
         teIGL7sSp3VvOFxtafHzhvEpl8KRncUktdRqOItYKqGw8tyonHimkIeu0O7ghX1QdRLQ
         XnunNJiWC871KG94OUsTJiBOsLa3/UH2wZ9KmOexnMfLoEzkCXrHJfYhkMcmj/7vuw4H
         CHu8upIaHsRtYlA14n5i2sAq7bmi71cE78gBwlsreI6s5QbF/dSJKBXU+1ZeqrvofMFL
         GYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Y1KH70k0/MboywEzficKDRFgfvT6anPMI49pHWnHKE=;
        b=0KFdCe22fwNIAb+BwseG9AutevO6/bYTvwNg6Wt3ceBOdJZT6w3d2l8miOHY3DUbhs
         21R1Nav94H6Mk00moPiNV8JUCZOeA9Y5wiQqc8nMhbxEH4JJQYQlr6KmKcZYL8PHcz0P
         EJ/CZManqqyYg+YI7KZ9bkgszzlmPxfmhVIU2VrUP7cHScvqGZVQmap/vVQuQ/ICkKUE
         VHf4VHpLf0gbTPOM7e7EpuNIusktL7OlrSVAqu91PFhlnGFWR8l7xa6GH2MAFv/SkT8e
         CpObS7KZFBdMe3ktAZBG8pL8rlfeJ4hW93kvZiBpzQbeZaZSV9LfSsMV8wH4264zXLQM
         L/XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D96XMvUh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b201si2336331ywa.162.2018.11.27.02.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 02:40:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D96XMvUh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRana-0006nV-4A
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 05:40:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRanQ-0006nH-9I
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 05:40:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRanP-0001QA-Ef
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 05:40:48 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43437)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gRanP-0001Pi-7c
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 05:40:47 -0500
Received: by mail-oi1-x241.google.com with SMTP id u18so18821255oie.10
	for <qemu-arm@nongnu.org>; Tue, 27 Nov 2018 02:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7Y1KH70k0/MboywEzficKDRFgfvT6anPMI49pHWnHKE=;
	b=D96XMvUh3BKy9UcfShxp7gfH6sO9wyjYGrPzYOIjaiFn0aTtRBMVnpG98fYZNN2uq8
	uG9h/p+i3XvsKDqmSYOZ+UY7qupokvJT4C7C393Anl2AnzOFrs/rH+KkTYuKF4j5O2Bl
	XICI6Ah3VPjQBD8FGxUU7Z4K6kZmg5HZzsZpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7Y1KH70k0/MboywEzficKDRFgfvT6anPMI49pHWnHKE=;
	b=VBJRh0kJJNrxKe3gQ7Wx/XWet56XP4yN6xiCYoRqktQzXpSGVwjAFJ3yrPdEvqbd4k
	rnVEoFhwB+j1ppijjKjGoHIfuSuzRKTiV9ttmx1spxozJRxFf1B420OtzIDxwdFkpR4T
	XbOSZ4CpUtEZmqIzKiIT8380EPuPq6G4FdqjIxJM4L0A4ihmIM+3gWCiBd2Jh/5KrA8J
	wXkfuPX4WuRWPghhrDqRi9oDL5IJw/2jMs2znOwF9EH6RbN60Xw+Zg4gZ76aEKO44LI7
	e1C27piqQL5rWCU4yY+SnONJ6rjTqhtDCHs3wj0aQS2wck8CmQP8eSR2fmhACzdpSiXI
	UQmQ==
X-Gm-Message-State: AGRZ1gK4fC3Ym8nhqjLxN5HwvbpcJ+9s6OzOs8V5t1DKgdwCFQpXSour
	NG9Xt+hS82KDcOA70vkEI4qisosUpyKIoa+wUjW6wg==
X-Received: by 2002:aca:2dc9:: with SMTP id
	t192mr18515764oit.325.1543315246333; 
	Tue, 27 Nov 2018 02:40:46 -0800 (PST)
MIME-Version: 1.0
References: <20181126191454.9455-1-ricardo.perez_blanco@nokia.com>
	<CAFEAcA8MZD1nBPqtPEX91v97si5_MgjXUCPOiJd-tzBg5KvF8g@mail.gmail.com>
	<AM6PR07MB536866E0CCDADD411210C7EBB3D00@AM6PR07MB5368.eurprd07.prod.outlook.com>
In-Reply-To: <AM6PR07MB536866E0CCDADD411210C7EBB3D00@AM6PR07MB5368.eurprd07.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Nov 2018 10:40:34 +0000
Message-ID: <CAFEAcA-mB-4Hib2CKYshpggCCSM-wT5fB8H_1LPzOhxoMjNayA@mail.gmail.com>
To: ricardo.perez_blanco@nokia.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH] [PATCH] Allow AArch64 processors to boot
 from a kernel placed over 4GB.
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
Cc: ricardoperezblanco@gmail.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vtzVGc6aARfz

On Tue, 27 Nov 2018 at 08:43, Perez Blanco, Ricardo (Nokia -
BE/Antwerp) <ricardo.perez_blanco@nokia.com> wrote:
>
> Hi Peter,
>
> AFAIK, there is no board in QEMU that has its memory over 4GiB, however, we are working in some prototypes and proof of concepts of boards with memory over 4GiB.

OK, thanks. It's a reasonable missing feature to fix, but
since it doesn't affect any current boards we can defer
it to the next (4.0) release. I'll send some code
review comments in a moment.

thanks
-- PMM
