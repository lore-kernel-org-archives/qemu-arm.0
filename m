Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4128137ejb;
        Wed, 22 Feb 2023 01:47:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8Vg0aMaJU04972d0QZZyA6LjGTYlgcSB0AmkJHGufACtBkbfajT4CQZCwxZIfDuVbUpgtB
X-Received: by 2002:a05:6214:da4:b0:56e:afe2:ebca with SMTP id h4-20020a0562140da400b0056eafe2ebcamr15644429qvh.30.1677059220836;
        Wed, 22 Feb 2023 01:47:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677059220; cv=none;
        d=google.com; s=arc-20160816;
        b=Viog5VkyE8n7Z2krszzPKKbwWQk5+tchNu8vfS9zrIjuJ0aUq9a8wwHLoL5Zde7X2V
         BVA8RXk0EAwDyOiY1kFQWJKwkFbWoyu9B8RV0D/Cu2XZAfd4J5yMnGkxAK9pEnj6owij
         Kwf7KYCl5Cmss+JQCGSE/k4JcRqTMNOze2ZW9WBh1Ha74E0XSuOOROvY0QIaG+yRQqIg
         kx7wPPEPCnBOqVzTmvom+Cus/crl/slyYIaKNo6k5pKRuhwdKi7a4R6TwPRt3biuVB9w
         kTs068XHGbl4doBstfmxJHGsrJOdNF5mdl0/4hFoOBclukDvnfyBPURyi94QlqV/YFQ7
         pRkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7EwL3nzxhbctKAVyGXChwEVG4p7ltHn8u0EXdYYsclU=;
        b=MwnNQc4wYQRZNCABdpJ7mhW57os6WqXoPEjhGSCwpR3FmFkrZO0KPgOQGtWmtcB/YO
         a1SIBY7dXgEKaw2GtB6IgABm4XoJCZSWrEdi6qKwDl+V/Ih6yxj+t0e7T7a8BRBvk2a6
         l+dtT0ZqQZfgX1qJACOi8wD6Grfnp01M8cRGtD4zw2lnT7XiZPWaGffP31elq54NWibr
         +b0n6phN4Wc6fEcfY1ODz3i4dCrQBQhW1896VmUFZdw3dmYh+SKYMWiMc+RQDOTNm223
         i4yu4iJzaJJK7d7raDn8JhO8oYtMVnJlrqkoLoJsvSHu5pu/5cxBeLG88rwkaBRc4CZT
         188w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W7Au8cRv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a0cdd85000000b00538bd41674fsi14292654qvk.206.2023.02.22.01.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Feb 2023 01:47:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W7Au8cRv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUli7-0003XE-AX; Wed, 22 Feb 2023 04:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlhz-0003VH-U0
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 04:46:46 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlhr-00039m-1J
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 04:46:43 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j2-20020a05600c1c0200b003e1e754657aso5766100wms.2
 for <qemu-arm@nongnu.org>; Wed, 22 Feb 2023 01:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7EwL3nzxhbctKAVyGXChwEVG4p7ltHn8u0EXdYYsclU=;
 b=W7Au8cRvabFbUJNbJ5YobDcO1z5csUOFyg0Bl0y6h1OWJf0aFa9yMXPqEkgJzkD6tz
 LImVubqA8uHCtUQwhkvvP30CK1ivkG5HFGUINFnBlqIatSZ37brx5tGrmiow84vm/jeS
 MNXzOikhqicAZTv4MN7jIHLNqUpOR4dk4YqFQ6MRkoFNfK4PJUPNemhAsDeuPFfewzQX
 J4aHO8Lax/LZdYKmo1mIYZzZ5aCYfl9L/EnIYRctLkzBqL5mg1OCwDXT4+AmF7LU0epg
 ua5/Aim3+DKFJmu9h744asiE3+WhPgmVrvhi5uRN0X5KA0Inq4oAGcgV/36N3Ep15H2M
 mZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7EwL3nzxhbctKAVyGXChwEVG4p7ltHn8u0EXdYYsclU=;
 b=LX1LkiIQHZXghf3ULVmYhf4R5ceUUnrRPoc8dGqe+wsFQ46Y7JqPz0QzYMNf8qh6Oz
 8I0aJFNRacVjBziG9uWk/dTrf7fn7jNmoG4X1BPwaqs7Gob6fDRdnxnRaMqp0OtfymQS
 HikoHNnj2M1zW56f81JlLbPsaL4oCOiDCrBQatCWxG8bTDXyxfTgoZ3bnL0pnhQmidBW
 5YHASWC9hbWuUNquZtJrNFxuD1QAQr8F7YrLLUziZRNXLXwLTjirDz6FDNGMi4PzX1eN
 7Ry54OwLo8G6GJ6X6R1EdSGhsyXCNTDeXymrvkKovkfQxy+jUtPhZTC/lFAQx9jGSANr
 5+Kw==
X-Gm-Message-State: AO0yUKU4bSX/uucD6+45gHcg3MCOM6bx7XOHm4eoAMM7CicrvmyH3dld
 FkVp6drOJ4EYj4MNt7oRlFqxvA==
X-Received: by 2002:a05:600c:4495:b0:3dc:5a7c:f8ad with SMTP id
 e21-20020a05600c449500b003dc5a7cf8admr592744wmo.21.1677059193300; 
 Wed, 22 Feb 2023 01:46:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l38-20020a05600c1d2600b003db0ad636d1sm1309693wms.28.2023.02.22.01.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:46:32 -0800 (PST)
Message-ID: <f4f7a1fb-4812-e3c0-186d-7abd4d6813c6@linaro.org>
Date: Wed, 22 Feb 2023 10:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 19/25] target/arm: Move s1_is_el0 into S1Translate
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222023336.915045-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +eVtBKypwP7p

On 22/2/23 03:33, Richard Henderson wrote:
> Instead of passing this to get_phys_addr_lpae, stash it
> in the S1Translate structure.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 27 ++++++++++++---------------
>   1 file changed, 12 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

