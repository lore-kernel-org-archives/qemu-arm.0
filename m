Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp644178lfq;
        Sat, 9 Apr 2022 13:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo8nN1vq3A7UztCm6ePbkIrz4CgaN6TPb7UsZ1DyK2VilmwxUO+pJvIyGt+YOzaLNrIKNg
X-Received: by 2002:a05:6214:c83:b0:441:51c7:9dc9 with SMTP id r3-20020a0562140c8300b0044151c79dc9mr21558232qvr.83.1649535723417;
        Sat, 09 Apr 2022 13:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649535723; cv=none;
        d=google.com; s=arc-20160816;
        b=Av5V8ylyV7AI7Z029PAtZ4VZD171ylzmMjixfCsTR4KJmVUx6rGwWAoIowDfcagszs
         /A900Fu9BCisJOD7VRAZHCSDHgwpye6NmQZyd+tDEL4iuQzXfmTwvPLIQgPwIGVJSvi9
         jwqig80u2Cs2xVj/xNT0p1h+7LltQBmVNkXvBra4eitZxzvlebizgftQ+lApa+n++fL7
         V/NxP9eJLJmqUAFPBf9R1zEZYesc1i30zQObMCuTOmyu6grD0wIHx0Wrfzdfki0d8VSU
         o4OW1ZfywM0VYNNqqSu/wjZS4zS9LBPXiPboYg6xj23UHtdqQHkK7bgQntHmeE6zfzcl
         IwDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=93gaETMj19berHSg8GO7GyNmTk7Dj4pHowuU39fBDW4=;
        b=jPNwPoe7tOEUGKGFJGmEHaoZPgJ1eotLOfCtH4vO9IsvTsdjtDEORSVWCIQMQuqOqU
         lJ/I9amQC24ApXycpZRIIs0MubNWEbRhKJFwC8Qj9iyZFnvaGJ/9VEGLGXkOgTdjJgOG
         5u35ZAOBC9L5c089OgeGkAISQQpy/B1879rPhYKuYOmK8ckDza/NIjFTCW60nYsDSHDZ
         IlE3u3MobNzcur6/c1YPNE9LN6NWlXqwSsmOFusvuukrW+QFBZnHZ/iVFP5ldspKRUMp
         uLu2QpV1flvoxENGL2SQtcnKq6q7/je4ToW4wKJ1vNFWKX+62YtgfSELxc8aRZvr1Eku
         9OWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgMkD17T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey13-20020a0562140b6d00b00441d750704fsi2167846qvb.423.2022.04.09.13.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 13:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgMkD17T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndHas-0004Ob-Us
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 16:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHaI-0004O9-7a
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:21:26 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHaG-0000oL-B3
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:21:25 -0400
Received: by mail-pl1-x634.google.com with SMTP id s10so3257810plg.9
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 13:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=93gaETMj19berHSg8GO7GyNmTk7Dj4pHowuU39fBDW4=;
 b=mgMkD17TZbuTYG2Ec1cXeM+9dkGnS8ruqVyuYVvIZB3CCT50bBsrpRCvSAAIni8IJu
 h05LzKRNMQsprCVAVlKr5vk/m7jadtI7OwL+4X1va4weAWWaU7StQpku/zUTiikvRX4o
 dOacjAnsaSKNi/+A+22gM0eK5RugkGZlaQXmddNJsF/kj8r4wSL7H3NtsX3mmcyByZFG
 LHbulSMPRIMpQbVY6TB8GqhzaNcJtHPUvfN3x33bd9wlxjGTSWDvozHj4DLCxYB2z69w
 pBfJTvleI5iq0y7jK23hwLoO3yvTMjkj4UjwHLFZJF6SwmeKnt94UQPyqAshiPuuXa6j
 70JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=93gaETMj19berHSg8GO7GyNmTk7Dj4pHowuU39fBDW4=;
 b=uxgsXiVOQfASSkc6P/mcXB2ak9BaVtPG68CdKQXOLE1qKWj4QbehLL1cMrBLm1rU2Z
 o4sGLTGFK4P75rDIzObnOjxp/EcG0M2fgpvnrzHyZ1TGHIdITM1NdBS9sBPiuXoWU3dr
 mtiNyAThaTvS7fz5amjC+ITzVOtcghlvYwHYOTYszN7nwgW605oMhb8IYco8erlX6nZ+
 FeGv4T2zNLakqgtgfOinIm+NPoEJx1IHRWn/JQMJNFQjtGpK/LpVnT9OeiXVBGR2vPLA
 68yDQqtEjgNjfFQVhnfFkGtm2ONRrIc22/7OyfLFfHhC3LxuwOrDDV+RsOqrH/fqhBf7
 J+bg==
X-Gm-Message-State: AOAM533kpGLTjjondMFKv1qEcqUsF3uMnytUmn1EaCrnpryUtrhmHPyP
 elHPWcKxYmu+RGlPuR3jARmTYA==
X-Received: by 2002:a17:902:c94a:b0:156:ae43:4023 with SMTP id
 i10-20020a170902c94a00b00156ae434023mr24901517pla.115.1649535682019; 
 Sat, 09 Apr 2022 13:21:22 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v7-20020aa78507000000b0050596bcb1c5sm3353883pfn.218.2022.04.09.13.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:21:21 -0700 (PDT)
Message-ID: <a516b025-6532-b28d-0205-7b24c49c39ea@linaro.org>
Date: Sat, 9 Apr 2022 13:21:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 30/41] hw/intc/arm_gicv3_redist: Factor out "update bit in
 pending table" code
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-31-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-31-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: SLXnw3ze7xTk

On 4/8/22 07:15, Peter Maydell wrote:
> +    if (extract32(pend, irq % 8, 1) == level) {

Here you assume level in {0,1}...

> +    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);

... and here you force it into {0,1}.
Better to have the compiler do that with bool level.

You might consider

     uint8_t bit = 1 << (irq % 8);
     read();
     if (!(pend & bit) ^ level) {
        no change
     }
     pend ^= bit;
     write();

as a follow up; extract + deposit seems unnecessary.

Anyway, with the bool thing fixed,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
