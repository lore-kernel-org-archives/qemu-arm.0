Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp979379ejc;
        Fri, 26 Jan 2024 08:20:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3bCsaDYPOOPcWfupNC0JyhgYB67YeHAxWXEUIQTNJU98zefS0C4lmyA5xXsbv8fGtTfZH
X-Received: by 2002:a05:6830:4ad:b0:6e0:d3cf:c318 with SMTP id l13-20020a05683004ad00b006e0d3cfc318mr1581587otd.18.1706286041523;
        Fri, 26 Jan 2024 08:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706286041; cv=none;
        d=google.com; s=arc-20160816;
        b=ezJGQDWrvTx5NpjKWy+l+a1w4ICXZwR3iW2q6Tt2pMZAIhEeLlkpB1g0rOHb7rnc9H
         FTld/tYfFGkr2voy8vZw+S6Rl7jGmHKVEqF+cJEUc3JrpxU0m37kqKniLvCF+PjmDTeY
         pT6KUjkJEI+hH/0Z+NHewRF3c91XVLihCQp1eoL71jweqy1FbTDqYuOMjWuyzB99GXlQ
         e/89r5qZwho71l9Ay+cWA5jLzdtky1+TrWHcKVFpyY+xeS0kZrGSMfemZDjjjlgabhQM
         wjElwgjdhwqwc/NehiXgNAV6goWLFya1wIF175clXHB0TyslsoBNq0+FId6HOS12eQO7
         Nqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=MRIjfaHeC/HCDOxGifaONkhJ6qMUTCsidTOpeocpbFI=;
        fh=qaitVn3CqZfU6hyKoPn5hCqxlgT4S9GHz9nfyPTF7Jc=;
        b=PudZqT+lXpE3WC+qdpXeMNRb3ECmFvTSbyDz3eTukRkBURgB8ZTPTLykXcFV95jNbU
         9SVYkpP4rHBeuhfezuDYQMReyWPSUVFk7aDSuVUE19rDhvep0PhBOsKNcCjdVj92l0Ye
         cHyFXelSQoK8+yp/xH56HwLYV7denMuvlh+ssw2ImjnRjH7CKfKvMF5yBwvDp+CkX2+3
         SbBqDLJWEg5inO+jt+QLLFw2IPBz5FOUfljC5fteGbk/GkXc0JYwEXg/QAP91f62u/Mj
         Rz3DgbQNjAkndIThMy8djS64RMwbjWWIXL4V/QNyv+XcUN2dC9zz9nToJKgqw2dSEgVH
         7ZOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=anKBuNF8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo9-20020ad45f09000000b0068173ad3ceesi1609480qvb.4.2024.01.26.08.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 08:20:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=anKBuNF8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTOwO-0007d4-WE; Fri, 26 Jan 2024 11:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTOwK-0007bh-BZ
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 11:20:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTOwH-0000HL-6X
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 11:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706286019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MRIjfaHeC/HCDOxGifaONkhJ6qMUTCsidTOpeocpbFI=;
 b=anKBuNF807ef8gqAtPXxpG6mZB8SmOD7n4zikeYGTVmDjIN6TVBjRIahZFPXgG+XUJAKFk
 nk4c6XRTSl1kMMX3Yf6hdqPcrwKe9QiwRbJA+cdoRRbISL4/mH4qj6BxxJyyiVDFJk1a0d
 bGux0UW9lohDq7x3NT4W9feIoHqOiwQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-agh97KGSO-GSeBC-ObM_0w-1; Fri, 26 Jan 2024 11:20:18 -0500
X-MC-Unique: agh97KGSO-GSeBC-ObM_0w-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6854ad24a0cso6817476d6.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 08:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706286018; x=1706890818;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MRIjfaHeC/HCDOxGifaONkhJ6qMUTCsidTOpeocpbFI=;
 b=BSWONzhfC3ssy7pEwQUIqLtlFO3gVIdZKErkr5vclTw7CV/gZ84X0yYqquleOnrGKY
 R2MyvwBq8knFmnVWufOyrvH6E4LNhgzm4Vp8M6PJ3qVR3kMSrAOZiauzoRwKBvfxUYgY
 rhTPAeko2K70mSs/ptDToFXFdy//JInk3KKA6eaRkByVIiWKXSo6kAZDBhDqFd7OfRey
 hHpU0vqbd/58muYUCRW3vD1LafsNVWXXMzOGA/SOfpFnwSq6gl7+witvhaCnFF/hqHTj
 jyl3lFaB7Cx89iep53YJIApB5Bn6fW6Iu0IP2mp+8LZ4+YYDEWfYvmXxZoqjeE+ng1rq
 N/CQ==
X-Gm-Message-State: AOJu0Yw6DD4DvgsXPvqvU93liynS4BcfcEX2EoAIFKrVWMOYbyVNnsgy
 8LpNJ5SS8FxGkLvjZtpTvV2jPC6F+lsEVaT4a77lhD/i0OQqpgyXEEZ/fOFNXAAWdcuDU1Iul9M
 n4bveQKsCFn5VSiZbrGeqPdB9fppoRsECDAStusOm0oVp0dmxOQ==
X-Received: by 2002:a05:6214:2481:b0:686:aa83:4cc with SMTP id
 gi1-20020a056214248100b00686aa8304ccmr116083qvb.16.1706286018000; 
 Fri, 26 Jan 2024 08:20:18 -0800 (PST)
X-Received: by 2002:a05:6214:2481:b0:686:aa83:4cc with SMTP id
 gi1-20020a056214248100b00686aa8304ccmr116030qvb.16.1706286017691; 
 Fri, 26 Jan 2024 08:20:17 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 om12-20020a0562143d8c00b006869bae3b11sm632416qvb.35.2024.01.26.08.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 08:20:17 -0800 (PST)
Message-ID: <80fe8746-3b93-41c7-bd53-13bd8dac9471@redhat.com>
Date: Fri, 26 Jan 2024 17:20:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 35/46] hw/mips/mipssim: use qemu_create_nic_device()
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
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
 <20240108204909.564514-36-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240108204909.564514-36-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.313,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: HL4gy6sez+sH

On 08/01/2024 21.27, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The MIPS SIM platform instantiates its NIC only if a corresponding
> configuration exists for it. Use qemu_create_nic_device() function for
> that.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/mips/mipssim.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
> index 01e323904d..16af31648e 100644
> --- a/hw/mips/mipssim.c
> +++ b/hw/mips/mipssim.c
> @@ -118,13 +118,15 @@ static void main_cpu_reset(void *opaque)
>       }
>   }
>   
> -static void mipsnet_init(int base, qemu_irq irq, NICInfo *nd)
> +static void mipsnet_init(int base, qemu_irq irq)
>   {
>       DeviceState *dev;
>       SysBusDevice *s;
>   
> -    dev = qdev_new("mipsnet");
> -    qdev_set_nic_properties(dev, nd);
> +    dev = qemu_create_nic_device("mipsnet", true, NULL);
> +    if (!dev) {
> +        return;
> +    }
>   
>       s = SYS_BUS_DEVICE(dev);
>       sysbus_realize_and_unref(s, &error_fatal);
> @@ -225,9 +227,8 @@ mips_mipssim_init(MachineState *machine)
>                         sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
>       }
>   
> -    if (nd_table[0].used)
> -        /* MIPSnet uses the MIPS CPU INT0, which is interrupt 2. */
> -        mipsnet_init(0x4200, env->irq[2], &nd_table[0]);
> +    /* MIPSnet uses the MIPS CPU INT0, which is interrupt 2. */
> +    mipsnet_init(0x4200, env->irq[2]);
>   }
>   
>   static void mips_mipssim_machine_init(MachineClass *mc)

Reviewed-by: Thomas Huth <thuth@redhat.com>

