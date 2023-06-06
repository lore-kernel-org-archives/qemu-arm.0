Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3542630ejb;
        Tue, 6 Jun 2023 07:51:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Ado7/eeN8OCKVFiz+Sx6cqE0QZkcibTEi5whjVhCMTMp+j845zKGHkNZoFznoYQlIwHP4
X-Received: by 2002:a05:620a:2ccc:b0:75b:23a1:361c with SMTP id tc12-20020a05620a2ccc00b0075b23a1361cmr2011429qkn.45.1686063096660;
        Tue, 06 Jun 2023 07:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686063096; cv=none;
        d=google.com; s=arc-20160816;
        b=HH7goJCjNvfTU2wKGrWpKIoaiVJ5ZqBiCfXEYln+2ju2mKg2utfpSNurJQ9MzfmZo6
         7qcFSL5OBIt8e+Qvn0/JZvARB0Ze3yPiPKpKGrQdKEcMmvqWBnAto5lNSRFY60vXXv7K
         u7/o+bedVCr6SlpUd9cJhEDgcqoS9MAtgrTyNWmcjxfZNZY4RhIqFfKhHccMSY6sHS8b
         BCbb11YBJfkAJOnvdKKCzIJ78nCE/SdOW+Kzi7wYuexZ1m/QOESzlrF4VO4StmZHMILF
         cIzH+nW3dKSwjWygd9AJoiKqU7qOxgS8NW51WdWl1FLvWdaM5UU+QrnNnwpRKmNAaXCO
         N4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DGs9MG6POpCj8Mmx5gPvpejl0YSDiO6EkHrcF3a7Pm4=;
        b=LC1GchONAc+5FflO5Hz/mxWKgUdGm82k/Mzm7nHf/yG6zcEzpIcQYVTC42U9I3alrO
         SiHhOAm+VIgoma9JjwcdI0ZrwA3izXqxWKpcFG/NprEqZMpLPTxI3KVdL4PySDltujVX
         l6zbyPguHs593LW81qy8+22nDnzKs5q9SgAaDLL+ZPwCeqQQJWhtDu1dwX/NFRdl/nQQ
         xaEQUf4nGbiwZuiBEdfjHDoMCB+qI0JPNIxthVV7H/tLuq/psQH6SnELq0Dd5ejZn87G
         1Xd3QUardzwCEAs48PFwWP3aAU2EXuMRWhrlZC8K2Y/URh7xQooiF58ADLrBFnnGMoKS
         xIng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5fpot3A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz7-20020a05620a36c700b0073baa1d934esi5899676qkb.689.2023.06.06.07.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5fpot3A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Y21-0007Sk-1H; Tue, 06 Jun 2023 10:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y1y-0007Bu-Ru
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:51:30 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y1w-0005J3-8p
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:51:29 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-652426346bbso3150378b3a.3
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686063071; x=1688655071;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DGs9MG6POpCj8Mmx5gPvpejl0YSDiO6EkHrcF3a7Pm4=;
 b=e5fpot3Au7om+gyQTmDQfBjAJfwXxqfUWqw0dFqchi/JgyifMNX8qK+ZRiajJ9Taq0
 0HrwFss3oaeH3gQ9OKhvGijij43kip+bn4BFllv1OHCNZfOnO3yGjd0veIitNTrlyCbR
 kVm99m9Zwt8YkvXmo6vfMdP/+GmLTxsyUHhvjDJtuZe39Adv3ekkpA9r0rrZPd+f0rDq
 jatLYA0pshFqntPxaCe4dgjN3CFtiouHRcih2cgzMFB0z/jSLlbQWD2qD8tpSmgBGSTe
 pUwFNxbJmOYESG4cSJ+Ee7s9LwCLjgu7BMohUqyPyoAxVo0EyKNoIUjj0jhEiIGBD5nx
 9hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686063071; x=1688655071;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DGs9MG6POpCj8Mmx5gPvpejl0YSDiO6EkHrcF3a7Pm4=;
 b=SZbOndvBCWnK3wDSUOl4qniMIvEgJGWFfBqChBTSwBEYQ/sMlYBrgUjyZI8+4HvzA6
 L0fHhktjCYK1JcwQ5NyM8V9Oggcp5FLE+oSiUtHibFnN+CNBdxs7MuNrZZ5lenPj5y9y
 S3zH/n5WZNT0aTZpupRm0Y3zL7kdN6BAuRCKj3i72/M9ZVNZqR+sRCsftAwMHuiXOy6B
 H2yXFF66O39NDGGj5BCizXbCsLrM0qe9zrzk+GATx8GwaIhvEylncZ8VtZzsxY4Eif2p
 Jym+3x35Y8FBCpLWs+53jslLYAPW0cBCQshiCip7F0mQ0uzqbqCFGUVL99sn1NJFeZO1
 YlfA==
X-Gm-Message-State: AC+VfDy/X/vlr2xPkTLaK7HzI4fnbv81SvQJuAZNApzaluqwxYv0VJOU
 eVbv+CRsxJBP7Xt8I95tO/mOI2oeQHkg7eYsghk=
X-Received: by 2002:a05:6a20:8403:b0:111:346c:3445 with SMTP id
 c3-20020a056a20840300b00111346c3445mr1320998pzd.38.1686063071413; 
 Tue, 06 Jun 2023 07:51:11 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a170903244400b001a96a6877fdsm8721208pls.3.2023.06.06.07.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:51:11 -0700 (PDT)
Message-ID: <e7af2c5b-cb5d-c6aa-73d8-d8acf3216256@linaro.org>
Date: Tue, 6 Jun 2023 07:51:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 6/9] accel/tcg: Check for USER_ONLY definition
 instead of SOFTMMU one
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ccynKTHeNZ1W

On 6/5/23 15:24, Philippe Mathieu-Daudé wrote:
> Since we*might*  have user emulation with softmmu,
> replace the system emulation check by !user emulation one.
> 
> Invert some if() ladders for clarity.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/internal.h | 6 +++---
>   accel/tcg/cpu-exec.c | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
