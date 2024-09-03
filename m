Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1593943njf;
        Tue, 3 Sep 2024 14:25:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcZwcoGXr0nDCrZKlUTNI7XTWRVkCvv3kFB7ROlsUfIif6zfSR3HW3wv577dnDzQqYD4ayHpgBhE94TA==@linaro.org
X-Google-Smtp-Source: AGHT+IHw79OsF4+uf7YkUV/daI/6DKBQC/wQkt6rXqsvaO2KNBF3pVFfSp/a5bp8DDZXWPGvCDlt
X-Received: by 2002:a05:6808:3093:b0:3da:a763:4718 with SMTP id 5614622812f47-3df05e63e78mr20286308b6e.45.1725398750524;
        Tue, 03 Sep 2024 14:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725398750; cv=none;
        d=google.com; s=arc-20160816;
        b=nQIYPZDZD7SXDQ1YY+eJLgYIvs+lY4oqzQwW3qSKyEROkzDBzQp5lVFCD2pHQrJPP8
         qxDpjkoeYWU3kBLLePLrM4QlNAj3nwOj4rbQ3uzLb/mY7Zz3jSbpubffSHHvgkmdZtCl
         kyMvBar8QcXX319amcB3JZQmKOqIugs63p+/p+vm2ufrrPfu83IqDI8XA1WpW5cweU5c
         Rcb7hCeV8W15cdi7hO2IEqFKpt0ilH3QtU7HhH0sxGZ9uy/AD3kinbRjqkdb7JvXDQG/
         qOfeUK44QAt22LftHW7sHiCinwKEDegZjcEdvi365B94s3VNcrV+fLPuIovAa1Qq2QXM
         41tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Qg5XMgNIAPbecRyl+/+UpCVm04X/3lm3OWBXOWHGPwA=;
        fh=5t0qIhgSwB+8UKcPYrwiGyx7HWgZVgZhHyAaiuDsZnM=;
        b=VO064xnMijCEn8EKgRcmzJdZ+ja1fsNXKFLxb4ImSUyw/1R23DDkiRawvCK1IB9mtz
         CVtG4K/iUtXgfBhFJukM2ubaxZcICOhIHZhwL/QHshgNB+jbREW1fNw9u0LnO0iLn6l2
         j87PhzUkWVvZR+GVcjElCJfbKXB9AYbBai59KY7XDVIV3CH0y5BEzw7vv0zChbHM/hU7
         lpYrnSdYD8Bj3cHBCHvZvEDR0Gt4mWJ4cacJGQB8wDRNB4yxFeRs7tcXywVKto5GhA+X
         +AoYr+Ocl3i1hj5sye1+i7A/YbhCkhuuFuUPQykEVpJyAjvb9j+XrdiKSZlfpoegZBV/
         9nHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n2jMbKMt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682c85aedsi31551291cf.39.2024.09.03.14.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 14:25:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n2jMbKMt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slb1h-0004jP-4T; Tue, 03 Sep 2024 17:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slb1c-0004h6-IF
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:25:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slb1Y-0006mz-Oc
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:25:18 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42bfb50e4e6so31530675e9.2
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 14:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725398714; x=1726003514; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Qg5XMgNIAPbecRyl+/+UpCVm04X/3lm3OWBXOWHGPwA=;
 b=n2jMbKMtckckGGxcB+HyM0buy7iINriehaOQincU9xGr/73SfLhZQ+Gftv3SZ6gzoz
 BfQvk0SQwwunyA9XiSrfEAuhNjzlJ1SLlQtc5iFhTeM916W7D5RUVqc+DrygQZdt0A8r
 ++Sw4jYzCrwhq7UPFdrG3riRf57pCJFKT6bs0laYzLeH4jNCDadW6uYqUZ+0IraPh7A6
 z0vvIcU2CcA5o+wmvR/P0/j+23Jo/mnCdfMYn4HZ/a6pX8nGZ1sPTyGgsQ1EEJnKb/mr
 4OKA5M6JC5El1j7STgcxpSRsMuOCBQ2BpmDuMTVapPfe80bgl+ua4gW4BTnuOYCc/hjn
 pmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725398714; x=1726003514;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qg5XMgNIAPbecRyl+/+UpCVm04X/3lm3OWBXOWHGPwA=;
 b=kNOQ3qf+7tRDGUhI03BiIbJi/0YDQpI9NmnLaTwYJKnsMQcVvMHp4vutRbvfuxf5tm
 sj/65kQwHZ0XIPvfwTCO6/sQ0mR5beWxmjgXxzSrfTY9C6NxL+sC/B8bbSQ0y344/Ff2
 C2ypRF+UEXtnOoYkCzWyrxm5t930Ud8EK7Nub3Jd5rtKQuwsMKBbuP4g7qIDx9EKUtxq
 YKz0ICQQBm+GMjWS2n0FI1GnVQYfoTcR0Q4FbSB32dkTfmVR3WCi9WxiZv8gyS5IeGRX
 xnLaHD9T9gCC3hVLGOFvyGvJfTaP+MSq3Ahj/GZruckw+LefRXDC58dIfWmSW20qzbf/
 q9GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPXI/oUT9O1Fo8rcewe+A/ivTZBxVGhIGxCITWFDCUZAH2nTD2lsPFnl0rD9DjuNBYaKUZjbTm5w==@nongnu.org
X-Gm-Message-State: AOJu0YyzDRLxpVNRtyofWWyokLnVDtWgtHxqzTr7nzuGOmy/TroTrBIC
 tqEgkThrued8MYQ2oF1zOvmKrcIMoO0Bs38GmPQM0H0+K42SU/1x6RGfBAdHi0A=
X-Received: by 2002:adf:8b5a:0:b0:374:be8e:7325 with SMTP id
 ffacd0b85a97d-374be8e742fmr7335012f8f.51.1725398713860; 
 Tue, 03 Sep 2024 14:25:13 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c29aa150sm9464380f8f.101.2024.09.03.14.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 14:25:13 -0700 (PDT)
Message-ID: <74e730c9-8abb-4644-8948-366e61175e76@linaro.org>
Date: Tue, 3 Sep 2024 23:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 36/53] docs: Document removal of old Arm boards
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-37-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /Qcg9338oV8Q

On 3/9/24 18:07, Peter Maydell wrote:
> Now we have removed all the board types that it covers, we can move
> the text about old Arm boards from deprecated.rst to
> removed-features.rst, tweaking it appropriately.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/about/deprecated.rst       | 15 ---------------
>   docs/about/removed-features.rst | 15 +++++++++++++++
>   2 files changed, 15 insertions(+), 15 deletions(-)


> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index fc7b28e6373..815d63f5941 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -978,6 +978,21 @@ Nios II ``10m50-ghrd`` and ``nios2-generic-nommu`` machines (removed in 9.1)
>   
>   The Nios II architecture was orphan.
>   
> +Arm machines ``akita``, ``borzoi``, ``cheetah``, ``connex``, ``mainstone``, ``n800``, ``n810``, ``spitz``, ``terrier``, ``tosa``, ``verdex``, ``z2`` (removed in 9.2)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +QEMU included models of some machine types where the QEMU code that
> +emulates their SoCs was very old and unmaintained. This code was
> +blocking our ability to move forward with various changes across
> +the codebase, and over many years nobody has been interested in
> +trying to modernise it. We don't expect any of these machines to have

Note, sx1 also contains "code blocking our ability to move forward
with various changes across the codebase".

> +a large number of users, because they're all modelling hardware that
> +has now passed away into history. We are therefore dropping support
> +for all machine types using the PXA2xx and OMAP2 SoCs. We are also
> +dropping the ``cheetah`` OMAP1 board, because we don't have any
> +test images for it and don't know of anybody who does; the ``sx1``
> +and ``sx1-v1`` OMAP1 machines remain supported for now.

I'd remove the "the ``sx1`` and ``sx1-v1`` OMAP1 machines remain 
supported for now." part which doesn't seem so relevant in the
removed-features.rst file.

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

