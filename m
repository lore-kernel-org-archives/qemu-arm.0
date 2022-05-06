Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1989754lfj;
        Fri, 6 May 2022 11:29:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS1EmiGcN8Pc6cJ9+AesKGxlvOezalu/n8Gtw2+oExCBhu38Qkti/7W7LxBVDvB2jITSsp
X-Received: by 2002:a05:6214:21eb:b0:45a:c5a5:c134 with SMTP id p11-20020a05621421eb00b0045ac5a5c134mr3640666qvj.124.1651861745930;
        Fri, 06 May 2022 11:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651861745; cv=none;
        d=google.com; s=arc-20160816;
        b=mB4YPZmm+7oDpNfag1Ua9t81EU4fSJCxxkJ2M8aRwkRSuzWiBXYHXX5sAFzWokduWU
         ip/j7fc55BAnlVLRBxudjDOozdQkCnFYK/SR0JymlaCP/kZGRrGf77iFL0Ht/YezzxaH
         Xy6OVYXFnETDURY15u0JTLk9QHzn1BFfQGzXNN1QOya9RWNFnrObnFcroz5RcYgT7Z2B
         jkW2Nms8hgHckSx7Niz2xlPNQdY45PWVUD6Cge+RyE1BrT37MWvu0YBkjmbIqrj7yKkA
         8M/lxtAF26zhmpMIBxOBmZXbmEm/fGQa3kAey84TFSccRHCwxWlc0RTqVa51BNi4dQI5
         IRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=mbnrpkcC7bxS5s4sFrFElerAzU2/YOP+y1bgLPMwqcs=;
        b=vO5ujzgwbYg5XUaXXUQEifo6Vpex08HjaQFQvaGO+yV8W9DpoIZUNIQT00XrMlB+nn
         ZQXM9e7+nGsxOQOXh6Uuiv0neNJtfO1hSaLZB2yD+z0AaXnFRxfRmyYhvBKIsALBxu8f
         6h9XPZGM7Gm8Q20Sq25NirH3q7fo1Xcclz4l+CXfZgAxfapj0biXwA1eF4cHbWJ/KYva
         M8jfGjtUdVTP3ec9ISTvL0ktHFAvFjbjfZyYqGm2X1J+YSB9WEFYxVMPxpz3B89f5zdJ
         pi+7LeMf2GYXwGxdSd0SjFVfJgBf1wjEufBe5i1ANOVpAZ95RbtaHQ+/d4B0FGPf2shE
         dYrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qKu56VNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a24-20020a0ca998000000b004564fe064edsi2578193qvb.362.2022.05.06.11.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qKu56VNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2hN-0002W6-Dn
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2a5-0007kp-1m
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:21:33 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:42853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2a3-0007YM-Hp
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:21:32 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 s12-20020a0568301e0c00b00605f30530c2so5441396otr.9
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=mbnrpkcC7bxS5s4sFrFElerAzU2/YOP+y1bgLPMwqcs=;
 b=qKu56VNsL78MlHQRxPSsB59tkFNs5q+ygNaxeIynAIJ2yaQfyKmwDQE34u3og2asmG
 zNCUOtzb2BHn56gNOq2IKI1ST22f+36bfMHuGNBjE2+7SeZXwoOtu++SZrLFp9HNIUHY
 BAFt3dfK/25mBsrELVbZV9XV7/x+FTUCVbVBL/OhuZp8xoQ8zhAVXG+4W4KCHleJ0BNE
 BpOvckzV1dZ7VhnqldeUAgdbyA+GicIWiI2GwrZnmT0/+7BXGarE8uoOaOiCVYe5bVxp
 vLQ94BchFsC4We6lrD9kTvbMJL7Kb+q4Ux0AJOQbJ8iFS9c4c6zIoo8VAV3OHLhTxzTG
 uqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mbnrpkcC7bxS5s4sFrFElerAzU2/YOP+y1bgLPMwqcs=;
 b=m6aIRkKCEX/pc7RQcaX9yKLc4k3ORo+kkUpUJ7jI0pNi5I0LbrJKNQtofE7d+YlZPM
 XVrWgd2awkiYyWLmfn7wBsq/0BOzlHLEZNL3VFWfQKBfDtqcluU8Ubbwl2NdYbJ4ZlJ3
 k7fIz48pkjdYIicHonQNtzuu0sVYkOlZehea9//d4VIse3/qh1a+V0PnI0XlXhFKd726
 Lm5LMaTWjjvcOdjrrWVNM9Hrvt2zsPJ61x5yr8m6GIQ3YfMFL62VDeChjIkQ0m3svA0X
 2wj/PsT5OzHBccpkAlD3wi7nhqun6U1x8qEsnf8tkxjGkRpWWb97lKI/sTG2ttdYOBtA
 mZCg==
X-Gm-Message-State: AOAM532M4I81H5/ZkNEoD+WRl4S/STNWUWmVBpIfVe2ELlZC+KTHkZzu
 J3WXY63MtQ2V7cMU00hHMMjaIg==
X-Received: by 2002:a9d:58c3:0:b0:5e6:d8f7:c18c with SMTP id
 s3-20020a9d58c3000000b005e6d8f7c18cmr1495216oth.364.1651861290508; 
 Fri, 06 May 2022 11:21:30 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2?
 ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a0568301de900b0060603221255sm1868945otj.37.2022.05.06.11.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 11:21:30 -0700 (PDT)
Message-ID: <9d1af069-afad-7756-790e-b7d0fc708223@linaro.org>
Date: Fri, 6 May 2022 13:21:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] target/arm: Enable FEAT_S2FWB for -cpu max
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220505183950.2781801-1-peter.maydell@linaro.org>
 <20220505183950.2781801-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220505183950.2781801-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
X-TUID: sKyQgvI1rgYl

On 5/5/22 13:39, Peter Maydell wrote:
> Enable the FEAT_S2FWB for -cpu max. Since FEAT_S2FWB requires that
> CLIDR_EL1.{LoUU,LoUIS} are zero, we explicitly squash these (the
> inherited CLIDR_EL1 value from the Cortex-A57 has them as 1).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst |  1 +
>   target/arm/cpu64.c            | 10 ++++++++++
>   2 files changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
