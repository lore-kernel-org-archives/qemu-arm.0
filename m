Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2354314wre;
        Thu, 24 May 2018 14:55:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK1rWoKFAglFjFRIEceBawhiwPq1YxqyM1hxhw8z+mSmPxJ6PPLbeLVaZIDeRg2IDM0dKpT
X-Received: by 2002:ac8:2534:: with SMTP id 49-v6mr1971490qtm.82.1527198935549;
        Thu, 24 May 2018 14:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527198935; cv=none;
        d=google.com; s=arc-20160816;
        b=pIE7Zp6AFqc8Vkwiel0aSbvVrVaKzYkvJqo/etoRwWgTisVh/Ppzrjy63W2jAWNJ/V
         I8JWqOQQT9lGBSBTj6eXD0gyJ7/zmPF/dof3glF9VZtQahFmJIxl3kuIXPo5NVnxCy5t
         rYtghveX+fJQp2b0g7hraOKbTKNNj/IzENp87yOIPYjFY8bxrCZm3a1zbiTT4a3uSnwu
         W4nygOCQiNDHWkPoH8UYD3jRg8pfEbZGl/MBBZHkdu34bQjEegqcqRtxZQ7Oit6LmpyR
         m+Yk68+wPX2mS6YXxnDF4io+2EHO+JLkOkEORJTLpcRRZdbQtpeYm1oip7v7Gv+rRw2o
         aDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=nwSkekwLYkXSnjObOAJcq41ONj5vs/sGCLwZcAg4Zo0=;
        b=nkYy3rl1mTWALPfFWwPfYiU4K7+yXQSFONKc8Ew//hIrw8LwvtHA/SHr4pNHFsm7eh
         o985isY6fFcRLbAOT/Na5pk8UEg+Z/uZKWsYDcQIWyJu6l0v7XwpmUjTy0quxQoRZxMf
         2P3X0zn8yakqbZAtZaT6KAhiLWpEgK6ZyBC06SGpRTAfnxs23GlpxEq4lzmPORTtBDwO
         KmkKLDDgAU8c/rIuhLSk473d6D++4bM634NhGNyQ1Dh5CVx8iqW/c7T0lOKK7eUsjG2V
         bS/xdGGmHOrnWdkCBJ7+/yUiYJcMGrd7pV3fMN+fsrKwAQnz245jO5d5WRSSmXZ6735f
         7X3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J8m1rsxY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o82-v6si2370115qki.221.2018.05.24.14.55.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 14:55:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J8m1rsxY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLyCt-000446-0q
	for alex.bennee@linaro.org; Thu, 24 May 2018 17:55:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fLyCh-000401-8U
	for qemu-arm@nongnu.org; Thu, 24 May 2018 17:55:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fLyCg-0003ZW-FY
	for qemu-arm@nongnu.org; Thu, 24 May 2018 17:55:23 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36528)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fLyCa-0003Os-3n; Thu, 24 May 2018 17:55:16 -0400
Received: by mail-qt0-x242.google.com with SMTP id q6-v6so4111195qtn.3;
	Thu, 24 May 2018 14:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nwSkekwLYkXSnjObOAJcq41ONj5vs/sGCLwZcAg4Zo0=;
	b=J8m1rsxYyKHQTjJBbxQ6VR5HGYtsll76cEzBUorxHAMS9Oalu2PlM7RqwT8dTleNhh
	GRrEzE66seTy3y369qE85K58vk606/IoBHPr5UKuUs4DB7f4s2gPLZdM2PKS6aPG47io
	usbRurQylJBO1ueOgGDrvcIdtaJvKnO4sIXN4QH+m9ZDdmCcjhCO2huz19KKMG8tGead
	N3PnJQj46Lh8V0ecEHo7ZnofI8SPD4TBVYvYK3QpQs79LrFmJclugz9gT2qEPmudknKa
	zO+2bOT2Fg3AVJji0QeEvdGVvjj/dcpiXNDJvWNq2qN6SOZF8eDQZ4eaDOZauhk/5JdO
	67FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=nwSkekwLYkXSnjObOAJcq41ONj5vs/sGCLwZcAg4Zo0=;
	b=Xkvi5dUvCGHd+etAtvGwhwg8BneiYOrQY4WildWJ+cBTFHV2TWBXqJtxW34BXrSrNh
	blc9YfruUogHXXeivQuMfT9q3Ma6wVX38qk7jMFDevdjPGQFben4epNFNtzQ7FUOyLxh
	gDsN1FrX4CdNswGh2aOkV5i2lexHteheHM2DU8EdOFSSBF8In5aIHwFLepzTo1nZw3p2
	npXlm3+iZNskTRDigYT+Qufd2gbNWRG6tfbEqCui0SSEwItCGJrUViABvlJz9EvPpZ28
	Af2GBO4Im5/xBG3dwaQfq3C6BAYXEXQ0sQM9o5LoSb4ApF73iLmP8VvXD9/xUtzgh6Dd
	53uw==
X-Gm-Message-State: ALKqPwcL3hjcH2POu8uqpglWzS8tDW5O1LE4jH38BT2zrU6BAOTtEJdi
	fZ4D+1qd9wHhbbaIk8Fok87FEfSg
X-Received: by 2002:aed:3c7a:: with SMTP id
	u55-v6mr8628607qte.391.1527198915218; 
	Thu, 24 May 2018 14:55:15 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	141-v6sm1558165qkn.38.2018.05.24.14.55.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 May 2018 14:55:14 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20180524213756.7528-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b3d15f99-2e67-c0d4-7741-3af67d566734@amsat.org>
Date: Thu, 24 May 2018 18:55:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180524213756.7528-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH] arm: fix malloc type mismatch
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
Cc: qemu-arm@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GMZUsRfXjgGh

Cc'ing qemu-devel for patchew and co

On 05/24/2018 06:37 PM, Paolo Bonzini wrote:
> cpregs_keys is an uint32_t* so the allocation should use uint32_t.
> g_new is even better because it is type-safe.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/gdbstub.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index e80cfb47c7..0c64c0292e 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -157,8 +157,7 @@ int arm_gen_dynamic_xml(CPUState *cs)
>      RegisterSysregXmlParam param = {cs, s};
>  
>      cpu->dyn_xml.num_cpregs = 0;
> -    cpu->dyn_xml.cpregs_keys = g_malloc(sizeof(uint32_t *) *
> -                                        g_hash_table_size(cpu->cp_regs));
> +    cpu->dyn_xml.cpregs_keys = g_new(uint32_t, g_hash_table_size(cpu->cp_regs));
>      g_string_printf(s, "<?xml version=\"1.0\"?>");
>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>      g_string_append_printf(s, "<feature name=\"org.qemu.gdb.arm.sys.regs\">");
> 
