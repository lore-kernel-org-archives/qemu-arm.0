Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3153149wrw;
        Thu, 8 Nov 2018 01:20:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5d25g0ChG4KA/WOOQX2peSnWHL5F94H33+v0o8BJWpr1iiGedwazzDFYyacKzgP/Sl9jXgc
X-Received: by 2002:ac8:25f6:: with SMTP id f51mr3712233qtf.129.1541668801186;
        Thu, 08 Nov 2018 01:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541668801; cv=none;
        d=google.com; s=arc-20160816;
        b=h0TQVnGYqcCeONsylAx6UNdRK8wBkow8KDwqoQtzSLOp0MWBIs0mWZ9JUO67X0OkJJ
         oMj7G7ftdlq2pbfGlsxi5vdnmJcLWFkHO913JSvXKg01Txyk9GVKqasfWi6uLtlOw7Ul
         fJK6VrZRrrH1+j9iJZNzTr610CKBiszSPfsWwaL1wW0cWiNmXSfzvLokmgdPW5Qvau54
         SUZEFsX+RDY/Crf9EcqnhnD3LaD+723JKusJghMik+xR2A6FfyvBtA4ndW8sW2tPO3rt
         hQAquP+sQCBQf9lUxW89qpe8YNSS6vagOHRLk2g3l60t1DF01PbypEK6jdiEHKVjQXeC
         6WFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=+Rg5lZLULFUwBiyBlcRpfLCHgxYlBBxHraxSWFseZ1Q=;
        b=ChcmfwbqAjZqSbcQjTyCt7/ozn+HK20yX1MpecI8RNVKSHnPclI4YPjKO/upJwVtFz
         SvHdRR6JLdTiJz6ATc9q8Dv4YW05CXikryOhb3toWPA393KoQeU3ixb5N7gs/krIQgwB
         GPKU/fSV8F4rgRCr7DS775SKwFOjNEl00bCRyRPaenCG0wsQktcG85vknCVTUBTqSDav
         pIW2UJlKd5CINrtyMzZIU4f33IqxAX+xE3bb1+KjTNVGKy49eax192GhRUmsdmSMEZF4
         tUdC5ssNFqb0FwL/ODuSQkS4Jtr7s0ts0lCOtrnXMVK+1lCVNUewW3jdZ3ffcrqbRaVh
         S+/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H3Hqp0aS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j13si172406qtj.296.2018.11.08.01.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 01:20:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H3Hqp0aS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKgTo-0006H7-Ni
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 04:20:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKgTZ-0006ED-5Q
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:19:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKgTR-0007RE-M7
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:19:43 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44278)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gKgTN-0007Kq-W1
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:19:36 -0500
Received: by mail-wr1-x443.google.com with SMTP id j17-v6so15261266wrq.11
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 01:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+Rg5lZLULFUwBiyBlcRpfLCHgxYlBBxHraxSWFseZ1Q=;
	b=H3Hqp0aSChseDBeA7UBBzyWYYkoxgIqlgJqJyDtX6rv5xVxLRd1+SB4pMQEX4BdCOz
	KteHjZ9M6p1wmW/mfNuwA7gFkWjjUmFsx4EjmUdYqMOhx4Db0BVm1nA1iq9V6fcqt4Te
	K/oEwxzrtR5+rsyeyLFWy4N2AZHavGHdFS8Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+Rg5lZLULFUwBiyBlcRpfLCHgxYlBBxHraxSWFseZ1Q=;
	b=sWa9LDD9Z7gc9s1/WcBFnrYbpOnRv6aDCra9/U4mExjSYjqFrjYMOiA4qnd5ZJKet6
	XghZRVsy2r70IDsmPzx26Y2wtsxOORbyfuXVtXiiuQfc6he5DrQu8sz96Se5xPsE/a3S
	LABguScMJaYGPWoqr4P37YSzjORGy1S11VhvoxFFF5UsCRRD3DI/FkZZV7ClLghAOV1y
	c9YRMabr/WdvEAo1HRnpC1z9/opiqmsNsRlkQy/UqPoIsCksicZhiHPARAQ+JtIVkw58
	RG9cva7tT9QdWulsy7fjZFuojVph7Du9AC+RsBT6jSDHQcShGK0oPk5eoU+bvtXsIv5c
	zCuw==
X-Gm-Message-State: AGRZ1gKuQZ4FJa6qWug+ocZtjTj05jnufMLWtJxmg+hnh+Y/Vzg3kVT/
	NmRcCB043VU8k1q1VgtM2Odl2A==
X-Received: by 2002:adf:dd49:: with SMTP id u9-v6mr3309086wrm.2.1541668770040; 
	Thu, 08 Nov 2018 01:19:30 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
	by smtp.gmail.com with ESMTPSA id
	v8-v6sm3627075wrr.41.2018.11.08.01.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 01:19:29 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181106163801.14474-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <468adced-a5d3-d511-b865-bb0c602d3fe7@linaro.org>
Date: Thu, 8 Nov 2018 10:19:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181106163801.14474-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1] target/arm: Remove
 workaround for small SAU regions
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
X-TUID: b9b7y1JKRlLP

On 11/6/18 5:38 PM, Peter Maydell wrote:
> Before we supported direct execution from MMIO regions, we
> implemented workarounds in commit 720424359917887c926a33d2
> which let us avoid doing so, even if the SAU or MPU region
> was less than page-sized.
> 
> Once we implemented execute-from-MMIO, we removed part
> of those workarounds in commit d4b6275df320cee76; but
> we forgot the one in get_phys_addr_pmsav8() which
> suppressed use of small SAU regions in executable regions.
> Remove that workaround now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 12 ------------
>  1 file changed, 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
