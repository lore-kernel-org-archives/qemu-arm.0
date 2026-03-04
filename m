Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD4AEB7EB5
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Mar 2026 09:43:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxikj-0001Iu-Th; Wed, 04 Mar 2026 04:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxikR-0001BF-0B
 for qemu-arm@nongnu.org; Wed, 04 Mar 2026 04:42:31 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxikM-0007wH-VG
 for qemu-arm@nongnu.org; Wed, 04 Mar 2026 04:42:29 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso58612865e9.3
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2026 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772617337; x=1773222137; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NTLl1aQL5VZvOfSF61QILN3tARcDbPTY7qmSIJwbLIA=;
 b=VVFA3Q8eClWhOG81xLkHUrzsmurbBYxJoQIp+N+4MHTHdfq9g54z98RDFwar610HRo
 sudFfh6AMrH6X+IrckOmmzgJQkOwVsRnKS01k1zI6to36AyOHYNmC7UA0GctA/3oBnrE
 0hJuDv0dz9uoea0qQ8Qp14kYwcrgYk5RkUo67nCLLOtBY8tg2kut0QtmCfQKHMfdF6G4
 viv1wtOZrDdcqkuZsW4ya4EiyWDlgPNHbv4K0T0hX1/DwptVQ392Ro+F79TGwvVlMUrW
 pS7aIlvLiqqlrW99cOhozBiubKCKM+ITVISOnp94LuiTqy8LXPrsTrmhzy67roxxsX1Q
 56cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772617337; x=1773222137;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NTLl1aQL5VZvOfSF61QILN3tARcDbPTY7qmSIJwbLIA=;
 b=DKNExsqeKPjoKYm3msO7QiYtEKYrzTeNeciFsI1nO7BjkzgnCT0l/1EAJcqxG6fiYG
 vMYUCCOYY+7Y+I/+p3SaHZcRO7LQO33cuBowWkJehhro8vHcj6EyHgcSPBKWwdRssyT6
 nUQwjTlhIqcJdbeSLd2CD/kFRCG2SbLr+tmqMCZPtnAFzJd1gKbpMkY6SRHLmTuyZPDf
 PLZH3b186VpAcFok4vrpx16IodmnFXYrBlMCqj3DZ8xusIan9c0qsZ238Ds62UetJ70n
 KX0r49LVsaxAdJ9JOop6KLP678n5+PMgUS7OVGP49/oDA7R5hK1ej4dANV/3J+yI6MuV
 z//A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0GKksJWXCxg0hgUJdnDNQAt/jzXZqOwkhuEeX86Or8Y6p0xlTSJHW3ZjZZXHnBq2ooQJlWRN0XA==@nongnu.org
X-Gm-Message-State: AOJu0Yyg3w45vDbJcvfiu8omDq8AB4We1/2vqnc58HlOAe+weisvOGUt
 lktWxmSGxTlykv1Sfs9AU833/TG83+BCC18ADWhKGK+laptXTYfcIpPn
X-Gm-Gg: ATEYQzzJwxd2HDnHYUq20hLzlqdD+1RctrgpIU3Zf+IILTowoqWoADlECEQPmretKst
 Od/p9LEplox3wSqesEw4JFPEIvQvLXFt36VHQUX8+3UhisVBcYYevhvtM2iZLzfu2wg+P5OgGq+
 u9sS1I+fLMC6F8sUI8wtI+Xd6dgcYlm92RDlJrPfbDxEutu2W07Z2Z8bzaB7WsgKf0SrV4d6fS0
 VIiO9fbRu/CIrWea8fjdQetEmJz+5jynCZ2w4UFoi9dqWMQf8OaKT+U66RanJtgYO+UQGPOqP+/
 rJALiiMloHiVeX2gEg64fJhzGzZvC0zAkFr+CGQKgjOv1tJKI4BjtmiWwfwnDT/P6+V8Mjq/COt
 jls4X4B36ubIrXaf2BzZCjyB3zzqPz1cjedF2ygWsj1Q1Z03skuH5+aBo14UzuE4H7ANSrfnNjM
 tFxnT7BOaan2aJV3yjym34Z+qQqashJu8ZGZpsCW3ZWmYNpEj8DW3ZJ8bYsoFM69G5GorMA9N6S
 7t9GMsmJiFS
X-Received: by 2002:a05:600c:8284:b0:477:7af8:c8ad with SMTP id
 5b1f17b1804b1-485198a3e3amr20890555e9.31.1772617336808; 
 Wed, 04 Mar 2026 01:42:16 -0800 (PST)
Received: from ehlo.thunderbird.net
 (dynamic-077-191-023-054.77.191.pool.telefonica.de. [77.191.23.54])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851a895553sm20680165e9.1.2026.03.04.01.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 01:42:16 -0800 (PST)
Date: Wed, 04 Mar 2026 08:45:42 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, Helge Deller <deller@gmx.de>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-arm@nongnu.org,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 11/13] hw/char/serial: Keep MemoryRegionOps private
In-Reply-To: <d77f00da-83b9-4499-5458-305eaf9f1470@eik.bme.hu>
References: <20260303222143.142741-1-shentey@gmail.com>
 <20260303222143.142741-12-shentey@gmail.com>
 <8a363801-914d-7870-3b1b-a4c9182ba4cc@eik.bme.hu>
 <d77f00da-83b9-4499-5458-305eaf9f1470@eik.bme.hu>
Message-ID: <725AC957-EB25-4FEC-8AFC-8C6FB9293509@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



Am 4=2E M=C3=A4rz 2026 01:33:34 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>On Tue, 3 Mar 2026, BALATON Zoltan wrote:
>> On Tue, 3 Mar 2026, Bernhard Beschow wrote:
>>> Rather than requiring users of TYPE_SERIAL to initialize the MMIO regi=
on
>>> themselves, make it generic enough to be configured via properties=2E =
This
>>> makes TYPE_SERIAL more self-contained and prepares it for being turned
>>> into a SysBusDevice=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> ---
>>> include/hw/char/serial-mm=2Eh |  3 --
>>> include/hw/char/serial=2Eh    |  4 +-
>>> hw/char/diva-gsp=2Ec          |  5 ---
>>> hw/char/serial-isa=2Ec        |  1 -
>>> hw/char/serial-mm=2Ec         | 51 -------------------------
>>> hw/char/serial-pci-multi=2Ec  |  5 ---
>>> hw/char/serial-pci=2Ec        |  1 -
>>> hw/char/serial=2Ec            | 76 ++++++++++++++++++++++++++++++-----=
--
>>> 8 files changed, 66 insertions(+), 80 deletions(-)
>>>=20
>>> diff --git a/include/hw/char/serial-mm=2Eh b/include/hw/char/serial-mm=
=2Eh
>>> index 0076bdc061=2E=2E4c18e2a609 100644
>>> --- a/include/hw/char/serial-mm=2Eh
>>> +++ b/include/hw/char/serial-mm=2Eh
>>> @@ -39,9 +39,6 @@ struct SerialMM {
>>>     SysBusDevice parent;
>>>=20
>>>     SerialState serial;
>>> -
>>> -    uint8_t regshift;
>>> -    uint8_t endianness;
>>> };
>>=20
>> This effectively makes TYPE_SERIAL the same as TYPE_SERIAL_MM so you co=
uld just merge the two and have everything embed a SERIAL_MM device=2E But =
the idea here is to make TYPE_SERIAL a superclass of all serial devices and=
 SERIAL_MM is the memory mapped version=2E Memory mapped devices are usuall=
y SysBusDevices but others are not so this seems to be trying to model thin=
gs in the wrong way=2E Maybe you could just add accessor functions to TYPE_=
SERIAL to get the memory regions and use that from subclasses to avoid poki=
ng in the state struct and not try to reuse SysBusDevice for this=2E
>
>Or instead of TYPE_SERIAL exporting memory regions it could export ops or=
 functions for it (like PCI IDE or PCI does) and let subclasses implement t=
he regions that call these exported functions with the register layout they=
 need?

You mean by pushing the MemoryRegion objects into the individual users, i=
=2Ee=2E every user would provide its own io attribute? That would certainly=
 work and I've proposed that before (I think in the series where we made se=
rial-isa moveable)=2E That was criticized so I went with the current approa=
ch=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan

