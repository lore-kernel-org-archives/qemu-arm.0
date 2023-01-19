Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp626807ejc;
        Thu, 19 Jan 2023 13:17:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvwl26VB3zDWsrqHkmD99cCZJv7CUImzSj2nJ7aePWBahOf+mvSZZYHooAoCHhhqDd9a6+7
X-Received: by 2002:a05:622a:5a8c:b0:3b6:3165:d887 with SMTP id fz12-20020a05622a5a8c00b003b63165d887mr19859173qtb.59.1674163045591;
        Thu, 19 Jan 2023 13:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674163045; cv=none;
        d=google.com; s=arc-20160816;
        b=OmqtIZaKLgTYvGh/vkoG/ly6MmwzbCKBVm4I24YK36AG2fbn/mLfyoPsK3OpNXy/+o
         7y2z8MM55Xypn66vpRSXdIFPAj+HmUOgFUkzW+O5UFc1vd/8ABJf7aPqk1isaCdp4Ht0
         fsWdfWICfBGKntSQILTQhFUfpCPCOuXkbQCBGmMPzNUVzexznc/d+6fVarHZH4CM//AH
         yNVjOdA0xPAs89WCXikTHi4yhu/H/KV8SuqTmeRou8sUV0IMyvdKkEzHMUArjbKHnjJZ
         cTQfPFaMr1b7W9jOrpFO2iprLtGdm6+hiVcbWkJi/fZAZQoelq9+tqs5YyyLVBOXQ0D+
         QI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KZ1brvYdZlYvn7AdAwVWwyqjSPyLbZ12Lsi8u7x9u04=;
        b=hzwnwmALHhONm/43MG6vrUiOXyV5XAD/QVEFuu245/sodLQlW9a1zSrDHGztoQbK4Y
         HCtNBAQfaiN8k+PHaPBp0FN30xmasZYDZXZWTMsGPQC6RD+aiu2tWc2eX/xTqV8cZpQo
         gnTdrCYFbYoKMNiOyksHBApfl/nc6usR39j0sk3TmdJ5kGXDTUFbkJm7e8B1nqSKIRXx
         Qd3n4JeEtiYdTz+ZS4x0rfWaPP3aBTDOA3c1r4VsuDR2yFuSWCFzTtN18A6t+mpvQuW6
         eZ+uH1dKxDvnc1Cjn9tsvQoNwHxUtqieqesIgtxDdgwTr0jJeHmHw1Y/x+CSWJihJ2pU
         pU4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q8b8IkuO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22-20020ac84f16000000b0039ce7eadcccsi23032517qte.672.2023.01.19.13.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 13:17:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q8b8IkuO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIcHg-0007u1-Kq; Thu, 19 Jan 2023 16:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcHf-0007ts-PY
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:17:19 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcHd-0006c0-Qt
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:17:19 -0500
Received: by mail-pg1-x531.google.com with SMTP id d10so2586635pgm.13
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 13:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KZ1brvYdZlYvn7AdAwVWwyqjSPyLbZ12Lsi8u7x9u04=;
 b=Q8b8IkuOzHEYj9LXawUEboXtdlt1OwnZPzE2E4L7PplGwG+rQQA1K66lwEA31dIo9n
 Md8dazQ9ganNsHq7C0O4iyF4CeRPAiG9l1ktao0IMTapWQ1XRKGSC4EIyrw8u7dyI+to
 +vS8jyqfPqW065GMF0NBS2PkcJDqK9swiG7PPsbViLa5wZbwz8rQu9SXFoiNCdyngZIV
 PZO15UdcWn4yW2ZPRwdnT3yQi+uXsdzWu1ZarfLy10oQQioByWrqssd992C/SARKrN1q
 QYEHhCwvSqDyTvjYyOkCz4AntaMcR6JpDzk6gsioMR6r5YlCgKoe92kYCykc7zs6PTFZ
 WN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KZ1brvYdZlYvn7AdAwVWwyqjSPyLbZ12Lsi8u7x9u04=;
 b=KzQCIPlhqPIEH8r/SX7irdo8cILWm9MFn9XNTXAhJYZxOnPXBqBtRXJEyAjNNVXS4/
 Q+LDLHX3EcPV19nc0YYe2XLd8W1TTUrRmyqzVIqVVWNUeRbkCfTzVXqLRWTXAFBsUpP3
 l7bGWmaHcRn2MPqBIuwz0z0vkP2SBLazz8iR3cM2le3uLkrAfIePLItXd4n5Aff5Z6lW
 3/NOZ3QlPYu5rVJy7ucKEDyGGkUQTx7R2U2TP84g2BrrR/IF5fzKnFmZ4osmeD9hNGUO
 aBbRT24614OJcnSF38JuHL2c4ieO9dOMVm6XA1gDb0x7rP09/7bvRhs2AXdggMXPIZl2
 /UlQ==
X-Gm-Message-State: AFqh2kqqamaDeKXZIHaT/uP8K2O81H4eK1/42c4ndQkjU3qH8IkBZVGt
 a34yi6IjBYLeGMmPIqG8ZEBjCQ==
X-Received: by 2002:a05:6a00:331b:b0:578:333d:d6ab with SMTP id
 cq27-20020a056a00331b00b00578333dd6abmr14446510pfb.21.1674163035853; 
 Thu, 19 Jan 2023 13:17:15 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 g4-20020aa796a4000000b0058bc7e4ff57sm10702387pfk.144.2023.01.19.13.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:17:15 -0800 (PST)
Message-ID: <45067c0e-5f83-2ad4-ffdd-e187dab052a5@linaro.org>
Date: Thu, 19 Jan 2023 11:17:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 09/11] tests/qtest/migration-test: Build command line
 using GString API (3/4)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: VlTrXpkzC6/p

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Part 3/4: Convert accelerator options.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 8377b3976a..015b774a9e 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -603,6 +603,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>       got_stop = false;
>   
>       cmd_common = g_string_new("");
> +    g_string_append_printf(cmd_common, "-accel kvm%s ",
> +                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
> +    g_string_append(cmd_common, "-accel tcg ");

Maybe clearer as

   if (args->use_dirty_ring) {
       g_string_append(s, "-accel kvm,dirty-ring-size=4096 ");
   } else {
       g_string_append(s, "-accel kvm ");
   }

but what you have works, so,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
