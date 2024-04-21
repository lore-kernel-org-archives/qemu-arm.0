Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3710178ejd;
        Sun, 21 Apr 2024 09:27:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqV9v1JkN0LFEyYUq4q42mL6rNN9+C/6uo/BWkYJUclEHOCZ6WVQumEVIJWV4qJUR8AZ2gJ4nHDXboFDdbrlJ6mUqt0moJ
X-Received: by 2002:a17:902:ea02:b0:1e2:58b7:2dd6 with SMTP id s2-20020a170902ea0200b001e258b72dd6mr16770810plg.21.1713716857725;
        Sun, 21 Apr 2024 09:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713716857; cv=none;
        d=google.com; s=arc-20160816;
        b=qfUEL7KfB2qIpoRwA3t0KeQ1V+7VCGuxlIllOmf/UNm3Qb/a4grCOCvH6spff576kO
         R/KpFMc4n66Yewg9tPNejVYSfC6IPjUqaqryIAyEBEeDZmiyC/TFOrJ2LphZOw/Y1V+7
         DL4ybLRpQWhIbs1ISmXL9OFQs/uJzy6JN5rrafGcMcvF1xqQX2otMkkh7/G1T9oMzA0X
         zEt2CltemPh0QUdLf2+YpSvNcr+pHUgBH25uyQ2IVclFpWUyB+qEQbXTNBIphrENfGap
         j9xTPgYa6ulgLoKsqffYdMdDptKkSojnlfdLMJDtB/fGb7xR38Zdwjv1yJgoIfz6KuoU
         M/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iOyaZMyPq29jL5oW2CX6HwsQxIE37ZSna4tob0e+Je0=;
        fh=rIYxqEzyFEjlfA+yEFaIrDNyd716TYDyuHpyI6SbPGY=;
        b=vEbShfez2hMqnCNgp3UllAZ+6Vhhf/7VmyMItZx1BGM21APgSJzQcdLARRM8rhGsLw
         J58Utv4HYppCSyP6oyojxg8ndRdCPftlt53lsgnHR8bFjXpQcEWZH3EXsfFjRw64Mg0J
         7vVaGQWaZE/14/Eqo8SW96/pw33hfPrOBWjYbWWGAzTM+0f+RRU9nU5dQgKbxPlm4b2n
         wGVVV0iCkGRuiFmMRi62ywWiLMlgikS+9Z2C2Z9JnrPZYsZD48m2QhTVvc+AIiTf9cMO
         VbaqOun4GgO4286S3vIJBydlXOBjRJvvuZvECdZjo+tDXJdUEhgi5eivqITY9X7BHamh
         G/yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oa4QvwUW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kn8-20020a170903078800b001e950ffe9d6sor1567827plb.0.2024.04.21.09.27.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 09:27:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oa4QvwUW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713716857; x=1714321657; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iOyaZMyPq29jL5oW2CX6HwsQxIE37ZSna4tob0e+Je0=;
        b=Oa4QvwUWLqE1v9c/lqs0J3p5FI4F7dXoRDyaTI7f59+xfuCazXl/MPG8xVxY5EJyk0
         gwFATbZHa2d9SGh5BOKsv/p9MKZqn6puJwVNVN2BMmv2Sa0oZhYA221B8bW4NX5QY3cb
         fv8sXU7it6BoJpVg41UxbTUIHiIhsRZMHj4zqxKozaQf16ytc7pVQDt+909f/kNfaZgX
         1e7RZr/QV5UZmfhnF1J5SwYJ7lsmC0DYmZ5iEgF42JrP2WwsDSNX08N56uaVYAknWhaF
         Yz/XBkWsPt+giPy+q5U2qxBXdLt1vrd9+a7GugqSGmNYqKbmb92jAESZPYKebmnh0bUD
         MXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713716857; x=1714321657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iOyaZMyPq29jL5oW2CX6HwsQxIE37ZSna4tob0e+Je0=;
        b=qd/0aaJCBPehSHVoIHdZlGqlv/OEcbu7SNSWWX4AkIfUw9RsN8BM6XuH3GQYc2ab4u
         YWlI+gQRT5JPJKSdyK/p+9JGdfH8cFBXg78nFF8DOlTZ7Uy2ScnW8GPeSUsP64zSSkVq
         X768nFKBevST2mnLA3FcSiYgj3Y11q2Aq2yFU7TXMhp6YnlauiHtsolrv3sOtZo5UQ1g
         O7YMDz99km1+TJ8N0axerawzSETH5Y0wCUvcd25eMCkRKzb7Zu+NCsEHIbq8biBhqHf2
         cWWpxgYmFFaDVa+48hzX6+FL+fetwkFaQdpaK4Y+19f9kx0USb8pTp39rX4/494jSBoH
         hxDA==
X-Forwarded-Encrypted: i=1; AJvYcCUuctOm+7DfGNhtULGwSlhK8grjNMPq/HQkMwRnQLh+jxDiMujVkZljISvxuhHTAP/z67pL1xOR3ZQ8Y4QDTbn5l/9fr/IL
X-Gm-Message-State: AOJu0YxfD9dH0Mq0aqCTDfnYH3/9vbefEK7ZH9Gp+4HyJYwYLyVRecBn
	sFMKdAMZ3yHhlx8sB7+cZWHVyG/nkniC91BbtcERIiq6J3SRF9as03xpu1b6mRRW3A==
X-Google-Smtp-Source: AGHT+IFLfblF3YJSb+MSCnS69JplAb8izxUGFPdTcHajHejz8H+1RJSmXq+nZOkAxb+BHxcxL1/zMw==
X-Received: by 2002:a17:902:d481:b0:1e7:d3e3:a927 with SMTP id c1-20020a170902d48100b001e7d3e3a927mr10974124plg.31.1713716857100;
        Sun, 21 Apr 2024 09:27:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id jf22-20020a170903269600b001e2a408df30sm6477996plb.273.2024.04.21.09.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 09:27:36 -0700 (PDT)
Message-ID: <0868f8be-1b48-4d1b-91e7-f4085e9055b2@linaro.org>
Date: Sun, 21 Apr 2024 09:27:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/24] exec: Restrict 'cpu_ldst.h' to TCG accelerator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MGxRmrBHwW4X

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> "exec/cpu_ldst.h" is specific to TCG, do not allow its
> inclusion from other accelerators.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/cpu_ldst.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
