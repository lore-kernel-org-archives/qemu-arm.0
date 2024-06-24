Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp376996njc;
        Mon, 24 Jun 2024 01:44:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSutuYD07DpPwQQLhPeQZNoc0Q8HdIJj33WILan62jEkbP0swmK+wEeF5iftIzDEfvwxz91VX2Cz+zMKHqpis9A0Qk8knS
X-Google-Smtp-Source: AGHT+IFBbLD4iy5rHLtFQ+II8R4RV5kA8oxe3k/8hK415zJXib4dUXiK/gyM5FmMx24lRKiK4v96
X-Received: by 2002:ad4:4c02:0:b0:6b0:8b6b:2074 with SMTP id 6a1803df08f44-6b54099c301mr41253196d6.13.1719218678248;
        Mon, 24 Jun 2024 01:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719218678; cv=none;
        d=google.com; s=arc-20160816;
        b=NjqEf/20gx0vOaJMjgWZhJ2G214HVgI4PWjfmyPhBnuOmVCSbXvs/qfBuclnZsbkcq
         shEObI+bwizYTndOD2lLEcBayCZO3MD1g/ZvZ88KOwYGVLJGYq2/gJil+rW6T14uEO4n
         Y1NVB/UEK+A501zNtkpZrw5wJT2Zfdj3QeA84Up/8FIxUH0pX8NkPH+Mgkv59RvEOEFH
         nRx0iJnrwcV2Q+I5GlfMXcwmlM6AoSR8gKuCLAnFIkgxGLB9IIOs9Yv89eOlnF/OBwK5
         cQcJ6lxNl2ZkjULxrYwFP2NkD/JoRxQvYrBKUGMESYyVya69oBvV2Ni+gVQZMeHQ9rnC
         AbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=wiEo3FPt4b20aadLyuASBpxXGRzWa7aS3LSaKL7ieCs=;
        fh=y8UldgvBpgWdzvo0ZnT6ptMSZ9zI0pieroCu40oTsaQ=;
        b=jBuhji1PJfbNrAiw69K52RtkVcBLqfb4GVOlGfX8hzjTmltjA/i9n1BD6ZmqwpDhi7
         FqbsfDTQCJbdkuozEl8oyjIC0y91+XS3ZjQ+h4HAvAhLVbmDlEGLUS7noUh1Lv3PN6Eu
         5VMGDZ+D10c/n/jzJpC/pAJflkhDc6zQVD1uCoG1FfkJ4VzGmFOQNPz9zs7Zrg9cw8ZN
         bJ3YrrTvKypkIrWAwiherL6hmrsUZZ0XxTC87471Dn0eTLSID+aJkYa4uYwtCP6Cnf3i
         own7e7MRGUq6h7LuHbdnCJ8yX6GYFMoUObGI0rntwgMqvfILmESW8dLXLUM5yOCwJ17q
         sNVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b537761387si45467866d6.129.2024.06.24.01.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 01:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLfJC-0007nj-Jl; Mon, 24 Jun 2024 04:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=voaC=N2=kaod.org=clg@ozlabs.org>)
 id 1sLfJA-0007n0-Le; Mon, 24 Jun 2024 04:44:16 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=voaC=N2=kaod.org=clg@ozlabs.org>)
 id 1sLfJ8-0006qi-5Q; Mon, 24 Jun 2024 04:44:16 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4W71j50gLhz4x0r;
 Mon, 24 Jun 2024 18:44:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W71j129Chz4wx6;
 Mon, 24 Jun 2024 18:44:04 +1000 (AEST)
Message-ID: <2d0bcf57-0a76-458a-a40f-70a31135e9e5@kaod.org>
Date: Mon, 24 Jun 2024 10:44:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] aspeed/soc: fix coverity issue
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
 <20240619093508.2528537-2-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240619093508.2528537-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=voaC=N2=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: V/rVA4pdzOAP

On 6/19/24 11:35 AM, Jamin Lin wrote:
> Fix coverity defect: DIVIDE_BY_ZERO.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


I have rewritten the commit log :

     aspeed/soc: Fix possible divide by zero
     
     Coverity reports a possible DIVIDE_BY_ZERO issue regarding the
     "ram_size" object property. This can not happen because RAM has
     predefined valid sizes per SoC. Nevertheless, add a test to
     close the issue.

     Fixes: Coverity CID 1547113

with that,

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



> ---
>   hw/arm/aspeed_ast27x0.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index b6876b4862..d14a46df6f 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -211,6 +211,12 @@ static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
>       ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
>                                           &error_abort);
>   
> +    if (!ram_size) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: ram_size is zero",  __func__);
> +        return;
> +    }
> +
>       /*
>        * Emulate ddr capacity hardware behavior.
>        * If writes the data to the address which is beyond the ram size,

