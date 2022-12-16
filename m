Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1274937ejb;
        Fri, 16 Dec 2022 02:46:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf69byA3FxryXZOEczTxxMbxU7IO1esPN0dBMQ2Sw1jZfqWrJ2NwnRld4Sy1EoQNvaXiCSi3
X-Received: by 2002:a0c:f4c9:0:b0:4c6:e395:b6f7 with SMTP id o9-20020a0cf4c9000000b004c6e395b6f7mr42751540qvm.30.1671187614132;
        Fri, 16 Dec 2022 02:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671187614; cv=none;
        d=google.com; s=arc-20160816;
        b=qVArFTfK3yqqzAV72a0yiWGXpjDAXsJaiTbEX2GMthv+sGS4/1E4GvGzBupqejOz6S
         3P4bzNYRFr0omfQ2rAFGIEe00vttlzGe0+43Gz7s4IZIF5/qyaE7GVUBvSTxSlwR5gM3
         89K92kSRCR7ZchtpGaR0uO0gIDOxRiKjZ4+b1r9/kdCOcktTlouEYReLeeLjXmiWm3OH
         OezKmcehkWBIVzRo/A4S98KLGbkCVPJWFlBQNrXse7jz0l15irX6O9o/CobBq0fakkTj
         SxzqMDOfur+jLz5Ps4tjiR54aOW76oTBm4hnbD+NsfaFB4HcjHeKEDVNp9jc8KSBgfRT
         6OlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=I7qpe/CGMn45Y8TAHmmha9tWCsTujnH/2UYttoi8M9E=;
        b=q3RoHJxwKUcirnbpfUjI3kJnGE8ekYGDiSTxFpJVlktwQZ+7lm88j8Qy9XBwembeCJ
         A9txVQx3G1KO8Nlr+D9F+1LetyaAGsA9DRw+04AESqnPXjOZ19UlJXczy0bNajetaM9N
         AQO8/Rtqbxx869esosElli/Q+VHubvIpjkVW5hqjD8n3jEA3VR2Eua3vtUeMOpZsLNWL
         jCSgd+dC/DzNyJYlg3kDSKwfFeDBi4ycx5ZS/6iL7m2GYSPxCXI+9n/RLBbjKPFklwBx
         1BNZ1CJAbRFZZFB8slKtgiDeYDnSfEKzdSe+AWr2/p29+Di4nhtFdvsVXmd+gqrDBCqW
         tDXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nF+Nmx9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo6-20020ad45f06000000b004c702e879b1si914339qvb.436.2022.12.16.02.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Dec 2022 02:46:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nF+Nmx9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p68EX-0008EY-Ll; Fri, 16 Dec 2022 05:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p68ED-0008Bc-Kp
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 05:46:17 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p68EB-0004J7-3Q
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 05:46:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1448040wmo.1
 for <qemu-arm@nongnu.org>; Fri, 16 Dec 2022 02:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I7qpe/CGMn45Y8TAHmmha9tWCsTujnH/2UYttoi8M9E=;
 b=nF+Nmx9hqKdkkIbZg8HmI6Cz/YPafZifjOHi+zqUa/JEyg+pd49NkWBymZhZDQ8Syu
 X9tW0BsWoQgjKyzmLPvEDAjHtwzSbW/9xvdYal1HzgKDewICBjr7HYaucQwKM9C6g83w
 0CjjzrpuPCkK1pz8bhGQcKcLlhPrgpoAT16Q9HKFLZ1NkPwebgFw50bhb32MLJlmJuaI
 pJjf2isfimSuPikXwqI4wmgr5zHxKkSmxVt1fmAkzQEN+x2fMB//AnmyoO8TBHuzzyeG
 Vg2L935SStJzYg0GvdM7w03mhoa+m4Nrg3V2UP94yJ2YSITxjcCJNl9/cEEwnUCVGV3j
 pvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I7qpe/CGMn45Y8TAHmmha9tWCsTujnH/2UYttoi8M9E=;
 b=GksQC9trkwk/PjaJ3XS+a0Lqwf/11ej3Q/099lym1XjLl+d6O2x864nTwgkXs2dxhc
 LNpgJKSQnVrcH3pg/3BLsf/m/KHzEpCHafcPSpC8aIJkROwli0j2vzPwQc6iyKMhdft/
 C6HDdMvi9RzQZS+XmxlKO2GrU9WXtvqfS5CwFzsn7sYcgYfIDFI4FZamL6ezvj+PG+nJ
 i9wP9tEJoEj48CllOPjyzQyXYzYqll80IWgvyGaVGeNeMXAKSYMjbXlwyxeXEa7tLlbD
 mHN5KAsYTupGW9zTP8c7bzB/c0WLCW1vdYuLch7HnCjOe2e66jUCSf1jpf5BFcsmIOms
 wSTg==
X-Gm-Message-State: ANoB5plGu+0OCQ8SnBNI0fWlK3M8WmDl2pyCJsBTRPTrNsvP89H5EGog
 22jyEEC2NixDM77mD+RA7pupKw==
X-Received: by 2002:a05:600c:1da9:b0:3c7:a5:610e with SMTP id
 p41-20020a05600c1da900b003c700a5610emr25538424wms.27.1671187564752; 
 Fri, 16 Dec 2022 02:46:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m17-20020a7bce11000000b003d2157627a8sm9557669wmc.47.2022.12.16.02.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 02:46:04 -0800 (PST)
Message-ID: <fb070b3a-6b05-a0fb-09b9-c6c9d872e901@linaro.org>
Date: Fri, 16 Dec 2022 11:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] docs: do not talk about past removal as happening in the
 future
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm <qemu-arm@nongnu.org>
References: <20221216101506.524217-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216101506.524217-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gLdemKnIQ/rI

On 16/12/22 11:15, Paolo Bonzini wrote:
> KVM guest support on 32-bit Arm hosts *has* been removed, so rephrase
> the sentence describing it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/about/removed-features.rst | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index 63df9848fda2..7e12145c120d 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -565,9 +565,8 @@ KVM guest support on 32-bit Arm hosts (removed in 5.2)
>   ''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   The Linux kernel has dropped support for allowing 32-bit Arm systems
> -to host KVM guests as of the 5.7 kernel. Accordingly, QEMU is deprecating
> -its support for this configuration and will remove it in a future version.
> -Running 32-bit guests on a 64-bit Arm host remains supported.
> +to host KVM guests as of the 5.7 kernel, and was thus removed from QEMU
> +as well.  Running 32-bit guests on a 64-bit Arm host remains supported.
>   
>   RISC-V ISA Specific CPUs (removed in 5.1)
>   '''''''''''''''''''''''''''''''''''''''''

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

