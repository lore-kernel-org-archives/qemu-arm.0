Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1225272wrm;
        Wed, 9 Oct 2019 10:44:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5b28GAbUwCIiXYEEwz0XYTwhbc5hOAVQ8ttUyWX9dPYce5MkqC7OQ/EZ9q/R/chj5PPPG
X-Received: by 2002:ac8:705c:: with SMTP id y28mr5239401qtm.52.1570643094406;
        Wed, 09 Oct 2019 10:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570643094; cv=none;
        d=google.com; s=arc-20160816;
        b=Di/lXOp75aeWwQe1SDWHaR12EhYPs3ivWWPPja4/lCEqyiPeqPDabopggPuabA9RJu
         bAUMrhoArDmX35tXDtFd0Z5cDbgIzw5uXAfGJffm91QXegVnLoJ9tKaysN4JCa9FHVKW
         jUNvD7ThOzIbd7til0ugJ6+SGvvQaggKdTxiqLwikwf7xH83qZtSgSx5AX+zBng8Wa5F
         rvs91UgH70FeDEi5QPxWrwSUYGUaXLKDbpVZiiOGZiO/KWDlOUlpL7QGveIlaORLkZgu
         AuCnz1HojiwIH+BXz21WvHY4CB5uPnQCFDun4oshvPdePYcOY+2Ws214m6w1lgbalUaA
         ARQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=hTUKCIiic+Ut/Wo5FppKOMLXeKxhC4oaQ4z+c7aFIGk=;
        b=CJBLPBl0QwCzT/niLCRCUi3d5QQLvm7uzIMKxE2pvlgSQR3/xbGkqyixN/i4EbiouA
         K7JNr26H6V8a/BkrTBWPJLdgqjGql7nb1CyZNvlyXBaQwaK+1WFWQyyH9MIE1442WN6T
         huYeIR5Bu+fmDw9x2IzYcs4YkQdx7C6auQdiX+Gbgwdx9Tug1BucDyrGzRpQSpTcrNrZ
         o9F77THqKz0Hq+0fTe6vU7T3gMkY1X7AtDzDjtA3eUJ7gaotw5R3wB+NDJdhDfteB675
         fNe9H73AiDKtHdR49q6T5OgXaY3XcXzQsAeaUcfIICyCB35wu9jusmznQyViLxs7wDYi
         kP9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zGgvYl/h";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si2643813qvd.192.2019.10.09.10.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 10:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zGgvYl/h";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIG17-0001Ya-H5
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 13:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38359)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIAhs-0003DU-P7
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 08:04:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIAhr-0001IZ-Nd
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 08:04:40 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:39035)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIAhr-0001IQ-HH
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 08:04:39 -0400
Received: by mail-ua1-x941.google.com with SMTP id b14so678784uap.6
 for <qemu-devel@nongnu.org>; Wed, 09 Oct 2019 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hTUKCIiic+Ut/Wo5FppKOMLXeKxhC4oaQ4z+c7aFIGk=;
 b=zGgvYl/hYoLiNZfFIrjsY+vKXxU7FyIFBN4uIxlItak+WW3/8xoJBbrjpMxcyPRouG
 LsQ3W5mcoQ/Qh10vLjGt9CSHHP03WTzFfE/Rlg421ZYU+KLlvGjMYTOh/MbH/Vjf+3L/
 lFQqrN8vPo8yUWZ+hvQkCD4GMmp9FchlVlM2vO1XaXdb7ccHJCU8Z7W6FwYAi9et9pHR
 E89t+R3fHoV6fhIpF0l8Lr694cloIOCi35bgi0CCZW4442nt7VUvrjeMeQpI9iPUuhtL
 uvJxAceDP+hBsxuTVdhven1dZs2OmtYcUD1/cgnLhQfSDi9GXJPkjQ19G9enTzW13QCU
 2hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hTUKCIiic+Ut/Wo5FppKOMLXeKxhC4oaQ4z+c7aFIGk=;
 b=KNjz8WO83sTy95IGorf24b/P1MG1ayJ1KVIR1jnei0LyCUyURMEuwxVv7XeSEuSI++
 wwAxazOyQ2DMDm29TZW6B3zDKYaC040lOlbaEe53PptuMuii8MwiggrOK0QsrjaPIc5S
 n2UCtgMjGE+5rRFv791Ht3W/I/xUHmbKXkBPNpvMXgtVbB7b8WORERXj430VIysDoqis
 vwxGwBWjMKmpMIf4ICbTW351RnmPxZcA7fJ1ZpZEATpt84EBk7wU3DcHn7yzmahLR2al
 koM26Jfk/ijRV+RkS4MctfbTafu/ObdPh0FRcTtTq16ZiJzIXMg8RWv8lLzWrLJG0zbw
 VGiA==
X-Gm-Message-State: APjAAAVsw/b5T0IlMWBzRj2YDZnreaM2kOibQM+4SIxnNjOOmtHAolvB
 JZobN5HMK0IMfqyaaWYOV27PcA==
X-Received: by 2002:ab0:714c:: with SMTP id k12mr429717uao.16.1570622678439;
 Wed, 09 Oct 2019 05:04:38 -0700 (PDT)
Received: from ?IPv6:2607:fb90:12df:9ad9:70ab:b71f:bde2:72aa?
 ([2607:fb90:12df:9ad9:70ab:b71f:bde2:72aa])
 by smtp.gmail.com with ESMTPSA id s10sm599981vkl.8.2019.10.09.05.04.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 05:04:37 -0700 (PDT)
Subject: Re: [PATCH v2 21/21] hw/net/lan9118.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d7f1654b-0f61-4ef8-6f83-bd5c7221a7ec@linaro.org>
Date: Tue, 8 Oct 2019 22:07:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::941
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ylWwA4ZfotrD

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the cmsdk-apb-watchdog code away from bottom-half based
> ptimers to the new transaction-based ptimer API.  This just requires
> adding begin/commit calls around the various places that modify the
> ptimer state, and using the new ptimer_init() function to create the
> timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/net/lan9118.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
