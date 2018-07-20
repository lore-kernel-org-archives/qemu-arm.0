Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2952722wru;
        Fri, 20 Jul 2018 09:20:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeA4fYllCEOpy6J6CMvKhV4vY+avzuN5hebj3iULSsRxBnmSIEdQL50rnhw8On48KM1HPNI
X-Received: by 2002:a37:424a:: with SMTP id p71-v6mr2431398qka.100.1532103603633;
        Fri, 20 Jul 2018 09:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532103603; cv=none;
        d=google.com; s=arc-20160816;
        b=hHOrcxKebb4idfXIQLbKO3RpjlkrLA9L6WT32Zdb9A07CnT+LA1/Kf5yyzcFm4xxNU
         JX+qZERxV1u8Q69UzMEkaAQQ6zr7HjBeaOhxD6McNQ8mwBMbvCpLxWfvKsTcy5I4aDv9
         Sm1PIb1h0hhJco/G5fXuwEZ31xg90pFlqFEokpiDxd/RfPFCfd9iwpy4XBcZydNhAFQS
         z1PSR0pQ71MINkyE5RtHWOtbFffcAsEDrSysX2wP2QjfPLFnkRV3hpIbd+seqZ5etuNQ
         ce7jvWwl+XIrVZyq9LIBQ5ewmFCdzeYE6ANijHg7ugWfeJTt+6COBpSOZgugRsip2KIY
         msyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=hOnv1pDBg1mMe3PPKwOcDNUhtnGp1W4sSKKhDVDbmRw=;
        b=h3UWTat8pd2T5wT9Kt1cOjQ57iBPeOFM8H+tv1t8z4Lf4bV6/C9ncSC98ovoEA74uy
         yxmhZejJa/PD/hHUzsDDdgwuwWzt1pSpAF3Bb+UDZ91ygaRFf32x7zcLUabECqukl9K6
         aDPu9bglKgOlURRqQDkDMdjiWceN53eiLRFElfMmcD6wyppy+SDPJ5EDjO7yHaltAA4g
         1kWvxrYyY0mS5ZcBY74Xn7S6di1Fn50HkixHaSbqwsDTMxloh88CoTECUcmXTTNreUPA
         OCJZRNDdBZfLnsZTYjZSsKqTNrP+XWpfFlwzNJalHBZx0rUAsLXKZhVvqK8Qm7hbQ4Rc
         IFAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVZCIk05;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y36-v6si2091949qtd.59.2018.07.20.09.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 09:20:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVZCIk05;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgY8R-00038O-3Z
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 12:20:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fgY6Q-000266-5F
	for qemu-devel@nongnu.org; Fri, 20 Jul 2018 12:17:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fgY6N-0001jq-0T
	for qemu-devel@nongnu.org; Fri, 20 Jul 2018 12:17:58 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fgY6M-0001jR-PQ
	for qemu-devel@nongnu.org; Fri, 20 Jul 2018 12:17:54 -0400
Received: by mail-pg1-x541.google.com with SMTP id s7-v6so3850115pgv.3
	for <qemu-devel@nongnu.org>; Fri, 20 Jul 2018 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hOnv1pDBg1mMe3PPKwOcDNUhtnGp1W4sSKKhDVDbmRw=;
	b=EVZCIk057AXsE6X4xg/8LlYOHVxUIlWnRA9dkgnh6MMfJEqEE3b3rnNrJ+5h2DLpSa
	Iw+xOmdzbMKGiI+zYI0G1EXnT7kmjNxyY5sSWjyc3J+iyjyiZljkZh42chGbQYXXubZy
	nm8x5AWjgsV11Xco0SFwMa8/dfsKA4PrlVKfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hOnv1pDBg1mMe3PPKwOcDNUhtnGp1W4sSKKhDVDbmRw=;
	b=c1KPgf0am4ff/+U1gy/WlecqG2oHYW8uqUFXBFExE24pUeuFPBoZibJM6I4UByqbVN
	3Hr3ICNtdcagTnTyNywxBFpo3869uAXT9Th40WV/r9bDGWT5BP6knJw3q7PctDUrn9O+
	xAZWvCctmqLilb2cTWyiBT9/ARNUqOFBv/5RZBZUZncKrz2Saw/FUWUO5g8eioxRDCVS
	GNw+OOSygV/UXf4JLfXigWylcJOI54u/PGTGmfdUbw47Q7rDL6l6tidkI+/yF82kUkKV
	A+rVI6vaXfyDP+ec+qyZeotfpOIkndqSedt6rUw2JHt/lts/vlDkfCdDOb8YofSESKVC
	cC9w==
X-Gm-Message-State: AOUpUlGnErnv+j1/fQ+2N7Zewf0CiM1Y44yneOflKiKyenCrlp6JtodA
	sPgm42zTgOyHvaGHeKAILNFOXA==
X-Received: by 2002:a62:f610:: with SMTP id
	x16-v6mr2836997pfh.169.1532103473888; 
	Fri, 20 Jul 2018 09:17:53 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	v82-v6sm6497349pfd.64.2018.07.20.09.17.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 09:17:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180720145647.8810-1-peter.maydell@linaro.org>
	<20180720145647.8810-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d2e23df0-bfd0-3f32-993c-461313fc4aa8@linaro.org>
Date: Fri, 20 Jul 2018 09:17:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180720145647.8810-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH 2/4] target/arm: Initialize exc_secure
 correctly in do_v7m_exception_exit()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nTaxerohetuN

On 07/20/2018 07:56 AM, Peter Maydell wrote:
> In do_v7m_exception_exit(), we use the exc_secure variable to track
> whether the exception we're returning from is secure or non-secure.
> Unfortunately the statement initializing this was accidentally
> inside an "if (env->v7m.exception != ARMV7M_EXCP_NMI)" conditional,
> which meant that we were using the wrong value for NMI handlers.
> Move the initialization out to the right place.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
