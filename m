Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp887465ejc;
        Fri, 26 Jan 2024 05:54:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK7+dn0LGq3ees7RN2EQ/1XMvuZBtiD1crornuEPPukyPNfZ6bgAX0mWAP7DOqoY5bO21i
X-Received: by 2002:a05:620a:5605:b0:783:ab07:4611 with SMTP id vu5-20020a05620a560500b00783ab074611mr1510947qkn.6.1706277297456;
        Fri, 26 Jan 2024 05:54:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706277297; cv=none;
        d=google.com; s=arc-20160816;
        b=kiMMyrasH/H8VsnLQYVxPAgZa43WW/XpIwb3PtgPs2cG1Gl718vyF6RngBETa36+XQ
         thYa4Db4LREYzkd2EoDilzb9xxpW/3/tEKuc3MgL3gWazJSyWalKsWjZyMYsBcUAGsfd
         TEZ37XQdfTGPsBWoxC/dQ8+diZGgDStz3dj7R/PCTKKgrbgN9h/YZT0jrrVgLcnWDnyv
         reVJ4Rcm3JpLE9C45uR4481mDMQqqKGiSJ3xIi1g6/VaejX42QyMg2uFb8BjlpWyCtt0
         cved4XvaNOpf0TJzB7MqY9cF9AVCK9zCZh5gzK2tcA2Ya8RSf5Hmx6iceU2YwqB2Cw2b
         gXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=9VRYilH8wo0GPEGOXIjrsT5q+mrKJOAq11IXLPYRxTw=;
        fh=qaitVn3CqZfU6hyKoPn5hCqxlgT4S9GHz9nfyPTF7Jc=;
        b=Ynp9hjulCrwv4spRlcG8Zfzv9jr/AobsgzOYh/v9ZPGxwlrU71HaE+8IGgv1vUCbbT
         iwaTECk95JsZXN/zx1diftmZ9+wR9vUfev0FkU577ws/t7pL0UoOfJrQsQKkQdTM+lCL
         KDn/OmU5/IzjWDlvsyEdZwrXBTmhE5cfJbjXvW+LONX7Nk5dFHU9GZ3me+npEG6bpD4U
         WgL6pIF41SDLlAdhpLsDNHkIO+xi7ja10kH7bCA3dI1eyYIfoVi/wcaIj3NW10ZsUBag
         lpQWzaA6+2kYoKnLmtMSa3gZNXv6vdkswyy11eH6jJQsyBmXS1DHN7rV6WiUHC/gv2Yg
         pBIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vn6mM9aK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2-20020a05620a22a200b0078329ed2894si1293515qkh.525.2024.01.26.05.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 05:54:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vn6mM9aK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTMf1-00030c-8k; Fri, 26 Jan 2024 08:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTMes-0002z4-Do
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 08:54:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTMeq-0005IE-FD
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 08:54:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706277251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9VRYilH8wo0GPEGOXIjrsT5q+mrKJOAq11IXLPYRxTw=;
 b=Vn6mM9aKxmJhtq95bUYO0wlqAXHVl+JBDJCPnAPwkpI1TVF6h6HbSGnYBtVbayvtY09LKi
 TNsj4CaZXbGzifoJ7xIPSsFajXKV/h15U4jnEsHoJRbVrqe30XmWCMsiqV1Xk/pFWheZ3B
 /sYHtkF3Doij/skecGaFyv13zMIz9XI=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-89XOQCs7N_S3dLnU8uZzhg-1; Fri, 26 Jan 2024 08:54:10 -0500
X-MC-Unique: 89XOQCs7N_S3dLnU8uZzhg-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3bde40011a9so491033b6e.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 05:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706277249; x=1706882049;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9VRYilH8wo0GPEGOXIjrsT5q+mrKJOAq11IXLPYRxTw=;
 b=f6uPtMf5btOT0EOYOUqPQ3WNfdQfO661++cVwUNUBQpGhAmgPn6CQrOy+/rafJ1Tsx
 DvqCjODOZqjIqd1fQRkRgeQ01y55UJnigVttUNvlhgrebfVDsb8BIJf1ZdJ6kvI7J/mS
 EJlrAIXfoKgrsHW1Z/BupD6DCG88CNTWodq2TPvsqSnnsjOK/u1N4auXf1vfN142k0/6
 1T0uPDVnPU4FwsHhJfeHVIqKafIQRR7Dd+ylN+tWrMsonOCxCKn55nndEt18z2R1+91v
 BPvzGLwmZEGuEwgUE1u1Fl75Jd5VDy/WNGD2DrUOzpC5pXrYXB3egPJMxh18KVmtySCn
 QzRg==
X-Gm-Message-State: AOJu0YxB+3vcpDJeqBqT/2hAcQYrQjAtEMyXgIcf+E9D14hNFHd+R2T3
 SJznyLZwtugUjBsEmZDbmJk80gGZlqQ5BWEbcnx/I2BMZuCZ0RoBG+R0Jj5ckxTk+Asv9JV605n
 i3EjgjUO2D/S8HvaCiKOo+q21Jq70ytyzHEcyd6JQwPCer/eKZQ==
X-Received: by 2002:a05:6808:1918:b0:3bd:a87a:bcbd with SMTP id
 bf24-20020a056808191800b003bda87abcbdmr1935210oib.39.1706277249633; 
 Fri, 26 Jan 2024 05:54:09 -0800 (PST)
X-Received: by 2002:a05:6808:1918:b0:3bd:a87a:bcbd with SMTP id
 bf24-20020a056808191800b003bda87abcbdmr1935168oib.39.1706277249364; 
 Fri, 26 Jan 2024 05:54:09 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 ck14-20020a05622a230e00b00429c9bf789fsm536259qtb.42.2024.01.26.05.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 05:54:08 -0800 (PST)
Message-ID: <531b0005-7308-4274-b357-33b699adc1cc@redhat.com>
Date: Fri, 26 Jan 2024 14:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/46] hw/mips/fuloong2e: use pci_init_nic_devices()
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
 <20240108204909.564514-13-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240108204909.564514-13-dwmw2@infradead.org>
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
X-TUID: QxRo7fMzhJKn

On 08/01/2024 21.26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The previous behaviour was: *if* the first NIC specified on the command
> line was an RTL8139 (or unspecified model) then it gets assigned to PCI
> slot 7, which is where the Fuloong board had an RTL8139. All other
> devices (including the first, if it was specified a anything other then
> an rtl8319) get dynamically assigned on the bus.
> 
> The new behaviour is subtly different: If the first NIC was given a
> specific model *other* than rtl8139, and a subsequent NIC was not,
> then the rtl8139 (or unspecified) NIC will go to slot 7 and the rest
> will be dynamically assigned.

Sounds fine for me ... Philippe, what do you think?

Reviewed-by: Thomas Huth <thuth@redhat.com>


> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/mips/fuloong2e.c | 16 +++-------------
>   1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 97b2c8ed8e..a45aac368c 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -201,19 +201,9 @@ static void main_cpu_reset(void *opaque)
>   /* Network support */
>   static void network_init(PCIBus *pci_bus)
>   {
> -    int i;
> -
> -    for (i = 0; i < nb_nics; i++) {
> -        NICInfo *nd = &nd_table[i];
> -        const char *default_devaddr = NULL;
> -
> -        if (i == 0 && (!nd->model || strcmp(nd->model, "rtl8139") == 0)) {
> -            /* The Fuloong board has a RTL8139 card using PCI SLOT 7 */
> -            default_devaddr = "07";
> -        }
> -
> -        pci_nic_init_nofail(nd, pci_bus, "rtl8139", default_devaddr);
> -    }
> +    /* The Fuloong board has a RTL8139 card using PCI SLOT 7 */
> +    pci_init_nic_in_slot(pci_bus, "rtl8139", NULL, "07");
> +    pci_init_nic_devices(pci_bus, "rtl8139");
>   }
>   
>   static void mips_fuloong2e_init(MachineState *machine)

