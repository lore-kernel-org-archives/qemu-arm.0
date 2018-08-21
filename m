Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2228668wrd;
        Tue, 21 Aug 2018 11:35:15 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbIzWKqTV0T8at2ierpU48LbO52mkb8J55QDrsUNsn2MciD012QLE31vy0K8qfnOByAVCwP
X-Received: by 2002:ac8:372b:: with SMTP id o40-v6mr20013495qtb.340.1534876515356;
        Tue, 21 Aug 2018 11:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534876515; cv=none;
        d=google.com; s=arc-20160816;
        b=VMoJhHTAxBVEcr5Ln6kGH8h0xK5/w+19DJbawsGcjfh1NjvKjAK/VfMOUPY9Uo/IHb
         jnrBYOhGMPlimIG+XeMR+lFDP1HuBslKF/L5tmbx2lmt2A2ViIvfl9nqfKpEbWMbrRcN
         NV/eRRnOsuaa78c4ACwzVEmJpGn9LJm1nZ58EGKJpu7AyNDv4NYAy0DI/yEzgh2CXbWM
         nzynntJCBbHtLFB/Z+lezlc4fEOKNYOEqNPhUIZbd50qW3nqJ8+cDyafTturfgrV+FzA
         2JcSWug01NPvhiErjF+ro+nCMCVnc+MLkNz5yrsMM0/WspcuW6Dm8+ahQyChW4PiIFUw
         IQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ofHxdFxVLGKzFyfiFo/tu/Gn0S5Dt5r+Pu6ZYoE75XU=;
        b=Bd02F7v6pns5VXIJlfsTM0OiJfpHk2V+Sd0Nd6wnI9VfqlTuMJBYmedYTqBaPlavOY
         mFBci9ZE3YY4CUUdo4OndLJxB8snO1m2lf000uvm4YJWVs2qwxOQNqO0dMRn/T6Ws0Yc
         Ip3lzh1EJvBFhTupIjsumXplPHiYODXAWIH0v7ujBmaegevY8jcVPghmdepA7agTAXuf
         bNUOk9oO1Vg2Z3Fy/AYqNknC+iEtPYZPCpre+4HYTSxjnIBuGE+jIEbzNPMQ4IassXD6
         oxmYpHpoLOQZSvrjYSYA0qpyRrzsaGkJhkbZSkxAfbBDvrvnqrOm67S2UV6p88FzPW+5
         HTWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vn7zxoEt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g78-v6si1868844qke.285.2018.08.21.11.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 11:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vn7zxoEt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsBUo-0001S9-Rl
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 14:35:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsBUd-0001RX-QJ
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 14:35:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsBUY-0008Ga-Cw
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 14:35:03 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33971)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fsBUW-0008AZ-VP
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 14:34:58 -0400
Received: by mail-pg1-x543.google.com with SMTP id y5-v6so8847849pgv.1
	for <qemu-arm@nongnu.org>; Tue, 21 Aug 2018 11:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ofHxdFxVLGKzFyfiFo/tu/Gn0S5Dt5r+Pu6ZYoE75XU=;
	b=Vn7zxoEtpE9DqstwkVdI1WGMtc4fdfaM5dvR4ogXaeEoafssyz5tmXnoE54YkIZ0F7
	5hSgHF7xpCov7qZTCwklNsV4KcyzUa5R1cOr21v2vfeOvijACuo6tYAOgOfahmhBmIU3
	I3E/P+12CZeGiCciEVssxqKzOKHNds9UoBhSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ofHxdFxVLGKzFyfiFo/tu/Gn0S5Dt5r+Pu6ZYoE75XU=;
	b=j/wgmN7ieA1+xFWG1+8JF155HRXESMvD+P0qltpsrUt9qfbmLFcS8alLITBBiSxu2W
	IaIGwLjWfVEOyoE/+cHxdNuqCPdhnwck0qWgNSXU1EvWq4r9Gs0/tUEFEWERjzqrxmWf
	ug5iNT2PG+GVkI9J5dhbQ3g/mXltDuuDxzCUkjfjpYN+LTVwu97sg+GnaG5XJvgXvHtt
	s70WWuhyqvbH5eAxUToF1MR25RHZNBJcBTS8BNsWR4VKnZ6dIAgG230if0RFdymdfKLb
	vljAGvn/wqQ7XqRBbNob4DXi6XuoIpAESOtfjC7J9DCFd1IgEFA7yF75mZ3s5xh5YFht
	bRbg==
X-Gm-Message-State: AOUpUlGyZx1TyDr1Mb+x/cJEi7+eQbYIpR6pDaTZ6YI2Pqmh+Qqvdt3A
	OXG7EdYkekfS1ChJzm6WagZEcQ==
X-Received: by 2002:a65:5cc5:: with SMTP id
	b5-v6mr48324628pgt.425.1534876491574; 
	Tue, 21 Aug 2018 11:34:51 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-8-179.tukw.qwest.net.
	[97.113.8.179]) by smtp.gmail.com with ESMTPSA id
	p11-v6sm30606383pfj.72.2018.08.21.11.34.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 11:34:50 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bc3e965c-5068-d185-11a2-83b692abeead@linaro.org>
Date: Tue, 21 Aug 2018 11:34:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/22] hw/misc/mps2-fpgaio:
 Implement 1Hz and 100Hz counters
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
X-TUID: aeYKOxogL40V

On 08/20/2018 07:10 AM, Peter Maydell wrote:
> The MPS2 FPGAIO block includes some simple free-running counters.
> Implement these.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/mps2-fpgaio.h |  4 +++
>  hw/misc/mps2-fpgaio.c         | 53 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 56 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
