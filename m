Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp543385njc;
        Thu, 14 Nov 2024 12:47:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXo3Ycs4WmZgtzwGWNEbozS5XFAFI/Sg023l7zCBHwH0f1yG/3du6AfnSK1mA9A5RH846yddUxocT+glQ==@linaro.org
X-Received: by 2002:a17:902:d505:b0:20c:cf39:fe3c with SMTP id d9443c01a7336-211d0ebf209mr2649495ad.41.1731617265084;
        Thu, 14 Nov 2024 12:47:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731617265; cv=none;
        d=google.com; s=arc-20240605;
        b=ki6JadBI6OsEi5+vl19TxPx9PcYQ7mpiJnz66VGq6H8FPrLJMavXG2lLPKu5/bF7oJ
         osH5K4Quvxr0LLZzhKVGreOZGtTHEQRiUZDKqvoRsfMM73zEAfKhZwBqdeMuPIJY1US4
         CwpmO3El8FIJ44mHX9bLesCH0GJHOHQV/k5x5EyVw/HHCaBIiTbUPGd2z2M7/eX8qMgO
         BOFTAjoLTxEBPo1LXBNbUn+Wi/070V30GaLzcVi9HoM/8DIg2FUpW69s/1C7t5N/7Aly
         dUllrVM3bzoWrt6Z/AU3v4z9j19eSadciLkJlkpzWX1qzEZKzot3wd4qHK1ySSmExcCz
         qqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TQAffY6Jbc3yb4+aNdQcKrEa6FnLgG8CT4LXibiEXls=;
        fh=kL4fjZ13U6j5Zo1g6RY/Ax6P/dMdNjjSJ86QNkamx+o=;
        b=jKcOlVX2dP6NotcdfTxvly6TSwbQFf+b1EgpmncEnFAYdXK+Gm1PXkHSHmJVlT7j3n
         NaWLWSTrbCWnmnvK271D0znDoe/CNxyOS2D5zDtRe0vJx6ttPYHK8EP0lMU7u2be4cdf
         OZ6kT39U6aWVlWXh3Pja5gIUYmr9zJ3p6EWfQ0+IjRhc7fEGin32ABa03D59J3LdkFjE
         IFoZ/iLV/uqmqRhfbiqv3FYNmqTFTqlrkdzDFQv2QuDCsYU51TnTNUCQYYkMnAs4VVQb
         Xk+Cx/kviUHGPSB4PNXQQ8tmLi1f74TC6KKZAUDJ+DjDzaTHlPFO5DPK2u7yRof4FnEF
         On/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vxAGIVAp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7c33357sor13762835ad.3.2024.11.14.12.47.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 12:47:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vxAGIVAp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731617264; x=1732222064; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQAffY6Jbc3yb4+aNdQcKrEa6FnLgG8CT4LXibiEXls=;
        b=vxAGIVAp2cY1CcxQNnKN8qzzM587G8Oh3CWKViaDTv8J0hz0nO/Sm+49O57nxG3XvZ
         8OY6fxNM/l/PHa2yu4m7qfBW4mz2Meq+09AiKCe1M5wG7EwHeSMtZWk/CcW1FKryv2cu
         WFw6j+fcUQUckDh4rzdmgf77X6XnrQi43bOzaOXq43bDJjNLYm2kkOAXvFlIF/ps8Vm7
         bp4xZk54rkmMPPz4Mq9O4IghH+Ssu0ynJGUgOrxHlry31yf8WuTkaDT4x0+3QWZUAL9B
         1kUZCQ77S2zxpHJDZ4L36CIH3jVh33WaCC/UjGm24QbZjl0Ed1IkP48YzG871f4ZwDV3
         h3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731617264; x=1732222064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQAffY6Jbc3yb4+aNdQcKrEa6FnLgG8CT4LXibiEXls=;
        b=TggTHvoFoZtxwkZThZYLwejTzXV1x9Wjq74KyklIgFnEN3it+QLHE/bHeJ5TxQyXcy
         CdGkGHJpzXRWIrnBe1BKHEavCF49xhYYpsT+XFRaNkOj5lsEANUGOgjUDACIq1ztIh2M
         vye/6cN7vZXbxN+hLoNAlbeEcl4JjaWzvc5VVcb7iBg8mp/37O8ur5yJxQ2fa+hO/R+V
         JQeeBes2H3vi1vSLS6uVsqfWKxjwvwDANlC/T6xBE003EywNhYwJ2OXD4wNFH3OaNZcI
         pXFdDRsA7at8T3kPjzvlqo3DqJ2DxrIDs86OoVEwySfKTZDtFVI6KWszBg9hV0w8p/cs
         sJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXztsk+n02sNKY2ifna3mJLKO7lXdtbOk7Q+26uxl1TjbB7euytC2ktJEBcVb0iaQ1Lb+N2RhmOSAPFxw==@linaro.org
X-Gm-Message-State: AOJu0Yz0bqP4SqhGIlEEWory2LMdEohlddQXaK5Ku6m0p7AUdpeJajJS
	1WVm1aIa72w1FI1EoD2vz9CTMOyzGqQL/iBxo73GraFK2MY6JYFv6zqdlKQu0sS7Ew==
X-Google-Smtp-Source: AGHT+IHFS/Bm4/pxG4GRtDM6hsm+A2K8VwDnl7hMoSxJRFz1VyyGEhA0kRuDPq8Vmn7VYqOggaB2eQ==
X-Received: by 2002:a17:902:c950:b0:20b:b93f:300a with SMTP id d9443c01a7336-211d0d62833mr2748365ad.7.1731617264508;
        Thu, 14 Nov 2024 12:47:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f46843sm463015ad.186.2024.11.14.12.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 12:47:44 -0800 (PST)
Message-ID: <00fa4af8-e9a7-4e9f-8c93-86582739fff0@linaro.org>
Date: Thu, 14 Nov 2024 12:47:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] exec/cpu-common: Move ram_addr_t related methods to
 'exec/ram_addr.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-23-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-23-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: A3GMA9nbSzU4

On 11/13/24 17:13, Philippe Mathieu-Daudé wrote:
> Move methods related to the ram_addr_t type to
> the specific "exec/ram_addr.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/cpu-common.h        | 56 +-------------------------------
>   include/exec/ram_addr.h          | 56 ++++++++++++++++++++++++++++++++
>   include/exec/translation-block.h |  2 +-
>   3 files changed, 58 insertions(+), 56 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
