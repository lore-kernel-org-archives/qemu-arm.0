Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp134355ejb;
        Tue, 5 Mar 2024 13:44:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUa4CuVc14mk4v+JcU3RG/Y1vFELNhWL9lDRwcikcxRhLhDUBQbFxr2D8IMzS5Vb0wO/OpS+D2gT6QduzYP6nZHq0ZHCR5q
X-Google-Smtp-Source: AGHT+IFBwwxLfjmZlqsOXPnhNScacMRifewlE5Ko/TesWVrXwfphjD3GOYAOlI7bKpSePCHp6Nf8
X-Received: by 2002:a05:622a:185:b0:42e:f01e:84a5 with SMTP id s5-20020a05622a018500b0042ef01e84a5mr3208143qtw.67.1709675059002;
        Tue, 05 Mar 2024 13:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709675058; cv=none;
        d=google.com; s=arc-20160816;
        b=K8gVIWsC4FD6Dqo3nO0WJm1DqKkgd3UF5t0zPU7CQCqrFkfsw7ILn+LgJwUn3mTjsj
         QZapzSsrSECTje4j7uMhRuN628GGdDJWwhGgm1Ru+kZifT+VS6AO0PbIX0V3PR+7tvXJ
         Qzjuc7VixM3RWcNrfPI64D8Q8VZgWY6ZHFG7vLSeQIuapxk1Mr7hO40duZaCEO5PFMWh
         8tQ8YIP19qWqRbBErDVioNF0oW6SaEQHbWX2ajPfBDtY2zB93e+AWxqhWqnzLK8/C9rA
         ZHII/pmM4859h+ZBsOuCGLtReZrDCTg++AHX5dUmQvG6kH06nyuxJF9WZNmyB4SRjzvV
         0QIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=seln4mZwZKAA0rDljnl49I3AjYyj1ir4LONKjZ9An5A=;
        fh=ly3kn0FIMu+ZdLrizEH/IQ7NE1ibl2LSEA1d1JXcMho=;
        b=kEX49cqAf6zsKe3xNKsimIBdHKRoN8CAPWdRWuql+6CqolQ0eJE7LK6aZpWo7Abi4H
         2Q0uRKCWL3ZiUvZU9jkRZP3c0gSXtPawZ20EW5X1jqgrwvSDTnU9O2ZKhREW084PlJE2
         T7+HpLdJyGcCU6PAQDUVVkkL433gpn7GDhjYoRFknC+kX3yR22aqzJkBxwmgrFXBpG2I
         fFz/malt9CBaHBKTdiYYtNPq3bioUtUfIFIxLj6zU1CQBPvTrVu7jGPjXsXClGAiBVVw
         WEXnMZBGATrVY6/oeGCx89xFv1m80ZhCxMote8wZ08iFiAKVFo2NZz5u6luE7UPesEIu
         /jzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kx/ri0wr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a05620a28c500b0078825022f58si6953578qkp.453.2024.03.05.13.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 13:44:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kx/ri0wr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhcZw-0007To-9Y; Tue, 05 Mar 2024 16:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcZu-0007TR-BO
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 16:44:02 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcZs-0004jM-QB
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 16:44:02 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1dca3951ad9so2753755ad.3
 for <qemu-devel@nongnu.org>; Tue, 05 Mar 2024 13:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709675038; x=1710279838; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=seln4mZwZKAA0rDljnl49I3AjYyj1ir4LONKjZ9An5A=;
 b=kx/ri0wrq6JsklMPC5bKv3Swth6j9I36IKzig/yrtx2t+PF5LH/iHE+TTZas44cYGH
 JpPv75XrOOHECtUglGDqQFBUvwoU8CFtl9SPrGE9SqOgctAoK9j4GtFBg23j8xOax0WY
 AdjDtP36x3vdRHt7oZf0XCS6K8AZkCdfCph4UThL1CHCEGNp9YJLF59lIq5e7Oh4+svK
 xSRdXUZunUDUW1y78r0EkafyKiFrnfbNQk3xuh6yOWRX7qlVPjRu+fV3WJm6w3Bqetu2
 guYgPXqr651AJDvKqRn44BnR/7zcT7+/I1O7APewgIE0TPzfy+PCAeFjUuclvPb+d0+u
 colA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709675038; x=1710279838;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=seln4mZwZKAA0rDljnl49I3AjYyj1ir4LONKjZ9An5A=;
 b=kfuhKjGyN1asPVv2Ihh+XzDJ2yKrVz6QNL9260lC4C53tZuzK+wZjbCJDV/9B7Fpmr
 RI/34eYT/V/upfs0/RpXWN09XZaHFiupbL6MNWqmMjvYucZEp0nqvafUkc51kO3gbfS+
 eXuTcA6ElmDvQRwCbUSDAdyrlyOY/T0QEYOTd5VXNy4tyfFZmcz3OiX4R3TxR7yKGEQ6
 +6F2aJpUng2y3tsmp+zTLEmztwnDUGkSWenhGgRfqpXoT4K1zJly/5V0JnnikNafAl6f
 4uVmSEQ3SQxvcNhMtwmzDffAhQsn8aiBStMIbaRc6daVw2jwzND5VcTxIIhTIlIkjcd6
 LsgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZnho6YypMnPWC3imVwnDAdkj1ZPWbNwjgYuLEShn8B79PgZT6vnZruzSn11bKC8wF7anVUGJEN7uNjregw0pRSLrOXOY=
X-Gm-Message-State: AOJu0YwPRnpXWgWdte7sWO1OeByUANVEkswqL6gYv3wen0QplRSG+hhc
 RuKSVsTIXw/amLaM0GhNObdjJ2MkrjWjA+4bWL0Q2D/HhsSHngpoIspVA8Mj918=
X-Received: by 2002:a17:902:c1c1:b0:1db:dd24:9940 with SMTP id
 c1-20020a170902c1c100b001dbdd249940mr3188573plc.40.1709675038281; 
 Tue, 05 Mar 2024 13:43:58 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 n4-20020a170902968400b001db8145a1a2sm11074557plp.274.2024.03.05.13.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 13:43:57 -0800 (PST)
Message-ID: <d7f0144a-07e7-4fbd-8558-ccc443d1f9e9@linaro.org>
Date: Tue, 5 Mar 2024 11:43:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 12/23] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
 <20240305070331.2151131-13-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240305070331.2151131-13-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Q9+ub5J3gvXy

On 3/4/24 21:03, Jinjie Ruan via wrote:
> According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
> with superpriority is always IRQ, never FIQ, so the NMI exception trap entry
> behave like IRQ. And VNMI(vIRQ with Superpriority) can be raised from the
> GIC or come from the hcrx_el2.HCRX_VINMI bit.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v6:
> - Not combine VFNMI with CPU_INTERRUPT_VNMI.
> v4:
> - Also handle VNMI in arm_cpu_do_interrupt_aarch64().
> v3:
> - Remove the FIQ NMI handle.
> ---
>   target/arm/helper.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
