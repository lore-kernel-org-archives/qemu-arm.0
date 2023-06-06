Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3534862ejb;
        Tue, 6 Jun 2023 07:38:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4poEwaUwAiF6bRMjg8v5wW6WBb6SYku7izXZJelK0ZORXrSADo5Lx8YauPDXTk1CN0YjHk
X-Received: by 2002:ac8:5756:0:b0:3f7:fac6:e3e4 with SMTP id 22-20020ac85756000000b003f7fac6e3e4mr2908438qtx.66.1686062282361;
        Tue, 06 Jun 2023 07:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686062282; cv=none;
        d=google.com; s=arc-20160816;
        b=z5R1oFQVSNd6ejJMon9HIpnIIGxjuxUwCRvuUNQztwhlFwjTKEHIV8Xw59/7ZzFaHI
         ErAXWV281lobM9lK80A9QqwGN+KHzbdnPo1gZnHj8BEe9PPBQyivM95AnSAtg9XxX9Vx
         ToEvMqCMHmwDnlpe5ONGKgO3uW72LbAlKBw/B36GaLRZ0BYzbINoaVrEA9FZ6aH4X0aJ
         SWg7n42SATn4YY7rrLasDt9N9T8rG5tQZ6f2d7Tr8sBmInwzD+hxgHBG5zUYTdsARYGN
         mKK2WYy6JOkU8c20RsQ8I9II35g/DbrfobqW51RrFCdw/5d3pknf27dyjmbD3jereSXT
         zO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=n8R5f+wVeYyyOX5s3SzQiZsALWUytR5XYy8E0V2grN4=;
        b=u6HNbmriMiBkLWx67UI7Q0q8b0N8U5/b9R6MFiVwdvyDfqMX4PHLT0k3zXhzxEI60B
         RDzfJyE32OzWPWKjqCacqxF2R6rNJ9jDnOBV9SMRHpr8ShUII+vtAx9d+I8ydivIkoRk
         m83XVy9tB42Z4P9Zia9JkKuBBqzJR3Ey5BFvygkULo7XzjnEdVvm41CFYfKOd2OCC/vP
         2P81jo1Xg58I5tPoliIJ6v6Ml0EkMLA0asXB3GofZzKajeN5byR/ONNHdsg8xBCaHswc
         TjhR46dFpTRxeHmPBdDzktRxdapGkFnEWSxoVscF11qtA4tSgJUdvAfkLaX9Tx5nOrIw
         fR7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsWGqro9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp18-20020a05622a1b9200b003f4f386bb1csi6083385qtb.459.2023.06.06.07.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:38:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsWGqro9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6Xom-00022n-Af; Tue, 06 Jun 2023 10:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xol-00022d-Nf
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 10:37:51 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xok-0002Qt-5n
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 10:37:51 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-256422ad25dso2752770a91.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jun 2023 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062269; x=1688654269;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n8R5f+wVeYyyOX5s3SzQiZsALWUytR5XYy8E0V2grN4=;
 b=CsWGqro9y9lTrrbe306ID4ST9FD2F020//U8+ba/dHouLkA/uWHkul4OQqQ2wF87k9
 5Z6/5XEyLq30pq7wy2XXitoZExPplNiHMao2eZauKFrBcVRzBjgeEQv5eYOLr2A3Pdvx
 ltPNiUubbohL1cS436rOr2u5oFfdUpDWSyWrGBCL62H0y2odiQqRNEkYx6uJ4/lFLS+p
 m1DD7Mm9haPkKsKck01nh15KgM44wY7XYTqdCZHYvuni097/9uWoXNyqM9YpXZVfaGTy
 7Wjmmm51QxFpkEV7gTtRXaCnlwwHrJEzSjXcU3FGY3Ju22uuwrLUwFbevhOo/2OVWNMq
 7YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062269; x=1688654269;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n8R5f+wVeYyyOX5s3SzQiZsALWUytR5XYy8E0V2grN4=;
 b=He6Svgmtm6x92tjUr0niBzwdDuQFvhYsgBcLnAxLafWKAUe63IDYiM6ZnALKZsi0Ob
 yPeSh1Cjmic2ut+j+e3tpjdUfGexbA3x4vgfQYYKGhbgVdwMn1xu4AJ/8wbrPQAGg9xy
 6A0lvqHuQqXE2WjBW8Ae5sVlmQsrTNmA6lRYyoDj3ojh05gzVCnCqgfeaMJSdWxQKXcU
 ZUxh68Vh/aF9ezM/WA2erCjJA/64ng6ayH3GU4/t6XpuHzdMsmMhzGcxK4v/mfKRDnez
 ngPwEBc+zPWCxDuNoNwYT2pQ+1SDGeKVTXx7xnmmNsLIDy8AqCZhffef6TAxZGpsSfb+
 LtfQ==
X-Gm-Message-State: AC+VfDz29d/X7labaJR4oC6XYiFXUbEs4aSXJeluzJR3dVQDTx5X3m6b
 81JPZzjH/rF0Ih1RVjx+FWb9DA==
X-Received: by 2002:a17:90a:51:b0:259:3e26:b5d9 with SMTP id
 17-20020a17090a005100b002593e26b5d9mr756955pjb.2.1686062268718; 
 Tue, 06 Jun 2023 07:37:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 ch7-20020a17090af40700b00259b2a50a41sm238105pjb.36.2023.06.06.07.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:37:48 -0700 (PDT)
Message-ID: <9ff0f082-1b04-8bf2-6a97-1e9220aa4509@linaro.org>
Date: Tue, 6 Jun 2023 07:37:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] target/arm: Rename helper template headers as '.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230606141252.95032-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: ngpaIgMDrmGH

On 6/6/23 07:12, Philippe Mathieu-Daudé wrote:
> Since commit 139c1837db ("meson: rename included C source files
> to .c.inc"), QEMU standard procedure for included C files is to
> use *.c.inc.
> 
> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> about includes") this is documented as the Coding Style:
> 
>    If you do use template header files they should be named with
>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>    being included for expansion.
> 
> Therefore rename the included templates as '.h.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

FYI, after yesterday's tcg pr, we can do more than this.  These fragments no longer have 
to be all included into one common helper.h. Each translate-foo.c can include only the 
helper-foo.h.inc bits that they need, and the bits need not be visible to the rest of the 
front end.

It was something that I had in mind when splitting include/exec/helper-gen.h, but the 
patch set was already large enough.

The renaming to .h.inc would have been the first step, anyway.


r~
