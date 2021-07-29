Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5403617lfc;
        Thu, 29 Jul 2021 00:41:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHtsKjVWeIGJ16DNVCGClQj2OkCQ7BNEpryED+f6k4261oFXxtaSz0hadxInX6UmIkvJTl
X-Received: by 2002:a0c:8386:: with SMTP id k6mr1266490qva.13.1627544480894;
        Thu, 29 Jul 2021 00:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627544480; cv=none;
        d=google.com; s=arc-20160816;
        b=IwtUlC2TPWqq4iy0LBRJ2t3CKE5Y8dMsz4RO7sPLD4AY36kDqISeZ/CV6tdXGAGDMG
         Qv48oyD/aMWLGM7NCqe5dZuxf6HPzpjdlsmaqNWWahWqd3eoJB5BAWhnVyriQRL+OP8C
         eBA99oeZ18KWWI4D777wlh+d122aVoLw/KZ5rSJplWngzwX21PuzdNzNisIUP4/YhlVE
         jXcbPSJAFRvqAM6pgHjuhG1fjNDn3pnWExRGyl3cqk/h5iDSRXeMIC+lqOWet/UzBN9e
         prbcUTbzk/n187KkWsqile1qOhM8uSjeoVXyyuoxV/RxsKl5e69JNieTi+SgbMLq8rag
         P+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cLNCxOJv0PXlORDF05l8V1Mq4z4REiFWWMnGoZ7oML8=;
        b=d8uwhOA29WDcRL/0I8mIOPuquo2FUwUzx6YX6YGwdr+fqviYUezu4U1yJlWZ0Whj7D
         lKJNJRftb/JBnCGuZKg66STouJblvYYLbi3GpKTB51d/ntDb0mdt3HFYdp0vQa46kgKz
         ijc09NeitlUF71TvGCQb0VEwXT1O7rN0XS+K0TmUU0xCJXdlfNFHl5M1QSEnkUzmt18x
         Pm7czyxWE2XZsQZgVPA1AOoQphB32UK8Xt9WlmK6eAplXuJmxvnF6UPeS+rK2GWv13mm
         2robEbauPWGXBGi4VLgo1Zu+b0PpJYz2khbmQp998rhhdGYHkKK5i6Nennp5e2GcQDXm
         /sPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="OuzhhNA/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si1436813qtn.106.2021.07.29.00.41.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 00:41:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="OuzhhNA/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m90fQ-00070Q-7m
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 03:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90fH-000706-9m; Thu, 29 Jul 2021 03:41:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90fG-0004LY-1F; Thu, 29 Jul 2021 03:41:11 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f18-20020a05600c4e92b0290253c32620e7so5901748wmq.5; 
 Thu, 29 Jul 2021 00:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cLNCxOJv0PXlORDF05l8V1Mq4z4REiFWWMnGoZ7oML8=;
 b=OuzhhNA/yodTxevNMb9Abf5uepweP1kVpq6Asd9yVB7l/mSQeyMu0K6RCT3e8aVjPk
 BJSCnleKunCfPr1ci8o9Tm3jQZNNyIpG0VGHvcpNCqIsNmdPxc0foX39Ed5cKoM4v75m
 /IHQ2MNEOaMAhbijqS1NOq3ebwy+9p4CVW5xHKrpMpQU8vdIdMJIhg7I+nn76GMbBUCT
 GyS8YooiB5oDe4QCLCyTMdGuVJBVLrSsDDRbBPbksvr3TJLvOPmOJ+In3VX/JAgSojAu
 dVtzTX+6BZJDp0TOMuvUSLPvl0K9TXpp35QVTL0II/eXQ6FAzRLLxrLfpK9Q/BsaJoYX
 2ldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cLNCxOJv0PXlORDF05l8V1Mq4z4REiFWWMnGoZ7oML8=;
 b=BfKhGePVbVPXATO5xwvhQBIVbdsSCQ1PZMnNPg7W7UdS28uSIwKY/D/hui7fgwzc9U
 zzXvpJ+H9w9z1WO/895l9c1vgcSsLw5wdbOQo0E2D5FP4V9uLiLztDngqco/u3S9Q+UG
 eYPaut85SWFNc4ooUUHeZZvCJ9fE/E7/7MKjfW+brqKtr2IY9laOgWr4gBaKWHyl0VMY
 W/V8rQGbC73js90SV+T7S6KWGFIhYsLAcwH6Rh0sJxjKi+wTLTBsmwy0pPyUpyojBpHJ
 DP+FjfQn5C+LIKF/+4Re6BnMoTHecaJc0jMHja8/yI8nM0i6Bh70KAmQJhsaJua9olig
 BMXw==
X-Gm-Message-State: AOAM532movx5bIF2v4vPqXEoJ31b0DYLax5RoRMYj+CKoiLrAzo6ZtoE
 o+NOfYAyaf59fQF/USTjuZ8lQoru4ZfnPA==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr3488444wmj.151.1627544467945; 
 Thu, 29 Jul 2021 00:41:07 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id p3sm8563473wmp.25.2021.07.29.00.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 00:41:07 -0700 (PDT)
Subject: Re: [PATCH for-6.2 38/43] target/arm: Use cpu_*_mmu instead of
 helper_*_mmu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-39-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9eaf56f0-da50-e34e-4f50-3f5cebde0e24@amsat.org>
Date: Thu, 29 Jul 2021 09:41:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-39-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y6bkKSLMNENr

On 7/29/21 2:46 AM, Richard Henderson wrote:
> The helper_*_mmu functions were the only thing available
> when this code was written.  This could have been adjusted
> when we added cpu_*_mmuidx_ra, but now we can most easily
> use the newest set of interfaces.
> 
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.c | 52 +++++++----------------------------------
>  target/arm/m_helper.c   |  6 ++---
>  2 files changed, 11 insertions(+), 47 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
