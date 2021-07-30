Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp523899lff;
        Fri, 30 Jul 2021 12:48:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwetJDb0G/Y7NkloiZOOcJQ5HXdQULw2p8U1S6CeqssMKFt4Ywgi6Vy78QGnQ1eYIl9soVx
X-Received: by 2002:a25:a286:: with SMTP id c6mr5112779ybi.349.1627674491857;
        Fri, 30 Jul 2021 12:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627674491; cv=none;
        d=google.com; s=arc-20160816;
        b=Q66x21MNepYK34qBBoZ45h7XToomruJeeK72NTIOgXdkAevoco0Kl0+IdWajgw/Qyw
         ZeYBZh9f8IPSH925PPdm6wiN0QLWmHz3+h7FwPrdX+Wl9wn8p8uUjdmxhx0t1C6TRQw/
         62UsCBwpH/Ac7yDy5ASWWMeyYwnHA6SaDR97+qEmyAqzfAmjaf0OUAcW3GmZMZ938wVw
         3X/maBnfgKh8X0jRN7pFj37uDoIhZfpwAHQIdJwMS763zbOEnU4OjRCZfQf7feVIktsA
         acUw7CUpE6SpYlyZSGMTRmtIzlSPHlfFgwlIZCeTfemeIxmQ0fekPnaGvRSH07lrzTqw
         wxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Y1fVlefxzFWTPDME/a9xIKg0QQWtUb1i1gNesZX+mJ8=;
        b=OoAr8RSv/xYX+AkZIdYBuPw7/CT8O42M5rl6rKRB9jlyWwp3EEMtFbfCzV29A3F2pp
         my4Wf03d+HoMtDFaInRceITaW4TAW8oUbPwsgElcb6xUmLzWoS9RUTWUJLwUPb7WDsTK
         6pIciOeAmvMTR7qbk9zl8pXJjfPPQFMlHNAR2UybG2+EmAh9BKdGNMiMS5G/DBjOImYD
         lVEg3DonjPINHEZE4SSfCE6OWNxaCtjpxTIxEUC9E7bPP0Yb1kiXtaUM2dDTmv3Hkgv5
         l3UvjhCG8eiRliqQJoEZZ5BFIXX8kUwmZNMLiBKxKHyX8/LVJCkxzGXgvZRxdAl7PcG7
         WXGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrZW72gm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c186si2306283ybb.161.2021.07.30.12.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 12:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrZW72gm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9YUN-0008LV-0f
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 15:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YU3-0008Kw-Df
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:47:51 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:47005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YU1-0004zd-Sr
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:47:51 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so15878595pji.5
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 12:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Y1fVlefxzFWTPDME/a9xIKg0QQWtUb1i1gNesZX+mJ8=;
 b=CrZW72gm8eVN2Pibpl1CTyfxrdupFrjGu2OxdpP1EHwgUJp+67mfL5IuNyuNlluVsG
 H7AK4t45+d12nmLtM5yNNbskUywFaViwDaiwC0MTpNbir0mgoogevdDJKdY5rA00TJXr
 Lq7cHtp9LJnXGKuEHTB8Uy+7j1Zy7zFik48ZbLuOK1AkURtXAQqPJPKJ5u14w7sBZQx0
 UENorTkvlVHiJRBV9W0fYJQPTabt+Sr1ng6wSJrHc2ze4CnrJyMMLkmmtDbGU8JYTiy8
 7KsUybCrL1t13eaY6l2/pC3PYCdA2uMm4glQ8lVvkuNvD4gz4pXNf2S2DVvo4dHsehUP
 z6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y1fVlefxzFWTPDME/a9xIKg0QQWtUb1i1gNesZX+mJ8=;
 b=Hu0fPfOyfb+YAHSHYuAhBu9gsAThtCCs+FB9CRiJawDgrl+ISy7laRQ/3kqD5ygTcI
 I3NGKJUCwaJi/8wt4D3LXT+8YATCnWOx7FLKxvwSoZl3QwASnYbz2e14dP3CN23AI795
 soe5BDLDMb6LjNmEbnICe92xFpKjU5lozvyBYM71ucZAexnSmy1cYMBs4XrPXEBpOxb/
 P79WpFn/Lt5hQkTaMm9PBLIdByoIoYixt75sZHWmsnx7uswajogI2F7cmHNLJVlq5saR
 K9ai6KpuSnW9XpiZhBvpzLsNeUp+OMpBgyIwG6AKbBg+6YwO1ZJdOG6nxLe3a6dDrWIn
 Xmqg==
X-Gm-Message-State: AOAM530RgcOwZeRqxSKjxhUBjNJZqeE1OFRU0jz2/91p07vijNPOJnWY
 PifRk0j0aIBSwpXFcPpncJfVyA==
X-Received: by 2002:a05:6a00:1c6d:b029:338:322:137d with SMTP id
 s45-20020a056a001c6db02903380322137dmr4208616pfw.38.1627674468173; 
 Fri, 30 Jul 2021 12:47:48 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id n22sm3299812pfo.125.2021.07.30.12.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:47:47 -0700 (PDT)
Subject: Re: [PATCH for-6.2 40/53] target/arm: Implement MVE VCMUL and VCMLA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-41-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b598cb8c-2b68-ae6c-f634-ddcf3287a408@linaro.org>
Date: Fri, 30 Jul 2021 09:47:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-41-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n+QdLgqaK57P

On 7/29/21 1:14 AM, Peter Maydell wrote:
> +#define DO_VCMULH(N, M, D, S) float16_mul(N, M, S)
> +#define DO_VCMULS(N, M, D, S) float32_mul(N, M, S)
> +
> +#define DO_VCMLAH(N, M, D, S) float16_muladd(N, M, D, 0, S)
> +#define DO_VCMLAS(N, M, D, S) float32_muladd(N, M, D, 0, S)
> +
> +DO_VCMLA(vcmul0h, 2, uint16_t, 0, float16_chs, DO_VCMULH)
> +DO_VCMLA(vcmul0s, 4, uint32_t, 0, float32_chs, DO_VCMULS)
> +DO_VCMLA(vcmul90h, 2, uint16_t, 1, float16_chs, DO_VCMULH)
> +DO_VCMLA(vcmul90s, 4, uint32_t, 1, float32_chs, DO_VCMULS)
> +DO_VCMLA(vcmul180h, 2, uint16_t, 2, float16_chs, DO_VCMULH)
> +DO_VCMLA(vcmul180s, 4, uint32_t, 2, float32_chs, DO_VCMULS)
> +DO_VCMLA(vcmul270h, 2, uint16_t, 3, float16_chs, DO_VCMULH)
> +DO_VCMLA(vcmul270s, 4, uint32_t, 3, float32_chs, DO_VCMULS)

Here you don't need to pass in floatN_chs if you use floatN as TYPE.  The macros to merge 
mul and muladd are clever.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
