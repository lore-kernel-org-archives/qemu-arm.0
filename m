Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp938282ejc;
        Fri, 26 Jan 2024 07:15:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2+IXWq56F9NIrjUNOZ3CrSnpaImSa4Y/GlnmzORS37MgQEgtQ50MeM9POeunJFRcj16MF
X-Received: by 2002:a05:6214:5008:b0:680:c7ba:e9f5 with SMTP id jo8-20020a056214500800b00680c7bae9f5mr1746596qvb.113.1706282119445;
        Fri, 26 Jan 2024 07:15:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706282119; cv=none;
        d=google.com; s=arc-20160816;
        b=jBXJcjKwcN/RRr5GJsnSRjKdSg6dVUTj1TJyNJImCRuIcutAAf00uu1shYkueCQAPJ
         2LA4ZSCC9rADn8SjWIWZcVsRca6x6mv3P2fhKU0hwitHZUim4B8OSNTf3cW9UoQNXhKS
         CoPdVJHeKPAAow1+5JI7MBYo0RJgjPjmaMGv4fxKgxyZKqrJV3ougrg5CaARFe02Mqvi
         n/dq9a4N7er3hJYhTwZv8vQm4AHtQlYBzAu0Zb9GDydM5U79hTPRrhTYmM94hvLxJEz1
         kutOHGRrot89tdNDqZBw1BkAcAjhuavaX5fO4EZzQHLqEZ6TIgW0a25pqhK4YFRhtEwR
         9O2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=kL1PV0GnD1ZAEVsxwMOt7B0OpiCtHZ0Bo2cILBnhl8Y=;
        fh=JtFLLZxez2AG9oOiMhrc5KKGcXMVPm7RdpXHHaNaDn0=;
        b=KPU7njR7M8DW7JINhCIFwobBct1LMqIIr6bmkQfhgT6nCYgIejPhR2VF+3YYRcTr8r
         AvhK2FzDkzetk+Mb5jyfGMvp96T+58ezHAVI0sAVPWQDuxf7rlW6AZhmODHVHIQZaPIx
         Ml71LZLXTqTfM3t4OZ01vNTGxd5dl0yaVA48izGyFHN95EYXSIVYeMmiNCvMZU0uJWPT
         w07TB/56SEOwaV/DKBr+x83lTxsd4a5rBj5qfeZG56jxMat5VjZuDzQNbYrbOQtw+HXa
         2+MyxI0xLALi+yG4C3Q+oNHr1WSJVnJBikFWKf8zAW/+HN471ux/xTeCYBljXGf1U3tt
         soIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HbOj7sVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj4-20020a056214528400b0067f9b995c84si1445389qvb.447.2024.01.26.07.15.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 07:15:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HbOj7sVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTNuv-0006GY-9O; Fri, 26 Jan 2024 10:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTNud-0005yu-Ac
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 10:14:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTNuZ-0002PU-6L
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 10:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706282069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kL1PV0GnD1ZAEVsxwMOt7B0OpiCtHZ0Bo2cILBnhl8Y=;
 b=HbOj7sVdSJaWjryED02dAa2BPktvMbaNmK+2lUgc/g4PA0M+7p4JtxXrbdXKtnolLEq/yL
 91TT354St/ZddeQyb4yabBBFLStamtK5yk2BCOhRf3I3JewWtU4BATl1uMEB/jCRU1ZzSo
 Kq7fOpzr4kqG/FbarypkyQulaRlAi1o=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-loewDK_FOYq0zxFlakX7UA-1; Fri, 26 Jan 2024 10:14:28 -0500
X-MC-Unique: loewDK_FOYq0zxFlakX7UA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-78346521232so75920385a.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 07:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706282067; x=1706886867;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kL1PV0GnD1ZAEVsxwMOt7B0OpiCtHZ0Bo2cILBnhl8Y=;
 b=wX7ydJF4h3oDqjpvrcJQlFY3xyPhQkElNbhb0kNjzoi4P7683TkK46obY8t5k/qeq1
 i0zS2AGmpSU5SlymbsRz4AAGWtie1dWV78SYW30HYyiJFwh99VHs3kVxY0vlNHMlZoRx
 tdCckYQwgYikgKZoUxEv0kJQSICeTByGyjpmS6dOJVeVegiDbnbVE7vde8eArj3Jt3wi
 j4y5RhPgYPLkpL6Ka1JYqCfFLk1E+1lpuDtpHDXpvdn8CUNpw7XgxrW5SiFoV2YnAJDr
 q8QR+7w+gRCcn2XXpAzc8yp091C8BPejr9y8iMESLMmPZqIAhQX5eJOS8QLX1j4J7CX8
 aMfA==
X-Gm-Message-State: AOJu0YweQSEkOkcp/zu3IXgbWABkWn68qFxjVLDWCQSBZg391fXDLwEM
 cud/tajZZwO+mhwcQ0gT6eBtKMUJGDWpXXw7uPKzRIPGRRVgknSsc6O9AVgnOz+RS8FDHTTh3sU
 yRCLIrwVMll5ZrUuG18X8/9CPEbyafDlN/fLDeApc1ixnZ2lkBg==
X-Received: by 2002:ae9:c217:0:b0:781:d911:7869 with SMTP id
 j23-20020ae9c217000000b00781d9117869mr1755537qkg.111.1706282067536; 
 Fri, 26 Jan 2024 07:14:27 -0800 (PST)
X-Received: by 2002:ae9:c217:0:b0:781:d911:7869 with SMTP id
 j23-20020ae9c217000000b00781d9117869mr1755473qkg.111.1706282067281; 
 Fri, 26 Jan 2024 07:14:27 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 r14-20020a05620a03ce00b00783255108d5sm639751qkm.50.2024.01.26.07.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 07:14:26 -0800 (PST)
Message-ID: <4acd6d32-acf1-4b2b-b535-fb5082d4fe4c@redhat.com>
Date: Fri, 26 Jan 2024 16:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/46] hw/net/smc91c111: use qemu_configure_nic_device()
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
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
 Max Filippov <jcmvbkbc@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-26-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240108204909.564514-26-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.313,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: +sZHaQzym0/F

On 08/01/2024 21.26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Some callers instantiate the device unconditionally, others will do so only
> if there is a NICInfo to go with it. This appears to be fairly random, but
> preserve the existing behaviour for now.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
...
> diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
> index 49b7c26102..702d0e8e83 100644
> --- a/hw/net/smc91c111.c
> +++ b/hw/net/smc91c111.c
> @@ -818,14 +818,13 @@ static void smc91c111_register_types(void)
>   
>   /* Legacy helper function.  Should go away when machine config files are
>      implemented.  */
> -void smc91c111_init(NICInfo *nd, uint32_t base, qemu_irq irq)
> +void smc91c111_init(uint32_t base, qemu_irq irq)
>   {
>       DeviceState *dev;
>       SysBusDevice *s;
>   
> -    qemu_check_nic_model(nd, "smc91c111");
>       dev = qdev_new(TYPE_SMC91C111);
> -    qdev_set_nic_properties(dev, nd);
> +    qemu_configure_nic_device(dev, true, NULL);

Wouldn't it be possible to use qemu_create_nic_device() here, too?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


>       s = SYS_BUS_DEVICE(dev);
>       sysbus_realize_and_unref(s, &error_fatal);
>       sysbus_mmio_map(s, 0, base);

