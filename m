Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp181042ejt;
        Tue, 20 Jun 2023 03:24:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pvbY37Tzgo7FezTckBz0MUX13iA4WJn9Ffu28l/0OU0fk/+3RAoPL0LqQm4DyuO4H9MWJ
X-Received: by 2002:a05:6214:19ef:b0:62f:e761:50de with SMTP id q15-20020a05621419ef00b0062fe76150demr16052092qvc.33.1687256685489;
        Tue, 20 Jun 2023 03:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687256685; cv=none;
        d=google.com; s=arc-20160816;
        b=pO99x+7wet+Wzm1e+bg5CKHn2wfCua0YzENSzjUYfDdUDU9hqUe7nV7X3jv8JKKmc3
         NCEi2c/LPTdglrYW8dPw05WeCj3+zVEup+SKerWiC5UFX0TPw+m3f5yFMV4dCYvuZU7H
         lBRtrytcUA5IC6OOfVJBiBS4Q1p/0KiQpOyqKnjYSEDmYeuc4ZXfWo/ry4Muwvisv2Vu
         3SvTRRa8QCCf7HEEtODQvNrLG+MM6yKtvromG36mdgWY5CNZOWI1E3wAIFeACvIb1g3I
         v8aOWdduUEl3qKunan3A7e639y858lEl8oZZvhYGEK+kkXTEaKkR34X9LmCyeH7LZSg/
         7kKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iVYJ2VqMyIE4bNm2xHt6WeLaX6F02wLUlKxzdVquiuk=;
        b=Eu6G0GOXeTDMDVyUbW6//CxyRv9JGrwVD10gPKJR/rglA1RYpU02LIuVoDNqUz0JPK
         ifaAKyXXEVAk353DJCbrYGBng4Ccb8D75NoJotcien5sBdsAQFhnrvWnjH6TQTzgMg+A
         3w9l4lB5HiDLaGoUv2p/C+UdSZn2P8hlHbfIsDAv4vVMUcaHCbjPi+J+af4V8uN2e+8r
         2m8zVCBEl2CKO0yi5/smFIl1JQtfZAV4ephABSmB3dnXcAQA0eG/3tA33DWDwFhoIAh3
         AOo+f5AdiZKHEhldaA4aoR1SRl83XSmAVAj4qkUYGsLStZyrsQGhE26+pfsZMWGoia/N
         Fe9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fjcpGJE0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3-20020ad45be3000000b00621257f084csi698618qvc.156.2023.06.20.03.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fjcpGJE0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBYXM-0000p3-Tu; Tue, 20 Jun 2023 06:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYXL-0000om-Nc
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:24:35 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYXK-0000bx-88
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:24:35 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51a20c744ebso5311768a12.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 03:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687256673; x=1689848673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iVYJ2VqMyIE4bNm2xHt6WeLaX6F02wLUlKxzdVquiuk=;
 b=fjcpGJE0O14qMTmT7SgTHrepugkxyky49/5GC+ACUqhRMdUIdfxzz9kylHaWOOCvCh
 QboE3WTzyjCzWenK7LTKIF4LwdTc4pAYzh3frD1HFVSDVRoBTwCK3lHCeVKG9iHjMkFv
 MK/Tk8218kQFlvQ60Q74Ri6yfKjnQrvyzLmbHGd+FVuUTwLkT1yD0rsXRSxr0Lgh1UCQ
 OOa+psXJ0432AZmig4HZvhFTrf0535H238MmBuTNmBiCblpxDrM7U3FoZ9uAIHt0w7K6
 /Kgj0C2YYn3pS3LVAWgVqSG/NI5SMA64q9TUuPHuh3/sLbouzFL2+lCVV9QibdBNXDTx
 OaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687256673; x=1689848673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iVYJ2VqMyIE4bNm2xHt6WeLaX6F02wLUlKxzdVquiuk=;
 b=O0R699xfXNZDbzI6TpkCQhnbJCVjsaMO+DfleaHVRTNdOaJcMAsnMEi8r/KwpeJupX
 mG2TxOs6h5LXqkEBVxGYCx5X4kiI4LB8UtPgezT7v5qdDXtbk9DqcAZA9BPJMn3WL1ri
 Lf8dIK0moK8aODcHBTFf0lepGYlgd1y/afkLQeKtTml+6TQyxQgIcKYqjm1MFsY9QHP1
 V+XqcO8n1zYg7C7+vBiGK3fyBpWcaoJ742HaKSDrk3Nzfdq4MTtH6ZClOqvZupZX7XK6
 0q/JN9Ntr044m1oVvgRVfqNyWe2locwijOfKVMF05vBdW352uwXxr1MYVV0JxpNY6hGM
 o7Aw==
X-Gm-Message-State: AC+VfDySV9erzyZ4uxIntnKCd8wmyk9Gu97xYEvHps4p43Aw1m3fIm9k
 QUHDH9vmoUOHZc79F9Lm4rS5rA==
X-Received: by 2002:aa7:d5d5:0:b0:518:6a17:98b3 with SMTP id
 d21-20020aa7d5d5000000b005186a1798b3mr8930623eds.10.1687256672790; 
 Tue, 20 Jun 2023 03:24:32 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a056402035000b0051a2d2f82fdsm959594edw.6.2023.06.20.03.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:24:32 -0700 (PDT)
Message-ID: <f50b8017-5f4b-5f8d-2604-ed8a4c3a09df@linaro.org>
Date: Tue, 20 Jun 2023 12:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 14/34] target/arm/tcg: Reduce 'helper-neon.h.inc'
 inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619155510.80991-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: +y4TPSTIu6NA

On 6/19/23 17:54, Philippe Mathieu-Daudé wrote:
> Instead of including helper-neon.h.inc via helper.h which
> is included by all TCG files, restrict it to the few files
> that require it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h             | 1 -
>   target/arm/tcg/neon_helper.c    | 5 ++++-
>   target/arm/tcg/translate-a64.c  | 4 ++++
>   target/arm/tcg/translate-neon.c | 6 ++++++
>   target/arm/tcg/translate-sme.c  | 4 ++++
>   target/arm/tcg/translate.c      | 4 ++++
>   target/arm/tcg/vec_helper.c     | 4 ++++
>   7 files changed, 26 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
