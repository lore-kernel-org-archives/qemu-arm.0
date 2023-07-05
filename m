Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3622151ejy;
        Wed, 5 Jul 2023 07:37:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5GVnZw4hkbFyxHBo9btVLem5Geov+md3TLJHf+6DRwcR+7vH+DfQ9FJpylQvckOjQ+S3/3
X-Received: by 2002:a05:622a:348:b0:3fd:eb53:3d8a with SMTP id r8-20020a05622a034800b003fdeb533d8amr21128907qtw.26.1688567837558;
        Wed, 05 Jul 2023 07:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688567837; cv=none;
        d=google.com; s=arc-20160816;
        b=tprNkliLEgjGBQcS6xShGC4Z2JDZGL1gckowufpTCnqPONjt891BjW4MuxUEJ9ACqu
         BllDacW0eYv9qldFVWNpmtFbtnjcXmmNwHMZ0UUVn8ig/42q2UeyVjsnb2mxcelwEDrT
         VQ1hS5XEuFwY3UTE1cDjHLNy6srU+XMZVqXPEV4W0AtOlJUhf9+s08OO+3R/6FUcCqOf
         ZQATz/UZq/auxIhDEXhZwKT1Gxl4zCB+R/k/3yILWkZwZxs06/yPAxhv5UAHqoo0U9iV
         p27qeafXIIw6re1uAPQQ5DdXXss8EHaoJCiHHPvVK1EEJBzqy2p5LQRzDE1VbshTJn9i
         689A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=pVXXFyrrUQWj+YEFhNJ6H8UEs+ymG9N4wGF336xLcx8=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=VH3NzqcP2FuvSx8omLjf27AnypiK1brCuMZcTbckB3hB0ba+r1bleKP94mvGmNkGsN
         JWSxzCHhDZL1V/1mUeP9wQwSBf2J32UH5T09PXqRKJBaaB3thlrCAJAvbHA0pSO66Wz5
         2id2rn5RXv5yeRmx0X93KS6ja45Q3wZRzGvNBzRjyp0P0wYenH2L12aUMgk6Z/tdhxOe
         JTMwIpj63BLrkgAwLexQYZQscZwtzuO+BwEYdb6RcM9JXX0yFFd37jSUkmEfn7XHRhIJ
         XON1ERMK4DN6Fz46CswL0tJL8zfv5iz8BN+hpvLHEBdtKJB4YehB1cOuAlrs0a9eWWAj
         5QGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F3jvq5N8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020ac857cc000000b003f392403260si14468623qta.329.2023.07.05.07.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 07:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F3jvq5N8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH3ch-0003GJ-Mr; Wed, 05 Jul 2023 10:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH3cg-0003Fs-16
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 10:36:50 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH3ce-0001Nh-HB
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 10:36:49 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b6ef64342aso43103271fa.3
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688567806; x=1691159806;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pVXXFyrrUQWj+YEFhNJ6H8UEs+ymG9N4wGF336xLcx8=;
 b=F3jvq5N8N6cPohU2VXiZWj+1EGIxYfm5lnuCO22e86K7kylXJ7Wy3puIauHK8SrYVi
 ts/9MC7xyMgRNB0UcReSgKpEcuBHoztaj2kog+3CTnuLm9y+DX+7FOPzXLw6i1Y+gast
 X2ssH3naI7gfvCMOOd91QachVtuVYsrUd/HYEpQI+0F6qdbP2Su/hCIkyJu/StlGD0Uf
 QAgWK3nzgVvQlWQHzij3MG0T5Hg1yeonXMQmmRfZg8fsHmZdEdQsZaUXzh1fWA1XLlPD
 R5CHhkrAE1pX/t1beimm8S/zVavNnUJybcnRvJdSL3EWCIvSeLr20gZn5os6VGTtUZvm
 Kd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688567806; x=1691159806;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pVXXFyrrUQWj+YEFhNJ6H8UEs+ymG9N4wGF336xLcx8=;
 b=KazO+qFtPCS8tsxBaqFhofNLP16uNHFdCxS+KQDbX4X2Q3MOFPNJ4RDKaFLk0pUEMo
 KPIhL8imOoBgIZrPt5epXhJ06rVm3KeL4bintZpp7opj+kaprCeBRzgZlfadMtdV62yA
 58XNE6CSNU/mXjeiuh0/mFMPxdOskcQi1SAnRZsKJyFmlI2yrlLoOhO6kge0QUc2Fb7a
 eD+wSFbks/cPtWOqp9rDfXURDIbquZDd9h5urODOkIwTtL6BZ6oVQ8eQVnsjxXr4Sjhn
 SSsSJkx8CtC07iCoiGAGWPUVtAykm5MZVBPV/huTpq0KLUvwmbb9bFm+GuwfE45EPosg
 Pe0g==
X-Gm-Message-State: ABy/qLa38FIFSgjiZ+llHEzzcKqlLea3DcHXODgBkAABWg+UxLisgUdg
 PguYdoh6kLi4QUSgmIl7mjy9jQ==
X-Received: by 2002:a2e:7318:0:b0:2b6:ec69:7c3b with SMTP id
 o24-20020a2e7318000000b002b6ec697c3bmr6248225ljc.46.1688567806259; 
 Wed, 05 Jul 2023 07:36:46 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a2e9c12000000b002b6df22f0edsm2596126lji.64.2023.07.05.07.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 07:36:45 -0700 (PDT)
Message-ID: <f6ec16da-f104-01b6-553b-2bebf0166759@linaro.org>
Date: Wed, 5 Jul 2023 16:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] target/arm: Avoid over-length shift in
 arm_cpu_sve_finalize() error case
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230704154332.3014896-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704154332.3014896-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: XncfduwhUKgv

On 7/4/23 17:43, Peter Maydell wrote:
> If you build QEMU with the clang sanitizer enabled, you can see it
> fire when running the arm-cpu-features test:
> 
> $ QTEST_QEMU_BINARY=./build/arm-clang/qemu-system-aarch64 ./build/arm-clang/tests/qtest/arm-cpu-features
> [...]
> ../../target/arm/cpu64.c:125:19: runtime error: shift exponent 64 is too large for 64-bit type 'unsigned long long'
> [...]
> 
> This happens because the user can specify some incorrect SVE
> properties that result in our calculating a max_vq of 0.  We catch
> this and error out, but before we do that we calculate
> 
>   vq_mask = MAKE_64BIT_MASK(0, max_vq);$
> 
> and the MAKE_64BIT_MASK() call is only valid for lengths that are
> greater than zero, so we hit the undefined behaviour.
> 
> Change the logic so that if max_vq is 0 we specifically set vq_mask
> to 0 without going via MAKE_64BIT_MASK().  This lets us drop the
> max_vq check from the error-exit logic, because if max_vq is 0 then
> vq_map must now be 0.
> 
> The UB only happens in the case where the user passed us an incorrect
> set of SVE properties, so it's not a big problem in practice.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu64.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
