Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4205255wrx;
        Tue, 16 Apr 2019 10:44:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1ikAkQKKFov/O1vDjEgCYVYJw4KPCwvLqpm3UgKqlGnXNOu2m/Li131tvTgEhAqDX1ej6
X-Received: by 2002:a05:6000:1250:: with SMTP id j16mr52934489wrx.135.1555436698817;
        Tue, 16 Apr 2019 10:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555436698; cv=none;
        d=google.com; s=arc-20160816;
        b=qhj05UjdPcJoEgsIyzm7mhGaBKoJ049VcNx5GoJHL+20/jiJnat+fhI0ZSWU2T3Tji
         /jqKI5QvDbhYggFurwL6+SQqO+AmMe9Ajdvgi4DXXPIqRPg7Q15hAP70gKcvwGx1+Dgy
         WNhb+Q1gOCg1RieU9MDd4FP1fnZ4ROXybjkH856XrY11/4STSforxuiDr3SnThSwsDIp
         OGLvcH0d3QBafacfMOVWxwa1t5YK8rvK/W6CAdh5PBcUC0qGFpD4YiQzh7sb5UMYnUPF
         DEh4SfTNR5N5zboF6rRvNSxdrE8OKXVWzOmZpIBR8zWp8qCWLL8IgbdGU0o78xL+HCpa
         CWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Bq00CJtLI8I61lu1wtwWM736TU2yvwe2CldKn7p8VMo=;
        b=0FcWSSr0JDFsTd3dijP+81EhxBzBZC+6BKcEb0dPzDJH50jXo53NfSBmWQYl0Sk7lZ
         4X3dvYT7GlRggmlG8Tj7FhHzkIMKiUw0yxJUsjdwgfF7kv+gnfR1afhX0Tk0HgcxNTBS
         FHFFun8SgK2PP8byqLqSt1LVHmzn60XiBUetACWb+0f6KKHZJSB4dmmE43cZ+Z8+qkkK
         BgUbHO7n+WEMIMBQ8eo1ZVv7+A2p2i3QBpd281AnyaAFmE3SQsurpj372/4PePl+pVmq
         oFZuXVpYotl17kBj2BwyLUV74XKtUYAFOYOsb+KVoK5DBu5FgDSd1IyErNa3BCnURdwC
         onIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si35693346wrv.275.2019.04.16.10.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 10:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGS8f-00018Z-Oj
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 13:44:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hGS8R-00017B-QQ
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 13:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hGS8P-0000IF-QT
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 13:44:43 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35351)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hGS8P-0000HU-GV
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 13:44:41 -0400
Received: by mail-wm1-f65.google.com with SMTP id y197so106096wmd.0
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 10:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Bq00CJtLI8I61lu1wtwWM736TU2yvwe2CldKn7p8VMo=;
	b=I0TTN20Apvfq8WtCZVM9b82U9FA3HskvyLOgp6ePAimMYMglSSfnTZIuBw6BhvfWI0
	um+7U8lk3Ivkx5NSkpTTwNRjV5rLypbSgow2a05bZDpalFNlAPai0CMFX1GhIT4XKE1S
	hHtL3ESblYmwEQW1merkvj5Irb7njMFoSpRvzqdueE1ziPqu7r9HL3iR4LCQfyhViet7
	2uju/h5Wd312+w9qibwLA4uV6kE2ysQFr9FOFpCbawWDgit7LeJNRDRGYX2dIbyvT+OC
	TTh/3NKGVb2DqglLSlBXtbhKCEjalCmSympyoXJjuwyzFcOM2uIFx1P5iOsdJFrLFwIy
	k9Ew==
X-Gm-Message-State: APjAAAWEaiLqeb3BPegprchoySgISbnJRzmbYsxil8mQg4NEl2qMzkwH
	RsvEDR1C9JPMZ+NCO0OAfdyQpA==
X-Received: by 2002:a1c:988d:: with SMTP id a135mr29669360wme.24.1555436680159;
	Tue, 16 Apr 2019 10:44:40 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	y5sm43184858wrw.23.2019.04.16.10.44.38
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 10:44:39 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190416091348.26075-1-armbru@redhat.com>
	<20190416091348.26075-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <03ecf4b0-c665-9677-b166-4d68f50cd70b@redhat.com>
Date: Tue, 16 Apr 2019 19:44:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416091348.26075-3-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [PATCH v2 2/3] pflash_cfi01: New
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
	mreitz@redhat.com, qemu-arm@nongnu.org, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E3Cogtr0bQes

On 4/16/19 11:13 AM, Markus Armbruster wrote:
> Factored out of pc_system_firmware_init() so the next commit can reuse
> it in hw/arm/virt.c.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/block/pflash_cfi01.c  | 28 ++++++++++++++++++++++++++++
>  hw/i386/pc_sysfw.c       | 16 ++--------------
>  include/hw/block/flash.h |  1 +
>  3 files changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 16dfae14b8..333b736277 100644
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
> @@ -968,6 +971,31 @@ MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl)
>      return &fl->mem;
>  }
>  
> +/*
> + * Handle -drive if=pflash for machines that use properties.
> + * If @dinfo is null, do nothing.
> + * Else if @fl's property "drive" is already set, fatal error.
> + * Else set it to the BlockBackend with @dinfo.
> + */
> +void pflash_cfi01_legacy_drive(PFlashCFI01 *fl, DriveInfo *dinfo)
> +{
> +    Location loc;
> +
> +    if (!dinfo) {
> +        return;
> +    }
> +
> +    loc_push_none(&loc);
> +    qemu_opts_loc_restore(dinfo->opts);
> +    if (fl->blk) {
> +        error_report("clashes with -machine");
> +        exit(1);
> +    }
> +    qdev_prop_set_drive(DEVICE(fl), "drive",
> +                        blk_by_legacy_dinfo(dinfo), &error_fatal);
> +    loc_pop(&loc);
> +}
> +
>  static void postload_update_cb(void *opaque, int running, RunState state)
>  {
>      PFlashCFI01 *pfl = opaque;
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index 75925f5d3f..751fcafa12 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -269,9 +269,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
>  {
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      int i;
> -    DriveInfo *pflash_drv;
>      BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
> -    Location loc;
>  
>      if (!pcmc->pci_enabled) {
>          old_pc_system_rom_init(rom_memory, true);
> @@ -280,18 +278,8 @@ void pc_system_firmware_init(PCMachineState *pcms,
>  
>      /* Map legacy -drive if=pflash to machine properties */
>      for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
> -        pflash_drv = drive_get(IF_PFLASH, 0, i);
> -        if (pflash_drv) {
> -            loc_push_none(&loc);
> -            qemu_opts_loc_restore(pflash_drv->opts);

You can now remove the '#include "qemu/option.h"' in this file.

With that:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> -            if (pflash_cfi01_get_blk(pcms->flash[i])) {
> -                error_report("clashes with -machine");
> -                exit(1);
> -            }
> -            qdev_prop_set_drive(DEVICE(pcms->flash[i]), "drive",
> -                                blk_by_legacy_dinfo(pflash_drv), &error_fatal);
> -            loc_pop(&loc);
> -        }
> +        pflash_cfi01_legacy_drive(pcms->flash[i],
> +                                  drive_get(IF_PFLASH, 0, i));
>          pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
>      }
>  
> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
> index a0f488732a..1acaf7de80 100644
> --- a/include/hw/block/flash.h
> +++ b/include/hw/block/flash.h
> @@ -24,6 +24,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
>                                     int be);
>  BlockBackend *pflash_cfi01_get_blk(PFlashCFI01 *fl);
>  MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
> +void pflash_cfi01_legacy_drive(PFlashCFI01 *dev, DriveInfo *dinfo);
>  
>  /* pflash_cfi02.c */
>  
> 
