Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3185220ejc;
        Mon, 28 Aug 2023 11:36:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtj1DYA39UD+ikOPSvUvBpGRU/MW8Us78iXW3IwIyJZNFWNk4cwczMhYYMf9Kdr+OZD3xi
X-Received: by 2002:a05:6870:9712:b0:1bb:867e:caeb with SMTP id n18-20020a056870971200b001bb867ecaebmr13441577oaq.51.1693247773629;
        Mon, 28 Aug 2023 11:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693247773; cv=none;
        d=google.com; s=arc-20160816;
        b=F6YogJ/ttpVICaQlynyl8KAaKTM8ZlV+wyq2aZekFXkPQ5teMQrRyt40ggB8UiR3Kz
         zC3wVLrBDuZzvOgHCp0wiS879c7tYclq56+5DfZOvsUwf0gZwWV76SooxhSz6bXEAmI+
         MNKfoFqJwZQ5n/IOhc0WGZd/ZxxVHmvFc8uI6doHTkbUNnTHck9s41nXZ0FPEEFmnfic
         4OJnB2dmGsYT1xfd1jhtFt3YszABUGV/5QxDleBjGcRNS838jsZmVDxjcmtaxK8H4S6j
         svk9iD1fas0sX/6str4XRuwbKUShBm72YUGkJi6e15pqugz2YW74Ia1NwIPcRwW5if9y
         Ijeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DVti7M95dfLk1aMxnUxVtVTWgvEsdrY6/v8/RdKAQkI=;
        fh=vc+nqmKDbTj+9KCVcVasbHFTqitsy/RlC8F/3ZcIIWE=;
        b=An976AAIk0Q4VxGluM2fKTHi3QMCI4Y46anvvXP+io8u4Z+4zw4ySB0IccaZXdT51b
         uzoXggkgBaCs9r9++ho+NeHSUUyY3iSva2EuFpJPAdKuIaOks00pjCpYH8ikVY6eQy0Y
         ohxrNhh9khgjOYIZn66EBuBaoQjIZC5cWlwehkeGy4HY6ql252g/7IqnfauY1HJRDp/q
         CLR6xJAKZ6MKfbRbFv/KOQ6zNe6oqb242O4QsBAKDgdkc16VzY31ibs/34F+ubA7ROkE
         UPkTibvzGvJJieh9RMivizoE/HvFDv4k18BK+ysBkmrFpk+MpOgw/+1NW/fVS9XFshYO
         RjmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DjH24GZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020a0cf4cd000000b005ef676dbf8dsi4983938qvm.96.2023.08.28.11.36.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 11:36:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DjH24GZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qah5c-00017S-Mj; Mon, 28 Aug 2023 14:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah5W-00015O-Hv
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 14:35:48 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah5T-0006ye-9W
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 14:35:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c0d5b16aacso18738615ad.1
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 11:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693247741; x=1693852541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DVti7M95dfLk1aMxnUxVtVTWgvEsdrY6/v8/RdKAQkI=;
 b=DjH24GZE34/nPh+6GImWmEdeSGh1CbYXkpKdUGrYG6c/6jdX87ExLbgPbz0ay9E3zZ
 2xED8aR5UjaIzbrPUVQpuOOxZzK9q1LHpnIemCxTwCkH2gc6zd+aJ/1FMpku+GpZIf/z
 Z7s92No/FflAxublFYx5bgmALxGoYrr/w0YHJv/CdsG6t57lipmRywXHt32ndcoj3g/q
 +yCb5NiujgQ8s3gAaMGMr0vIM9Kv8BJUQYE4VG5ZzdzrbsBoQ3Rol9s24u1Ndb6T4J3C
 t0oBs5UxmQrNFjAP+sqjxsCjQp01MRO0sFywCR0r+hVivDb3tQ9gND+Ia1iIUzzt9iN4
 mHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693247741; x=1693852541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DVti7M95dfLk1aMxnUxVtVTWgvEsdrY6/v8/RdKAQkI=;
 b=HMBYVvZ9CYieqM+Y1QQz8KKu4RnzbWeoWpWWo67y5wglLv2imOgfj1D9TQa3kLTo2p
 znep1JPAjb4Rkf26N674fRl05gPyxoMmAzlJJ7CcIRsBpl4ADnvJdgfWXP+VGdGnMBT1
 WbnTNH1zS8w3hNTzm+d1IgzuqAMufzWntd6GH00VurHfYgo9di7PEnOVqwYnlgeAPob6
 aPWmpAQsuZz+buB+4yK+CjqqEuFBUCvrU//4AFoFg3THEaIUjw+uImacHBmFsoTgL9+u
 X0gEw3KxIRKqFTl1cNJHM1cqgqsaGMZh2UJ8Hdl3AZpRFqZz2Ck0z0EY4P6FF3UDHVNC
 E68w==
X-Gm-Message-State: AOJu0Yx9/4bJCZCaCBf4RHo0PQ4fAxjYaju2g/KjcxqEVyPe74RjjTUO
 s4O1+EGV3Fg4t5tJbC/fMbxz7A==
X-Received: by 2002:a17:902:e5cc:b0:1c0:aca0:8c44 with SMTP id
 u12-20020a170902e5cc00b001c0aca08c44mr14329733plf.19.1693247741533; 
 Mon, 28 Aug 2023 11:35:41 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a17090332c900b001b03f208323sm7677367plr.64.2023.08.28.11.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 11:35:41 -0700 (PDT)
Message-ID: <4706ed09-35d3-34e8-0bf8-156c49650a14@linaro.org>
Date: Mon, 28 Aug 2023 11:35:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/8] target/translate: Include missing 'exec/cpu_ldst.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828145545.81165-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: E1OPd+mLg2rZ

On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
> All these files access the CPU LD/ST API declared in "exec/cpu_ldst.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/avr/helper.c                  | 1 +
>   target/i386/tcg/fpu_helper.c         | 1 +
>   target/i386/tcg/sysemu/excp_helper.c | 1 +
>   target/loongarch/cpu.c               | 1 +
>   target/mips/tcg/ldst_helper.c        | 1 +
>   target/mips/tcg/msa_helper.c         | 1 +
>   target/riscv/op_helper.c             | 1 +
>   target/riscv/vector_helper.c         | 1 +
>   8 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
