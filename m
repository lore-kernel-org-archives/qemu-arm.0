Received: by 10.28.173.206 with SMTP id w197csp2970111wme;
        Mon, 15 Jan 2018 09:24:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBouLMrALhU1hxx5bwTRTQt8ZZ7d8LNXm/htYlo4ja79nXRxHe7gbFNz/QnXY8yiTgplbvRTZ
X-Received: by 10.13.228.1 with SMTP id n1mr15628895ywe.6.1516037072928;
        Mon, 15 Jan 2018 09:24:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516037072; cv=none;
        d=google.com; s=arc-20160816;
        b=jCJ2H+NkNTAb+6d4ZqEJcUGg2rCqyYFrJ5oBpjNEMCWI+nOcLC7TI8IDCnw9gHKBca
         FajP5IRfvCz+Awp9B7KP+2lUUDeh247iLMqDuDUYGiZAeCeyeUdBuhwLJ0b4nr9Tkh9l
         J7bWTc853CueLRbKlaoGIvNzozzKDbM+XuKiZZ4F3a0S+oKOStMbJRR2s0NK4h4HAzL3
         ZYpV+hgpa85B/XNjt2OzEdDgzWv4XxjTkH7IICaqCbdwif9X36HmV4lZ+GbT9uHhj6Py
         CuKzXZAizEgvdB3JdiiPeAfM7BWpJJRILrvsc6BSbKVx4wiDAq5JJWs3+//quOIAutOC
         gWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=d4tkZodAZbK5rEQ5l0iiqmRUXHbQ0ArcIx6nGaC4jZ0=;
        b=aWQm4kh+MqCBONJQejxEU/LBpXpKJehPknUOwyiIiJLKFGMWa96RJBARyktSmmDSOY
         b0azGy2ama6HQy6bUH/mTi4O0cWMqM79mGZSl0IKmrbufHgj/BIlEMq7L8JMIrjDGknX
         TQLE9D4DvqU/UAOYDHXMQMP3xMZ50msqXkq4+yQesx7zYAI+8yj518Xd8ri8Nx9GHeyS
         G9l6N76Q/5zIN1ALgsxDQ1fXR6TYG7mfn3Rg6SQhuaz3LQCQMoyRrAYQQU7FZdnDmgnV
         eqHwnI7JGw4/QR9TqP1mHxKSXdyLsO3zeQpJL8Mfhx7lA8uKgP2c/POQSpfRJviWT8cn
         s0/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U3PK4BZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q74si27239ybg.131.2018.01.15.09.24.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 09:24:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U3PK4BZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb8Uq-0000AF-BT
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 12:24:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb8SS-0006Yh-7c
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:22:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb8SQ-0002gK-7A
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:22:02 -0500
Received: from mail-ot0-x22c.google.com ([2607:f8b0:4003:c0f::22c]:42095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb8SQ-0002fu-23
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:22:02 -0500
Received: by mail-ot0-x22c.google.com with SMTP id s3so11237041otc.9
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 09:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d4tkZodAZbK5rEQ5l0iiqmRUXHbQ0ArcIx6nGaC4jZ0=;
	b=U3PK4BZAQjnjWe3rM36OhN1gFZnBJRQQ9OPW1PqCqBpGBNI7MHh4u1pBBG0Btmq4+H
	tmVQNfFLScrBDN3NXv9cFkoiElCToljZZ+pPOF7eO/JMF2JSNjM3aPXosKuYGX8lUo5P
	3F7GXdJ+3SOujThFxOuEZ7xa5p+axV9vUOre4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d4tkZodAZbK5rEQ5l0iiqmRUXHbQ0ArcIx6nGaC4jZ0=;
	b=gJcd7NJh5nvFw7ACVVbUtN77TWD67ccz/1e6voCxxBwQcAUVWaSUxoenm+YRu5ECnk
	ostNvPekpANPHnIy558J4oSIbi3UsjcDa1FO5VRKF4HtCO/VpX8/jbuD7Ugjym/OJzbq
	YPwWgw5IReTTINQKLfXNlYJQM6kfBuSaCtVq2sm4g+aA+6X3Hd/Ks3KG0xiavIj1brax
	ZfoNlHw5TiMkacGtKyS9ckTKTzTEBAog4bl8o5yW1E4qi4/lxBfYP54x1NNkt5sTU9+k
	Ea5xGnQBGcpqpuNrIIvME5WhsljXw/zlIYI4H0V78nwuYKDvxkjx1GbYXV66k/rrkLkN
	/iWQ==
X-Gm-Message-State: AKwxyteE87r/TUaqf+1dsoxF09rrTCjuQcEcpMxxuIy7g9FX0u5rBmxp
	K+NS31l//Sq9x+VVPIpoN0PoV8ss8ffYkRY6nrxvaA==
X-Received: by 10.157.52.215 with SMTP id t23mr12461847otd.54.1516036921438;
	Mon, 15 Jan 2018 09:22:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 09:21:41 -0800 (PST)
In-Reply-To: <20171218172425.18200-4-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 17:21:41 +0000
Message-ID: <CAFEAcA8cN02sum-gosD95ySmwF_ZAJY_znfJ-+vBQ8yMHX-=Ug@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22c
Subject: Re: [Qemu-arm] [PATCH v2 03/11] target/arm: Decode aa64 armv8.1
 three same extra
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
X-TUID: crDq7OaQKOwW

On 18 December 2017 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h         |  9 +++++
>  target/arm/advsimd_helper.c | 74 ++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-a64.c  | 83 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 166 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
