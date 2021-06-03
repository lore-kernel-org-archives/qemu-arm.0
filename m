Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp485321lfa;
        Thu, 3 Jun 2021 11:55:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZmdHUXIAJLJQ02ngl7/Cb7Nfss98NS4DxEKfTkB/cZOoQNieeWrSc6YSYzGPDTnbrDNoD
X-Received: by 2002:a05:6214:12c7:: with SMTP id s7mr1032005qvv.44.1622746516983;
        Thu, 03 Jun 2021 11:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622746516; cv=none;
        d=google.com; s=arc-20160816;
        b=RPFDfT7BGpXtKRMWCyMZXx/hm7h0siZQdSx1qYLVYIBDCOXsGSDdAKvmdErnI+zX1X
         St6BVakGiD3q0HHBdR9Na3ykmUz30DoNpkt6ahsSn+212VAGVW+w1oVy5ng+ZLH/K/Bu
         oTUMAmijdVVnYiPPfh0/ui9cAqrVWr8W+EjHCutLBDyDupBdu+pUhsmZQMeiv9DtFqp1
         uLtsn92VQeF6JkL8AtijAj5ifKqzgtTO0xt1xLN95zK4825QAv6ESQxVKAbaEvclawHF
         XdpKNZCvOrcx/oQrEzLwLW7dJ3Vnr4RbVh7iDFwYojzyEFdBx7DhNfv99e/bhWx6fw20
         5Mwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YYYyZYf25IXa1WTd42JPVFX9hwQfB2FW9XYLcL4ksYc=;
        b=vjZv5r4ZIFRZoXEvd6fmcU7JORlFafvWE95H4+sRZfgmW/5lhhO3/MbfNzfr5XKx4s
         lSoQaGcCiD5SzCdy5xYKLLexQae7fSsWZB7KcG+muPnjN+cn9s46JArvXADJJEkoG4HT
         V8eSMXfTtcC8bvaNSHn4MBD6HFIoGsaj26xSrjMYGt0eEJWcgOm1MVCBfQbrKJwjYp1o
         OuzC5hcCDoHXckCxWlVni/faQZZfaLN9mqZzrmZBWxzDfTI3NB3pRpMQpM28RyLu4oxj
         BvdLZcbN2Mgh91CHIszWsoVKVKtkzkLRgDdrA1kUsQgWvoN45MzXoevjDGs+Ibz9wxZ0
         2c4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WnsvqL78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si2610269qkp.132.2021.06.03.11.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 11:55:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WnsvqL78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1losUu-0003eH-C7
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 14:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losUl-0003bl-9y
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 14:55:07 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losUj-0005Fp-NN
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 14:55:07 -0400
Received: by mail-pl1-x630.google.com with SMTP id u9so3301253plr.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 11:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YYYyZYf25IXa1WTd42JPVFX9hwQfB2FW9XYLcL4ksYc=;
 b=WnsvqL78h/4QOZ0KCNE90Z36KA2FQ4IrUwsKmyg9ygGufylxl6eOqIBz2y1zj5z5AT
 gQ8MDlBRa0jSNcJq+UjSqr3yu10Zh0u6BW3hjlr45SAivtD0EdC5F9Ix2eYtVTCtFnLx
 bLjH+l4GsjOICDOZS+F1BRa4fjtzFpiQh03mmafHjQI0hdwHEBsjo4abrkGiDj4ckbjm
 QobquRbrFXUazdH9rjOMCy9mM1cDhLdvHgHLxDPp+FfVTVs0HR7AnNq3UI380heEGJuk
 BRY+OWZxE4T8inXwp6MoOo6QOqCXFBh76h2ZtffHlgtRoj3m93zUq/OOuJ0xBBUNW58D
 H+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YYYyZYf25IXa1WTd42JPVFX9hwQfB2FW9XYLcL4ksYc=;
 b=MeKKbpRWWW5zkmRDmsDS0BKSuRT7reBTswPRX5cKeKz1VUuuWxifjkK10c0FGTEGmk
 73uE927YJ59Ab68zzsXbI55PhVqzUAoQzNyrbwA6rmeZBXuxY78iA4qxFG0YdwKm58z2
 A3tVt4IVj0LwOtzAh4jlI8zSgU2yZfhRWTB4/R+ocPzbObjjO5jwOvcqoyXG7pGndOcE
 GYBUSFtnGVl9lxVc6MQgUYFQEVnFX8dokfiM3U+dOW7hKPwFUlYADYS2z/d5BzQmOm8t
 KRmT2n6Brk32IDZ9mx/iQbVAc5Xuzjs5xTbw5/zYjZVh+sErhRV7y4kgscdgvt9t+C7z
 myqQ==
X-Gm-Message-State: AOAM531F4nWW9l5OL//Y4oxCbWEpJbbQqQ1wIIkGJgiZORR962uFZdw7
 GJh8zF3A/jIO3HNGNoaENU8fCQ==
X-Received: by 2002:a17:902:d3ca:b029:104:ebfd:a554 with SMTP id
 w10-20020a170902d3cab0290104ebfda554mr572754plb.13.1622746504218; 
 Thu, 03 Jun 2021 11:55:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a4sm2687329pjw.46.2021.06.03.11.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 11:55:03 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/acpi: Provide function acpi_ghes_present()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <584f30be-6beb-81d4-5c72-30639617606d@linaro.org>
Date: Thu, 3 Jun 2021 11:55:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603171259.27962-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d9GPm9BwS5y5

On 6/3/21 10:12 AM, Peter Maydell wrote:
> Allow code elsewhere in the system to check whether the ACPI GHES
> table is present, so it can determine whether it is OK to try to
> record an error by calling acpi_ghes_record_errors().
> 
> (We don't need to migrate the new 'present' field in AcpiGhesState,
> because it is set once at system initialization and doesn't change.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/acpi/ghes.h |  9 +++++++++
>   hw/acpi/ghes-stub.c    |  5 +++++
>   hw/acpi/ghes.c         | 17 +++++++++++++++++
>   3 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
