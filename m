Received: by 10.25.0.6 with SMTP id 6csp106882lfa;
        Fri, 2 Jun 2017 02:00:45 -0700 (PDT)
X-Received: by 10.55.105.133 with SMTP id e127mr7072131qkc.19.1496394045791;
        Fri, 02 Jun 2017 02:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496394045; cv=none;
        d=google.com; s=arc-20160816;
        b=g3QBVv2ZKkxk1Og63W1WkMxtT429kkGMv+cRf9WKDqalssMRKMrQNUZLKTixx0WjOY
         ul5vXOvBbEfmxXChyeDsO/uOD2yYco56JSHXGYDrcbKJMfiKeLjss/1fAv+9bd7C6U9+
         P+BpeFi3V87gA+1hE7xB4Luab967wMmtBD5Oh9ARTkVEcIiF5s5hjbEXeInBCQbz1iDc
         KO1jy6XIJ8hEDovNUnukx2FTpNqVmXU4z+N41wrD4hjB3Lhiwi3NgtzOdOw2ouOBckek
         mSL6oaO3uf1yFI2xTaJJSxNcc/1k4iRpLYQFVCXrcfkQgvZJ36EdsQ6Nc2KuG/sY/7jh
         8daw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=K7+cq8liIRxMRJcaCshoObiFEheDprYvdNmkPAXF14o=;
        b=c1u/hWJFr9ONaauwpU9JeT0H4gGGToRYIARQwxKFQW6gmLkbm1K/pBiqw3MtzTXP2N
         Z281Imx2sYEW/FAjetLQNcx1Ci3s/NExL4xnkamPWUtjmvGcX+SaZCBmWTc8QMIoEKNE
         pf9e1asS38WlEuh6lBTlEOf5QpWilCR75qG4MACTy0SriHgFv0kappJ8DQLp7mv1IJBN
         z/LvsHE5Tx05dUm34a7R/Ftklw2qO9hq2cdctQlYIQde59E+abx7SO0gCPQR4itNHX1r
         Gl1Q/BePl9p/abmA7XPtJ5i967v7ja9s08/UtoBnHqg4v+/BlDAxfg3ZSSEQtXcL7LQ/
         43gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o35si22998407qta.108.2017.06.02.02.00.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 02:00:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGiRn-00012N-55
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 05:00:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGiRi-00011E-45
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 05:00:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGiRe-0001Nu-Cr
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 05:00:38 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:33265)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dGiRe-0001Ng-6D
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 05:00:34 -0400
Received: by mail-wm0-x233.google.com with SMTP id m7so10479378wmg.0
	for <qemu-arm@nongnu.org>; Fri, 02 Jun 2017 02:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=K7+cq8liIRxMRJcaCshoObiFEheDprYvdNmkPAXF14o=;
	b=HhdAtNed7QUwxOHfCPkqNE9e8jFas435orOMaJAQJR+ysURzinWZzl0Zp/84ll1yPH
	U7eyMqhfJipVAECzo95gwaQDacfhD9Ck2smwnG54AOCqJ6appXrXaYh0qEP6ImOnxR3m
	b7n1/pbdAkPXwvxCvXXEAOkPfbum6m+tkSkQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=K7+cq8liIRxMRJcaCshoObiFEheDprYvdNmkPAXF14o=;
	b=ZT9tNrC7F/j/bcEIOBG+0vLDPpFMl4A1lJ+5cge0fQ0uYww5J9xie8BcmR687J5lBf
	cO0u84vCx+4C3RrSQOM5/7Y3hGDm8JniSaGUpTkgSEcWvShAbtAN5P5EhaHw98Fki7XX
	36VEOCAQz70ni18/u+EA9kEqji4y6vUJ6DKk0y+9EaN0/MGEFq3VEQdL5dxQ5rLKtWnm
	wVibZ8II/bqZIHsdOCD4df7jn+ybVYze/FCSpJkL+ihXle798R0siJv9F2+iAIWug/0m
	eTlMNEHWDCezWpLv2tp4DzX3vzyp7EVmpliEeuWn6AZPnH21qYd90H56tln+dx9f1ju9
	FfAg==
X-Gm-Message-State: AODbwcBOHgBIz7iDD2Q1/RMZESFI+ve7/PCdpaos6FMN7aEq2Zf/4vBD
	z/zGe5CbIEnjzrRgf1xiVYqfgjQebSVGbLg=
X-Received: by 10.28.103.214 with SMTP id b205mr2224908wmc.125.1496394032878; 
	Fri, 02 Jun 2017 02:00:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.178.66 with HTTP; Fri, 2 Jun 2017 02:00:12 -0700 (PDT)
In-Reply-To: <c6041151-8552-6ab2-54ef-1489340e4766@amsat.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
	<1493122030-32191-10-git-send-email-peter.maydell@linaro.org>
	<c9954451-ad9b-2365-5ed7-bc4c29f40abe@amsat.org>
	<CAFEAcA8aAwM-_9h1L23kjmfoabvivYdbKcC5e6YEkMXyUfTt5w@mail.gmail.com>
	<c6041151-8552-6ab2-54ef-1489340e4766@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Jun 2017 10:00:12 +0100
Message-ID: <CAFEAcA9tVXuo6frOMvqRmq1dK5uuk6yBLRoeD15P9NCH0LCfQw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [PATCH 09/13] armv7m: Implement M profile default
 memory map
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
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3qJFSGWdXhcE

On 2 June 2017 at 06:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> On 05/30/2017 12:11 PM, Peter Maydell wrote:
>> This is the arm of the if() that deals with R profile, and R profile's
>
>
> Oh I completely misunderstood that if() indeed. R and also A I suppose.

A profile is never PMSA -- arguably VMSA (MMU) vs PMSA (MPU)) is the defini=
ng
distinction between A profile and R profile cores.

thanks
-- PMM
