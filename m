Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CFFCFC518
	for <qemu-arm@archiver.kernel.org>; Sat, 22 Nov 2025 02:36:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vMclg-0001qT-65; Fri, 21 Nov 2025 20:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vMbXY-0000cU-9l
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 19:31:48 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vMbXM-0004lQ-TL
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 19:31:45 -0500
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-4332c281375so61075ab.0
 for <qemu-arm@nongnu.org>; Fri, 21 Nov 2025 16:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1763771482; x=1764376282; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfohI4ZesDVgxljj2Xjn7DIzuGAqMdIVECFPKbt2OKM=;
 b=LwhxvnkzfLDUo71ET0Cdw8I0917jX+Duu0S3Eh1EPEfi9hzd2qRtlwDfMqpfRUhRrG
 D5lnjsccmWbrVwm4MKVgHYaZNB0WZK3RYTw8upp35AvPwAVUIEX5xhn0ROQoxQSWblfA
 Tgih38IaCZIwMmn/oykMP/OKu9rl43i7gJ2L8EuTR2FlizJJY7OmV7oN0MQDKNKOLmUL
 jP3MMUAsza7Ew8zIfaYlAYiZNdVk/CJdKlCayyfsuTPkplfhwpRVy9oLvTqnrgJZYiEy
 ZigI5JvGKI/L8N4cW5q4lFZiSl/T9Uik6Jt51bqTk0yTMWDPU9z+tXE5hQ6kjAe7uZMf
 Oniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763771482; x=1764376282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VfohI4ZesDVgxljj2Xjn7DIzuGAqMdIVECFPKbt2OKM=;
 b=eDcHctghZsA1bU/1IGDiB7vIPmcOhA065dRL8OCcjillUcBeqs5qmrM5EghzQThZov
 SGvGAyl4I9xDkwlkyHbS6Gk/+wz19Cb4qIyZBsTmW1oQmx0D01M3W4EmQxwzvSG4mW4A
 Rf1LuMKmubPhK3HsxEQSfvH2l9RHjPmJ3HPGcbOb4/d2stcxyY8mglyZbdmOcrI2XcSg
 75yj0GsolDRYizzrQIb7hlU95bNNSZXpSYXnu1zO1aAWYFqZvwb1dlre18sol1TEKELn
 DINmp759wH9WXB/THYaPl7i6cRywcOtTqyMU5WEjqYGzpxhz61LtmWiJ4PTrhWFbX7Qg
 VhaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgHkTWv7S91lGxECX7DWPMLQUN74xFqBEuLUmcR+Ma3MfF02tvIaLZMiZYb5gIac7W+NTXoRxDGw==@nongnu.org
X-Gm-Message-State: AOJu0YxRkzPdZXo4Q7QU+vLUETQ0EZeIUU8M5PNjTKdrSjX08V4NrWcG
 Vr8QVzr3emyFWjVBaUS++kAery/tzNixEKfXBMzL1QrfFskFyOxEPER8ehPiQJjb3BEawsT3ALg
 aKStdmTd8qB+AyZbLFUdVdlWWnEkarVeW6qSVJfItJlw5EPTHBrRR4y/nc5PVdLqu
X-Gm-Gg: ASbGncvDRNNtXth20qHtMQY2bwACHomdzZ+fyqcQm+HTT3KDONx55/iMEmKeQ8pJYoJ
 L8KB2UKX0kRUGA8vuVEMPL8/sCS2g0ivWH7Il3Yumm8F99XCYyickensfqljQ35VKK+pqIez/t0
 EEDBz3U6GY0pa/nNel/k1eHzlt+8nSxa1iaS7Q8rn2YzwHSVqhRx5hkZ69x9thKYnKFdmTp1r8t
 n+AaJQWC9qMVsZYMS2Ej6KX5pVsZuAeVZ4cuyeMBmbV0mhe4+j3CEWX3as+7KUJbCGdstXj8BYT
 /ZCwmBZKO1RQpagC1V/t4Yhmu3dqLlhpfSf0
X-Google-Smtp-Source: AGHT+IEDl+YXxrkmLWtlDaOM6/sKpBey+hHUuLtr+6bBZbFiWZpre0mfNEXJL9aVLlCpsbzcApR7mm9mgbL0WOI3EjY=
X-Received: by 2002:a05:6e02:2404:b0:433:5ac6:78e with SMTP id
 e9e14a558f8ab-435b847f715mr6800105ab.16.1763747225768; Fri, 21 Nov 2025
 09:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20251121050108.3407445-1-jamin_lin@aspeedtech.com>
 <20251121050108.3407445-2-jamin_lin@aspeedtech.com>
 <f5892baf-cb8d-4026-9c1c-c8761889729a@linaro.org>
In-Reply-To: <f5892baf-cb8d-4026-9c1c-c8761889729a@linaro.org>
From: Nabih Estefan <nabihestefan@google.com>
Date: Fri, 21 Nov 2025 09:46:53 -0800
X-Gm-Features: AWmQ_bm2LF82oMGJ6gduvrvr8gyRvfSR87bKfL8B9iI0yaLErtHRaRR6HuP0PHM
Message-ID: <CA+QoejWajueR+y-StkT-uYtHhpyHS2GEgUR4kyrZ3wjpijgcXA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/pci-host/aspeed_pcie: Update ASPEED PCIe Root
 Port capabilities and enable MSI to support hotplug
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=nabihestefan@google.com; helo=mail-il1-x131.google.com
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

On Thu, Nov 20, 2025 at 11:06=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 21/11/25 06:01, Jamin Lin via wrote:

Thank you for the quick turnaround on the bug fix, Jamin! Tested it
against internal models
on our end. Hotplugged devices now appear with `lspci`.

> > This patch updates the ASPEED PCIe Root Port capability layout and inte=
rrupt
> > handling to match the hardware-defined capability structure as document=
ed in
> > the PCI Express Controller (PCIE) chapter of the ASPEED SoC datasheet.
> >
> > The following capability offsets and fields are now aligned with the ac=
tual
> > hardware implementation (validated using EVB config-space dumps via
> > 'lspci -s <bdf> -vvv'):
> >
> > - Added MSI capability at offset 0x50 and enabled 1-vector MSI support
> > - Added PCI Express Capability structure at offset 0x80
> > - Added Secondary Subsystem Vendor ID (SSVID) at offset 0xC0
> > - Added AER capability at offset 0x100
> > - Implemented aer_vector() callback and MSI init/uninit hooks
> > - Updated Root Port SSID to 0x1150 to reflect the platform default
> >
> > Enabling MSI is required for proper PCIe Hotplug event signaling. This =
change
> > improves correctness and ensures QEMU Root Port behavior matches the be=
havior
> > of ASPEED hardware and downstream kernel expectations.
> >
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >   hw/pci-host/aspeed_pcie.c | 40 ++++++++++++++++++++++++++++++++++++++=
-
> >   1 file changed, 39 insertions(+), 1 deletion(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>

