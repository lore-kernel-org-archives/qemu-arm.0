Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp155520lfq;
        Fri, 8 Apr 2022 16:26:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytKIcL/OjxrSPAz9wYznSZ1RAzYiaI/KloYXKvWNfP9Nikz84kGbyLy4II77et2uw/Z9gF
X-Received: by 2002:a05:6214:27e6:b0:443:f201:a974 with SMTP id jt6-20020a05621427e600b00443f201a974mr15335751qvb.82.1649460415876;
        Fri, 08 Apr 2022 16:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649460415; cv=none;
        d=google.com; s=arc-20160816;
        b=YaywmFi0xv4cdTN3BcklR6/Q6COMhMJkj1dWodCLMMnJAw5u6C/8U43Kc5armY1tym
         8H4rOSUbUsAF7To8q9n3BNc9s1vRGbrrTpEo94MAs3vVfacpg8LfEuHvwhIAhUMw9M+Q
         p8MHOz0Vg+s0oR91QLqiCODVdmSKiNIndd45FulG7vgfrAd3tAcI61U6lIOuF2u+Y4j1
         V154Lp+p58PthDY//x/SueQfFhnVIgeD5RIwt+C/3g6Y0hfENz9VjW3IUGh9LHdsaP5Z
         B864zGOJtWAl6jHMUrk2ekYWB9fKarMKDfYGIlF5KxpFXze8R816rlBVI5k8pHSTYTPp
         Le5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=4WrceAjHZws/RC7AapXeXTIvMbFv9TuH+0j/xCxFGnQ=;
        b=sIfpkrIQEFAH6P7B1V5PixHZT+SNVN8WX0wLfuP+yE8Lux1kyCiCLE51BwmsAnso7d
         TJRpXvjOW2Rqu/RANpO43B8jdqzhbjwhRMynUrUy9B/8L1xslvbSpYwu/PFv+quyPDAx
         XP/M0Npg6EXnKt4mQJ720hcuZrdlF5vf1KCyQ0uNQvkz94zDz6Y8/RIxVGTehMPtPExT
         /TqjbAmQNjpesuf9gpJbjhepk7dVYCnqZOTRTOVJMv+2q6fZAXGE36TYzIgFAAX5+2s7
         +9WpMKG1Y8fm/BP6vfckU0NulWKC/P0sQWeY3S8tnwsQTAm3OPimlpT2AyhvhFMfjlxL
         R4iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gnVXnMp0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020a05620a0d8700b0067e4be2395asi1280359qkl.415.2022.04.08.16.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 16:26:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gnVXnMp0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncy0F-00080N-DX
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 19:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncy05-000807-F0
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:26:45 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:56136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncy03-0005q3-T1
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:26:45 -0400
Received: by mail-pj1-x1029.google.com with SMTP id ll10so1553861pjb.5
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 16:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4WrceAjHZws/RC7AapXeXTIvMbFv9TuH+0j/xCxFGnQ=;
 b=gnVXnMp0FzCQIk9IwHnEBs+p8YjtDktesB1MPKtYNht4Xrc/be8uxn74RQD9tqway2
 UGWyLpkk9Jzw362PhaDn33bV33WTk1JOr0wDsONf4GlcF5te/+TOJaXTCvVjbWTtc9eK
 jCu/ub/ArAhCKxwHHOEpw/duBf9Aan7js7PHEwDB6idPnEcA9eG2CjQ6eYi2ZE8B/NXp
 tmaPgxcMrH3/IfEDJnHJOD5ffeFII/6HOm+OHm/bk5Kl25NPMjWakUc6WBawfN+jOHQw
 lx52B3CogUimuWy1kh7NRIpXfgJ6NrlI26whtxroaTolLo14OKAcIz6g1UMYVRabgy9T
 3O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4WrceAjHZws/RC7AapXeXTIvMbFv9TuH+0j/xCxFGnQ=;
 b=XLuv+0GYAd9Nu1Y2WdMUsXYVXJ31INU98kb7lh1/zWXYPk5DjvUNxVsv1pv+4siwM8
 0f7wY1cMEJlK0gRvgRFzm6rUoH4Ozs/KwUDShBJk7TAaasx9Td8nxrqxcIPPGvk7RUbf
 ho9HpnByBPKcjMC8exWPPLzaUljsrm105A7cTnLHuwWeRGWFoHiaaJLd3uFWSi4rumBP
 ltDQZaW3iXfzfWcEAwxIZbsBRATAUpoKYOfwtC7r9Kv/jYiSRtMdviHksV7V0fSszmfa
 nOY66T3mTx6UVn+9QWbZyTI3Je9AfIA9gY7DVPsOu5sAYhFHRNl1CNrvWIlc9w1hxAqd
 drbg==
X-Gm-Message-State: AOAM531H/vn0JiXMWZiFri74V9B+3EykfaKGVVv/ea/Evu2QVYAD38r1
 JL/5uHMHEFg3f4xNdQ3aGwieFg==
X-Received: by 2002:a17:903:230a:b0:156:9c66:5cd2 with SMTP id
 d10-20020a170903230a00b001569c665cd2mr21233030plh.57.1649460402097; 
 Fri, 08 Apr 2022 16:26:42 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a63350f000000b003992202f95fsm15861597pga.38.2022.04.08.16.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:26:41 -0700 (PDT)
Message-ID: <84dfb42c-8bad-c66e-34a4-a240977ab2a8@linaro.org>
Date: Fri, 8 Apr 2022 16:26:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 04/41] hw/intc/arm_gicv3: Report correct PIDR0 values for
 ID registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: tepP+6MW5pT5

On 4/8/22 07:15, Peter Maydell wrote:
> We use the common function gicv3_idreg() to supply the CoreSight ID
> register values for the GICv3 for the copies of these ID registers in
> the distributor, redistributor and ITS register frames.  This isn't
> quite correct, because while most of the register values are the
> same, the PIDR0 value should vary to indicate which of these three
> frames it is.  (You can see this and also the correct values of these
> PIDR0 registers by looking at the GIC-600 or GIC-700 TRMs, for
> example.)
> 
> Make gicv3_idreg() take an extra argument for the PIDR0 value.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 15 +++++++++++++--
>   hw/intc/arm_gicv3_dist.c   |  2 +-
>   hw/intc/arm_gicv3_its.c    |  2 +-
>   hw/intc/arm_gicv3_redist.c |  2 +-
>   4 files changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
