Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3376234njb;
        Tue, 9 Jul 2024 08:53:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSRNylfBO6j6zsl3prKUXMYEVc2jV/+k6IJYpNUM9yvKQ/NYwncHb9uYJ7vsncIOC6awYDQy8mO1C9a5yDU9Ge8l4Wdy2e
X-Google-Smtp-Source: AGHT+IHy7Or94CBuJXyvFIqKROrshQJtAfuPGjEbG8vmhazyZHvOwMAr1364T/nEGM7bEHktlaDW
X-Received: by 2002:a05:6102:c91:b0:48f:dfb3:f26a with SMTP id ada2fe7eead31-49032142f92mr3653720137.15.1720540386518;
        Tue, 09 Jul 2024 08:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720540386; cv=none;
        d=google.com; s=arc-20160816;
        b=LvZc5Swfh5Cxg/ObCMcYHeIVOdvr/8kHD1xRBzzWIcRIPXAhoRrFbmm4fEhOOJga27
         9TOz8stZpdu6mhYqPrGcv7iif/c/htGLTlY4/Bo9I1LUGLHLNJQO7epIelyibJK1nGkN
         unjcRfDYhtJEOMaitrOLbtAxMR9k8QMGZcPAI7RWrXUSlWr54vVEGZXQyvoN//Wi1uYl
         rwHV2hBStgrprRAVybJdo7jZOU/qL5JaOQESZGC6MEPpF9fANPNeZ5FfgjM88yvfKzKz
         pkXVSkum52QVMqa8wm6nP0IbLCHdlGu7cGSA+FOW/8oQijboh/dfIM89HaSmDE5MjYpl
         B6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=yZ52/FV4iKd6fZ3Tiy6t6RCz0FCBFH8GVabkDlZFmEA=;
        fh=pXQCCfdofZB5e4ZqzVRXiVuRGYeJnl2WhJnhDCL9qiQ=;
        b=suWfEiEge1gkuLhV8qjPDZ+sMCtZ0JcGkpPZ//LJwu3DKGI5K9c/fTMgL9YvpazPxb
         7k+QljdzV4vqjoeUDBdNacEAK62C4/88I8bxrQ1CxSX0A9Ef8q7nvq9FpU6XypH8SgC0
         aQe2msue0eEsw5xe7vJCyxu0jI/VA4oYn8dalS01LBYyY7zYB+3MCc04ilUV6LHXmJPD
         Fv2SJFLWTb0Hiz/iDhUGYVgjmD6nRKbjj3wIxA/iGxN2FeRysUQYZKn7HO2kJI1xFZDo
         YbnDngOyPlJswGrW8OBTazA+l3JTO3Zpl80xKuIod1/5jcuKdOGCD7hWOyxhSjsMmIGx
         rr2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9beeb08si23743161cf.625.2024.07.09.08.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRD9L-0004h5-AO; Tue, 09 Jul 2024 11:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org>)
 id 1sRD9K-0004ay-7O; Tue, 09 Jul 2024 11:53:02 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org>)
 id 1sRD9H-0003OX-Ms; Tue, 09 Jul 2024 11:53:01 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WJQVt6ykqz4wny;
 Wed, 10 Jul 2024 01:52:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJQVp3VPhz4w2M;
 Wed, 10 Jul 2024 01:52:50 +1000 (AEST)
Message-ID: <77788eda-ee5c-4db0-a890-034dc4995502@kaod.org>
Date: Tue, 9 Jul 2024 17:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Aspeed PATCH v47 18/19] hw/sd/sdcard: Add boot config support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
References: <20240709152556.52896-1-philmd@linaro.org>
 <20240709152556.52896-19-philmd@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240709152556.52896-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: j4JVxkT7v6eO

On 7/9/24 5:25 PM, Philippe Mathieu-Daudé wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> With this correctly set we can use the enable bit to detect if
> partition support is enabled.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Also squash?

where is the "boot-config" property gone ?


Thanks,

C.


> ---
>   hw/sd/sd.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 291497468f..6aa83251f7 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1047,6 +1047,12 @@ static uint32_t emmc_bootpart_offset(SDState *sd)
>   {
>       unsigned int access = sd->ext_csd[EXT_CSD_PART_CONFIG]
>                             & EXT_CSD_PART_CONFIG_ACC_MASK;
> +    unsigned int enable = sd->ext_csd[EXT_CSD_PART_CONFIG]
> +                          & EXT_CSD_PART_CONFIG_EN_MASK;
> +
> +    if (!enable) {
> +        return 0;
> +    }
>   
>       switch (access) {
>       case EXT_CSD_PART_CONFIG_ACC_DEFAULT:

