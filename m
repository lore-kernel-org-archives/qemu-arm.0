Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp740553lfm;
        Wed, 17 Jun 2020 09:03:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgduXvbtB7bdfVBQ6XplILe71trXI7wV9gi+yEM5qRcDnatEeWtv9U56xrt/TfNuxPwXT3
X-Received: by 2002:ab0:ea:: with SMTP id 97mr6891418uaj.105.1592409821896;
        Wed, 17 Jun 2020 09:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592409821; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8IVcmQXmupjZdLHqr6kXzxk+rFZkJDd4S67cI18ov3BYW1bUNZ+dACaPRKSDBghou
         rgWx7Ik9oHVHFJMzjhzg0oixhTtfluPOua4u5oEc55GZSD0rS3a5c9x+AvBGmleiz2Pk
         D8ujPGe5cq9x/0uZND/ukn9j5RbgraX33Jyg6hTygFp4d6Hlhidn0eMtNCFHKsfET98r
         ssbhJgpuU6mwii0jFL0d3cO9/c2ul9iZSJkZ65pHY3oUE93fWgTemG21AJJ8jH+Y5bt8
         I+nbU59CvbbKXTuakMMaHdiYxoZy9AQ6mG64G/UpfxmN9m1Mz04qm8bgBXnjQ4dsy6He
         GyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ZHdQmtJ7zszuZxelA6ruJD4ucWotQlaULIpp+RAE580=;
        b=w3HBCcvQz4+fwLRGPgJjcFhmkgoQdy1c/eLvtU+8PRW5VMGBMNDF73W7wiD0a8ktpF
         D375hl1oAh+Lv9pmJLTwDngOvn1JrnCKCWTtDF+epTmBDbOMT/RpfoZGOh3yoxuWl/MC
         Z6nRyEiHZy688bG/qVxPgCARZmy7PBGwdVx65T/fBr6czOXX6rMgpDSh4RzFit6sfumq
         n+LnB4H/WY3nPJTHQ1Uqe4vrT4yPCyC1ShBEy6SlyHu/hX2lYvGH+3MhcikV6KQwBdL/
         5O2MupeDfdJFSF50sPlcUtOBmM7aqd96+ogA3+VOl8DYtnnxgZp5A2GfjASji/tHKQBv
         JpFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n24si73171uaq.49.2020.06.17.09.03.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 09:03:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlaXN-0008PM-3M
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 12:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jlaVY-00077C-Bo
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 12:01:48 -0400
Received: from 20.mo6.mail-out.ovh.net ([178.32.124.17]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jlaVV-0007Hi-SL
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 12:01:48 -0400
Received: from player795.ha.ovh.net (unknown [10.108.42.170])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id EB97E21A9C3
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 18:01:42 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id C40EA1357EE11;
 Wed, 17 Jun 2020 16:01:35 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0034e7f565b-cbdf-4213-8b32-551d6ff33c67,ABECD89738EEB0C75E5395B338997A57DB3A3EEE)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 07/12] hw/arm: Load -bios image as a boot ROM for
 npcm7xx
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org,
 joel@jms.id.au
References: <20200611223016.259837-1-hskinnemoen@google.com>
 <20200611223016.259837-8-hskinnemoen@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <220ce5b8-ab7e-4ba5-3fb0-53855a474319@kaod.org>
Date: Wed, 17 Jun 2020 18:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611223016.259837-8-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4496281279479057321
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddgleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeiheejleefudegleegudduhfeuueevteefveekudeuvdelieeuvdefteeludegvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.124.17; envelope-from=clg@kaod.org;
 helo=20.mo6.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 12:01:43
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RLUr0sB7PvUA

On 6/12/20 12:30 AM, Havard Skinnemoen wrote:
> If a -bios option is specified on the command line, load the image into
> the internal ROM memory region, which contains the first instructions
> run by the CPU after reset.
> 
> A minimal Apache-2.0-licensed boot ROM can be found at
> 
> https://github.com/google/vbootrom

you might want to consider adding this rom to QEMU also.


> 
> It is by no means feature complete, but it is enough to launch the
> Nuvoton bootblock[1] from offset 0 in the flash, which in turn will
> launch u-boot and finally the Linux kernel.
> 
> [1] https://github.com/Nuvoton-Israel/bootblock
> 
> Change-Id: I41eae4fc7786d33f532c14087e930bf1b5012562
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  hw/arm/npcm7xx.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index a5dbf08c00..417bc16b5c 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -22,6 +22,7 @@
>  #include "hw/misc/unimp.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
> +#include "qemu-common.h"
>  #include "qemu/units.h"
>  #include "sysemu/sysemu.h"
>  
> @@ -270,6 +271,22 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>      }
>      memory_region_add_subregion(get_system_memory(), NPCM7XX_ROM_BA, &s->irom);
>  
> +    if (bios_name) {
> +        g_autofree char *filename = NULL;
> +        int ret;
> +
> +        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> +        if (!filename) {
> +            error_setg(errp, "Could not find ROM image '%s'", bios_name);
> +            return;
> +        }
> +        ret = load_image_mr(filename, &s->irom);
> +        if (ret < 0) {
> +            error_setg(errp, "Failed to load ROM image '%s'", filename);
> +            return;
> +        }
> +    }
> +

I think this belongs to the machine init routine and not the soc.



>      /* External DDR4 SDRAM */
>      memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA, s->dram);
>  }
> 

