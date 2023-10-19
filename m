Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp813697ejb;
        Thu, 19 Oct 2023 14:50:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2Dc/BEqlR8jN+EMHclUr+sw3CFUqulUQihCp2N7V5qYGrmObS0026/Ukhd/kJpmETLi9O
X-Received: by 2002:a05:620a:2484:b0:773:be19:dcf with SMTP id i4-20020a05620a248400b00773be190dcfmr3860749qkn.49.1697752224585;
        Thu, 19 Oct 2023 14:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697752224; cv=none;
        d=google.com; s=arc-20160816;
        b=W+o1K+oHAXIvP2dG2yowens6KdyC1E61AC58C5VqWR0k+X2gEa/ipNb67wYiXwP/In
         utq3ZBHvs0MfO40LPJAc/3aDiVlm01MYZSiyoFvelqxb+Srii1fN88NiWafjDRFb0/TG
         LpzO58i2zNadhcNHH6mksJFNcl8xApK/0NRMHPLElmSUCXdhsXjvox7X1Ea1OfUDEv92
         4UFEVSXZnKk8Z3ncLOuFuQqpsOU/AKmRiSCOmTg4oU3wx8ueTmEmHuSfPhUXBhLpae/k
         qShri0uEmT2VYHhuB4fEUwDwc6caBvgIdMbYHS7AzmXQQ7NQAQ3bw/EuESLrnWMsUv8x
         T7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4acFqOqly6NUIH9JhJu8596xse4FMCYmOHaVcVAthyc=;
        fh=63fuqXWdafnbqVGIWl8IQUGmwh8qKCI6VosO+FSh+Ss=;
        b=N15vvY9qkNAbV7FBDrUBtHvCk98rZpGa/uHMlTKZJSRRLe1juLk/lc9Cj5yrWXvGwK
         QmNnkIxjVTyP1UHc8Sc0/TwaHkw0qGkHwPZ78QAM45n/k4cVaQQNORpd6pNvPUphbjCE
         Zgr6Jp2d1dBgY65uY0pc6zmKlWv21z1MZ5iOn+Yj+39ADQFqw7VpCd8rVS7ZVpsyXN6t
         /gnP1EqKx8oCxCtfBYtbjHawC2nUPoVRK16jdHQznnbK1G4SBSjL53RL0nCJi7xUDLvF
         uKfGNLe+13uK21FRR2sW8+exlMj4DR7rIIUugAgsvgSaDO91UpRkrqqtEz8p5WnOYOG5
         82+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZoJOj1Ld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020a05620a144900b00773d05a1403si268180qkl.542.2023.10.19.14.50.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:50:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZoJOj1Ld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtauL-0003M2-5b; Thu, 19 Oct 2023 17:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtauJ-0003LU-Mm
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:50:19 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtauH-0005Fr-RI
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:50:19 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40651a72807so1155525e9.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697752216; x=1698357016; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4acFqOqly6NUIH9JhJu8596xse4FMCYmOHaVcVAthyc=;
 b=ZoJOj1LdFWOxJFCOpgAKaKSsHmmqaEms5xxEg7mpy4C1wyzVTOhILamA0BRMePErLP
 EY+Tm/VwtkZVw6b/wKiUYBGxMSvqmYucFhQZsg/WCl0htXvK+5bbzFa0KAWIgjxgWJ/Y
 QQwaqJk2y0V9YKc1y9ibWxHtHJdC33D6GFNgQ2OB/JdeqD8eyDA/TiH5qGvZHcjrzt9H
 YU/CR9iYVlSdoISC/pmmS0iIaB4/iDfJ0oq+1VMGV3NZy6LCVrb4ZBRblKXGGyXqQeOM
 bPPEDYvfZlm2+8+AX25pemce4uEYin2AwWym8bjsreG1nRFDzTN1g6/EUsNq81ELh/PG
 3T8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697752216; x=1698357016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4acFqOqly6NUIH9JhJu8596xse4FMCYmOHaVcVAthyc=;
 b=efDST+wHp3EvHvi7rx3ZMU4BFCSClzn1S4xGoCGL6MOMf3qFSYRZsGWB5YXW1bcmOv
 inR7fKVWB5VeR508B99rYLcnKQFBqyVOfGYTXeG6Vy+LFo2jEElZT4eV0D6q2fo2NvW6
 z7ZUS5yspPs9HN9YpM5TI1+espMF44lHZJSyTFNZ5d1E1fYqlc3mjXafAwqBjA41/VCf
 TQ9G1TEwzXtw73+BEV3HdtRgOO3jSIZIt2HG6jH51lxCAK75NZW1N6XyHBZJA0sn8IoU
 BfqK0Due3VcBHGpCFpKHYwFQLwsg4LrE5eIMdyTNYGzk1nbA1jxPS/7vNcIHjXUkGKMT
 vw6w==
X-Gm-Message-State: AOJu0YzgsnOf+525At6W+qAddI8ISIwtLsn1I/qj4ODZZ02x7I6JwdLY
 wvS/ZTPfdATDgSOD5yCliQ/IGA==
X-Received: by 2002:a05:600c:4e8c:b0:401:bf56:8ba6 with SMTP id
 f12-20020a05600c4e8c00b00401bf568ba6mr75930wmq.28.1697752216222; 
 Thu, 19 Oct 2023 14:50:16 -0700 (PDT)
Received: from [192.168.69.115] (176-131-216-177.abo.bbox.fr.
 [176.131.216.177]) by smtp.gmail.com with ESMTPSA id
 g38-20020a05600c4ca600b004078d71be9csm5285343wmp.13.2023.10.19.14.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 14:50:15 -0700 (PDT)
Message-ID: <8b6e38d5-ebc9-e2c2-327a-ded3a50d8a51@linaro.org>
Date: Thu, 19 Oct 2023 23:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/7] tcg: Export tcg_gen_ext_{i32,i64,tl}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, laurent@vivier.eu,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
 <20231019182921.1772928-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231019182921.1772928-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: SwXUfVgMh4zX

On 19/10/23 20:29, Richard Henderson wrote:
> The two concrete type functions already existed, merely needing
> a bit of hardening to invalid inputs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-op-common.h |  2 ++
>   include/tcg/tcg-op.h        |  2 ++
>   tcg/tcg-op-ldst.c           | 14 ++++++++++----
>   3 files changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

