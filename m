Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3926178wrx;
        Tue, 16 Apr 2019 06:26:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxEqW1mCxweNWuqjbXa7M9Kk6MITWO+tvFq6JIZAiF4iERSZYnGdYaA5LjKFJiO2Vdx+WzI
X-Received: by 2002:adf:ee07:: with SMTP id y7mr13613605wrn.219.1555421180872;
        Tue, 16 Apr 2019 06:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555421180; cv=none;
        d=google.com; s=arc-20160816;
        b=zqIypJgltmOGL+GcNhppGhVKow2wKUjrg75/tdY1PB/yvlTgajMJSuxyJ6FCjeZOPu
         3ZAKZUQAAPSF90XR3g940McekW7a8x+KhjFem7wLTjBlimAYym7FUBqm8THYWtd/ATiT
         ZK6J7PoWCnGEPGR4TThheDmLQ3FyRenN5muz9wr9L1+8RTzMeuebRKPYDkqrLHzj+2l4
         6/vTqu8COWO31TpJjwkCSyuJufGMq3IdO08muwFdtufOP1pblxCmhUUYvaHmBvOKMb7x
         jAw+7127q46X2DfcMDksmFgvABOquwx6CciEwDQQnYBgDO/4oaYmFzf2ccqUdFp2i2Sq
         g/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=i8eT/soCfJJVbfsRgIRws5ufTDhxUhchIiA6z6168+Q=;
        b=ffGuwhfMlzsnVNXMHOpsK2ctor6mDD9H3XEPWeAmDNxy6SKgCcoLUHlHJndPt2SMra
         tDm2ElQQ4ofTgIkeZre03M8AvgM7dmQJlyE6azycnGj0QR0nWK+DC8vYP6qSc6pGHUQ7
         lDJxJYzKSMb1KAJb1DNT00PGeY0htrMjUD4fUTBoBDKEMQovavhUY+xx6MqYzNJTWcHi
         ZffTI7VOJuTx41A4FCW3g5w1G+p7QcIX7IB3C/3IfjdVv6pPo2cvPQ7z6nY+WUTCvysZ
         c8+9Hounmhtl6bd6PeUVqBrNBUrh70NFQRsdkwZwsU9/GMKw1pfoUC06dE4P596fdF7Q
         5kjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j46si35440450wre.143.2019.04.16.06.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGO6N-0001qB-SK
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:26:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hGNmi-0002vl-I5
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 09:06:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hGNmh-0007RP-KF
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 09:06:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50918)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1hGNmh-0006rn-9E; Tue, 16 Apr 2019 09:05:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A48AA307D985;
	Tue, 16 Apr 2019 13:05:17 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-171.rdu2.redhat.com
	[10.10.120.171])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC3AD5D71A;
	Tue, 16 Apr 2019 13:05:00 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190416091348.26075-1-armbru@redhat.com>
	<20190416091348.26075-2-armbru@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <67a714c4-d76b-06dc-cb88-71142f5fbce6@redhat.com>
Date: Tue, 16 Apr 2019 15:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190416091348.26075-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 16 Apr 2019 13:05:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 1/3] pc: Rearrange
 pc_system_firmware_init()'s legacy -drive loop
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
	mreitz@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mhdsg8vJL7Ap

On 04/16/19 11:13, Markus Armbruster wrote:
> The loop does two things: map legacy -drive to properties, and collect
> all the backends for use after the loop.  The next patch will factor
> out the former for reuse in hw/arm/virt.c.  To make that easier,
> rearrange the loop so it does the first thing first, and the second
> thing second.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/i386/pc_sysfw.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index c628540774..75925f5d3f 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -280,21 +280,19 @@ void pc_system_firmware_init(PCMachineState *pcms,
>  
>      /* Map legacy -drive if=pflash to machine properties */
>      for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
> -        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
>          pflash_drv = drive_get(IF_PFLASH, 0, i);
> -        if (!pflash_drv) {
> -            continue;
> +        if (pflash_drv) {
> +            loc_push_none(&loc);
> +            qemu_opts_loc_restore(pflash_drv->opts);
> +            if (pflash_cfi01_get_blk(pcms->flash[i])) {
> +                error_report("clashes with -machine");
> +                exit(1);
> +            }
> +            qdev_prop_set_drive(DEVICE(pcms->flash[i]), "drive",
> +                                blk_by_legacy_dinfo(pflash_drv), &error_fatal);
> +            loc_pop(&loc);
>          }
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
> +        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
>      }
>  
>      /* Reject gaps */
> 

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

