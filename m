Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1217127njf;
        Mon, 2 Sep 2024 12:55:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXqP1fKH5Qj095jv1Naa8hzBUH6PmXWeFl8JmgtpY0L0WqR4E6THfvQ3l88PQA77gPrAitcNH5ZmmJiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHGMbJ0cPZZS+uXmClW42SoRf1o/hfVV7Ckjc3lUKYo51rlHE4j6O12Er5x9g5A0gMJB5Vv
X-Received: by 2002:a05:6830:720a:b0:70f:75a6:1f26 with SMTP id 46e09a7af769-70f75a620d0mr9190772a34.16.1725306934811;
        Mon, 02 Sep 2024 12:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725306934; cv=none;
        d=google.com; s=arc-20160816;
        b=i2UdNjQeg9g0Cktb2NzVHYJWhr7NqiMuv1P+gF4zx+8I77J7ptiqYDsTRlXvhRu6pK
         7ZqdhQ/6cKJDOQEuapLfXLS5HHZKVlZmtjiBWoyu5PQFiobP0ER1CyeuqmgXagw3Klhl
         L+Ji4N0qhjvxhc1LX1GE0oMd+jPBL8ND/au9w2/awVc3aNTjzTk6hjIJ8pXlV5o4HPvt
         +u1WYOB+WqBdGxaNJMKMJ2DVAEUinIBlkWrLubjUnGfhyZeKV5ybOCW+lUH/WfyLfpGb
         W0VPv21fH/KzhjyrBCEU7oytFtQtSs8hN7WpI8bmcr4Cl09PlhMHhpbPUYnhZNEgSYyI
         IvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6OYk5H/64/a6pHEKQ2Q7Gqfy9ogtkpUw5e0fdfG20z0=;
        fh=ALOxJvXo7SIw/tDyYye1D3LQraA46lA8q52bUkGfsCI=;
        b=sGoycUv/BkMZeDd4y1w/DbqNkavoNDwj9HgN57pk29LS27mBS+FC7fcO68HSI9MmWJ
         AVE8/AFMaRBMSAhtxBpz4xuprfFwicJt7rOEMeMF0FXWKrAJDwtXaxVvU+8evHesKXxi
         8cTjXfsCM+Ml2mAplg5YXbJc6R/sDGeJO3vi2F/2rZg0By4iMs4yLMBKd8mC3ItHFf2k
         vfIXbUPI74qmP93Ue4GS4Q7G2D0k2japi09kr9JEyPIVCqmdG+F+e0gw3220dQkudUPO
         n9E1QGxpy8NF/cJLqYcJ0MdRobQnF2SReWGBchL3ini/otJkMTTOEQ8URpbWDduwoDAK
         pk0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztpyL5wW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c3559f56f0si70118906d6.492.2024.09.02.12.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 12:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztpyL5wW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slD95-0000xO-FX; Mon, 02 Sep 2024 15:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slD93-0000wP-Ob
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 15:55:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slD91-0006gP-FN
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 15:55:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-374cacf18b1so959489f8f.2
 for <qemu-arm@nongnu.org>; Mon, 02 Sep 2024 12:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725306921; x=1725911721; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6OYk5H/64/a6pHEKQ2Q7Gqfy9ogtkpUw5e0fdfG20z0=;
 b=ztpyL5wWP6KJ7ldveUn8flwxg/PHDHr1ptjhl53VTIi6M6wTe1RwQM/JtPM2c82F0Z
 txWCOR9vk+PrSoL4cL0DbWAkK8krzZA1/6PBFq+7iPc+Ed2/5IYvWccALqcrKfciiMkO
 J1sKD5GjzMBZXluYVI97IC0/J1SL6Zf5rEIoFvikrwFHb8ZespjN2NtoNcJBNZfoh9Dl
 umXKHnGz+75I2E0XPfI6GNasJ18DkgDKfqhmBCU87xR3vpkuxojXul2Gz5UIt27MlwLb
 QbD/fHUV5/rdytOWhIT7SNtCiLmrystgm1d7+rsn8BkDI0zXUrgPHU9YpmnyE8plEoLU
 J8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725306921; x=1725911721;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6OYk5H/64/a6pHEKQ2Q7Gqfy9ogtkpUw5e0fdfG20z0=;
 b=QuqWsRgyEU1gRwWWDf6+p+FbE9F8rHvExp9rcQJY9pzKn+3hiIPU8KQomq+6exutw/
 YRbT1khYXknKX/rDrlbHjCB54DWlbMyDKKfG44kHS+RD6/+Q0ETLqRGFxOJmAKr6N6zT
 GksCNPd18AYDzjsJxYb0GZ/mSIWWsLqDH+Aq6T6QgRW7tgJOG/T9iD0jpbnNK3uQc1yC
 apMAFtvrvo+jOC1XcTSVI4nAxzrlWz371mg2kIYhHAah2m8WLvr3YEg47NYrNvtL6FY0
 Pp0RGTKj5nciBr7LKZ6reR0Pt6t19vnkzb26jYVRKmG+tIZbKfPKPSRFhWB3xcvALtmQ
 CnVg==
X-Gm-Message-State: AOJu0YxLK3lr7Mk3JCxSr6I4OO/wILsTti8d+MUdtleUXbJnRiiFcHWo
 T7xMxWQD4OknQoZ2mXW3Xdne7DILiTRChs86Wzc2xztXNDn9ltkM30LMa1x+VSA=
X-Received: by 2002:adf:e645:0:b0:374:c942:a6b4 with SMTP id
 ffacd0b85a97d-374c942a842mr2544212f8f.20.1725306921276; 
 Mon, 02 Sep 2024 12:55:21 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ef7ea08sm12206215f8f.68.2024.09.02.12.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 12:55:20 -0700 (PDT)
Message-ID: <7c67704e-a067-4b6e-8acb-51b33cf17ee0@linaro.org>
Date: Mon, 2 Sep 2024 21:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/boot: Report error msg if loading elf/dtb failed
To: Changbin Du <changbin.du@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240830105304.2547406-1-changbin.du@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240830105304.2547406-1-changbin.du@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ak0aMSgQQRbU

Hi Changbin,

On 30/8/24 12:53, Changbin Du via wrote:
> Print errors before exit. Do not exit silently.
> 
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> 
> ---
> v2: remove msg for arm_load_dtb.
> ---
>   hw/arm/boot.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index d480a7da02cf..e15bf097a559 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -839,6 +839,7 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
>                         1, data_swab, as);
>       if (ret <= 0) {
>           /* The header loaded but the image didn't */
> +        error_report("could not load elf '%s'", info->kernel_filename);

"Could ..." (caps)

"hw/loader.h" is not well documented, but it seems load_elf*() returns:

   #define ELF_LOAD_FAILED       -1
   #define ELF_LOAD_NOT_ELF      -2
   #define ELF_LOAD_WRONG_ARCH   -3
   #define ELF_LOAD_WRONG_ENDIAN -4
   #define ELF_LOAD_TOO_BIG      -5

And we can display this error calling:

   const char *load_elf_strerror(ssize_t error);

So we can be more precise here using:

   error_report("Could not load elf '%s'", info->kernel_filename,
                load_elf_strerror(ret));

>           exit(1);
>       }
>   

Better (but out of scope of this patch) could be to pass an Error *errp
argument to the load_elf*() family of functions, and fill it with the
appropriate error message.

Regards,

Phil.
