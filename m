Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4828173wrx;
        Wed, 20 Feb 2019 10:03:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY8Uj8czX6Y9O59WC967rki9YNTsdcQ8OA85OeKTcNaedOCekwqLfrwnuyfgTpPXfILdrQM
X-Received: by 2002:a25:d1d0:: with SMTP id i199mr27139929ybg.275.1550685831411;
        Wed, 20 Feb 2019 10:03:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550685831; cv=none;
        d=google.com; s=arc-20160816;
        b=Iui3dYS8hs0bg4uSB9AyFhxnBhNsKBtk4QFe1+7bX+jxxfQ3ZyUxdE7Q8S+vaN8KEZ
         gcMIbPp1IOmKwbxymg5plPkDldP1BRSbYZV0Yw7/HnWMqrBUhtx8EDnld4aIjfnf/p3b
         rJNlu3o+J//bR2UHIyV8+dmZiVceMfIDv5HQWaa/2xTVHWNgvC/tHaDenMUYeQ2xMgfW
         ErVJDeYjtuiJFpLj5v2kXTCRDlC5KGeqFfFB+DUszWL4qlhgwR2pEQVLzMqSd8aONZRt
         SHOzFeLp/8o73hJTHN64a3QzW0OIpt5nW0rtMW4HXlPj/e7oaZ0fKGX1VVIV4fQ5JWMO
         WR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=mKQiwXSWy8nUk2+Th/YdbdQIfH+WEHnmFUBMk6xygYE=;
        b=XT7zNWGp0vJ+Xl0ZdZ+rNOXaHV+qHYaCYENAo8bgZEb1g56CPPE4whIKzFlqRM7M8K
         w+O94TcsgYCNxprUpJsEtFz/tzqApcmoIyS1EqTiDj0RodHCs6S873hACkpgDuIr5sqU
         WDBa8Y70VlkVbVkxbKDG15rFFD/M8H5HWTf+Nv8NoVr/AnD9GAClf6mrxnUGPY8tJH8D
         XZ345tg7/rSxeINUEo7PeViajQ1/c8+mSmcwMn0R9hxL79+6VO+dZfeq5j/JQSf8805Y
         PXNCyKGr4CXK+FN9NwUX/9nhQPGA8jS7GRzaAJhMnJtIgRlOzUSNm9SGAjUV65ZXSY3i
         TyhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZGDN81Jj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a62si10215543ywa.134.2019.02.20.10.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 10:03:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZGDN81Jj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwWDm-0000bE-QO
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 13:03:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWB2-0007o8-Ph
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 13:01:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWAz-0004FI-E9
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 13:00:59 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gwWAv-0004CR-2H
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 13:00:53 -0500
Received: by mail-pl1-x641.google.com with SMTP id q3so5224360pll.4
	for <qemu-devel@nongnu.org>; Wed, 20 Feb 2019 10:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mKQiwXSWy8nUk2+Th/YdbdQIfH+WEHnmFUBMk6xygYE=;
	b=ZGDN81JjXTvG08riyIcHQYeHyku73/jY8kX8rH6VE8a3CpaT3v5ILBJR3b/scHnHEy
	JlBGaIqT79RKQNhsaa1DYPDf5E1utuc9yJ74Pg09oVZmevifwrHvBL87oe4Zu/MfCFR9
	28j80+dJ49mAGGloP4bTUHvRxFlC0f5vAQPxJwGMWSvLyBXhudHucoKz85LJniJPuOb4
	cJV53pSTrIkARqrdxFphX/FojXfl0AnV+p10wQSeE5Qqv7Mwlr23DzEYPS80cbkP/Kwb
	Md2h3U/yhGEdaSs3n43gz497zGM/W4XKr7n4h8btKm1sPJryVfrDZMz17FsBwGqJ+xrb
	T4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mKQiwXSWy8nUk2+Th/YdbdQIfH+WEHnmFUBMk6xygYE=;
	b=Nn6iNagSW/Kw8c+e3+ivda6cPeba0Naj2YUQenuIB2wdfbrtXsfvn447OKmtDndTi2
	AiMjIhjoDk7SlGC8EdP6kVrrsWrY07H025puOM+GgBoRHKst6s07FMY4cWhL7ZEQwY9e
	2HNHjtsokIanSDVrPqF3ZrYYvc/LLzcCZfdTKYLo3DFWVAKi77OLD1TrkpIv1hA/lIbj
	ncCdsj8QdNrI8CVEAEiZCfqwta/U+RPNSuaniGDuFKad74NgLLtq1XdPprDVwCYJrNxV
	nff+6rs8FYmSZoLio0FTJQimfBWXVXK28W49hCSw5uH+sCFORe0StJUUmtKZ10d8IXpW
	aTfw==
X-Gm-Message-State: AHQUAuaE8nl41HCCSlBAi9SBXIQGlagYnzFrlbIifMDqm5A1osE19bmW
	1S3Kupa5MLHve+4y/NCgCJhLvOMTYLM=
X-Received: by 2002:a17:902:f096:: with SMTP id
	go22mr685286plb.172.1550685649575; 
	Wed, 20 Feb 2019 10:00:49 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	l81sm48551084pfg.100.2019.02.20.10.00.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 10:00:48 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190219125808.25174-1-peter.maydell@linaro.org>
	<20190219125808.25174-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8615f5d6-6080-e560-91c3-8afa2a5606ce@linaro.org>
Date: Wed, 20 Feb 2019 10:00:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190219125808.25174-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-devel] [PATCH 1/8] hw/misc/armsse-mhu.c: Model the
 SSE-200 Message Handling Unit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gephzfQ0DljE

On 2/19/19 4:58 AM, Peter Maydell wrote:
> Implement a model of the Message Handling Unit (MHU) found in
> the Arm SSE-200. This is a simple device which just contains
> some registers which allow the two cores of the SSE-200
> to raise interrupts on each other.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/Makefile.objs           |   1 +
>  include/hw/misc/armsse-mhu.h    |  44 +++++++
>  hw/misc/armsse-mhu.c            | 198 ++++++++++++++++++++++++++++++++
>  MAINTAINERS                     |   2 +
>  default-configs/arm-softmmu.mak |   1 +
>  hw/misc/trace-events            |   4 +
>  6 files changed, 250 insertions(+)
>  create mode 100644 include/hw/misc/armsse-mhu.h
>  create mode 100644 hw/misc/armsse-mhu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
