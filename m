Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp892739wrt;
        Fri, 25 Jan 2019 16:29:49 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5hLkP+FDLfnl9nICHzr42MlZio7jfSM4xKZcb7E64OVsYuswrWygLkUNN90TG1NAdSLXUn
X-Received: by 2002:a1c:1688:: with SMTP id 130mr8255823wmw.86.1548462589150;
        Fri, 25 Jan 2019 16:29:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548462589; cv=none;
        d=google.com; s=arc-20160816;
        b=z3qR1qUdjSIC2wlZ/0CXHuVWIJheDQLx2E3cRFgNDoq1soT9QxCf2hd5s2zkgHoUvm
         214dPuCEnHDN5rAIdApSaMOjmEXHPPBp3soiJmyKXjhgDFKNUkv5tgQvemZQ05EhUtQ5
         DjUxp1f39H/fI4V5Wl+lnloxbnEaOAJU7QPCVFWFCyBeGfzLInHKB10r0S/T/W/OSYzN
         cGb9gvHW3NOeyOkacmYwrkB67KeMzv9lcMcG6umDHjNugrjCLPA7M/WubTQzOuMoMf14
         v4thkrJoiSZcDrYmCeYXshVxqOmpzWsUeIH/DV8Jf0rhi/xPNhRdBfkII9iwOQWg9eCn
         aeXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=rfJtn8uU1Llvmb4DeOPrI3V7RkbaEQk+W2M53g7o1S8=;
        b=PQNeg0/Qn/gynA821Yx0c/qeaX8mWGod0+Rv5yNINobOL74O4d6hcBXtH88CiKs3i8
         l+AVUhmX46e+oCnPQrs7D463cjFkrdgt8Xh6JWTnkaSssi3yitc0ctpcdhHJsmo/hnTC
         mvTLMW2Ltf8VPeDP+wbqe1vXY6ZZTQaVW0Go3o7Kl+rFFUkdz3PEw49kzdwa1e5prRkP
         MSj5SFv8CJuhyI9yg8gtD2yy7gmy6L1pNiExOhrRBz2BBjWYy6FFXRvNcmt3kwFxDhSL
         YxexSnvBXGz81E9RQv06SZPudaHCFf87dJFYFYJc7SmpZWdzr9GqaoI2EcZavPvx/SbS
         2nEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DftVUaK1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si46270775wmd.9.2019.01.25.16.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 16:29:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DftVUaK1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBr1-0003yn-Hc
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 19:29:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBqs-0003ye-Qd
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:29:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBqs-0005RB-2E
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:29:38 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41491)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBqr-0005K9-QK
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:29:37 -0500
Received: by mail-pl1-x629.google.com with SMTP id u6so5281249plm.8
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 16:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rfJtn8uU1Llvmb4DeOPrI3V7RkbaEQk+W2M53g7o1S8=;
	b=DftVUaK1tBcykUsPcYBEnPLE4gy4xjCaN1/brx2XmHa7jWcTF9fQSQDZE/8lE4VYaj
	jcAFOaqJ/ZhIybUok4CWyxvBnR0O+0hnnkjC57VCYfV21bcWNwZ+NdcoO5XuZmKCh/7l
	5qASRbOAnA0jJIe4ymAbdSu/ohn6IKxi1Zjm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rfJtn8uU1Llvmb4DeOPrI3V7RkbaEQk+W2M53g7o1S8=;
	b=UDpmDZIGA6ZpsPyOjMr9g5JfKKO54wS602Wwn6/F/SGXxBkJ/nKqNhhaPDbX2fQZRz
	8zgDwb2T6HxucBWtcHN2d5pwdR/9wUPwxh2yHwexjm40A4T0pUO+clVw0o9e76W8Uv15
	8jhG7trtbfwOAx/lew4XSpKEKK1qEAZLiX6P89Zj3mLXbHYmDRg3oVcYzSPVy7aTJw4j
	fX/+AOHmwCQb0JkLlStpIrjT7XlMvfhqjzp93QX5l07CnoWp2VJyCcu51nrfPUHVIqav
	5QQFx6VCpodnr8DWXALU+8zVTFxpr9yWvophZ9GCeQ1KkB4CjXZfg3+GMA4wAJIt1+Om
	3Ixw==
X-Gm-Message-State: AJcUukcSVqL/G2aEzMEjzzSE++4Vgni4b64Cwtmt1+nTd8ievLFKiVwv
	nr4BbiolxO24Eo9yQrueFMF/zw==
X-Received: by 2002:a17:902:6b46:: with SMTP id
	g6mr13134405plt.21.1548462561280; 
	Fri, 25 Jan 2019 16:29:21 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	w23sm58770269pgc.72.2019.01.25.16.29.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 16:29:20 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5048ae3e-bf82-ea78-afef-d1118afa6e31@linaro.org>
Date: Fri, 25 Jan 2019 16:29:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::629
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 13/23] hw/arm/armsse: Put each
 CPU in its own cluster object
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
X-TUID: qyZEN3kYRxna

On 1/21/19 10:51 AM, Peter Maydell wrote:
> Create a cluster object to hold each CPU in the SSE. They are
> logically distinct and may be configured differently (for instance
> one may not have an FPU where the other does).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  2 ++
>  hw/arm/armsse.c         | 31 ++++++++++++++++++++++++++++---
>  2 files changed, 30 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
