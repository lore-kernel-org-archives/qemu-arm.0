Received: by 10.25.221.202 with SMTP id w71csp1188069lfi;
        Thu, 3 Aug 2017 14:35:08 -0700 (PDT)
X-Received: by 10.55.18.27 with SMTP id c27mr297221qkh.352.1501796107893;
        Thu, 03 Aug 2017 14:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501796107; cv=none;
        d=google.com; s=arc-20160816;
        b=qJTUYcyXhEg548AxGjNkHg/XTJOa6gfsqIl0JOQg3hL4O+LbXOt5OLlZGsGXtxdH8G
         f59xgPAC3FDjqAnsgJjngYaiOMtmyuZlUK71/Dev2YEEHNI+y5C7L2aovPCZ+PYIe+Ir
         cxiCKexBEtvaP0tYO7zkwJLHlB0zzu5UpnVF6NGt2ccHsz1RNvrtLJ9Vb+sTRzK2mJT5
         VdR/h6+zZr4XKzb4ey8BRcL4u75npLtx4UwYsNF29dkzzWcLr5PVvaXsJINC88kMNDkN
         PAWo0Inc3J/NDbwc7ZYUFsFRRCXgMWVp/Khp4+YdwV90x19i25NxZDVrJFWtTZu/lJB+
         +2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=LagNwx2JMFcL5NmlMJoE8gRApfuC6RRMjBYDEFM69T4=;
        b=u0yqZ3XCHsnrrTQUDrFEAR8LSEe4xjTrsCmSSknJqWOPYgoi5+uN8bTj6FcB9GRO4D
         pKrrUkv2Ig34BkRt18CjCR5P4jHhk2L0Sxm4mpsw2CoQ2igRj30u/xBtNqK5eaj86e83
         lYSMA8/gv225JBMNQb7b60jQnTtMDZAMVevvRRPjGG/Mc7+PE/G/yQqBjo+FZUCDePIV
         XUcS3MZmg/0S469LrGGA3AV7sffDT92I+85qHa7mhwINQas+mx/wUz13pW2KB8xyI073
         rku/3KBrOQHxKeZu2u35J8feS4d3VwMq0X3E4Chidze2cHsd1FI0BGbK0zobL+wL3l6m
         EhWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=tSYIIX45;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r68si9128466qkc.483.2017.08.03.14.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 14:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=tSYIIX45;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddNlp-0006NN-5B
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 17:35:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddNle-0006Le-Bu
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 17:34:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddNld-0006w5-KD
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 17:34:54 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:33315)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddNlb-0006tL-OL; Thu, 03 Aug 2017 17:34:51 -0400
Received: by mail-pg0-x244.google.com with SMTP id u185so2568226pgb.0;
	Thu, 03 Aug 2017 14:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LagNwx2JMFcL5NmlMJoE8gRApfuC6RRMjBYDEFM69T4=;
	b=tSYIIX45w6H+nkPE5f7xqtiePoi3iMS76nvy9qMNLbMTSq2UQI8CrWBM73OX1MU4Oz
	S9MCZoRyR/WrThpzWQPWVGNL+7O+oYvxaZl+CmCaQASJNc1msj9MaOo7mpL7hEer4Rys
	2oi4oUiuTFAnZiY6nyT99GqlprI/7/Qxfd5YSDtXI6lamkRoMZMS4uaJBXEu9ehSbxZr
	60eZVCxbmsxBk9RvtqGcMFuuoySlxLHbJ52hbecmdOmW/1HnON2ZWV2OjPQ9P2NOSsJn
	kDs2m7mWNYR7rxGCm+vQwZFbwnXB0ihWwdRVWuuAFLIwtZ9PL/nIMv6bx0eP/pqWYXGn
	0UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LagNwx2JMFcL5NmlMJoE8gRApfuC6RRMjBYDEFM69T4=;
	b=SjlttN3jOu8AvJtJHj7i7QYL7fCvkn8EuYi6Q7O3KQ23Hs+x7v4A04Vwi1KQGc9SzN
	QVpV65wTwztuA6c5TcEZ83Q++AzFjCFRsQ3sreQJmnCWvmC4HqzXaweAc5W5EEl4WwF5
	pWf0nBzObNbNA12Ah7+aHJysR6QA1GJAnBObEctIrufhwWD9OpFb6oiYWtxpa+/m3nrv
	i+axFaBfjvy1FwIWJG553+WKMKitXjprVWCmx9TJYkVvRxXHO3TNT5qh5zCb9UwXLVLs
	EKl5tpV7fsjyMlPwp/CKL3E2nqKLmEfoAtIfGv+INKLCtuDHUiUpW/0YcE2ZvEsV+K1g
	2Mmw==
X-Gm-Message-State: AIVw112PKLWdboW01mf47NIfzegosJqb2Thds0cnzocwDXSAqryWE5ce
	cD87RQ/Q9s/Vy5FdEh0=
X-Received: by 10.98.219.70 with SMTP id f67mr199682pfg.336.1501796090803;
	Thu, 03 Aug 2017 14:34:50 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	q79sm65078557pfi.99.2017.08.03.14.34.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 14:34:50 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-6-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <41deac29-1b75-6224-fb5f-983b4533f213@twiddle.net>
Date: Thu, 3 Aug 2017 14:34:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/15] hw/intc/armv7m_nvic.c:
 Remove out of date comment
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
X-TUID: T8DbWLKaHGyO

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> Remove an out of date comment which says there's only one
> item in the NVIC container region -- we put systick into its
> own device object a while back and so now there are two
> things in the container.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

