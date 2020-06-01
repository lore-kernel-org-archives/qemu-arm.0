Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3234000lfc;
        Mon, 1 Jun 2020 09:07:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd6rpQpytOSevuZ40ggHG9AKy8b00FtJKj9c+O9BWOiNld4Ah/sOJ6G8C1fNX9TzThWOkQ
X-Received: by 2002:a25:e7cf:: with SMTP id e198mr25302984ybh.188.1591027660350;
        Mon, 01 Jun 2020 09:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591027660; cv=none;
        d=google.com; s=arc-20160816;
        b=o7ZR7INwAU/PovmyD2x0zMupuqftqP3WCUlWRm5DSq34nxqCrrQpyRMZ4l7oElkWP5
         a3H9Oax1p+3S6NephhzYV+myzmQmEQrvax+D5kikvsInv94f49d3LnPeEWlAyv7Kipb5
         SSMIJCp8udhTqX5QANGPx8Lf8jDkHfBpD/sOEaa55bwia6PajneCZop5oFGwqPdnaE28
         00IDKwjjbeJULXnP22JNlh/A6mmqLdNEZLFjI6FgXmpIaxFeWfYwEUaWFvjlde7aX9ay
         dao8WiZtLzsIznRtDb+ME7xRUvtMUQ+U3ye8gcMQDgbVL6ggTE8DaSPFJxQ1sjnEm/3y
         mjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=IyXcNaiM5Jnpo0jWpvddQIABSU8X5l4PvBloi8mfCFw=;
        b=XU3m6XXb3wA2VRQHdGyQ14nNFrkMF6HQOc0GKdHAFVPBJQcRD8bkeawDyw8NJ4tloH
         nEeGHTHDPNnm7HyDI0/lbnPULkZB4RGr9SPfdZr8uqV2AfCoGl/BaOax+JHh/bfmjhPU
         V3CzgGhyMADdDY4Z+g/H6xJdae1dHvoKsSRQv2WVmOnlp3EjOkB+yb5ZYsAs3dF1+/ES
         TLgmElZH/k+Uhz1wxXSFSP9u/c1phgEbH98dLDAN9TeXx/URSGb3GY7KnZMVM1Jvoxe0
         QbrmsJvYynw61crJCQXZoBaJhKA0ZqbrNo3yclBUKB5NMyffCa29100+Qk6olXevPJb4
         Calw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u185si14332322ybb.15.2020.06.01.09.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 09:07:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfmyR-0002Fc-Lu
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 12:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jfmy4-0001oE-7Z
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 12:07:16 -0400
Received: from 15.mo7.mail-out.ovh.net ([87.98.180.21]:60929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jfmy2-0000GY-NV
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 12:07:15 -0400
Received: from player695.ha.ovh.net (unknown [10.108.35.12])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6D444169523
 for <qemu-arm@nongnu.org>; Mon,  1 Jun 2020 18:07:04 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 55E0D12CAB066;
 Mon,  1 Jun 2020 16:06:43 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b8d09b32-b5d3-4353-abb8-6409bc852004,83E988B7E4CB5EF414800AC4A3AAD9DE61AE43FA)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 1/8] hw/arm/aspeed: Correct DRAM container region size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-2-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <10b20388-ee7a-9a61-83d5-7686369dab20@kaod.org>
Date: Mon, 1 Jun 2020 18:06:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2857533967562673072
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudefhedgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=87.98.180.21; envelope-from=clg@kaod.org;
 helo=15.mo7.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 12:07:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AHc1VC/sJuEG

On 6/1/20 4:29 PM, Philippe Mathieu-Daudé wrote:
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value. This is not a problem
> for the 32-bit maximum, 4 GiB.
> By using the UINT32_MAX value, the aspeed-ram-container
> MemoryRegion ends up missing 1 byte:
> 
>  $ qemu-system-arm -M ast2600-evb -S -monitor stdio
>  (qemu) info mtree
> 
>   address-space: aspeed.fmc-ast2600-dma-dram
>     0000000080000000-000000017ffffffe (prio 0, i/o): aspeed-ram-container
>       0000000080000000-00000000bfffffff (prio 0, ram): ram
>       00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram
> 
> Fix by using the correct value. We now have:
> 
>   address-space: aspeed.fmc-ast2600-dma-dram
>     0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>       0000000080000000-00000000bfffffff (prio 0, ram): ram
>       00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/arm/aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 2c23297edf..62344ac6a3 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -262,7 +262,7 @@ static void aspeed_machine_init(MachineState *machine)
>      bmc = g_new0(AspeedBoardState, 1);
>  
>      memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
> -                       UINT32_MAX);
> +                       4 * GiB);
>      memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
>  
>      object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
> 

