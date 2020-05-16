Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1010006lfb;
        Fri, 15 May 2020 19:01:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynS8lR8QjMJ+g3y9bHSG7jdKWUrLzy71iD9oljWyDp1kfsUnuc36nuVwyDMA6KLSLe0XyA
X-Received: by 2002:a05:620a:142e:: with SMTP id k14mr6205699qkj.414.1589594518384;
        Fri, 15 May 2020 19:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589594518; cv=none;
        d=google.com; s=arc-20160816;
        b=R/lnOPWRRAmH6NZrNfhmjH6JSrM7Xhl6mXAO4eZ64Ep7VrDB61MFbMBj0bLVfTtLYt
         ixx/5LYqq9TWaaP/1ZE601MyAP1CaDfjLks5rt7rp84OTzDETXr5oIMhtJiLSFTzHVFN
         r1+1uJi1W0Rn3T1aJdPmQhJ1s9a9DuBfp0UozjBj5sHo41hsg6Sy1+3c4Iieq/mA2Zpp
         3xvE7addTvDla8ne7FPcz1Ic1CKwST+olowNMRTymLMan3gzE7v+G9g6JF1ZhE4pN3Ib
         TKM+KqpUaeOMWg2qVfRh2GJy2S9bSNRzQeKnG1j3MmCe8obyyh8AByCIU1KeUNnnM0Zq
         tnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IF3tXI1TMlEtzrjtBcqcUgSSgHp1vkmBfAtiEG8puJk=;
        b=BXeqalOTOR+5G2dhqNF46Rke4v696wkTA/cQARWZ2KrF5Orl67h/tz+wGjw6AdQKNm
         7FuVcDVIwyeuj47TmfiLKQ0XwNzJwtrUE+ZkBCUMtqmV8rKAHXgIvqPEWQdP+9RPfMaV
         N80E2qr+uxnm8lNJ9iwDEakQf5TRWu2j/23sJAfXWiJ8OGa7rAdcRKVyeGVXvid2bbWC
         EWYdghbqsWo1WYx2txyrW5m522GMuClH80q09bfS5J3qneFGkUlNcLMCRjNsfllbNwPy
         ryJfgUYyIhZEepPY4dsX4cctSLYcaOIXhtJ/odiPzzEkBVkPJOsfGubXf2NwZ0A2blAZ
         J49Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jweuqlnb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si1692833qtf.59.2020.05.15.19.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 19:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jweuqlnb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZm9F-0008UD-R6
	for alex.bennee@linaro.org; Fri, 15 May 2020 22:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZm98-0008SU-BB
 for qemu-arm@nongnu.org; Fri, 15 May 2020 22:01:50 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZm95-0004WX-Sr
 for qemu-arm@nongnu.org; Fri, 15 May 2020 22:01:50 -0400
Received: by mail-pf1-x443.google.com with SMTP id n18so1878833pfa.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 19:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=IF3tXI1TMlEtzrjtBcqcUgSSgHp1vkmBfAtiEG8puJk=;
 b=JweuqlnbW+MdHk53bM7bwmIS5qtjr7dG1Gekxzx5x65FTrM9i5g2IVGRiDfchSdoe+
 2gzKtFX76d3bJB3QL8zL+KdJultNGhwmfi/8WLaA37hEj/yEVkXn/WRR5fzGeDhvwKrT
 +ZGNucKmMkFpx2BHVZwAXVmnsMjvxaLVsoJZRawiT+ZrwA2iSlitZFpReyzZ6odeCKbI
 JCpv67OX8bIfyg/5kWhZLAD4Urohb6tkwh8RqiJxb9fiPNGXwfp2VDBPdAp27ssY2wdj
 vcVMyK0zsh3yQDgI2wsg/Tv61xFyx4notr5L88cUbJTa9i3RrDTjWq2VSPmCNBJ6ltAT
 ax5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IF3tXI1TMlEtzrjtBcqcUgSSgHp1vkmBfAtiEG8puJk=;
 b=FmsQ6x22/F9KVOclkUEnC6PLq66K+DTzd7v46Np30HFE9oThWzlEwwVm00AGXqsn24
 nt9F2xph/tS58XTagVON+Rzcx0qIcbcpg3Gj8BZpyekGEpgBlXkWF2qjDefhufxHyaEO
 psV+kZYmpgr40CXxy6RsBDA2n45LoV4013GC6TED7QeJ7ATxNA/1syk8A3zzVt7VyV9n
 yLx/XbGBLzmMYsiVPHE8k1DZUNG14sYLDAS6nXEsrn7bySrH3UClr+3u0U9hURcbg3Se
 yR9lrjnkjlSrl6n5VJbSTfPbGRW04CeIhdf0rUdKsDBIBxqULHndWDtSPEblTQa/LxHo
 swNw==
X-Gm-Message-State: AOAM532lNUJuj0/8DNWPeHEnr1JCK3q7XKtq2X6jx7TQmZiyWalL15UE
 xxP9WqAe7N31lv4GJwOYLr1nWA==
X-Received: by 2002:a63:5724:: with SMTP id l36mr5947364pgb.317.1589594506191; 
 Fri, 15 May 2020 19:01:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o21sm2420550pjr.37.2020.05.15.19.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 19:01:44 -0700 (PDT)
Subject: Re: [PATCH 06/10] target/arm: Convert Neon narrowing shifts with
 op==8 to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f025a15-5ce6-37f1-9ff7-7cb4f202a320@linaro.org>
Date: Fri, 15 May 2020 19:01:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142056.21346-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: GzfCJ94k4uTG

On 5/15/20 7:20 AM, Peter Maydell wrote:
> Convert the Neon narrowing shifts where op==8 to decodetree:
>  * VSHRN
>  * VRSHRN
>  * VQSHRUN
>  * VQRSHRUN
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  32 ++++++
>  target/arm/translate-neon.inc.c | 168 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c          |   1 +
>  3 files changed, 201 insertions(+)
> 
> diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
> index 6456b53a690..f8d19c5819c 100644
> --- a/target/arm/neon-dp.decode
> +++ b/target/arm/neon-dp.decode
> @@ -208,6 +208,10 @@ VMINNM_fp_3s     1111 001 1 0 . 1 . .... .... 1111 ... 1 .... @3same_fp
>  
>  @2reg_shift      .... ... . . . ...... .... .... . q:1 . . .... \
>                   &2reg_shift vm=%vm_dp vd=%vd_dp
> +@2reg_shift_q0   .... ... . . . ...... .... .... . 0 . . .... \
> +                 &2reg_shift vm=%vm_dp vd=%vd_dp q=0
> +@2reg_shift_q1   .... ... . . . ...... .... .... . 1 . . .... \
> +                 &2reg_shift vm=%vm_dp vd=%vd_dp q=1

I'm not sure this part makes sense.  Correct, you cannot leave the q field
unset and continue to use &2reg_shift, but the insn field q is decode.  We wind
up with VSHRN having q=0 and VRSHRN having q=1, which is a distinction without
meaning.

While we could perhaps reasonably set q to a consistent constant, the only
driving reason to do so would be to share code with do_vector_2sh or
do_2shift_env_*.

But since we can't do that, due to the expansion algorithm, I think it would be
better to create a new &2reg_shift_nq that does not contain the q field.

The rest of the code looks good.


r~
