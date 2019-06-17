Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2877476wrg;
        Mon, 17 Jun 2019 12:29:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxP3wEFkNdZR7eZnMn9203BR/S1SRQ0HZfJuPDYkZcqf7enyEk62lybyCuseQ4ig4Mi6ccW
X-Received: by 2002:aa7:ccd6:: with SMTP id y22mr54271586edt.274.1560799744430;
        Mon, 17 Jun 2019 12:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560799744; cv=none;
        d=google.com; s=arc-20160816;
        b=YKqm4DcjGh+YWX5S4hMhz+r7pMsPlPw/6GsiFCOnVAXSHGgxoVTmfzP3OEAUDU/93B
         HCmXL/7c2zb3fm+EYXxyaK/0GlMq2jDUansnSq+6rwVfRKriz3gzkWPoifZWXCdy+Ng4
         w56EIJKjzj4TRxHJb8/0k+bd3JUVuD6VLIUEzFyUWHNWJ7h90EhdQk0bYmOueC1mlGRP
         TBNaAD3sN7yTSfJoCYpSpvFsvw7nVPqW7tuPKlZ2jWT7g2vcnaaRof+pT2KqJn6UX/ja
         8mwmzLZvSaF1L4BIU5rhPP9AUBNWPzyvwUmG5icNHj5bk3/JHMDMpaERaU+HuF01wRnQ
         5Q6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=TnR1/CrViroDbPRAdO2Ey4SNXzabMwcH1ZVN64D4JOs=;
        b=IREvs7tLb1WujOw3LX5zkKnvPJUnoWMa21RWnbsOMyrx+PcvzV/5LSZb2wTP3CGne2
         6f9nXavZdryHpbWFl5UJ2CmEPVa2h2tJ0foQLEvkCN7vVsGjAOChjeWj4NLvpefwSX3c
         JKtld+Bb/LmFNlDIlmcavysRAtUTTo1n9jWkTR8L70x6OWLkON5M0bkNy2+JtI0z7U4y
         42ptcjp7oxvy6AgoPPfKEq8WdIwnuj9mtZXeq+cuiLfbQYjeG6+PgwbadHjF7iXT6Xw6
         FCbfO1D6vYvbt5/3Wwjoj3cpwyHlzGscxUBCTLe6olov/hoht2fA3tW34iDH3gKMVCy+
         abzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OcRe1Wv/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si7597140ejo.172.2019.06.17.12.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 12:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OcRe1Wv/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcxJP-0006kj-IK
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 15:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51119)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxJH-0006kW-Rf
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:28:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxJH-0008Tx-1D
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:28:55 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35073)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcxJG-0008TA-Op
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:28:54 -0400
Received: by mail-pf1-x441.google.com with SMTP id d126so6214721pfd.2
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 12:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TnR1/CrViroDbPRAdO2Ey4SNXzabMwcH1ZVN64D4JOs=;
 b=OcRe1Wv/EHc+ftubSVErgtoKFGzZTcP7N2imRD15pfqr1KtT5cL2iuXM4NLDrCvtGn
 owoo05l1+UAdEZ/0hlU9wPDxTCvYfQ8T/5v6dPc0+dY7DwJ9AEBzqXlXFT7EZN3hSXre
 YN3HfVpG22WcknEHqCIGjhkWnz5uphw1N6KfYrjdxPx+LwBPv0CvCGOYK8rxdeXn4CBa
 3mREdjuI0+GlQjsqK75F1GU5p+xaBhAmsyUPVCMbEQNjDfG1pQPUQTNnCZaN831yD8kT
 SvqZw5hzcfFCAuvvaHjvlLNtFhkPFU4l6TBArMKZMVfTuw5l10netJu4uPxB3+IROytS
 aAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TnR1/CrViroDbPRAdO2Ey4SNXzabMwcH1ZVN64D4JOs=;
 b=QFer3DUssSXIufxDp+h2xBp6GLSt9gZp6jMEDHHkaM4umcdpBx9x8aI5tNvyyaW7fj
 Zz5PFWveDwp6r5nhZeFF/dLLLzTtXHFOF63DXzfAtix3OAF99YbpcC6PamzOyvdcFplZ
 XLKMJoBYdXQuj80xBR8eiRLQFS2dFJN8rRREmswAHrzIEYYLtiZ7dExWyrT7UwYDIl4n
 5TRj+LGCuKmX4makbqlTSfkkruaA4bMtR8G2lJTL0t6mlMDUlUXoFY1+0VTd1DjiuOP8
 fnBiCbhQARV4HWYUsMwmQ68m4PsYC0gxp0yWTUO9KW7VgX39HCkz3QSyQ09zzuk3KN+r
 Yb2A==
X-Gm-Message-State: APjAAAWXK8RctXhu0ocIBz7cg6510iaqqeTQ3ZMxh0Lt1S0w+LM8Xjyh
 lX3RbdfF/RYXTQNqZ/H2y0CDQg==
X-Received: by 2002:a17:90a:d3d7:: with SMTP id
 d23mr530453pjw.26.1560799733270; 
 Mon, 17 Jun 2019 12:28:53 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id 3sm12209029pfp.114.2019.06.17.12.28.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 12:28:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190617175317.27557-1-peter.maydell@linaro.org>
 <20190617175317.27557-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <38277bbe-b942-337e-4a7c-dac3ad3a60b5@linaro.org>
Date: Mon, 17 Jun 2019 12:28:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617175317.27557-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/6] target/arm: NS BusFault on
 vector table fetch escalates to NS HardFault
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SLGRFY2O7OEh

On 6/17/19 10:53 AM, Peter Maydell wrote:
> +     * The HardFault is Secure if BFHFNMINS is 0 (meaning that all HFs are
> +     * secure); otherwise it targets the same security state as the
> +     * underlying exception.
>       */
> -    exc_secure = targets_secure ||
> -        !(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK);
> +    if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
> +        exc_secure = false;
> +    }

exc_secure = true, surely?


r~
