Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4297361wrx;
        Tue, 16 Apr 2019 12:23:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQUjqjuNSoi78mC7V1562ljG8LSje+nButsupJB2M88K1tl6lLBr/CXixns3t4uOz4Ot48
X-Received: by 2002:a05:6000:1209:: with SMTP id e9mr31450472wrx.35.1555442585488;
        Tue, 16 Apr 2019 12:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555442585; cv=none;
        d=google.com; s=arc-20160816;
        b=iEYxHTJr0D2u2nPOOw3zAVulComtfeiZPKsa/0iuJO1X6Qu1Mf8jUiJykgpQxvpAG2
         Z7VYrfPa3esAe4iPAwDDpspYxZdq5/QOprwC+loYNAP5KkgZWptgh9BxbBGH01u9wmwq
         8JXtfuMDg5ocpPY1wQR+0Vh7KWVLApADhu8t0pj2b45Dju1prVRTedUWMOGHT7ArD2jZ
         FxluY3MACjAWWVVe5gdkOcyb2eAJmBvd+33e7xO7XaDhNa+1sMbMF8zyImZimrvTO9r0
         pN5Om8Rujav8OzdXi2CZzb4l7mdJ4pb32RkcuQEkRKvAsfTG2Usjw7io/CcrwoSQdCmm
         2Tbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=LI8OKbNXZHAXbr/rM6HoMoXG/jhlKHo3nx9RIZIfu8Q=;
        b=ZDN1H2BPXtedyQHhe15ByP89hMChncfeYoIrzny3UMGJb1asV+tNNyOjCRRwh7InAQ
         or6IKjNpQ4AtcwXhZvd2rTOv7y21s7xCGOHjMkor9A1JpmB56qHHglGyfoUmjZNGqDaW
         3EFxRmpJoemQPsmM4fMp8M69l6wE63ecP2XPKQDSeGPgLyZnOEdu1ZrlJyNicnQGYgig
         xt0dWoZntITyph+1BSdCDaS+X2Kq/QWukBh4u7/cXjuHs+9rw50ZP2vu2GQB2R8T2r0T
         Sh/gDZywObBTunH6h8HY95KEdrNi13vksTmQ+LURpa50dLSi6Z/FrAHDn129SoMTGOx8
         dp2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4si35545128wrx.449.2019.04.16.12.23.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 12:23:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGTfc-00042S-DQ
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 15:23:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGTdR-0002s1-RT
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 15:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGTdQ-0004fB-Rb
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 15:20:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hGTdL-0004bn-FI; Tue, 16 Apr 2019 15:20:43 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64322308792A;
	Tue, 16 Apr 2019 19:20:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8E1819C67;
	Tue, 16 Apr 2019 19:20:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9B2891138648; Tue, 16 Apr 2019 21:20:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190416091348.26075-1-armbru@redhat.com>
	<20190416091348.26075-3-armbru@redhat.com>
	<03ecf4b0-c665-9677-b166-4d68f50cd70b@redhat.com>
Date: Tue, 16 Apr 2019 21:20:37 +0200
In-Reply-To: <03ecf4b0-c665-9677-b166-4d68f50cd70b@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue,
	16 Apr 2019 19:44:38 +0200")
Message-ID: <87o9553gfu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 16 Apr 2019 19:20:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/3] pflash_cfi01: New
 pflash_cfi01_legacy_drive()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
	qemu-devel@nongnu.org, mreitz@redhat.com, qemu-arm@nongnu.org,
	lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lQ2WMG2twlXX

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 4/16/19 11:13 AM, Markus Armbruster wrote:
>> Factored out of pc_system_firmware_init() so the next commit can reuse
>> it in hw/arm/virt.c.
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/block/pflash_cfi01.c  | 28 ++++++++++++++++++++++++++++
>>  hw/i386/pc_sysfw.c       | 16 ++--------------
>>  include/hw/block/flash.h |  1 +
>>  3 files changed, 31 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
>> index 16dfae14b8..333b736277 100644
>> --- a/hw/block/pflash_cfi01.c
>> +++ b/hw/block/pflash_cfi01.c
>> @@ -44,9 +44,12 @@
>>  #include "qapi/error.h"
>>  #include "qemu/timer.h"
>>  #include "qemu/bitops.h"
>> +#include "qemu/error-report.h"
>>  #include "qemu/host-utils.h"
>>  #include "qemu/log.h"
>> +#include "qemu/option.h"
>>  #include "hw/sysbus.h"
>> +#include "sysemu/blockdev.h"
>>  #include "sysemu/sysemu.h"
>>  #include "trace.h"
>>=20=20
>> @@ -968,6 +971,31 @@ MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *=
fl)
>>      return &fl->mem;
>>  }
>>=20=20
>> +/*
>> + * Handle -drive if=3Dpflash for machines that use properties.
>> + * If @dinfo is null, do nothing.
>> + * Else if @fl's property "drive" is already set, fatal error.
>> + * Else set it to the BlockBackend with @dinfo.
>> + */
>> +void pflash_cfi01_legacy_drive(PFlashCFI01 *fl, DriveInfo *dinfo)
>> +{
>> +    Location loc;
>> +
>> +    if (!dinfo) {
>> +        return;
>> +    }
>> +
>> +    loc_push_none(&loc);
>> +    qemu_opts_loc_restore(dinfo->opts);
>> +    if (fl->blk) {
>> +        error_report("clashes with -machine");
>> +        exit(1);
>> +    }
>> +    qdev_prop_set_drive(DEVICE(fl), "drive",
>> +                        blk_by_legacy_dinfo(dinfo), &error_fatal);
>> +    loc_pop(&loc);
>> +}
>> +
>>  static void postload_update_cb(void *opaque, int running, RunState stat=
e)
>>  {
>>      PFlashCFI01 *pfl =3D opaque;
>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
>> index 75925f5d3f..751fcafa12 100644
>> --- a/hw/i386/pc_sysfw.c
>> +++ b/hw/i386/pc_sysfw.c
>> @@ -269,9 +269,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
>>  {
>>      PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
>>      int i;
>> -    DriveInfo *pflash_drv;
>>      BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
>> -    Location loc;
>>=20=20
>>      if (!pcmc->pci_enabled) {
>>          old_pc_system_rom_init(rom_memory, true);
>> @@ -280,18 +278,8 @@ void pc_system_firmware_init(PCMachineState *pcms,
>>=20=20
>>      /* Map legacy -drive if=3Dpflash to machine properties */
>>      for (i =3D 0; i < ARRAY_SIZE(pcms->flash); i++) {
>> -        pflash_drv =3D drive_get(IF_PFLASH, 0, i);
>> -        if (pflash_drv) {
>> -            loc_push_none(&loc);
>> -            qemu_opts_loc_restore(pflash_drv->opts);
>
> You can now remove the '#include "qemu/option.h"' in this file.

Nice.

> With that:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks!
