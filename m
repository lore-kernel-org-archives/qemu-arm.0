Received: by 10.25.21.96 with SMTP id l93csp482019lfi;
        Thu, 30 Jun 2016 11:26:26 -0700 (PDT)
X-Received: by 10.55.161.73 with SMTP id k70mr19842411qke.189.1467311186099;
        Thu, 30 Jun 2016 11:26:26 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x185si3583599qkc.165.2016.06.30.11.26.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jun 2016 11:26:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIgfR-0003tO-Hk
	for alex.bennee@linaro.org; Thu, 30 Jun 2016 14:26:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIge9-0003Cy-T2
	for qemu-devel@nongnu.org; Thu, 30 Jun 2016 14:25:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIge7-0007Yo-T1
	for qemu-devel@nongnu.org; Thu, 30 Jun 2016 14:25:04 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33534)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIge7-0007Yd-C5
	for qemu-devel@nongnu.org; Thu, 30 Jun 2016 14:25:03 -0400
Received: by mail-vk0-x22d.google.com with SMTP id k68so35131156vkb.0
	for <qemu-devel@nongnu.org>; Thu, 30 Jun 2016 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fD/sqwR6mQmzkzhwvlTMeyY6Oq3/gITaw/PtDorq8h8=;
	b=DERaWbcA+sWbknAvRfYTRvMcfWsuQDbvt5ebRp/nvF0Y3qtWD4hSQ40SISk58jUtAk
	rxalXPeWmU/T+szMDbD8jcfWFHgXBJo9wP/6OUwSqbZFz85yJSsPkDLNSVC2v1K9B+oO
	lcvkXP+kT3cDEXYzDueYjyFbIJhh+vy8RIQUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fD/sqwR6mQmzkzhwvlTMeyY6Oq3/gITaw/PtDorq8h8=;
	b=eSC0ZAzNcjZkqiYe3z7R2NuWuuj9jnl5fCd4kR4rbNMqS78x1+G8H3wp3p8PpOV93i
	bNL89stKYKS55F6LnYZEDHle+gZlgcGjf+3QBe4A2gQ4bGaNQ/eZzjUNoi0Il5JaCZT7
	NGOLYz1aYRJD91tHTDCPlJ+WgaNcJ9HBurx4WqCIYQ/Sr8arffL6Yp0zBMqWVh3RI1jY
	cTnDNlDZTup+DCiMfltxpzqB0b7yXQPcAoAhbykQv6YFu6pTs+1jWSt05Gu/cMIx7kcI
	kv3iS67Tcphd9R31RdGHWNeZk61s/s+4imQ0B55rOGXJ6uQ6n/O4bM63SkeDGR9YPdO8
	ivUQ==
X-Gm-Message-State: ALyK8tLZt07aHDOo0dDCG9IU+KMT9EFHtQAdTvPScWZ0s3vbRdoVSBnGtHw3tjk+I2hMtOpRCfnHc5AGFHnyb8j3
X-Received: by 10.31.109.197 with SMTP id i188mr7257754vkc.157.1467311102882; 
	Thu, 30 Jun 2016 11:25:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 30 Jun 2016 11:24:43 -0700 (PDT)
In-Reply-To: <1467301824-10123-1-git-send-email-clg@kaod.org>
References: <1467301824-10123-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jun 2016 19:24:43 +0100
Message-ID: <CAFEAcA_iAVMPNxi8m=uv9OTGoHqxg8egsLT+SN=YFJA=tS4B9w@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-devel] [PATCH 1/2] hw/misc: fix Aspeed SCU hw-strap2
 property
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R8KFINdTnANm

On 30 June 2016 at 16:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> These strap registers are complex enough, let's not mix them.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Was there a cover letter for this patchset? I can't find
it in my email...

thanks
-- PMM
