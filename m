Received: by 10.28.4.212 with SMTP id 203csp1023301wme;
        Thu, 19 Apr 2018 12:29:28 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/nyIoJePgO8rTYgQr/TnfYsqEviDML4y+zukSRnT3w373dtG02dtx7MIs0YcOXElN8Rbqb
X-Received: by 2002:aed:3c59:: with SMTP id u25-v6mr7268563qte.235.1524166168566;
        Thu, 19 Apr 2018 12:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524166168; cv=none;
        d=google.com; s=arc-20160816;
        b=PQt6xi0wEBEY+q+1Zmuh/sPNGP+ET1xD0ezf7hESNs7ZQ8bxpesLrnNyoo00TEoUal
         DCo55r+Aps52tKFYY0peOzDik9lnKlhjWmIZAEPS8HQIsvnJmT+QF9lwjRTZXcfDZZnc
         gNXM8VWwaxFR0TVuaIo2x6ZSkrsjZVdIFZ22gznIfs3TXw5ncmqveeou8tR5NTfsa2Mi
         ruSjRcY4r20QXvB4cJ4VSjRswoASlAK48hR97f14xBr6kEywzyL5GolGm55ykcPZnS48
         /Kj7efAadZfNpZmRSwuq3iEYLogXVpXSj1jvxs59LNJDcbsq8jUnBUtDNXNVDQms2OeB
         zh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Ms9TLvQdW/CA3qXDVSG+A97hZKHRS8zpzYMJ5ga+aXo=;
        b=Afy4+c22HK9TdBTFwmxz46en+E98yg8Rla/hNaJ7tAuF4QttFffWaXYw+ugy//Uuwi
         OWPzpWjYgsCESaC5qJpvDiTIzBRtR/e9O7igomGOPT65hvt81zbwADjDXIfPf34FbiKc
         4Ljs5n8fjO7+PQqvCmlRDaeB+Ok8lrpw588RB/AATtFuxoSKbCNQzLvbYtHjqTq52KTH
         X5r9/BRuEOApGWFalTzepheKi0yuHOGKXGhwuvaVH2g7RawMiDwpfANaNn+tlBdXHvKJ
         87iXR4Qt3OnNdArUVCZyZjEibLbDVbIvlOlbGqgmvTtbfYMVvRXKILLxFvV2Brrurxni
         L3Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QVUl2oNL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13si1745797qkb.273.2018.04.19.12.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 12:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QVUl2oNL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9FFI-0006TS-3K
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 15:29:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1f9FF6-0006Sy-9U
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 15:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1f9FF3-00072i-4n
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 15:29:16 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:45492)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1f9FF2-000728-UN
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 15:29:13 -0400
Received: by mail-pl0-x243.google.com with SMTP id k9-v6so3815155pll.12
	for <qemu-arm@nongnu.org>; Thu, 19 Apr 2018 12:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Ms9TLvQdW/CA3qXDVSG+A97hZKHRS8zpzYMJ5ga+aXo=;
	b=QVUl2oNLvv5TsO4AOhBWpo6wjDYHBVLDW9M0qEwmQrXnu3r2eFEQtsn7sAXbX73X/u
	k/JNBvI1hIf+jRY0uT6DoMC6G4fY7PnLPg8rCwlQJ3QQUWNwL2LhaU9wMTuw4s2Undnr
	IZ624aX0YRmyKRvkOquGVVI2/DR61k4voE8fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ms9TLvQdW/CA3qXDVSG+A97hZKHRS8zpzYMJ5ga+aXo=;
	b=MY4bqJZd1CrFwQQUEw8mQkSkZVxw6J/c9+9xmvgsJNR/6notPDgx8LFYZORE6/1l96
	gBbbpPHClrj6gxeXZTghmtA3mEoqyi67KbvPuDeelqFYOeZ7gVd1u/8wgWz/fq4U8jWE
	4KbGk7pdPeBODAdvELUg6JlruaepmvF1k1dcDqxMCNHAniLtm5qP7g4QJWGmq2665irk
	p9jmU7fD8MhNMQBDnoq1h/NBeSI1VsX12bhzT2rFJbhaMc704L6Pv/Br8gLoy41nRJSe
	INO+sOWNriiVKeI18hd6QT4kux9DripEs/PRMNiOCcSUq5V6JRCK+mMFowuOUMEzIXqD
	9MJg==
X-Gm-Message-State: ALQs6tDIXAE6dA4UskfWohaBd8saB5udmNBf6Ad6BpHoh6gO0l/qskji
	FtPK6E/qd7QP11fNPHU3AglriA==
X-Received: by 2002:a17:902:7042:: with SMTP id
	h2-v6mr7344136plt.249.1524166151762; 
	Thu, 19 Apr 2018 12:29:11 -0700 (PDT)
Received: from cloudburst.twiddle.net (cpe-66-75-76-48.hawaii.res.rr.com.
	[66.75.76.48]) by smtp.gmail.com with ESMTPSA id
	u85sm9729480pfi.32.2018.04.19.12.29.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Apr 2018 12:29:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180419142106.9694-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a490be15-a9ab-bd0e-4336-68ca42426b0f@linaro.org>
Date: Thu, 19 Apr 2018 09:29:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180419142106.9694-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Use
 v7m_stack_read() for reading the frame signature
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
X-TUID: nu6qgUGqwONJ

On 04/19/2018 04:21 AM, Peter Maydell wrote:
> In commit 95695effe8caa552b8f2 we changed the v7M/v8M stack
> pop code to use a new v7m_stack_read() function that checks
> whether the read should fail due to an MPU or bus abort.
> We missed one call though, the one which reads the signature
> word for the callee-saved register part of the frame.
> 
> Correct the omission.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
