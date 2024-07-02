Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1757862njm;
        Mon, 1 Jul 2024 22:58:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcu+2GTfmECPmR3GEo+A0tgOKG56l3MDZ8GCEaslc4+XQh2sZNDZSTRFr1Z8LaYxpEyxdT56+C5zUEHjX9vebe0voCwWLM
X-Google-Smtp-Source: AGHT+IE446xDe5CSnCCyhkXounpCSsSv2gMST6x4ln4AFAXlgKlHwQ//d9KSvRAIuBGQC2i09RSZ
X-Received: by 2002:a05:6214:cc4:b0:6b4:fe2c:a455 with SMTP id 6a1803df08f44-6b5b7177df9mr129192096d6.46.1719899901365;
        Mon, 01 Jul 2024 22:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719899901; cv=none;
        d=google.com; s=arc-20160816;
        b=tTSwqDlDs5N34xXtdYKhTkR3C88otIiGy5Ns5ytKiuK8NDASa8xzvcNfiJL5LqUHAN
         2QEJnZjjTuMziYN+vrNDsdpEF4ZzbZQ4GbXJr6lfnBOZPCQgx3b0zGaxqHiQwBLjeGWe
         K87IRihTqhawfJOU+VjbvTKas+0d7A6/dqyn7Uay3Pr93fGZ3t9vKHmVEcyMul3RY675
         z6g79VgX6ZFpg/e+XduqxDwv1yd6/ngDwjwQ7ajnrLRkrslPexq1zTsycpIGF9NtSxxb
         BnFcer9f6Jhd6BJ5birOzq64aj/IlDfYFQNfDrabLDeDwmS+Y1MUJ67BiXZdfKSG/8BQ
         sUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id;
        bh=52pnPRL6iDOt0kwJ7SVtemBjPn5v4vI42NN4HPrMVS0=;
        fh=ExalYl5cSGhcrnZqOaWDDvlr2o9+JLOTuXQhdEtSK3g=;
        b=GukwCETQMtInOG0lRO1W4P9/WD0DllAjgRuUHplI4cfQQ5bQ8A5p2rnbZ6Mw+Y/agH
         vE0haeHXyd480ZTtf7NO730naKdEMjIxONHMgLiEX/hVK85lam5wG/j7D7PsruVNfsux
         3DoUkh3rMl/XILsKDBZbeStm2IVcnDiRaO9W+mKF51rPbfave7PYxiAIHA6iT5WWATID
         YssxoIABzua6rJt/OQExqB26UGUSGK3JWLdJpzA2xZ599lMhx2iaCjMmFIBIMevoN5p7
         O7Aw083wFTbtiEHR0fB4f/ljtXeSKzPV029BnRwJ0+pCLwGRyExUdOcmt++F2buKgB9N
         vJuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e615fb8si100532066d6.554.2024.07.01.22.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 22:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOWWv-0007Yj-Rf; Tue, 02 Jul 2024 01:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOWWt-0007Vy-MD; Tue, 02 Jul 2024 01:58:15 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOWWs-0007jJ-4p; Tue, 02 Jul 2024 01:58:15 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WCsdv5P4Pz4x1y;
 Tue,  2 Jul 2024 15:58:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCsdr5XNSz4wnr;
 Tue,  2 Jul 2024 15:58:08 +1000 (AEST)
Message-ID: <4c8e406f-36c8-4b7f-8554-e6b95cc21f59@kaod.org>
Date: Tue, 2 Jul 2024 07:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Fix coverity issues for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20240625070741.2852946-1-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240625070741.2852946-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=fXIt=OC=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: k0vlrdpIXvo2

On 6/25/24 9:07 AM, Jamin Lin wrote:
> change from v1:
> aspeed/soc: coverity defect: DIVIDE_BY_ZERO
> aspeed/sdmc: coverity defect: Control flow issues (DEADCODE)
> 
> change from v2:
> add more commit log from reviewer suggestion, Cédric.
> 
> change from v3:
> replace qemu_log_mask with assert dram size 0.
> 
> Jamin Lin (2):
>    aspeed/soc: Fix possible divide by zero
>    aspeed/sdmc: Remove extra R_MAIN_STATUS case
> 
>   hw/arm/aspeed_ast27x0.c | 2 ++
>   hw/misc/aspeed_sdmc.c   | 1 -
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 



Applied to aspeed-next.

Thanks,

C.


