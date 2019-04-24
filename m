Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp62308wrx;
        Tue, 23 Apr 2019 19:17:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuHNLDhwi6JMZvY479fSU3DjYqXk5qwk+K8dsaFgmxra8IVmoo+HhZCjjrNtpTjliBNhyw
X-Received: by 2002:a7b:c213:: with SMTP id x19mr1735890wmi.116.1556072256779;
        Tue, 23 Apr 2019 19:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556072256; cv=none;
        d=google.com; s=arc-20160816;
        b=wj+l1XLDa+4xzgJDUlWxj5LH+MQ7FP0g2LEa7V2jisGWb98ri2SkwQ8h1VmSy4PJ0A
         WJmUy3xi5HH9a2gdq/r+7Qd06FYfJX59B2MS5WuO5r94m708rjDZH5WYuStACoJqdsru
         spn6A/nuYjC2IosTuLu78npmQawH/aHd3WD6YxPmbFUBPgm0H6XD6VnGWFHTWiwZ1jIo
         txtd32lL3+jNAEy6Es1sw9f/Xffm/Zu9rTOh937NNTFG9i+iXpVMdlW0Y+IyhWd0GHLE
         ttG2VGiF8+hNbd06Mc9ixMaNBjlTTlqtG10Jdcis67d4B1xj7SB/jbS6qL28WRfQY4No
         vrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=MjRZP6PAH0DOOAZPj/Uiem5ZT7K5TgESGXX3wbk8UMM=;
        b=eUnbKP00tcQ3lZUuj0UkNxVwPxAjc3AOIcFVgpJrFBaR780ZjP11wRmEui+1V8zxrg
         +8PYi9i71+k5mI0UEYv4yF15o26Eeg0KBVeT05N2qVoToBmgacA1p9LpmsOlZb1b6u27
         MHI3w1UqxkePt7rVCdqWHvXJJ/5bQKiuO402wxBRGyyatGCP+W9miaq+MOboopl0vKEB
         M9IbzVPCgkypueR2B8Y/P7GsFHA2xStL9YGL8WE8RcVgg6NO8LCEMn0g2IoPGhTOnBbc
         JS7XWxXdy3KfsCIgUiAIYyxgnjZTQ3IfM0PTzrw/VZa6XlROlwmXhIywfAEDTSnb2ZbX
         jssA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="AF/pCFvG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si13155020wrj.264.2019.04.23.19.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 19:17:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="AF/pCFvG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ7Tb-0006km-Sf
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 22:17:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ7TK-0006iq-M7
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 22:17:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ7TD-000115-7L
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 22:17:18 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ7TC-0000zZ-Sj
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 22:17:11 -0400
Received: by mail-pf1-x436.google.com with SMTP id 9so8435558pfj.13
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 19:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MjRZP6PAH0DOOAZPj/Uiem5ZT7K5TgESGXX3wbk8UMM=;
	b=AF/pCFvG6XRq8/N08KbhpeYLIaqs/+kRyBKf0111/dWrPl3gsSz/xWyLboFfCM157H
	11qsZFj+T9+LAE08woLEgHOOjE8FsJZklbI2MtfqsPbmKeu3xu0MVbJGY+I9UgDwAYcq
	xJdpvRclwu/1DYOT+FMNyXggObEFsFUxgNQpJf6uwI/u72/CzI0LCz41znUk0FyOpkxk
	Vt+tty6QxSrlOm0eh1m3vjtnZFQ4Q1NqHEksopJYMcde45bE+irYr7Ty9k9uK62aPnn3
	XXVAfHOBFG34LQbPoOx3ySUnAOi01TrCbQiHexUJbi8jkByE+KKzHLy0gPfsBAfZD4sK
	4TPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MjRZP6PAH0DOOAZPj/Uiem5ZT7K5TgESGXX3wbk8UMM=;
	b=TvT43ICVTKmE4c5o4kO42hgkDWv2HAAShpuoUNwReqjDRltjkJZNKWUaYxEvzXPgic
	OcsQaAL+N7L+rpqLpfB8onbPgL76Mk330vliuMg7h4QOg6Mx5dmGUrCZ/8MIBMW+i6k4
	Tw2WK4CrN8iB5+xt9C5id5ZipdSxGg0czIZ11Kko3TmNPh05NkGr1NdnczO0CSeX/tKL
	VgV0z+hjCFZKqBBt37dWZUrMhTfl8A3S9OvWaadEhWH+oXioKUKby3YtmTNJzmm0VPyc
	cQGAKB3bdIrTDSUI5mAvJpRNBcw4Xx5taKWoF5IdaK/RRFQ8ANFfvPRluVT9l4OWlJgW
	Hq9Q==
X-Gm-Message-State: APjAAAXmPLQN8gg60KB1iXGp15Hbl+Mofj1n6FvrFacklMEM2WYuXWZv
	zPfCFIBrYIw3e9lxZTYU3tOu4w==
X-Received: by 2002:aa7:8518:: with SMTP id v24mr23345152pfn.219.1556072229453;
	Tue, 23 Apr 2019 19:17:09 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	u17sm22319753pfn.19.2019.04.23.19.17.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 19:17:08 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b16e2960-e35d-7dc2-2613-3d29a0d7f735@linaro.org>
Date: Tue, 23 Apr 2019 19:17:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::436
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 24/26] target/arm: Implement
 VLSTM for v7M CPUs with an FPU
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
X-TUID: 3a4/1N3l2r++

On 4/16/19 5:57 AM, Peter Maydell wrote:
> Implement the VLSTM instruction for v7M for the FPU present case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       |  2 +
>  target/arm/helper.h    |  2 +
>  target/arm/helper.c    | 84 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate.c | 15 +++++++-
>  4 files changed, 102 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

