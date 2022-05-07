Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2413767lfj;
        Sat, 7 May 2022 04:35:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUvSCpR8VbZrYdBBGM12F578W2ANazElcFE0miH5GIXasNu9exkleE/EBWKCqyHnQ5wmeK
X-Received: by 2002:a05:620a:1292:b0:69f:b0ef:e50a with SMTP id w18-20020a05620a129200b0069fb0efe50amr5441355qki.733.1651923359491;
        Sat, 07 May 2022 04:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651923359; cv=none;
        d=google.com; s=arc-20160816;
        b=NWLI911VDrnyaTSh524KxXJ6NdL3TgG1XWJWhh0WsFFXh6J9zNIlIm1d8FZgUqhMd2
         /klyskViIi3tcXkcvmJ1mCxIXLo92Rl2KyQ/ShVdchql7D+i7bO2+7ZfkW6mZybVzGrz
         78VvBPxPlrCJHvJwR0S9EONjULe3hkJm/y4rSNxuf6JPUfV4Ih2xXuoGiLJmRNqgaGu+
         cyEcmVUEEILH9U04kDUVWkWjpEe8qHfzHB2Yll+CiFlTwT3TCoXK5lyI06Xu3zf+QZiZ
         1yxFdl7GAKI4lk5CWHc124b1iplRMyIuBxJzTFDu/B2pXtcEO83HnayDkwLE4gCU5XAm
         i8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=0kNJxZo9QLFT9KImKMLTly0BKNLLWrGa+Lo2WmHiETc=;
        b=E3Mb8kWMYYvT5+JYrNEOHl5QsEvgp0Pt+9Hyb+A14UvpvSvikMU8MAAiF2U60HRFPP
         /gm2pG2ho65JYq14aHEPwmLZEESJ1gehFNTc4XjYTe570FS+j2EeGZhdCRsIMM49ijsP
         28zoQZY7Xlz7Up2dUxSEEqHE4rGOwnC/eqYnTaZVQ52W1pJQUp/K3lSWQX2LlIZaNnp4
         s8AWCPyvRSXBMX6JJToLOQ4zjowkgL8dEpvSC0qt6x6UUVRjWSeFjnmpqcuLGugkVFlv
         IZ9f8kMbpbO2CInEzY01WgzZGz3eoiKUt2x6Tslfo/UBub2wAgi3WbxCjJ5Y5nm2ul7p
         PBSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ooSUleBD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a05620a0c4e00b0069fb2c64ed9si4928580qki.344.2022.05.07.04.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 May 2022 04:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ooSUleBD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nnIj8-0003bY-Qe
	for alex.bennee@linaro.org; Sat, 07 May 2022 07:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnIix-0003Zg-5P
 for qemu-arm@nongnu.org; Sat, 07 May 2022 07:35:47 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnIiv-0003zV-1O
 for qemu-arm@nongnu.org; Sat, 07 May 2022 07:35:46 -0400
Received: by mail-pf1-x434.google.com with SMTP id a11so8353132pff.1
 for <qemu-arm@nongnu.org>; Sat, 07 May 2022 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=0kNJxZo9QLFT9KImKMLTly0BKNLLWrGa+Lo2WmHiETc=;
 b=ooSUleBDbB64FGK/3QYMixlAtX5KkrmfhsaRh1Xeps6oFi1uDTnhPNSNSaPySXiTPT
 wuY1CteV2DraCHjvLl45cCjsB6UY5Gapihr/EGwe4dDDIR9mlzqywMqxhdEFA2nMyHV0
 /EAV/5JlXICShO0iyQ4Z4s7aetiLnvol2Td69OiwYriz/Q81sLZHoLhE1gCzYsQ7UVpo
 6qDm2CQZ4A3nI1wjBlaogU9X5A+cIG+YeKjtjYshJJe9UxnAuIwWfhVjE/SjoRVdC/jh
 Gu5rIoGfyuiPj2SjGpoz7HlHgGDqL5PxW9wNGkCq58LknmjuYHeMVuY6Qyj3MR9hcA88
 kOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0kNJxZo9QLFT9KImKMLTly0BKNLLWrGa+Lo2WmHiETc=;
 b=5K9oWVF5xzvZNhibgWkFgZOewKvilGs3rW8VAiT6fTUSE4mDA5cHdTOilnTCFAxIBp
 toqGfXDi1qaKAX5QJKE50j4f4PSX7sLYdlyBWTRN9hCBJ4luWH8jWe3xZHxNU3l42+zr
 eXetJ7C/rzrb1PzZh5n7Jon1G+13OqqpIm88fv6fL4Rvhhr0DHgZSOk5tZEwGJ1G7FLx
 ec3FU3WDYVgp5lip9Bs3GmRjS642qCFOjS6GYOQ6Dx2mZlORp0jw51YHafIrQErv/gWm
 vZyG0mSRhH3jcc+LC6oSegH7PVH1sFtd2/oicKEc5FC9Elrnlc90vyMySTmg35StSpjI
 i4iA==
X-Gm-Message-State: AOAM531Nt4dYaABPpnxbU96+hMeMTR/M8wuQFMBGeFhnTj0LE2TEXJ0g
 Ct3oRnkXscIHPShcGC3j19CQzw==
X-Received: by 2002:a63:1b5e:0:b0:3aa:593c:9392 with SMTP id
 b30-20020a631b5e000000b003aa593c9392mr6240379pgm.470.1651923342712; 
 Sat, 07 May 2022 04:35:42 -0700 (PDT)
Received: from [192.168.138.233] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 gg7-20020a17090b0a0700b001d97f17f9b5sm9045435pjb.35.2022.05.07.04.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 04:35:42 -0700 (PDT)
Message-ID: <b27e80a2-56e3-8197-a1a6-0b62e3f20c5a@linaro.org>
Date: Sat, 7 May 2022 06:35:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/5] gicv3: Use right number of prio bits for the CPU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506162129.2896966-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RGT0c+oOjIB2

On 5/6/22 11:21, Peter Maydell wrote:
> This patchset fills in an odd inconsistency in our GICv3 emulation
> that I noticed while I was doing the GICv4 work. At the moment we
> allow the CPU to specify the number of bits of virtual priority
> (via the ARMCPU::gic_vpribits field), but we always use 8 bits of
> physical priority, even though to my knowledge no real Arm CPU
> hardware has that many.
> 
> This series makes the GICv3 emulation use a runtime-configurable
> number of physical priority bits, and sets it to match the number
> used by the various CPUs we implement (which is 5 for all the
> Cortex-Axx CPUs we emulate). Because changing the number of
> priority bits is a migration compatibility break, we use a compat
> property to keep the number of priority bits at 8 for older
> versions of the virt board.
> 
> There is one TODO left in this series, which is that I don't know
> the right value to use for the A64FX, so I've guessed that it
> is 5, like all the Arm implementations.
> 
> Patch 1 is an independent bugfix; patch 5 is cleanup.
> 
> thanks
> -- PMM
> 
> Peter Maydell (5):
>    hw/intc/arm_gicv3: report correct PRIbits field in ICV_CTLR_EL1
>    hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
>    hw/intc/arm_gicv3: Support configurable number of physical priority
>      bits
>    hw/intc/arm_gicv3: Use correct number of priority bits for the CPU
>    hw/intc/arm_gicv3: Provide ich_num_aprs()
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

