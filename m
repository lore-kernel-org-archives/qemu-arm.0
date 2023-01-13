Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp563846ejc;
        Fri, 13 Jan 2023 09:43:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuVRe2fmgd3chCq5CqRhrEWpuLeyFW2N32Wec3TMwML1gHZcOyISXaC8kL214gLfBiPxQEl
X-Received: by 2002:a1f:2f12:0:b0:3cc:608f:3239 with SMTP id v18-20020a1f2f12000000b003cc608f3239mr41001194vkv.3.1673631813764;
        Fri, 13 Jan 2023 09:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673631813; cv=none;
        d=google.com; s=arc-20160816;
        b=KlwSc3Trn5qpZqdqTzG5iADvhDSW6u/wBfSbEc7nnOeIJhD1jfQnLTmI71vB+UnJCk
         hfhh45N4T0nTDHhsu9TUxRUofqmbKOuilil3yVk13bTgCwFGn7WVqV3hukpl+EkPbOax
         yKnK/Gw4vqhx14bJdlh1Cfy3qCfA0/HJHNB0xxJhaFgkO2g9Dpab3MH+M+DL/J8DPNDH
         IOPZOGMUcIXsqZDAb9vT56Mc4ROpmA0p6HnQkUl3M7KIbhLTyvshBQDMHOGdYrDhFCAf
         VAmOyr3yq5UM93E5dQgOLuG8R6tVpafsicz7qC2bJMOMNNwtwdsQuphbJy9qYnOZHmgL
         Jbwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=a4gsTQIvLj7ZT9NxoFXotiU6l+tlKKcOwFH7nkSFJwU=;
        b=Jjgne+WK0hrv2/AH0xOQpJmX/epaTsGk1LNmqf8rM8EqotpmM4juKWRM5sq3NK5pB1
         pmQPI11CTpVVZgtCtfVY/fE8nG/jgwK5gDAbOOE2XPyAL7BlA0o5spiU8gCVviz784/u
         bJMSpED0IsRnQPL1CzAgbbBXjG0Du4xdJBHCkNs496dAfmzUqeRU9uh+00KMUZWvFIEP
         5wu9M341mYIuFtMyxk3af5dMdUb2FMiucQ7pCxvR+UoxHTUAAIXhqFgxOb8dC8aRa9Gs
         fQAQcRC3sDB/FezYPWiWjdkCzQdnl6xaSR/hBn/08MGvySkp3BdSn76Mq7I/TcRiXlxv
         X3YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=T5xWv6wN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs40-20020a05620a472800b006fa299566afsi12417666qkb.568.2023.01.13.09.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 09:43:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=T5xWv6wN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pGO26-0006xu-7f; Fri, 13 Jan 2023 12:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pGO23-0006rB-F5; Fri, 13 Jan 2023 12:39:59 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pGO21-0006Wn-RY; Fri, 13 Jan 2023 12:39:59 -0500
Received: by mail-ej1-x631.google.com with SMTP id hw16so42097925ejc.10;
 Fri, 13 Jan 2023 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4gsTQIvLj7ZT9NxoFXotiU6l+tlKKcOwFH7nkSFJwU=;
 b=T5xWv6wNHbWxLgyWvbY0mBiyBQH8wbj+40rtDmBoQ/luKORKGweGx3/tdXIIhJYDZi
 cXwp78t62w7waP47pLt+/tjWHvXL9HKc5kkrWpPyicMCeF0TL5f8BicmlqWNKw/vqMEE
 M73MLL0UO/vz1rBSFKMjIZvqYknp8Lcr67oq5t2FeZvjQOJh0O8SaR8XjBuDg3GNu/2z
 pAqmkcEchhQ+O7ohyvqq20VPJxN1rBZZIs767rnndd4iYXb/hPkds/SJUwW7WQOWsNXq
 HBZPjOaiyxAnho4GGLQix4zcOMZHKZjvp5AreetMYt9Cjj2VCXZQslKo0ZYJF3RojKT1
 Cf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a4gsTQIvLj7ZT9NxoFXotiU6l+tlKKcOwFH7nkSFJwU=;
 b=6LxH5rykSh6mPkT78YrFWYEjz0d/SYv3qDpKp0UgU5U/qxhZuLMGaJMC2klE/ilm1v
 3vt+m8IngxyrB0S3Kx64tkExPq+1gCPz43zv+pjIp3y58JISZAFE4BMcz7OJ9cdshvei
 9wl+6peeeEESDfV4P13R5hCzmqJ58I7Wct5uQdzXbSPDnX2nSUAevgp/D1ghCA8qM9mU
 yW5mMvdNIvs8TbKtLMDOmVVCYXkjOloIfKrE7W+jqoIAUkCzgDTaK+zsP5xGPL8g11Cj
 FcJTKmbDHtFFcg+obon8hWs/ythPK+szf//yUA7hXPJ53+BQwAOuJUfCwocPwXVbPDTn
 +exg==
X-Gm-Message-State: AFqh2kqKejPA2w1HdpaOGaBdjwv6DzOwHlJfukLqUG6wMhcwD4qgFEkl
 vblIH7TGTatvkZJqqwPKA98=
X-Received: by 2002:a17:907:d044:b0:84d:328b:1b3e with SMTP id
 vb4-20020a170907d04400b0084d328b1b3emr4366453ejc.57.1673631592087; 
 Fri, 13 Jan 2023 09:39:52 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-135-037.89.12.pool.telefonica.de.
 [89.12.135.37]) by smtp.gmail.com with ESMTPSA id
 g3-20020a1709067c4300b007c0a7286ac8sm8792658ejp.69.2023.01.13.09.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 09:39:51 -0800 (PST)
Date: Fri, 13 Jan 2023 17:39:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v6 00/33] Consolidate PIIX south bridges
In-Reply-To: <211e791a-9d37-9655-ca93-9e3bda2e21c3@linaro.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <211e791a-9d37-9655-ca93-9e3bda2e21c3@linaro.org>
Message-ID: <6D8095E7-E540-4D7E-B976-D71522F8664A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: u6hNJ3alkQv9



Am 13=2E Januar 2023 08:46:53 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>Hi Bernhard,
>
>On 9/1/23 18:23, Bernhard Beschow wrote:
>> This series consolidates the implementations of the PIIX3 and PIIX4 sou=
th
>> bridges and is an extended version of [1]=2E The motivation is to share=
 as much
>> code as possible and to bring both device models to feature parity such=
 that
>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc mach=
ine=2E This
>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on=
 this
>> list before=2E
>
>> Bernhard Beschow (30):
>>    hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
>>    hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific
>>    hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific
>>    hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>    hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>    hw/intc/i8259: Make using the isa_pic singleton more type-safe
>>    hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC
>>    hw/i386/pc: Create RTC controllers in south bridges
>>    hw/i386/pc: No need for rtc_state to be an out-parameter
>>    hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>      south bridge
>>    hw/isa/piix3: Create USB controller in host device
>>    hw/isa/piix3: Create power management controller in host device
>>    hw/isa/piix3: Create TYPE_ISA_PIC in host device
>>    hw/isa/piix3: Create IDE controller in host device
>>    hw/isa/piix3: Wire up ACPI interrupt internally
>>    hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>    hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>    hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>    hw/isa/piix3: Drop the "3" from PIIX base class
>>    hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>    hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>    hw/isa/piix4: Use TYPE_ISA_PIC device
>>    hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>    hw/isa/piix4: Rename reset control operations to match PIIX3
>>    hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>    hw/isa/piix: Harmonize names of reset control memory regions
>>    hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>    hw/isa/piix: Rename functions to be shared for interrupt triggering
>>    hw/isa/piix: Consolidate IRQ triggering
>>    hw/isa/piix: Share PIIX3's base class with PIIX4
>>=20
>> Philippe Mathieu-Daud=C3=A9 (3):
>>    hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>>    hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>>    hw/isa/piix4: Correct IRQRC[A:D] reset values
>
>I'm queuing the first 10 patches for now to alleviate the size of this
>series, and I'll respin a v7 with the rest to avoid making you suffer
>any longer :/ Thanks for insisting in this effort and I apologize it
>is taking me so long=2E=2E=2E

Okay=2E=2E=2E What's the further plan? Is there anything missing?

Thanks,
Bernhard
>
>Regards,
>
>Phil=2E
