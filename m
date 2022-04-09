Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp587196lfq;
        Sat, 9 Apr 2022 11:03:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpeiTMckPeGgiXim3tvpw4Q895W+J+fbzrqgk51VbNxIFRuEY9QgdnUJC1GvB2ibOTonW/
X-Received: by 2002:ac8:57c3:0:b0:2e1:e283:ed50 with SMTP id w3-20020ac857c3000000b002e1e283ed50mr20417331qta.200.1649527396767;
        Sat, 09 Apr 2022 11:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649527396; cv=none;
        d=google.com; s=arc-20160816;
        b=UoFI/yBjn+W1AZJoqlwPwTMdn3/NWjx7nneD0T1f18x+Bvoy3AxAESnFgM4lYuMFxG
         blssudhvOuISnrT1DPvjs9g2Bsx0tFeCo3gGYsr0p6q/EUY8KAGDlHmpWV8o54xAsJZy
         CH5DfDQy7/u8TgDLIMmPsuXhQrJH3GK37TBme1mQcnud0QpeFeN+LODQUjzDVEr3K9j2
         gp9RlCGMl3A4AZ98TWoxVYtXQZa4mIjSFx5hDMRIgowv7BkO5Gq5pWctCKsja8It/php
         xjB/2SYmlbN4m4v7MnmE22msEs5VWxRNwIbJIb0A6+jTTwbc0pkY5ZzICr/jSzGE2JRA
         4Mag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=vcGSDAfAxzh26JjC+V7GBL+wdHh29jzWvfnj4KBYshQ=;
        b=drjgeXk1uT6LqWv0qgcS/2gHBtPJLm0hQ1DgFoasfKdmn76jZbpnUxwwsncF3F1jOH
         B1e9skhRokxRB1ImmtA+nIBbsOyJoIDUP33doukKerAxCJrgCwSzZYIMW3hfz5oVMMAO
         tZj4Ev+5yNoNDe/ez61ULqYHKrWIzsDQSfug9gi+pnOhyZwMwl4HF4as4V5UE56CgxjM
         wJPAjgT3BFJohCqQ/S8yXVAayNv4vvfRIToYow+UHDVa6sKGCcQwUX1krrkZuAR9xi9p
         6TQCfat5Km8n2EDxy1CyCWoYXK4snDszNfAuDPMsag8iJ+V472WB7llPHhINlXDpa7xv
         LZGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ElCvUIcZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu2-20020ad45cc2000000b0044145a5dad9si2338372qvb.262.2022.04.09.11.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 11:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ElCvUIcZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndFQa-0001NT-9f
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 14:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFQO-0001MQ-2t
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:03:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFQM-0006nl-II
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:03:03 -0400
Received: by mail-pj1-x1036.google.com with SMTP id md4so3165238pjb.4
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vcGSDAfAxzh26JjC+V7GBL+wdHh29jzWvfnj4KBYshQ=;
 b=ElCvUIcZSnxGL1OIgV7euX7QOyJHOrs8ZtR5hqIzOQYihXRWoswBJFm1igKhZz3WMW
 pqhSxecSsv5QKHnEQsIgIsTWCQgdiDUG0D1lYE3ZRyyXzQQgsXOaKmxs5kfTDtc4Ty7n
 6A1rsf7YI8sGOFwBNb8kYTClG89CXP4vDdrS2XobBVp65w3I2nJuxDbL3++8PBX8aA9v
 fYcmc6w9c4wMNNsAsqB2zciRnQnjtXNhFmxW6bui/2vUsj8H23jGk0/0OvkHG+04nJMH
 Rz3/xKiXVZrAf95hCyT3CIgvyAK3JhIecF6YiUpdEj5iVPf6CTCJAGN05IrBVmYGoO8r
 iSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vcGSDAfAxzh26JjC+V7GBL+wdHh29jzWvfnj4KBYshQ=;
 b=TJ0woV8dEGAIErMJu94S6/pvsMoNdY5soebX6BoKYlSdavH4Z+X7OzXWrAEIiPPCZJ
 +KylIP5use40zdHBgK+Owf9D5E8glIsd18RhzfJdP2oawJyvjeMS0H+j8Ner2HX1wQQX
 3Lx+FRBvcbeSVAZJZ4fkjTI5Gd2ve8btBAXJCw0mPHpuaxw8zhvj39MaIoVbdYNm1I7N
 ySE5bCAyD0HZaWMWwHGl206aAtFDU784cEiINw3KTsE7RaF3Qu1dfhc0h87IMj7ETUc7
 pr74YC1EGs1JRNwzWxMgUTEoCTelzTvkjl14Eh3R3Dl7iIuqwX6njsHE2eBFiddjQxq1
 PbtA==
X-Gm-Message-State: AOAM530f/IV0zizNHhABa5tal9ZdtOiRJFHewRjSbLRiBfjwIBQibrRR
 N9YYEUlFijzSOHZ958C7VmoCPA==
X-Received: by 2002:a17:902:8e81:b0:154:710b:c2e8 with SMTP id
 bg1-20020a1709028e8100b00154710bc2e8mr25049519plb.126.1649527381033; 
 Sat, 09 Apr 2022 11:03:01 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a9-20020aa78649000000b004fe3d6c1731sm16955999pfo.175.2022.04.09.11.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:03:00 -0700 (PDT)
Message-ID: <648469f7-e060-01d9-3ce3-2d0e93db76b7@linaro.org>
Date: Sat, 9 Apr 2022 11:02:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 14/41] hw/intc/arm_gicv3_its: Handle virtual interrupts in
 process_its_cmd()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HIQD5XM+8ssZ

On 4/8/22 07:15, Peter Maydell wrote:
> For GICv4, interrupt table entries read by process_its_cmd() may
> indicate virtual LPIs which are to be directly injected into a VM.
> Implement the ITS side of the code for handling this.  This is
> similar to the existing handling of physical LPIs, but instead of
> looking up a collection ID in a collection table, we look up a vPEID
> in a vPE table.  As with the physical LPIs, we leave the rest of the
> work to code in the redistributor device.
> 
> The redistributor half will be implemented in a later commit;
> for now we just provide a stub function which does nothing.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 17 +++++++
>   hw/intc/arm_gicv3_its.c    | 99 +++++++++++++++++++++++++++++++++++++-
>   hw/intc/arm_gicv3_redist.c |  9 ++++
>   hw/intc/trace-events       |  2 +
>   4 files changed, 125 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
