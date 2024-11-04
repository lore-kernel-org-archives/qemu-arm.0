Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2005505njc;
        Mon, 4 Nov 2024 02:24:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQygL1ng7wo4r+fKZu3vYG3/ByUnpCJpcnKKdQLKREboBxRcwQm7/3ovsdBrUgVZQx8M466BSGIiSZKw==@linaro.org
X-Google-Smtp-Source: AGHT+IGw/AzFnzu6c9xTypaugpOReVHRnkd/NiNMLcZjV0f17w1+2sMkBDoJ3vwyuDR9b4c2E7cu
X-Received: by 2002:a05:6214:320c:b0:6d1:7319:5f74 with SMTP id 6a1803df08f44-6d35c0883b4mr159372096d6.1.1730715885700;
        Mon, 04 Nov 2024 02:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730715885; cv=none;
        d=google.com; s=arc-20240605;
        b=ioHZffT4HXFvMf3a/KVGa6wiSPI4VbHqpyqZjGgzg//i9Z0Dg+KlxF8zRCEdmHprB9
         4/7FqwZiT2ia3bOnJ31aDaYUHtJxoPQ9DiJ1geOU5fWFf55MOVxbvkogVQxx9rTWw8ni
         S8EGbsfy0UYacgs6alaleTi+wlYbTv3xlvep7eypl7LXsz7Blt2hFR6lqb2BQPnP1SSh
         O+9cc/OLtdByM4pv5giKeb9qI8HOr/Sm5UlfqsGy2+j5zd7uhJC/FPsa0091SWpEE8WG
         rvSxv3bEY/4B0Q+ybOVnfrhOCBSsloG0CHI7EnUhjSyc4MO1hPir/cNZ66jRjiRNj0s2
         qgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XaGIoCMH1NOoXkHuW5VAXIlTmI5m0h67iZJQ9SupAs8=;
        fh=qLgsNz/EcRiU5nQpUbYa2f452OUQ3xvtbIllmtebyOY=;
        b=IaehGG1B+U6W2pCKHbJIVIZxyTumnTAyX8I3NdEZlJ/tvM8kWP49Gk3eHmgS6f5lOJ
         sDDlQnf4aXNRwvuyUyOd76XwLSXXX/IB8UDpS+Bv2JpijAaoRWQScmciPjxsknofAFVY
         yxdo3BM1UZsN0jn/vA8wn8vstKeKWgk3aO79T6dzGWpPQQXkZEGXPIA+Jg3DfRfPiPcq
         5rp9RWVeDq8VQuQICSY7lUZpYvT1NOrtl/wqa504EqiH5NXiO8qWjGhMTDW8LcfIZM6c
         3tQri+whj/Er27oh44W4WLCz+tNTc1eTbjeW1IuVjp873DKDfRzB6LLph0VAAPZ6nj2e
         S70g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xafiLtdW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3541c2c74si112636006d6.565.2024.11.04.02.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:24:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xafiLtdW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7uGG-0001jw-Sf; Mon, 04 Nov 2024 05:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7uGF-0001eR-2k
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:24:39 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7uGD-00085v-CV
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:24:38 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so49307025e9.1
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2024 02:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730715876; x=1731320676; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XaGIoCMH1NOoXkHuW5VAXIlTmI5m0h67iZJQ9SupAs8=;
 b=xafiLtdWD9NK1Zt7AsaT5p9p1E5OYfWe40Nfb9z7PCLNjKW8R7hqH4e+zLp5N4tj9v
 Q+vRF/zxtPQZYmWwjUTXkYufpKWBroMVWp45DZ4UirW84gvklQwcdm82hAjdSaKfj061
 0u/7SihP9+Pb0t89ntH2kH1YXPK8ryFBxI374zhQVSHqDHew897SXKaZQygzc6+6P4vL
 rYFz35DdI7ctUlQDsUJ5XU0/XfSIccNtSabLCXRPvtpDSSgorAqLTTeT3JVuwinGg4WD
 5ZPUATDzh/sqBgDu6ERqtyBDxE+EjBHq82MQl7feBjPmqPl3q6URu/BVIbo1KgiNsjtJ
 +ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730715876; x=1731320676;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XaGIoCMH1NOoXkHuW5VAXIlTmI5m0h67iZJQ9SupAs8=;
 b=UUsTLTzjPRtu0Adt+dVann1CeIvxgmk94PY/krQrWeuPhVtvHdqRoE3X6DPoCzAWce
 ZDulKA85dKC+ybA2uTrpkqA+kzd0Q7SMWai9gxyJqmK1aVTtHJ3qWNnECE9R1oG6CO3f
 GRhRd5nYhOAit3QVhf168RIOJ/bZagWNEHm5i5xiZYDCA8kfH4wOoAFQDTuswdu646pB
 6TnCEo3fmWbkZ/Esl2JwQ/nM682Uxcf6o/nvz3xa02HOey10W7GKHxi7K38QjYXm/2tr
 n4NAFANRlLMAqYVAP8byjtxhivKHXEe47e55wXIucVFiOo+N3Q3YntER3OwsRgkb/gD3
 dVMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPHsZa2c24rmDVbWP9+1u7d4Wr2hYDxwppVsl8R/Cr8su0f/E5If609NDFXi1OEWLzYgexL7YnIw==@nongnu.org
X-Gm-Message-State: AOJu0YysbtosMjGfaPL2CqabZkb3JXQEw5Bgd+GdDhrncJp18JrRAiBa
 +cE6MpWuLdNEGIljEplvg3ue7Z84AHcn96HnB/5opN+Jnrc3+qeVFv/xS9Ek+uI=
X-Received: by 2002:a5d:47ac:0:b0:37d:48f2:e749 with SMTP id
 ffacd0b85a97d-381c7a4636cmr12352536f8f.10.1730715875654; 
 Mon, 04 Nov 2024 02:24:35 -0800 (PST)
Received: from [192.168.69.126] ([176.176.145.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7f80sm12867621f8f.20.2024.11.04.02.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 02:24:35 -0800 (PST)
Message-ID: <746d1fa4-aafd-415f-be67-94a7aee0b9de@linaro.org>
Date: Mon, 4 Nov 2024 11:24:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/arm/aspeed_ast27x0: Avoid hardcoded '256' in IRQ
 calculation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20241101161125.1901394-1-peter.maydell@linaro.org>
 <20241101161125.1901394-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241101161125.1901394-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: cpcxANZXaFbG

On 1/11/24 13:11, Peter Maydell wrote:
> When calculating the index into the GIC's GPIO array for per-CPU
> interrupts, we have to start with the number of SPIs.  The code
> currently hard-codes this to 'NUM_IRQS = 256'.  However the number of
> SPIs is set separately and implicitly by the value of
> AST2700_MAX_IRQ, which is the number of SPIs plus 32 (since it is
> what we set the GIC num-irq property to).
> 
> Define AST2700_MAX_IRQ as the total number of SPIs; this brings
> AST2700 into line with AST2600, which defines AST2600_MAX_IRQ as the
> number of SPIs not including the 32 internal interrupts.  We can then
> use AST2700_MAX_IRQ instead of the hardcoded 256.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/aspeed_ast27x0.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

