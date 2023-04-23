Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2394830ejm;
        Sun, 23 Apr 2023 12:01:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350a9QDhEnnWD18b9F94Y/SuZqAnb8qdvGsR0mJcbJPfseYxbDFPngiZ4O7SV9F095pq1ijrg
X-Received: by 2002:a05:6214:1c43:b0:5ef:8b6e:583c with SMTP id if3-20020a0562141c4300b005ef8b6e583cmr20988015qvb.5.1682276490088;
        Sun, 23 Apr 2023 12:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682276490; cv=none;
        d=google.com; s=arc-20160816;
        b=QWhqtWv19PFd1qgpLuXdHA79dtc+QvxJMIb5jQ0lCX2eUhPClwoyao5HP29d5HUwuA
         6POfipS5Z3YrBrNAsaAV9H944gRgiDymhkKrCmFEfv7fhR+6V3Y7QLEmdp8uMieXcbFp
         pVUVu1WSBoNXEGZpjn5NhJCuUBTMKb+vjrZB4x5waEF6fcoKK1jrrdcZoMxnfTTQSYYY
         FKTHThcB6/RoxihzgILCHdbKM+hZCK7+IgQBr7CiFQTxa7XB52hnjz83Su+1Z3QugiSD
         Q6fCYyursK0WxDIxV0Dmlkj3GnDFxCjY1EG0vHs6ZRM/7awDWa51VwqvJREVXVpaZcYx
         CXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uPT5IquUj9tb4+7LJOV+d1U0Pln7SxXlXrcpMKrPgHk=;
        b=s8/pbIvVkzUa/PrxHeJdGfqB393gpKaCwNy9wYvHH3zEvhuBlCAYLjPXxog4/em+Al
         50WJjrm2tA6mh10I8l3QHp1dTZeXcroLMdqkwSLv7g3LDVMrcRPIj55hBWFupceFy1OZ
         1JVZEz0oAzkPkrQUwXdOCscK6RWoJJvKoXhU7oQQLQp9K1nhhUX1WsBNGBgYWtjTDxXy
         MWuq+ezpMXLxmCzEWT09dBfgRohmeQcCJasNYx0CvAlisdSfxr/eRy+dd0lZIGy0HdSD
         /9Jp+Sq3g2Hc01TJxcaFJLLE/tPzKf7pB4Qm2tfgu/oOcigGDuG1o7qt4sQKGCPC+TG6
         8nbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UVtRUyQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020ac85915000000b003e85bea7fdcsi6497358qty.19.2023.04.23.12.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 12:01:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UVtRUyQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqexF-0000LM-Nd; Sun, 23 Apr 2023 15:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex8-0000DI-62
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:53 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex6-0004IS-KE
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso23540225e9.1
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 12:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276448; x=1684868448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uPT5IquUj9tb4+7LJOV+d1U0Pln7SxXlXrcpMKrPgHk=;
 b=UVtRUyQevj4Ridz78/lh47/44VmynhJ/hApAUTmtdKarVQ3vih5OcCEg8tmjsDvECz
 zsN0Lk/fwNV3m8mzICWo5GyBOyOLGrneiPUBxwejiM6A3yqw7vV6zordSsrUWFiBhtQ5
 OvA/a6wncQAR6YKCp0ZWZC0U6FMuR8QV//6NBhdaYbG9+vuylxkdi/MajR2phMaVeVtr
 DLzPRTLUnZrvTYCm66joUGr52wmGg4oo425fVS4tmjdMqR01WBMNACxMzSZv/0PWDFh7
 Z37iZqNHMLkx0b/aTF11iS28ATBIsozFxHfyWMbudgPl6lzddk78q4bEUHmSXaDjtKXz
 JZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276448; x=1684868448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPT5IquUj9tb4+7LJOV+d1U0Pln7SxXlXrcpMKrPgHk=;
 b=LyrZkc73DYgrzck2Bgy2HE06PEELSaJXfhW+0MB1S2pWVA5aA6jq1wCGgN9J3qHBGQ
 XMeD0Tc/LjovI3vjVct7FT7FhPMWkqHiz280ZnGLfiFHUGFp5RqvZONm8pHpU6Ck5XZm
 Z0/ybOe0RzyjugmVbGdiwY6+pLWv5giHZbo9Ob30YqqxHWSa0V5U9nXtly3qyZ22wgNh
 6CNAvPYwGo4q/2gyEG3pmLgNvaUVoe2RHV51TBJ5S+K8y9JfPivBbaJ0tj0GIJIuwGC/
 TxYOpG8guF2Hu3/jDtv5x3sOb0eZD6UBbq82aUKNzvTCRnQtmYDxLNiHZlKkb0HjILkx
 frtg==
X-Gm-Message-State: AAQBX9eoOvLuvfaI0QPYAw0e2a8xD1dJSVIiGRzeTJD0tKspm9I2BAQ5
 34aGR1eh62zdQ6EV49FsOUEXSQ==
X-Received: by 2002:a5d:490a:0:b0:2fa:631a:9f23 with SMTP id
 x10-20020a5d490a000000b002fa631a9f23mr8365465wrq.2.1682276447863; 
 Sun, 23 Apr 2023 12:00:47 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 x24-20020a1c7c18000000b003f183127434sm10299253wmc.30.2023.04.23.12.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:47 -0700 (PDT)
Message-ID: <b99df8e5-6b3b-ca74-7733-433cd5643fd4@linaro.org>
Date: Sun, 23 Apr 2023 20:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 34/54] tcg: Widen helper_*_st[bw]_mmu val arguments
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: vY5kSmkRjPrI

On 11/4/23 03:04, Richard Henderson wrote:
> While the old type was correct in the ideal sense,
> some ABIs require the argument to be zero-extended.
> Using uint32_t for all such values is a decent compromise.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-ldst.h | 10 +++++++---
>   accel/tcg/cputlb.c     |  6 +++---
>   2 files changed, 10 insertions(+), 6 deletions(-)


> -void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
> +/*
> + * Value extended to at least uint32_t, so that some abis do not require

s/abis/ABIs/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> + * zero-extension from uint8_t or uint16_t.
> + */
