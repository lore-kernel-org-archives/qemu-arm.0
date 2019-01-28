Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3473866wrt;
        Mon, 28 Jan 2019 08:36:45 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7Rt9cfBF9lkkxzQYIfIMhWoUFLM5CaE/p2TnOWcmOqdRrjYiSxvV0FS6/+1V2NhQiUysK8
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr23361964wrj.58.1548693405191;
        Mon, 28 Jan 2019 08:36:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548693405; cv=none;
        d=google.com; s=arc-20160816;
        b=oB2C4Iotnao7QxWvLIhqK9x4Nm+GCJ9OB29TSq3dGc5TTwSMJYZ+0mD+1/2M/MHO7L
         WKe5YHGTJJMqvR9Sr8Zw1gvYoyLLgocjl8U8DA5S0inQiV8Kd0alnAuVQ1eneKLaPllX
         B6Yf56NIOcF3xjT9/4qjhmIZeEyk3CFJbKIEtTbvn5wwDxzVNRO2or4gWiFRekZgI2hu
         gnWXHEz7psVclv2l32qT5V8jEUPyguD4Np236I7lxol+kHBgGvsp2XPqrlJdbMfykEuI
         mKJiDRDd8W+IH+oNJ428N+Uo7hST4WO8meFal61H7R0oSB/ufR0CaDHGhU3AqQ5TxIfH
         WXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=PnBRhpE8yGnEm5tQzvjXZW5ZASzyfyiQbYr92/TZIjs=;
        b=zugt45UxeulrrFTNzit8PugUOw38z8/az6JBFIpFym4WAo/BYiCItq9hN8vOYlcnua
         BsK7fGY/y4n1Hj2lXSnKZ3VQS78oxwQQoWksBeML8mhCymijyVo4Ut94/BrYt9zZslh/
         XSWrHisefjCnKV90vFUjmtoc8WT17LyUacTqvQn1XCJwAPdhbCdQBkX16+TjNR8lUQLK
         wqUHOjH4EdyroydYMilOShU3mUBicFIgT6mvZpWkgbU+yCq3fAzJQVcvOg9shsf3OEBZ
         gJTwMjzUhH0pfjFL5Zb/qryvV2iwrHt9dyJKoPB0bhdDBhbR1uTHsF/jyH0kT7gWGQAZ
         KWGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OXjODQca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a124si46871078wmf.38.2019.01.28.08.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 08:36:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OXjODQca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go9ts-00011P-9S
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 11:36:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9lr-00036b-RZ
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 11:28:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9lq-0002o0-IN
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 11:28:27 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33220)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1go9lq-0002jw-7P
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 11:28:26 -0500
Received: by mail-pl1-x643.google.com with SMTP id z23so7967303plo.0
	for <qemu-arm@nongnu.org>; Mon, 28 Jan 2019 08:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PnBRhpE8yGnEm5tQzvjXZW5ZASzyfyiQbYr92/TZIjs=;
	b=OXjODQcalTFLfJF1xUoGZQ552FSg8saxhQ+pamTFPDSMu5K2LgVgvrGRYgEtBJPhGh
	6NDfwCDZ/AV4SPIKn6wxid2XVT6RWC8jkR7vukbe/aG9rTuDNe+Pskft7ymWXqNh3eIn
	UdJqO0sEQJho558ViSMAF0MyTfN+enN2RwhK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PnBRhpE8yGnEm5tQzvjXZW5ZASzyfyiQbYr92/TZIjs=;
	b=jjXqkt+BqHpcAOOMnH0V/0sjSX4j0lz9drZ7yEPXNgG6lwB0Z8U8R8Y83A7tTxG0qO
	I31mZ7egKcUMDBMnJEtSc7BcfbObO27cEuFU+Mf6WtTpi6p6yoDVC62jlxw5oI08KjZH
	1U3SjV2lBxJ2DS+RUR+ZTC81HM2wp7yHvguaE88viWN04U5xx3BaRvsjQfZtWZKvz+6x
	uUNwhLZK321RqONee+Gv2bmIJ1soroTHtZmkEKUY5CMMQ8rEWPYVaNYejdVZH6rCI+QQ
	2zEClbtTJPgycEU9d8fZUi4mCRUvO9OfIfaVwJX+K1rFOUrxGAIMj1j9SNGQiJnAIuio
	KQZA==
X-Gm-Message-State: AJcUukcDzhajAi+pvF4jbBcwfnCNo2LncOQwR+ttNUzHAdnaQV1wt80o
	FmJzVqVV0E+1Ww02JbaXxEjhdw==
X-Received: by 2002:a17:902:e08b:: with SMTP id
	cb11mr22644319plb.263.1548692903204; 
	Mon, 28 Jan 2019 08:28:23 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	x28sm59848381pge.66.2019.01.28.08.28.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 08:28:22 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <69a854f8-c52d-20f9-ddee-0c1d751b32dc@linaro.org>
Date: Mon, 28 Jan 2019 08:28:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 21/23] hw/arm/armsse: Add
 SSE-200 model
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
X-TUID: TVpiPGhbJhnc

On 1/21/19 10:51 AM, Peter Maydell wrote:
> Add a model of the SSE-200, now we have put in all
> the code that lets us make it different from the IoTKit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h | 19 ++++++++++++++++---
>  hw/arm/armsse.c         | 12 ++++++++++++
>  2 files changed, 28 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


