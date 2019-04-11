Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7561860wrx;
        Thu, 11 Apr 2019 12:35:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzsbSrCsotr4JrAiZUt8B82/LP94M7OW8OA/PRSCzICuyU56o3XFtxyp+eqGWr8QEwMTPW
X-Received: by 2002:adf:f488:: with SMTP id l8mr31344234wro.213.1555011341946;
        Thu, 11 Apr 2019 12:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555011341; cv=none;
        d=google.com; s=arc-20160816;
        b=ZDk70or1lM+ekESKs7fKrh/nPNPSd5INDNKwH1PAkmhQLSiuUFS0FYgvAAsa0M4sgP
         6sPl9lRSkr35ZY4AqWK/Vm7Rp3cgYU3NscKeOSOV80oJzn+rHXIEf1LsYxKNVsF1O9Cn
         kPZR2F2QX3btHKEKGO4+1QMkFFKPn3qoZ5wscnFnvyXBHFORxRPxxKAlutgfd1H0u2hD
         plJp5p5dq/+1F6dl2DOHvRZ+lq4kRlVGLh8yTBuVRvmjWZ0u1RHiNQMYHry/BupPeJhy
         WnpKotMvTfH8eJL8mFrlGctIIcd3io8zgTh6I/fCl9JxbG3bctGHnJmEZa48O3td1D8A
         zFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=t3BlcMv/ZNomptg3+umqCcNmydJHZLMd6LkzZTcnstM=;
        b=JxFG7hERXPV5H0iIZnVuUdsxMVz5iwy/c0b/Vf1WbyBHIVtXOmn0jRWxCP0KjKoBu9
         BBCemTKlBU4nD90vbeamcqleHPabVWTwCk1wbH1om34WjwMt80InKawIDmG9dvd9CMB0
         7D/qSK/aaFuj4utWJsgeXBEjROq6XXp65+KjFQP1PxEy5XvM7zN12VDl/FhUwRa/aGKN
         HbL394YqZHAjnOz2RyrCmj5qsxNobC2zcLPvzSOVOJzhZP2PiX1lr2YiNWmYvE+tHNY+
         9c+7fxd7g7JOnrewxBwkqkg4Yoidh3PkDMGSxAPyVfPiiJEqqE9cE4uEjdmyRimIhitb
         cHCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si25733181wrq.93.2019.04.11.12.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 12:35:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEfU5-0001w4-0Z
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 15:35:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hEfTu-0001vy-Lo
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 15:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hEfTt-0003eB-Ak
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 15:35:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49202)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1hEfTs-0003dc-VB; Thu, 11 Apr 2019 15:35:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A34BC309E9A7;
	Thu, 11 Apr 2019 19:35:27 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-126-53.rdu2.redhat.com
	[10.10.126.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0BB95D6A9;
	Thu, 11 Apr 2019 19:35:25 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190411135602.21725-1-armbru@redhat.com>
	<20190411135602.21725-2-armbru@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0eea5ddb-1efb-8fdf-4a37-9bc2daf86e2b@redhat.com>
Date: Thu, 11 Apr 2019 21:35:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190411135602.21725-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 11 Apr 2019 19:35:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] pflash_cfi01: New
 pflash_cfi01_legacy_drive()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j+vTejSUz/Ph

On 04/11/19 15:56, Markus Armbruster wrote:
> Factored out of pc_system_firmware_init() so the next commit can reuse
> it in hw/arm/virt.c.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/block/pflash_cfi01.c  | 30 ++++++++++++++++++++++++++++++
>  hw/i386/pc_sysfw.c       | 19 ++-----------------
>  include/hw/block/flash.h |  1 +
>  3 files changed, 33 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 16dfae14b8..eba01b1447 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -44,9 +44,12 @@
>  #include "qapi/error.h"
>  #include "qemu/timer.h"
>  #include "qemu/bitops.h"
> +#include "qemu/error-report.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/log.h"
> +#include "qemu/option.h"
>  #include "hw/sysbus.h"
> +#include "sysemu/blockdev.h"
>  #include "sysemu/sysemu.h"
>  #include "trace.h"
>  
> @@ -968,6 +971,33 @@ MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl)
>      return &fl->mem;
>  }
>  
> +/*
> + * Handle -drive if=pflash for machines that use machine properties.

(1) Can we improve readability with quotes? "-drive if=pflash"

> + * Map unit#i (0 < i <= @ndev) to @dev[i]'s property "drive".

(2) I think you meant (0 <= i < @ndev)

> + */
> +void pflash_cfi01_legacy_drive(PFlashCFI01 *dev[], int ndev)
> +{
> +    int i;

(3) For utter pedantry, "ndev"  and "i" should have type "size_t" (in
particular because we expect the caller to fill "ndev" with ARRAY_SIZE().

But, this would go beyond refactoring -- the original "int"s have served
us just fine, and we're usually counting up (exclusively) to the huge
number... two. :)

> +    DriveInfo *dinfo;
> +    Location loc;
> +
> +    for (i = 0; i < ndev; i++) {
> +        dinfo = drive_get(IF_PFLASH, 0, i);
> +        if (!dinfo) {
> +            continue;
> +        }
> +        loc_push_none(&loc);
> +        qemu_opts_loc_restore(dinfo->opts);
> +        if (dev[i]->blk) {

(4) Is this really identical to the code being removed? The above
controlling expression amounts to:

  pcms->flash[i]->blk

but the original boils down to

  pflash_cfi01_get_blk(pcms->flash[i])

Hmm... looking at pflash_cfi01_get_blk(), they are the same. Is there a
particular reason for not using the wrapper function any longer? As in:

  pflash_cfi01_get_blk(dev[i])

> +            error_report("clashes with -machine");
> +            exit(1);
> +        }
> +        qdev_prop_set_drive(DEVICE(dev[i]), "drive",
> +                            blk_by_legacy_dinfo(dinfo), &error_fatal);
> +        loc_pop(&loc);
> +    }
> +}
> +
>  static void postload_update_cb(void *opaque, int running, RunState state)
>  {
>      PFlashCFI01 *pfl = opaque;
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index c628540774..d58e47184c 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -269,32 +269,17 @@ void pc_system_firmware_init(PCMachineState *pcms,
>  {
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      int i;
> -    DriveInfo *pflash_drv;
>      BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
> -    Location loc;
>  
>      if (!pcmc->pci_enabled) {
>          old_pc_system_rom_init(rom_memory, true);
>          return;
>      }
>  
> -    /* Map legacy -drive if=pflash to machine properties */
> +    pflash_cfi01_legacy_drive(pcms->flash, ARRAY_SIZE(pcms->flash));
> +
>      for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
>          pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
> -        pflash_drv = drive_get(IF_PFLASH, 0, i);
> -        if (!pflash_drv) {
> -            continue;
> -        }
> -        loc_push_none(&loc);
> -        qemu_opts_loc_restore(pflash_drv->opts);
> -        if (pflash_blk[i]) {
> -            error_report("clashes with -machine");
> -            exit(1);
> -        }
> -        pflash_blk[i] = blk_by_legacy_dinfo(pflash_drv);
> -        qdev_prop_set_drive(DEVICE(pcms->flash[i]),
> -                            "drive", pflash_blk[i], &error_fatal);
> -        loc_pop(&loc);
>      }

(5) I think you deleted too much here. After this loop, post-patch, for
all "i", we'll have

  pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);

But pre-patch, for all "i" where the "continue" didn't fire, we'd end up
with:

  pflash_blk[i] = blk_by_legacy_dinfo(pflash_drv);

IOW the original loop both verifies and *collects*, for the gap check
that comes just below.

IIRC, this allows for mixing "-drive if=pflash,unit=N" with the machine
properties, as long as you have neither conflicts, nor gaps.

Post-patch however, this kind of mixing would break, because we'd report
gaps for the legacy ("-drive if=pflash") options.


In addition, it could break the "use ROM mode" branch below, which is
based on pflash_blk[0].

I think we should extend pflash_cfi01_legacy_drive() to populate
"pflash_blk[0..(ndev-1)]" on output (assuming pflash_blk is not NULL on
input).

(Because, I'm assuming that qdev_prop_set_drive() -- which now occurs in
the factored-out loop *before* the loop that we preserve here -- has no
effect on pflash_cfi01_get_blk(pcms->flash[i]).)

Thanks,
Laszlo

>  
>      /* Reject gaps */
> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
> index a0f488732a..f6a68c2a4c 100644
> --- a/include/hw/block/flash.h
> +++ b/include/hw/block/flash.h
> @@ -24,6 +24,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
>                                     int be);
>  BlockBackend *pflash_cfi01_get_blk(PFlashCFI01 *fl);
>  MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
> +void pflash_cfi01_legacy_drive(PFlashCFI01 *dev[], int ndev);
>  
>  /* pflash_cfi02.c */
>  
> 

