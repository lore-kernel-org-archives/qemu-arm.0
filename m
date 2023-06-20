Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp185770ejt;
        Tue, 20 Jun 2023 03:37:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ipkrOSwcUZMulcCek2V6X32MM17EsnHvUQECY/HI6DzBgDbwYC5FuRwT4Jg8QROiMyoK7
X-Received: by 2002:a05:620a:22e8:b0:762:4657:57a9 with SMTP id p8-20020a05620a22e800b00762465757a9mr7304517qki.1.1687257423565;
        Tue, 20 Jun 2023 03:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687257423; cv=none;
        d=google.com; s=arc-20160816;
        b=j3hLkbTjNvUAywx9/dp6F6TEocEYmu2P0ojq+0lDYMQDseJHKCanS9k3LAoiAjZNgZ
         7Rl06RDqRBQ4cWPX6bHEfzAPAxkpyKBlEkvGH8ZJ1OzPIxDvh4li0YUeWcS03lqNDno+
         yIFUW6S09RCpDMf5K8lg/xGFxOx+Vvbc58sRcpBNMfh0+exiicHRMuqRvp53MA85bqvA
         zCCF8PwrnzugksOez62RDFu3ttWhso/hoRD+3kY99Gz5VmyrKodQhB/AO+bY0Sztl1Fw
         OBb2VIFonsfDBQjxTYqE9S3OYpZCU17BfdgXCLjZzphM15sMUdM53ohq2VqejW7oZMX6
         d1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=O9ga8tYOdAQ6oSFUtJupeoQHlL8OIYMvxoToFtmGYzo=;
        b=pjgI8EOPeK5ZrEsGP5hvNz7PGqH0pYEOwVpIp9hr0Ih+eI4xHFVyOmR5b/FgnSd8/S
         o/9x2i72XKwcYIhnRYW/DFmwdrAx+BBdpXQ7HmpkNWifwMbffnkg74V90JVzvCNhjOLm
         rEmo6f+u4LbQIgWmY/Ab4wY0hq/jVBpFzS4jK+9T8rXfzPxA+ysiNZFZwEGo6uqKXfqD
         zZlcC/HniKxAggLgjOcak88VQL4deCo92THngyJIMzD6R088nxno8IRupafvSL+Ewgq7
         SJ24AD17SgB4UQaGlgjbPVbP5PiLIXy0rY9SwhcuLm21cateaUjFMOwxmvxKiiHzrJJm
         61qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWMMPv06;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id tn22-20020a05620a3c1600b0076255f848b7si711029qkn.283.2023.06.20.03.37.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:37:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWMMPv06;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBYjL-0002ff-4b; Tue, 20 Jun 2023 06:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYjJ-0002fB-5y
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:36:57 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYjH-0003pv-Fk
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:36:56 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-988a076a7d3so327220466b.3
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 03:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687257413; x=1689849413;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O9ga8tYOdAQ6oSFUtJupeoQHlL8OIYMvxoToFtmGYzo=;
 b=TWMMPv06/Q6NrAfgdvq/oJHIrYgspVe0C5tLiLgVUdKIjZ9lGsI1vZ1PoNRBZg838R
 dcic3QlpCT/PSNe7s7sD6GSMqRsQzaSUuI9a7QfU3uQ+qSUXNw+z9u9edYMea/gDg4PM
 xtZcgXBl3OUmrspJ4oNIVxhc1BAxM+UoDpmNu6uGYkyfjLBMcujS8ydD7+84v7il0K2m
 wrWI0+2nVtOb+Ki95ZWMURAuzmn/bS70FmqLzHu5TWpYSh7NdUz8fylmlgdWATU65W28
 1xXOm0WbCoQPOXQTk3WqEJJ8axVQKM7mRW4VsusRCFsntJLWQ8wnJYVA5oBOpoL6qviX
 3kUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687257413; x=1689849413;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O9ga8tYOdAQ6oSFUtJupeoQHlL8OIYMvxoToFtmGYzo=;
 b=DOlFIyMP7+avf6S+SMW2LeIlBWQnCZHUV8YijycX5KYi8wPxRFDzO7oRWtN0c8eu9U
 OFiG+KKub2Q+j9QreSDoZ8kk9VyOD/EngoHNOKznuVlOFurPGHwsWCiSF0y2d28cigex
 gDG4e097/ukv2B+pvHzwlOm7OetdwFQYPPJysfonrQ0YDsVoHVBoZdlSkkq4VBzMAR+t
 FK5cI4O6Z59iskS/rsu5XZizVXAu0HXogsBljWeVn3d2U932yxgT6mBRfLRfL+NQVlz7
 Rqm00vfgilqJsw5jB+oii9+1sL02RDzTmK0oikwrOnD6CdSpqs1G5/Oxke6wWVnoGdPR
 AO3Q==
X-Gm-Message-State: AC+VfDyLjVHA846Y3AU7+qwdIZV04YRCqRTf6hs+gG4t2YQdDHBwuMY8
 twmtbbwOOlu+MwO8cShgKEXemuGuSKA4wTag1UcLisvz
X-Received: by 2002:a17:907:6d23:b0:988:6526:beaa with SMTP id
 sa35-20020a1709076d2300b009886526beaamr7199192ejc.40.1687257413477; 
 Tue, 20 Jun 2023 03:36:53 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170906170f00b0098314c30e8fsm1122741eje.46.2023.06.20.03.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:36:52 -0700 (PDT)
Message-ID: <69782bd8-7002-e2ea-97b3-3784f1961eb3@linaro.org>
Date: Tue, 20 Jun 2023 12:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 21/34] target/arm/tcg: Extract crypto definitions to
 'helper-crypto.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619155510.80991-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: JScGP2ZvSyge

On 6/19/23 17:54, Philippe Mathieu-Daudé wrote:
> helper.h is used by all units, but not all require the crypto
> definitions. Move them to a new header; the next commit will
> remove it from the common helper.h.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h                | 37 ++------------------------
>   target/arm/tcg/helper-crypto.h.inc | 42 ++++++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+), 35 deletions(-)
>   create mode 100644 target/arm/tcg/helper-crypto.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
