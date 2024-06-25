Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp602980njc;
        Tue, 25 Jun 2024 00:22:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4Ca0munhFTB8I6vEDOPN3ujvTd0+RaqtyytgncEmNN9rZcebZ5t+5gtDpPguYekfwV6lP5eFlj4+ufiYF1emV1/tZBTU/
X-Google-Smtp-Source: AGHT+IEieD9TfuK3v8A0mVHK5uDqT37nbAU6WFotng942YtEDAvqSinooPwt+R10kKCvZ3nP6yME
X-Received: by 2002:a05:622a:8e:b0:441:f8:4dea with SMTP id d75a77b69052e-444d399c654mr94802321cf.34.1719300166727;
        Tue, 25 Jun 2024 00:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719300166; cv=none;
        d=google.com; s=arc-20160816;
        b=d8Vf5rpHWgjqz/t+GRnlMDsMaFyUt7/1m1f/WTNC/eaSz1i+iGMNohgBSfNRK2Utij
         qe+f/Vo1S9Oe2pTXV6QawV3j9vMprxgYj3aU6sgOBr4eIkoGa6tmS1TALTqGww+95iTW
         3RqmF0I2lWbORyrVKy6XXwYqzUP5IGviJcC0oMYFLTbsZ1FkNLMA6eR96w2BfPUd1KoG
         1qq6jLdzaooYwca1nMGAI3sWByA5vC8tay7tijO4sGCWd4QrdqiKqjZ+KfxevfkZPcoz
         xZQADfpA7gm9ugE1IHsZsan48TjlvvzzYxwZ3MjRW+wQFv8at6zDZbWq7PQ0EtYrjSlC
         trGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id;
        bh=Eq64isnWUl2PH0rBgFESCB99+17dd3EQTgCH4wD8kCM=;
        fh=ExalYl5cSGhcrnZqOaWDDvlr2o9+JLOTuXQhdEtSK3g=;
        b=e/Ad7/Bt2K2QaqnROaWhqoLJiqawYbvkIPEvpv3h0HvMO0GGDep4cLpFGPTYbjzWWI
         jtJs6NM8JnF/SNZtkbRp1XjGfGSW+lfrejWfiOlhKoV6nuDlh54saYH8/9v/IWJaIfC3
         B13TtLtHgVRcAfnLjOnK0/+opNk6A5fSIllmQfRY8dMLoYS2NhKYUsdTHGd13yyfxNrY
         MESXMKsc6JagoAmg5e5gMCzt3MEw20E7CMhp48HXMJFohlLgs4Wswg7AhA0e/Mygj3UM
         4wWcZ5bQ0VnIh9no4m/Uz9ztWtesNcs/TuvMFNhTmPGcolzqNVZMDueeYOWJYkU77A33
         sx2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444cb7ff1efsi86684011cf.387.2024.06.25.00.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 00:22:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM0Vk-00081T-RR; Tue, 25 Jun 2024 03:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=+2S4=N3=kaod.org=clg@ozlabs.org>)
 id 1sM0Vk-00080V-15; Tue, 25 Jun 2024 03:22:40 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=+2S4=N3=kaod.org=clg@ozlabs.org>)
 id 1sM0Vh-0001U9-KH; Tue, 25 Jun 2024 03:22:39 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4W7brR5RTnz4wx6;
 Tue, 25 Jun 2024 17:22:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W7brN5k2Dz4wcJ;
 Tue, 25 Jun 2024 17:22:28 +1000 (AEST)
Message-ID: <5bf32b3a-fe8f-4ec6-8133-4851d28eb90f@kaod.org>
Date: Tue, 25 Jun 2024 09:22:23 +0200
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
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=+2S4=N3=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: zO1qv4zx2CUF

Hello Jamin

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

LGTM.

Could you please review :

https://lore.kernel.org/qemu-devel/20240625065839.485034-1-clg@redhat.com/T/#u

Thanks,

C.


