Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp218543lfb;
        Tue, 1 Dec 2020 06:42:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsdSxH72tFhMbVbyOnKqcVIPacGvA7FsWre9ViTJfsU2c91oqBPThdlIWCUffMcjh8L6r/
X-Received: by 2002:a25:6a84:: with SMTP id f126mr4192430ybc.271.1606833738013;
        Tue, 01 Dec 2020 06:42:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606833738; cv=none;
        d=google.com; s=arc-20160816;
        b=p5mu0EaPxmli4rrPZ1wVQRJpL6yJKBXFTSRhUvRPJarcc1lhq0YD3WJdR+He26BcJj
         FgDtwKmNivFaMrfm1FEc59jn1pncGQ8DCXOXzE+J+MWntwnJkL+s0uBdtzGcdfxypHNy
         pCjP4Ddk38ORL8Kr3qR9IImcnPCVkAQdDsdV9GCDxWNBf3aXa6Zb06EclhhpK/kJ/xw6
         +YlnOaM1EiaD+UNGpfU7mF0c+ebWoN1+qMCZf+CSEDkiLtpbZGRa48V6wFqnm3+a0HdA
         ivkgxMEcM0fnOOH27VLFNTCSmDpnKD9vg/3RpwmDYgatzO+EwKuhUnDITEAmxb9Fwqv/
         CSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MZHaH5p6WjfbOiTGVytpyzPSawrwNzKmISo0qV1o6tc=;
        b=p9TQb/lmC/pCxx3y9MHaM855ANGSJBczGcoOc6ViJCR6QcZhnkFroKYgl4FPU9jZCr
         EbWEG/0OUOz4PSqW/mYQXY5jG16PS0TUUSlF8Mx+vepD//TJWBHtZfpQpPIFjLan5aKB
         +xv68oN8I7FxMiUp4WU0d6uJA57+Rdk3PUCXMnmPHljSvGD+M4tsJtdidXq/CNyTtjfW
         U51WDPEP2GN2J2S1TZ4gm2HvcT2C8j5Th01YfFZhXPSh2wvKV50ITv+np6E+hJyfDewt
         gxpSbr1UQ0tFfyvFleGiC8tNAKc9Fk6Dz5XrLCuHBf7R4ivxK5Ajt1ncJYWZ+ceideu3
         9uSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=odsiFXpR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b139si2185802ybg.237.2020.12.01.06.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 06:42:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=odsiFXpR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk6rB-0006Y5-DH
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 09:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6qy-0006Xh-U1
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:42:05 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6qr-0007A2-3q
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:42:04 -0500
Received: by mail-ot1-x342.google.com with SMTP id t18so1844578otk.2
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 06:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MZHaH5p6WjfbOiTGVytpyzPSawrwNzKmISo0qV1o6tc=;
 b=odsiFXpRYLiM5tf89HKvKd61QzDjU/XAjnBK5fRf+PDrE26u5qDpVlJtarI2fTJKNc
 f++XxhbjzTV2UhfSz23Qynoit/boSTgw/857edLcdzP8U1mNV/UncYwWfGXxRCLQc/E1
 fp5wD18O7Deimn4kswF1Wk0pQp4G0hzrpmOOyLJIaxeSAOaO6OiQECL7E4zkKe+9X+5d
 o/wzffC5pOF4QkX3yAgI91ibeVOYiOnjk5Zw2bQY1+QncWoLEPlCZvxGOstjs9tQxKLR
 JnGjX21M1W+DL6LNVV1DnFkH1Ud96cE1gN50VQBkggcIAstpxDnvwnP6bzKMGdN4mMS2
 c+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MZHaH5p6WjfbOiTGVytpyzPSawrwNzKmISo0qV1o6tc=;
 b=J38sb9YoMCfKoG3HlVd2SLSaf6kk3QoWNngWCAuJMg681T+OZvXr2sjLIhQCDa0mw/
 n34g5ucouaPHSO/HVNFfDz7lpAhOF1EKCoZFPPUsKxI4jcWAtZDy7deHvlCoAvIS/JgR
 EhiKq+gJMD5eBBGprzwCSDXQ4PfoqCRy7Z1o3aub+HCp7ZTbB6E9DmpLBeLbhJ5cMXvw
 YqnOJWDNifdZ0GYsMNQszvQxg5goO3a0g6TxQ2sWM2C+n0QBaYKa+NsJoEA1iOdW2hcD
 RxJcgzYAGhDUp2SXSEyo2yJSqRU96KCCkG+3kJX4tcg4tBtFoe0YdVJXEGBIWWeyHowU
 xJ7A==
X-Gm-Message-State: AOAM531C01hh3WFlnvNnorOnVClJf563pTNhFAi9ccjDfSUXNGwA3RMS
 e4S9QTCrGNPh0SRtnB6r9rFa/w==
X-Received: by 2002:a9d:d4a:: with SMTP id 68mr2027634oti.101.1606833715786;
 Tue, 01 Dec 2020 06:41:55 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id v12sm407841ooi.46.2020.12.01.06.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:41:55 -0800 (PST)
Subject: Re: [PATCH v2 17/28] target/arm: In v8.1M, don't set HFSR.FORCED on
 vector table fetch failures
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <12c36021-d874-aff1-4e31-bc6c565ae4a1@linaro.org>
Date: Tue, 1 Dec 2020 08:41:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: xWfyHzVWjCJk

On 11/19/20 3:56 PM, Peter Maydell wrote:
> In v8.1M, vector table fetch failures don't set HFSR.FORCED (see rule
> R_LLRP).  (In previous versions of the architecture this was either
> required or IMPDEF.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m_helper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

