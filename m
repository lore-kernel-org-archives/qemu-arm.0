Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1709219ejb;
        Mon, 7 Aug 2023 13:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO9CFJ/sAcWd2joAQb2OI84yKyS8W+omeM6VCkBwjGbRbS3j6NIV1Yu6HGLzQJ3otrfy+m
X-Received: by 2002:a05:620a:40d6:b0:767:1f3d:5d14 with SMTP id g22-20020a05620a40d600b007671f3d5d14mr13465018qko.67.1691440801353;
        Mon, 07 Aug 2023 13:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691440801; cv=none;
        d=google.com; s=arc-20160816;
        b=vwScTnVCX9JWqyo0EaFp5cuZwH7JVSfFylJf2gbYmxiGajODft5o6vcT46So1NAMYY
         Xfnd2G5ZDatgm64lB/nD3RPLDU9QdhWOTm7v5dJsYBjCENIyy2giWtWPaXvU0eNDpjnG
         c/FseM4km1KLw+uWq7AJAoiQA1Dj/o4twXt3x+GpfztsrnNF22cy7rEaEKjo+OOK1FbH
         IM+HzszDiTsjuc57aSrTkQlkqro1Kf8R5acWMC/ksM0GFsD0eL30Whd+zKE4ClrWhg+v
         0Uo1ZFbDrzFOA3yYi3V73le95alG+rUjlAMZm1NI9svVQ7SXW3CO58J3H7/gaGiUr0ly
         lFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wqP3ahU9WRjLaKvK9Qu5mKDxMCywZy5ruY4d11wZ89w=;
        fh=8BOuv7eAieu8uJPT09bTs8lQLOGBrEJe6CvImfJ4rQ0=;
        b=vY80cXrGAmXOl59qBw4UNJihq2uJMzIpbAK7+QsnGKBymP8Q7undctOqgXAAOao917
         OZ9fabho7pWoJ/ZTx9RBef70kF5yBjYlwIA2iNdZ9mC0wkY4bcrrxI7braiFAxyYerKC
         V3z0ZU/l274PExUOP4E2QLfrZG2uyysGqKX2p3a66//ZgXPlDFLeuwFsdeWXr/kiLTWs
         V0TrDm/Eog+Y/fS4F678lPPTxVURBLSB41o9fB44BXOc5HVPBkbpfDlrQcep2XloaldY
         prewqTaXWwWrV71cFeE9t9BJl7+1EPqmgNAiyTb0Ag6z+GRnBP0yUVtJShaBJM13gsiu
         zNxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C6VXhQ8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020a05620a014d00b0076cb0a00e23si5317044qkn.711.2023.08.07.13.40.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 13:40:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C6VXhQ8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT70w-00023d-2X; Mon, 07 Aug 2023 16:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qT70u-00022f-PV
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 16:39:40 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qT70t-0004PQ-AY
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 16:39:40 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-56401f1da3dso2741517a12.0
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 13:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691440778; x=1692045578;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wqP3ahU9WRjLaKvK9Qu5mKDxMCywZy5ruY4d11wZ89w=;
 b=C6VXhQ8Q97+azootpzg1O/gTNJ7s2Z4AGtbRRI3CsTatjkhlDFoUh/MgYya00/N2Yt
 8N/t9oqWFs6FqwQEFcKJQW6098ssb7zfZfXxRohN5wmDx2xDgtbxuJo6Dk9aGgxslvf3
 Z3bj4RIcuhK/txlyMwcVvqRemjvv1SM/0z2O5B2m+cCVb7SiHQOX/Y+XdEpZ4vkmGb1W
 BGIgmH0USR/MtlVR9ZvXFWhds2osoSq+eOahHLdVcnEEVC7TS29zCqKaOGoA4tjfUk4O
 xlF84j/8QsMsFiMaTR8AM5N9bOpaOQw74BJGXlMu+JYMrQReHGgmFNkOpXpl0TNlw5dP
 z88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691440778; x=1692045578;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wqP3ahU9WRjLaKvK9Qu5mKDxMCywZy5ruY4d11wZ89w=;
 b=OYWMeRoAU0sm78bfCj1UV5txPqtP/Uo77XxlWA0zs/qzpqFcR4cKLbpGtOuKQHtsNq
 YsI4wOpHjbuNSs/zuGZvTjQytszYK98T/87vNIazbjZlfghwOocZClnvQOwF9XD2iIwz
 uj+fizN0hkVcsJPHLkjkaNpkxzR9sbl8NuutZ+rNRfUdGmOASP1HkhZvmMrziBPQqcfw
 yaLyDdhNbImEPtj9gFsaSBq3yFghekgXpord6bAZtFQeZwS31NY3iHWQR9La4F2/A57S
 aZ6WIS3aMUphb+pytugylGezguQvsRhA0WYf+4SuphSowAi0ObMQVL20blkgRIGQZSuU
 Mm4A==
X-Gm-Message-State: AOJu0YwPNHQ8SkeQIrHZK08+Ba39ZjnP8Ft2aAX2xjuHoTrFxwFflkgO
 lOuhehiiT/lyRM+iJLNdPFXfIg==
X-Received: by 2002:a05:6a20:9390:b0:134:15df:b148 with SMTP id
 x16-20020a056a20939000b0013415dfb148mr11407604pzh.29.1691440777687; 
 Mon, 07 Aug 2023 13:39:37 -0700 (PDT)
Received: from ?IPV6:2602:47:d490:6901:e306:567a:e0a1:341?
 ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a637518000000b0050f85ef50d1sm5325006pgc.26.2023.08.07.13.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 13:39:37 -0700 (PDT)
Message-ID: <8bf33fec-b26c-1f48-d817-319f17b3ad93@linaro.org>
Date: Mon, 7 Aug 2023 13:39:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/arm: Catch illegal-exception-return from EL3 with
 bad NSE/NS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20230807150618.101357-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230807150618.101357-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.809,
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
X-TUID: QP9+pvyJCm8s

On 8/7/23 08:06, Peter Maydell wrote:
> The architecture requires (R_TYTWB) that an attempt to return from EL3
> when SCR_EL3.{NSE,NS} are {1,0} is an illegal exception return. (This
> enforces that the CPU can't ever be executing below EL3 with the
> NSE,NS bits indicating an invalid security state.)
> 
> We were missing this check; add it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/helper-a64.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
