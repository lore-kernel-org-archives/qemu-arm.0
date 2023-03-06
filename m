Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4696237ejc;
        Mon, 6 Mar 2023 06:17:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8Xr2neqGxwAFrZRSuvm8W2uCw2ql9T5JTjsYTnS+755SMba6g4ke7y7rbDx629uMAHlXrL
X-Received: by 2002:ad4:5ecf:0:b0:56c:1581:41a7 with SMTP id jm15-20020ad45ecf000000b0056c158141a7mr20013207qvb.38.1678112228208;
        Mon, 06 Mar 2023 06:17:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678112228; cv=none;
        d=google.com; s=arc-20160816;
        b=M/LM0+DOd8crZ4xCcXBf+uvRhW8QF5X+Lsv+zftZlXiAqb/pfsGFflbdb9elxGw1CZ
         d0zcxB9IyOnxhZBQ8TMfuow+dDQgfzj2Ln+1ZotMXlo9p3WHmGHRcsJeytIG92tcLfON
         F0Oh00enWQKzp/KsIiUgAPiMUC4cWkDJiipsKCHQk8uhapfi0idsK1qm9gXwHcYly0js
         fD/Sl+YYZHR31iCXnpDEaCt0wMVtm7CjkoC0hIvROZh+d4WGZO7kGHydojWybBKcHrQa
         8Dx6ve1/pXxrr5THDuCIeA9nRu3TicDUKItsNTxRAwdvgFN7VbpHv8qUfI1waN3Woa8O
         rIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JhuEQ3p/0JOhSZuNJ9191rf4J1UXNZ0JvQASlmYbeYE=;
        b=CfRClAtab9UZjNRVVOHDSPm0HLe2Ix5JoopGSFiVraEzEeMKSU42FR0skn1NIcaLf3
         UaaOReXLRQSuSvhSyuT2zjZqHkcEqDgZ7MiYCE7mCDIqUq/ZQd1ToUM3pttpwf2GF1JS
         Y6TE2/ZT19YhfPQBj/FHrTkWQ65xxFpYYt0bjAojY54v5e2E8I/6Cc3mrqxVnXk+s9kk
         dowDgU5caE1y54VpvAEyLVAsRH0mkPfRrnnPVcBcNfd3kJXh5n+LPqoFDUJWgXs7BSkQ
         tIIlvvflNyTdDTTKUfsJ7PxoYc2ta+ETT6Emx51Pjpz4f8p2URhfa/9FNTXnnBmI8MYa
         1iag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ceYAdKfr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a0cdd0d000000b0056eddf64fc5si6811707qvk.591.2023.03.06.06.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 06:17:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ceYAdKfr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBdo-0006xW-9a; Mon, 06 Mar 2023 09:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBdj-0006vX-Ax
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:16:35 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBdg-0001Kd-Dd
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:16:34 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p16so5725881wmq.5
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 06:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678112190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JhuEQ3p/0JOhSZuNJ9191rf4J1UXNZ0JvQASlmYbeYE=;
 b=ceYAdKfrKRBJIeI09+5wHtOQYeVHJB8c6gngUe707dS5GP4pRfSwb936/z7zwzplyx
 WGdMcpWA/ush4tYmwCyU8iZijhIFP0zcehG3uculDLVAAPV83o971XokAbnASx8u8hjq
 xOmGZM2u57mUtDDtLn7t17CbOrWdMUcIvMNL45hFSSAFJ+U7w3Yf4JB/DrGkGLnaqMtn
 zz8dMEMUSrzGr5HbHJeuUBkatFxMhd0DQLy9yQJW2Tin4F1+Y044FuO5I80YeoHsc/fZ
 LRv3+OqG3gmwKDySFEtlliOQOjC6nzSn8JSywvAhkMiA/I3lqDbO18xoK9Eh+Nazzeze
 /HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678112190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JhuEQ3p/0JOhSZuNJ9191rf4J1UXNZ0JvQASlmYbeYE=;
 b=JB+PjNX5N3Rj1LH/rzS8KZpk1JM4YGRLRCfdAYiWZ/ddEseBYQONJ0jaesxXxyJpT8
 IYc3NPZDSwO9P32+Eb19ld5W0KP2KColpxn0rRK7240uh1j6xudn+kMCrorKUmeq+Jmo
 rhusBr1uBW5J9JGqIFoNjyP3QNTVUn3lp5uDKvpI1axt7chhu33lKeL1MzEcBcGHMHYZ
 EY3VKWg9Y9SG/BrK5IyU1TnP5usPdsByic6+5mVTelxPYQhI7gnyAjwgYTEjA5OgcY6G
 kbSq7WaAYn+eQ8cjrY/Zn6MSvaR4uIhayADwM4OI0JeWmspYV6xFiq/sNfCCbmrFvlxy
 zmwg==
X-Gm-Message-State: AO0yUKUdQnXXhA9j4djEUaxV+amsyjRVj6Hu8LpUWxDTiPoa5smpeA8F
 I82bgk3MCI09PYOEApYGhfSSBOQuAxj9zk648OU=
X-Received: by 2002:a05:600c:524d:b0:3eb:38a2:2bbc with SMTP id
 fc13-20020a05600c524d00b003eb38a22bbcmr8983900wmb.7.1678112190555; 
 Mon, 06 Mar 2023 06:16:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w34-20020a05600c09a200b003e21f959453sm10303150wmp.32.2023.03.06.06.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:16:30 -0800 (PST)
Message-ID: <ca40823c-e766-ea05-6a28-71a267b3d7dd@linaro.org>
Date: Mon, 6 Mar 2023 15:16:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 35/70] target/ppc: Avoid tcg_const_i64 in
 do_vector_shift_quad
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: uAT+/jDb2unr

On 27/2/23 06:41, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/translate/vmx-impl.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


