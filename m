Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1203261ejc;
        Wed, 27 Dec 2023 14:42:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlfd9xaDqHHXCoEJAD4NUeXR54JWdeoYEUnGgPLS2TuLGcEhXGqE8F41tbgCuUkfWK+Ohg
X-Received: by 2002:a05:622a:118e:b0:410:ab6d:54da with SMTP id m14-20020a05622a118e00b00410ab6d54damr12612593qtk.16.1703716951650;
        Wed, 27 Dec 2023 14:42:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703716951; cv=none;
        d=google.com; s=arc-20160816;
        b=SAgh5gF6DrGoAofUtbWZQhJ5wj/hHP7Wc88Gc66Q4wxCaHmln1M26zIxUhvB1B5SbJ
         0dR5PiizbZq9qtZo/Em52eV1IhSCI+KMucwfLBJBX9jBKp8yFh2yYU3p8h7IPJYnOeMC
         9ex72s3WlfkAZGHsyh9hW3k8Nyui+VdrOjtbTHJe0sM3xWaI0gqew75xHHLQ0p8ZPgPb
         1T2sYp1NGLUp1UVYq7UQnJPlm2JvS+7cQ2OxehUn+NB3ZDT6FNCxwM112rUZqRtNPnvg
         jHrvTdwOCFO+YAVvF3WP8dJ0Eda7gyjk5Z0WAadcaf/lsnCmV8sSF9GwR9UDFn5IA1Xf
         SnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=MsxMS27MnbOQwFT/lvks9HqQccK6VQYbr7zFDYssXqc=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=cZRnuKX5eq/kJ+P0tnZkRW/E9WNeCRsP7gi8lxbzmMso8uF5kOJ6HiI/G+xsb9jYIy
         RzuJhsW5432h/opBHDXTG1EeZufUcA66GijEp1ZkoelFCjupyBI6onWa1p+dzfpft8pU
         QaM+M3F140cQ8sEyy2IebnOPwCgoPp5InlWpe9JIPm/MaIBF2axQTY3/sQEOJ5qpyHzW
         rdNS+4KBTnVoOzXhCOdLiLJamsDSh2dvefy7so5QzD6He0BBhiZ0Ka+uek5oW2vlLm4I
         fO2hgbkKz2VfPWDidELalpTkcfhZMT7NIo1uZjdAa9mub2HWUNmMk29V0OUmQFPd+rj1
         wA8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oJftj2g6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05622a049200b004261cc033b5si15173982qtx.79.2023.12.27.14.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:42:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oJftj2g6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rIcbW-0005sJ-QM; Wed, 27 Dec 2023 17:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcbU-0005rx-Eu
 for qemu-devel@nongnu.org; Wed, 27 Dec 2023 17:42:20 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcbP-0007Hi-MU
 for qemu-devel@nongnu.org; Wed, 27 Dec 2023 17:42:20 -0500
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3bbbf5a59b7so1223536b6e.3
 for <qemu-devel@nongnu.org>; Wed, 27 Dec 2023 14:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703716934; x=1704321734; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MsxMS27MnbOQwFT/lvks9HqQccK6VQYbr7zFDYssXqc=;
 b=oJftj2g6gGbSa7sEx3bWzWk7zfUy3Gn6pNKq4S+gkp/gi0e3IMuZmjTUsJnfBmplQA
 dXd5nI+WfWbQWKnv6gKljsHwGjBYLZ1VA/3iC4Lmgrjt28JREZMFKCjLVbe88I30UG/G
 A5in6BUFdj9Fy5hmFdCIr4eshRNYXD8oauziqQIAFFX5LKULx0iJ++52Xv4OaQMIMxsT
 teSc3HTanHAfxNQUzwQnBzQRuz+cwC/5ftbfdpTPa0rP0AAod3gRng/7MxBqTQ8e1bbk
 CujqK8XfCzd7wD1LwhYeAtgFZdMkANyK7ybtbWNWn0VOx3BsB4v+rwOEWnqwlj0vdsYm
 aCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703716934; x=1704321734;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MsxMS27MnbOQwFT/lvks9HqQccK6VQYbr7zFDYssXqc=;
 b=UXTe2Ndr+vlIbRXH7EjClmz5HmLlyvrMYgjOGLGb0hNqXUIrkQhFZBelcLIu2Ns6/G
 r5OrH/3e7LENbVqO1u0BnrCIOiiE2P8/Mc0NhAkLZDvqfX016w0Q6zcW/vmWVh1JBKrv
 1zj+DWmuiIp9AJBJVGHt5L05JTDw1K+eChJ7xbEMu/afNijw6xvesvt+jsXbZCxUj2K1
 EtXVLZE5fLFU3Cf5DMOK8mkOFdqSLJEqXT9+ia9z0XYQYSje8tmxoYPbp9BAXqw3EJML
 JUVyzvOXSMV1LMJfauGxJC4PMvd9qmTiFHoek7/sKh43Mnm4yBEe855yvnpqZ5IEc4yA
 lrww==
X-Gm-Message-State: AOJu0YxAdGFvqN36uYEhbte/OkvWXx2hNkTwuRIirw8SGxjHbtbAkQ5+
 SUuhqz3M3RZd3FtwDQBLqCSi6EXzOFOncQ==
X-Received: by 2002:a05:6358:71cd:b0:170:9c26:cdfa with SMTP id
 u13-20020a05635871cd00b001709c26cdfamr7489057rwu.16.1703716934124; 
 Wed, 27 Dec 2023 14:42:14 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a056a001a8a00b006d99cd6ec89sm8403478pfv.185.2023.12.27.14.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:42:13 -0800 (PST)
Message-ID: <5a7356e3-9bed-4398-b852-2ba41382af15@linaro.org>
Date: Thu, 28 Dec 2023 09:42:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/35] target/arm: Make NV reads of CurrentEL return EL2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3ig+q3m58MPV

On 12/18/23 22:32, Peter Maydell wrote:
> FEAT_NV requires that when HCR_EL2.NV is set reads of the CurrentEL
> register from EL1 always report EL2 rather than the real EL.
> Implement this.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
