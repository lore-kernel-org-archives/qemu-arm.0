Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp570119lfk;
        Sat, 22 Jan 2022 01:51:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz50021KhGd+Cv14AhHjvXLCFtznfdVctVyGvWq9p0y96zKYdPaPZOK844e+J3e9lfn77hm
X-Received: by 2002:a37:bc84:: with SMTP id m126mr5416201qkf.769.1642845103571;
        Sat, 22 Jan 2022 01:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642845103; cv=none;
        d=google.com; s=arc-20160816;
        b=KZsVqdXXxzdnZR2HH6KmYqeHkJcdrLn/cSxby1uiF5+R4C4n/ya50/P8aQm8pmQ2ww
         S9h6Q4t/Y32HtFxbke1vTquNtA4Zp6TLiH0MqN5lp+MpaqVpQsnMuM5icbU2EDZO1MAA
         2lDuDfP9khNhkgFDO3p4wGhln9Utnf7HImeOAe3qQCltAKM8GBggRFLFv+Gv8zDsHjoq
         RkJKpoVPPnOdjHdqz3BN2dmJhYoKjXJUhDTUkIb7A2xOadETRjHvGUDnWvmQED+CxnHK
         1Q0MYzzfiYbkkrdyWYg3K7ioLjl0LYUBSoXmjEHhCMu5MGJBcWSEbuPZCNDXZ2f0dnIa
         kXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QAm6ksvOJzfVeZM3sUQgfO3LD5IAfeA+TNVSh1lfAII=;
        b=XKmCwjrOup/b+JNCd7QgXE2pRENkHeKIELZez8HoghSTAHX7u5QTnGwqCsQmR97YSD
         wmYmKVrePbIhdBH2tC2g8J8a5LDLlQSsZ2kLqWc8HR+bjaXYGqXdB3aZeBwtCKAKcp1o
         j825h7VXvQBFY11Yf1/mGaskYRInkAnhaHwW5cAMfOFMXzbreEZWwlctVKcuC3FSM48s
         O1VAjeG7PyT0CpARQpZTdiTvHCbZc9Zs/VDKmhRhO4C1EkSXENwmJX+t6GuDor9mYGq5
         eW/qoHYX32Sr3X91ETAK8uTzIUQaWDqbg0yiNBbS2qbsiL/8GTI7mCKaldeZ7A/7QW2E
         WJZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Vli4vcoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si3359647qvj.159.2022.01.22.01.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Jan 2022 01:51:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Vli4vcoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nBD3f-0002Fh-0Y
	for alex.bennee@linaro.org; Sat, 22 Jan 2022 04:51:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBD2w-0002D8-LC; Sat, 22 Jan 2022 04:50:59 -0500
Received: from [2607:f8b0:4864:20::62c] (port=45580
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBD2v-0000X2-0o; Sat, 22 Jan 2022 04:50:58 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d7so10909438plr.12;
 Sat, 22 Jan 2022 01:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QAm6ksvOJzfVeZM3sUQgfO3LD5IAfeA+TNVSh1lfAII=;
 b=Vli4vcoF1pS9RySOQxlcuGK6nb7NmWKsRfrYECfcIF5ENrfVSwxtOkBfHA1xuWrGBq
 CFvkVOhoUNlVLE/DxpmXBDo8N4rxclU/tI+PpA+hNt8bD7o/qDfLa75ASAgmHFARRWGK
 Wz9aQbpd/GGmljcXEUkrWfwkmUjd5rvh0QsOoV+aAJBO0w1BaJoHXxhWTkINDW1RMwXR
 uiwKrXEOeOaUASDXOJUI6W01WkXEOKEiLbfFfwXJ+rUjbhojici3jWL7a0qkLkuiPQtC
 duGhb3bv1bOe9AKmgJSFPTBpjlv97MrrhOzxhQRk2dH0r5ojh560pCcouCchQ6u3HCsC
 lbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QAm6ksvOJzfVeZM3sUQgfO3LD5IAfeA+TNVSh1lfAII=;
 b=QhgjsirFiceyLVOZcGxf5rrZJyjM0qMaJsl38WVzh4sqauTMotJML91jKwVwS7F+uk
 yQvWIziKoFLC7onZSfDisRDtI4wwuezVYAoFYDn9kBOyYhiRWhfOkGKatDvPcuCWH5pL
 4JLplwOxd+8tAN1pRwYtBhObgZbGIgRBZRrtvvB9AH4sp5WfbHpFYrSBWqeZNHdSADaG
 1sjPP4g4V73Arv1+ojlwdjW020ZuuNG5o0EMgLSospv5cQhSJQH9eA8PdKIpAQUBPMCb
 21XVdutuLA7+puN8RU/jydMVfPIL97+ol/bm96AEjCTolNS5d/qk9DLH/12HqmO7/uIM
 Uaag==
X-Gm-Message-State: AOAM533Ph5iA8Le6CQxcAW/ImXpU41snYwBZEZfItR28cXyJFKcP+g+q
 fT4WhiWRvH78h4mGGZCR80E=
X-Received: by 2002:a17:902:dacf:b0:14b:2081:1c20 with SMTP id
 q15-20020a170902dacf00b0014b20811c20mr5231015plx.13.1642845055551; 
 Sat, 22 Jan 2022 01:50:55 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 25sm14426388pje.22.2022.01.22.01.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Jan 2022 01:50:55 -0800 (PST)
Message-ID: <e4466aa1-9fc7-a913-91e8-50c743cc4fe2@amsat.org>
Date: Sat, 22 Jan 2022 10:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/char/exynos4210_uart: Fix crash on trying to load VM
 state
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>
References: <20220120151648.433736-1-peter.maydell@linaro.org>
In-Reply-To: <20220120151648.433736-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: IhNfG8GkpYhG

On 20/1/22 16:16, Peter Maydell wrote:
> The exynos4210_uart_post_load() function assumes that it is passed
> the Exynos4210UartState, but it has been attached to the
> VMStateDescription for the Exynos4210UartFIFO type.  The result is a
> SIGSEGV when attempting to load VM state for any machine type
> including this device.
> 
> Fix the bug by attaching the post-load function to the VMSD for the
> Exynos4210UartState.  This is the logical place for it, because the
> actions it does relate to the entire UART state, not just the FIFO.
> 
> Thanks to the bug reporter @TrungNguyen1909 for the clear bug
> description and the suggested fix.
> 
> Fixes: c9d3396d80fe7ece9b
>     ("hw/char/exynos4210_uart: Implement post_load function")
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/638

Apparently GitLab doesn't recognize "Buglink":
https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#default-closing-pattern
which might be why we use "Resolves: " to have GitLab
automatically close issues.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/exynos4210_uart.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
