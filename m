Received: by 10.25.205.13 with SMTP id d13csp10415003lfg;
        Fri, 6 Jan 2017 09:34:36 -0800 (PST)
X-Received: by 10.55.161.212 with SMTP id k203mr12310702qke.234.1483724076141;
        Fri, 06 Jan 2017 09:34:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m86si40874423qkl.237.2017.01.06.09.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 09:34:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPYPR-0003M9-JY
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 12:34:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPYPI-0003LA-Fi
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 12:34:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPYPH-0007Fv-Me
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 12:34:24 -0500
Received: from mail-ua0-x233.google.com ([2607:f8b0:400c:c08::233]:34576)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPYPH-0007Fh-Gs
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 12:34:23 -0500
Received: by mail-ua0-x233.google.com with SMTP id 34so372284985uac.1
	for <qemu-arm@nongnu.org>; Fri, 06 Jan 2017 09:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KbrjxYa/baeNRl/aQSfrE8zotqkoYhYQ/KC2qnTuK9M=;
	b=bdtt6/+yTLZ+OZl3fvSZ5RI8f2a06Nm4YUHPjFqJzfU1xJft2RzpHwn/mFw4vMhq33
	AI+k5uBi1wbStMTrkiPcNbej5cH1IzRtB8ROhb7R55qy0YXUNh9p/ji1Sn9R0fLAQT9K
	3uomK6akTWmC94dY9GVAGIfXgPWK3AMcrs2wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KbrjxYa/baeNRl/aQSfrE8zotqkoYhYQ/KC2qnTuK9M=;
	b=rnzCCmmFzTnqO/ZpAPQeXdL5FBwciThw0ZFAXH9h1eXzCF4rrq1DEzhFlVQccI7oGc
	3PVuC8IskV5jnan8TRrxRcZyPMqImegrf1upYmu9VYwJNh5Wgzfg+Q92ZwUpd2ScjMq7
	t6DnFMqt9JiDOfyrF3zJMZviyEicNSjgEiPfS6XcU8iHe+88U98OA3sdfpLS7cxjaa1R
	KIbhGfYnByNyHW0MbHLsudS2HpYNwUZ8v5JuET78ec2kbV0j99zcL9EuMMC91Dfo+wUN
	s664i+rTJccUuVwULWCgTE1OfyWQOBuLf/dl3qGAggnfLHgBuKj+V/lRm6z82vRhLW/M
	fvaA==
X-Gm-Message-State: AIkVDXLiBOzBkzjYd3Gazk2jN8WsY6lSE1Yu/zB7d2GPW3iaYlwc/avtNJKWv994hRVKG50ejpwXxE/aaGKJrPZp
X-Received: by 10.176.3.137 with SMTP id 9mr50653713uau.120.1483724061380;
	Fri, 06 Jan 2017 09:34:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 6 Jan 2017 09:34:00 -0800 (PST)
In-Reply-To: <20170106162116.12859-1-kirkseraph@gmail.com>
References: <20170106162116.12859-1-kirkseraph@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2017 17:34:00 +0000
Message-ID: <CAFEAcA_S-83pQVS-LJMWDzVu0Zk3+kpYZ2uZahkpDaeNAgaHCA@mail.gmail.com>
To: Seraphime Kirkovski <kirkseraph@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCHv2] target-arm/abi32: check for
 segfault in do_kernel_trap
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OcSAQVUD/Vmw

On 6 January 2017 at 16:21, Seraphime Kirkovski <kirkseraph@gmail.com> wrote:
> Currently, the cmpxchg implementation tests whether the destination address
> is readable:
>   - if it is, we read the value and continue with the comparison
>   - if isn't, i.e. access to addr would segfault, we assume that src != dest
>     rather than queuing a SIGSEGV.
>
> The same problem exists in the case where src == dest: the code doesn't
> check whether put_user_u32 succeeds.
>
> This fixes both problems by sending a SIGSEGV when the destination address
> is inaccessible.
>
> Signed-off-by: Seraphime Kirkovski <kirkseraph@gmail.com>
> ---
>
> This accounts for Peter Maydell's remarks.
> The refactoring here extracts the cmpxchg code from do_kernel_trap in its own
> function.

As the patchew robot notes, our coding style wants braces on all
if() statements, even one-line ones. Other than that,

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
