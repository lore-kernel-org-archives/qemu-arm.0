Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1520473wrx;
        Sun, 17 Feb 2019 10:00:53 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iabz3nDCr0cHvNF1Set83VT53YIE0jv1h0DRA9ZnSgBoQq+r1hC+ZgjjD75A3IbpSEg9HSU
X-Received: by 2002:a25:9201:: with SMTP id b1mr16279906ybo.60.1550426453819;
        Sun, 17 Feb 2019 10:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550426453; cv=none;
        d=google.com; s=arc-20160816;
        b=YmvfdZEnOPUazxd5XdDdf7lgq2i53LMktlHQnUFMibKAfQKfMgdtWgsHKyQ1kIRmea
         p3O7p0jp5HuWSFlh9nYA1kkConhS64EJgesNs8+kvi0/WQ2xASqWt8fYMiNbp5KOTAQ7
         mnKCanKLm90I/zoebIYBbfVC8gHIqc06p6dS5S56wkElyWRYwDy+g1JlSZhCvhgbQrJP
         +npyfMg8yuH0ZkyXX4eNJMgBmABVcRmRpM27hWDO+zR9SzM1JGAcL3STntBhuXNKLUsD
         VImLTrE7u3+lwoyFXy7TehrIOy7Rxlr4/L7sMJPsCs8RroH5XMvK4Jbqjet+tZt/9pSi
         WYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=GO7gMGzOZ1i2iNyUxT1b25TTjiw7O1+h1TIGj1geRas=;
        b=Wt7xMcstWDLNTxvxEs9B/nfUy/AlBPPVwhqoXFGhv9JDNxAsjOO41PahhWCyxbnFfw
         m0VtxxaS7A7hN7BNF/iUmZRZOfzq6JuJdBGfUHXtIBniCj4FJOQ2HfQAQJ4uhzarHvKn
         dqQKAp+CJB46Wyh3cEQUOra80ut8nsyzmwHIvZzT3gQu7jx+2H2RDmd4Ak1qRh1TMp5M
         /G+DMFC6ADitevgRO6E/J/gyGv90RONNOYirx/FN1Ai4a5Q5LrR4ws+tHOAAebhZE/CH
         dVMFtnS42FTPRqul7W15dUNGNM+vj0cB2J1T+h0N8CGXb767b2+tPJgYbDPZs7awlsxq
         dmBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KsILEUR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v204si6536180ybb.69.2019.02.17.10.00.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 10:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KsILEUR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44707 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQkH-0008Do-Bn
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 13:00:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQk8-0008Df-Vb
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:00:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQk7-0005SM-BB
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:00:44 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQk7-0005R1-05
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:00:43 -0500
Received: by mail-pg1-x543.google.com with SMTP id u9so3739471pgo.7
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 10:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=GO7gMGzOZ1i2iNyUxT1b25TTjiw7O1+h1TIGj1geRas=;
	b=KsILEUR6cXccv+wWh1ddtoRxBWXUlPVIfBCiLCkmJTGOfM7LhiO5mcUvxZ9tmF3xjo
	eSG5XRLUOxgZSsE2rC3pTMUbnPxXTbz5143gCyFPJeaCXp6fHB6KXDOm3eG7ugm3YhSu
	PtTYHcLFrQwzM8BM5FTP70MIYJmItzh1Zg/ZUbGcce4SKtj5MriSpVTK5WRcyW524rZ5
	ldaAydzIRLj1mZb2N1mNq7UezTLvRAVSmwOo2Ot+Sf9dpfjp6PD57VysDCO+in49NWHl
	3SmHSt6BoerLMsX7Kgm7BkiYJgpOwIs8tHbTfxU4H5dovl9l92KbuymgD684M8f+KlaH
	1xPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GO7gMGzOZ1i2iNyUxT1b25TTjiw7O1+h1TIGj1geRas=;
	b=J8EjDwEAOMAAXspbE2C2PSVMP2eYEWNhVsIh8ev5/No0NRiR+vHbsGAl+W+ZSSWSAm
	wIip0cU8RzX2uzg++UieGvdulgQxkTQIhAIP9qNwBBusmKNKmbhztp7cHjDmlEo4E0GZ
	1Kw8MeWJmnjQQGtQhmQj72+na+SLynQoy2QLmLQX8L/DlgrtRfZxd4WcseF+/ghlrxpg
	IL7RoiN8BPRD5qQZp0ohmTJDb10rzeVP5D5oQ/VXLkH/wL3UnIkqLUQqf8Wvh0Z/0xac
	nhH2v8MKVnBFgDfv5qZfJEj/kjGADCX3R4PO0fQx/0tInnCbzpEnqlaq8dDg9L+1gu1U
	vR0A==
X-Gm-Message-State: AHQUAuayzVaeWRMCn6MY3cm5DsrdqVEJQyKL1AfNiNxIEmD1F3GbgRb1
	zPKjjaF6ysykUvbm2evUy0Rmpw==
X-Received: by 2002:a63:2f47:: with SMTP id v68mr14838254pgv.144.1550426441393;
	Sun, 17 Feb 2019 10:00:41 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	a24sm1840569pfn.85.2019.02.17.10.00.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 10:00:40 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5d5b58e8-9fe5-803a-2147-8e0d0d2c5e9a@linaro.org>
Date: Sun, 17 Feb 2019 10:00:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/14] hw/char/pl011: Support
 all interrupt lines
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
X-TUID: l9PeAz08kAKr

On 2/14/19 4:50 AM, Peter Maydell wrote:
> The PL011 UART has six interrupt lines:
>  * RX (receive data)
>  * TX (transmit data)
>  * RT (receive timeout)
>  * MS (modem status)
>  * E (errors)
>  * combined (logical OR of all the above)
> 
> So far we have only emulated the combined interrupt line;
> add support for the others, so that boards that wire them
> up to different interrupt controller inputs can do so.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/char/pl011.h |  2 +-
>  hw/char/pl011.c         | 46 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 45 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

