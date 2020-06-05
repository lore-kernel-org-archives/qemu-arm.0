Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2778591lfc;
        Fri, 5 Jun 2020 13:12:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp3rIFbwPCA96JI1zWboPTvPK29BNmbVFM1MX1l7By1Wttq9Gt5iU5M1/8Hv+0Fz0Uw05q
X-Received: by 2002:a25:e08d:: with SMTP id x135mr17629240ybg.482.1591387960066;
        Fri, 05 Jun 2020 13:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591387960; cv=none;
        d=google.com; s=arc-20160816;
        b=LfMptzFJlSeWm541CaGRcn2YDNJCnAYze+fl78y7l8rM8D389mD9swDvzwZ5hQIpHD
         0CaRMANN0WXQCcUOud4WeZgSgfKwVIL7A2wfMhtzqT+cFWmrAB+BkvrlMLWPccg4JS73
         Qg1/Pn+ONMKmNoP7OG6cbZLJaSs/jHWb0uEeA9NjCDEfHFMWDXlHZlExEs+WAQ5nvpLP
         du/ZLRM2YCbC1Zp3XxtVG8y0w7+mavzDxgBjW+PRLoTAiR+KJJhnE6zaXY4MMDmqNERW
         Vjj3Dt5xtCIwwItXtG80m025jo0sGSLxB0zAYLFWT/bWEJz5L6Qgl8Kbeq2//COjMC/P
         HIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=XmtOhpOgnL0nwhQqvcYtbNkUJZrS6YKQdXTB5bSqdNo=;
        b=LC4izScfYDQ6Y3w7o7ufGLTY3qaLj4Mmed3xZIJrO+LVRjfNJsi625FKePdTeVeoyU
         R+ErtapZsFnUbP68hHgkf8eckLmrTz22wOna9TCrimMgEPS6+xb9VxPGZEtVLmzV4pxu
         GeTsJOS5zMqSguj2vXaDrucWDgRd6lKEIK5XJ85sWmL7QECT2EPlE2S0wLvXL0Bdt+Lf
         DL7B8zdLKRFvP0BoB7gfwAvw7etJn6ToRjUURMF9mdKAUS/niqbxyfFqUL5/36bSZA3I
         UzBscWvSEN8bLNrrtnwyTk7WDYLX15S+tQ1H4DULk8EsnplzX3D6nXaJ0tzE77yV1qZY
         4fgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 64si7159710ybo.449.2020.06.05.13.12.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 13:12:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhIhj-0003TN-91
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 16:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jhIhY-0003P7-OQ
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 16:12:29 -0400
Received: from 7.mo179.mail-out.ovh.net ([46.105.61.94]:51150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jhIhX-0005v2-Ng
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 16:12:28 -0400
Received: from player688.ha.ovh.net (unknown [10.108.35.215])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6E9D916E56F
 for <qemu-arm@nongnu.org>; Fri,  5 Jun 2020 22:12:17 +0200 (CEST)
Received: from kaod.org (bad36-1-78-202-132-1.fbx.proxad.net [78.202.132.1])
 (Authenticated sender: clg@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id A0BDC130157A9;
 Fri,  5 Jun 2020 20:12:02 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00648040606-35e1-4371-882b-ec72eb3390a0,
 1A305A7A7885A757DE1AF1E97A61382E17797CC9) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 14/16] arm/aspeed: Drop aspeed_board_init_flashes()
 parameter @errp
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200605145625.2920920-1-armbru@redhat.com>
 <20200605145625.2920920-15-armbru@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <423129ae-8624-1fcf-a039-7209ee644a8b@kaod.org>
Date: Fri, 5 Jun 2020 22:11:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200605145625.2920920-15-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12042906880948014000
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudegfedgudeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdejkedrvddtvddrudefvddrudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheikeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.61.94; envelope-from=clg@kaod.org;
 helo=7.mo179.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 16:12:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001, URIBL_SBL=1.623, URIBL_SBL_A=0.1 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, mreitz@redhat.com, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: //Efemjnjl4p

On 6/5/20 4:56 PM, Markus Armbruster wrote:
> We always pass &error_abort.  Drop the parameter, use &error_abort
> directly.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/arm/aspeed.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 5ffaf86b86..4ce6ca0ef5 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -215,8 +215,8 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
>      g_free(storage);
>  }
>  
> -static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> -                                      Error **errp)
> +static void aspeed_board_init_flashes(AspeedSMCState *s,
> +                                      const char *flashtype)
>  {
>      int i ;
>  
> @@ -227,8 +227,8 @@ static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>  
>          fl->flash = qdev_new(flashtype);
>          if (dinfo) {
> -            qdev_prop_set_drive_err(fl->flash, "drive",
> -                                    blk_by_legacy_dinfo(dinfo), errp);
> +            qdev_prop_set_drive(fl->flash, "drive",
> +                                blk_by_legacy_dinfo(dinfo));
>          }
>          qdev_realize_and_unref(fl->flash, BUS(s->spi), &error_fatal);
>  
> @@ -314,8 +314,8 @@ static void aspeed_machine_init(MachineState *machine)
>                            "max_ram", max_ram_size  - ram_size);
>      memory_region_add_subregion(&bmc->ram_container, ram_size, &bmc->max_ram);
>  
> -    aspeed_board_init_flashes(&bmc->soc.fmc, amc->fmc_model, &error_abort);
> -    aspeed_board_init_flashes(&bmc->soc.spi[0], amc->spi_model, &error_abort);
> +    aspeed_board_init_flashes(&bmc->soc.fmc, amc->fmc_model);
> +    aspeed_board_init_flashes(&bmc->soc.spi[0], amc->spi_model);
>  
>      /* Install first FMC flash content as a boot rom. */
>      if (drive0) {
> 

