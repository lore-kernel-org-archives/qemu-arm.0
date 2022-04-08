Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp153204lfq;
        Fri, 8 Apr 2022 16:20:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTMNCSoagAFyjjaX3T1tTzpS122jOa5lsPxLsxIluOd/p28uTn5hbaDaYIKVsBh9BOs5Ty
X-Received: by 2002:a37:9c58:0:b0:69a:140a:a545 with SMTP id f85-20020a379c58000000b0069a140aa545mr5633074qke.725.1649460049340;
        Fri, 08 Apr 2022 16:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649460049; cv=none;
        d=google.com; s=arc-20160816;
        b=btzTSVG1S334BNaqEHprjTmXXDkFOBF7WLyQOdmOLvrbBBMQIMd/EFSnhWZ4B4fa6k
         jcMZfb4eWd4SuPic6U5+tKVXCfCLaXEcpocGtDPH++nnxMksntzAn7UEawFIIo/RJyQF
         OPPM5mi2zDuivWNu7XHJuT0Olt63wC9my0XYfKFtHaJTkR9qp2VlK3pijSNXgLLIB2f2
         BmxczNQeOxpjXph6PC8VE5MRt30bBrhKs4ai5uZEWKWAX7ZoalxDCZ3P2g7e16b3Eq7B
         ROKcG+UC2u/7biTCziX4IpPRdk1czAhRap4q0idCMTNrPUe2jysCz5zHMMfYr+1LeUBm
         K0tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=gEBMjtUlvyZrFoITGh51DTO9a1HWqcgSWUbZR3gfsr8=;
        b=SB1UvGe2qcnCRhDJtCJjqS6xsAS/ii3LfEl8AhIM0NUO7bzssrvETZ+8TYUB2eUw+U
         jk8b4w6bcBRjEHOXWO4ALwrSEZSjvsxG/5ibbtDDCIzpnUazgGYkyZsE+gXYx/0qxf6t
         mS2vR4U23o2CPIW168+gI2HYEA5ATwhHQ15B7p6kDSIh9dU9fqUUOTSoFsrjn+10cdCb
         DdrWJswmoSBk6m7CWKmOZjnVJv3PXf5PkGGozUS6GmZT9zGizV8vJ0aQ4L/gjZHmXn0R
         dBXHAnoVQRHWeEYWxFhskd9/oCvLqN0zbV/aHJ/MARkkDBKkUhpVxL/91bG215+z4wZd
         ZiQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCb+yrfY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk1-20020ad45d41000000b004442716da08si1424540qvb.210.2022.04.08.16.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 16:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCb+yrfY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncxuK-00053g-SQ
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 19:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncxuA-00053L-KZ
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:20:38 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncxu9-0004Nh-0n
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:20:38 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t13so9002018pgn.8
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 16:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gEBMjtUlvyZrFoITGh51DTO9a1HWqcgSWUbZR3gfsr8=;
 b=yCb+yrfYTPaKmWfheWxp9zujtqnrGwpZW6Ws/ohtQJeOKcVjmQXhtM0GO1Q6i9TvGy
 GITjyu+3/FZ1ATbzfyXsQ8KCBca7L0+S3vyfn0RvukMAuUDAoUug8jHTfTtS+wYWXPKN
 T+FfrF/WJMFO/G9sxqrEKS8kh0wegPlmX4jEmX8jIp3gCQifc/PUfypm+zblTC0TGqeN
 49wn/opILqLFTZuP8yiJv+Lc8o7ofhnnFqXYdmciKoBopbqRj2OZeIift9tVOvdJS0xj
 ydXqiJbNI8zfCjYWPbDyhJOdh+nZmeW0sFWDPPzQziJNUhqY9/NL+FFHWPWK2Nm6LHYE
 EMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gEBMjtUlvyZrFoITGh51DTO9a1HWqcgSWUbZR3gfsr8=;
 b=h3vK+x907Pwbg4IA8y9Jpc1rc0KjLmiDNTxr8luylLwNwOW9Ea6fw8FQ3AhTwYxKaZ
 Uro4KoDFWGR95wvZmL9etc2RkOk3EiDceko4I21hKv4cY+Pjes1GAZmPek2XqmZHLgsV
 94/uh9ZOT97BsWtsq1oJuTDALi/5INdeupXS6Ls3+HPJS1BU2BxhGbC57ni5Vr97DrOK
 AQOO1sxO7R4a75t2ngOrs+MCpwp/J1N0gkqBO7DXk+414qf9A9uRo8v4amr9cKqumBkm
 63zwwt0G2D/NaRHlozn0vRF97g0U1fi5+FoyWLMVhhPBcMJvARyHLgko/K20HFOG9yT7
 QScQ==
X-Gm-Message-State: AOAM532vk1seOeIS5BZUZ7UIIADUGLYo2lxJKkOZzfNGY4iACa1SaZG4
 8ww49LPLuuJRo1jRzzQPCi/S5g==
X-Received: by 2002:a05:6a00:14cb:b0:4fb:2c72:1fdc with SMTP id
 w11-20020a056a0014cb00b004fb2c721fdcmr21974057pfu.55.1649460035646; 
 Fri, 08 Apr 2022 16:20:35 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a056a00088900b004fe1a045e97sm16663514pfj.118.2022.04.08.16.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:20:34 -0700 (PDT)
Message-ID: <e6830d42-f3d3-3020-17c9-61db21e1d63f@linaro.org>
Date: Fri, 8 Apr 2022 16:20:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/41] hw/intc/arm_gicv3: Insist that redist region
 capacity matches CPU count
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-TUID: 4xDPVaLin0d6

On 4/8/22 07:15, Peter Maydell wrote:
> Boards using the GICv3 need to configure it with both the total
> number of CPUs and also the sizes of all the memory regions which
> contain redistributors (one redistributor per CPU).  At the moment
> the GICv3 checks that the number of CPUs specified is not too many to
> fit in the defined redistributor regions, but in fact the code
> assumes that the two match exactly.  For instance when we set the
> GICR_TYPER.Last bit on the final redistributor in each region, we
> assume that we don't need to consider the possibility of a region
> being only half full of redistributors or even completely empty.  We
> also assume in gicv3_redist_read() and gicv3_redist_write() that we
> can calculate the CPU index from the offset within the MemoryRegion
> and that this will always be in range.
> 
> Fortunately all the board code sets the redistributor region sizes to
> exactly match the CPU count, so this isn't a visible bug.  We could
> in theory make the GIC code handle non-full redistributor regions, or
> have it automatically reduce the provided region sizes to match the
> CPU count, but the simplest thing is just to strengthen the error
> check and insist that the CPU count and redistributor region size
> settings match exactly, since all the board code does that anyway.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
