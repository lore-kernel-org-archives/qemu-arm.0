Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp603705lfq;
        Sat, 9 Apr 2022 11:41:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzDHXrplZstNtblDvLvDqVyr8Ex7IeAaLNBQii7+W5EUAa9o3s1TGe47tOkZ1e85/MxqWp
X-Received: by 2002:a05:620a:29c6:b0:699:c2be:d18d with SMTP id s6-20020a05620a29c600b00699c2bed18dmr16944942qkp.697.1649529673332;
        Sat, 09 Apr 2022 11:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649529673; cv=none;
        d=google.com; s=arc-20160816;
        b=yYaR+SuO6CKnEjoBUjagsApnI/hAABF5usDmIGY8S1vzCieWcY/pwFj9yRjebe8i5g
         nQBzeC4GRJ1CHfjoWFVC8YDhFpU4g2DjdB42CngrpJvtAXL5uGhZw/fZJQtC4kpQ6pou
         LCkwQs/BWE8h1oINBUIWmHxnGJzH+aJ6e9706b76agSsBCFgQ2ju/LWcRn1ETVT8yQmS
         u8x//d69f4bRo1pCjYcUetRQsURhx8xeORKmiw8avavrg/o+bl60/tWMmN6O70nisAPq
         tNT77cIFFskPIKD/PxnkfXQOKMkY5ggc+vZD2TeV2dNbJ1HndXQt0u98+bFeyYNMDSS0
         EP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=z/zNhIr2tF8jdNUwxbLggHirJiP5wOEHRoW4tPiBUlg=;
        b=UPtxcMQs0ir0gejPrnuTkoT3FMxXekfsBtZYOCoPsudKDyL6BwJxuMxEwSpoXNiYJD
         NVJlzjarajA7539NAMwIGRslcnePJnygS493aoR0SmyyikZfz3y7xlAPgTyWNWuE3peJ
         9cVaIWQj9g+XF3NDDouWsz4RZp0V7YCvFGp8N3pLc/l4XJr1LZXAFpL50rQ4VnifiKJQ
         qhmbQzOTIE7P5Cw+rMRpM0MoyxhzoViIBFIO+8t6YftjmWAKz+wM2A/04rCewkdVOtFI
         0JMZhtwYv0eQ+p+22iYxM3jkzPbrBj4s9qQLqoXF1BhmYPQoRCDxuHBH07HaBn1Vi3ft
         zOUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pbjSqmdb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020ac87545000000b002e2350f1b07si1953378qtr.418.2022.04.09.11.41.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 11:41:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pbjSqmdb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndG1I-00081z-RG
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 14:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndG19-00081U-1e
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:41:03 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndG17-0003k0-L8
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:41:02 -0400
Received: by mail-pg1-x536.google.com with SMTP id h5so9682073pgc.7
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 11:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z/zNhIr2tF8jdNUwxbLggHirJiP5wOEHRoW4tPiBUlg=;
 b=pbjSqmdbI3PGplNcKo5eSEpZFXm2MiBRMglx/r4z9SQnNpqok/sPxxqeR46ngwiHAq
 qOwSyhSdWYPDeInmK8KfdmgM/JHRWWE4Ofrp+u38NYTgfUaCqdOtzDLd/aH6NAqmq/Nk
 31H5g1ci5sDAn/mX4fV02bu5TWCUNZepN4HJ641CJFUGKPMdhlCFGSl0440J3zcNQfQn
 H0Rn1TEODP7+rSXQhhfJ9Y0yruwyx0tyWmbQsUSFI9vZJFt2hPoc2Wss+HjGjW9aobn4
 dFOY5CDfYRS7X/fSexVpLM7FD4bZNKRn4irkpqOWvgdIrGJcaiHDZHegYg6iKZrzx+q8
 d/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z/zNhIr2tF8jdNUwxbLggHirJiP5wOEHRoW4tPiBUlg=;
 b=QKHd0m1zDk7T8sz1BDAAG9RaR35F1ddYMI8Sb5qQDg6yW7k8hZl695+qEsIgUjRCu8
 cMIG6mZb7cB5XnfDTqhDJ4caET4wWiGX84k3GjkcHRGARSNZFu4KUaqcwsBEm/7U8jMq
 ioYVENGqjHVqBrhNky6qwv0mG7ME0aY5v+ClRlWNv75G6z2DOHQOr+AeAeDSLv1xp+nM
 Uqv91RRrP6wYctV/Nsj1WqcuhDHoniDmAxS0FEX6xcxtgaNOrMMIGCP4zkCJIh82xlss
 nfTsEQcp6NCNH1+/TjDEQtrCxZZFavQNOrS0ZyJuEfObLGDZRbNuR0FM+x1LbvBws6b4
 yyzw==
X-Gm-Message-State: AOAM533BzPgpqJB0/pl3djD6Cfq1PpleY0TTHXCAAt0O6keWyvbDChiI
 7xHEGhK+wofqds2HrI1VLzo7yg==
X-Received: by 2002:a62:82cd:0:b0:505:7ab3:e11b with SMTP id
 w196-20020a6282cd000000b005057ab3e11bmr9504874pfd.43.1649529660057; 
 Sat, 09 Apr 2022 11:41:00 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a63dc0e000000b0039cc76bda79sm8130210pgg.40.2022.04.09.11.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:40:59 -0700 (PDT)
Message-ID: <57156691-8ea9-7d03-11c9-9b056a5f1823@linaro.org>
Date: Sat, 9 Apr 2022 11:40:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 23/41] hw/intc/arm_gicv3: Implement new GICv4
 redistributor registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: JnSVi6JOhe2S

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the new GICv4 redistributor registers: GICR_VPROPBASER
> and GICR_VPENDBASER; for the moment we implement these as simple
> reads-as-written stubs, together with the necessary migration
> and reset handling.
> 
> We don't put ID-register checks on the handling of these registers,
> because they are all in the only-in-v4 extra register frames, so
> they're not accessible in a GICv3.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> GICv4.1 adds two further registers in the new VLPI frame,
> as well as changing the layout of VPROPBASER and VPENDBASER,
> but we aren't implementing v4.1 yet, just v4.
> ---
>   hw/intc/gicv3_internal.h           | 21 +++++++++++
>   include/hw/intc/arm_gicv3_common.h |  3 ++
>   hw/intc/arm_gicv3_common.c         | 22 ++++++++++++
>   hw/intc/arm_gicv3_redist.c         | 56 ++++++++++++++++++++++++++++++
>   4 files changed, 102 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
