Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1910270wrd;
        Thu, 23 Aug 2018 21:39:20 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdaa8DwcnULM6+sYAT6Yxz9gLuWeVUCUyZxPiIBPydAtbtciYsrKepMv0nrJS+RJyWt1F9GJ
X-Received: by 2002:ac8:232b:: with SMTP id a40-v6mr61175qta.40.1535085559954;
        Thu, 23 Aug 2018 21:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535085559; cv=none;
        d=google.com; s=arc-20160816;
        b=wcrUcmiM9/cmwL+Ej4QSG+T2ts12wKnnr/ytLIipE44UyK+i9KNvmXoPhS7/KexX4+
         Pd1VK8viSGSKlMIscpMhu/JtJe3Uy390XIwF8wTrhfprg8JJLggn/GO1zHg9W6FgaExK
         wwI+86Phydrn0X8kVinm+Hmru8lOAr01SnxpQ/ZO+o7RPxsI/79CBGkOY99ot5Y8ccxN
         v7pJJ333LE6OlYnJ/m9m/wCvbGUAizcmGAyzsTU0Grixqdh6we+VETbMfJBWpAFszkAI
         UCo/R9eTEng7zNTsSV/IGiiWbHl2mbuv/Ic0zs+CKBMVLd1rZqR94O0zlSyxGJ2G6pR5
         2uxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Q2xSLEejFR7GYJcibJFwgd3ae1JOt3HBmdreG/ZgHVE=;
        b=EnASrukhlxxogfGvZTU9tQWBvz9/H/w/m01qbIrYr5nD8iGhEaQAQN7Gg9JIVSJUW6
         oJMzMCMC4hWrAaTJs6DUPfHk2hoRqVa1HyChktupnV73oKwudD86YemJ1Cg4lzs2qZvV
         fkBpNxjbqky4L2VlZ3QMbGhvG48//XBaJAC1jWQRuyUMdcV/4kE91D7XW0fnx0GGBr2E
         Ohenzmka2CeaV0lxq2Eu8R98+9TwrDSBv2NU/fZm/eNn6YbELUOp9xn6bO+OqxR9KMR0
         VrFBRYWfHNwUrCcgqMiKzMK9wS7NzQe1R9EpVwKuCBYeyY5ZLfexA3TneDlj0LeIQZdU
         /1WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KuBLhZ53;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 41-v6si4314973qvc.142.2018.08.23.21.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 21:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KuBLhZ53;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft3sV-0002TZ-DU
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 00:39:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3sB-0002Pn-R9
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:39:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3s9-00021Y-QC
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:38:59 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ft3s7-0001zO-Ny
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:38:55 -0400
Received: by mail-pl1-x641.google.com with SMTP id p4-v6so547263pll.8
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 21:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Q2xSLEejFR7GYJcibJFwgd3ae1JOt3HBmdreG/ZgHVE=;
	b=KuBLhZ53qr1mgnwEGV50pW55d5xd84ed3Y4wX2DEKudsSufcailYxshthavxxMQEuT
	EbUI1BMqK5jAfAw47TCYZR12PRUPVJ+PgCzud0eUTDHjpK6DTzUCYvOAD7n78GNGSwcZ
	qzc1Gf0CNQdzVDbOJczUo9t9DPHGIh1cbcxCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Q2xSLEejFR7GYJcibJFwgd3ae1JOt3HBmdreG/ZgHVE=;
	b=FcZCIfk8fwvjBGQSUXVGTjmu5TJ7tXlNZ+twfkJCYzmIycBB4Dy12x02NgBer1kOf2
	hntPOTOQOSDOOpL2pWCg2MnGHzrhGMbQy2lpQ9GeAL+A/ziuXGOZtaxjE1PpTK8e1/Rr
	9GVwQy+pqoXfnfSxV6QguIAnyK//Kz180mEW4O4jABDrWll5UWlSr3ARO7iXrOigTOuV
	a3wbYj+YVJC7cYFbV59OYlbv3Tb2Yuz/pswwYs7RPmjtIxCW0nkPJFjNA7qRUlebWSJT
	9HRR+Z5dJ43YFpEyKFxE5NGACK/Tn+4U3A720BHDGoE8GOiy812gz+7E+Lgc8Q/a4gSp
	uBJw==
X-Gm-Message-State: APzg51ABGCw9YFdoMKIbapvrS+TKyN6T4vQy23TderHLFrfkTkTigGi6
	ieyZ05YX3mCANNnVEaMf43+xCw==
X-Received: by 2002:a17:902:d213:: with SMTP id
	t19-v6mr29139ply.63.1535085533960; 
	Thu, 23 Aug 2018 21:38:53 -0700 (PDT)
Received: from cloudburst.twiddle.net
	(50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
	by smtp.gmail.com with ESMTPSA id
	70-v6sm9599458pfz.27.2018.08.23.21.38.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 21:38:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814144436.679-1-peter.maydell@linaro.org>
	<20180814144436.679-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <325d781d-784c-7dfc-efd7-38ef0f9b8f17@linaro.org>
Date: Thu, 23 Aug 2018 21:38:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180814144436.679-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/8] hw/display/bcm2835_fb:
 Reset resolution, etc correctly
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
X-TUID: qaVmlULUeuKA

On 08/14/2018 07:44 AM, Peter Maydell wrote:
> The bcm2835_fb's initial resolution and other parameters are set
> via QOM properties. We should reset to those initial values on
> device reset, which means we need to save the QOM property
> values somewhere that they are not overwritten by guest
> changes to the framebuffer configuration.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/display/bcm2835_fb.h |  1 +
>  hw/display/bcm2835_fb.c         | 27 +++++++++++++++------------
>  2 files changed, 16 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

