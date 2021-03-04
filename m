Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6554837lfg;
        Thu, 4 Mar 2021 12:24:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbZRAtmjjXv2ibmnGM3E+z9a49BwCckjfQQ7KbubGrBqTH8Y4kFHIstJKh/GJHSxH0mMRh
X-Received: by 2002:a05:6e02:4a7:: with SMTP id e7mr5408405ils.19.1614889484141;
        Thu, 04 Mar 2021 12:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614889484; cv=none;
        d=google.com; s=arc-20160816;
        b=CkmuKWBGF0ErbZTpB7wY3R5UH2lEcc3lahNdvGPO6T8kA8YYS28YchlckR4ytnjwrO
         +cQ/RTo2pPK89paB2Oq11o2CKxEMe0QtAS8e/+IQJgLsT+Rq7mWf+vHIZtucvLWuHh8C
         oYi/Epn7pCR184Tsck8SQr+7m4lHPkGYac+X9Q64FfPkv1z3IrD4ZwQJ77OYrYqc9YGY
         iE2DJGWY3FLEVqa1/arrVN9Hd+SQUQ0/PVURnC8kGcx86Z6GJMIQ0bD/axPzQpvJdd/7
         25B1+Y8BmNoBPfCb8e7fgZN1XBvi0K9uKuNCdnFvTxWoDqWZb/C3IHPyVT6P1p75u8/O
         7SMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PctSybfesLKpuj5qGDN2y55SE16+Uk5oaDYZE0wbIg0=;
        b=foW7cuIEmOYuCGRuYwCfTJBXby8EiW3mDeMFAMIoXJ1Jlib4FUlfcBaSsH1bQwkgRt
         SgVBa+gy4/KGXdQTKi38alU1RrS2Oogah0L6lF+HmkU2IEPiGEltGaRLNNRPGkucbqPQ
         c5YStuu5F7QAWyAHvgh580bPCQw6E9Vp9vPqqQQoyDlFmwYQiGhU/mOGecgMz30RnQ8B
         eQCiY3X3K4GZ761tw36CaNa0EJb++nU4DXyKd00dDMq2RMiHqtV3Z9vyjMwwZsdsIGD5
         Gz3iFGgSiiFDtwt80pu4lv02s7HbtqrNof7eSaxn4w/A6nyhvMDEvCiYX/OmlFr23x1X
         RyWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sk87s9Pk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si125661ilp.121.2021.03.04.12.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:24:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sk87s9Pk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuWZ-0007i7-EH
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuTI-0004UA-4p
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:21:20 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuTG-0007Ir-E4
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:21:19 -0500
Received: by mail-pj1-x1035.google.com with SMTP id i14so7317954pjz.4
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 12:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PctSybfesLKpuj5qGDN2y55SE16+Uk5oaDYZE0wbIg0=;
 b=sk87s9PkbIs5Qlisie7/YZ4cR3QSTE/UGcNenpvhQFDkLhzHmxILoT++uqk7YYvJuW
 q6QOwzfzGF34aw7BO6uUY0E5SH0NdTP6LFqWnRZ5tLEjSBONPRAvQ+Hey9O1spoDihUJ
 dK/GcbpAfPE7mc55Ijh+qxtjdbWmVwkZP8XqDPPt1qNYChbBe4NN+Hh8AzuLMA9A6ivY
 WNRF3cVK+7cTL3bUSDOK7iaJNNth65nOber8iwYBXmT+cCPzMonrE02CAbMh3q5MR0ZP
 0+AK6tFYMNjEzOvIQZN7n7PK1xNp/2tl0jF3DRlzz54NODteLIMVYY2W+l21e2V3xrPe
 wMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PctSybfesLKpuj5qGDN2y55SE16+Uk5oaDYZE0wbIg0=;
 b=QWf0MCFB9j2wFTYOhmezZQfgI1XW35YCIWQu8CUssiKT9AGjqPMDuRUTOpeqfLw2Ec
 0R7/mHDFvwhYUaqXmDXq7epMotDarFau5NmBdZpiP+lVbc2zpWhDUdH/C6x7uS03jJUz
 jAxUmLaFflZFt3uEW586UQeFHsJ9llSH0Gkg+PTu4V8j1ZcE8bBjaiB1UNtsaOtPNp4e
 Bc+QvIXw7oEIm6NiqmwntUVxeNzAzmv8yU7sbPuHuaKNRSK9VyWKM/VDwzL2WaGYu/zt
 2slnI8gMPX+yIcAcaslBYkK8X2FfSvsg5Qh1rygSx7TueXOL8VJbxTakXyRbcdWCmEDe
 EXMQ==
X-Gm-Message-State: AOAM532R60lg3Q1gaVfyih5fHulwlR6xur6M1AQgObpbHj1Ylh0NXWsa
 o8vzS6JTOE4D/i8LZiaMU69MZA==
X-Received: by 2002:a17:90a:8981:: with SMTP id
 v1mr6477259pjn.230.1614889277102; 
 Thu, 04 Mar 2021 12:21:17 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d6sm220308pfq.109.2021.03.04.12.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:21:16 -0800 (PST)
Subject: Re: [PATCH 28/44] hw/arm/armsse: Move sysctl register block into
 data-driven framework
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <879f0eef-b2a9-92b4-20af-9a577aec4816@linaro.org>
Date: Thu, 4 Mar 2021 12:21:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: ghFo1S6NgZVo

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Move the sysctl register block into the data-driven device placement
> framework.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
