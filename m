Received: by 10.223.188.70 with SMTP id a6csp6133925wrh;
        Tue, 29 Aug 2017 08:39:03 -0700 (PDT)
X-Received: by 10.55.74.77 with SMTP id x74mr5944077qka.205.1504021143494;
        Tue, 29 Aug 2017 08:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504021143; cv=none;
        d=google.com; s=arc-20160816;
        b=OczOYOG+TG6Clot7MfpLsugtQnWUU0by2FjXEiLaNrmYqSu/CAlB43IsFGJzEIX3rO
         fiIlzAGpi0OTtbLAbiLkkUX6GXsZzcpOes972uGTMNaXM/54Mlel/PmFQO61RJiyk2Iz
         pVjAC6VsGHuBlysVdBHxIgxWFMZwvS5ukauRYd2gqDjkpAfH8Km5ed5hPwNU/W6Rj8LG
         4Z+dLh72xunLHoU/HIne2AJhVknJTRHKz7TUwIuaCfz4RAkwoPqOZrxJp77cuRJ5KRW7
         SAqSNJJuCkWbBezoomvGup1MePoGZNZZ2XvZReZIvmwbfe/heKhdQjeDzZVh2CFUmOCY
         S8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=siwc8mTYIiXQFvEUUF7VBAlVc62d8N3iC3uvmIZArus=;
        b=ilMAQujsquGxvsTdsyXIceGhst7BnoRp5sogeUt6OqhPCiXWjyHDQQWWCJbWmtONOH
         bCBnxHL4N+Iv6jwSktK8MhkWa5e6f044YpdcpCbIfp3GA5a+YLvOpOq9RFB5aWptfFGE
         RoF1spJB6g5spTkYWEdeuGfLMLhYgSO7Jn6y82+F7iwi78g9iAW13GOjT6o72AgF0mOW
         D4eovMkblqwAiZtKZfn+BWc3bWDTyPDT1XLfuMgq0nJ/fcahYcUGC6Ako09UNQIB6Xaz
         +hrBNXmjPNoTMNscRNsBAdr7XVE3QNELqpoArgHZTuLmNijzDHcJrFuVElIVnZthWG9V
         eV/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BfHntFYH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m68si3113535qkb.529.2017.08.29.08.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 08:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BfHntFYH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmibV-0008T5-2j
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 11:39:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiaJ-0007hL-At
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:37:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiaE-00079e-ED
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:37:47 -0400
Received: from mail-pg0-x235.google.com ([2607:f8b0:400e:c05::235]:35172)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmiaE-00079F-7z
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:37:42 -0400
Received: by mail-pg0-x235.google.com with SMTP id 63so11814161pgc.2
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 08:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=siwc8mTYIiXQFvEUUF7VBAlVc62d8N3iC3uvmIZArus=;
	b=BfHntFYHhMJzFa6jSAXrbKmGy5zZN8K+I40JEB5BsJatHTL1G5yAKQDysVeIBGjCuB
	B5VSmBa7YT6pnSmPBx/k3ISmEfkytuXnr3npv2V9NCqDOKRAZSRtKnYsvFV/mQCB1huI
	DT0Ro9MhtGqPkEw/CPIkX7e4diDSKO4dTYJrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=siwc8mTYIiXQFvEUUF7VBAlVc62d8N3iC3uvmIZArus=;
	b=mjCETUAUTOD+kbXxwqa2KqUHt29j+8kud5fuMRFR8Lr/4BllEADV03RW84XGfJYerB
	PbthoJyAuc/b01X9WxikNeWA1h36imP79e1Mbd2V96e5w0zqclLRavM1X6KdLb8CfzZn
	waGrz3z2iBpXeY85JfJGKVDFeFiOQaFIZLG4sXi7B7B4f1UsMOXzGbrs0OO7cPw9gbiE
	Il6aadC47+YPlYOXpwc3seGot9gtz2cb6l6dBbW3bmzLHN2vGbSJisTRGAwp3B51I48R
	xyzcAAsVsDnOGimqLLi2T1IySLYKLthtQLRNDcaORmtoSPAhrcooPzvLz7SdFDfz2wah
	Sq7Q==
X-Gm-Message-State: AHYfb5jSKCXabQ26mhoK64gqQFDHHzkK4I48pt5k0aZQfYBXa+TQKUVx
	w2TVixI6eJPEs8IV
X-Received: by 10.84.217.74 with SMTP id e10mr934283plj.119.1504021061328;
	Tue, 29 Aug 2017 08:37:41 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	s77sm4898683pfa.163.2017.08.29.08.37.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 08:37:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-7-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a488f464-200c-8bfa-79e0-8c4e3547309f@linaro.org>
Date: Tue, 29 Aug 2017 08:37:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/20] target/arm: Make BASEPRI
 register banked for v8M
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
X-TUID: /YtvhDKGskAC

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Make the BASEPRI register banked if v8M security extensions are enabled.
> 
> Note that we do not yet implement the functionality of the new
> AIRCR.PRIS bit (which allows the effect of the NS copy of BASEPRI to
> be restricted).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 14 +++++++++++++-
>  hw/intc/armv7m_nvic.c |  4 ++--
>  target/arm/helper.c   | 10 ++++++----
>  target/arm/machine.c  |  3 ++-
>  4 files changed, 23 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

