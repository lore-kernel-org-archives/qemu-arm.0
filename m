Received: by 10.28.71.27 with SMTP id u27csp1370189wma;
        Fri, 9 Feb 2018 12:37:30 -0800 (PST)
X-Google-Smtp-Source: AH8x227JUrwbRVlFOXLx/ui7go/74Ff0tggcvBULhVYBLsf662Tg5YU+kd9ZIIKG8HdpcinrZ2Pi
X-Received: by 10.37.122.3 with SMTP id v3mr2810668ybc.76.1518208650523;
        Fri, 09 Feb 2018 12:37:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518208650; cv=none;
        d=google.com; s=arc-20160816;
        b=BF0Nwvj3nxXT33IsOZf4bbKggYg5KN+BRoYyBgIWhVA1gjToDgp6Gs8KyulDPvn4AW
         Lm+V0GTjt/iZxrZd8arl47ka+uOpzHl7px7QlBZ0iRQMrLc5PvBMLp72Ea0xM4HxskmH
         RgYBKrYXAiKIqsK8ujqP0wQEPoOMqtERfRYa4E/kA25a9angph7KXHvNC5UMKFjzfWfy
         07USLpxcidqNlOO6lKzb4LNh8MELcT6ggOhCpSlRCNSoqgbGL/wd1xOsc6FZd6jRNs1U
         Xufp37MGe9m2vYSuSzDFmZSqDKU8MHtBq3dcLhtLzHwvRPUMOB/5JWiLhUrj3DvwH1x5
         bFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=vn+HhQj8xvCJ3NLACR9dVeQFbRSb28EVKSJT0TftKSA=;
        b=iWdZl9a+7Z9TaPwr6ee/gG0/4hPHMq4HSJaZf/xcLt+BwJvfzEh4G83WT2TL58iE5y
         Vk1HBIgX3ss9xnRsBij67+fOl0Tjz1k/traNEowHTuvJUI++Sy+FkJydzdVATuO/+eLO
         pRf1WEz6UmuQVf4gPiK6B/P19xtC3bKhRaF0OWyiC8i1CWKKu2Ol2JRC8RbmaV8qBKqS
         RXwUooylum18BKY67DPFVTRufx9GWuQMTDvsPi1MqyOBnB5IEM5yEegV53MdvV0w5dEE
         EGbHJxoKG+f/ahjne80REXmky65XKCEAze2Z+7Vs0mQVuGH7mlLJAG878FXXUUoHK5lF
         GPJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hmWICTew;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t35si545043ybd.616.2018.02.09.12.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 12:37:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hmWICTew;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekFQI-0000lo-0A
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 15:37:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFQ6-0000j0-Se
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:37:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFQ1-0006gW-U4
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:37:18 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:38372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekFQ1-0006fy-OG
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:37:13 -0500
Received: by mail-pl0-x242.google.com with SMTP id 13so1982485plb.5
	for <qemu-arm@nongnu.org>; Fri, 09 Feb 2018 12:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vn+HhQj8xvCJ3NLACR9dVeQFbRSb28EVKSJT0TftKSA=;
	b=hmWICTewe9AAxfIsip+4P/2pM+wUJp3GXHla3qoWjaP+zKMcbRHyJ4Qtup97eQQWka
	ytylDyz5Xu8M5+bfxPhD3gfUVRfXPf54PRRrtnEQHdCM6QSDoG7NNOws01nhLKMRwd1V
	yC5AYiiB6btDtNtlGNccBbVKtO+hT/W+/7Ni8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vn+HhQj8xvCJ3NLACR9dVeQFbRSb28EVKSJT0TftKSA=;
	b=i+d1tjWldPxJjAg6I/bKMI3Q6ePaDueiDvIumzbDA6c5K3DYrCeUf4EcfizvnoxyO6
	F+apUzJa96yXMtL8bHu8EfJ6AW72pd0vvz/nvNPulzxtYyeTK2Nf9Ypdsbzx/dsaHpfN
	gfPQq4v0bRjNHbHeaiaEL0O5xJoHzLcL1DbiDC8GHE9bRKUt6kkqhHt/gqmRnzdndfN/
	nB+/MX7s0shLTppjsZ2LU8hwz8XIXYFL2mQnYqNME6dITHo6ly+Irn2kE1Xrq2XkT+jo
	snv1C1dVHEg2FzH3oM2Qq/RxNQBl0j3UoEodxYQ6FiKeitDVB7fPjOkzICR7pcJYGhVp
	SbXQ==
X-Gm-Message-State: APf1xPBuDqMYVpqT6ZAZhZUmQQ5aWQp09cZ5YHNz9w5gXGGzSnko8jCK
	EYEcxEf8GzPfGCk71GQUF+qIaw==
X-Received: by 2002:a17:902:7841:: with SMTP id
	e1-v6mr3659788pln.130.1518208632800; 
	Fri, 09 Feb 2018 12:37:12 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	i196sm17230444pgc.37.2018.02.09.12.37.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 12:37:12 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180209165810.6668-1-peter.maydell@linaro.org>
	<20180209165810.6668-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f40e2494-0216-6452-f7ed-b7e4cacc8960@linaro.org>
Date: Fri, 9 Feb 2018 12:37:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180209165810.6668-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 04/11] hw/intc/armv7m_nvic:
 Implement v8M CPPWR register
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
X-TUID: 3md8CVPhk6qT

On 02/09/2018 08:58 AM, Peter Maydell wrote:
> The Coprocessor Power Control Register (CPPWR) is new in v8M.
> It allows software to control whether coprocessors are allowed
> to power down and lose their state. QEMU doesn't have any
> notion of power control, so we choose the IMPDEF option of
> making the whole register RAZ/WI (indicating that no coprocessors
> can ever power down and lose state).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

