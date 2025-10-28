Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD54CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 09:41:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDgCh-0002c7-L0; Tue, 28 Oct 2025 05:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDgCb-0002ah-0n
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 05:41:17 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDgCX-0004oe-Rz
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 05:41:16 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-633c1b740c5so6107438d50.3
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 02:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761644471; x=1762249271; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UiT29tlUViXYJqeS9V5DvpHK6hu3qLGHNTljnJ8fDWs=;
 b=QvJF436mc9xrejBeX2JAJjQSTATSnutLQistGJ2wRM6rJBv3KARU2uPYTRpej3xMXF
 LlCklWIZhskkaerByxRcGmr8OCLDV1ZwHakXVyyV2q9UQktjQ5VIPqFmc+d3c4VyRWPa
 pt67PZsdFl+HfeKIhhkNvrMGkmp/WE34aRF58z4rU5ps/NkVdeL0TKiAqLcEWy/gWAEc
 GNKAnTk12e17vKAnf1ZsgXNOMcqUrhouIsCRyjvJdbKkE4zMhx7Xn5saacIXC2rc7YD5
 429szjPr+ODRjdGE6B29jWzkkcj7KXsGKuIdKsjohQuoHfg+9eDujCXFAyLmpWNbn/1w
 //4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761644471; x=1762249271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UiT29tlUViXYJqeS9V5DvpHK6hu3qLGHNTljnJ8fDWs=;
 b=AhqTAzBBRoDoWL4C27SNgol5x7s1rdvuRFw/pRF36wN6KYgH54gp1hDpc5TMRo17It
 B0XwrvxVEGd1+2Q7bA5jUcvITHrf86E4jVNBj1MQbRMtGYV7lRclULL/9/syNLg8Cjty
 q8sllS8d3Phi5rw8gyJgOCZM4WbaHUIXJJzU6vHfTauHJ6WT7bKWIZvO5c8LF/ZF/ei/
 hxGN4Pw59/tKTc1jAG89gp4H/lqqOfPbUsgiE+qYT78zUYLXqIgSNtAuXypt4asp+6es
 wHrVpdNYK9Su1/SHaMr0kTuZJehnQAZvvhIdzZwBkGrT+yc7jGfKlhstFgcj/TeutWAC
 DjmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5GQOdzTcIDGef7ZQOzPa2bJf1huVZPjCHaP/Fe8jQLbYi0oQGQ1UDc1U3AZ6BOij/AUPHJ15k1g==@nongnu.org
X-Gm-Message-State: AOJu0YyiwhgLccT0jPPV7i7vlxFyLvck/2FmobP/qskumyYwIw5yzT6Q
 ILV4Yf0+iZliWBjP9EUx0xPBsKnbODMAVBUvqvOppsRoa5kPW1n471JAKrPZpU3AX7dtIdfb8hG
 1Frz9ZCCl8MoEzvICmqXCakWzSsROREKMZ/jAQobv1S2TuvjFwuFd
X-Gm-Gg: ASbGncu7iuv2E4KwqSVB/gsd5c1p9onKffWMlWMDKdUoEh/vLhzGMze7Np3qtP2TWmc
 qr+tasCMJoerMe3E7VQ6/FeEQZoZ/q/ZU313MxTlphBfRcePEoSNXabwyvUpKd8IZ5nG+pdp7V6
 u187dQXcwNc51F7I3HMkXJ35+KUKA2+8vOudkLcIssuvPS6EIIN77NDYQmgm4uTaWlodHGRYVe5
 rNtbEPMRAhgKrRdxXgRiDU1RRjVJ5nPp6QDUr3280ewGY2870GXKHG6hC+Szg==
X-Google-Smtp-Source: AGHT+IG24Q6olExUDds+xRL8gIyoEbQMKpoFjLAuCnXeVLEeCXcp6UhuWPPKlf7ThYUYKWCJBE/S0UhMBG5ZYTIvIE8=
X-Received: by 2002:a05:690e:15da:b0:63e:2284:83cb with SMTP id
 956f58d0204a3-63f6ba3ca3cmr1958689d50.63.1761644471169; Tue, 28 Oct 2025
 02:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251020094022.68768-1-philmd@linaro.org>
 <20251020094022.68768-5-philmd@linaro.org>
In-Reply-To: <20251020094022.68768-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 09:40:59 +0000
X-Gm-Features: AWmQ_bnFKh9EI7_PhF_o1D0t2yGiD3Vq8Uhv7wWTWStjxPKlOX2jXkD0VQ8B_NM
Message-ID: <CAFEAcA9e40y9=pn5NCRx5FZ6HVgToCi6nT80fqNrWKwWhvFspQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/arm/virt: Remove
 VirtMachineClass::kvm_no_adjvtime field
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 20 Oct 2025 at 10:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The VirtMachineClass::kvm_no_adjvtime field was only used by the
> virt-4.2 machine, which got removed. Remove it as now unused, but
> keep the ARMCPU homonym property.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/arm/virt.h | 1 -
>  hw/arm/virt.c         | 5 -----
>  2 files changed, 6 deletions(-)
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 993872bb680..c77a33f6df2 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -123,7 +123,6 @@ struct VirtMachineClass {
>      MachineClass parent;
>      bool no_tcg_its;
>      bool no_highmem_compact;
> -    bool kvm_no_adjvtime;
>      bool no_kvm_steal_time;
>      bool acpi_expose_flash;
>      bool no_secure_gpio;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b781a218019..ffbddb711f6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2362,11 +2362,6 @@ static void machvirt_init(MachineState *machine)
>              object_property_set_bool(cpuobj, "has_el2", false, NULL);
>          }
>
> -        if (vmc->kvm_no_adjvtime &&
> -            object_property_find(cpuobj, "kvm-no-adjvtime")) {
> -            object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NU=
LL);
> -        }
> -
>          if (vmc->no_kvm_steal_time &&
>              object_property_find(cpuobj, "kvm-steal-time")) {
>              object_property_set_bool(cpuobj, "kvm-steal-time", false, NU=
LL);

Can we / should we start the deprecate-and-drop process
for the CPU kvm-no-adjvtime property now ?

-- PMM

