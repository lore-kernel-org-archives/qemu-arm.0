Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3948750wrx;
        Tue, 23 Apr 2019 14:47:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwiCXh+Gm7XcoooZNNj/jA8J6eB7hX8k7bahnz6esTrCtVQmu44nGbNsOHx8gK4WqxKQrgO
X-Received: by 2002:adf:f802:: with SMTP id s2mr18747716wrp.274.1556056030189;
        Tue, 23 Apr 2019 14:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556056030; cv=none;
        d=google.com; s=arc-20160816;
        b=wGC2aGM/G+sZs/gOA0Pgh82/cot1+dY8PM65sg1gQXOYURK63vYHimQ7JCsh9BadeC
         AfIAe/xxxHzbzAJcC9gomLVk+QjlOQMu82VN3/la3g0ZHQcJpcdZh18dfCImwHwtexp2
         f6m6SSANvX1SaP4k5UJWmeYJnJM1pjTI+VhC8DCkUt5bUwEzt6cFuj0jB/HiwVAhn3P1
         YxRdLpKPaunCWyFg9YidycyyCW5pdmuOxRyZ5Ji1fhulNhcCcOPMVOoSGjS3vJRh27fh
         D4CyqixfCQJKgAaOvIsYCSSJb5/0AlEoajmzG7y231R02k7VHhXVxrjVsxdcr/asQkj5
         5m8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=FDLMRKRPzp/pSJ3ZDS5uhKHxLRwPh/L4VqETRioA01M=;
        b=CtiSzyYPvtIe0qrZOgPA/fjcEpY23Y9lcH0mitMWyRjrLZ3jkcdlAhLqTG9rvv2xht
         PMaDUMXbjEBIqWkT0f1zVxfTUqnNB4rZBMfmGUWWzsbp/oYv7llAP2eTPIb4rxn/LRHp
         27JpxWyojCS2cAkAnDhcOTWAAs5k/jKSaOzGyYh0o8tI4Dig31r0wbffFZCfm8ChT0Zc
         qCr1f47eRRwxiN2OA+v8wM0C+64tWCw4qywpET3LPHW2i9CK9i+mwkn/uCkqmNLntwKp
         CuWZaln5urnA+DvOcx2mZ0Wjz1ChQTyRt48A1gtcvuUJUWYgddJS2V3ODF0GxSmBIBjw
         QehA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TITAyOnS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si114705wme.18.2019.04.23.14.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 14:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TITAyOnS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ3Ft-0005lT-A5
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 17:47:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ3Ff-0005lI-HW
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 17:46:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ3Fe-0000N0-FF
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 17:46:55 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37763)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ3Fe-0000Ks-6M
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 17:46:54 -0400
Received: by mail-pf1-x430.google.com with SMTP id 8so8158212pfr.4
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 14:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FDLMRKRPzp/pSJ3ZDS5uhKHxLRwPh/L4VqETRioA01M=;
	b=TITAyOnSodgtXIyRXeAJtd+5CmZsPqpAa8s96hR2fRmOJItS73ex2p04Zyl91B3htH
	3sKURhJOS3xLLR02szW+wXC5OHFuIdOMHRspMAgNhAHSSrSpa88eszMygnX2+KScmS9u
	kj59cNcbM+XDUewNeVWW3a+7uNit1QK53/t0RF42hVOTZvLB4eJsHeCNHqYlQBT1ZCEb
	rGPIoVTySFy6SvWX0lI4KgicR0b/Z5zdpyWcn05K+mqoocsFOjs7BMNxRqnJc7UOF66y
	XKK+55/qDcjYtocpo56Ost82f7cAd2X2KP35i3uYABXwph4KGoguHT/cNGDFPdnRxi9+
	34wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FDLMRKRPzp/pSJ3ZDS5uhKHxLRwPh/L4VqETRioA01M=;
	b=W3rDStv5eYkQjP1Ku2Op9MQA+zu7hrg9Pm/F7kMsoqYvNxZEJz70tZn96KPMy7IefH
	ifTmE0V1753BXynKTixtmnrCkg4enmhWw7XfA7Q4jA91f/oPnr40jFOyujvIpMI0mDCX
	UN+gxd1s/ZQD90ewdcFBml0b++aJnO7KhBHpuru9C9Hd7BWIXRFTRG6m998qzOuMxYRa
	RU79D6gnDI0+1jiu1LCvQLP5n8z/bU7BwIDNt0RfHCCaUhVf+6AbI/c+aomIeJr/j9aK
	4dSKi04hEcAlFoycWgO56nCWoKTNP5p4fC573crUulmc4tqNFvbIiefoByFB/do7eKzR
	37gQ==
X-Gm-Message-State: APjAAAUN6yY9OE867A+FsELzZY5KOT7KB4wu9wgcgRjSPTYcDjM/gjA8
	/c94KhCipG7LBTYz8kiGQMavaQ==
X-Received: by 2002:a63:f24f:: with SMTP id d15mr27177287pgk.410.1556056013194;
	Tue, 23 Apr 2019 14:46:53 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	n11sm2276008pgm.50.2019.04.23.14.46.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 14:46:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <11425be6-f1ec-e707-9a81-eb0ed9362551@linaro.org>
Date: Tue, 23 Apr 2019 14:46:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::430
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 09/26] target/arm/helper: don't
 return early for STKOF faults during stacking
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
X-TUID: smRtAa++YRIn

On 4/16/19 5:57 AM, Peter Maydell wrote:
> Currently the code in v7m_push_stack() which detects a violation
> of the v8M stack limit simply returns early if it does so. This
> is OK for the current integer-only code, but won't work for the
> floating point handling we're about to add. We need to continue
> executing the rest of the function so that we check for other
> exceptions like not having permission to use the FPU and so
> that we correctly set the FPCCR state if we are doing lazy
> stacking. Refactor to avoid the early return.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

