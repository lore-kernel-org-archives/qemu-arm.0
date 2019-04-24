Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp27451wrx;
        Tue, 23 Apr 2019 18:27:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLNJmGkSbb/ZvpSVbX/EYHAEsnykk3WT7cqPifexO9hqBFg6ul7c9MGpjuOPXoUDmhdAn0
X-Received: by 2002:adf:ef49:: with SMTP id c9mr4245254wrp.321.1556069258476;
        Tue, 23 Apr 2019 18:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556069258; cv=none;
        d=google.com; s=arc-20160816;
        b=wLT7jIf805DelBmL5KbPjCoKiFJP+CuYlWzZszfarrLf/HhgIvgCFzRCn6ISEVuneC
         qgNjpQsfCPDtJYhTZUeStdHAmYppWo8qCP7w3B/YEXwURi0mqISVe2hhXB4JJqdwrlXq
         F1xdRwvfhQAg13WsmSxqcblmrwwe9GoWNIQGZ785TWIn798zM2lq7Tjz9wW7io//Cb06
         kEnmifPCi79LdHdwkWr/i915t3ra2mFNYmopIZwS+TFhfPR54MIcmQ2NORudfjYivbs5
         NXRxhDD6LRBrdRKd+wn0SAE30tt7R6ODBBJID4gcjlZcP53Q24J7Mp+/Euo8cOJWttAJ
         U0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=NBLEvRIjRGhMKAVexH9SVdSYnNnSzp3ixEGv6UvlgBo=;
        b=fTfrQ4H3DejA/pw/Fo3WWZjWTj/V4y8hmec1ERh6VBBCoqo60+ezhBqlwaY6X2QF+A
         5AdvPVXClshc8FfbPC7BQj7hOUWorIENOA9fpoGts3srJIz1SE7QkEfhbRCUzyNTFOK7
         nyyet1EdYBAZezWMGsGST2W1yVxjij4VYxfy44GPOm6YQTP2x72a2BCXJ3khstC8DVFs
         mA81YLW2nrLVCwANpm+whhZe1OqrCiozmkYV33fzqNGElibQHaMWYuBSm3qq3B18OvP7
         toEobO1tS/vISL9qiQOTR/kH7wCglR463Gog7JXnjTYu7k5HhZoi5jpNjJZoyLsDE/WX
         trUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sVvYziBO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si6101407wro.193.2019.04.23.18.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 18:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sVvYziBO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33885 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ6hF-000302-IE
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 21:27:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ6h4-0002zo-HO
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 21:27:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ6h3-00079X-JP
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 21:27:26 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37839)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ6h1-00076w-Jc
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 21:27:25 -0400
Received: by mail-pg1-x541.google.com with SMTP id e6so8507694pgc.4
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 18:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NBLEvRIjRGhMKAVexH9SVdSYnNnSzp3ixEGv6UvlgBo=;
	b=sVvYziBOPKz5Axa5XEkWdQtjlSwadGKxnows590qfsGX3MIcVJgpjEv1Qx+v8lz8S7
	MtdZyqGZ/byQHynn5a+u6QmzE2kfQXPPf4UMFVPG6nwXSWtpl7ZDSfZLH1myNKc3ycje
	gxoUsXHu9X8EFCyxGnzroGckU0YT5oyNC5hxZRqGX21gfG6xCMo/VbxjKlkyKhJn71jb
	8Zch/EMmyEL0pO0ZnPe/1jzmCRqIukXtXB+o4pP9egInRn1C/r3cFd5O/OU9hAEMbEOb
	b0bgfh+TbPqmxJumpYznPRmVmTxTU0oFuOb3yqwizjW6qt7erDyKurvXWB5sfyU1So74
	GsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NBLEvRIjRGhMKAVexH9SVdSYnNnSzp3ixEGv6UvlgBo=;
	b=txD3zY88PKDhmCK6CkMRebKX/uqTykwEbH2G8j/bQ1m8FNfzPjZzGL0LAYPwmhRHQL
	HX/3j8pBCACwoPQTLfyCoVB1DDE1E6SMPQ/i2p3ltm+ACYw+SqsI2PGBrsF4qfLx0hJ0
	ja9iKCuIFvK6pgSnOcf6RJJntj7WGbr0jHsRiVkaf1DSn5139gwpEc+73V1iRmjzoTYN
	DCePh682lOHkvdC22TSQXG+tgFmR6FXxrgRyjHgRno0s4HkpIDonDRkWSBF4IePIQbTt
	nwXWp/pAdMleWBO4adJU6B5Ugb2rrNG860a90LnWZD9TRQ1kmPtacoqNRRqETM+54F/9
	FeYA==
X-Gm-Message-State: APjAAAWhPwUCJrsHO92fT/n2+n6OAbh0pMwL1fMQbprXYvuyIMnH0qEf
	b/tzX6NLLez/NK/3mflQ0glz/w==
X-Received: by 2002:a63:e304:: with SMTP id f4mr27788981pgh.374.1556069240792; 
	Tue, 23 Apr 2019 18:27:20 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id r5sm1545142pgv.52.2019.04.23.18.27.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 18:27:20 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <59198f7b-231e-939a-6bf4-77649513f881@linaro.org>
Date: Tue, 23 Apr 2019 18:27:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 22/26] target/arm: Add
 lazy-FP-stacking support to v7m_stack_write()
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /iWDmrY5rtF3

On 4/16/19 5:57 AM, Peter Maydell wrote:
> Pushing registers to the stack for v7M needs to handle three cases:
>  * the "normal" case where we pend exceptions
>  * an "ignore faults" case where we set FSR bits but
>    do not pend exceptions (this is used when we are
>    handling some kinds of derived exception on exception entry)
>  * a "lazy FP stacking" case, where different FSR bits
>    are set and the exception is pended differently
> 
> Implement this by changing the existing flag argument that
> tells us whether to ignore faults or not into an enum that
> specifies which of the 3 modes we should handle.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 118 +++++++++++++++++++++++++++++---------------
>  1 file changed, 79 insertions(+), 39 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

