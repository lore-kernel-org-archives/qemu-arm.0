Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp103915njb;
        Tue, 30 Jul 2024 18:48:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzZzIVs9G+bGgaAS7rrjDTzdC2znsIHItDO/FhL05P5NMbSoQA6jzM3CBwL8AnaAse4yEgUt5upWRS/DhU3gOI1HhwRAs7
X-Google-Smtp-Source: AGHT+IGWlHxSwSKgHa7c3tG3yMyEybHjaFYt1/Bgsofqq59RKr2FzekTvc+d6dzFXAlR49Cfzb01
X-Received: by 2002:a05:6902:2307:b0:e03:4253:2d80 with SMTP id 3f1490d57ef6-e0b54507bc3mr12461767276.31.1722390533907;
        Tue, 30 Jul 2024 18:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722390533; cv=none;
        d=google.com; s=arc-20160816;
        b=SvI+GdqT2GluUCU/Jm33c+NDLVuS8Dewk4+483oWK8th5xQLBQ9YHPhRp9DPSDe3fU
         nizQ5Dr2a2KHXyKbt9NLcRajrcb3ZGxUTFqLJPBz5MlZ3YdyVBbKkdwbjB2Xx65X5DB6
         ZX/dJPmr8rHqbOyz2JsgZW4HGRHeYJMdSp6oZYF3bS+1WoIrNzfvDF0NSoCSEC5bhYAF
         Q8lsSXscSOTcEAAXzwHKs8iU8Vlf/1rfmJJfxM9t11Q5Zg3RT8+vSDW9Z9++4vRg2Yw/
         y2GJ/rX27ED5WFHPgEqzz/fN9MqmQNWn5GvlrDzIkEAOWi40NquCAM0vxpe1/RLCjkFX
         S5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=yx+blxF0nJcVP6pjbRxGnGBYG+43Yu8DIozXrpu3MaI=;
        fh=OQz7Cdh3NkbsvMogCQptv18pioDAfwL2jI3wEpPIHWQ=;
        b=OSMN2Be8ennasouegX9vsL5Fts/c7983Z2T4wltnB404Hpa6QONCIz2GDjAKkVbODf
         jKbfuu8PoGotVjxwN2Y7e71epd3MFSZsmmfjlL/raG350ql+lv1aFxAZ+WMNVEBbFoXR
         xGP7qvBcxwAWhJg40qBI2J6Zf7OwW2GXUDxDaqnPk4KRzFelLpoCbEV38TKcapeL2d/H
         KvPqewjlEgObLsE4mwNdYTnfNJiP7GMjn0d/o0ttOr0g4RULKFJQzXgv3qJCaOjeNtuf
         OgkuZRbk+kziJcwgfIgiTtSuGECY/sc3qBk+sMWYFsJ8rUdPa7TIBT2qrkVPl627U0dF
         zgVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=noSF5Q+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe853a7c5si140635331cf.755.2024.07.30.18.48.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 18:48:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=noSF5Q+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYyRv-0003EF-RO; Tue, 30 Jul 2024 21:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyRu-0003CK-EC
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 21:48:18 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyRr-0000lC-U6
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 21:48:18 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7a1c7857a49so3326111a12.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 18:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722390494; x=1722995294; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yx+blxF0nJcVP6pjbRxGnGBYG+43Yu8DIozXrpu3MaI=;
 b=noSF5Q+VZ+qKb9K7Iia4WMqkDw7bhTpEzyNr4qOb0XLTDJpIgCOddgDYyQpWF3+w2o
 GYLxdGeVcei2vyLyVVej8RJYN7uSgylD3sIjUpedvijsugKDe+urrA65oxzPlfLGdDzJ
 XcbzNmWMR8N2sbpyc5I//8XUanPihqfRDjE9d3Lq/Poz0UJRXx4qS0AdrpnZpJHNIb8n
 v+877g2dOAMGsvUPMvw/Iw37CoIv+v0yZD866ic4BKna9vA3AdZUi6JA8mx5OwNKIXJ5
 IwcjWzkA2dKYfCHtXUKIySO/GQWOywkGAxbvZX30/N8L+L1mDDNjf466NhQOn/8NAFoc
 8vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722390494; x=1722995294;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yx+blxF0nJcVP6pjbRxGnGBYG+43Yu8DIozXrpu3MaI=;
 b=Lb1XfU9vPWfVBD5bOfqaQO3RPdCkEyLepLs9q38Qi9SqlzfbyTjkxijPAAhalRpwsV
 Fazm54IxjiKHDZROPuRdtRKUtExoPyTjdW9UPoQ7jj5j9YXdxqu7U3pW9BqubmFaMjND
 3UFzFIJg3hedf7fk+Q2EDeJbt8hqEhh5q7VVz54bRiFkzgBr+UvUIl6gYqe7+PGXJDBV
 predstlfpYYKk0ySBEGgcXhYqSkzC1zJJ5qoR6ChWsgq+mYWOwNKJxCXPhLWpvNXxVwX
 AxZpcHcQyptVMUSi5dpRho23G5szmkyV6a93r6F3Jv112QIXydofzadIpnx896Q2VJGS
 817A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkwCT9BV4Kgfe2rxbxxIxl/k5aiK66a6q9eLZGJdNIW6jhiuGUOlUZ1YtNhWiadMdcIhIvPtJcYKQ3oc5PCG4Qn3Oy
X-Gm-Message-State: AOJu0Yw4IYaLo5uWZmAFf0lnjr1qIkOaDRUHrQlW8Nj+8fjGF1yBhMsi
 a7cAlTHVR8PO+owb6ZKVX9XEG+lYw0Ffyirwnu8vF48FtwBA56Cvpnbsr78gu5k=
X-Received: by 2002:a05:6a20:3d83:b0:1c0:e77b:d37 with SMTP id
 adf61e73a8af0-1c4a1179211mr12121675637.9.1722390494117; 
 Tue, 30 Jul 2024 18:48:14 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:7406:659b:9ac8:69bb?
 (2403-580a-f89b-0-7406-659b-9ac8-69bb.ip6.aussiebb.net.
 [2403:580a:f89b:0:7406:659b:9ac8:69bb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7f1cdcasm108601955ad.198.2024.07.30.18.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 18:48:13 -0700 (PDT)
Message-ID: <e0b7d735-e54a-44cc-bcb0-ef6f4518da5b@linaro.org>
Date: Wed, 31 Jul 2024 11:48:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] target/arm: Prepare bfdotadd() callers for FEAT_EBF
 support
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240730160306.2959745-1-peter.maydell@linaro.org>
 <20240730160306.2959745-7-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240730160306.2959745-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: jo/4tFvRzB8R

On 7/31/24 02:03, Peter Maydell wrote:
> @@ -2790,7 +2790,7 @@ DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
>    * BFloat16 Dot Product
>    */
>   
> -float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
> +bool is_ebf(CPUARMState *env, float_status *statusp, float_status *oddstatusp)
>   {
>       /* FPCR is ignored for BFDOT and BFMMLA. */
>       float_status bf_status = {
> @@ -2800,29 +2800,50 @@ float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
>           .flush_inputs_to_zero = true,
>           .default_nan_mode = true,
>       };
> +
> +    *statusp = bf_status;
> +    return false;
> +}

Looking at the next patch, I think dropping the local variable is better.

   *statusp = (float_status){
       ...
   };


r~
