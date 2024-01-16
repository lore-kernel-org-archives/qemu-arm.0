Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp877462ejf;
        Tue, 16 Jan 2024 05:33:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZA5nk7OuS8lUPbnDKzo2gVml+W94b79EDWL9/RciKxfwuEEhoOwYjivXxR8O83cSWELF/
X-Received: by 2002:a05:622a:144b:b0:429:a053:e0a1 with SMTP id v11-20020a05622a144b00b00429a053e0a1mr8756628qtx.16.1705412002042;
        Tue, 16 Jan 2024 05:33:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705412002; cv=none;
        d=google.com; s=arc-20160816;
        b=QO73iKtGnVhW49NxwLTKZf/bnzuqEHH4zDP0jiXP/zXLEcupLFgocDZcRmMzYVfJzb
         N/74qUYBdPD8yVl3M/nIGPfoC6n6B7u80R6gNbqUTiW8Ec0pNuaYOY6L8MIzJfffNZ0K
         jaVqRQSphYFpQixrkJk7Wy/fZHjHoj3zududUL2fb//TZicn6pzYkvWZ/OrwtIKFK3Ya
         0QIzgeqdeAbV1vUEBnkawG6Fp9OjKRjAmtbXcrSepQgte0Up4k5rThMr4rsNyb0YROVC
         +URJJqanBxa3v0xBrrQ8R8htbHZucawL+IeSqcK3ULa1SJl2Uo+HjCsWOei9nKcLr6Fw
         dHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=HEnnD4Q/PDI8hTiU5DZ3K9z2cb3AhTL1wQ0WRQnqbH0=;
        fh=VZL1zOqRyvoHTGU2zZCCV911EsNM/fLs+wQCvGvuQOM=;
        b=Fhycie+o+uiXKD+0Kpkvq5E5jd6xTxq/rC4joeE6sglAUI7+nkGBwGjkrka5OB5BKH
         I2yyApQtbAn4go3eI8AMlBOvYf54XGzoIgEdW1NdaMBborRGe331wAti8wQo+jgJmtRx
         8YKP3hitEizLV0aKB6EJfu5ZqzKoz5p7WL9aj1BuYhtSHqogZwkFr1joq7XX2YOiGGP6
         gno3hTw5VNutMIuarxojlscHJzYBgUedKWINV77n4D55K0ra2F/YWIIqsDUYvk764wPJ
         cLNgFfJMwEC+axbsmKNEPWU4Ua+dyh7bcCxcV8HzVgT3RHzAUo4vkMVt3vrRyJrcvRMt
         4zgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6-20020a05622a060600b004299cbc2a95si10002327qta.493.2024.01.16.05.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 05:33:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPjZ5-0004pa-R9; Tue, 16 Jan 2024 08:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=FuRj=I2=kaod.org=clg@ozlabs.org>)
 id 1rPjYy-0004mN-46; Tue, 16 Jan 2024 08:33:11 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=FuRj=I2=kaod.org=clg@ozlabs.org>)
 id 1rPjYu-00055N-Gd; Tue, 16 Jan 2024 08:33:06 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TDqh606Szz4xMC;
 Wed, 17 Jan 2024 00:32:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TDqgg0ccfz4x3G;
 Wed, 17 Jan 2024 00:32:30 +1100 (AEDT)
Message-ID: <60730ed3-9225-4b78-a44e-99b8016a2f08@kaod.org>
Date: Tue, 16 Jan 2024 14:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/46] hw/arm/aspeed: use qemu_configure_nic_device()
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
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-23-dwmw2@infradead.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240108204909.564514-23-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=FuRj=I2=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h2wvpCuwBnWk

On 1/8/24 21:26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
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

Acked-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


