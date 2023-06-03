Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1604898ejb;
        Fri, 2 Jun 2023 22:43:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ67DQr+Z4xXT3S/+Gjx5gGXQcOcui/ZZ10MqqOxmzaW9lg04tN4U7NFwBmb2blichTS0flB
X-Received: by 2002:a05:620a:88d:b0:75b:23a1:8332 with SMTP id b13-20020a05620a088d00b0075b23a18332mr14438001qka.45.1685770992359;
        Fri, 02 Jun 2023 22:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685770992; cv=none;
        d=google.com; s=arc-20160816;
        b=DFbH7j81NiK4LS326tF2LRrcnMYXpCVsENiC7RLT5wTTDGs5bjBRxiDs1Bs4QrJj+P
         Ad6TrCNBs6wVc6Qv59DOisCzrtBcZ409zhbJ0E4iqoXD+Ksb7aU9yNDK6P3boo6Pm/h/
         5N45F4QHyy1N/sIMyC9T2F7OoEcpMXCobeWoEcyqbST5M55mD5N3VXuSWwuAp0OPgI8U
         +kxRbbTEzvM0fTdUAs6Fy/sCUBIQ3e/u1eZWogtrsQ9O1iLlIgsoLyG0oNIA1nVVJjD1
         QdXJ2BAqLJz7+klhRTJko83zIY5cvOwUBByiQx7APaa4Q6Ja0kuv+5cASsn9M+FLsfvY
         DEJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=eHtD3r8eQUhKXy9rSyCkrVSTtWlD2fudkIlTI+MkhMA=;
        b=CEU7Wb7n3SgIAmJVIHqfVeb1V7/U8IMoc/MJPmfVFNXamECHiPpeYpghsNeJfcRHwz
         A68Whpi5/7vc+o6HtD2s3fX52V7s+i2QwklDiuw94CWsk/ppCoE6QODt/KqilcZp+Ccp
         I5mwjJMFHIyLCAJ2AeJu6+aL2CHEw9lzNqiAUY3c9r9O/Si6bszwX8D7EMtxfkNQbNXI
         DzyK6BZAhxy0UPTggbnSn5iH0pcNYwyEI5CVgvWqnWe7Y+q3OtnMCmORLd/Rlth2q4hG
         K231UndQ/jc36Y5vj1ybphm8opseoJ55mpUVhcZ0APg6J9PXwHDsVLlQ+QwgW8Y4hfam
         oXZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxiHrjsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u23-20020a05620a121700b0075b06bf2f4dsi1683083qkj.159.2023.06.02.22.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 22:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxiHrjsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5K2I-0000SN-Gf; Sat, 03 Jun 2023 01:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5K2F-0000Rz-B1
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 01:42:43 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5K2B-0005SI-1D
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 01:42:42 -0400
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-33b204f0ca0so13101055ab.2
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 22:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685770957; x=1688362957;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eHtD3r8eQUhKXy9rSyCkrVSTtWlD2fudkIlTI+MkhMA=;
 b=hxiHrjsOQ/+tFgcSPajUpYqD8suKpbx7sAwsKAiSKzbx3EiLTkA3Rtv86HE24ddA5+
 hRjuCMml/S1DvyDvChHLk3VQz6cpxtxSg2MVqf0eVau7PfNMCXW0iF9p3W1/6XUdJ+VY
 8Hk/t8c/p/Pda/YvtHWYD/+S/rrQhn6OJALTji5Rumm5JJwjYs6v6emrwBZ/9x0BKZ8z
 LWZMuuObxeO0143IjVNYosq1KRHlMicIK2RNKwfMMuf6xlyrV0TjlGC5DoaZ9uRAqstQ
 rQuErVCo/2enArQv/cbRuvQZ0kjoW2QLBKjtdybQvHGRfcO1uZJdGgzAodZLBPb2CWsA
 rD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685770957; x=1688362957;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eHtD3r8eQUhKXy9rSyCkrVSTtWlD2fudkIlTI+MkhMA=;
 b=dzVCpqJZAX8uSwo8rWZ367aXTlZ9z9Yz8bwFCUeqfQzLp8oHj78EfLSFF8kjSr2j+j
 uyra7D0Tp9vOzfXH3SoshWJwI9lOxraS89V0H9IxnL1mB5CfJZrOS7hLzZ5o4aW55lVw
 9AeqNLaU1QIG7rxJjglHLw9YTwDKfuF6Qx0pxlFQGh8qW8aIGJdN3w/j7vIfFpejM6ti
 iy6bon7UU8UXbGEAkuG9xXTgApy0FgfrlVIBaG3feO8hWex9hJ2QZ53ZxgaBpHX5P4+a
 1OO6WtnpfaWQp+yEchQ6RuVifV+BB78CUDPt3Ot0yNkUsVj9lbKgfYdoPVcy+udE6PD/
 YPcg==
X-Gm-Message-State: AC+VfDzOoNAL0iD9MQnJlbjKkje3YIBqy+uKmiWJ/u3BU79EFf4kvesN
 y2w8WGcn+MnXZfDyKFGpjDRr4w==
X-Received: by 2002:a92:c9c2:0:b0:33d:24f9:d537 with SMTP id
 k2-20020a92c9c2000000b0033d24f9d537mr7170457ilq.26.1685770957413; 
 Fri, 02 Jun 2023 22:42:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a62fb01000000b0063b806b111csm1737934pfm.169.2023.06.02.22.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 22:42:36 -0700 (PDT)
Message-ID: <cf99db3b-e10f-2467-8eba-9713a72adb32@linaro.org>
Date: Fri, 2 Jun 2023 22:42:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 02/20] target/arm: Convert hint instruction space to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x131.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pzXVzErj0qfj

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the various instructions in the hint instruction space
> to decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  31 ++++
>   target/arm/tcg/translate-a64.c | 277 ++++++++++++++++++---------------
>   2 files changed, 185 insertions(+), 123 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
