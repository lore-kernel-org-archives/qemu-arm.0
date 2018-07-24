Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp7140372wru;
        Tue, 24 Jul 2018 11:52:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeYPB7xQXJ34Oy8toHnnTVv87jG5tWtTgAoWY2LUS9ZHImnM6inNsi5RWOzURSlfuDX7G2y
X-Received: by 2002:a37:21e6:: with SMTP id f99-v6mr15883956qki.206.1532458333803;
        Tue, 24 Jul 2018 11:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532458333; cv=none;
        d=google.com; s=arc-20160816;
        b=XUdeA/5YWXZ4S3b2gUV4OqOrDycEbEOQy5p3aj/GSNhUpgpoXvIzjz4Tofu6ibR4Gy
         WXscJrOcyJ/26jYj1EXUVjwN/kDkyskdojQADId0nHwDAesGfyCwqqPPgzX2IXhLkzob
         qwtlKoPJw/NZ67tUPZBixwzoZIyOADjJrwzyjVZBut3nQ74SapD5fEZNLXYA1pGo5ETW
         /fZIGoaTFbE6sq9EzJUxDwLiTGQ+0iFVObAteC5efAG6LRckma82y0tUxCY+3gkIZhAW
         8mcIVGWMtYGkD8pZGFR+3QPRwNB4nw18q7Ld/DdioNsEGoDCtiZaeoxV9KuRK0afZ4JY
         gZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=TbgefA8ZPk6v8eyxFXuPlsXKjIXiaDg6mLKdOMhyL5M=;
        b=JTTzJ7V52+vrPDH0TR3uVs1psItveAh6NEk7tMdBCH0ys1zIL4dvSM/0yT4C1MO75d
         jdmmdfzPevLXCWxQnsYuqpv8LlBAbSQz4tUsORTVXnAz/2D7RnY1PzBbbNHRPj5JFVns
         nREykJy0/lP13WYeTJW/GLeSRQFDlWGMpv5LR7wuw20ZycAaySJBVJHaEhhBUbTXokQo
         7Zy0/IiY6tD4ppl1FERKas/Vh276DgxADn51ZvMhqMTyo4B8mXahND8py0KFqpgcJvLU
         Img0E13ESdiWz885xyrscIbwBjZCzie9QPc0Djhz1nI+Hkbl0GLP24sKa2KKYYH2T3KZ
         Dk7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d7H2jaAu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i7-v6si8152778qkm.225.2018.07.24.11.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 11:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d7H2jaAu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fi2Pt-0001Va-2x
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 14:52:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fi2Pk-0001Uy-VQ
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:52:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fi2Pk-00032P-5K
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:52:04 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:41747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fi2Pj-0002zA-SW
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:52:04 -0400
Received: by mail-pg1-x543.google.com with SMTP id z8-v6so3502603pgu.8
	for <qemu-arm@nongnu.org>; Tue, 24 Jul 2018 11:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TbgefA8ZPk6v8eyxFXuPlsXKjIXiaDg6mLKdOMhyL5M=;
	b=d7H2jaAuJwU5Ltiq6si+LW/fk02+fvt+LZazAeCGtWbZSP/Gz210pkmDbMbslCjPlR
	yVz1NAa/b4KEZ48VD6U1OoSHnRpKAUPl133IUr+KPU1N7sw5bgiqh/7T/HvkQlj633v/
	gj20kk7JYglyd6vMVpv/bfqp+GtZeKfYwaFX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TbgefA8ZPk6v8eyxFXuPlsXKjIXiaDg6mLKdOMhyL5M=;
	b=QmGD0PZlhJqd1nVU6rDYa7AZgSCnMd+7DDnVQttlCCRgmICKxVLTISzWBkjz2iRDPy
	Z1ruJ1vSE+KZtofbTENLT3A0EiPwCNUOOZFcV/j3jhlGyavmXJ/mY5MtBcVwNDvSd/0w
	m2B2gq3SbyHQLlNMbXj77TNLQr9g1Ml22FKQh9RFn7nVJrwNyQ2nki0H73MlFBV0S0fM
	lwVVSDAcWgyjy3HmICLHn2K79HICX8xcE1FQuwhdHpQHnprv+H5lXlyBVqX/dBSChrIH
	rJz6riyQRohBJPqc+zKgFmzgTDIp6Ax2895jh5ujOK5mG/JQSEgDzCd3XsV7EXMpAlOG
	xX4w==
X-Gm-Message-State: AOUpUlEOr6Fa568vIsS9klpToFlokyeZYWJHFhuXJhfSiPX399lpcXsd
	9Irdg15gn/s8kxqHiVa9qWnvNw==
X-Received: by 2002:a62:d544:: with SMTP id
	d65-v6mr18644490pfg.107.1532458322705; 
	Tue, 24 Jul 2018 11:52:02 -0700 (PDT)
Received: from cloudburst.twiddle.net ([2601:1c0:6100:a92d::e452])
	by smtp.gmail.com with ESMTPSA id
	u17-v6sm33603599pfa.176.2018.07.24.11.52.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 11:52:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180724115950.17316-1-peter.maydell@linaro.org>
	<20180724115950.17316-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d9a84683-1b25-be79-74f0-d2fb68b20a97@linaro.org>
Date: Tue, 24 Jul 2018 11:51:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180724115950.17316-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/5] target/arm: Treat
 SCTLR_EL1.M as if it were zero when HCR_EL2.TGE is set
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
X-TUID: kp/sJp0SO08C

On 07/24/2018 04:59 AM, Peter Maydell wrote:
> One of the required effects of setting HCR_EL2.TGE is that when
> SCR_EL3.NS is 1 then SCTLR_EL1.M must behave as if it is zero for
> all purposes except direct reads. That is, it effectively disables
> the MMU for the NS EL0/EL1 translation regime.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

