Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADE8EDEBEC
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 19:43:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxVde-00061m-Qk; Tue, 03 Mar 2026 14:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxVdb-00061C-Ah
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 14:42:35 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxVdY-0007le-TV
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 14:42:34 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-439b790af67so1535748f8f.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 11:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772566951; x=1773171751; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+3VF3qSAGaHoy/q+VfuevnFQT/3hpVf3O3il8BToUiM=;
 b=XlHWikC1WUQ0noNCyk6jyjM3Pmie8TsJOo+NnG4uu2O72h9FD+B1Q1GPSb067NsPH6
 Ut2DUec/gnZw6wx6FsbkUodqRFlWocsQLBl00xpoOUL+6FKJH9m7i7QYlXhLSS3MFV2z
 1T795DFZDTdGcIl2LotuZqFrOP2EiQkEYawNP/cXfENjUR3huq08xnxE+fbpIXyq6rpe
 nSYGfj/JuAuSjdNUSV8hbKmqwPet7IDhmDhHjfLYcILNO+YydEJglG52jkQCuIvpgPOM
 Fa5qYYyqgSAJQVOqvHYDJLPRKgrZFzrbCFL1R9547p1seBqDr0PodCYUG0hXYOiJRR+8
 r+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772566951; x=1773171751;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+3VF3qSAGaHoy/q+VfuevnFQT/3hpVf3O3il8BToUiM=;
 b=JjHHDfcTRktCrrIN0xSXfMRVnwk8OQMQesE2S5WTZlEdFJ4a3T3GnBy2/SO/frw1SV
 ij18dbFrCsDK1W3ELBxTCxciiezQOCNOmEyFZMqkJlnYKZoU8ry+DjNTY08C1ROHC3R8
 1lH8wqXfrVyelHhxaVTa292+UcFSZbhgJ1EOBtwOft5NwR35tsKtnxjLfOxXei200mKo
 ptkAkpFMcwWGvj78E4eujlFuhoaEllmm3EGeTMGDuXj1CmVgty+Y4FhZZiIHHNt/6ePh
 zZ4DiIayqO2DMRZK+RTM53eY/gAUFY7yvIrzTr7DxtfB+VyNPTtiYcUh/WnpKmWX52ql
 nzyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3N5/alBEEicKByEUL217GATNXn6y3tKy6vfYdrQjYBShTLTbRZqOjdBnOtaet9+eyet/RrEphRQ==@nongnu.org
X-Gm-Message-State: AOJu0YyTRnFRxexgfoVmmFJRutMcVSFAqrVS+tUgVuYvKyQmSZlvtVVr
 mnrsTvAk/j7Hny6mpdh5lANSksLhCqdbJ2GZuk3DBNINlinwaPjd/KcX70M8kQ==
X-Gm-Gg: ATEYQzz3tIjM8dgnY6JLrN6reK2gFl34Zd1KshUI3+ATwX2qkg+5jvwMCHBbVMd4Vgy
 qQZjVwU68DPug8K9ZUVTMkjtIqvgOQsaMjVy+B7xIryyW+5oB6wzAKaEhXybFgmqtjDnpsNCnPk
 EJyMxXlFgIEiSOdB7AfcVh7RfkBJ/DrkpAW7SitSCpudVMniEdrDv4ncSmaNUZejwzE8U0Vwnqw
 GR/yK+yZo8X+Refste8pJ71K6zILm2qxqUhqwN0FAgioS0WJzmdq6uU42Cf0eNBfmE6PBRQBwCA
 JTob2Gi5Bp7VjoXdUdA1rTWApppYiwpo5egCM5O3SfbN+xKAT7/I3iBC3y0U33ffjRHV3RPtPqH
 fdTGxH+UhT93ANahj+E0E2OGG8h1ZGlDo4SYzazEhHKCGzy3poSrnMQtnuSAIivkkAxGUbOIlAA
 kyjEO80hMUrrAvB3SFCa7fBGaz4DAZKe3rNOrKNfRNTibHt8jaVypdZri4YKi3n+A0fpzZ9mFqZ
 6J9e0zx5k4YiTe1x4M0ioJIsUufmR7xDz0sMUyoD5GqR20=
X-Received: by 2002:a05:6000:2913:b0:439:b9e8:635f with SMTP id
 ffacd0b85a97d-439c10dae0emr6703753f8f.21.1772566951365; 
 Tue, 03 Mar 2026 11:42:31 -0800 (PST)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-1c79-b600-f009-a6c9-39e7-d8fe.310.pool.telefonica.de.
 [2a02:3100:1c79:b600:f009:a6c9:39e7:d8fe])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b503424fsm20971231f8f.22.2026.03.03.11.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 11:42:30 -0800 (PST)
Date: Tue, 03 Mar 2026 18:35:27 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Subject: Re: [PATCH 11/12] hw/char: Have SerialState inherit from SysBusDevice
In-Reply-To: <CAFEAcA-dmbSDNC+AL=OO9w=bM-79gVaysroQty=u-SxzQziUrg@mail.gmail.com>
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-12-shentey@gmail.com>
 <CAFEAcA-dmbSDNC+AL=OO9w=bM-79gVaysroQty=u-SxzQziUrg@mail.gmail.com>
Message-ID: <591BD7DD-885A-4B27-BAED-FACC5EE5A5FB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



Am 3=2E M=C3=A4rz 2026 11:41:52 UTC schrieb Peter Maydell <peter=2Emaydell=
@linaro=2Eorg>:
>On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail=2Ecom> wrote=
:
>>
>> SerialState currently inherits just from DeviceState and serial devices
>> use SerialState as an "IP block"=2E Since DeviceState doesn't have an A=
PI
>> to provide MMIO regions or IRQs, all serial devices access attributes
>> internal to SerialState directly=2E Fix this by having SerialState inhe=
rit
>> from SysBusDevice=2E
>>
>> In addition, SerialState doesn't participate in the reset framework
>> while SysBusDevice does=2E This allows for implementing reset
>> functionality more idiomatically=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>
>
>
>> @@ -76,12 +76,13 @@ static void serial_isa_realizefn(DeviceState *dev, =
Error **errp)
>>      }
>>      index++;
>>
>> -    s->irq =3D isa_get_irq(isadev, isa->isairq);
>> -    qdev_realize(DEVICE(s), NULL, errp);
>> +    sysbus_realize(sbd, errp);
>> +    sysbus_connect_irq(sbd, 0, isa_get_irq(isadev, isa->isairq));
>>      qdev_set_legacy_instance_id(dev, isa->iobase, 3);
>>
>> -    memory_region_init_io(&s->io, OBJECT(isa), &serial_io_ops, s, "ser=
ial", 8);
>> -    isa_register_ioport(isadev, &s->io, isa->iobase);
>> +    memory_region_init_io(sysbus_mmio_get_region(sbd, 0), OBJECT(isa),
>> +                          &serial_io_ops, sbd, "serial", 8);
>
>This looks very odd, because sysbus_mmio_get_region() is supposed
>to be "the sysbus device provides an MR it has initialized, and this
>is how you get hold of it"=2E But here we're taking an uninitialized
>thing and initializing it by calling memory_region_init_io()=2E It works
>because it's just returning a pointer into the internal memory, but
>it's still making assumptions about the internals of the device just as
>much as directly accessing s->io=2E
>
>Maybe this is worthwhile for the benefit of getting reset
>handling automatically into the reset tree=2E

I think the logic can be folded into TYPE_SERIAL=2E I'll send a v2=2E

Best regards,
Bernhard

>
>thanks
>-- PMM

