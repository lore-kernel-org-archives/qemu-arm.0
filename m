Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp93420nji;
        Thu, 11 Jul 2024 04:04:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzSqNXQz6KDE1vmp8diws5IoI4B6UeTTlrdPzRtpo5F0HFw/VP3s9BPBrT241jViVfDTkTEqVTX7XGunMyy9v4aiFkkL/T
X-Google-Smtp-Source: AGHT+IFBX5KqEJF2oDkb8AtD4ZCaPR1QKELFdZkFSNLqnzAsJreicHzYcDnN6UudRi/lm7+H7/+g
X-Received: by 2002:a05:6102:3ed4:b0:48f:90f8:efda with SMTP id ada2fe7eead31-490322ac342mr10278938137.32.1720695870680;
        Thu, 11 Jul 2024 04:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720695870; cv=none;
        d=google.com; s=arc-20160816;
        b=qAGm2UeXTbqV091kucA4eOPA6sPgaOh1HO6ckWE6V4hb3yJ9p+pP7gGlLxDbkUCFg9
         dTfUMQsVGA33faKpOndDPA11yExWcMjO//8b1gnlGxq/JSdLJvkjRWzXQGhCfqRawGzh
         gfED0qy6Pe2eNG4/7v9wsmZCUe54HCigINBDdeyFskoiIDJ0AE48oQJyYuA15mp8jt7i
         bEuz+3Itta+oaEwzMUx5jfXKLtxsfp3ttq4wzDnnp1FvpttUkNwKmGsc7og5SLTcIvxu
         Creaqnm7cRJenUcA8UHVRljd91P+2GkGIXk92+g7Jrh7xrCSLdf5HlObwkWoCCOneSXJ
         N31A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=LjOKBhj4HpgEu0LWvzJYuITT32GK0qcYTSa9vDO4Kg0=;
        fh=Y/vtxBUwx74sGQALfFIc0ra2Z4KKrqmp+Wm8rbOkX40=;
        b=DOgiaOLAUqFD+oJOlT9ZUrNpZRbfWn/OteZbX/9C8oh0OoU2P+Pz6gnr0hofaKTEcE
         kgXxxEfBa3PogN3Fyex4xvvq0I5g8BzuhfHt9WxN+iYvRxgn8x3vXNYlQJxetISYZOAG
         hdqLjMMlD0lt+2faFcEqEQ9mYn+HEUvFhGz6P2B3llRhCH8sUsF4wiGA1OT8ctyWpu6l
         FByJ+pr7S2fGOaM3VSfzQ7JHRRiNRG6i7u2zTYnBDPrS1Q9Z5d5UZkaMO+trho5MLC2/
         tzMTCSKH1i/qq4a/89QreNq45R/pft33YDsJxVY6qrgNUqw2nU+394RhW4mE9jpQE9Eh
         wtjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-490317182ecsi915167137.386.2024.07.11.04.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 04:04:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRrb2-0005cO-0a; Thu, 11 Jul 2024 07:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SBUb=OL=kaod.org=clg@ozlabs.org>)
 id 1sRrb0-0005aV-5I; Thu, 11 Jul 2024 07:04:18 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SBUb=OL=kaod.org=clg@ozlabs.org>)
 id 1sRray-0002eH-12; Thu, 11 Jul 2024 07:04:17 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WKX0h5JWtz4wx5;
 Thu, 11 Jul 2024 21:04:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKX0X3jXrz4wcl;
 Thu, 11 Jul 2024 21:03:56 +1000 (AEST)
Message-ID: <53939fdf-4361-47b1-a6a5-edd52ebf2100@kaod.org>
Date: Thu, 11 Jul 2024 13:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v48 00/12] hw/sd/sdcard: Add eMMC support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Luc Michel <luc.michel@amd.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
References: <20240710141408.69275-1-philmd@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240710141408.69275-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=SBUb=OL=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: 22WkltqCclh5

Hello,

On 7/10/24 4:13 PM, Philippe Mathieu-Daudé wrote:
> Tag to test Aspeed tree:
>    https://gitlab.com/philmd/qemu/-/tags/aspeed_emmc-v8

I gave this branch a try and the rainier machine boots correctly with
a baked emmc image :

   Tested-by: Cédric Le Goater <clg@redhat.com>

However, I am seeing a *lot* of printf messages :

   sd_blk_read: read error on host side
   sd_blk_write: write error on host side

which were introduced by the initial implementation a1bb27b1e98a. This
doesn't occur with my tree though.

Thanks,

C.





> 
> Since v43:
> - Reordered and squashed commits (Cédric)
> 
> Since v42:
> - Stick to spec v4.3 (re-simplified EXT_CSD register & migrate)
> - Fill CID register
> - Few changes to CSD register
> - Implement 'boot-mode' reset timing
> - Add 'boot-size' property
> 
> Cédric Le Goater (2):
>    hw/sd/sdcard: Add emmc_cmd_SET_RELATIVE_ADDR handler (CMD3)
>    hw/sd/sdcard: Fix SET_BLOCK_COUNT command argument on eMMC (CMD23)
> 
> Joel Stanley (1):
>    hw/sd/sdcard: Support boot area in emmc image
> 
> Luc Michel (1):
>    hw/sd/sdcard: Implement eMMC sleep state (CMD5)
> 
> Philippe Mathieu-Daudé (6):
>    hw/sd/sdcard: Basis for eMMC support
>    hw/sd/sdcard: Register generic command handlers
>    hw/sd/sdcard: Register unimplemented command handlers
>    hw/sd/sdcard: Add mmc_cmd_PROGRAM_CID handler (CMD26)
>    hw/sd/sdcard: Add eMMC 'boot-size' property
>    hw/sd/sdcard: Implement eMMC 'boot-mode'
> 
> Sai Pavan Boddu (1):
>    hw/sd/sdcard: Add mmc SWITCH function support (CMD6)
> 
> Vincent Palatin (1):
>    hw/sd/sdcard: Add emmc_cmd_SEND_EXT_CSD handler (CMD8)
> 
>   include/hw/sd/sd.h |   3 +
>   hw/sd/sd.c         | 418 ++++++++++++++++++++++++++++++++++++++++++++-
>   hw/sd/trace-events |   3 +
>   3 files changed, 418 insertions(+), 6 deletions(-)
> 

