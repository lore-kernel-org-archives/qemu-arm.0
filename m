Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6541213lfg;
        Thu, 4 Mar 2021 12:06:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeoakB5+FSrP+LEu15488L+wmhvIf86TlsDy8dFHm0ToIQl2dIfThXulIezi9+lc9uIt0R
X-Received: by 2002:a02:ccb2:: with SMTP id t18mr5798095jap.123.1614888380710;
        Thu, 04 Mar 2021 12:06:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614888380; cv=none;
        d=google.com; s=arc-20160816;
        b=s74P4S55zqXEpj8aNQ5N2nuzvCtBml9V4kM9lfWGEURcKW7q13LCjmBTUro553pIiu
         ML4N1NYVA6YSeucGIAeD1KlHv+28jcmideuLm465hynHHgmkNGjhrneKg2pvIxgc2X3+
         VDY6Y+9I7PJ5x6IqNrcqC4KB4BPzzUU99rkayMh4ydlW9tJMzzDFT5ErC8qe4EP5jDe4
         26wFfJNMFBvi2nOzDJC4uWWvXxtg+1JHREB0EDMR3Qyum9NIrI2oMZO2bOYLy6G63tQu
         rSgapahlTuE3OXZdgpEOfLsjcRBXKRP9PXhEjxOg0Fa87XSUK/cWwpYYgSSWMzOerKFp
         X2cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=k9p9CBlxkeT7UOqovLbboAwo48ySz/XZI0CgrUXyVxg=;
        b=s46JGDIFkP6L0eUF1FnZj3TCnYancTUWm+1CCsGw2DXMNEIx54OguWva9E9L+PEKgC
         /SeIMBnF2yc1Ev8IGMoeZHzsaQEE0WLYIiVqUWdM65SXKXjdOtB0dB35Cgihil8hVRPP
         L/o83eKaSWZoyrWsqlFd4GA4MtpG35F1nRHzUTIjCsZ6NB9xI1V8t2YO92LouKHIQqSc
         dlfkJxgz/2E+Lg6Ah61vz5MH3XFRhw2En4mQgN8FvIva+pxEuy7xu87nlhmbdp9CcwCP
         +qK2WUkDiIj59umPfp5FQU1k3IEdlmTN0rvAtEcOxlViLYKrStzKvU8tZ+8cqJ5+Tv+s
         F8kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ACpEK7LU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si290949jam.14.2021.03.04.12.06.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:06:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ACpEK7LU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuEm-000730-1y
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuDL-0005p5-59
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:04:51 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuDJ-0000Hu-Cm
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:04:50 -0500
Received: by mail-pg1-x52d.google.com with SMTP id o38so19601325pgm.9
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 12:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=k9p9CBlxkeT7UOqovLbboAwo48ySz/XZI0CgrUXyVxg=;
 b=ACpEK7LUWw/mZwlhheI1qNjkVnR4B34xFmbw31vil9GV78jVWdQ2jIXR0z6zXBcKu0
 C0CTOJf7uHr1WiPXfDctfClCAZT11/n2friG3UlyfRk98rpyF4K/h97kEGC1AIth3v9C
 GfwkEIHyZx5c36JEFjn4pzyLZdolNW6wJnKaB9+WQwLzL1YxUGoITELVQPbBguNvGk3d
 lgw4GDJ3M5zCeXrRiVqaskIg/bMZzpTFwf50i5AYa7IdA6IvEraO3f1c6XgdfURlISPE
 wc1uugx1h8zdIp0iEkqU0WntXx5qHGl6dLYkXOlpM2zo6toGbI1ibs/sjlR+R7x2s/5F
 AZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k9p9CBlxkeT7UOqovLbboAwo48ySz/XZI0CgrUXyVxg=;
 b=d6rwAvUWqMCeyQbBfWzVE/1wWTUZ69OWKvRm3SF6vXJbc+m0Ib+Uq9dy+1rNF8m8L/
 DCDhvjJwVBESi6Ugc4SnNTyU7oHcPmZjH06HxQUXgjS1q2riF7SOXeAztfboVrUBRPBw
 b/7aH8MNnkcfjLg248OF9qkd/P8Qv30maedZJCTZqJF39RugjL96xrpC/dIxD40rwMuH
 cpAAsqQRqJ9Uo6xquU0MEtUyB+fth1KKSC5sXXpCV6BfU7el0v7sxQwVbQz8j5SnRCS6
 +695vK2TvFMKQVR3ZlHM7Meh8b4DOquozPW0ESYwNMDK5CORHHJyFkk95PZS846e2+Ib
 EaTg==
X-Gm-Message-State: AOAM532AEViESx78XwB29fdTzJNlHJIXBIsVZ4f8BTkI/uWC8oxEvqPJ
 Is6cUxYasCoFVY/QFvofUNVs0A==
X-Received: by 2002:a63:4f59:: with SMTP id p25mr5001131pgl.335.1614888287978; 
 Thu, 04 Mar 2021 12:04:47 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id i11sm230936pfo.29.2021.03.04.12.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:04:47 -0800 (PST)
Subject: Re: [PATCH 22/44] hw/arm/armsse: Add a define for number of IRQs used
 by the SSE itself
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f27f0f65-d384-4bca-282c-bf13ff455c9f@linaro.org>
Date: Thu, 4 Mar 2021 12:04:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: V24AL5DVwAXU

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE uses 32 interrupts for its own devices, and then passes through
> its expansion IRQ inputs to the CPU's interrupts 33 and upward.
> Add a define for the number of IRQs the SSE uses for itself, instead
> of hardcoding 32.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
