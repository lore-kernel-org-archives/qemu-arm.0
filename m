Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1044016wrx;
        Thu, 28 Mar 2019 13:18:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqya7nVAhW0tZ9WeUzImzKw+0LkLY7+YdEvlUMDZbWHBYcLvn6LGzdDGnu+W17xh384md+kH
X-Received: by 2002:a24:6412:: with SMTP id t18mr1593122itc.120.1553804286694;
        Thu, 28 Mar 2019 13:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553804286; cv=none;
        d=google.com; s=arc-20160816;
        b=SPSjLZDel4boWZjYCAhcvZaYQZSdYk5ArxDfjNzvtpTxCSlAGlHPew+FbHPyg63WAO
         2JC6aKdKAHPGFcwaHUjP7AC9lgwIvmWPomCAKF3iPdh47Vh4cLxZmsFrM4A6XW/PqM5s
         6rmyiR1U9tt5G1tLbSdlNEEELQWw/u3zNklSeICD+YqYSv6KIhSx9oa66zRSUn3W5S/E
         x6Y3vptwWGHAcHSi7TEUfl3wEu+HSlrMtsh3ZfLSi7mMzBZZyPLLrZFZHsBw2tEj48sw
         DAQbgCEJq1Hun8l2MOM3GAp9J+Mbj3MrWMaGNjJv5aDeIwTg96JJLjPBQD8rggcrWgTy
         x4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=cElHxRTyRWojmonqhbsUDSzTk30VoIChn/nXy0YUVKo=;
        b=UAwdwqN5+ZXTZ3ooh7furjNXZ2cLTAaq+Q+FMMrzzfGk/uCYRLTa9HW9/+C+i6RUg1
         117AHQ7bVooF72N5py5j6Q9qQLVyK5rcDFr8TVSzqQ3CzY2A/03LClMds3XmADhFBb9C
         EW1IdsIPjxaxlXC/TpXqNN6u/4AAp+1E82qkvxqdVapJTvGqR8AWMZQ/4RpsvNQlGMaQ
         9rv5CdsTlG8IfPcOC0wTC87yeayrVhM8PYbrgXLslcPQ1fHKHgLgB0HJo331lmcBLgrp
         H2u4zcuIewp/M9nQL4228a9JD2bFsRbg0VbZazBKB0e9dqFQnGaohV/1fe9EcDNVzGk6
         Oojg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WmII8Ep5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v188si2302671itc.144.2019.03.28.13.18.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 13:18:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WmII8Ep5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:41554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9bTS-0003fQ-2J
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 16:18:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h9bTH-0003f1-Jz
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 16:17:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h9bTG-00052w-It
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 16:17:55 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46724)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h9bTG-00052i-55
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 16:17:54 -0400
Received: by mail-pf1-x441.google.com with SMTP id 9so11841209pfj.13
	for <qemu-arm@nongnu.org>; Thu, 28 Mar 2019 13:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cElHxRTyRWojmonqhbsUDSzTk30VoIChn/nXy0YUVKo=;
	b=WmII8Ep525fuAsgGwXv30d5H1ySocAz4DF9PkoSLCJLXfAUkCyCSHMWqua/Sf4bPo9
	e/b4r3s40Ko/IJtzWQ1PhdnLp7RL1tNm64ZkKQQi75lIVuNv/e2CocyPN/7cxyawtnBc
	HoFCC+6qNq9Tq2En8h0iCG0FOy7MgKMa2eQVVnvy9C+l42ERTCpvOPjVw/O6s4TZwCzl
	JybW22kFnWCQYKdANCwOLzp9JxFhf8GwRcOsTsV+mvhJEJurmEoQXUNJ8ec3Kt1XY7gI
	g43KD8EAWRzO5g4CGk4d4x9TPffZIpAufSG7kMBrT7GtQzVRvcgoiZswgQE025LIDsov
	CK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cElHxRTyRWojmonqhbsUDSzTk30VoIChn/nXy0YUVKo=;
	b=W/dA/sPcinbcinYgdTmpTiHKy5J4hIz44oC/JrI70sK5QmhzqRVCkU24xThh3z4t8J
	XX7z7ZBZ9OAOrU5d7AHFca+RV98VxF/fPkZdVJeU8Xecc+4l3KXC7lsPbDXQPO6KBM+t
	eAo2iLEFkgHTTuTTX6IVWYo2PNji3pmHWYDGYfGH6AapHK6bJjenEbQxTVWmX+Ru/ZI4
	MfOQr/Q+keh638nZzDZqehGGdxJloAPI/H6NNhJQSTQbaUkbGyaGVMh/uWSvOeCtw34q
	7OGkzSYJLnEg9QqnVsxq0clofBunA8wNPlvnyDOReTHNCQ3hV2r38aynA1JoTkgx+jkG
	NwpA==
X-Gm-Message-State: APjAAAWpwDiq/TN20zI7nK1LmemJeSVnkO2kPM4mnb8pm8LhlEJFuUzT
	emVyLbz134CN2LXUrHwSy3Luag==
X-Received: by 2002:a65:47cb:: with SMTP id f11mr42006514pgs.18.1553804272665; 
	Thu, 28 Mar 2019 13:17:52 -0700 (PDT)
Received: from [192.168.3.43] (cpe-66-75-72-255.hawaii.res.rr.com.
	[66.75.72.255])
	by smtp.gmail.com with ESMTPSA id r10sm28043pfn.188.2019.03.28.13.17.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 13:17:51 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190328152944.3199-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1f9a85c5-18ba-7a58-90e9-dbd27c42efd0@linaro.org>
Date: Thu, 28 Mar 2019 13:17:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190328152944.3199-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 for-4.1] hw/arm/raspi:
 Diagnose requests for too much RAM
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
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F+ZCPITaUiLp

On 3/28/19 8:29 AM, Peter Maydell wrote:
> The Raspberry Pi boards have a physical memory map which does
> not allow for more than 1GB of RAM. Currently if the user tries
> to ask for more then we fail in a confusing way:
> 
> $ qemu-system-aarch64 --machine raspi3 -m 8G
> Unexpected error in visit_type_uintN() at qapi/qapi-visit-core.c:164:
> qemu-system-aarch64: Parameter 'vcram-base' expects uint32_t
> Aborted (core dumped)
> 
> Catch this earlier and diagnose it with a more friendly message:
> $ qemu-system-aarch64 --machine raspi3 -m 8G
> qemu-system-aarch64: Requested ram size is too large for this machine: maximum is 1GB
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1794187
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2: use '>', not '>='...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
