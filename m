Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4567968wrt;
        Mon, 15 Oct 2018 08:35:51 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60XvoBR+l50JvB2NnL7g1tMdWw0rUFluuFnj2pbUCx89OeX8UHGRe7n6EP+cMdLMXFAkPow
X-Received: by 2002:ac8:4804:: with SMTP id g4-v6mr16450929qtq.66.1539617751804;
        Mon, 15 Oct 2018 08:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539617751; cv=none;
        d=google.com; s=arc-20160816;
        b=PP4Yqyk0zBFzg5fQIFnVDdQT4nF2QPnydU7x4QH7YEHAF33oiSjcntIxqObtKF6fZi
         JxCCUhAxDeWuIIGBfrs5tchq6YB4KJg9qqh/FYYenpbpDMMQFou6z10PjpVOG76Jhuu1
         tcTCAuekKAW8X/tFB09z4a5z2Bp0/iknfBZx2O2/lqP92X5ieqhMqtITfa+jOQ8mrk4N
         vqfdfUBbiZwVzvO9tn+5Bjz1t4XC9+3d6cWO+7aWLy7FtVKna8QCuJJSoojrTlp2+J8H
         OymctTvSUyPGZ0r2ttZK3sNkHDnJAJjh6ExbrDnygx1/kcbV+vNbor2GIAA9M30/iLPW
         se1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=+elhQGk9ExoE36d2jnX6GnJWCjeqRwCrNcDP8VItBBM=;
        b=h1EKyWDmeW6n3rsDiV1MUHAsfR45xOCZ4mI5gyQFize4Co0Bjpi57y7X8dHQJZCoX8
         NqsoYMxx1yUOHfiRtw58AbKoWkc16c900ETnVhg2RyqvdjrYWirGXu6OnVqHhCTqlpnJ
         Jtk91MKBJ/Jck9vezpQhL7+qrS4WkChcVxPwlOVIdeYF2dHl37eJQrin+laSMsTuzCRh
         f/NfnrWqTzB3PR4OKVjGg6gRuSc3dCPyUfD0uZt0ipCbAK284n/HEK0emaY/FtOTtKJi
         TbACXp+hsEMJ4U2Yqb250EVOiTKW7lVamkcdOUUQnl1aHN0ubwHoHnmzS+B0VOm0sV4o
         i0bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U7HcYCRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n23-v6si5340117qtr.259.2018.10.15.08.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 08:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U7HcYCRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52846 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC4uN-0004he-0i
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 11:35:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC4uE-0004h6-7q
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 11:35:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC4u9-0006Bw-AZ
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 11:35:42 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC4u7-00069e-3m
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 11:35:36 -0400
Received: by mail-pg1-x541.google.com with SMTP id c10-v6so9344261pgq.4
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+elhQGk9ExoE36d2jnX6GnJWCjeqRwCrNcDP8VItBBM=;
	b=U7HcYCRY495qyQQFYQ+gSPVgdblxHa1trrK9RkwSek5Ie45fw0G0SYhIE1LgsOI0vn
	maKfHKFsn84RHajk1Q+dBAFPyUXaF8d2rRknaLlUa29F6H7sZDGL4yDA3Iux5ofgc0+Z
	4stG2X+sLaMNmvBUiVIhnvw3oRukAUd1ScEkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+elhQGk9ExoE36d2jnX6GnJWCjeqRwCrNcDP8VItBBM=;
	b=a3qAduhWHWROff1u+UwOWG4zxrblcRwqqsSBMW3ixtaHzaR2fEDFQfcWURaBvO4aDY
	/ZQTpzKhWRdATumYB1jsWX5lApXdE21VdFas6YUdOATcScDkCLwFIfNuVcEWmr7PG5ii
	liS3bJoWXzAobPlUa8s4QzT0Rgi5c01AFcRG6e2QkMj/TwwcRRz3JTB4qTR2Zg15s0wP
	aD1aa62AUydtNNI8U7oInxEjPjvsLSxlO2Rw/JPif6od+ElWT35cmkUKLly5gTqAYLUz
	OCfcbNweJuYx9D+pt/X9RYuFTmbsBsWYfglj0hU/BGFElQNknYdZOmTt4ttfqRu9X8fi
	yj1g==
X-Gm-Message-State: ABuFfogvvthZIk+3MDYD9I4JoDcthrDA9G5OHnFLTnQ3h3v0T5QhB0US
	+4LsO8xvTkbP7t7i0a12bMarLQ==
X-Received: by 2002:a63:e00d:: with SMTP id
	e13-v6mr16331212pgh.114.1539617731391; 
	Mon, 15 Oct 2018 08:35:31 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	f68-v6sm15630075pfe.143.2018.10.15.08.35.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 08:35:30 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181012144235.19646-1-peter.maydell@linaro.org>
	<20181012144235.19646-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3d114553-21c4-6efe-9e06-a5dff491473e@linaro.org>
Date: Mon, 15 Oct 2018 08:35:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181012144235.19646-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/10] target/arm: Implement
 HCR.VI and VF
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bfrVB1zMUURI

On 10/12/18 7:42 AM, Peter Maydell wrote:
> The HCR_EL2 VI and VF bits are supposed to track whether there is
> a pending virtual IRQ or virtual FIQ. For QEMU we store the
> pending VIRQ/VFIQ status in cs->interrupt_request, so this means:
>  * if the register is read we must get these bit values from
>    cs->interrupt_request
>  * if the register is written then we must write the bit
>    values back into cs->interrupt_request
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 47 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


