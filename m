Received: by 10.28.91.67 with SMTP id p64csp1783046wmb;
        Thu, 1 Mar 2018 04:41:17 -0800 (PST)
X-Google-Smtp-Source: AG47ELszLmY6Kv7Sz7RS2WaIdaLBxmVTVbYQExebxdycyPqVue5RvoI+XETa6p5mSidxOsZ/4ZyA
X-Received: by 10.129.160.10 with SMTP id x10mr883847ywg.299.1519908077243;
        Thu, 01 Mar 2018 04:41:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519908077; cv=none;
        d=google.com; s=arc-20160816;
        b=0IHlHjITM1tMYLTsvlaS37Fx/NzKgNWmE018YY+4M6btdrWCr0cextGuBUPP/27P5g
         HQrzKeAcca2eyuqcL8JBMOAebeSJr7F+QRthMjzXD/+C3SrALR+YqHfd9OUaoaVtuV36
         Q8UAXFZoBFVe20L4mvTn9a/J9FjNdyvbgqVmbQoaFozNPMYxjpFEcHZpq/EISxdDajA4
         lHQ1B6PSC3uH2+E7/RmWzUCWNd4i9kVyP3Tq81Dwn0hgahDVBzyX6oFmJloK7StSXn04
         ThfeRijgMCJ+VIM3wFmoZT2xJoXiaOQ9dyBJ4BuAhu4wUIwuJkRPd+d3UjriTvwXwAnW
         dcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6gIWvBTQSGaBX4/vZgaI+n0mJ+TKMh0cVHuzDVDFdOw=;
        b=zD2LwmNX6oC4nYhMMbGztofxtC77t6lubqb6bfSq8pnwe8gASsBeqOVtx7u28ICnQS
         2rWxB/WBAOVWvlFRr6yulCmnaBHkZbiT/VQHZCcaBdOukQQ9gu5XVa5bNOLz4rNm/oFH
         lzNRU/F5tl3mFZvZ092p59Wy3ydAIM5c3LThZCABoBZVjvGOoPs9rdjl7utkR0ZtBEP/
         hgdy3faxz6Hns79tSxh6D2gl8zcFb3G6UCQMW2Z3BiQrOPUp1x9PhsO32LHMicU9lqY/
         0dFFLrq0In36o3cPjmMD9oSVVOZMwbPW5dvPhPvwnL4a8aijHsgiY+Jo0nEOW0mf36Wh
         my6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EHARHFVD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w3si617766ywc.570.2018.03.01.04.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 04:41:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EHARHFVD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56129 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erNWO-0001fO-LX
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 07:41:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erNWD-0001e7-E6
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:41:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erNWC-00029p-MB
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:41:05 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:46649)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erNWC-00029R-Fi
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:41:04 -0500
Received: by mail-oi0-x243.google.com with SMTP id x12so4331948oie.13
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 04:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6gIWvBTQSGaBX4/vZgaI+n0mJ+TKMh0cVHuzDVDFdOw=;
	b=EHARHFVDONItJNkUnMPbXWaF8TdpnKMJ3Hj90biyE+7YOh3/mMITLJ/rIKEwl7R7Kx
	F3s4A12UXXl30raHbcGd4x0KC9sY1shSMEBs6qTsFtE0Zy6iIt052QtWpRRag5ORlJhO
	nDJ4PJ3vW8+FeMGy7O2MyFZ7UvMl8VRsBUid4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6gIWvBTQSGaBX4/vZgaI+n0mJ+TKMh0cVHuzDVDFdOw=;
	b=aJ4rHmfu+1jQa7XIuRoj3PBH5b0aCYr953I4tp0tgPFk6lLxiFGd9l7IyjpkCjNbVl
	1bsi6KcRBhxstE05w6OOx965qGTKSTRFAKm4vBji/c3b3Ztf8YKG2SmRXIF6niPtnZDH
	jv/ffwPwE668ayCFeVoPjcrCyHO09XObvstIoJQ8qO8eSirYaS+IrcKjfrO+2/ceDzmB
	YhycQEZnChQKaOA3WStxu8/XwDEOBVI4rh3rF4CWC00fnPZioEXzvkKoiKqVM4vN731v
	wBcDQdZ2IN9lF0Z3FDiExIzKPBN3iMnQSTw8vxRIZ/BGCNTHll1C6Z5CIgyir3ZkAnDH
	7j9w==
X-Gm-Message-State: AElRT7FgFvN6welC+IVFKY/yuAeMsE7jJ+06nD8xeiAD99X5Jl7kWYzv
	+QhtUxJ93kyW3d/NTUsE3BcoGlgD8BmP0Wz6ljW5DA==
X-Received: by 10.202.68.213 with SMTP id r204mr1085157oia.80.1519908063534;
	Thu, 01 Mar 2018 04:41:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 04:40:43 -0800 (PST)
In-Reply-To: <4d63ab53-f056-9f86-4317-9565f1d8a792@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-7-peter.maydell@linaro.org>
	<4d63ab53-f056-9f86-4317-9565f1d8a792@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 12:40:43 +0000
Message-ID: <CAFEAcA9hDqrRNfMurJb5uJeyqVqyEHhz2cOQ74vZWKbiyoh8Fg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/19] target/arm: Define
 init-svtor property for the reset secure VTOR value
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
X-TUID: XE/2DxCsu9mL

On 27 February 2018 at 20:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 02/20/2018 10:03 AM, Peter Maydell wrote:
>> +        env->v7m.vecbase[M_REG_S] = cpu->init_svtor;
>
> Perhaps & ~0x3f here; that part of the field is RES0.
>
> That said, if the only setter of this property is within qemu code, and not
> from the command line, then I suppose it doesn't matter in practice.

Bits 6..0 are RES0, not just 5..0. I've added "& 0xffffff80"
(to match how we do the masking in the VTOR write code path in
armv7m_nvic.c).

thanks
-- PMM
