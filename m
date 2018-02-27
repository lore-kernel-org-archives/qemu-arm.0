Received: by 10.28.71.27 with SMTP id u27csp5184180wma;
        Tue, 27 Feb 2018 11:33:00 -0800 (PST)
X-Google-Smtp-Source: AG47ELsaP/CPsZG6rVChfDvXCjbOsjjKfbGfGQSHzIPBwx+aVt/sXdDGQ8bM8Zc0EHwMMUYKiDO5
X-Received: by 2002:a25:b98e:: with SMTP id r14-v6mr10163755ybg.173.1519759980156;
        Tue, 27 Feb 2018 11:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519759980; cv=none;
        d=google.com; s=arc-20160816;
        b=bgrmGnk3/bRZM2bck8Ooyeg7Xvr2mkZ925KDKpcBanygP4CxWDEMMA4uDX6hEEQnGg
         x0n4b19gkhgPBPetZpAYquAH6F8U78pfeh4pUW17lm4Zi7XA+1EcIBdB6vcbjOsnAheg
         am4myoloLIkFIqGubNP0mdb/PlK3x9DcLyby3IfVFq4wMCOZBJrT9deZiwsZLxgNTG9Q
         IBbLI4JNJnTWAzhnPC3JchtW2VY9JpfjWrxKzyOb6Hgbi1QiqSBWM8r0H1rYE9sHxVjX
         Y8y8a79nRPXzrI/i75M+eoZVf1njEtKzKOxAFxlebhNvvBQF537RYCwz1jnnkSJ4fYfO
         LClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=HL+9xblEWTzsHOyCosuE2oX41Lj4wEdYdPZtcQcYu7k=;
        b=bHZ6bT61Ci90EQk9hgYxgDIqUagQXlKZhT4puaTvkUyzpOkJ1Shbs+nvlydo5qkrHk
         XKvMW1jqru1YutbqQTkbU3+eyBNJvKMqigMtASYvqrrhyq5oxyWOTo3fuxVU502XML1n
         5Vx6lyLxWuzJQj0eNKywyRIvY5wVL75sqq2lqYKxM1VJBsH4z3AT+g9Z++6nnEetEmv8
         yWFdbU9rNZPDNYEbLYf+PA0Ggprjj2LIP++CLo2r0YYofhaZu2GmogNOsNfUkzzuA4Py
         BxuR3K8G1lOhqY0rVdyK3tHjo3hGPndAsyOKGYKnxm0Yo29i1QfGlrQ03HPXiysbnSOa
         5yYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X2lGUjWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id g8-v6si1468028ybe.720.2018.02.27.11.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 11:33:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X2lGUjWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqkzj-0003Xa-If
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 14:32:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqkzV-0003WS-5w
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 14:32:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqkzS-0004Yw-3J
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 14:32:45 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:44385)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqkzR-0004YO-S7
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 14:32:42 -0500
Received: by mail-pl0-x241.google.com with SMTP id w21so11990599plp.11
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 11:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=HL+9xblEWTzsHOyCosuE2oX41Lj4wEdYdPZtcQcYu7k=;
	b=X2lGUjWHJcCbuJ8/ePUJTSfFfV2aflV2yKiC8C9eZdEJYtfdhA9YQHftUq1KrX3OCK
	XLjmI7AoYUl0DTmtMnMyx+TVs9h1T9nuywYBlioz9RPDXCZwWFDSOrFZGt8RHRNTYmI1
	pC83whRmPxYE8dCif5ilx01F5crMwbMGq2CQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HL+9xblEWTzsHOyCosuE2oX41Lj4wEdYdPZtcQcYu7k=;
	b=ddO/nD9r4eCL4o24+W9xTceD2aDx8oFNcdOYtEeQWNFCXMnKeuEki3jLnqEW06KgzF
	ZTP280QQ5FD4NQA5OJON3Kmgu+4/E5FxBuUyl/OD9i//OzC+817TVdsE5apLKPotfBOD
	JEKOBPD1zBfztza3zzkgjBv5xsqonhQwfY56JqoyySRER/OYHc+8gEKnIqjcgNlGBdM7
	SCbNlMTYXPeF5DUZldL9edU2xWSD3UjP2NTltq+oWZwbrrd6vVD+0DlSMv6G0mlOdTqa
	p0bhQIDCN12VrCpitDBAuURe3P4yeVPI8t8FSv77289V9yAXAqNE7Q3NpYb5ppb1etzN
	aJxw==
X-Gm-Message-State: APf1xPCKAp+ZjUrHt2uDyf9LNUE1GgYnKH/F9EP1EUr3EGPlvo5gJk3+
	tea2qUlw8LHw4avuk/yg2TZ6XQ==
X-Received: by 2002:a17:902:a607:: with SMTP id
	u7-v6mr14989052plq.367.1519759960403; 
	Tue, 27 Feb 2018 11:32:40 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	63sm18544383pgi.71.2018.02.27.11.32.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 11:32:39 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8410b0d4-5167-d51e-d508-df3000642806@linaro.org>
Date: Tue, 27 Feb 2018 11:32:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/19] target/arm: Define an
 IDAU interface
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
X-TUID: K4ZQqH6e82rl

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> In v8M, the Implementation Defined Attribution Unit (IDAU) is
> a small piece of hardware typically implemented in the SoC
> which provides board or SoC specific security attribution
> information for each address that the CPU performs MPU/SAU
> checks on. For QEMU, we model this with a QOM interface which
> is implemented by the board or SoC object and connected to
> the CPU using a link property.
> 
> This commit defines the new interface class, adds the link
> property to the CPU object, and makes the SAU checking
> code call the IDAU interface if one is present.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> An example of an object that implements the IDAU can be
> found in the later patch "hw/arm/iotkit: Model Arm IOT Kit".
> ---
>  target/arm/cpu.h    |  3 +++
>  target/arm/idau.h   | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu.c    | 15 +++++++++++++
>  target/arm/helper.c | 28 +++++++++++++++++++++---
>  4 files changed, 104 insertions(+), 3 deletions(-)
>  create mode 100644 target/arm/idau.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
