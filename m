Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3720875ejm;
        Tue, 25 Apr 2023 12:43:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350YRfA6JmE9+TxPyzZKMr7x51RDJQUQBbPQfLrNwUhGQzdP9xtYaWgkyKk6QX+7gh2AmKtwu
X-Received: by 2002:ac8:7c43:0:b0:3ed:a811:23d7 with SMTP id o3-20020ac87c43000000b003eda81123d7mr28107387qtv.38.1682451803535;
        Tue, 25 Apr 2023 12:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451803; cv=none;
        d=google.com; s=arc-20160816;
        b=aGXi/Rwg1cYFP6AIeG0AHVl1Aj8D4Q28wLxqM+Ack055cI5UgltBms6MD2Hdi7MvpX
         o9DUadlMUB8g5eV0YDkzKpx30UIe255T41DuKnkOVESY7ohzN5VoM9eE2Lfm8UmAsw6P
         dQL+RaWKBdmHliQR3OVC7MRG7WYrkxQULvrA0rZqKcSXld/OQ41k1gIbeteRC/J/bPfq
         V7UfQb4aD4sIst3t55mJtCNE4LcD0/XML61WAyun+DREWfGxbm1E6wYGmQCqwnIhw4oV
         EdjQnJqB/uFftUiNX/0u+lGUN/m4RRyDsAQwEyzSqJRcBJ/3qRtyVfvmI12O8uhtvvuH
         8/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=L1oX0IUmN6a1E/gKUL7LjPtwnHIjzCfveBQHzkwnpoM=;
        b=dH8ZSrVZLumxVY/1+gH+Mpt2LqMkmEdzfd9hKhfGkkmEeIp+ePhlr4aDd5IlvRRtVp
         5RdJEVLD7IIxyA7V2X8GI0z+xIErOfAas6tYa61WwVEEJoER48zMP/kM3u52xa7qd7XX
         9DZUwGsFmY09evKZ9aq3BF+ZMqdKoN5YqN7C7enquRwhlzRqjWyqj1rgaqE7isYSTYPx
         dW5zHURw5a70vIR759lHbQGDFMoq9F1g8QXI9QUc7m8QoysSOz4wFgNnEXZ4RH8BdBRc
         8jFrmGXyUBkVGXZgYVs9LdmbmPFZ1o4bbv6WqPf8H8NaXQZpYBTGVxBP6KBq9ZgqvnYZ
         jLfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ea+Uisb4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020ac85c82000000b003f0b0263994si1208975qta.743.2023.04.25.12.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:43:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ea+Uisb4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOXS-0002Cg-OG; Tue, 25 Apr 2023 15:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOXQ-00029b-OE
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:41:20 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOXO-0007F0-63
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:41:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2f7a7f9667bso3819137f8f.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451677; x=1685043677;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L1oX0IUmN6a1E/gKUL7LjPtwnHIjzCfveBQHzkwnpoM=;
 b=Ea+Uisb4N/yRnaCRJ6SdIK39PwKo5kqHJxWoz8NR8J5hT1cr/KqUdFyWd1F9dAwo4F
 EuBmM3gWU1FMFDeXy0Aal1v6AkyXom9wAr6MrxYOzVX/rSFQp9NxKbWKc0fS602p54PO
 msQ4lYXIL+mJ6/P09nnPzS185L9R3HDasKOMLIO6jB4M7EgPdhU81q33II6DL+dgKGsG
 6QmreFgiE4lup9YZIqy2TEMC5LY4VamzyKTejqGl11qxF7onlKbqH2qVJftrD9EkAjyh
 e+z5Xhs/npcpLGnWdCaYF4X0TkqOrQoELI9lVCitQVi1SvNEjTW0tLRiVhPOOmRQ5+UZ
 bm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451677; x=1685043677;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L1oX0IUmN6a1E/gKUL7LjPtwnHIjzCfveBQHzkwnpoM=;
 b=AU23vxHpw4YDOqTlkQ6K6R1EDhCaAnanoxn82YEzluXTqWWIjpcJVbNqq+phP4gWGj
 LM2772xY65tYS6+iwta+RBP/jDkEVQUlj8T7a8ps7NLva+KXE3oQO+14XXuV0nshwMgE
 guai3LJ+nWM02QjimCmkbPfE/nNm3toa6pqDXLTwsJVf/ZsmPvpgGBzsj+C21XD2rXtO
 aWaM1yo1lTBoGPDiD/7ns15r58n3aqtrS182gzt2ZVyOX5Eov+d/FKN3qaQ7ST7D5Go4
 NvcAFo2L3MDVAMSgaUjpIhxmbvQy6PEvDMUgozM9aIQk8a1vMv9lSgLzpqMhxQOfAkbO
 rvug==
X-Gm-Message-State: AAQBX9dQ+eDI4RvvqKKP0hwSDHOf+OrDY3clomGFSKi0IBCoUFM7pSbe
 KaBzeAsYbHfka0q0aH3pmrLCYIkLQlDT7MJaAYMkrQ==
X-Received: by 2002:a5d:5252:0:b0:2dd:a3:c2e8 with SMTP id
 k18-20020a5d5252000000b002dd00a3c2e8mr12468234wrc.44.1682451676733; 
 Tue, 25 Apr 2023 12:41:16 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d5402000000b002da75c5e143sm13803219wrv.29.2023.04.25.12.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:41:16 -0700 (PDT)
Message-ID: <ff19c274-0252-cc5d-ef56-0643fcebe2ee@linaro.org>
Date: Tue, 25 Apr 2023 20:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 03/57] tcg/i386: Conditionalize tcg_out_extu_i32_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
X-TUID: Oq2m1yD6nGct

On 24/4/23 07:40, Richard Henderson wrote:
> Since TCG_TYPE_I32 values are kept zero-extended in registers, via
> omission of the REXW bit, we need not extend if the register matches.
> This is already relied upon by qemu_{ld,st}.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

