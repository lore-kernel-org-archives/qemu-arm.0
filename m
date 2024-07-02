Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1999887njm;
        Tue, 2 Jul 2024 07:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYrSId6MOPPx/MPFdlLy+o35fXYP5IBhCjbskT2QT+qTFstDsKpxZzkCTKYH/eSZBmoteT304RtPEanidd0WuraDC1gs2O
X-Google-Smtp-Source: AGHT+IHM09Fg4FwCr1xFp9HOdQhpK7hgLTceenGtkrFfdKQEBye7yklL9E2aB7ssM+z5/rOJjW87
X-Received: by 2002:a17:906:416:b0:a74:914b:ffb2 with SMTP id a640c23a62f3a-a75144de2b9mr634878266b.72.1719930514306;
        Tue, 02 Jul 2024 07:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719930514; cv=none;
        d=google.com; s=arc-20160816;
        b=fAGq3THGXjI9J6eVVTA+dHmWyguvTzmy3aTp551M558r5ADbpDnZmIOnQ3V6Z7b76D
         FrlAHer5H/n/CLP3Buc5VRJtr2GjwfZJdjI5lSG69qAJICRE/K4roiU9cHEaDQg3lSQi
         Daom0xlRCSBh3z6CCun6I0TkQbCQoTdmjjhYOVdt4jIYWcnxY1GgGD+yr6iLGmnfCcyd
         BDRFABWna4aP/9DQry8x64L0y1uFVI/y8FY0P1mcOQIdKZtq02pkgJUIjSFjviFpPe8k
         jrzrwQWgBF0z648rp+zebiEAotXtWlAATQOAVei/UCBSFH4rq8oqoWAqEGkiWmmpHl/w
         pXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=AvpiGZvEEhCaQytYBnVT+ee14Y5b+NCbmnANXs2Q+m8=;
        fh=BTnPzZJ1+AYidJxTInyBBzHVTksBxUqubakG/q1+YVE=;
        b=cqwdoi+OF6v3SArV8sIoDDhXqSDTxNsBQ2H8t8C2QCfTf5Owa7FuZEwTifu0n1Ha2u
         iNodaua9YgY70RcAySnYF7c9ZiIpYviZxBrKkCeKfLhFEHT4xIb9dLcXmR4TwJ7GH+CL
         agM277tp9F7MRk8FPD4esjkjwe1CVNqUd+GattS+7QZOHQ7XPAUuWUrQbEdkxKW8CSq4
         NLdaWAl/voWAOyRX02Ti/hsCpyR5jG8LLEnQeD/cURxHBpMZH0XTA6R4luadpuABODUi
         /TiMg2L0DnrQ4+g180n6GW6p5PAMZoFlkq2IknVWE+17NxtnDhzXpB38XZrPLWfsOsfN
         qmwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a640c23a62f3a-a72ab095ebfsi479008266b.795.2024.07.02.07.28.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 07:28:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sOeUi-00010E-0I; Tue, 02 Jul 2024 10:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOeUY-0000bb-1z; Tue, 02 Jul 2024 10:28:22 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOeUU-0003wz-SZ; Tue, 02 Jul 2024 10:28:21 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WD4yP44Mhz4wcS;
 Wed,  3 Jul 2024 00:28:13 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WD4yG2s2Sz4x0C;
 Wed,  3 Jul 2024 00:28:06 +1000 (AEST)
Message-ID: <91ced502-aaa0-4c64-9ed4-4ea7b3257f0a@kaod.org>
Date: Tue, 2 Jul 2024 16:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tests/qtest/npcm7xx_sdhci: Access the card using its
 published address
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, Thomas Huth <thuth@redhat.com>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Laurent Vivier <lvivier@redhat.com>, Luc Michel <luc.michel@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Patrick Venture <venture@google.com>
References: <20240702140842.54242-1-philmd@linaro.org>
 <20240702140842.54242-4-philmd@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240702140842.54242-4-philmd@linaro.org>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 75cMFt0eQpau

On 7/2/24 4:08 PM, Philippe Mathieu-Daudé wrote:
> Currently setup_sd_card() asks the card its address,
> but discard the response and use hardcoded 0x4567.
> 
> Set the SDHC_CMD_RESPONSE bit to have the controller
> record the bus response, and read the response from
> the RSPREG0 register. Then we can select the card with
> its real address.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Cc: Hao Wu <wuhaotsh@google.com>
> Cc: Chris Rauer <crauer@google.com>
> Cc: Shengtan Mao <stmao@google.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
> ---
>   tests/qtest/libqos/sdhci-cmd.h   | 2 ++
>   tests/qtest/npcm7xx_sdhci-test.c | 8 ++++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)


Tested-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> 
> diff --git a/tests/qtest/libqos/sdhci-cmd.h b/tests/qtest/libqos/sdhci-cmd.h
> index 9e61dd4944..90efa028ef 100644
> --- a/tests/qtest/libqos/sdhci-cmd.h
> +++ b/tests/qtest/libqos/sdhci-cmd.h
> @@ -22,6 +22,7 @@
>   #define SDHC_ARGUMENT 0x08
>   #define SDHC_TRNMOD 0x0C
>   #define SDHC_CMDREG 0x0E
> +#define SDHC_RSPREG0 0x10
>   #define SDHC_BDATA 0x20
>   #define SDHC_PRNSTS 0x24
>   #define SDHC_BLKGAP 0x2A
> @@ -38,6 +39,7 @@
>   #define SDHC_TRNS_MULTI 0x0020
>   
>   /* CMD Reg */
> +#define SDHC_CMD_RESPONSE (3 << 0)
>   #define SDHC_CMD_DATA_PRESENT (1 << 5)
>   #define SDHC_ALL_SEND_CID (2 << 8)
>   #define SDHC_SEND_RELATIVE_ADDR (3 << 8)
> diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
> index 5d68540e52..01f237a816 100644
> --- a/tests/qtest/npcm7xx_sdhci-test.c
> +++ b/tests/qtest/npcm7xx_sdhci-test.c
> @@ -30,6 +30,8 @@ char *sd_path;
>   
>   static QTestState *setup_sd_card(void)
>   {
> +    uint16_t rca;
> +
>       QTestState *qts = qtest_initf(
>           "-machine kudo-bmc "
>           "-device sd-card,drive=drive0 "
> @@ -43,8 +45,10 @@ static QTestState *setup_sd_card(void)
>       sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_APP_CMD);
>       sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x41200000, 0, (41 << 8));
>       sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_ALL_SEND_CID);
> -    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_SEND_RELATIVE_ADDR);
> -    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_SEND_RELATIVE_ADDR
> +                                                    | SDHC_CMD_RESPONSE);
> +    rca = qtest_readl(qts, NPCM7XX_MMC_BA + SDHC_RSPREG0) >> 16;
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, rca << 16, 0,
>                      SDHC_SELECT_DESELECT_CARD);
>   
>       return qts;

