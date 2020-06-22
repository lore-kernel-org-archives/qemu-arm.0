Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3364796lfm;
        Mon, 22 Jun 2020 10:05:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVQuISH559E+Siv+WUzza3klPZFy9UsoZPCNX/rxc5hYwdZmjz4mm69Dyq38fU4TcemV3F
X-Received: by 2002:a5b:707:: with SMTP id g7mr27924765ybq.136.1592845537607;
        Mon, 22 Jun 2020 10:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592845537; cv=none;
        d=google.com; s=arc-20160816;
        b=xOHved53OaVfcdCp/gOlHo1a++Bbfz31NU7EgzFa1dq5YMD4lrzqjgnMQLgL13fsTk
         6KO5wq9XX/ge1ttxz2ijq0uC5g+v7SoFj7SFJfBX7UdH83pQ6dl5s9hk2x6xC9kXqDcn
         meaTRCbKl7Da1d4YJENT0KMyGTw/Bc/I1+RRJOpBv4gd+0E47LC+bGp19RrpdPauoiby
         GF+dFXuSS2XKqUYfo96uiNQ4TRnmxg50M8xrtzG9zO8thsANtPTz7SRCdplEM1XeJfRh
         EvbiRnDiwOJVyC9quyV/dltiTuKgA4qYbzTGP9u3P0BwtXY0oS4p4jhiQ5XhdnBlRklU
         OyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=eTMSwT9+UO9/6NMgh37++TqHkc3S81W6Io8FdaSHjVo=;
        b=RRpH8zL+Km6mnpAPuzGlZwfa5Hr1a34IO5lfd/lPcGC4KjzCAdCMp1AMUO9Jj4Bamb
         ry0QLE5G7ofjEMgiNkB9JrzQL4mqltaeTel0fEh6FGQoOnVvPPR9BJc5wrWZSX5YkAZ/
         Te/BYfG4WEyFP1eCyKR3K3GwSSvxAcnYQw1fqmEe7m+hq39CnPwQYA/UcT1ccdctG0iq
         HRzgUjSDFdS+CHAya0vgqldpAhTi5tKUqdF/hp6wcjoS2JTqf5ZdZiU8yRxm6UCADcrF
         PMRF9HhUPRnTsyBnPnanwYkGhTaQ92/J2tQQpWtCcfCy/3vOM6ScUxegbnQ+gUKlBo7U
         kzUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v203si14374856ybv.150.2020.06.22.10.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 10:05:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnPt3-0005vB-1i
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 13:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnPqk-0004bP-5C
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 13:03:14 -0400
Received: from 10.mo6.mail-out.ovh.net ([87.98.157.236]:46827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnPqi-0002i6-0n
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 13:03:13 -0400
Received: from player799.ha.ovh.net (unknown [10.108.42.239])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 1EDD321A9DF
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2020 19:03:06 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id D894F13A1E998;
 Mon, 22 Jun 2020 17:02:57 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0063d20aab7-46b8-47cf-b596-6c3d8c1943af,
 D5B34DF2F1998B4AFDB97B5973F1BB92C24DD330) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 1/2] hw/arm/aspeed: Remove extraneous MemoryRegion object
 owner
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620162818.22340-1-f4bug@amsat.org>
 <20200620162818.22340-2-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1cef5a58-8228-187c-b0f5-c03cc4a7088b@kaod.org>
Date: Mon, 22 Jun 2020 19:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620162818.22340-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16449960591957986190
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekvddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekiedrvddutddrudehvddrvdegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=87.98.157.236; envelope-from=clg@kaod.org;
 helo=10.mo6.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 13:03:07
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iC67NoU00+Yk

On 6/20/20 6:28 PM, Philippe Mathieu-Daudé wrote:
> I'm confused by this code, 'bmc' is created as:
> 
>   bmc = g_new0(AspeedBoardState, 1);
> 
> Then we use it as QOM owner for different MemoryRegion objects.
> But looking at memory_region_init_ram (similarly for ROM):
> 
>   void memory_region_init_ram(MemoryRegion *mr,
>                               struct Object *owner,
>                               const char *name,
>                               uint64_t size,
>                               Error **errp)
>   {
>       DeviceState *owner_dev;
>       Error *err = NULL;
> 
>       memory_region_init_ram_nomigrate(mr, owner, name, size, &err);
>       if (err) {
>           error_propagate(errp, err);
>           return;
>       }
>       /* This will assert if owner is neither NULL nor a DeviceState.
>        * We only want the owner here for the purposes of defining a
>        * unique name for migration. TODO: Ideally we should implement
>        * a naming scheme for Objects which are not DeviceStates, in
>        * which case we can relax this restriction.
>        */
>       owner_dev = DEVICE(owner);
>       vmstate_register_ram(mr, owner_dev);
>   }
> 
> The expected assertion is not triggered ('bmc' is not NULL neither
> a DeviceState).
> 
> 'bmc' structure is defined as:
> 
>   struct AspeedBoardState {
>       AspeedSoCState soc;
>       MemoryRegion ram_container;
>       MemoryRegion max_ram;
>   };
> 
> Apparently
> What happens is when using 'OBJECT(bmc)', the QOM macros cast the
> memory pointed by bmc, which first member is 'soc', which is
> initialized ...:
> 
>   object_initialize_child(OBJECT(machine), "soc",
>                           &bmc->soc, amc->soc_name);
> 
> The 'soc' object is indeed a DeviceState, so the assertion passes.
> 
> Since this is fragile and only happens to work by luck, remove the
> dangerous OBJECT(bmc) owner argument.

Indeed. Nice catch. 
> 
> This probably breaks migration for this machine.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks

C.

> ---
>  hw/arm/aspeed.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 0ad08a2b4c..31765792a2 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -329,12 +329,12 @@ static void aspeed_machine_init(MachineState *machine)
>           * needed by the flash modules of the Aspeed machines.
>           */
>          if (ASPEED_MACHINE(machine)->mmio_exec) {
> -            memory_region_init_alias(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
> +            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
>                                       &fl->mmio, 0, fl->size);
>              memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
>                                          boot_rom);
>          } else {
> -            memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
> +            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
>                                     fl->size, &error_abort);
>              memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
>                                          boot_rom);
> @@ -345,7 +345,7 @@ static void aspeed_machine_init(MachineState *machine)
>      if (machine->kernel_filename && sc->num_cpus > 1) {
>          /* With no u-boot we must set up a boot stub for the secondary CPU */
>          MemoryRegion *smpboot = g_new(MemoryRegion, 1);
> -        memory_region_init_ram(smpboot, OBJECT(bmc), "aspeed.smpboot",
> +        memory_region_init_ram(smpboot, NULL, "aspeed.smpboot",
>                                 0x80, &error_abort);
>          memory_region_add_subregion(get_system_memory(),
>                                      AST_SMP_MAILBOX_BASE, smpboot);
> 

