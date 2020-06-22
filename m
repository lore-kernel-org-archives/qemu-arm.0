Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2902422lfm;
        Sun, 21 Jun 2020 23:28:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY0/966Px8s5T/Clm2ynHo7c5w3uO1XJ4waq3MiwiNcr4aehDRR/jKkl17y5DQlIMPvW0x
X-Received: by 2002:a25:d40b:: with SMTP id m11mr24708540ybf.66.1592807289111;
        Sun, 21 Jun 2020 23:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592807289; cv=none;
        d=google.com; s=arc-20160816;
        b=0Biqgn7wwQQ9gO0crbqB3bsUDf+nOfP328w8NYqIq47UHMbGbt9tav127DkXuB/lqn
         oWFe2+xi/pY2xuLACTnIoQDoMyQe7xrNRGHg56zb2lrv8iZSsVkVTp+I0pra4j0XVTuX
         lIo70GIyVEd0PAcP94grKL70Em64PZ91GL/aECsRoXdEYOkW89seYPvSPTXSAbiE6Cuz
         kUoSYQWQUn3NmyRY3dQI4P+3ijmMBWOWFUkphYxLLljsgWBhvS826PE1d/D2LDv1/I1E
         9/FMcX1yeauGQI68h/kozHGAJHZdrANTPippYYvmjAP8OzAnVFSSCIBKCljTDygtZlbL
         KHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=kdk1rNC1MU1mshnnQOiy+82ENchn50CNROewcv15tcQ=;
        b=K9nRF7Ke8+oRBPCvrbRYpZBioTtuSGeeKfj7BOWpr95dzO+a5TbTSnGZ/PbpSr3mr4
         QrIhGXMG8lkyqWKDHxkaahR4J6rifvEm//rBp1xomqyFeeNbAWdisqc9NVv8JGViD1kl
         slw0NsPoMxrrYElLUKtCK7c1LBEz7chJ72Mc4jMn/vGkW+gCZBSZaQWzhaee9g9GnMRA
         ciEYz2mH1Xe2WBJkohzow3KfUIQCszIz2MbMt8x28t7WfPEFbt3yMqEv+wcei/6gzc2c
         N65i1zD+GgvRb1jwYNQRERBUCOOSFYzTafBSVsfFdYeUQIXIrVwLd4ZcAVbdHg1oDIlF
         zTQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si10417150yba.455.2020.06.21.23.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 23:28:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnFw8-0003ba-DL
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 02:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnFvv-0003XQ-Ts
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 02:27:56 -0400
Received: from 2.mo68.mail-out.ovh.net ([46.105.52.162]:44134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnFvu-0006vG-6m
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 02:27:55 -0400
Received: from player696.ha.ovh.net (unknown [10.110.103.211])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 8774417105A
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2020 08:27:51 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player696.ha.ovh.net (Postfix) with ESMTPSA id 7DE9913A2E259;
 Mon, 22 Jun 2020 06:27:43 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002ab1d371d-71c8-47d3-a75f-67aaef477a88,D5B34DF2F1998B4AFDB97B5973F1BB92C24DD330)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v4 2/8] hw/misc/pca9552: Replace magic value by
 PCA9552_PIN_COUNT definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620225854.31160-1-f4bug@amsat.org>
 <20200620225854.31160-3-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <75a63e42-a889-aaab-7898-1af484e05a2f@kaod.org>
Date: Mon, 22 Jun 2020 08:27:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620225854.31160-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5721541851663272875
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekuddguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekiedrvddutddrudehvddrvdegheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.52.162; envelope-from=clg@kaod.org;
 helo=2.mo68.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:27:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Qu2yA67PglU

On 6/21/20 12:58 AM, Philippe Mathieu-Daudé wrote:
> Replace the '16' magic value by the PCA9552_PIN_COUNT definition.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/pca9552.h | 1 +
>  hw/misc/pca9552.c         | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
> index ebb43c63fe..ef6da4988f 100644
> --- a/include/hw/misc/pca9552.h
> +++ b/include/hw/misc/pca9552.h
> @@ -15,6 +15,7 @@
>  #define PCA9552(obj) OBJECT_CHECK(PCA9552State, (obj), TYPE_PCA9552)
>  
>  #define PCA9552_NR_REGS 10
> +#define PCA9552_PIN_COUNT 16
>  
>  typedef struct PCA9552State {
>      /*< private >*/
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index cac729e35a..cfefb8fce8 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -291,7 +291,7 @@ static void pca9552_initfn(Object *obj)
>       * PCA955X device
>       */
>      s->max_reg = PCA9552_LS3;
> -    s->nr_leds = 16;
> +    s->nr_leds = PCA9552_PIN_COUNT;
>  
>      for (led = 0; led < s->nr_leds; led++) {
>          char *name;
> 

