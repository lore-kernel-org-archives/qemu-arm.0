Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4673322ejc;
        Mon, 6 Mar 2023 05:59:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/B6KMg77/luC4b0Cb/hEuF7uI/jEzBU1Jw67k1V2fpv/8VlPGpq4kcAYTZGZKlE5O+G3v4
X-Received: by 2002:a05:6214:262e:b0:56e:c1f5:137d with SMTP id gv14-20020a056214262e00b0056ec1f5137dmr19107098qvb.29.1678111155212;
        Mon, 06 Mar 2023 05:59:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678111155; cv=none;
        d=google.com; s=arc-20160816;
        b=VR97qpTPWsglAF/XzXdgUpLWVfDhWyNiJphGgHSgopR10AvE+kvLgHgAyjDMn+pi40
         41vt1mLUVWlzQ7niNMAS+LejuQlB66wKOl0e+ER484lDNxFNQ0SjzdL3Y6THWWr1+nLT
         cR547zW6acyAt80BrYeAoXYBzl93/RbZoIIfxa3ywRBn1BsvsSeyjLRWYSSrrRIcknDO
         xmpz/oGXQecxlfeNlEoZ9NocpLhy1g2QLgKM7uYsKo0xYbUzPPri1YqvFs6PX5h9/CiA
         0GHCa0GZggFT+2fjNcN7/jHAnipBonhjqoDUJKcgdsJvRtf544ElArmmNy+K8YH0OX39
         73uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DI/zPSw4eGAzbKJLM/vMwuzwC9Q1kazbtQU4gdQXV5U=;
        b=bPqr9xvf8kZbe2CtGa3OrvjmNf4QSxoVIhgeX9b5EjNhkR7owujSlYzI6lMDwKVzuX
         4C9Nun6e+k7h5sOZzFQOqZE7tL1KvyoGqT9Uub6MvZTKZkq6+WQNmQKrm7M0cUQtd+qn
         a5U9UY1U81mXjv+RlQqga3pQmqTg6r0ZXNZ3v6qVGPbiZXoxVSBCWZ1PefLpKTf/najY
         rKr3MXVMJQH32WECUWKVi3wf6iBMHm2CEpOIcvBhbHxcRqSJJv5ZLI5he1QDpF/TYB+e
         KldbI2JAKKNowwr/XmhTC4lnQg9Lhzn7KEJB2RuDxOs+GveSP6/UMsFrb8dxFLBNtj83
         CzPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k8QOzAgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a0ce34e000000b0056e98779ab7si6851509qvm.380.2023.03.06.05.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 05:59:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k8QOzAgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBMi-00062I-Ky; Mon, 06 Mar 2023 08:59:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBMe-00061F-7N
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:58:56 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBMb-0005rw-Dp
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:58:55 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so5247513wmq.1
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 05:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678111130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DI/zPSw4eGAzbKJLM/vMwuzwC9Q1kazbtQU4gdQXV5U=;
 b=k8QOzAgJyn6fMGxyWKOSjbiANdSu4qnoj6pdvEnwY19U48DlPqpz33abL4dy0nuQLr
 l+/Y0ugaWKrE+Algxxz+6UXdtzLsu3i9Qeal+LvY273XEaIKhT0GkW8FH1NwcznZKesz
 /AbrtLSh9l1+o+XNHMDvAwoabLCB7QKPpW7vlSnU45pO/QjsXzc49X+bAYOLdLIzTYk7
 WvMg/UeivAJhysQzbnO3/Ddx+f6wTRNxZqL+ByIJgUJV+cjFLT3lFcBKALPmyuoEs7cb
 JEqG3PLVimB3gYz3PyeZsEGrI0v673jfgJaRqF1Cteowm0+0z6FRr/wWjm20eV8RoY3k
 nlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DI/zPSw4eGAzbKJLM/vMwuzwC9Q1kazbtQU4gdQXV5U=;
 b=axHCkEm9yfSKA2zJ5iF2cuViKzQ6KInzHn4kiK1RDtjQPpPzYDsEY8YBUIK8Yl6mGY
 loyb4Z73J+miH9M8faXFsX5gx4o3gEQD6Rl6c/iuUiixWIFll3ANiwHliMBqJVfLwf0l
 7pS5l7uUb8u1HamKlB0T0QqODDUAP3VfxAEmEoY3nkbkrpJyRupebMpwJy1IhxrlVPZo
 RRw8FVg8HpWngpmbYl2D8IKeBG2BUPkyJMSal63TAZSas5nvE6GkNxkDqvp5uL9Ddaek
 uF0LVWYQVM57JFsFVvvL2lXIFEmj0dixWVw0SsqD5wy2oLOuHdABChQ812Sb+EORypN1
 FuhQ==
X-Gm-Message-State: AO0yUKXVxsvKEELzyJPOJwFmOL7hRfh1YDzInSkOHc1Qt2xTmxYORljv
 UHUcmOYXZkOuPxU6EZg6oga7tA==
X-Received: by 2002:a05:600c:a05:b0:3dc:42d2:aee4 with SMTP id
 z5-20020a05600c0a0500b003dc42d2aee4mr8493877wmp.25.1678111130560; 
 Mon, 06 Mar 2023 05:58:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d42-20020a05600c4c2a00b003e6efc0f91csm9996133wmp.42.2023.03.06.05.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:58:50 -0800 (PST)
Message-ID: <b00e91f9-a5b6-b389-85e9-7d1c886a2906@linaro.org>
Date: Mon, 6 Mar 2023 14:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 04/70] target/arm: Consistently use ARMFPRounding during
 translation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 8ChVKwLG7L/c

On 27/2/23 06:41, Richard Henderson wrote:
> In preparation for extracting new helpers, ensure that
> the rounding mode is represented as ARMFPRounding and
> not FloatRoundMode.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-a64.c | 16 ++++++++--------
>   target/arm/translate-sve.c | 18 +++++++++---------
>   target/arm/translate-vfp.c |  6 +++---
>   3 files changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

