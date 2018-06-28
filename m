Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7614477wrq;
        Thu, 28 Jun 2018 09:21:06 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe2goeSMYPb63Py7pRv/00a8+s5g6FL/L+vLzM80L7/nyO3PHaSWggt59Emac4saHhBcz9S
X-Received: by 2002:a0c:b3d5:: with SMTP id b21-v6mr9825336qvf.80.1530202866874;
        Thu, 28 Jun 2018 09:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530202866; cv=none;
        d=google.com; s=arc-20160816;
        b=i20g8bsKxuFls4J5xrb00RkmCpHlYuqHBReIfUyOGhrslcCEu251WjQjnoeXl6kn30
         fW3Fh3I4Nj09eQA608twPFJzMtce5arJ5xMZxq3oEvuSj7vWQzIUNpr93Qz4BSIxT24I
         B/lVes8rYL0LfJ0Ld5e5sveolMOJbw9pdyvJbWGbSWdMjyq3rAbp2PdqLPdsUi372ad/
         9LUoY0fmV3lRTZqgtBeEPFbL4n5TJgEgvigWWSfuOfDI9oXfn/MpfE7Dc+/4dOGvP0Fv
         KPcxfoop++A1qwpn6jgRdfDg5dv7iqfdUki8FpsWWjk9xIRoBxbGisAh1UZ3l1DbhX6u
         1w3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CoC88SBPzvI/eFDu/InSUPQs+ka9R9CinrP0pBEi7Hc=;
        b=vUL+nu/nXC8coPUB8uoYMSqI4Uxkk5LbqrCildYP6TpSCSCZJh+X255B/ekWP0uQdh
         6KdKeu2PcprEvhE/RRANOdQm7EJyXcUkRXgZ2q642nTAYvAKVh1ikMuU+WS3pvNBiTUO
         KuWaf6Ao84CsZWoQACTeglbhFs/oBTl3fS5glv2QAigjHIyDdv/ekRBpH6sjh1/3RqpA
         X1bOUnJEjQkU0uf3jrfIA61310nRCdepuZjDNGvzSbaYb4+2DMz6yhd6RviM8Bg1WVkk
         IGSMu2O251CnrRlkMv5HZEwbyZ9iu+hE3J9vhGNrSyy9sOY8n4mTupXviYjtqfc2rqXx
         oZIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JF9v7zQW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p46-v6si3088261qtg.201.2018.06.28.09.21.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 09:21:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JF9v7zQW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYZfO-00045P-DT
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 12:21:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZfA-00045D-EK
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZf9-0006p0-Jv
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:20:52 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:41542)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYZf9-0006nn-Dd
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:20:51 -0400
Received: by mail-oi0-x242.google.com with SMTP id 21-v6so5729186oip.8
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CoC88SBPzvI/eFDu/InSUPQs+ka9R9CinrP0pBEi7Hc=;
	b=JF9v7zQWclrndLjoC8is/etXwpdoG7JWDVS5s6sHnVRAlWrc+1DdQMQFZaBzVO0D17
	e9WGCgfw9phgu3/vBQbu+dHZglw/LOqUT0D3qIbM4yROutiRXCnTStbseEvDslYikXP9
	MjZaxT5f22G6bGFBi/EBsPj31M0qWw/xVSNuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CoC88SBPzvI/eFDu/InSUPQs+ka9R9CinrP0pBEi7Hc=;
	b=m00e8SNaM2LjijNOEAGq8+fMmnxq622uwbBDltHk0EDsHvRklOL9R/ME42MGWEJ53D
	fA5SUHdQ+MvRIla65DAN+TemWqpqtH5j3FDtrMjSOPX/NiGEyA8Y7ey+0edap4R7kKw4
	UEBIAAJKmQrhfrsRyYtqjInYbpGwQDhKpmtiR7itBCJozw/HWTzRPR7AJNkQzlbcoRSG
	U6PkZ68/nlEaykWtAcyCrJhTIMI8tV7Ie/yFVafO9ETEJOeuCWwu1PlO/cmc4V1fx9Pt
	Zqce3iWOP3Ug7eZPM9vOJyJ+zs8yxUMDlmGKEpbWAj+rkS5gTNbxXL4Bi8+nif9iyAzH
	ezJg==
X-Gm-Message-State: APt69E0vdcs6ZvWHKldJAgpSvUSAM5iY/7Hay/ChbUoIz8wTvQGuZySc
	tAKgou/w819hd6cxGBaJDXl+E1X1q9VblUWV70ia/Q==
X-Received: by 2002:aca:743:: with SMTP id 64-v6mr5713963oih.164.1530202850414;
	Thu, 28 Jun 2018 09:20:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 09:20:29 -0700 (PDT)
In-Reply-To: <1529699547-17044-5-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-5-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 17:20:29 +0100
Message-ID: <CAFEAcA9WbdJSY57hqzRiZVTiYR8_oCYD5WUp_ueVjhhbrw4cKg@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v5 04/13] target/arm: Add ARM_FEATURE_V7VE
 for v7 Virtualization Extensions
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4jG9LHc3xHCQ

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.c   | 21 ++++++++++++++-------
>  target/arm/cpu.h   |  1 +
>  target/arm/kvm32.c |  8 ++++----
>  3 files changed, 19 insertions(+), 11 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
