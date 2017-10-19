Received: by 10.223.197.9 with SMTP id q9csp6950857wrf;
        Thu, 19 Oct 2017 08:45:45 -0700 (PDT)
X-Received: by 10.55.76.85 with SMTP id z82mr2556716qka.183.1508427944946;
        Thu, 19 Oct 2017 08:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508427944; cv=none;
        d=google.com; s=arc-20160816;
        b=DwYmZWfJ+y+E9k7s1LLBOJEyAOXzURTo0dlGaiZhJrjJksGI9azU9GDGDhGh02em37
         C4pnBI6LRqrbfrS/ua/MxeXaVR6vjWnQ7r3a+QmrmseUZASrRnsz07lKn343mQFJJ59I
         NzGzH8d2JoS1bq6ZpOqVCOFsFbG+re32O0JesOzV7XLmdnjEEp1yMKy4cQ9KwwPU8xfA
         YpCxYHJC/kXoezjwBdJ3jo6mxuJRQz2gWo/r8LUbseVEozo7+Brxv4pRO+ioJc7VeT4q
         bp5o5LHubbFY9EuWpghHpBlkmufEDDVA8WMBinEv9hsnFx+zl/+7f4l+zrlGFgz64V7u
         /LAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=xUolPh86HyCfbyjwoeDxvMxoegRrJ/YoB1sjaE6avV0=;
        b=j8WzOViXuMnK9E5q8C0/k03rOmTK51f8WoTEqjgsd7Roui+sK4dYzRuIQWDhZwVesN
         3czoG7ssMANKap587gl8E73ih3AXe1MLkKRXGpU/1HRT8ZXlKQg7LFBrhNv/jlrW3y+Q
         Ar8Lu0UnotikTvpnu6UxtgKu+JDngIJYPQqp7RZ5UEAFGU2YPZ+0z4ofYXenFaA7LceP
         Ive21YzkzrD9Xfa8nSF0HFsBIOwUfHGrbIUcP0UvL3kuUUZfxd9qtwtJnDl1MnZQgQtp
         0LazPnELxkgG9M4KbnYGgBJvdjAxTLxo+PgMekd90mkitkYzsCUvVzcn3FtXQZpB8k2Y
         C1pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVTPx4gV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m29si7062526qki.30.2017.10.19.08.45.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 08:45:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVTPx4gV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5D0w-0003Eo-PC
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 11:45:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5D0k-0003DJ-Be
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5D0j-0004mS-Lf
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:45:30 -0400
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:46498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5D0j-0004m5-Fr
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:45:29 -0400
Received: by mail-wr0-x232.google.com with SMTP id l1so8797587wrc.3
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xUolPh86HyCfbyjwoeDxvMxoegRrJ/YoB1sjaE6avV0=;
	b=bVTPx4gVvTBphkjNZ84AqHr9MSIq0H/vu7BCBV43xnZTg1bgi17ZKe5e51fSA1CB9F
	zcyFSTHqYMaespoAk8ZFlxXrQSs5MS27epwkJyMMQR675mKwHORF3amRZQwqs1sYXF/A
	dNaveVZ+7on5xjdBaSWcKAjsMgWLf04jr7T5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xUolPh86HyCfbyjwoeDxvMxoegRrJ/YoB1sjaE6avV0=;
	b=LG9sXbU1RjM08EirL+9sEE+BGWZ5xFwPRZOhmkgWk7YmB4SL9q2VL0qX2zcctjxpjP
	9W+RQS7/33yPV/6b5s1pBmeZonbOfzqN5liI9+bPqjYKgaCxAl8zWbOVCfODeMKZZhXk
	s842vWL4Fnij92UNygIVJkN+g3yLJdK92/MYiK2iYXjmukKJq/JLeV7VQ+Vo0EJZ9RvT
	aE4/MULuyTINf6gue54T5PiwQ2LKIszBDAPL4e3j7uh/IikZZEsyj0q9OU+loXh0Zr1v
	Xwe7nxzQ3H9xYzRp6AZu2SEtMCEpmYlezE0ZgSFG5bWreNUZDxHZ5NQU7SsSEeN/v8+4
	f09g==
X-Gm-Message-State: AMCzsaWcR3atEf2fhliUlchKJC8ato3364dKyMnpsefxjTx6Yu2j66G7
	bs2ksTQ+OpJVbTkKx5nfx2SUBqsY++Glteg2LjxGOw==
X-Google-Smtp-Source: ABhQp+RyT2hkrKPie4KLBESq4jPTXUkCHcuHzVasDXKnBEbIsuZDUexCLIx9tioyqrAQgocfPBEaTumt/uA8/yTgsJo=
X-Received: by 10.223.128.164 with SMTP id 33mr1942350wrl.138.1508427928367;
	Thu, 19 Oct 2017 08:45:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 19 Oct 2017 08:45:07 -0700 (PDT)
In-Reply-To: <20171019151249.13663-3-clg@kaod.org>
References: <20171019151249.13663-1-clg@kaod.org>
	<20171019151249.13663-3-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 16:45:07 +0100
Message-ID: <CAFEAcA-thMBh7OQH_RwXFv7H-oanqJoObRjuotXDeX9qCOThgg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-arm] [PATCH v5 2/8] aspeed: remove
 ignore_memory_transaction_failures all boards
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c7qD6+BP0Fhv

On 19 October 2017 at 16:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Now that we have a dummy ROM device catching the invalid writes, we
> can remove this flag and work on fixing the current firwmares still
> accessing unimplemented addresses.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
