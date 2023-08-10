Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp884103ejc;
        Thu, 10 Aug 2023 12:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXbEnOaPmFuxWmAImoIOxCKtkyaqXH+WxWlxn/G/CGU9iq3ZB9SU/Onf9eM5gWPs7Tf56v
X-Received: by 2002:a05:620a:2906:b0:76c:e9e1:2b2 with SMTP id m6-20020a05620a290600b0076ce9e102b2mr3774052qkp.13.1691694170468;
        Thu, 10 Aug 2023 12:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691694170; cv=none;
        d=google.com; s=arc-20160816;
        b=EtsMyyVBQXXbZ2fGbvVpm7KOxfiUsjtSj2Z35KstOvoP0QdkIAvbPq7WV7keQWiahU
         ZYxJ/WqM2uC/lr2j0sUWrtR/nSwYcjq4AZtj/wShRYsmrjb0qTT7i8rhlMlnzlu3wXwg
         ZZ6f7pxdxZy8STxJBN8Kh0l8kqW1jBpwWWroFOa0C+982kqefDsIUTMxy+E9TNqDoaKG
         GFd0jWryJwUABkPEf21y3YC5rzcxZdEmB/nDkvcf9aw7J6GsBD1AQSCQBpHKDmKqeYdB
         XDWDTKArDcnasD4Dfo3ayN3lo7LboxIszOP4qwjC7p2ExyZayWpLYurEgiTa21pvYVZy
         VO4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8e55NR5/t5QYbd8hG7i/D0JykSsu8dQrhmMs0zGhOoU=;
        fh=GhRAajmaXIVQSCYRsWh6JKKj25My/ZfgM6mKi1yjbAE=;
        b=YjhYGGwJ0o5HHrbT7A+mIXxhWVsx9iv9spU6PuCHsoCt4u06eJgqqSKPt1st/Xy2v2
         OSgIXdlyiV4290NJG1UsMjfyInwl72T6dvN2W1KPf3hjEna2ceiRcR8ezyeXT7U4Dznv
         E5ZcYaB1q9BUBU+ge4hya83NSh1+N6GYO0gltajNyco2YUm19hwuSI3yi1M9iGfgj8J1
         yWlXAjC2yIRaQC/Takpoq0TFb3+upk9xB6JiLXLr9Q5dpe9OKwycgJIE2RKX+X7QhbQD
         U09DfPp31Twb+thvdORriQHgkfhrUDn8WtaOoOYUnIi7PVUvuuwq3KTGEo96qGpQEoxy
         J3Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gv5plG40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8-20020a05620a270800b0076d1fb570cbsi1230227qkp.742.2023.08.10.12.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 12:02:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gv5plG40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUAvQ-00047H-JP; Thu, 10 Aug 2023 15:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUAvO-00046y-Tw
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 15:02:22 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUAvM-0004ny-Vo
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 15:02:22 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1bc8a2f71eeso9789635ad.0
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691694139; x=1692298939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8e55NR5/t5QYbd8hG7i/D0JykSsu8dQrhmMs0zGhOoU=;
 b=gv5plG40HhCstz3NSVu0LKu3IFiB7eJJQDrt9NRPtLEp4DxH3SKl9yO697acp8oO4r
 uocL8Bs5N2WeqOFFPFspnjARO+2JIUNNV68atMtPIZ0G0y7kReeabarXjiMwWZAEwbWl
 Ul6fqaYmWMCW5ARjpvUffVX9bN43yFf31ff2c/+j4F8nb+/+jemAeFJqimy1LLDhTpPm
 /iD1HnEsMu+D2U3UZx7wZNvBJXGqiBAEno3ki4+0rfZZJnHls8V+xUYfPPp87IJJyWZh
 6SfSeUgyk3L4aBJcaKlk7nrtU7R+W774OZ4bs0vqgsYdYPOrzc7Wwy+AhH6kFDnQPo7m
 KIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691694139; x=1692298939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8e55NR5/t5QYbd8hG7i/D0JykSsu8dQrhmMs0zGhOoU=;
 b=e/sgnozJafUCOJ6sL+ymGtlcaWjvZJpiGlGTiGUXqlqHHMPSJn3v7dddnKr57FJNNj
 JuoE7VQOMtgxjrTtqRxyGkOE3GBZeZnhsMgTBwnrujF8V+WZ9Z8yPaF4vaxVZfgROvKt
 qK/dBRVP+4bjXQLTRw/PN8bwAiQj5umqCbG16j8AXBtfu1AIaOJfsPNF4L7jjAzYXbZ4
 /7XUipaHYwXvwHcr/WxZy1pLfZGQc7R8Vy5+ZvdIo7MNEYOaUVbfeojLz2sQ69Y/hsrj
 VD9JuS2s+bO59ZFfaL8ebu2mg1uKO6JD2uQy7j/Tras1Zn5oGwTpp0ivXVbqvsQiQil0
 Ckew==
X-Gm-Message-State: AOJu0YzbFEsQpNSx4e98uOfH0LXifyJxRRpxXbW9vR6UVu/6Vh/0jRHL
 HHlHgr6wMXqmUSu9nnhbMTftYw==
X-Received: by 2002:a17:902:6941:b0:1ac:8be5:8787 with SMTP id
 k1-20020a170902694100b001ac8be58787mr2677121plt.21.1691694138972; 
 Thu, 10 Aug 2023 12:02:18 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:9e4d:b830:d4fd:9164?
 ([2602:47:d483:7301:9e4d:b830:d4fd:9164])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170902ee4100b001bb8be10a84sm2132683plo.304.2023.08.10.12.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 12:02:18 -0700 (PDT)
Message-ID: <d3674431-8eff-bdc1-9f96-c294e429718e@linaro.org>
Date: Thu, 10 Aug 2023 12:02:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/5] target/arm: Reduce dcz_blocksize to uint8_t
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230810023548.412310-1-richard.henderson@linaro.org>
 <20230810023548.412310-3-richard.henderson@linaro.org>
 <CAFEAcA9JC_-R5AsvmtBK+ngb7LEuvaxU_7UT2U+jDvze7CqyxQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9JC_-R5AsvmtBK+ngb7LEuvaxU_7UT2U+jDvze7CqyxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.156,
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
X-TUID: ITjt9bcbHF28

On 8/10/23 07:09, Peter Maydell wrote:
> On Thu, 10 Aug 2023 at 03:37, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This value is only 4 bits wide.
> 
> True. Any particular reason to change the type, though?

To save space.


r~

> 
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM

