Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp183295eje;
        Sat, 8 Jul 2023 10:19:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEUfz/4cnuRRbioME74SXFoeMsygkNEldgVs+gupBV2ZmhT5f9BTRBWYLTyj25JjMgLe02j
X-Received: by 2002:a0c:b45d:0:b0:626:379:6b0a with SMTP id e29-20020a0cb45d000000b0062603796b0amr8250547qvf.13.1688836775507;
        Sat, 08 Jul 2023 10:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688836775; cv=none;
        d=google.com; s=arc-20160816;
        b=dimCKIbLqhJwJsAVPkMkMuOcHKKCjOnQllQ0g5XSeObgvWtfV3eF6rEsSjZyV43G9y
         O/774ewcRNr1wERC+2tj6v204Oal2UTB4l67Uo226Ea3ntXCT5m5g/sbyX9dsGsWpF0t
         Z6dniJERzgYJKau85LBazpOoK4k3rqvuT0V+YhZVsjiXfTHoBnLAL7rlDh6VT5wu32xq
         YqTJsyXEbXgbvL+QprDY/6aq6+nQnUj0lDt9FEwlAtyyFqsZAxLh9tyjxJkD1gjvPJ2P
         +DZV+ty8rR2aQ002bD6efoYtNM/AYkKRFfKjT1XUiu9BLccHlM8ZII9hmsUkAJpuEQsA
         7+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8PsZ/p+CNNR2iUPqY+K1d+GerH8ve0BFS3vABcWtGTk=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=j0iR87QWh3jvWiuBI+YWtk1GuE4thFgpydDnFwDiFc2bV4OD79BPrN+01msEHSSH3d
         q0bXy7J4D1ZoNqAkO516y0brJ40QMpfsJwIp5TgSgtrTiQXFi5jjzsl666PHYnyrPjMC
         0HF81W8YHWwG9TjAxK1I1KvIFw5ZN8j2ro2QLuJVjy3bTP9/ZfTbbOPZATxbE26/Au1x
         sjz9JBbTvEqW0J3V0KqBHYbQZuAyihKjL/0dKum1Xf/hSkTYkZ13KmyUqz9FRQe2OBr2
         R9ODyr3MEwtx7w7AHrUFhXum2SmUm2RR1bn4oUC0fZeesMGn2qbxP5h7wnOGY1k+MJTX
         6WJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWb7cdmp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18-20020a0ca792000000b0062def48fec2si4094258qva.209.2023.07.08.10.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jul 2023 10:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWb7cdmp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIBaD-0008PB-C1; Sat, 08 Jul 2023 13:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBaB-0008Ok-Ma
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:18:55 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBaA-0003iW-1y
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:18:55 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-993a37b79e2so368635166b.1
 for <qemu-arm@nongnu.org>; Sat, 08 Jul 2023 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688836732; x=1691428732;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8PsZ/p+CNNR2iUPqY+K1d+GerH8ve0BFS3vABcWtGTk=;
 b=TWb7cdmpaNnWlK79sdbW9acjA/xW1GRTSl0RUPYwM7xRNutjg9uZ1hGz6pYFv4e1ju
 Bq0vfTFp5RhoaLnj/nJbloLY05hM05GdqsTqr+atMEkf2Llq8AECifNKEHN8gMIM2YHD
 dImGkn/mAeYKCIp19o6hEA3KQfRoLdcm2NpsQE0qhcyHqvH+EfYV5ZpAXkNtCAjHuAZW
 aDv0rDmkFFG3QOGjtYwTbN8Mx1sziGdAxrK3U4jv0zF7rI0h7thF/dM3ykdXG0fpsS1n
 Yx4tZCLhO+B+GmyNxWcXt8IJwWR8PdZZmiN+iK7bpw29fcCbLgINb7fuuiwjnfrQaexB
 t2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688836732; x=1691428732;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8PsZ/p+CNNR2iUPqY+K1d+GerH8ve0BFS3vABcWtGTk=;
 b=JqUuH8jjSS+f5yTKRZNcFUgR2cgMgtaYn27zuyvdhZwnXrjCMnmgLOPsF1OENssqAM
 9LP11xSCthaTt8qwEmRmSEysP/l4rxfFDYLLFDH7/ABR3VMF3WlJ3e5b0LfFuuOvVloO
 6dF6HLHE1vQaRquVUYQ+21Soc/IhnNAWPfRHZgFgo9OAG5Dy79+/3kpLhyPgN6Fj/6XJ
 Br1mCnZ9bjMNqDnB7L85HrMitujxfCl5EFVsLArSb9THOyShXbz9LEwR9BwzgYq7h3mb
 ktKWgu3AoB/XEzOjP1tmYfcBDgbVX7Qav2rvwHWlc4dCDYjRC8GEbKDNplbjWvZTZRfp
 +ECQ==
X-Gm-Message-State: ABy/qLZg5nXdkD7AO3HutQdYHeKC21fsQmOD/frram73IcmCe5W6ZuYx
 ygtOFgCQ3rLaIw6Sf7ulxOj27A==
X-Received: by 2002:a17:906:c7d1:b0:991:b834:af83 with SMTP id
 dc17-20020a170906c7d100b00991b834af83mr5391330ejb.59.1688836732091; 
 Sat, 08 Jul 2023 10:18:52 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a1709063b8200b0098e42bef732sm3684001ejf.183.2023.07.08.10.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:18:51 -0700 (PDT)
Message-ID: <80d5659c-b75c-63d2-0415-a97ef6f2f6c9@linaro.org>
Date: Sat, 8 Jul 2023 19:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 25/37] target/arm: Use aesenc_SB_SR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: CaQPNxEni31w

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AESE instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/crypto_helper.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

