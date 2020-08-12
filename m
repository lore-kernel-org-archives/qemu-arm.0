Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1149846lfy;
        Tue, 11 Aug 2020 23:42:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCmU448Sie7/Naryd8EvThAQ8QDFLrdAO4PfIUAJTVAq3VxZx5wYfIkI7KyjtGE6WFbhDb
X-Received: by 2002:a25:80d3:: with SMTP id c19mr51408832ybm.13.1597214560495;
        Tue, 11 Aug 2020 23:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597214560; cv=none;
        d=google.com; s=arc-20160816;
        b=VNPjeYR/ZIFqIiA5j39CDtYR4Hr3GphI8AhpBk8fqUn0rnEIXPG7e73k8w3u5LYAMy
         y6LL46QrmkOGW1WUecDVNMSuA5ZG+tXli1y/py503MZGkk06KG7JvhZbVwQAeylfToG+
         VjZFkuGhndq+Qpz9b6L8hqv+Rlve4bte8fPVeLO1raopdXHEw8UK7TbGC2wyalCeB3i4
         FV1sLJZRcM1AbGIOhc+qdhOGDkYphXsuKBbFUGn714oY9ojTUNGzfewmldNhScnAiIA1
         Q1BoIPXyGhYkjXwKDlR1pMRScdRyJcf18g1ltTfaCl+AJ8cVBPvBkhpC7DUhQCQYH0dt
         7alw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=d1cRieTP6JQCTZqmZEtS7CsB/ix2RgD9bCJdawNycWU=;
        b=zwG6aKlqKHsVU+FNpfURAlqQ1agtWqgKQlR/1d0UT/vjsZFUPUjETTn70Q07vxN4Hu
         C4EbDWqdlv7qM8JMNMVXRrw65yNu+wzrleSrGDd2EjJ5zYLSzFVBSkm9Cqopufmi6o/x
         owU9rXxGDppmVzKXWU7EMUx97GSb//aUBBD8+cB671fwa/j6YnYZvATZYxFHZ/kO6CAJ
         go6p/FZ1gvO2AV9B1rZsCq+/8v3eQAgM9jDLV6TC4O88bWj/Pb05ejvJijA//948yvSV
         W6xWtwUSMXv8J56gui2z62k4J9/s6UR37XEV33LSE1c+IJB2ETnggH2tCrKtuWhsB6VJ
         24+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30si1352078ybi.236.2020.08.11.23.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 23:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5kT9-0006R3-RO
	for alex.bennee@linaro.org; Wed, 12 Aug 2020 02:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k5kSm-0006Qu-LH; Wed, 12 Aug 2020 02:42:16 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:39495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k5kSk-0002Sd-J8; Wed, 12 Aug 2020 02:42:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1CDAA4FA6873;
 Wed, 12 Aug 2020 08:42:03 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 12 Aug
 2020 08:42:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0015b8a04de-afec-4df0-9db0-025b39c4e6d3,
 80543648EB1ACD187FE9A0A2CDDB60F737496A55) smtp.auth=clg@kaod.org
Subject: Re: [PATCH] arm: aspeed: add strap define `25HZ` of AST2500
To: Igor Kononenko <i.kononenko@yadro.com>
References: <20200811203502.20382-1-i.kononenko@yadro.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ec4502e4-942c-4e05-5f76-c300fbd39b63@kaod.org>
Date: Wed, 12 Aug 2020 08:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811203502.20382-1-i.kononenko@yadro.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 40e1f6a9-4958-48f8-a6f9-6bbb784699ee
X-Ovh-Tracer-Id: 10320561499784448806
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrledugdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepihdrkhhonhhonhgvnhhkoheshigrughrohdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 02:42:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CY92DXk4UK7Y

On 8/11/20 10:35 PM, Igor Kononenko wrote:
> Provide a definition for the "25Hz reference clock input mode" strap
> 
> Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  include/hw/misc/aspeed_scu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> index a6739bb846..9cd530afa2 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -286,6 +286,7 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
>  #define SCU_AST2500_HW_STRAP_ESPI_FLASH_ENABLE     (0x1 << 26)
>  #define SCU_AST2500_HW_STRAP_ESPI_ENABLE           (0x1 << 25)
>  #define SCU_AST2500_HW_STRAP_DDR4_ENABLE           (0x1 << 24)
> +#define SCU_AST2500_HW_STRAP_25HZ_CLOCK_MODE       (0x1 << 23)
>  
>  #define SCU_AST2500_HW_STRAP_ACPI_ENABLE           (0x1 << 19)
>  #define SCU_AST2500_HW_STRAP_USBCKI_FREQ           (0x1 << 18)
> 

