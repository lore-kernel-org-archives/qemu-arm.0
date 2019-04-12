Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp507847wrx;
        Fri, 12 Apr 2019 05:35:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqc2F5EZnZ5T1vrl8WwnpF5YRHfV525XUcq0ey7so1FK9aVlodcO5Ftx0hr9PlZpOOPOIU
X-Received: by 2002:adf:b458:: with SMTP id v24mr35480906wrd.46.1555072526039;
        Fri, 12 Apr 2019 05:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555072526; cv=none;
        d=google.com; s=arc-20160816;
        b=GfqcNNK/39rpX6H/VO3YBRHpPOVWmBYDFX+E8vsQ0o7w+lTf5fxSor9lGVbpC8T/IT
         JPQXE4ks8fHlXkkK7LW1qChg8SM7xl6tfaeABgKnSoAw1nu28SrhV9sV/v/je6lR6t/i
         akpnoUSN1ZKx0GXKJUx1MONhLBwLdV1WtD9BsXSEnaqOVD+seu3bterj+q09hi71JUKL
         VYCkKuSlg+PLL1I0wIPLEODK5GcIJJPeivo2HnE/4rrv+ReUib8BMxnLR+8/H4m7vML5
         n/fxDsekpZZmwfjeQOB6S0GYEUcFP5aNc6qJbQHIozv9EdUHEOjR6IsBvyzC0Dw0T2Xv
         80rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=/hS/CIeJqPqYbwPvA/nV+bhsiR5rZohroaVGJxryuF8=;
        b=fAZb8aOLKwLm+BO7yjmuvYUwITOwTcuS7ceKKYDuh63oGRAFBK/ITqZZWvTp1xXNSp
         lj5ExZJL7LjO6alijvsf2gWgrIkL830Tao4XMv4IZzZTSiVt3LuZ/hJWqZFMlgyMuXKi
         wqPvtUGWgb2t3H73+LpKZYLzeYnaKY/UT/H4uRewsdhKZ3ZyyU/M+ObvIe1hKWXjdxzk
         xBPlwD/5FoiIz4Z84r3B2QIYNfkeI9pE031Z8aEOOjXzL2fDzcI2SG+/m+OQpRVsVH7w
         d2rsLbjXzBVGDdp3ZPOou028BPdcQYG1w53LjxihvLbgEKGzyCfjNdpLonPTntiZ626m
         E97w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si27027853wrn.71.2019.04.12.05.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 05:35:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEvOv-0003GF-2J
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 08:35:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hEvFt-0002ZB-Vc
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 08:26:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hEvFs-0002e4-RK
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 08:26:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50478)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hEvFs-0002dJ-G8; Fri, 12 Apr 2019 08:26:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAAA23088B80;
	Fri, 12 Apr 2019 12:26:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D3245D6A9;
	Fri, 12 Apr 2019 12:26:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E40EA1138648; Fri, 12 Apr 2019 14:26:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
References: <20190411135602.21725-1-armbru@redhat.com>
	<20190411135602.21725-2-armbru@redhat.com>
	<0eea5ddb-1efb-8fdf-4a37-9bc2daf86e2b@redhat.com>
	<03fb5b6f-7d95-3b9b-3172-e37825402036@redhat.com>
	<8d6c1ced-1e7b-9e52-3afb-3fe1197f7a02@redhat.com>
	<87bm1br788.fsf@dusky.pond.sub.org>
Date: Fri, 12 Apr 2019 14:26:01 +0200
In-Reply-To: <87bm1br788.fsf@dusky.pond.sub.org> (Markus Armbruster's message
	of "Fri, 12 Apr 2019 09:52:07 +0200")
Message-ID: <87tvf3o1eu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 12 Apr 2019 12:26:03 +0000 (UTC)
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
	qemu-devel@nongnu.org, mreitz@redhat.com, qemu-arm@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aXdyrdGElzk6

Markus Armbruster <armbru@redhat.com> writes:

> Laszlo Ersek <lersek@redhat.com> writes:
[...]
>> In other words, we could have written the pre-patch (original) code like
>> this:
>>
>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
>> index c6285407748e..ed6e713d0982 100644
>> --- a/hw/i386/pc_sysfw.c
>> +++ b/hw/i386/pc_sysfw.c
>> @@ -291,9 +291,10 @@ void pc_system_firmware_init(PCMachineState *pcms,
>>              error_report("clashes with -machine");
>>              exit(1);
>>          }
>> -        pflash_blk[i] = blk_by_legacy_dinfo(pflash_drv);
>>          qdev_prop_set_drive(DEVICE(pcms->flash[i]),
>> -                            "drive", pflash_blk[i], &error_fatal);
>> +                            "drive", blk_by_legacy_dinfo(pflash_drv),
>> +                            &error_fatal);
>> +        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
>>          loc_pop(&loc);
>>      }
>>
>> and the behavior would have been identical.
>>
>> For the sake of QOM / blk dummies like me, can you please split this
>> refactoring to a separate patch, before extracting the new function?
>
> If you think a preparatory patch is called for, I'll create one.
>
> I'd have difficulties coming up with a commit message for the one you
> proposed.
>
> I append a patch I can describe.  Would it work for you?
>
>
>
> pc: Split pc_system_firmware_init()'s legacy -drive loop
>
> The loop does two things: map legacy -drive to properties, and collect
> all the backends for use after the loop.  The next patch will factor
> out the former for reuse in hw/arm/virt.c.  To make that easier, do
> each thing in its own loop.

Inserting here:

  Note that the first loop updates pcms->flash[i]->blk for -drive
  if=pflash with qdev_prop_set_drive().  The second loop gets the
  (possibly updated) value from pflash_cfi01_get_blk().

>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/i386/pc_sysfw.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index c628540774..90db9b57a4 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -269,6 +269,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
>  {
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      int i;
> +    BlockBackend *blk;
>      DriveInfo *pflash_drv;
>      BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
>      Location loc;
> @@ -280,23 +281,26 @@ void pc_system_firmware_init(PCMachineState *pcms,
>  
>      /* Map legacy -drive if=pflash to machine properties */
>      for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
> -        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
> +        blk = pflash_cfi01_get_blk(pcms->flash[i]);
>          pflash_drv = drive_get(IF_PFLASH, 0, i);
>          if (!pflash_drv) {
>              continue;
>          }
>          loc_push_none(&loc);
>          qemu_opts_loc_restore(pflash_drv->opts);
> -        if (pflash_blk[i]) {
> +        if (blk) {
>              error_report("clashes with -machine");
>              exit(1);
>          }
> -        pflash_blk[i] = blk_by_legacy_dinfo(pflash_drv);
> -        qdev_prop_set_drive(DEVICE(pcms->flash[i]),
> -                            "drive", pflash_blk[i], &error_fatal);
> +        qdev_prop_set_drive(DEVICE(pcms->flash[i]), "drive",
> +                            blk_by_legacy_dinfo(pflash_drv), &error_fatal);
>          loc_pop(&loc);
>      }
>  
> +    for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
> +        pflash_blk[i] = blk_by_legacy_dinfo(pflash_drv);

Uh, this should be pflash_cfi01_get_blk(pcms->flash[i]) instead.

> +    }
> +
>      /* Reject gaps */
>      for (i = 1; i < ARRAY_SIZE(pcms->flash); i++) {
>          if (pflash_blk[i] && !pflash_blk[i - 1]) {
