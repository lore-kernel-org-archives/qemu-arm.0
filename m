Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp450005lfv;
        Sat, 30 Oct 2021 16:46:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/bHP6AXBFHWpwxHFujxaSQbu0OXn8hXDB7qwBGcQzO7gKuavXib7GMdRZ62iFzR51jJC0
X-Received: by 2002:a05:6830:232b:: with SMTP id q11mr15285233otg.164.1635637594348;
        Sat, 30 Oct 2021 16:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635637594; cv=none;
        d=google.com; s=arc-20160816;
        b=NAlePJF4Wj0mDTk3K4s8VUl/oEN7uwD8o1fJ2QjcDZCMgJK/6ZBst2FV94RfPpn32H
         plFKWC5St1m9bKqnYCPbnVlBj8KICiWdcKXJl7ANUsl4wx0rszII79dQTMHsLHptUU2G
         v2DSvrPzYa3sU/S+qIWMzrYp77vLPoBkAHGd/JwmV3BDP6l1ERPBU0u9bARbny+OJAyp
         cnR+7t/584/vCKtbeuMvBKiCXf+J2FtIElBjj8G54jRUDIzlSsYMHj6Rpe8zG7MIgRHf
         0y06KOlq9G6Hjpog1FxWL7HQLYC8xbV/B5iMMYCQq+TkU3Z8CHGJNYC90Vv6HAohjrVr
         pRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4HSzZgkJyeqEQJXA8TwYUfUmKF6/XkNBatKQTythjj0=;
        b=BdPbAbm2AJ4Sw2xEitlMInqSfHhB8o9RlEaaTgzmIfnSoD+WDHV7yTvXgudAACQfuF
         Jpp3dkR+GWn0wZQX1L92DlgEqAtidgpLptKZbZ2o/JjKr9n1eP7B65NtXZFL+5eN1aIl
         RBo2lvkOo3K8t2NLkINTJOsubLg7xoXXLlXmGDNybACNXqDhmn/UaZTRLkwJOHYhIxH3
         mzgA7XbVKNOvQrAJq62UrslRMV+hMBk/CZhjBy7lkzLaWh4UdF8WJWxGowmzvrD7JkS1
         HCt9lfE65YA2GIyq+nud81558NDzNX9zMbhf2xc5/rqEc8JMfKmvi3+MUnQzDuVeTgfH
         cMjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KgpgD0nR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq17si14667813oib.116.2021.10.30.16.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Oct 2021 16:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KgpgD0nR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mgy3V-0006J6-Ho
	for alex.bennee@linaro.org; Sat, 30 Oct 2021 19:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy2U-0006IZ-0G
 for qemu-arm@nongnu.org; Sat, 30 Oct 2021 19:45:30 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy2S-0006qJ-Jo
 for qemu-arm@nongnu.org; Sat, 30 Oct 2021 19:45:29 -0400
Received: by mail-pf1-x433.google.com with SMTP id a26so12801218pfr.11
 for <qemu-arm@nongnu.org>; Sat, 30 Oct 2021 16:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4HSzZgkJyeqEQJXA8TwYUfUmKF6/XkNBatKQTythjj0=;
 b=KgpgD0nRYcL1pRN/ltlhvSH3llB1dBAj9EIB4QfyL1PpshOEl0DHn1+0qm02RQpJjK
 JOCDlz6/FKi3v5nSJWpzPNwid7VN+65W2AZ2kN8bZRxr+Z/pcx8MPg4GNdivDE6MmF6u
 ae2WrijsSynu86EHr/7kEJyO9/l5do+Q6g1o+NsaejaI6IWgANPHXDG4NYc4yQfjmCPP
 ST6eUCFF74aBRa+rjOX/N/VOUR3m+R5ywb1T6D5FMPdfhew7R/0Hc5m4wkKTX4MLeXjb
 0lOm9jLjuKL3ASDPkNiim/8SLGFK5jhrhaN/qCkqlmoFYT4/XrmyKi3tYLSOFii72PbM
 efBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4HSzZgkJyeqEQJXA8TwYUfUmKF6/XkNBatKQTythjj0=;
 b=nLwGHzHaUdTnGgNYoRPMEPEb7W9YtImDGA1N1sdgPk1/hGl46e2WIIfsDsZYZQUO5r
 tp7LlQzW7zB7Zf0SnERTNW1uT5mL3O5Q/a8M9S8TQnX5YMzoOXsEUsj40jn5pnq1S29p
 7F8JaVX2UrqAzL8S8rm+XbXHWFK8q9xle1v0GUS6VApLFc7HHrYIc+cfd6RzqgNx3feg
 O7XL2ROFih544Byel/Z6BE0opSPbuyCeMgBs08sDmfBWQxZ33LnN30TCWv8Ug52Mu2I2
 VG9bGTugazxBrGN9a/tfGB+seBKZarYJmy9ziLSuWQ9CZBnLK30cSVO4mC5vKnB+JF7K
 VJ1g==
X-Gm-Message-State: AOAM530Iy0D4TGDudnojd/Njzb+h24TPEePlDaiAqYTJAzo1DPgVOg0y
 /PVuoJszGLF6yLuf3K7zq6zN4Yz00lpKHA==
X-Received: by 2002:a05:6a00:2345:b0:47c:aea:7c01 with SMTP id
 j5-20020a056a00234500b0047c0aea7c01mr19782714pfj.68.1635637526879; 
 Sat, 30 Oct 2021 16:45:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e8sm842842pgn.46.2021.10.30.16.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 16:45:26 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] target/arm: Introduce store_cpu_field_constant()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211029231834.2476117-1-f4bug@amsat.org>
 <20211029231834.2476117-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <737671dd-1db3-1d4d-4ba5-6c25684087ae@linaro.org>
Date: Sat, 30 Oct 2021 16:45:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029231834.2476117-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bv2QHHPtq5gD

On 10/29/21 4:18 PM, Philippe Mathieu-Daudé wrote:
> Similarly to the store_cpu_field() helper which takes a TCG
> temporary, store its value to the CPUState, introduce the
> store_cpu_field_constant() helper which store a constant to
> CPUState (without using any TCG temporary).
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/translate-a32.h | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
