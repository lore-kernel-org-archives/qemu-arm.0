Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1424459wrd;
        Thu, 23 Aug 2018 10:33:09 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYXz9jd1ZPDBVpd3I1SB4ca4oTaXWiWWIPr1wNGya8zFujH1bj9szu9bsYlE3dak/E6iDE0
X-Received: by 2002:a0c:e64a:: with SMTP id c10-v6mr13594272qvn.199.1535045589532;
        Thu, 23 Aug 2018 10:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535045589; cv=none;
        d=google.com; s=arc-20160816;
        b=YOL3zqac/uUA8OHPf8juEpKOfzWTbH9pYzzs5BPrUHocFU5JQMw8LVybtNJ9UZiYuh
         yGVOm2NYO8BW4nXEkEJj9QjyvcGIj9ZLicGh1YhaVB6m/z6qvBC+0WfyvX1nVHKQq2uq
         vD77aR7GtfrEz+UNAm8JZ9/WB9/veTUktcRide5eMkCZCkeOU1rahOHn/0Me+0/pVfJE
         J7h/pIp4DBh37ssH4zFt2YFbeFetp4v02oPPnlKytMozuT8Ao2NudwheaX4NV/SBFmC0
         LnoJqro5olHvhWA4POCOAjew0ustTIlqo4YnvR9uc1WPhrG/L5xTE7cc0V4HPJTIyTa0
         TAhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Yqfonvg4h44R1Kni0p9+qnQRxi3Xb2oRBt1LtuCR4ts=;
        b=I9eC21C7c24kt9QOhEZqnKZZ4s55XmR+8rZ8thItU+xW+Bjrfb7eXD/uLiSp9h7L4n
         b+sz2Vk+mQhEQQ2pTDDYR8Y+/zs46ODwrrNWtwWEclLo6F9JzUsAaM83fC844WUXjNbu
         c6QCbRrB5iazXZ6oFc0mGKDCg2cLZUbkb1YXLk8W0hbAWx9YoIRnuqQfjmBMLiw7NyOI
         hxtnYlye28z8EjbRiWJTmnHPpCrO850/aT4LdA5S/ZF7euY/dVkczDHzw5SuLxWJj2Io
         +x4NCo5vBq2ZJe7vX31BoqWAXQN36ctlJukaPcYJQPCh7x2CGZOc79KGmXeOx5w2tpYp
         c2Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jD3Iw6Y7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i18-v6si1602792qvp.14.2018.08.23.10.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:33:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jD3Iw6Y7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstTp-0007dr-1F
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:33:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstP1-0001Q6-Lv
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:28:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstOw-00019R-FO
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:28:10 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:32939)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstOt-00016J-TX
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:28:04 -0400
Received: by mail-pg1-x544.google.com with SMTP id t14-v6so2966183pgf.0
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 10:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Yqfonvg4h44R1Kni0p9+qnQRxi3Xb2oRBt1LtuCR4ts=;
	b=jD3Iw6Y7t11elWqVKBkzS/Rba5HjzAzqd8j0PwR+ZNa4Tu9scmO6AHpGYb/OIZM9Mq
	UYZBq0GtHdpdO4bkjCNhAbIfqaw3/BvwqjA0s7lrm+Tn/CvRM8qqcoxyu80ctTGYmBuJ
	3Nts6NDZGmsKXQs3N0tgy3Fe3j1Y4+9tkj06o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Yqfonvg4h44R1Kni0p9+qnQRxi3Xb2oRBt1LtuCR4ts=;
	b=dwvI2fvxDAqK4DIpWGy8xhTI6WkfWVgZcVhcLYl77U0vDQmJXVvm4LB0vRo775ozqM
	JYfclkOykP+wKIKsDJZr7OElCpSiK4gW/R0XOzevzRiRovNiH+QNnVYMJK772Z4miroi
	e6dMi680ZT/yy4wR3+rTEdrVHlhmxww32MmpZruVrAKQWvF7N1Ae2B+arSW4b366L00a
	WloYo6ck7M53eBG11pNFj2vOu1x8YAxHPoF6GFLs+14ZCEAejxw1vNU0cP7RxJqf8gMh
	uWroQP14wRM55jBSyHaeN/eIah3+sIKtx8OiKN7nkCsSzjQtnns+9H5Q7EDjXHYB45AK
	IgDQ==
X-Gm-Message-State: AOUpUlEJL69+MuNxCqT2+q3/LJ9VUzFRGkf6R04c0Q+28RHFPAb24Yzw
	G9JcUqOPyS8+S0VUnJAwWlMeBw==
X-Received: by 2002:a17:902:7587:: with SMTP id
	j7-v6mr59382288pll.256.1535045282431; 
	Thu, 23 Aug 2018 10:28:02 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	j184-v6sm6851706pge.77.2018.08.23.10.27.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:28:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <07b40f59-894b-a38f-89c0-81f44d23d26b@linaro.org>
Date: Thu, 23 Aug 2018 10:27:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 14/22] hw/arm/mps2-tz: Create
 PL081s and MSCs
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
X-TUID: xjuRh9S3OZfB

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> The AN505 FPGA image includes four PL081 DMA controllers, each
> of which is gated by a Master Security Controller that allows
> the guest to prevent a non-secure DMA controller from accessing
> memory that is used by secure guest code. Create and wire
> up these devices.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2 changes:
>  - use 'sizeof(*msc)', 'sizeof(*dma)' as suggested
>    by Phillipe in code review
>  - s/init_sysbus_child/sysbus_init_child_obj/, required by
>    rebase on current master
> ---
>  hw/arm/mps2-tz.c | 100 +++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 93 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

