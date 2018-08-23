Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1432348wrd;
        Thu, 23 Aug 2018 10:42:06 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx4S9bobC3wnJbuJNaxZUBcKNti9tyi+Iq6kgGZnwcW/N8wOz0x0PKlJtHZQWJiMlcv7SHt
X-Received: by 2002:ae9:f401:: with SMTP id y1-v6mr57943372qkl.178.1535046126436;
        Thu, 23 Aug 2018 10:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535046126; cv=none;
        d=google.com; s=arc-20160816;
        b=nbWP7ygAmEnnJsXHHLzTkYaVOoehE/KQdTwcCuKHELxuyUgwooCxqo0UtNTAFQDEEc
         Eja5Sq50l0G4nt4HfuEzNmGQRMGHnH12ayuHo7mP8OSjfJ5BVP+9FqahbV48XtcDhLgP
         6ftpndeW2bCaEKkSkwO0FBY7+XgLDyuxLT56saotTLtmd7BJlTZIBEF0QOZquxJMGOn7
         mN5tHKV+aDvknJm426Hi8ju6+Z0YWW1MHtx9fJ01erSDs6NBONVmulpVRxDUWbCnuE7H
         /+DdnWuQED8XCJi1+R03KEMB7TPufApPL/KoOgckQOO1vJU7pF8CEDHrweEC32e26Chw
         mZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=HyYfrkVrvZj2s0wEkm+pzxDEGkhPFdqawDhSJf7D8YE=;
        b=t7EZk8/IOK8Rb1h7y3cndWR7zdq+6p7GglMHZ0vemLbtiZ95zzFcRWRh1S5zLHZWg3
         c/cfJBsBG6iwZEJGsf2r6VchqZMNn1mDuTuwYdlIh/cCg21U8bcQmH0JhUBzOvLBMsZ+
         EylDbgmJ8fR1PVz9AosXKw8BGc21uqUfARI3FIjxRu+HSoyGAOAjeVoskqFHPLsr8c1X
         jSR31roUu5yh6xnQZK5gJ/BvheR3MheHFedmhnCBNzIejuFcdUpVARILLIcAb7qJgsNX
         i0vzDTy5mqB/GDVRZ9O2J6mxgwwiw5vt3DQ2DW7mqSxHkrAQZUGY7xSHjWGyevTcYTQp
         hkIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hMmgbUht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m189-v6si3486787qkd.19.2018.08.23.10.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:42:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hMmgbUht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstcT-0000y0-TY
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:42:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstZ4-0006Sd-MQ
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstYz-0000l5-Sr
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:38:34 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstYz-0000jM-J1
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:38:29 -0400
Received: by mail-pg1-x544.google.com with SMTP id y4-v6so2961650pgp.9
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 10:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=HyYfrkVrvZj2s0wEkm+pzxDEGkhPFdqawDhSJf7D8YE=;
	b=hMmgbUhtbQexDt5CmNzS3KvlZNDCSv8m4v6orMs25dr/AnHed445j54QmEIs9pY/CS
	m41WT4TOQRw3L3wQM5/za2U1bd5k0zgUm8JO8Z1H0i1grhQE04nM+ygrhVS5Lp0WLRa9
	OwHzdlPDZKmeOxxhdWb8nQ0MU+2UNGU8mbxUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HyYfrkVrvZj2s0wEkm+pzxDEGkhPFdqawDhSJf7D8YE=;
	b=qhP9sAFea0p+IrxSIKHcjvQf9u7cuhlMN+hJRUKZAs6dRNzexKs+UPupNiyQMKbzDN
	LatYpPt2ItAu2maLU1+gidNDMPDeWwxD0sX32z5adlk0wsBXV3VYPYPSgMKdK5zWKrzb
	TqqQW5JgCkpiRl54QAvzV/R5kmzcM3s1B55NI9P2GNL/6iEKPQxi0YPFvPUcg8uD31Vq
	Eup05IiticeiA8gYhHupzVWDdRTVSiGM7cUcS9Muuxlj+TUcWCthKNSMjlBZfsFzBBJY
	C2KFk/qsEGDX/xRjJkY1yqo7BMwiRvNnSqdjzPJsWCQZTebH6usKyBEMIswGwTSsuY0Y
	D6gA==
X-Gm-Message-State: AOUpUlGBFnK5fB4Ogq8CEyhmQ9XwYYMWD+rvdAyx0/2TIRUzwp9Ssd1n
	KMKBFsfbFXWEO5IJRNmMMexrRQAobMk=
X-Received: by 2002:a63:bd01:: with SMTP id
	a1-v6mr20949653pgf.12.1535045908164; 
	Thu, 23 Aug 2018 10:38:28 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	v72-v6sm8520973pfj.22.2018.08.23.10.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:38:27 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <aabee0d4-4a28-98c9-515a-9033de948c5f@linaro.org>
Date: Thu, 23 Aug 2018 10:38:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 20/22] hw/ssi/pl022: Correct
 wrong DMACR and ICR handling
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jp8KAuFN6T6L

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> In the PL022, register offset 0x20 is the ICR, a write-only
> interrupt-clear register.  Register offset 0x24 is DMACR, the DMA
> control register.  We were incorrectly implementing (a stub version
> of) DMACR at 0x20, and not implementing anything at 0x24.  Fix this
> bug.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/ssi/pl022.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

