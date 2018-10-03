Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp45234wrt;
        Wed, 3 Oct 2018 13:24:25 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63G3yH3iNGEo+W1m7Mfq51mIKlmEYF6ctoPXcPtF03nPw6uAbn9jWAU5JwR4gxJstekqYNR
X-Received: by 2002:a37:a9cd:: with SMTP id s196-v6mr2560561qke.342.1538598265888;
        Wed, 03 Oct 2018 13:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538598265; cv=none;
        d=google.com; s=arc-20160816;
        b=c+fIuSO2A7knU2KMzqnHIHsqfegUAIcnozAvizzQcjHqCDDfUqROTX+Lk+5HDIhz16
         sz8UIlS+KKcOY8kWVULM8PqBMMCSc9erx2FuyKPCCDX+Ty57Li6nFv0IRv9rZsz7VnSv
         UK8y6Dr7589rt0hjVGM93O4hMXVSBE5S5fExxwPZhNbRh2CRHKtNDACtVIb52HcGpqBj
         OQI4gZPaC3yixZpyb9whZt/lK5ZeOFSU8YQvtXTsdsXDHJ98+rzIP9megWWjxcvTIw9e
         CslM/PtxIJiXDYzO5IIy/l1y1c7PUySeISLYFqaU8eBymCZRR1hDK7a/XTmahhCIqxMS
         E9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=YfEWGx1cKqAfkt+2V5aFmnxISYElIgQfS6bWqU+6m2k=;
        b=E0SvnPaTbFcKStOTVDag1x0Dt9b7F1HUdAg9+4rRrnh6ss1z5RwiNG+b9UERn0G0h4
         wayE6xv0kzPLuxjVmO+y3EEZvoQd8y1WOnKgJb858gop0ethk6vutpulaIggFWDL5jrd
         UHttN6ailnuvYFoQWHH84tGmH14Q6Inqpd21Ul0sjIvEpWA5LB9KHJmqFcYboEPEz+UX
         UePcQL+UW5vlaSiHTS7bzGXm6TdejZMNitEHf5w965q3kQSm9QJ51PZqYQi1GtowtsBc
         DoN2cG85+GPSeMRfqlC9021GXntgTYG1Qx8QLrhmXMD948mPutJ2WiSWCL6/1iGB2yZK
         7E5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L5GBE6ly;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y10-v6si1668766qtm.166.2018.10.03.13.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 13:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L5GBE6ly;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nh3-0001iH-AL
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 16:24:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nfP-0000ZJ-Bt
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:22:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nfN-0008OM-9f
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:22:43 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44852)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7nfM-0008IP-Na
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:22:40 -0400
Received: by mail-ot1-x341.google.com with SMTP id 36-v6so6879148oth.11
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 13:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YfEWGx1cKqAfkt+2V5aFmnxISYElIgQfS6bWqU+6m2k=;
	b=L5GBE6lyPQ93daTQY9Pk1LDDM0yo/zLnmZvQi4fBgfCoS0+GY/B4towhaNWeaB992E
	AQVI/DXhRaKo6JHLQQ+T96WfI/il0EwdnAaWA7OBWze9j1O8MWUcMCpm6pjvVRP0atKY
	cYZEaqW4U4bDF2D31vWrL7ffHrZOwmtFV/xIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YfEWGx1cKqAfkt+2V5aFmnxISYElIgQfS6bWqU+6m2k=;
	b=JjArh96t7Qcf6PEtrV1kYSq7IKnupozWJXIy4XzQfs2M4qDgE7e4EjEW48e5KbcpTM
	HCMJyE571KC1XyY3r/6mKG089B+5ET7diMsRF9orVq6QH5AL3B//o2IO1jxMdUL8/y5A
	I955OIcIxQe1nv5J1o3B2SJ75eqSxt8o7sxlUihyFP9CuIl5Vsr1FGm13dYcI6D2YYF+
	Ky4zZSwBUnwB5vAirxRhxzB9Td2Hur9UjbhQ09r4P+IWUvC0vj5WqA0eTH11UviFmYBW
	g74gaeenLOGP8pVF0BDx9L2fgXCZDH3IgyqIfgYxOTStUh5Nb2H1b20hWHK+6/UJmqa0
	cW4A==
X-Gm-Message-State: ABuFfog/IiD5WstBKG6tbOeXn7F+bcjOcBa+CEA3TE9fiDG0I9ftuQ8o
	r7f2vatp7hv2GfPJUfrr0E5sCw==
X-Received: by 2002:a9d:5302:: with SMTP id g2mr1927698oth.88.1538598152951;
	Wed, 03 Oct 2018 13:22:32 -0700 (PDT)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm800123oif.27.2018.10.03.13.22.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 13:22:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <17fe3940-f083-86d6-80b0-24be651be902@linaro.org>
Date: Wed, 3 Oct 2018 15:22:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 13/13] target/arm: Add v8M stack
 checks for MSR to SP_NS
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
X-TUID: st9EdfpVS8Wf

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Updating the NS stack pointer via MSR to SP_NS should include
> a check whether the new SP value is below the stack limit.
> No other kinds of update to the various stack pointer and
> limit registers via MSR should perform a check.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


