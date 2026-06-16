Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470F5CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 11:10:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZRge-00080g-CX; Tue, 16 Jun 2026 07:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZRgd-00080Q-8S
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 07:10:31 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZRgb-0003yj-Qv
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 07:10:31 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-662c360aa73so183113d50.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 04:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781608228; cv=none;
 d=google.com; s=arc-20240605;
 b=T2qjM1z11X66XhWknkheoiEoWruSkyQv9hlfCygRboqQswywDnyB1VkmN+53+O8fAW
 AmZPBKogExPA6WqET5qL/rfRXns8C2a+mQSYyHWmQlCbjIa1WGpoE2U/5rKsl2aQQfiZ
 wmnHovmGVn1m4fThn4rPClWk5Hd64CD20nm3JmqaPHbRvDhylPtbY6Kl5vFT+Quye4TU
 Fuaplu7r6tF/JsOxLtGPcV2Rry2MV/ywcSqpR9w6G0u0oJe45E1SXX3QhDDTlW5TbbtZ
 tfHHXSEe6pz2W1rPmIXhGjbDpGoSOc22pxJbUTGO4eb2x/oTyGTp1ijR8sbo2FGaNmDe
 VEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LfmaREOcJDzgMsSIFDgR/NYonjDVCQaU2EYRmKb6zjg=;
 fh=y3lOqzLwDA++fmGpApZEG57rFE6az46CWl3zMkRqPkY=;
 b=YurX/5guQ1WlrsHhfGyRErps6w56sFQo+OHIFHziujjCmsfIuAe2E+xUs57OVMLwCE
 cGpTF2/d/VhD/4ParE1Ol2Eqwn/qn3e+mV2iJXB86hNa8B+ubdXKX8GthmsfMYbgHJzq
 Y8XLIz+YHMQAEiIMKR4mK9CN8IUcCrD8nK/10oEECd8Wn1XatlVfdlt/dPxz27qI2yDm
 mXGMMOdFArcgfoK0Sf4MdN2w2PuVyULCr+grH9nsPSr8EcFNYTaqcGw03IQzmgf8gBy0
 eLIN4SXhUJ1cNyQMqFp2cI+HxTffBobYaIIyIObGgPjzfz+N/0AhsSrpbl+FhAS9If83
 mFdg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781608228; x=1782213028; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LfmaREOcJDzgMsSIFDgR/NYonjDVCQaU2EYRmKb6zjg=;
 b=LeihutxhIzCv/0syDRzenVmHJEWpUNy9jhL/0yqzcpoibBTDPmHrYgXzs5yx2TVPUK
 OTZm8WeqHtcBTm5MRfoiRaokGVURfibCEXDXQzZjRa5XF3InTenyAXw3osaMFISBnIhv
 iGCqXqNtHPRgchTv/Qqd6EHMdK1eekMD0SXnwFZhChMLsQTeVFYL+wMVwTOrpM6qxNPZ
 oZmQh6hdgWkxwDVQTR5lHMaym/w4TkCyK75Wt5Z2jHXrF2aOAGipKIoDfpWjrMxhM04M
 dKpoY+Q7FgDM8iVe43Z7thp7qisnYQVrUw/LZdqE+6VVls/wUatHjQgBKXJ6L7phgPTo
 V8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781608228; x=1782213028;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LfmaREOcJDzgMsSIFDgR/NYonjDVCQaU2EYRmKb6zjg=;
 b=LWnPA+6VLZ/yu8z4IusgqcgIXpDMKK1a+4cuyDR93fdpjaXB/oRgJ3fcdm1tPoqi2H
 webRBZt59msHOHCpjb4oqZkPXAHpl3vmsAhnWbIkjisq+rNNWvKgUaHKnx9SI0bCWFdj
 5dfv18P/PR4xTVbhm2XwFEJcJv9H7oQzxHKZZY+hl8aGyMTfrdnCZ9JwG+kpEbExtSQU
 YG2l2ayntYVBKUfTWZUoZSJfC8dbHcg8+wV9y1CUfPgmdDPk1ytpwRF9j5H0ZbBNZIGm
 +4SfxBQyU2IzE2n5Q+NWZf9T3v5JgK+qExWqZGZa/Eq4QRaTZiX3yNEjnq5jzFnY1ZCf
 Htdg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cC6hHCKmYO4c0/CFm6taeqz/mtuAZX1SUzZQJ53AP3oYaoESocC2pXt8PDj4If6Oux8gAIfCG6w==@nongnu.org
X-Gm-Message-State: AOJu0Yx/dhkJnPGQVNSgAg6MmAss/R85v7s2tFewX1SAyjt8vF5PWbZE
 3Bmh0tMvcF8I3QiuJqggiIfh14ehKBQi39igLYUG+1cu6iQ4Z8FOCzkkMw+oRlGz+2bdXL0y7m+
 aJygV6MpLxY4plEhfghQ0lCdLfrXxPCjqIVF6fT8e+g==
X-Gm-Gg: Acq92OFIF/3P8SGF+Bf/Thb7RPqmbH+QmQx3IF9OcFQ4EUVSDLoZWzC4SRf3y6cP8BC
 PAQtNyna5IPJcFOBtDdjEa9kLUuf2vPAdNQFhC4GNUPEiofJHMhAijuc5TwOsZB5GQLVQGUY2dz
 oTwoemReXirVyV4vkGiNncXihTuPmrQyV+beBSCsHYpYuTZy/gstGGj46mNMFpt54eNohc8NeiR
 C4k26zHKNNXrf2FPtV7OaZmWEbkpBXzarvgnFMnTrSVyErfWs+v9HWi/i77x+WeieawqYpnGUxG
 SQgMhnpwUDUyB2Kr5iQLJ7zL3sLZn9+lyquMgwzP/iu9/eabo9wIaTToL7DNorsxYco=
X-Received: by 2002:a53:d005:0:b0:660:77f0:2cd3 with SMTP id
 956f58d0204a3-662b616b697mr2165457d50.45.1781608228320; Tue, 16 Jun 2026
 04:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260609024027.22140-1-nicholasrighi@gmail.com>
In-Reply-To: <20260609024027.22140-1-nicholasrighi@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 12:10:16 +0100
X-Gm-Features: AVVi8CdY7HGDqivTxLqhyYJR2iuAaqPLO7GUdLCoYO9DFmsuDmv-dS_kOPlKJLA
Message-ID: <CAFEAcA-YSacshreh4z0Ld7pYdqjECsGxHmkfBrKgQdVPqHVPXg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/bcm2838: Route I2C interrupts to GIC
To: Nicholas Righi <nicholasrighi@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 9 Jun 2026 at 03:40, Nicholas Righi <nicholasrighi@gmail.com> wrote:
>
> The I2C interrupts are only routed to the legacy interrupt controller. This means
> that for modern device trees that use the GIC, the interrupts don't work. This patch
> adds a splitter to route the I2C interrupt to both the legacy interrupt controller and the GIC.
>
> Testing
>
> Add these lines to QEMU invocation
>
> -drive if=none,id=i2c_storage,format=raw,file=eeprom.bin \
> -device at24c-eeprom,bus=i2c-bus.1,address=0x50,drive=i2c_storage,rom-size=4096 \
>
> note: eeprom.bin is all zeros
>
> Before this change, running i2c get to read from EEPROM would result in this
>
> i2cget -y 1 0x50
> Error: Read failed
>
> After this change, running i2c to read from EEPROM results in this
>
> i2cget -y 1 0x50
> 0x00
>
> The eeprom can now also be enabled in the device tree. Before the
> eeprom driver load would fail due to the read failing
>
> ls -l /sys/bus/i2c/devices/i2c-1/1-0050/ | grep -i eeprom
> -rw------- 1 root root 4096 May 17 16:57 eeprom
>
> Signed-off-by: Nicholas Righi <nicholasrighi@gmail.com>
> ---
> Changes v1 -> v2:
>     - Use a splitter to route the OR gated i2c interrupt to both the
>       legacy interrupt controller and the GIC, instead of just replacing
>       the legacy routing with the GIC routing
> ---
>  hw/arm/bcm2835_peripherals.c         | 9 +++++++++
>  hw/arm/bcm2838.c                     | 4 ++++
>  include/hw/arm/bcm2835_peripherals.h | 2 ++
>  include/hw/arm/bcm2838_peripherals.h | 1 +
>  4 files changed, 16 insertions(+)



Applied to target-arm.next, thanks.

-- PMM

