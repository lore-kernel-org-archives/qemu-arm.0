Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9BDCA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:29:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMwH-0004sM-9f; Wed, 07 Oct 2026 04:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEHEW-0002Z9-SO
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:18:34 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEHEF-0006dI-3B
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:18:07 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso31746005e9.2
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 19:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791339239; x=1791944039; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=lCdAesmtGdZAFCBnIi7V1rWvqrDDHG2STg9fkBbqWYo=;
 b=LJ90bm5fAPEaXTwK5YihoC2V4vGSEiEEar47hBu08yQrlXQAWE3BLvM2GRmB/o8B3a
 +A4KRFKMkMx98siiBdUuRh5grdDyQMin1A3dRV9eZ9WgHfcQjdivJI7VhuOyk4SABRMO
 FR6QaPB2exx9Ew7aCBzT+VtNrP399E8ZjfYlHlySMlqZLuOS+N905N8QvgHpJhdjRMAA
 sTekdTQxJbCHgDwgI9U8YCkSsCUf+IrxNwWKSazFpIqfNiYqUSrwxCyc+OZFZcBDDnb6
 iGl84aiVDg1u+aOO340hLWyPjw4SA8qn0dnvsH14ftSDoPIgReHk86XIr9yMnCQNIuWY
 hxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791339239; x=1791944039;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lCdAesmtGdZAFCBnIi7V1rWvqrDDHG2STg9fkBbqWYo=;
 b=rT77OxRry6kbGvTZjx4IWRPXGAV2u7c7Cf/HT+y9GQtWKPG+n8TAnPGLyg4p3bBZsO
 DvSJ3t2j9ITHpJ7wFkbSIwWymYorXogBoqXW6Y8bqhLnEhY4ZVNTdKvrM4Q5XGUUAZGC
 tvAOXkRTXJljElgbD5RbRCDTP+GSnn4UK8XkzeVWrbZTtZzqkfkSjv4ZWb49WM0nXM/I
 2O2GAAn1dd0ZtWj34EnhSpBUmYWtyoMOgcGF9N9XMzcKhPo0/wRDelxOZ5Nq6eW690f/
 wLQiIdRjMRj8hHbEJyXvXOJI+k/nfNq/mQZYr64z6CtVMenwiIGAoqtzC6ZnwevYc2Pb
 iYKA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxCr7GIkgriYFc3H5O9QFmqmTkm4y4g9vIzSRg1oi1fN8JgLcF3fHQXm4IaYqwAV+H1Q85JRoxcZQ==@nongnu.org
X-Gm-Message-State: AFq9FYLtTPuIsqOJDWrrBpaPmD+pnxnZIhpwuJeMsDFDxZFGfI1WYPPL
 3hAxsBqmddeQ1XXR9uNQ7JVmC0dV9t95mMotvZ3gJ0glmhxwmcAKpfnHtGBgbw==
X-Gm-Gg: AYBFou0//tAYucTfWYttJQ1xG/16+8lVzwioBLeYiKj75O9NJ/RdNAG3aeDjqusRkBn
 rG3lf/bCRdxE5KmFyOKxMaZuyNcCUJ4Gg7kd5uUQux2xFH4ir6m1lG7lHAE0ix/wtscz/sdqI3m
 DP9GluRIYnDldlxTzv3T/+1WZHf3bPIFqGWdN5lMwoKZxiXCky84Pe6P+4OW/AHF4VMZ4vm4KSd
 zDJ6AiB70aVWZfppCL2eoM9Wvt1DoEopphjGD4WbjuArugd+Yv8t1UQUd1wck50f3Hmm7WBqnwO
 1NZN2kKRtQiHJfh2ggNOTlVRGb190exRS4tCNgQIjOlu3dMSnQed/87icVvtcpt4YsDEjsVzX9p
 Aq2Swzc0Ticl09/FHmZ9wsSanpulj5Wb1118ceKfK6cNT7cEAsm5RoeQm2V74Dv3OHdlWkXEeAI
 Ab67kjh1gI4RiadUQyNMkib6Ym4uP3AnfcNF//EXsxwfsj/0FoOalFbMkx56p0rsQ5bJrRqYNc0
 fGACJPD5zUu1a6o85YeHdCDOI5Ywgg8oR1ichJlqbvTHLeaxxZOjsckJX5oE5rOPvw0/3Q=
X-Received: by 2002:a5d:5c04:0:b0:48b:f08:8159 with SMTP id
 ffacd0b85a97d-48c6d1a2ce9mr1744134f8f.40.1791280075133; 
 Tue, 06 Oct 2026 02:47:55 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (p200300faaf09ae00e8226aca597dff4e.dip0.t-ipconnect.de.
 [2003:fa:af09:ae00:e822:6aca:597d:ff4e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6a7c75b6sm3527775f8f.5.2026.10.06.02.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 02:47:54 -0700 (PDT)
Date: Tue, 06 Oct 2026 09:47:40 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
CC: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>, Alistair Francis <alistair@alistair23.me>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_12/31=5D_hw/arm/fsl-imx?=
 =?US-ASCII?Q?25=3A_Derive_from_TYPE=5FSYS=5FBUS=5FDEVICE?=
In-Reply-To: <d63caf07-24f1-4911-b0f9-f375c48b6159@oss.qualcomm.com>
References: <20261006083445.30362-1-shentey@gmail.com>
 <20261006083445.30362-13-shentey@gmail.com>
 <d63caf07-24f1-4911-b0f9-f375c48b6159@oss.qualcomm.com>
Message-ID: <1EAADDBD-1ED9-47BA-81AA-E6539880B7E4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



Am 6=2E Oktober 2026 09:26:52 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@oss=2Equalcomm=2Ecom>:
>On 6/10/26 10:34, Bernhard Beschow wrote:
>> Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
>> machine reset=2E
>>=20
>> Reviewed-by: Bin Meng <bin=2Emeng@processmission=2Ecom>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/hw/arm/fsl-imx25=2Eh | 5 ++---
>>   hw/arm/fsl-imx25=2Ec         | 7 +------
>>   hw/arm/imx25_pdk=2Ec         | 2 +-
>>   3 files changed, 4 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/include/hw/arm/fsl-imx25=2Eh b/include/hw/arm/fsl-imx25=2E=
h
>> index b68d4334a0=2E=2E4bb4d5b3e5 100644
>> --- a/include/hw/arm/fsl-imx25=2Eh
>> +++ b/include/hw/arm/fsl-imx25=2Eh
>> @@ -29,6 +29,7 @@
>>   #include "hw/sd/sdhci=2Eh"
>>   #include "hw/usb/chipidea=2Eh"
>>   #include "hw/watchdog/wdt_imx2=2Eh"
>> +#include "hw/core/sysbus=2Eh"
>>   #include "system/memory=2Eh"
>>   #include "target/arm/cpu=2Eh"
>>   #include "qom/object=2Eh"
>> @@ -45,10 +46,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(FslIMX25State, FSL_IMX25)
>>   #define FSL_IMX25_NUM_USBS 2
>>     struct FslIMX25State {
>> -    /*< private >*/
>> -    DeviceState parent_obj;
>> +    SysBusDevice parent_obj;
>>   -    /*< public >*/
>>       ARMCPU         cpu;
>>       IMXAVICState   avic;
>>       IMX25CCMState  ccm;
>> diff --git a/hw/arm/fsl-imx25=2Ec b/hw/arm/fsl-imx25=2Ec
>> index 7f65f4ca4b=2E=2Eefb22359c5 100644
>> --- a/hw/arm/fsl-imx25=2Ec
>> +++ b/hw/arm/fsl-imx25=2Ec
>> @@ -317,16 +317,11 @@ static void fsl_imx25_class_init(ObjectClass *oc,=
 const void *data)
>>       device_class_set_props(dc, fsl_imx25_properties);
>>       dc->realize =3D fsl_imx25_realize;
>>       dc->desc =3D "i=2EMX25 SOC";
>> -    /*
>> -     * Reason: uses serial_hds in realize and the imx25 board does not
>> -     * support multiple CPUs
>> -     */
>> -    dc->user_creatable =3D false;
>
>Can we explain this change?

SysBus devices aren't user-creatable, are they?

>
>>   }
>>     static const TypeInfo fsl_imx25_type_info =3D {
>>       =2Ename =3D TYPE_FSL_IMX25,
>> -    =2Eparent =3D TYPE_DEVICE,
>> +    =2Eparent =3D TYPE_SYS_BUS_DEVICE,
>>       =2Einstance_size =3D sizeof(FslIMX25State),
>>       =2Einstance_init =3D fsl_imx25_init,
>>       =2Eclass_init =3D fsl_imx25_class_init,
>> diff --git a/hw/arm/imx25_pdk=2Ec b/hw/arm/imx25_pdk=2Ec
>> index 243c30a67e=2E=2Ea33050788c 100644
>> --- a/hw/arm/imx25_pdk=2Ec
>> +++ b/hw/arm/imx25_pdk=2Ec
>> @@ -72,7 +72,7 @@ static void imx25_pdk_init(MachineState *machine)
>>         object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_F=
SL_IMX25);
>>   -    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
>> +    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
>>         /* We need to initialize our memory */
>>       if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1=
_SIZE)) {
>

