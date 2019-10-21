Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4850212wrm;
        Mon, 21 Oct 2019 10:14:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxy+EysIy5rD6TfDXyLIRz0AvLXTFylVa4z66aqJe3vlVZbiGmWXm73kKHMQWDtSOsJTUM8
X-Received: by 2002:ac8:70c4:: with SMTP id g4mr12395751qtp.136.1571678092070;
        Mon, 21 Oct 2019 10:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571678092; cv=none;
        d=google.com; s=arc-20160816;
        b=n5ttN0sFhoFXWCu47GujLAf8kpp2k7fic2UPFM3aOCLjeunk+Zb8/+lREud+8UkFHJ
         zaT0UOwJjuZ96cs0RVfyfH0Lhk4pyLAgx1mdif62303Tpo6Nys5ZayMmuzFX91fNegJo
         Qy6F/MVpaTKJPItrLyZdK60gbbNzazo/WCAomH/kTfbTBfCI2JW6pD6u+hBFEEX6yEcN
         0qYK521r78+yUBO7120aFDHWVwteP9CJ1+/ub+aHJWA0Reh8WcCCnn5jwwVp6yj6WXEY
         LTAq3BUuTFKH4CYBKTyJzlFcvFN8WECqHOPb4g/HBhbcdAA7+GUAqcap4WP960lGtA5k
         x5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=NzCeMUspjaV8z1Jvc6HJ+8Su3NYeHe4yKC/Lo+xgLLU=;
        b=si/BhMD/6ZPKiDq4pR0dmmqoxgIvyhvl2Rl+4t5VaWRiMS7uenpXEB6cobR2JKhJr8
         7cR0X1uPclpEuca3o1e4j03s8x/iqZ2fhxTLkxSE720i42pgqghPXozOBvsRoR5bVA5C
         liI6BHv7ZryxsW2joaWscqvj2GvzCdBqXI/YC05WrMY4/OF0xpPbvij3J3VnyJsWBQ4H
         q6EYk15ClTx6lv5MMt06RZsOHihdffSSn+GJmVs+3oQeICd8HslcQrkngobBgeUghN9x
         DBe53vwvEY5f9hVw5mmU9csHCMbaH299o5vrOy4WN2vWStM62SuuORQHxISwbpEFzL5P
         2DoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IDdSbRBp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si12519254qkg.368.2019.10.21.10.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:14:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IDdSbRBp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMbGd-0002dK-H2
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbGC-0002Lz-EM
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:14:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbGB-0008LB-73
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:14:24 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42411)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMbGB-0008Ka-0r
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:14:23 -0400
Received: by mail-pg1-x543.google.com with SMTP id f14so8175456pgi.9
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NzCeMUspjaV8z1Jvc6HJ+8Su3NYeHe4yKC/Lo+xgLLU=;
 b=IDdSbRBpYob1oa2wdeQpKvcViRPSVCKxXkJUK4rZCzALKJr75xfPw7aofR3mmXqn1s
 9Xw8q1c8tje/4eZSPNSI+UXPnQPLhOsj8E65YhgFpl6aT0jhaapgXGCe33vopzBFq/Q/
 0wlSHJSP1SqlLzsxfybD5D++FA/71a7p43s58htX1AN2bUewIo94ugs/xxxR5IpGC1st
 JNtOBdH1KwgGjTAQx7kXZ/iyCvmdar4w06QUySwmH3gF4U7L2KYTvErxvOu1N7tKyuSl
 WZeSqd3DjuGKC69AQxmvmQOkfm2oeeC7btBggURffss1yEs79FLjLDn4RI8uCo1zyf/6
 elZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NzCeMUspjaV8z1Jvc6HJ+8Su3NYeHe4yKC/Lo+xgLLU=;
 b=DbRAYeOoN10iJKuBbsoMsLly0CjYBgXUxxnWAPFiauAzi6jqdNj04DmgUrnBtSm/Tw
 6etJ6RRO0GCX/X6Xc95vRpt2Hj00Ye5ykWZ2ZJKSfHIDGIGGBSyUEAHjhQiDFYjUFF1l
 40Ekx++4yRNjN72Md1AVQmpBA5tVmo6/opVRU7wpxR6dYyVU6nJ5zjPpCOKg58Vqnz6V
 tE+VUdwIGESkSMB4UPiloHgGvZa2X4eLJp/KOt5ilClkAVEyj/z3o3I7Bi9f19fBQkvt
 maK/gvF4HNC0nvJE6HpGp/NkHLJ3Zx33ASO0TVsQ91mgR31eFbFejRVOeAiGsU/kYLfB
 X7mg==
X-Gm-Message-State: APjAAAVCI/L/7T8PnH6lrdU7T+vRMDmRW9rrvj3TbHQ31oCWj8g6dMwf
 j5m0ghbY/3f0Dgs7TUgiZTKHVA==
X-Received: by 2002:a17:90a:c48:: with SMTP id
 u8mr30845101pje.16.1571678061062; 
 Mon, 21 Oct 2019 10:14:21 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z12sm18058953pfj.41.2019.10.21.10.14.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:14:20 -0700 (PDT)
Subject: Re: [PATCH 11/21] hw/alpha: Let the machine be the owner of the
 system memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-12-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ed804be1-8516-3dbc-d738-20c2b03e5309@linaro.org>
Date: Mon, 21 Oct 2019 10:14:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-12-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FNlafBq1ga/j

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/alpha/dp264.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
> index ddc249261c..5696b1e79b 100644
> --- a/hw/alpha/dp264.c
> +++ b/hw/alpha/dp264.c
> @@ -78,7 +78,7 @@ static void clipper_init(MachineState *machine)
>       * Main memory region, 0x00.0000.0000.  Real hardware supports 32GB,
>       * but the address space hole reserved at this point is 8TB.
>       */
> -    memory_region_allocate_system_memory(&ram_region, NULL, "ram",
> +    memory_region_allocate_system_memory(&ram_region, machine, "ram",
>                                           ram_size);
>      memory_region_add_subregion(get_system_memory(), 0, &ram_region);
>  
> 

I take it this squishes into the squish of patches 7+9?


r~
