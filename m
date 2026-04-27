Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9DEFF8860
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 12:10:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHKmn-000344-Np; Mon, 27 Apr 2026 08:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wHKmO-00030u-OH
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 08:09:37 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wHKmJ-0007Nx-Ux
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 08:09:36 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so133614275e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 05:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777291768; x=1777896568; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WjVYn3dSJU8L9dHY3FzAmuZ8M9V1GR6U9VRPV23JNU=;
 b=LFteNeks0+p4JHZMqWtjfEVAjCNY+6LQdWs3Cjnglajj75kZfL4OEO2Hn2ENMRuBFM
 H821ZMuEts3joEXVi6+87x476j14DiVphSPTm5NaM56LuBhpeXBCZ/NsgMYfgJEYvjgP
 y4MEVDHe6KwSp4N9VJfx6tg9y2KjQjU4oL0xCthQ7+rZdGeIVdkatSrXOPVdl0StaH0h
 FKdS4NQXRVLZtqY0hIQQ/CHNf+rfJPYhtLSaZDWDqgkKPkv5odSkxyg7bBv86cABToBG
 RS4bthPBWCjWFATGNhN0t+cNkFgyX1JmIN8ut0N0ORNiedJ3a/Bhbe2FS69FZ7eC3VI1
 n/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777291768; x=1777896568;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3WjVYn3dSJU8L9dHY3FzAmuZ8M9V1GR6U9VRPV23JNU=;
 b=W73H/z/hxqAZ+Qj+ZtHoCyejv8iOWtLJz016fprfrnSwLc7P2nlDDbPYLkIkwLQQK7
 WNL2w53zoHhM9jRxW1I/DnK0U6/Zy0KbHSc8QmraYyCokugDqSM4JrIGP1r+snQCC1AF
 y4IuHiPRzLdzANq+a2ApHa7BBBr6bzbmEUjqrr+UghS8b4ICNGcRDLtkkjCCRbKLcdo9
 bKaY7nW9KNhbfApaWI9K9DoHBiVTkUMjGz/xxpc6ZZIAZzgMxoEPFVun9nEs33eIzBrt
 JuZzshUYwI7c8erMzVQ0SXNLyMd3tUh+wPqpJlMU8LXxu3QrQ8O4njasnX35f3lFar/K
 SpVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+fK57y4QLiRDBZ7YhiimJdwxpeGs6W91TZkBaV99MO1vOl7Zek1usp4v5I8xB2cCqb++P0ECk2Gg==@nongnu.org
X-Gm-Message-State: AOJu0YyXAWsc24gOPOI64m4Dn3Y6qv9tANfWbuc1VFnLInRLhQu2Mkej
 zBkkzHArGaXo8mw6wyirxPXMD7AqL3iPCZ/y5FXHkhGqocl3kOWxVlT8
X-Gm-Gg: AeBDievwOeCiRX1bnJJ3MNLlCDzkQNrE0TJn1UuxL8L/w2iXQv/XQFexw2avGmmUoVa
 21Vy5Ze8jTTjH74skQNv3+qBGxJBceZVkRnZhTSWGvQQspkoUlP3ccIiPtm0igMskBo6c3tmLIB
 xInxhrwDZ5aypVwpOi8kzl9lP8ejbYTH/V1oH6vXwFwJSqhWF5J+hS513uiVRjCBjm+aI1dnNBy
 qyFWHE5/B5E2QW7UElQgtVqopQQqgpsOujtPisDpyBZUw+0wvlkcWelNt952E5QZhUXMYfu39s7
 UjP5owBfm8TngB0t9ScaTCiKlnvTTmsaxEwtt1rKB2OPnHl/yktd3RVXg8GbJM00BMiOvR2qRTa
 ZChCXViNQDl7EA5K39U1x7ORKNUJP365IqxtLmN1kQJ2eSD7dWu4peW9h3Z/9yC6jkPoeVKANVp
 cfV/waZAqbhpM1r3sHJJXoQMQJeBgOtEjq3YK5H3Pg
X-Received: by 2002:a05:600c:c10a:b0:483:2c98:4368 with SMTP id
 5b1f17b1804b1-488fb771613mr462446925e9.18.1777291768323; 
 Mon, 27 Apr 2026 05:09:28 -0700 (PDT)
Received: from ehlo.thunderbird.net ([90.187.110.129])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891978ef6bsm265211835e9.4.2026.04.27.05.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 05:09:27 -0700 (PDT)
Date: Mon, 27 Apr 2026 10:30:09 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
CC: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 5/5] Revert "sysbus: add irq_routing_notifier"
In-Reply-To: <af77b92d-9303-4ed0-942d-6188e00ccdde@redhat.com>
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-6-shentey@gmail.com>
 <af77b92d-9303-4ed0-942d-6188e00ccdde@redhat.com>
Message-ID: <DF79ACA2-21B7-47B9-B9C1-0C08E9E50F16@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x334.google.com
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



Am 9=2E M=C3=A4rz 2026 09:19:10 UTC schrieb "C=C3=A9dric Le Goater" <clg@r=
edhat=2Ecom>:
>On 3/8/26 21:35, Bernhard Beschow wrote:
>> The callback has been introduced in commit 715ca691daca ("sysbus: add
>> irq_routing_notifier") for use in VFIO platform=2E Meanwhile, VFIO
>> platform has been removed via commit 762c85543948 ("vfio: Remove 'vfio-
>> platform'") which was its only user=2E Remove this unused code=2E
>>=20
>> This reverts commit 715ca691daca081108b33306faa6fa102f0df8d8=2E
>>=20
>> cc: C=C3=A9dric Le Goater <clg@redhat=2Ecom>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/hw/core/sysbus=2Eh | 1 -
>>   hw/core/sysbus=2Ec         | 6 ------
>>   2 files changed, 7 deletions(-)
>>=20
>> diff --git a/include/hw/core/sysbus=2Eh b/include/hw/core/sysbus=2Eh
>> index c0d18d9e00=2E=2Ef3c4259d29 100644
>> --- a/include/hw/core/sysbus=2Eh
>> +++ b/include/hw/core/sysbus=2Eh
>> @@ -50,7 +50,6 @@ struct SysBusDeviceClass {
>>        * omitted then=2E (This is not considered a fatal error=2E)
>>        */
>>       char *(*explicit_ofw_unit_address)(const SysBusDevice *dev);
>> -    void (*connect_irq_notifier)(SysBusDevice *dev, qemu_irq irq);
>>   };
>>     struct SysBusDevice {
>> diff --git a/hw/core/sysbus=2Ec b/hw/core/sysbus=2Ec
>> index 3adf2f2faf=2E=2E3e1160ee92 100644
>> --- a/hw/core/sysbus=2Ec
>> +++ b/hw/core/sysbus=2Ec
>> @@ -104,13 +104,7 @@ qemu_irq sysbus_get_connected_irq(const SysBusDevi=
ce *dev, int n)
>>     void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq)
>>   {
>> -    SysBusDeviceClass *sbd =3D SYS_BUS_DEVICE_GET_CLASS(dev);
>> -
>>       qdev_connect_gpio_out_named(DEVICE(dev), SYSBUS_DEVICE_GPIO_IRQ, =
n, irq);
>> -
>> -    if (sbd->connect_irq_notifier) {
>> -        sbd->connect_irq_notifier(dev, irq);
>> -    }
>>   }
>>     /* Check whether an MMIO region exists */
>
>Reviewed-by: C=C3=A9dric Le Goater <clg@redhat=2Ecom>
>
>Thanks,
>
>C=2E

Who will pick up this patch?

Best regards,
Bernhard

