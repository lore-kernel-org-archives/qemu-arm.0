Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp345818ejb;
        Thu, 1 Feb 2024 08:21:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsEoTe9tmJeUyA80ikVEAiwaGXWFjePSQuP7cBnlgyCYyXKoTpkP8PuoklwLH1ieh11kB+
X-Received: by 2002:a81:a0d1:0:b0:602:cced:240a with SMTP id x200-20020a81a0d1000000b00602cced240amr2483904ywg.0.1706804490921;
        Thu, 01 Feb 2024 08:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706804490; cv=none;
        d=google.com; s=arc-20160816;
        b=oGsUu4Yup1BTddUKqeR9HhhCwAt3Kr6kfcrueASVe+ECY9GHerrDXvFnJtTwaX2hTv
         eAJz9ObSW7u+D4w0IpJyvUmLHZqrUdBt/6ZwCfSkLey8lV6nQ9iqm8H9hHJikukcuU/J
         4/GSGgs9QUdlcyjWYinSfkPQEjl+MCOVPAz9ikJe1BSYS50P9FIuyyToT5gp1QzgKLNG
         YmCvVmRRNgv3GUuqh97b0aTVAtBg8JwyXLHKVdHfKqDzM8btHiFsE/k68yBzDOKy3MdV
         Dyr1jWJDgxziAqWKvrXwQfdrYm+fzqER4s4v0gy4j15Ykr6mD+CGzIlRwKu8t/5rskhK
         XAtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=c97VJYD2KTL5VTwF9f1QXCEUfFv1WTXSZwy7XFKpxpk=;
        fh=0X/Rl5nUmbQcxaZ9q1kaQxAkfnFnIY2wUiz0IFEOWY8=;
        b=Vtd31hJg1Amsnnt2qL1O/ODs0QkDTZgsDmmGGgOz2uqSgpm8vbgKVB3qhlwnbpLJzP
         dx2H4tTLh9QZbDjoM8zL3a0RZWAeCE7UDTtSQ2Z2LCgMiT/LjqbUFLw5Mkcyc74nV4ut
         lsrHQvim/Bx+aZxn6wUqrKCmkPptmx+H9hWzcFDZmFw0bqE8j/j7J6FkCrX145dGiz5O
         xspddcrbSAdPtuAgo2joN/v540VDuJWLUprKR3XzVDPVrcQ0xNCunB1e2pe4EwaX88BV
         qwQoZCqu7hmu8MDhx2UN6l9+eFDiL00hcf0QBfxdn7PuwpbpgMSXPy5s3Le6mgO7w1xO
         Xlgg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
X-Forwarded-Encrypted: i=0; AJvYcCXlDcxEVJ6aK5Vt9VbylJ9OGM/kspsBqIDdAFu9mPwonIHFhTWcZjx/JBmQEzCqcv1YpgPRcQjyAEf7ftWUkQg9CO1rZjLC4Gad0NhirfPukILo7pJ9K3qeyglgPytIx/9TEu0ve8lfBZ903FEGASRG6UrEZAp7jxIpGajaiHQZUpl2rG36zydGHnP8Xsbk6J8vYNoBxxT4sW4GAjlUB4LlRqgNeMXUh322w0JsMe7mLBaXfIJXUXxZVWZWXfRbs0C511DBn+mrZ3CP/qS80/mG7MxsEkcWUVq/LlAQYTrNDm5y3GdhHWBQLk26/rGTxajKVi/DB+hYFifB6rE=
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id e3-20020a81c143000000b005ff36788df2si7899623ywl.112.2024.02.01.08.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 08:21:30 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.674535.1049541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZnq-0002Us-F8; Thu, 01 Feb 2024 16:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674535.1049541; Thu, 01 Feb 2024 16:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZnq-0002Ul-B7; Thu, 01 Feb 2024 16:20:38 +0000
Received: by outflank-mailman (input) for mailman id 674535;
 Thu, 01 Feb 2024 16:20:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVZno-0002UK-Bz
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 16:20:36 +0000
Received: from gandalf.ozlabs.org (mail.ozlabs.org [2404:9400:2221:ea00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0e4465b-c11d-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 17:20:33 +0100 (CET)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TQkf30k39z4wcW;
 Fri,  2 Feb 2024 03:20:27 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TQkdZ2ZRRz4wcN;
 Fri,  2 Feb 2024 03:20:02 +1100 (AEDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d0e4465b-c11d-11ee-98f5-efadbce2ee36
Message-ID: <fcd5cf8a-68f7-45c4-a09f-e7870ed7ffa1@kaod.org>
Date: Thu, 1 Feb 2024 17:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/47] hw/arm/aspeed: use qemu_configure_nic_device()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao
 <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
References: <20240126173228.394202-1-dwmw2@infradead.org>
 <20240126173228.394202-23-dwmw2@infradead.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240126173228.394202-23-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: U6vDmeEGYz8B

On 1/26/24 18:24, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Acked-by: Cédric Le Goater <clg@kaod.org>

and

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index cc59176563..bed5e4f40b 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -356,7 +356,6 @@ static void aspeed_machine_init(MachineState *machine)
>       AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
>       AspeedSoCClass *sc;
>       int i;
> -    NICInfo *nd = &nd_table[0];
>   
>       bmc->soc = ASPEED_SOC(object_new(amc->soc_name));
>       object_property_add_child(OBJECT(machine), "soc", OBJECT(bmc->soc));
> @@ -371,10 +370,10 @@ static void aspeed_machine_init(MachineState *machine)
>                                &error_fatal);
>   
>       for (i = 0; i < sc->macs_num; i++) {
> -        if ((amc->macs_mask & (1 << i)) && nd->used) {
> -            qemu_check_nic_model(nd, TYPE_FTGMAC100);
> -            qdev_set_nic_properties(DEVICE(&bmc->soc->ftgmac100[i]), nd);
> -            nd++;
> +        if ((amc->macs_mask & (1 << i)) &&
> +            !qemu_configure_nic_device(DEVICE(&bmc->soc->ftgmac100[i]),
> +                                       true, NULL)) {
> +            break; /* No configs left; stop asking */
>           }
>       }
>   

