Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp648944ejn;
        Thu, 20 Oct 2022 15:48:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Hnr1kJ/GRHoFUQ8W/sqSJAsO4oZoPzkDXSMUTsD8IHmd4Y8+e3f6eiuEI84hV6TnAIUmQ
X-Received: by 2002:a05:622a:1ba7:b0:39c:e770:2809 with SMTP id bp39-20020a05622a1ba700b0039ce7702809mr13477412qtb.423.1666306116593;
        Thu, 20 Oct 2022 15:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666306116; cv=none;
        d=google.com; s=arc-20160816;
        b=iYdPEg4QyPEv8NNjt+XCWSf9xhbqoSMWZ+dg6mQJof+nk6Gv3dW0jg+2n5+1molQzB
         1vJ0rkRbjLcmz7e++Uyil9Tm4qE5+uJhcECxWXBHQ3wLkr0pjMYn/aCFHF9ekAtvB2wo
         lR1ogiLwJ7qSbRMgdaIAjY7kL0XR/6LtlZmQt35BIY5skZ9GBfbh7iX8JhZtNAsZvf7I
         CIvZ49M1HACovUGzCclx4BdfSCs25wpmnaDCBLv+xdJry+cXUFYStizsnZqPaTXLhpem
         jJR0mYcEieacKFwfRIDavR50anE8+yugkMMgwQz8Vbm9K5wzHxqWc0AEUJe5wbI0UOMn
         k6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QOijmtpVeb65TK7BLzCuibCE8xCtwjuUc6Qwkb3WQIw=;
        b=y7K/n5whh4j2PTxEErkRnKO3czNs8lbYvRLJpJZJP3ioKiu8ITJv+eIwXzuDsJub5x
         jipoo5ZVXzjWeSWVEZS3Q/cxBAPFIrWJztIMUznxsQBf7nEGRNxHESQByl1AO03OWCaM
         Ob8NaeMNOLQOSpP5oobRHxHS08Q5ix5qznwj5XFvFBar68gYLNKIMF1P+en2gwFTsO4k
         1FMvybohYCzJ1M0L81xieaMsqbltWuAPy+82z3/QbRe9yQ6w9XL1cS9/Uv5Si325JuCJ
         JrLev3S3J6AnqLBfcO+MWcnURav6Vibb0Vrwf625ayLTVWj17W95NR3SvTZ/j0LRbnQd
         ZdLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y6oD6Zs8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05620a455200b006eece57798asi12522872qkp.664.2022.10.20.15.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 15:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y6oD6Zs8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleL6-0006Po-1h
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:48:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleHM-0000j4-Ud
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleHA-0000cn-2U
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:44:36 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleH7-0003ev-1R
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:44:31 -0400
Received: by mail-pg1-x52e.google.com with SMTP id bh13so886296pgb.4
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 15:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QOijmtpVeb65TK7BLzCuibCE8xCtwjuUc6Qwkb3WQIw=;
 b=y6oD6Zs83fv+i+qdUfVuql5z+Vzx9T5m006qW+egHjT7b5GUNP0+kD4FltghyFKqyQ
 jZr+asGHoPXSE6wLvC7RT8MdM8V6eVQf3ku7edzY/EMKNs395HkyAb+O6TLO6q7VDd80
 hXBgENfQzcGmA+3Xqh3UquumjTAayS7kIrR7LFkZRFJDNli/PakSo0OuG1ECyqxgQRfB
 LQ9hRJawdVI03xEtcAB5+zVjBrhe2FacVsbKE6VGIa8/oBFO+WeM30GA15cLob0jRiUz
 qOKmGY4jb6JLo1F5S0YPdcBurOT116MA9ZGw6O48qIosG7IsaZ9rIHZW5mCEDzmGfR4t
 RvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QOijmtpVeb65TK7BLzCuibCE8xCtwjuUc6Qwkb3WQIw=;
 b=q6sB5I8XsRbKzlz/FklaJ4PRRwC1orDnPJe6EqQ7tFUvIXHsv5YMr1Dh4UOgXJm57V
 wrHdxSh2hI+b54gXQjiMWuf1et6LV23HHzPqAAWvVgEffbyf6GzvZOF641PbivZ1foBY
 Bm1RC2tXRwylYIMvIiXrmN3aicwidcnccNsLAWMrkX2CQh9tx5Snl/AsN/NgdWBWJPPv
 /VcseFgX0opiAAVySQkBSBJj259Z5MDVv6Mriaap8YaY9P3kmwkAScNJSrz2xnGdS7Ch
 RJJr/pZfBH5dsh1OghKYpHMxq1WOiU8pJXReuoZLQeKroux/JSWun4ZTaYGYj+bjJYJQ
 bEWw==
X-Gm-Message-State: ACrzQf3rVWpTn5GjBK+Zi55/UyIqa2UH/3X3Nk+SvmhV4gnfsnScdhow
 fYs0rTK0aU7XTSlNrknIIfLZqAlWzPLYb5nt
X-Received: by 2002:a63:fa17:0:b0:43c:3f26:48e3 with SMTP id
 y23-20020a63fa17000000b0043c3f2648e3mr13627384pgh.66.1666305865982; 
 Thu, 20 Oct 2022 15:44:25 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a17090abc8600b0020669c8bd87sm312673pjr.36.2022.10.20.15.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:44:25 -0700 (PDT)
Message-ID: <ce5e2852-3a85-1ea9-c537-d04aef4b4aab@linaro.org>
Date: Fri, 21 Oct 2022 08:44:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] tcg/aarch64: Remove unused code in tcg_out_op
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, WANG Xuerui <git@xen0n.name>
References: <20221017020826.990729-1-huqi@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221017020826.990729-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JoQncBflB1qx

On 10/17/22 12:08, Qi Hu wrote:
> AArch64 defines the TCG_TARGET_HAS_direct_jump. So the "else" block is
> useless in the case of "INDEX_op_goto_tb" in function "tcg_out_op". Add
> an assertion and delete these codes for clarity.
> 
> Suggested-by: WANG Xuerui <git@xen0n.name>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
>   tcg/aarch64/tcg-target.c.inc | 31 ++++++++++++++-----------------
>   1 file changed, 14 insertions(+), 17 deletions(-)

Thanks, queued to tcg-next.


r~
