Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2341849lff;
        Mon, 14 Jun 2021 14:44:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuWjK6GGzQFxX8QA4Zg0m1nvmu6CFxQMyMjqLJFoYTJBtUNPY8FdAYhAist4+IYREOTD9Z
X-Received: by 2002:ab0:2345:: with SMTP id h5mr14726516uao.126.1623707042528;
        Mon, 14 Jun 2021 14:44:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623707042; cv=none;
        d=google.com; s=arc-20160816;
        b=IPNoOxxZn8d1UrY4Cvjs7shY6FYKnvg0ktqVcKTZ5IK2VY51TpU3aAM2IGVuGUYy5f
         wLJtLwTVqXByvw1KQjnN4/46Bpe+kkhNpTNcfKejRrLCo5u3c9lXa90lmHovvxDC0JMq
         xtGh20hO3+40Z2IAz6h70zKE/zCFb056hEe05ZASHWR18o9Kq9LpnwjYZ1EyCxY+P9KJ
         5oSfQ540VwnjYFU8eH3UxT1hvroGtEBJ8BVcggu1GjeK4uqUri7sRZBMrEZK5pNvs/iX
         ngfBrnSCqdz9CQaHCw0dJdcer8KclH81unwge5W2ov1xzOCioZiGwDAtoBWutlh2ZPaB
         ny0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MsP8k49LHApyYCRD2stYRXxE0xx/PDQBMlBRCPOSz4M=;
        b=kgYEnlKitwmq8Fn/K+Wolc8Dx5uF8eH8NzWURhgJkSgJkghWJmTpLqm+eHsBeObJWI
         ISsbCHuO3i4ftNOSNjasjrw0pwOwIYPRPw8AnY0XW8hniEVFlrjUxZln12k49WyjU6TU
         tsUehaSBHBbS0BHninABAwIvpkLyY+K6ltIXEiytsatDNgxb4OcvFf3M+zyY66GZhPSi
         LQlkOBgo3Cy114m+WOFip9Gq8WIEij2Qe0TcnYzqJlB+mk8NcGF+rKIsnw14dydHP+SY
         yIzFzOSkj/8eY50vJ4ae9B2R/rSF3oJC/j8mbkteRGTU0LDxq/k+pY3+2bnebrYmieyq
         jpMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/Ta5jaQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si7404004vsr.211.2021.06.14.14.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 14:44:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/Ta5jaQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsuNF-0001ES-SW
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 17:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuN5-0001DR-QD
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 17:43:51 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuN3-0004DE-7d
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 17:43:51 -0400
Received: by mail-pl1-x636.google.com with SMTP id e7so7349481plj.7
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 14:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MsP8k49LHApyYCRD2stYRXxE0xx/PDQBMlBRCPOSz4M=;
 b=M/Ta5jaQ4ywY6FdaSdSigmEOamxO/nIciuxjzvrZApjT+M9wPBhX4BxKfPx5fh9uHT
 VWD+zK1EGH+Cjs5ibVKerZ1fXodOIXx0l7X7MU8x/uVt0EdTt/C3PtL2tIuydFEycGuM
 fK/nIbxxiPKDm29RaAIpsjs7dl9SPuIFMYku5NdGjYtb7YKHP/kQ2ChN/e8d8jhH4FEg
 s/gqb4KIeC1e2wXkkijaud7I4eGFvUSR6ucr3IOl7TnGlV1B0aBPR+s8c8BdutBlIZSb
 SDN2dU8H6HTOpaIGPyzxqSMYNQSoCZeLlxguYsaex3BmF7j1pX0Bs/IzZKkrfuRE7Chw
 KLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MsP8k49LHApyYCRD2stYRXxE0xx/PDQBMlBRCPOSz4M=;
 b=e4PA5+XCu4SxxMAM0UoV918oQcFiTSk9jmTfz0ziuSqnrmNQgFonU4fOtPZA6WSQHP
 rkM2sM7EDDSr7BrSOHY7q3eXzGeK5SYVDCxhjcV8BVMMQXCL71Zr6KLHTShxrby+81bT
 TKu7tURLVNAmk4EzORNOjXd5NoGU2c/+WLdk9t9lv8r0TDvKe8HvVBxPOKbR+uSo+GSC
 IIdi68RvMsyCbkTSChgT6Pp32Xilp4D/NC7dzH/06GF9mHj6vG8iH5lsmOA1+Jmdxnsq
 7coF1ydDXEADDTF1MaB4NCebjg4Dj3kTu9os3KlUmR1rSJdWJDvkVj3CTOCnLZOt1GAw
 JnoA==
X-Gm-Message-State: AOAM532Hp2zRUSCtD3Snbj4lDfN58ZO62od8vVw6NdubLd5rxvKjpna4
 XTycLcZF8KzB8rn10f2nX5fDoA==
X-Received: by 2002:a17:90a:d705:: with SMTP id
 y5mr1348305pju.20.1623707027538; 
 Mon, 14 Jun 2021 14:43:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 mi10sm373811pjb.10.2021.06.14.14.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 14:43:47 -0700 (PDT)
Subject: Re: [PATCH v2 45/57] target/arm: Implement MVE VQSHL (vector)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-46-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c01674ed-992b-f863-fb84-938ef08d38da@linaro.org>
Date: Mon, 14 Jun 2021 14:43:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-46-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: z8BtBD49CBW7

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the MVE VQSHL insn (encoding T4, which is the
> vector-shift-by-vector version).
> 
> The DO_SQSHL_OP and DO_UQSHL_OP macros here are derived from
> the neon_helper.c code for qshl_u{8,16,32} and qshl_s{8,16,32}.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
