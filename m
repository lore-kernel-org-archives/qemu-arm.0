Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1302951ejk;
        Tue, 30 Jan 2024 23:08:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjhu/WsgKkN2N6NOzQpCCCeDze6JrVVRtOxPDZC4MIbMyJxNMJXJhCJ6OpLGQLnCgeSxkC
X-Received: by 2002:ac8:5a84:0:b0:42a:4350:64c7 with SMTP id c4-20020ac85a84000000b0042a435064c7mr950987qtc.68.1706684928792;
        Tue, 30 Jan 2024 23:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706684928; cv=none;
        d=google.com; s=arc-20160816;
        b=JpRBwFsyamsrIx0higCbXHqhAk0nDwzwxRi9LVgRsNGgI/5NfM7bdCaRXZVnusgjQC
         h35aYfPD2pGfnZFx1gxz0PSQjS6lteQbkMDttfk5Dx4Ok0PMvaSUp1k/IAwYCB3+MKq3
         20D3wKeVWEGSq00MViKb5zGtosMM/+EfLWeLsoUWX09EtYqu2MZdI9NWZ0AcVaMLqVtZ
         w/5QUbon0rmA1POkB4BUAPnvC79CjTKGcnHNCudGw+FWccvs9ld/ZL+ht6QafRhZ+ViC
         nyV3cEjTcJEB9qV6xBfxjl9uRX2AZXUIGgpHyU5Y/cym4OEFGDVdpDcho3VG0g651fdc
         9/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZsFfewjdQz3KyQi8H2vALHlt5tcxl47fZDn5dbDYUwY=;
        fh=WoFIaa4mHIxi8i+tJbjIEJRGZ/mGca2f9f6cQYI709o=;
        b=BNADPgrzsiIPmKQ2LmEv6yfFlhhEX7qQWsbF3Omvq0iFhq9W0QbH5jaHsypzcDdXNm
         harjRNztYhjtRIq/cf04LGfinA/VRtWL59FTLhNYimeC1eUynZvYFIuIagozIqz/55dt
         ffvZkoGPZfu7slckjNeoWjGMjw3cEK5JXgCp0qaCnq4h/wz9Ad7kmjCk7+cw8smTqM5U
         Y7kl2QrmGXkyRhv5A5KB3y8rXGlIRHP+f2US3YHYcw1L2S/sPsckBhpoAHe8EDuhrxov
         OuiKvfcdI2JwK3T57k32yB2n/t2ltusUoS2S006S+JBuoFyqVTVzWrd7mJ70itlD9F2M
         wenQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jm9Vw6QA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020ac87dc4000000b0042ab1af98a8si3897499qte.387.2024.01.30.23.08.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 23:08:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jm9Vw6QA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rV4iA-0001Co-Qx; Wed, 31 Jan 2024 02:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rV4iA-0001Cf-2u
 for qemu-arm@nongnu.org; Wed, 31 Jan 2024 02:08:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rV4hu-00043g-HC
 for qemu-arm@nongnu.org; Wed, 31 Jan 2024 02:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706684905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZsFfewjdQz3KyQi8H2vALHlt5tcxl47fZDn5dbDYUwY=;
 b=Jm9Vw6QAQZ50YZeJ/L7BY8vHul/1MHtM7j1+fVmwP4GsFkhhkwMwZUH8O+1LSb519DJLJu
 f6hNWSvlD3cfJkqkpwCAchBs835Bs1Bg5X9ChrXrpbRAHURDCaoMsDmaqtzqctzACBeOSq
 XoZRUUyW2p1E7yoiimYsoxo2O5EPO18=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-dIMkAZisMv2aRaFLNAfKvw-1; Wed, 31 Jan 2024 02:08:23 -0500
X-MC-Unique: dIMkAZisMv2aRaFLNAfKvw-1
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-4bfe79255c8so359445e0c.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 23:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706684903; x=1707289703;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZsFfewjdQz3KyQi8H2vALHlt5tcxl47fZDn5dbDYUwY=;
 b=FWb1pFhE6TY9uddrOuIRveQLjxtBQNwHlPy2yFEX8bzzCrZWwXHjjg7c9vRLBAPN9J
 8n2OW3xg/60t3KDF9jcMdEjGz6veNPmKdVv7Z01woBLYg0uWpWix02F9pW3/GggsrDzn
 LFXjsVFXZgvSzcZ/q7Ti1JWQ6R41WT8eI230HbP5cOoJatc8JsGpFanHiBaIqR4uDkYI
 J5fXtm2Ppen13nI65V8pLxR46V6B2+1FcTXor0C/4bsGCtV0uj/Q8kQ1zM1dGb/yU9O1
 3suRDzMwFodAnIi0iQKb0C2/jCRgCdmEOHwcOyVGpMHz6J+W59FOfWhAlb0ltvR6eKJ+
 ZTrw==
X-Gm-Message-State: AOJu0YxKjCfTrP+1E1Ms6ChKNOeSLWoqxWIcjLxKu3vlrU2axyZP2pQa
 C8X3TCNSEXlbYQJZ3L6IEHG6s32lqcc3wqfznmEPD2uJvFHPWZ4FW4KnceCXJP5IRbxLotZZY0w
 o5fth9O5jTQyMxxwyHj346jlGwymeY9G0eH1Hkw2Vi2ncWqwnuw==
X-Received: by 2002:a05:6122:4482:b0:4bd:6e14:f1fd with SMTP id
 cz2-20020a056122448200b004bd6e14f1fdmr692244vkb.13.1706684903325; 
 Tue, 30 Jan 2024 23:08:23 -0800 (PST)
X-Received: by 2002:a05:6122:4482:b0:4bd:6e14:f1fd with SMTP id
 cz2-20020a056122448200b004bd6e14f1fdmr692231vkb.13.1706684903040; 
 Tue, 30 Jan 2024 23:08:23 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-196.web.vodafone.de.
 [109.43.177.196]) by smtp.gmail.com with ESMTPSA id
 kf4-20020a056214524400b006837a012417sm5280480qvb.51.2024.01.30.23.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 23:08:22 -0800 (PST)
Message-ID: <c6d9050a-80f2-4b0b-b47f-81cb3df257ea@redhat.com>
Date: Wed, 31 Jan 2024 08:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/47] hw/arm/npcm7xx: use qemu_configure_nic_device,
 allow emc0/emc1 as aliases
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
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
 <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
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
 Weiwei Li <liwei1518@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20240126173228.394202-1-dwmw2@infradead.org>
 <20240126173228.394202-29-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240126173228.394202-29-dwmw2@infradead.org>
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: AfqT9spKxUDK

On 26/01/2024 18.25, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Also update the test to specify which device to attach the test socket
> to, and remove the comment lamenting the fact that we can't do so.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/arm/npcm7xx.c               | 16 +++++++++-------
>   tests/qtest/npcm7xx_emc-test.c | 18 ++++--------------
>   2 files changed, 13 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index 15ff21d047..ee395864e4 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -655,8 +655,9 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>   
>       /*
>        * EMC Modules. Cannot fail.
> -     * The mapping of the device to its netdev backend works as follows:
> -     * emc[i] = nd_table[i]
> +     * Use the available NIC configurations in order, allowing 'emc0' and
> +     * 'emc1' to by used as aliases for the model= parameter to override.
> +     *
>        * This works around the inability to specify the netdev property for the
>        * emc device: it's not pluggable and thus the -device option can't be
>        * used.
> @@ -664,12 +665,13 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>       QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_emc_addr) != ARRAY_SIZE(s->emc));
>       QEMU_BUILD_BUG_ON(ARRAY_SIZE(s->emc) != 2);
>       for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
> -        s->emc[i].emc_num = i;
>           SysBusDevice *sbd = SYS_BUS_DEVICE(&s->emc[i]);
> -        if (nd_table[i].used) {
> -            qemu_check_nic_model(&nd_table[i], TYPE_NPCM7XX_EMC);
> -            qdev_set_nic_properties(DEVICE(sbd), &nd_table[i]);
> -        }
> +        char alias[6];
> +
> +        s->emc[i].emc_num = i;
> +        snprintf(alias, sizeof(alias), "emc%u", i);
> +        qemu_configure_nic_device(DEVICE(sbd), true, alias);
> +
>           /*
>            * The device exists regardless of whether it's connected to a QEMU
>            * netdev backend. So always instantiate it even if there is no
> diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
> index b046f1d76a..f7646fae2c 100644
> --- a/tests/qtest/npcm7xx_emc-test.c
> +++ b/tests/qtest/npcm7xx_emc-test.c
> @@ -225,21 +225,11 @@ static int *packet_test_init(int module_num, GString *cmd_line)
>       g_assert_cmpint(ret, != , -1);
>   
>       /*
> -     * KISS and use -nic. We specify two nics (both emc{0,1}) because there's
> -     * currently no way to specify only emc1: The driver implicitly relies on
> -     * emc[i] == nd_table[i].
> +     * KISS and use -nic. The driver accepts 'emc0' and 'emc1' as aliases
> +     * in the 'model' field to specify the device to match.
>        */
> -    if (module_num == 0) {
> -        g_string_append_printf(cmd_line,
> -                               " -nic socket,fd=%d,model=" TYPE_NPCM7XX_EMC " "
> -                               " -nic user,model=" TYPE_NPCM7XX_EMC " ",
> -                               test_sockets[1]);
> -    } else {
> -        g_string_append_printf(cmd_line,
> -                               " -nic user,model=" TYPE_NPCM7XX_EMC " "
> -                               " -nic socket,fd=%d,model=" TYPE_NPCM7XX_EMC " ",
> -                               test_sockets[1]);
> -    }
> +    g_string_append_printf(cmd_line, " -nic socket,fd=%d,model=emc%d ",
> +                           test_sockets[1], module_num);
>   
>       g_test_queue_destroy(packet_test_clear, test_sockets);
>       return test_sockets;

I like the idea to use the alias to configure a certain on-board NIC :-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

