Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4200286wrx;
        Tue, 16 Apr 2019 10:39:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhZB+6FaC0eHEH0onOZwutn0JDiYMlfceLTtqW7m1gJn5hocdrNanlZCwW4NrutsFVLVW5
X-Received: by 2002:adf:ce8c:: with SMTP id r12mr3768842wrn.60.1555436363227;
        Tue, 16 Apr 2019 10:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555436363; cv=none;
        d=google.com; s=arc-20160816;
        b=sDYTTvzvbbCTwGUqfYo7Li/PQOPR1X6Ev+8+ZpG55qClzHDLM9MUPDl63nZkND79Tc
         1YirTFmLV3gTSAW6IVWRkMLjgSOI+wQpHvhZjRfzV/Wg+uAms6l7okWFzKezJUyTjtTd
         exOychO81nPCgmWGQe4p2wNr50QAmWfI1B3KvvySRTPU6u+yXPwg4tgxHu784y4udlTU
         4nC9F9bLkM9q9ShkmQbzGDIzBasESCNWehGVkpuDlWDuu3vdpcYKQ/emfOqDGOY7a52Q
         9VzZWEBTnWS1Z5BrEoQaTJ5L8KQeUuJC7EFF4ytjci4gYvLTcL+0W77TlbnCG7sWhx/j
         zrUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=gSUCcgG6wPa0hvMtI0TJYrUwX5y+E+Fsm3WwCaySzdY=;
        b=eh0ynuuanTi7nX8FhO5iNY6roCf3+aevN8knnjeDDbx12qTKCed0OLypfEHywDGaJ8
         rq/PLAsNPl8dzFpmvcQndrWZ1p5U1LD9Yi5UtMDurjHZjyoV2jUIplyj5wS7sL7IpeWT
         d6x+/JPsACQ+10BDVuGCAu8fEx1MptLUqJOw8YAXgysDH/2uXQnQB8x9OuCWKwFMKccS
         u+QFHKjsKgNU91FxAFVI+vDaLLKwuE1hdXqOv+RYp186UnmcANONE/D+4b7lbD2xVxZ2
         00uwT5ifhj3kovAkzR3Oh25rGed5lC/zgK82zKk7tIY70NNm3UwS2HZ+W6TzyCf2zR+k
         T59A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si46820wmd.39.2019.04.16.10.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 10:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGS3G-0008Ez-B5
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 13:39:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hGS2s-00089N-2w
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 13:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hGS2i-0006UD-RI
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 13:38:56 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37303)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hGS2i-0006Sc-1g
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 13:38:48 -0400
Received: by mail-wm1-f68.google.com with SMTP id v14so67193wmf.2
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 10:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gSUCcgG6wPa0hvMtI0TJYrUwX5y+E+Fsm3WwCaySzdY=;
	b=U6PPQtCDYvXw720Y5LDHFGgxMPu17Cw/VIqF1QIYxr7YsNHXdpvTy8I3M3LeHwRbZX
	0w5WEVaCI5Z47Yx54llIcJpZI0hTEPtjU0n3Horv8UR81iheJSorNyfqFC/AJ5+SQYf3
	OwYbJjGUWrAXEdpTx1eGXoozKOxWSB4AgUMyHYHfDUZM+H2XcgiRx08iSPcX/g5rSnps
	ITlCB7TgDyA/MCU/zikIF4syNqH3sCDKzvDrW9ILtV83NpYBdvkJe/uLRtia/umOwiJz
	Ce2gIMYfJRc3yraSZs3hpl625oHjKEVSltcinkPcBh1dg0hnY8JCZuOyhz703YEzXygz
	E9cA==
X-Gm-Message-State: APjAAAUQv9BMhppNkAl7UcJ4kaKz7e8DoQLub//k+LqT/NVmqd19sfAt
	KRwH6FuAoEmHb07jveRuoH02bw==
X-Received: by 2002:a7b:c1cf:: with SMTP id a15mr26572360wmj.44.1555436326157; 
	Tue, 16 Apr 2019 10:38:46 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	z18sm79910257wrr.90.2019.04.16.10.38.45
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 10:38:45 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190416091348.26075-1-armbru@redhat.com>
	<20190416091348.26075-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ae1c979b-9cb2-cbaa-584c-b70dbf97d1e4@redhat.com>
Date: Tue, 16 Apr 2019 19:38:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416091348.26075-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
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
	mreitz@redhat.com, qemu-arm@nongnu.org, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BrsfQJgnlfaO

On 4/16/19 11:13 AM, Markus Armbruster wrote:
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
