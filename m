Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp991328wrd;
        Mon, 20 Aug 2018 11:31:56 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxjcUpZmnKPoCVVMu7bG7NlIimXZp1hzMkwLmsmyzIqCXDb1yoA9rdfEsBn7SeVhRQ5znpF
X-Received: by 2002:a37:9007:: with SMTP id s7-v6mr42240585qkd.243.1534789916159;
        Mon, 20 Aug 2018 11:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534789916; cv=none;
        d=google.com; s=arc-20160816;
        b=CLg5b3UHgLgoRP0t6H8UckSHu5Tdy9uEYLhowOx56fIO6M2ELxLarvxh3aSqdi5xBX
         gJWRvmzU/XwG8rFCTXoGrbet1RXUXQciA8y8/N4sywGWZRezcQW3tG7KUN39WhighGkJ
         rDGoV5edKfVkNCPT6N/V2zMkJMukaFqVGyyOg1nbS/bv7LuL7kct3nI122BRQpXNbnY4
         1VUb7TdK13zaGfsaBNQiUEjAeTebhO7oOxQRHjMH264TX5oFYqAJhEgqM0McTcc5MHnv
         cKTxhYijrfhEhHzia5Yuj/1KcrW31zj5PTliTNRjgKTsZbJcelSRok9LOIoX8rZXc19k
         wszQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=djGoxsxUmtocLKfPRFRwpmEoRBCRIWSFo1QMaLZuB9E=;
        b=dUaQsxL65yI01GVTjACgm2IQtimxCyLUEpGJn2wmYM12zzAmiOlrsj/Cu1kA40j8NW
         VFAWRoVRIfN0lP2WpHShFe0YkGf6zibh71g3HzAgMsaXoM+WhsAjqFVBVsyTdXi4Nwb1
         agVwFQmLFkWIHs7e5xoS4LK1HEBDQSO0DEyrFreJ5guFWxtLNslA6g7ofk4YH7Cqez7b
         Rp3RkkxL4pu9QiyqhAER0jRxNuXpEi0qXYyOD/A/YBCzNPThhHH//mURxzOckBfo9FKM
         3tD+7SZuWX4fXsjxXz/a7DVes/avWnKJa3bhwrRGfwXUW+XTSWyx2Tn+qSmC5QEo3Xwa
         c/cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j6iSbQZm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m187-v6si7493318qkb.191.2018.08.20.11.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 11:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j6iSbQZm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1froy3-0000qL-IZ
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 14:31:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1froxi-0000NT-Qc
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 14:31:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1frols-0002aR-3I
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 14:19:23 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1frolr-0002Yr-3g
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 14:19:19 -0400
Received: by mail-pg1-x542.google.com with SMTP id s15-v6so4415058pgv.8
	for <qemu-arm@nongnu.org>; Mon, 20 Aug 2018 11:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=djGoxsxUmtocLKfPRFRwpmEoRBCRIWSFo1QMaLZuB9E=;
	b=j6iSbQZme4kazuvAn3PegH+oyLLjTSWWzj8mTGuOiin4cAPoYMlkRXpxBoBW5fjMgz
	kizUQAMJx7LBcUJntVVHeMQ/I8FdQap13oanpj84NLVV//PIDPh0ujZK78jQxLz1ob2G
	Z4/i49p2viXl1laCaKutf28nE7uVWvUX1eYeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=djGoxsxUmtocLKfPRFRwpmEoRBCRIWSFo1QMaLZuB9E=;
	b=obmnSxJ3bu5KNi686fZMomLWapouJNbyxDP5Om7LgQ4jzFLx/Q5WtQi/TCYY03GgdU
	jrzj93lS/uZm6h/zl2UeLlyIvZ9XEdFIl+hRXrNqHav+03mIPXSU8W4Gu2WVo3BsjYjp
	v+BDTrGcG2aI2S39Es11EwUNvjRGasDu5VG9NBVrknudfU+wYd58eVnbCTsoawhL67Fb
	6PWpxqdegMVLDhr/NtoYmlCm6UbQBde7piRNgLgnuM0ztfVSsCYBb2VQSBsF6AzBnX3d
	pusTbJL8RJlpLJtfGpgMpULEZ2LLr87XONgPPb2nigRhgUw1uGR/5JZAJWKfgRPcVK7Q
	TONg==
X-Gm-Message-State: AOUpUlG1KX0+3INB202QsHxg6koeIb2jd5mo68lHpIYa4Rg7eQDeXpcE
	zGoE1sx5Gkdaby37kVexgxwO/A==
X-Received: by 2002:a63:e74e:: with SMTP id
	j14-v6mr44080438pgk.185.1534789156406; 
	Mon, 20 Aug 2018 11:19:16 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-8-179.tukw.qwest.net.
	[97.113.8.179]) by smtp.gmail.com with ESMTPSA id
	a17-v6sm17432617pfg.106.2018.08.20.11.19.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 11:19:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820153020.21478-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7010289b-19ee-f5a5-93c0-0ceb4409b111@linaro.org>
Date: Mon, 20 Aug 2018 11:19:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820153020.21478-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/6] target/arm: Some pieces
 of support for 32-bit Hyp mode
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t+c+LBL7iD7q

On 08/20/2018 08:30 AM, Peter Maydell wrote:
> Peter Maydell (6):
>   target/arm: Implement RAZ/WI HACTLR2
>   target/arm: Implement AArch32 HCR and HCR2
>   target/arm: Factor out code for taking an AArch32 exception
>   target/arm: Implement support for taking exceptions to Hyp mode
>   target/arm: Clear CPSR.IL and CPSR.J on 32-bit exception entry
>   hw/arm/boot: AArch32 kernels should be started in Hyp mode if
>     available

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
