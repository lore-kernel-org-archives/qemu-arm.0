Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1796394ejb;
        Fri, 16 Dec 2022 15:55:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv/+yvVu1LoeyiRwFYMSkGZVRWFdl4Xdu8v6MugI7IVnh/HYDujpk9H6uCbmwiRNTTKEm65
X-Received: by 2002:a05:622a:1b17:b0:3a7:e1aa:727c with SMTP id bb23-20020a05622a1b1700b003a7e1aa727cmr1977253qtb.17.1671234944438;
        Fri, 16 Dec 2022 15:55:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671234944; cv=none;
        d=google.com; s=arc-20160816;
        b=HI+1QTmrmoDQEssQRceET1hUenGxWhRG1EpIQ69PZC8LBYG7MTZ8A8T7YZ+AAPpDR6
         wev45MZpo0Hyxes0PPbqodqOW+EDR/nI+7GEOFTcbDA+y6f4BYlAfVur4vzFL5WtvvPy
         g5QUtNQh5SIzpbiryX2MkVoxShrfDWxseDRwU5xWfzI3LV4RLYqNYZZ0UV4d51EdHNhC
         owote5XEUwJp239Z5hbeM5jPO3dfqPC9ZLFh1LqrX0qcDAWrNGvj16EbOTyfpy46SYHn
         3sn+mCTI9uHfD7HkeWv89EwMb0BNZSXnfqrU7nm1gGRp81f4jwTU7R0Om5/zJD0H71lU
         8sog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7HuX3umh1vhBvWljz78x6kDREymcel4L0smmP2tLTq4=;
        b=g6w8dcRlV9GF0LG0NJcYaySTContX7eGsh16hBQwGSpulh8dToV3ihigOWAPFO3N83
         9LNF5ZdOEreeZ9VElr0Z/a9wB08t4D+NlE0OE/8up4Bpey7uEL9Tsu6hRA2GPK66K1iO
         ReUar9fLaKtcJ0iUYBv4JSB5ppJPVH5Xz7wpWP811OH/Kzk0FNKR4b95vQJFpE8msVPX
         PFrg+qsY7bgCtiafB1eSOOGshMGvkfJR/TdemITnWZ5j8Z8L/gvRWrHqhQW3COFaVTlu
         JUQR3pgdV6c5tGaD69BiEJ23b0HZTUIPo4e3Gr0sk+A/tbmw6OF8HuelsxatN6A4Fdz+
         ZiAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UjHCp9Hq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020a37ad0c000000b006febf853eb5si1483239qkm.759.2022.12.16.15.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Dec 2022 15:55:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UjHCp9Hq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p6KXy-0004E2-Pa; Fri, 16 Dec 2022 18:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KXw-0004Cy-Oa
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 18:55:20 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KXt-0003mk-Sa
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 18:55:20 -0500
Received: by mail-pl1-x629.google.com with SMTP id t2so3833599ply.2
 for <qemu-arm@nongnu.org>; Fri, 16 Dec 2022 15:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7HuX3umh1vhBvWljz78x6kDREymcel4L0smmP2tLTq4=;
 b=UjHCp9Hqau7UvqHqt6qgyAYFKvgF8JLA+o8he+aBUxdUU5jbElTyxRdbfZ5lSuOODH
 p9iIJuPH5gOQbgfH9CCP5wRm2fDjMsR19QUGmdWQXfC/kD+vTBKtLkspJnyvmRnh/uJL
 eWuJntVY7PxIJ+qATQomvaQ/IqI0HIludzgZKDgIwGOgZrEhihdZ0do9oEJXHXpRUptH
 Q1K22YVIIN3kKLKVlhqjRVmh+dknG0/q0j1qT/r/sJPZHNkTVV7URArjb/dpdooFTbr/
 gTyOmHUbBtykeJq4wcRhiGtevynpAOTjW9C4VUkfsTL+bk8bLQaa1KrrE8J0SPpSBdkZ
 sEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7HuX3umh1vhBvWljz78x6kDREymcel4L0smmP2tLTq4=;
 b=MrHVlVxIiW0P0ydPpm2GsQ6srd7dfwKp5CDKqmBFKu8BWEfOqDa2/XLb4j4zsxUQv1
 OpunVufgQ4vsMAsXfH5Tsq+XL3FMiRbZJL+3gHDLHN3pXnqhAOL9JL2BXzZ1RNv0JDFo
 Ax5PHBFiURudAJPkMlGkwD51/ImBzv/1cqHStItRJJCZLpndlCyTbBZlFwWHBIl/7etL
 TtBRTyWK6Jtzr9D1x9nHPx80BFKLASipJYzW2jKDTj73Cm3k0rMB553xtaAG2E1iUvPb
 Pj1qJMBo49+pJ3C+AizQ27D3nLUPtUE2TFF9y2ZvN5js8CnRWanpiopigENJH8IJ6uuL
 bRLA==
X-Gm-Message-State: AFqh2kq42Hq9K00BdrWI391cnD8Bwm+vt4Ed+7YXhhhClmiCT5HyT9bs
 uqRc9qQikBMC53N9pUY+7THWjw==
X-Received: by 2002:a17:902:7d93:b0:189:b4d0:aee with SMTP id
 a19-20020a1709027d9300b00189b4d00aeemr183082plm.67.1671234906434; 
 Fri, 16 Dec 2022 15:55:06 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b001897d30143asm2132311plb.289.2022.12.16.15.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 15:55:05 -0800 (PST)
Message-ID: <cd66ec49-c095-98c7-0239-48db53364c86@linaro.org>
Date: Fri, 16 Dec 2022 15:55:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] hw/arm/smmu-common: Reduce smmu_inv_notifiers_mr()
 scope
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
References: <20221216214924.4711-1-philmd@linaro.org>
 <20221216214924.4711-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216214924.4711-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: vbuLCP85uRBe

On 12/16/22 13:49, Philippe Mathieu-Daudé wrote:
> This function is not used anywhere outside this file,
> so we can make the function "static void".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
