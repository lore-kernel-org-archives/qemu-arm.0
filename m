Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp455368ejc;
        Tue, 11 Apr 2023 05:10:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yf1KO59b3+j1eHlI7Ris8rYSgbuMlKluEfajLB03iHHmyxLJf3qTFfQ5P9UzWJj31Uw7n9
X-Received: by 2002:a05:622a:4cc:b0:3e7:e27a:64d3 with SMTP id q12-20020a05622a04cc00b003e7e27a64d3mr107893qtx.23.1681215029511;
        Tue, 11 Apr 2023 05:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681215029; cv=none;
        d=google.com; s=arc-20160816;
        b=S85bNxXpP4o1HGBF1DKgt3l7K73envZOVZIAs8CuQ+ADVC55NAcaoHstQAT5M47uCZ
         Ieti+VmDJcmF3KuDQLKYQxZxEwDZNxvZK3xR8FYonTZfB+JRnerdGzGb61oW6hMngIi7
         1zx7eUUIkn2zyuHofHCfHx4Gs7MRzCLxFJoco59yeYwTShlmMqBuHR8wa0b5Wqd9OAg3
         VZyeByCfQZiS7gfQiTpXrHXdzayu8mUudTUf3mB1XEipoID54JHLF+4lzI5kB9/YuK0Z
         rKS3hE1ZXpO64FXJ0UUA08KFpJYtB+11K6Wtwhb3AIfvxgPoaUH+zSzKaE08Pez+5tFv
         4EKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=w1XHuh5xZjAulucojrLDeQkJz98dHz+Fb7pdpqIQu3c=;
        b=Xu1kRK/QEZf5q2N+m33BpeQJQwgNOujDs7doFV1aVmQiWtBt4ttGTbON46uW0h6+tB
         XJ+gNQFyTUbrEzojI33BnDxyUkssQuP3j3I3YVhPdPwCe8Igd2FDO95v4ziX5lQRtUy5
         YfHtgRvKcS1UswoTs9xz1RpgP6VhaN5XSvJHwiHmoA+vPfTrp8CAjSqgEqHvR14QwSWa
         1ZiaRw/fbrMUvQDToq7DD1nnegqM0Brp0UwBSLqO4+NvTxImgtvTm5XfB5Wb9R+ALW4O
         CdRxpLqOYB5P2beCfRj4qoaQ5mISmg9gPjO6Z+eVAWoYASgLmvw9sF8vwSDTfQAGX2jg
         Dp1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X2aHfuFU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 145-20020a370c97000000b0074a0815f139si8894892qkm.691.2023.04.11.05.10.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 05:10:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X2aHfuFU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmCpO-0005Dc-UY; Tue, 11 Apr 2023 08:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCpE-0004yI-4u
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:10:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCpB-0004eh-KQ
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:10:15 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 o6-20020a05600c4fc600b003ef6e6754c5so2064599wmq.5
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 05:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w1XHuh5xZjAulucojrLDeQkJz98dHz+Fb7pdpqIQu3c=;
 b=X2aHfuFUQ3OHRp9J+pvvAEvoCeyOpNz48t9+ifhDaUwnCMbPs0tTQPnfQiw+a5vV4X
 8xlhczb4sCpPH7VVMjpf8dkGfvXrbbOJnFqk7vc+9F8ExEUDtEp1KWKNTf2gsPBbp/vU
 OsjqkacQgNLZ2Am7vPekislvDTXkZXo9XZvX66xm72YH2x31xHdqsW4OViE5q8g+UYI+
 xkIJctn5FpPWYiC4PuPvjfLKw5ddBoRHXwB1/g5AVgL+QnwAthyi6Aj6+LdFPBajEraE
 OuoNpqTF4NxsTEsC/k8msnKLI6UzB4yLQqwWzMMdwOfLJIAyeXeQ1ZskwFAw1dQpkRbs
 OOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w1XHuh5xZjAulucojrLDeQkJz98dHz+Fb7pdpqIQu3c=;
 b=1XUiy/Q3o7MHPXrLwHq+GpQtO3KSabWaUVte84PWZ0nPG62v1afqfcZo10XwsV9Jrn
 akuqQu3vBekpBUmz625ntDelwjghv9Slr4mu5uhpwyqPKvSReYZboPSP4fU1Uy333v91
 ePaFoU6RlOANS9C/5JnwoW9gwhO+mmhZp3cSEpO9UhuVe7CpibLjZhDlnndhPKndWEKf
 kjf1RmrEXhvMl6v7u8dsCDD26//EcgtZPEINxnB16TCwg1AzpYfE+nlMshi52ouvvsC6
 7iUJvxXR6lw/rCsBENaEUkbymIkX9XprKi0l/IJiW0KCTanWGv+ipeCbNqa4iWgPgdFw
 rmXg==
X-Gm-Message-State: AAQBX9fhGCpagTPMYrWZsGHFxQbwwB3ThzhNw6JYUJ1qHKZsPW1HBAam
 xXiMKPZFc/041ZMAc2fOjd6aIA==
X-Received: by 2002:a05:600c:299:b0:3ed:5d41:f998 with SMTP id
 25-20020a05600c029900b003ed5d41f998mr10262284wmk.15.1681215010419; 
 Tue, 11 Apr 2023 05:10:10 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003ef7058ea02sm20860047wmq.29.2023.04.11.05.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:10:10 -0700 (PDT)
Message-ID: <9f598a28-da4b-14bb-c908-1f9a2861732a@linaro.org>
Date: Tue, 11 Apr 2023 14:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 19/42] tcg: Clear TCGLabelQemuLdst on allocation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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
X-TUID: 8LDsgn1nzyHG

On 8/4/23 04:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-ldst.c.inc | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

