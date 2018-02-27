Received: by 10.28.71.27 with SMTP id u27csp5250750wma;
        Tue, 27 Feb 2018 12:50:43 -0800 (PST)
X-Google-Smtp-Source: AG47ELvzuvHH7ehujpLwH9zFIcoyV2mPHRTcFawmqnGlTx6Gh5X6jZZPMbagU6OtI1RzKCuT9l6H
X-Received: by 2002:a25:8389:: with SMTP id t9-v6mr10376818ybk.225.1519764643603;
        Tue, 27 Feb 2018 12:50:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519764643; cv=none;
        d=google.com; s=arc-20160816;
        b=Aq+E0q9WYvvFWMujd4sTzh8YBRZgp+vyiVnoK7mLOl2gh60h3Y4KndJV2NnpOebHF1
         cB746fz3mGBXpmd7WCm9PwM1f5a5hdB338n488fllMPqcTH5JIjBVvOoycaM6Gd93NZu
         V7BO+GBBH6Lp0Wz6w/tco+1TVIoCsmw/GvpZi89ol0hPTM7hklhV1BEpe0rqSh+MCqrr
         aT7oAM4N8Ji6s00fsZeLi3z68hiZfVXiFcpuVKHxhTAR63b5+tJeR5yE7I6T4IYrBppp
         gu1B1TO4KseU9UmU3MWZToGY8QTBh3LHaTPA48F1IawCRiu1sJ3suIx9ot4xB88t0urZ
         XzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Wx8k2pAQANeQxrGSwtLwcVgVtYVYLADmOyFb0k9Xtfc=;
        b=p1bv3sx+Jd4BMJgzMvzO7SkVmadEPJgC2uXufZLvTQWhxQewyNfl99ybO8Na/zz+Tp
         9ed5QZKdcGH1fAXtk2XCllhop689eE+jSm1eGmWy3wj8z4bttTDJdV8BRldxGD8E7rPS
         pN3JUbiGMFADbM0yiFzP6f2XvfYRAKhTFJGm0SZfNeJIK+x+tZe/m7Kz5E/cTjdiKkR0
         sRkb1lRCFQ/wjpQJNaTE5Du6GcrEZiH32JsjgOG8SMFMjHz8VYn/mqaVnQmQ+CBqjm73
         O15t1sMJF32MWJFhElT4iEVdhrWBWHr8J5XNQXw1KChgRHt1ZHtEvrU8/7hiZ+QhB82S
         H1nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BvefWAFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t9si4768ywh.612.2018.02.27.12.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 12:50:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BvefWAFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqmCx-0000rh-3i
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 15:50:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmCm-0000pq-Az
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:50:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmCh-0006A4-FN
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:50:32 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:42001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqmCh-00069l-9g
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:50:27 -0500
Received: by mail-pl0-x243.google.com with SMTP id 93-v6so108030plc.9
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 12:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Wx8k2pAQANeQxrGSwtLwcVgVtYVYLADmOyFb0k9Xtfc=;
	b=BvefWAFbZrDUOWMGpAYDebMXQekbgMqDvXlXg5ljOwxNgwBBSTTR9gqdgQPtS/5sx/
	xsXaUAiYmabW1wmGsibmKrF2x/YPKVAJdPkoM3fl8x0bqfaU0Dmwov3s4fbry5g/6hpR
	a+T3KuiwAaoufRqwFvvz8wRQAbI5Vcv3cHikQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Wx8k2pAQANeQxrGSwtLwcVgVtYVYLADmOyFb0k9Xtfc=;
	b=ntpLjcrtssEqZlTn2y9NG/78N1M8umFUVzvDkunWuQo001IoldH3UoycDkwsGUuja8
	NiEHWWeV75j+SYM2mZiNuH/pUKQCpUzfWpdD8dAySRUXIxsR0SIyLJykoaq1x8eHLv3Z
	VTJ7XCFSU6N7pNZYrZnrakrUE1Z8Lt/RsJXolihMYr7vvCv9j1xJp5qUPo41NHAKUla6
	gSgcuoIw59Yb2oLUYOBxXWIpMa8tLSZf6m6XccXcdsDRKauFb6AxPSkKMXInMn8f8BvS
	kUzzYbjD6gwjSCi6AmhmWKHXwr2L/POZI5tTmMERxLJHxjjzTQf3tMFoJ+p+wuhQxVW/
	4Cvg==
X-Gm-Message-State: APf1xPB5Kaj4zWdrJxHV02xCI3zZfkxB/4A3Nw8sihqnf/IYIREoE3yY
	Tl9pQcyxZ7ylUcF4p8BnclhJEQ==
X-Received: by 2002:a17:902:8ec6:: with SMTP id
	x6-v6mr15713961plo.402.1519764626269; 
	Tue, 27 Feb 2018 12:50:26 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id r14sm27804pfa.136.2018.02.27.12.50.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 12:50:25 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f53d440-550d-a665-2c84-490c8b90720d@linaro.org>
Date: Tue, 27 Feb 2018 12:50:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 09/19] hw/misc/unimp: Move
 struct to header file
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
X-TUID: 8tbV/2W9AKE3

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> Move the definition of the struct for the unimplemented-device
> from unimp.c to unimp.h, so that users can embed the struct
> in their own device structs if they prefer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/unimp.h | 10 ++++++++++
>  hw/misc/unimp.c         | 10 ----------
>  2 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

