Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp127594eja;
        Wed, 1 Nov 2023 20:46:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5qiDEj2UMqam66VaIkz9ptoz50lRoFYf3LYtkcKXOPnb+/VPkRmRArbAC4H8n3i8YDGoG
X-Received: by 2002:a05:622a:315:b0:412:288f:3853 with SMTP id q21-20020a05622a031500b00412288f3853mr21885417qtw.28.1698896819676;
        Wed, 01 Nov 2023 20:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698896819; cv=none;
        d=google.com; s=arc-20160816;
        b=ahhO1niVtogLE/xB8Yiq0S0dlNYQX80Av6ent/iXWoOJQjTXEluFwXZ5DJb3ZLBje/
         XCDzhFIPp5uilk8r/AuFELz9J2Soiwm2xjAiW2QY90KDWKOo3JrC636WFiAh1fe19NVW
         UztvbaxcF1STzgyhpLw48x6IBKEUXCBjiefaUtUgAAUfPokLKWUwMMDo+eqRlFyiFp4N
         ggbNzrkR0zk0zTqKBghunhkEIlWgcop639R5jodXMP2FyRUihoVOZseLisGTgToMG612
         8xzBTOH8jzf+kPn77yQ7ia/lOzqECV33jDD4ov/rewXLGmZGmOkmW1waR4v9hACF+KiT
         xgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=WVd/IdjxSZSd6ScgVzRGziJJ1WfHtz0AVbUVOPh8KLQ=;
        fh=vnd25H/Ke+7YaFzjpnMIhV1td4ceLAPtKNu/30RxYYA=;
        b=cH8BE6eu2LyxC9ZRhgYmK3If/KnWKDh1RH80UWiSvrmwFFfhn8S+AUyRWDoXQNr/B8
         P5TXEzdgbxzUqwRcptoglw3Py75pyykk/XgZZ+PJJBZJQTtNYaaw/tQqJN9VMzGZ9p6M
         v57BBPl3n6pKCS0hthY9FbokA7ZDcibICK83KQKoPCPTS9Hi7iwmUwHeMNlwZdHZFwcI
         vjED+StDkpkNq+l8TT3DMAEZjQFI9JzQXDUah7oI6cdCJ2YIPXOirUtW+fiZz4ZUEXQW
         hLDQB9NNCkiwwnViHCW08VqdHiBQ4ZU6wAl8HVwd5qWPgfAchihIMc3W6f31qC7dHJQE
         Cq0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ioHtdMBT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2-20020a05622a004200b0041cb66ed83bsi3631613qtw.238.2023.11.01.20.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 20:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ioHtdMBT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyOfa-0003sN-MV; Wed, 01 Nov 2023 23:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyOfY-0003sC-Nj
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 23:46:56 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyOfX-00039T-5T
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 23:46:56 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6b20577ef7bso531082b3a.3
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 20:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698896813; x=1699501613; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WVd/IdjxSZSd6ScgVzRGziJJ1WfHtz0AVbUVOPh8KLQ=;
 b=ioHtdMBTe5GvQgAjJkDIyemC7yK1NPyMDk1Tz9xG6vp9Xu2rqe5KSMZntZfxHLHiU3
 THL1Eu0JtkPSUZt3DImBdPvHlCrVUxX+xPKvcWgA2xWlypO5KN9gVwTYF1M7rizvHrLm
 oyLO1VQlDCdAM4dh+UbCXqr1oEMcy/sobFQ/BWBf72p2NqKGLdg9nW3GZ3/UYRNcuAif
 pUUMSdyZhKx/X6t0RLcmFg/Wx+8B6t/f1YioCvSB0rIcxbG2eTWU56jyClZzDvW12uWD
 dT6MHL9SmTLa3XdpdKjiWw074IV0+CUnB7nByI4xM14G+hoW3yf4ZujC3U1ZaCG7belY
 2J5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698896813; x=1699501613;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WVd/IdjxSZSd6ScgVzRGziJJ1WfHtz0AVbUVOPh8KLQ=;
 b=Lp79tv8nCIiECrG2HYnwcCo/FYjo8nrolPzu3ddqvk3w6RXc0i4YVm830GOFJB6aPp
 +8FHSdWNB8cGHsrVUlFORcCF6IaF0PWGbxLQkHi4YpBc6ZiScz+r/Rwps2r8w41Ohro9
 CirZB/iSaO7BqeWjm7TCry/sQ0lfY1BNe5rVtpOzQCeRgBJcXF4QFuGewE/aw1gzpEZN
 iKpY9A3eoyYI3gMIPHnbJFB856TP3F4bnhkpeFHco7/nz0Ys/hv1HP7rFp+SldJWNpUz
 PymiBIBKI/hNGxHWTTAKavpsDsQoekph1lsSA6ZFAk0CkBU364if/skeTeZFWnYVItr9
 ntYw==
X-Gm-Message-State: AOJu0Yypbv7NWSCx9wYijSDGDzyiRLs7vjeHoaUCN53uRijbC+Rmtdcy
 stLLI2xAQWfSDNF7zuJ5xn2ZKg==
X-Received: by 2002:a05:6a00:80a:b0:68e:417c:ed5c with SMTP id
 m10-20020a056a00080a00b0068e417ced5cmr16490934pfk.32.1698896813187; 
 Wed, 01 Nov 2023 20:46:53 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 z20-20020aa785d4000000b0068bc6a75848sm1906758pfn.156.2023.11.01.20.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 20:46:52 -0700 (PDT)
Message-ID: <781dfff5-78e5-462d-a4e2-cf1ba0819c45@linaro.org>
Date: Wed, 1 Nov 2023 20:46:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/33] hw/cpu: Call object_class_is_abstract() once in
 cpu_class_by_name()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-3-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-3-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: L25ocpED3JF1

On 11/1/23 17:24, Gavin Shan wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Let CPUClass::class_by_name() handlers to return abstract classes,
> and filter them once in the public cpu_class_by_name() method.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---


> @@ -150,9 +150,15 @@ static bool cpu_common_has_work(CPUState *cs)
>   ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
>   {
>       CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
> +    ObjectClass *oc;
>   
>       assert(cpu_model && cc->class_by_name);
> -    return cc->class_by_name(cpu_model);
> +    oc = cc->class_by_name(cpu_model);
> +    if (oc && !object_class_is_abstract(oc)) {
> +        return oc;
> +    }
> +
> +    return NULL;
>   }

I wonder if cpu_model_by_name wouldn't be a better name at this point?
Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
