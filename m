Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp430661wrx;
        Fri, 12 Apr 2019 04:19:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQ3jqoezdVv8SCv5CbSbPvGkeEzifx0kZHP90gUnfDueqWQrAsjw8+4RfZBSRT93dBz2sb
X-Received: by 2002:adf:f1c7:: with SMTP id z7mr2479599wro.274.1555067960320;
        Fri, 12 Apr 2019 04:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555067960; cv=none;
        d=google.com; s=arc-20160816;
        b=WwAdymAMCIxfQn3mZO3oAaP0B31z4dbic6Vm29bpDUAm3eUdgdGFRGZZxZQ5X50xla
         enD5xz8v1uEsgE1Jq3i8fBJ0ltKqgMBHiAnxfr3HekVCiNxfBjR72TEIBtWad3i0LHWU
         +vKHO9CjOzPnRKrrP1GKN5pkv3vLiY56vFECxAF7LMSgKgLbeeKtrx3TjaDKahkDdNsn
         x+P10LALpZgMaZ8y8ATyg6s8x5upRiew7OLgK3PZaxAqUlQ5vI6s8pYu4cvGjkQq2wen
         quMyT1p3x2Ro09NvSJU4KV60bMeNavOXZWgJt+C3Nsy54xDN+aQCo4Qscd0eeHkaHgQX
         HYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=A0JMccryKbAcz5l1AwiPmUzRKbvs8IeRaj2pQ8QTtOg=;
        b=A1r1/UkwQxqzhxsSua8i775dVlQmj48O3SZcY+e60tCXAyqflQmHlFA9GM8Inrqcx9
         hof2TK6WWZHVIbnuUTdU5B4PN2YdMBAUUGyuZ6WzUcuGJ9AuXZ/U10vTjH6PWagjc/yA
         kJ00WlYUIhQ3UI6+KMB6a4tziEgYtfFc+GISomN9i2yyJrSuQk6/la63G4LdqJoitOo0
         pSSTjPa7Z94fKNoqoW9MTvssYyLMIw/ww+gjsPKLSbeOz4kuMnlYSE+zZKjZl031mTgf
         83kHdmZV9H4SY9EAGgzfLvlraGwtqYah4MuVUYdlywFo1ML3DjvxDDNWfE8tVJRcqoH+
         fF9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si26433069wru.197.2019.04.12.04.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 04:19:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEuDH-0006FX-EG
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 07:19:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEuCr-0006Eh-TZ
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 07:18:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEuCq-0008J6-Td
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 07:18:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46550)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hEuCq-0008IB-N1
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 07:18:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id t17so11390274wrw.13
	for <qemu-arm@nongnu.org>; Fri, 12 Apr 2019 04:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A0JMccryKbAcz5l1AwiPmUzRKbvs8IeRaj2pQ8QTtOg=;
	b=U682LlzPCeGoPGOCJlDCd9Nt9TjJS7l5EARzBJU+WlbIWwHqfjGH+zoPNv6qImhfpB
	jraq3Qf51kJZ7A9fNt0Y+mM6oEidSKRPhNwv7i9VK2waj+eEpW0mPrvTS/H/EQaZgFTn
	BwG3g5Uc5tDS3SU2sQQ8a1+v5LZAj4Yz85FHy88VcFFg5VUheYAAylKv9JT8fm9hrcRV
	h9Vc5oYw7phsArxkx9sNldtyy236IllSjbcDinDC4ix1sMAnogpIamS5EZ5jxkRs7DRP
	Zo6kOfxwxRw12Fl8gD4eygH7POFpeg4P9e8zM2L0oiQ8zxgBjUgQPVf80dgVHrlvX4TM
	p2/g==
X-Gm-Message-State: APjAAAVLn5c6ZsMzgAUoEEu3VxOn0HStRvskUGzJhBFuWMbad5bftr8c
	BzTDKeS5UqCYV8S5fzSQX5NaJVDQbLg=
X-Received: by 2002:adf:f80c:: with SMTP id s12mr27939601wrp.72.1555067931585; 
	Fri, 12 Apr 2019 04:18:51 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	v14sm51504630wrr.20.2019.04.12.04.18.50
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Apr 2019 04:18:50 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>
References: <20190411135602.21725-1-armbru@redhat.com>
	<20190411135602.21725-2-armbru@redhat.com>
	<0eea5ddb-1efb-8fdf-4a37-9bc2daf86e2b@redhat.com>
	<03fb5b6f-7d95-3b9b-3172-e37825402036@redhat.com>
	<8d6c1ced-1e7b-9e52-3afb-3fe1197f7a02@redhat.com>
	<87bm1br788.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6dbb3173-b2e2-361e-9bfd-cdbcb308eb50@redhat.com>
Date: Fri, 12 Apr 2019 13:18:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87bm1br788.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
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
	qemu-devel@nongnu.org, mreitz@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nH/3mgF7GXhx

On 4/12/19 9:52 AM, Markus Armbruster wrote:
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
> +    }
> +
>      /* Reject gaps */
>      for (i = 1; i < ARRAY_SIZE(pcms->flash); i++) {
>          if (pflash_blk[i] && !pflash_blk[i - 1]) {
> -- 2.17.2

Works for me! Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
