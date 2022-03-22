Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1609340lfb;
        Tue, 22 Mar 2022 08:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhtetSrlWm+MtLZo+3CqfsvB766Xjfgo749L/79VYpIS6K4Qz4pFRpyPgbuYBXb21hNdvQ
X-Received: by 2002:a05:622a:1303:b0:2e0:710e:1372 with SMTP id v3-20020a05622a130300b002e0710e1372mr20178268qtk.566.1647961286847;
        Tue, 22 Mar 2022 08:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647961286; cv=none;
        d=google.com; s=arc-20160816;
        b=ITvqYsukT/F4eWCDfZTYX2k4pwhSBeIvMcxI93csv7yBlU3ZDk4iPYnWoWKDguqUvM
         qDYN82/HN3KyHyQCJHukX7ukNFIhFjlGWuejEYtdjg/wBPoAQeXZgCz0m4ZBjbMW5X+y
         DvSBw9cfD/7W4rhF+OVJ8yxChbJlNDYjXba+8trOayfU1Cwj8NfwRxG6qWE1L2RTgnR3
         iRJjUS+4xppXhBQ7d2HpEPSjnAJ2nDKGNdWbHRe90BFwuIE59coiZmgSHeP8eHCtadAR
         uxwUltYu8BnKjp1haycwFjZajsFNvzUKLyspiJ+fZqJNSBSVr0VHQieXhqqfOmmnbRVR
         mLUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=GmI+FCWe9wjBBLe1AwZOFnpBW9/+gU8DcVA5R6lmDZk=;
        b=nvcccuLUA8UkXWXc3QITqW16J3kcTQ0R1QBWAQA1N4b3xt1F1xcj2kY4WG2FouowmS
         f6zp3svksSeXQwA6r4SWIwktSUJxKzGOcO30otbMCw9huBRGq9YWLGEMoLSY6N4W4mau
         ju0VjajwCN0MtXGSKLPlB8U19EZcWIA+yUeLGhP0TNt3Xx0zLcO5lJq6IunI9vZMk0aW
         5m9Ltu1KoN9c6FrwqPqveQbJfOnwbYtazi9lIFuV4zib6mey50ylu7r5/7mHhzLpKmpd
         7bRiHmmior8YMfFDDA4jCgHbWW35PpE1X5VoDNdUG2GvsCxCR55eJmQm8PgFq1mq7/lI
         DTUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NlndussV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6-20020a05620a294600b0067e4be23849si3448855qkp.142.2022.03.22.08.01.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Mar 2022 08:01:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NlndussV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWg0k-0008Sb-C4
	for alex.bennee@linaro.org; Tue, 22 Mar 2022 11:01:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWg0C-0008OQ-6X
 for qemu-arm@nongnu.org; Tue, 22 Mar 2022 11:00:52 -0400
Received: from [2607:f8b0:4864:20::1033] (port=53865
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWg0A-0002zE-FW
 for qemu-arm@nongnu.org; Tue, 22 Mar 2022 11:00:51 -0400
Received: by mail-pj1-x1033.google.com with SMTP id bx5so15856199pjb.3
 for <qemu-arm@nongnu.org>; Tue, 22 Mar 2022 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=GmI+FCWe9wjBBLe1AwZOFnpBW9/+gU8DcVA5R6lmDZk=;
 b=NlndussVrIdXguaEMfFZM3mj5tNoBc1C9/IRCS/HCo1YzONSnFk/8QbkZKNQ4iFtKk
 stLrLRMdJ3VSfCOgjTzTpVqFfcK2r+Izq1hgrJ2Mqcidzp/KMHkjmG5av8R9++MbIaAl
 tfeGs+ZYjcLzQx+yc7no4YpDkbzeh7QiP3qYdYEm4IysU5cHp6ZIVfx6kawVgnSFR7K6
 UWnCcGxdxPYRMPPVz1z8ZbHrtuYXu2CIhoQR9IRg5OIeRmSVE5mjam/8Hg2ReaBxz3kH
 qkOV15Pk02Ghn1fUdM2zV3RA0K2Sitk9aFzy6+nv56kGfeSde110+xwS3nqFJqLQ2gSo
 wdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GmI+FCWe9wjBBLe1AwZOFnpBW9/+gU8DcVA5R6lmDZk=;
 b=SETG8VbSQKyKWlXFtQgjmImnguNi61jbwbN1XFYWMzf+3NZkqkuM4j9fgLfHhNOfMr
 DjVkJxc3CM+kMzzem3/Lk+eqgV0Eo5At8Zla8OpZ+zTn6oq+U3ODeelwoWpywcoIV71R
 uXRR7Y7BvQR+y3MXWFevBVF78Jf8cCnVzeBzokFcEDK5JlJjyrKCoeTGN9nVMMyyCBUX
 vw/vHYib5UUSCrWn75QelIvEhHMxsMbq8vZtknaG9sBT/LSRAkLK6jsyA20/SjMpb5iG
 sWxDxNQapwxgndFVo42dy//XcTGD+ueQ2HPYQJvy7ndBttdYaRuMbXvZyVe1ZOa7giBG
 A8bQ==
X-Gm-Message-State: AOAM533SSAnyLnMQS+iGWpAdVYn24vD2gR2buQE5Q1c6YxT7fQd2dANY
 qXQyVxEDFxuJeLFhVN5REbCmUg==
X-Received: by 2002:a17:90a:c083:b0:1c6:a164:fd5d with SMTP id
 o3-20020a17090ac08300b001c6a164fd5dmr5579861pjs.8.1647961248981; 
 Tue, 22 Mar 2022 08:00:48 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 3-20020a17090a1a0300b001c5d05622fbsm3167718pjk.33.2022.03.22.08.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 08:00:48 -0700 (PDT)
Message-ID: <3a26879d-d6f7-1f2e-bb2b-e8ee6a005fa9@linaro.org>
Date: Tue, 22 Mar 2022 08:00:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.0] hw/intc/arm_gicv3_its: Add missing newlines to
 process_mapc() logging
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220322102824.3474956-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220322102824.3474956-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: nGPxQAt/+dfv

On 3/22/22 03:28, Peter Maydell wrote:
> In commit 84d43d2e82da we rearranged the logging of errors in
> process_mapc(), and inadvertently dropped the trailing newlines
> from the log messages. Restore them.
> 
> Fixes: 84d43d2e82da ("hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index b96b874afdf..d9c741f5fdd 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -524,12 +524,12 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
>       trace_gicv3_its_cmd_mapc(icid, cte.rdbase, cte.valid);
>   
>       if (icid >= s->ct.num_entries) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d", icid);
> +        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d\n", icid);
>           return CMD_CONTINUE;
>       }
>       if (cte.valid && cte.rdbase >= s->gicv3->num_cpu) {
>           qemu_log_mask(LOG_GUEST_ERROR,
> -                      "ITS MAPC: invalid RDBASE %u ", cte.rdbase);
> +                      "ITS MAPC: invalid RDBASE %u\n", cte.rdbase);

Should fix %d as well, broken with the same patch, 84d43d2e82d.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
