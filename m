Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5102563lfa;
        Tue, 3 Nov 2020 12:15:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySLIJICpl4iVaKleXsovbupwIZiMUHF2hTvndvGJnI3AL99iaak2flVG7VnVOR5SgKVml4
X-Received: by 2002:ae9:ee01:: with SMTP id i1mr21462351qkg.10.1604434504576;
        Tue, 03 Nov 2020 12:15:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604434504; cv=none;
        d=google.com; s=arc-20160816;
        b=KD4F1u7nKbJ+gqO8uYNg7gAMlf1sXrEsYDPGz7Ggpn7MxpXJXSfTJaTWm37tuU42gA
         QqvuKkSiu7QnpPujYkHvdeLWD7SvOoSxbkVsTvDaDqXcBP6uPsCO8tmyuziSHWV6owqy
         mltHprUPGHymu8JHv8vxYkW4Uo+i76G0RAQZqd3WlcRPcBXPQ2qQCUtehNsblef7A73d
         CnbEXeidgogPXQLiYXLgzMWH+nWgCRyEfEJAU4jB9ytkH6uBX7Aqwwq/oJr2Svk4G2/V
         K80S8w8ZrZ3Shd3SPi1bdT/Mnc+YPHNKWfR+ssv/Polxjhd9Uk5RFUvuXRdNOXgkxNKK
         sJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IM/mJ8oXmYjI6aL6FoMs9njfpz/pGeOj+YfkomKFktU=;
        b=cePWHVf0E1sZIpFmUF4fR0MgBWcWqXSGk4CVMfvGEXsMVdnZ4sUi+NB1djs7rwm+wn
         i/YPqeayeTQ/MB/MiVIt+SwuqQHE12vans+eI1ApiNMgo8AkzX3lPnZC2ZyvaG8yO2mK
         +xdK39OolzK5DC+ifu+XQUAVrSZC34HeyqbKEAcUGIUu4WYp3hqu1/5LTsOzaQrjM3rF
         otyX3I5lAACYGxZoDDdkVjvrt+etM4R0zha6NM4VAcnHy2OaweXNBjVWPQEh/gjZCow3
         L/vY7bSJCWKMOazOu2m0rG9s/UtCMKrcF2OOwqs26DGMBaVjeoteT35JfhIPcFXOAD2I
         xDvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J80ah+ZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si10997532qke.6.2020.11.03.12.15.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 12:15:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J80ah+ZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ka2hr-00064Q-Un
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 15:15:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2hj-000648-PA
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 15:14:55 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2hi-0004Ev-12
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 15:14:55 -0500
Received: by mail-pl1-x643.google.com with SMTP id f21so9098414plr.5
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 12:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IM/mJ8oXmYjI6aL6FoMs9njfpz/pGeOj+YfkomKFktU=;
 b=J80ah+ZUbl6t7kmXJhzjEe673ZckBcNmSFhrZmD8zfjjdDLQYuDJPWaVW427fHhuRA
 iaNjjl+UF+Rm+xCDJlQ3ZZQVxM4DakJ8yMJXytMJtklZG1OeI6oWpAucNcF75pMBlv90
 NGtxc8JFfaccxHxcNU/zQj0eBn5r3EkPnlWGnkSKbMQum35imgLy29ovZarCZ1YG/FY9
 TVBvpdSfpyJYvZht6CkNDFzuCtXU/th+jiP1Lg+ZzSvsdrvWQZX81Y7CgKIAP/zhQbNE
 FeYgUUA7Abw4Dl6hBve1Y/rQ3G06Caeh4VpPdQP9g9d08zSd/wZ+n43oxo+beMJlSkOo
 BKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IM/mJ8oXmYjI6aL6FoMs9njfpz/pGeOj+YfkomKFktU=;
 b=F9mk2KEdeCBVwcBoCJfyKmeQPk7J1+3pP1lAhkpTkWVNPzYvOlcD4pM9ikw/mCfRTg
 B04sKif6jYI+/OB/8j6jPMYlwqkV33TdtZLe0oo6pj7zEANIiIyoHQsc7j1QYfhJQHUE
 100BocSdMU4s4QaNwriV27hNiI0mI55vG9njC49QGrmNFXEqmcHUqf6wTCja6pRFHYlg
 OCPaoJgbjg1zesBToEH4/Ar2TY+FaFRAbXi6/VpQSVjj/EwXOFxRRcjlo2An+dOPDw8L
 jkU/8j0BGCYgYK0qW0YgpdGoULKtmXeJWyJTlosGhNwevIDV3/8DS73WC18zNmcFE34v
 Ni/A==
X-Gm-Message-State: AOAM531ehBYz47y6/ZraR1wQz1yK4gRciSJHL9zf/LzyDZAqWwOJnJqT
 RBQnWkvaFwyao3MAALxpjNhyOg==
X-Received: by 2002:a17:902:423:b029:d5:f967:86fe with SMTP id
 32-20020a1709020423b02900d5f96786femr26459148ple.55.1604434492352; 
 Tue, 03 Nov 2020 12:14:52 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id e2sm16524333pgd.27.2020.11.03.12.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 12:14:51 -0800 (PST)
Subject: Re: [PATCH 13/14] target/arm: add ARMv8.4-SEL2 extension
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-13-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <88fad1a2-00a6-0a4d-1012-91ecfb45f4e4@linaro.org>
Date: Tue, 3 Nov 2020 12:14:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102105802.39332-13-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S5YzXjKxNAHl

On 11/2/20 2:58 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This adds handling for the SCR_EL3.EEL2 bit.
> 
> A translation block flag is added in A32 mode to route exceptions
> correctly from AArch32 S-EL1 to (AArch64) S-EL2.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.c       |  2 +-
>  target/arm/cpu.h       | 11 ++++++++---
>  target/arm/helper.c    | 19 +++++++++++++++++--
>  target/arm/translate.c |  6 ++++--
>  target/arm/translate.h |  1 +
>  5 files changed, 31 insertions(+), 8 deletions(-)

Annoying that a new hflags bit is required, but I don't see a good way around that.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
