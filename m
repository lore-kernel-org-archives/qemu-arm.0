Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1014526ejq;
        Thu, 9 Nov 2023 23:41:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyLSeTZnm/xUF+TKKRIRapUH7ecYQYtZ1gRrlNsymBeI7BArloXIhVWJs35Hs0kW0nI+0M
X-Received: by 2002:a05:622a:1485:b0:421:b22b:ad72 with SMTP id t5-20020a05622a148500b00421b22bad72mr1120951qtx.31.1699602067801;
        Thu, 09 Nov 2023 23:41:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699602067; cv=none;
        d=google.com; s=arc-20160816;
        b=hFxMKsUgfXqDPYgql8yZwfnboe1uMui0lvq5HK7qsHr8wS+vPMm/k7I8rgLATgdL0S
         0YP18fztrCsRkCi1hjrvIn8GoEQGlTo5LFWt/7kQONurduLOUdKEDt/YRw4LybGFmI+K
         dIcnpplH+F2iokJsh+cG9A4ALDdDe8jDrwh3i8ieft8PMF5PK+RKjbhhE3N3lqunTyLI
         /dFcKQMVZspbocIfqCmwgs1nV7opjXQMvCO3XEMu0aV1eFIvHItdPAVekIDBQHjdafdB
         7wFrCI5/B/UQOrqo51EuLtmJsYxwx8jWZixX3e8xJ3CJnoOHPv9FUDqn2QcLhiVOExA4
         Lm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=w1cQVy8Tdk0u30Y5Hhr0erXikh+ihShfX7wQfHbqGoc=;
        fh=/CP7aoBTIqKSz+QDTa5OWEpEfv2C3ZslwzbUFZX7htc=;
        b=chIZlf3+0uUinR9sJ1JViF6XJI5gpv+q7vaqWmhIBnqDxo/WEMJql8AlMIZ62tg/+F
         sCXM33d69eDkc0GOcWLtH+Q/ON33N4PzcCZAYCbuhVvKC4vlb20FxA7GSvan62nLpJ8E
         FF4i6GlrYcfTGXJF3q4Mu/8Mn1JoscuEZXGDviLBX5/1Y0PS5+VXuhQ07nnEsS6YYpYa
         5PevtzC54Lyh+VFBCwKjCpuccuYDiie2h6btbp9+j0uIz2HDt5TUeWdOTh5OqKtGhkc6
         TSK1rcX/Oo68jFqs4U9f8id+dA8dq1sRVHOQv8BCjK88tooBz34T0mNfw3enzSIimHaF
         1MFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVZQ5KJT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020ac85793000000b004198816340esi4057772qta.662.2023.11.09.23.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Nov 2023 23:41:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVZQ5KJT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1M86-0005zj-LF; Fri, 10 Nov 2023 02:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1M83-0005x4-7O
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 02:40:35 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1M7z-0000Vd-Ms
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 02:40:34 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9e62ab773f1so48444466b.0
 for <qemu-arm@nongnu.org>; Thu, 09 Nov 2023 23:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699602030; x=1700206830; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w1cQVy8Tdk0u30Y5Hhr0erXikh+ihShfX7wQfHbqGoc=;
 b=EVZQ5KJTan5SjybH/nswY3T9SefEDfekfkrBj9a/ZkNCjb+SrjDy6/lyTp8mwAZhD/
 87swST3f5VAQLd6Mi1tvifFJ0XsDMb8bdY+aJ22cp0b0MVwuTr0n/58I4OF3yA587A6w
 /Eyx7qlG6sYjAnwQY7mJ9f+f3TPiAEljNt1wjH1pgHvFUQYlbNn8EaJ7YnPrICx/ysjc
 GZYHOTAfA4HwdTcqVHdx/cygNVEk/9JsetmFfo3MZl+5wDz4iUJ7O3vA0L4IxXJE6SFH
 UYPWprBkjqQ+aLvnaVzNXcS8uzoRG7U+cdNg0BMbUxAEdXgn39s1eTUDDXKf9z2ZWXAi
 LNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699602030; x=1700206830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w1cQVy8Tdk0u30Y5Hhr0erXikh+ihShfX7wQfHbqGoc=;
 b=ol6Er7pzDqGsvmTUD8UI2xhwvEyXTdiBZV280hKp+AotYItOnb+FzpvSrMbwopMBSB
 foyu8tZpwG60ocyvf0itVf//QonLjLisQnT7dWM1axPOIK5BjhpyNgpGFp7HwenPJqCF
 PLhBnrjCi7/zcsH41g9x7vFoK4IvvutpAxp/gLBewBGarGCKQXIK+mvbTKwEM45hFW7Q
 znJdOpJ39nMiomsKmfCI/eqd9FSM9YClLfIyRD2bR0YHw+Bi3If2jFWryEpQbkslYKRw
 +vnITObQv+yQCbJQzZVtmscmpl3VvpfumLeI9cbjUIcm2qv0qjBW41SOR3+RvyvDFks5
 QFEA==
X-Gm-Message-State: AOJu0YwvmzKH6zAjM3zdL7UDW1m3RcoIj0EsZAJHYYxPzfgIDtD9UHEK
 9hECtEH2yif4hsMMEqodvzVV/g==
X-Received: by 2002:a17:907:9287:b0:9c7:5a01:ffec with SMTP id
 bw7-20020a170907928700b009c75a01ffecmr6368674ejc.0.1699602029914; 
 Thu, 09 Nov 2023 23:40:29 -0800 (PST)
Received: from [192.168.69.115] ([176.187.194.109])
 by smtp.gmail.com with ESMTPSA id
 qt19-20020a170906ecf300b009a1be9c29d7sm3567178ejb.179.2023.11.09.23.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 23:40:29 -0800 (PST)
Message-ID: <34e2c0c6-4e04-486a-8e1f-4afdc461a5d4@linaro.org>
Date: Fri, 10 Nov 2023 08:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.3 v2 05/46] hw/i386/pc: use qemu_get_nic_info() and
 pci_init_nic_devices()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
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
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20231106195352.301038-1-dwmw2@infradead.org>
 <20231106195352.301038-6-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231106195352.301038-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Dm9JiKyy+DiN

Hi David,

+Markus/Bernhard

On 6/11/23 20:49, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Eliminate direct access to nd_table[] and nb_nics by processing the the
> Xen and ISA NICs first and then calling pci_init_nic_devices() for the
> rest.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   hw/i386/pc.c                | 26 ++++++++++++++++----------
>   include/hw/net/ne2000-isa.h |  2 --
>   2 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c2bc3fa52d..4078d2d231 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -652,8 +652,11 @@ static void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
>   {
>       static int nb_ne2k = 0;
>   
> -    if (nb_ne2k == NE2000_NB_MAX)
> +    if (nb_ne2k == NE2000_NB_MAX) {
> +        error_setg(&error_fatal,

In the context of dynamically created machines I'd rather have
this function,

> +                   "maximum number of ISA NE2000 devices exceeded");
>           return;
> +    }
>       isa_ne2000_init(bus, ne2000_io[nb_ne2k],
>                       ne2000_irq[nb_ne2k], nd);
>       nb_ne2k++;
> @@ -1291,23 +1294,26 @@ void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus,
>                    BusState *xen_bus)
>   {
>       MachineClass *mc = MACHINE_CLASS(pcmc);
> -    int i;
> +    bool default_is_ne2k = g_str_equal(mc->default_nic, TYPE_ISA_NE2000);
> +    NICInfo *nd;
>   
>       rom_set_order_override(FW_CFG_ORDER_OVERRIDE_NIC);
> -    for (i = 0; i < nb_nics; i++) {
> -        NICInfo *nd = &nd_table[i];
> -        const char *model = nd->model ? nd->model : mc->default_nic;
>   
> -        if (xen_bus && (!nd->model || g_str_equal(model, "xen-net-device"))) {
> +    if (xen_bus) {
> +        while (nc = qemu_find_nic_info("xen-net-device", true, NULL)) {
>               DeviceState *dev = qdev_new("xen-net-device");
>               qdev_set_nic_properties(dev, nd);
>               qdev_realize_and_unref(dev, xen_bus, &error_fatal);

and this one non-fatal (primarily for API example). But this is pending
on a discussion on another thread, see:
https://lore.kernel.org/qemu-devel/c1322f3b-2ae2-4ca7-9a76-a2a434dc8315@linaro.org/
so no changed requested so far.

> -        } else if (g_str_equal(model, "ne2k_isa")) {
> -            pc_init_ne2k_isa(isa_bus, nd);
> -        } else {
> -            pci_nic_init_nofail(nd, pci_bus, model, NULL);
>           }
>       }

Regards,

Phil.
