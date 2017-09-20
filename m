Received: by 10.223.172.38 with SMTP id v35csp1150304wrc;
        Wed, 20 Sep 2017 14:07:06 -0700 (PDT)
X-Received: by 10.200.15.170 with SMTP id b39mr96041qtk.52.1505941626732;
        Wed, 20 Sep 2017 14:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505941626; cv=none;
        d=google.com; s=arc-20160816;
        b=BAAr91C1yssxdT/QSBPs94uJbCWS/oaAhMF8SRHlUZzxZToALo3MEhDmXptnTNfuvE
         4klRtM6PEhDvcmSsD+fyK2WQQ/uXOe3mv0Ou5O7Aqd307QotBvWpcuCTzZMW70W2r60n
         T2TW8p5jPR16yTEpflarBq5qtPSXq/Rm3fTE8II01R8VFJBNNu/YUWJdYMyM1qr/Vp3I
         p7PUczMoiB/7kXeTHQtdG259r7XPKCB5mvRzkZQS8GHSYiygJ21dsSYCgJP4hmnUSnSG
         ptuYiGKVt5fw6+8Cu/i0SouighgmujYoIF0rohTYMjFTvzO1SH19bNC7te0PUy3p1plN
         rXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=WKzCp9dYdtmJjO5o+n3/2EK4X+aqdBoUF2xSDYR3/X4=;
        b=KadeI2pF0qyC4f0E5W7QPr7+JxAXmqr8LKbM9zpvmNvYMlNwb6VB3pqENFQCbCsU0N
         zbilhoTC0XU3BscZSCEjxegLBNmuKb12PlDzZVJv5LjtUKnWToiHpuqy+kLahdepUE7f
         WKxHoTzqfp+jE0OH3GEJZ86eZEJ+PGV4hHdgzKGZIAJo0+AYM47cJQOP6g1USGjFIvUG
         Kb9RqPJ1z+5N0Ivnt9Y4Y3FqydMmWJYVuhyjKA9pOtHcbMdPbG9XTXlwU2VPTChOa4xH
         DeBGvFrWPWAtWknQ0Kzenw1LLcrLDDdfH5W0NM+fr9PjsNxwG5PDdEPePyNq1BHTe0tn
         AA6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R6JMDSYF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p5si2750659qtp.275.2017.09.20.14.07.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 14:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R6JMDSYF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dumD2-00043s-DW
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 17:07:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dumAJ-0001v6-Pn
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:04:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dumAG-0002Zt-KV
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:04:15 -0400
Received: from mail-io0-x229.google.com ([2607:f8b0:4001:c06::229]:47328)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dumAG-0002ZG-Ej
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:04:12 -0400
Received: by mail-io0-x229.google.com with SMTP id e189so6644036ioa.4
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 14:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=WKzCp9dYdtmJjO5o+n3/2EK4X+aqdBoUF2xSDYR3/X4=;
	b=R6JMDSYF6rmUsYIEHistM1HTmipa89HVMzD3ZDJRX1QMhnNrGv8nTkfdVRhhuXxDmI
	sGDAayGAQW9pWvYWjs7cwy9rur3cyUGrFgxaI+EsksKOSrslRR+nVpA6bjRHw00bJjnM
	45OHtCfPFjGMtcYYUYManuL4mxF6TGHh1FxfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WKzCp9dYdtmJjO5o+n3/2EK4X+aqdBoUF2xSDYR3/X4=;
	b=rm+nZ+Q1KQmDBqsXUWgI9af2m+vQMchxbo8JgeS5wi8dclZpnjjUQ+Dz1AILpV02g+
	ze+uv4SqmzN9NQMfIKxTrgyXnFpUYcD+lfn3j83r2gSX6tvRtYnfttckuC6Ph2dArR/s
	YjmgRRF5C77qATrFG14s282W1/ZroyW3YDmJvdfzxYYNadEIw6R84NDgblZE5Dv/uNk/
	TLEK7YlJGAlvsjjb0k+TKA/2KGN5lbSdM6je2Ahde91ps/o5Br2D/hPQ3o1+T1jtKUGJ
	w/uim5/xMV1rBZM2/abTAWNsh8sQERBoDkSsiYcriDto15oZEyGNzF5V4tY0y582M+dK
	on8A==
X-Gm-Message-State: AHPjjUh6SWY0SeOuCl6HkJD1D+B+vyeRoCx2/IMqnPeDY9FufKxCKSJ8
	1u3GfcdnKGu53AgqSnXkdAUNeg==
X-Google-Smtp-Source: AOwi7QDajuZROYUlFimwQwB38t3ruDkogn9JzAuKanPehmpSGUz0zUvcrodotqv10va8Mg45xHHI3Q==
X-Received: by 10.202.217.4 with SMTP id q4mr7372548oig.283.1505941451527;
	Wed, 20 Sep 2017 14:04:11 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162]) by smtp.gmail.com with ESMTPSA id
	a194sm2439626oii.36.2017.09.20.14.04.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 14:04:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
	<1505580378-9044-7-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b4f7b5c-7d54-eba7-cb31-5ff2389042f2@linaro.org>
Date: Wed, 20 Sep 2017 16:04:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505580378-9044-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/6] hw/arm/omap2.c: Don't use
 old_mmio
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
X-TUID: 6gGgVSdB055/

On 09/16/2017 11:46 AM, Peter Maydell wrote:
> Don't use old_mmio in the memory region ops struct.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/omap2.c | 49 +++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
