Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2205889njb;
        Tue, 30 Jul 2024 00:26:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVH7NyLncaY3//DIQHn3/KBfB3SNLYhuYAl9jFIGUe6DfKh5DP7FKMi5D+0EDIQw6D1E+N71VOs2RL+JSaSGRaFC6HknS1k
X-Google-Smtp-Source: AGHT+IFJChcgRj6j8sDz9M9Dt8KehQSAKAC4qLhINZAUFx/uRRfCf9Fu61qQEk3994mddKHia+el
X-Received: by 2002:a05:6214:e81:b0:6b5:460d:5479 with SMTP id 6a1803df08f44-6bb55ac567cmr135210096d6.47.1722324380303;
        Tue, 30 Jul 2024 00:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722324380; cv=none;
        d=google.com; s=arc-20160816;
        b=T2rsdGGZyO8HdsVNmFhk2fRcvjtfrh6Ao+rE2JUARNjuzxMZKnV4W96BnZX7yqY01o
         AbWrhVtbQMUDp/P5eb5QUTsYHxTjTGBX+kyL9oB8I9PZ5qHmLeNOWVcAfrlBFGFrGugf
         tJRFQ0u/QXASfI606eP6G+bDf6kurh3Kw+KykOPWQ28Vb1efI75T/YP9EuXtAPvfL7dy
         MTj6f0gJEX2B5D3g1Ow4Eb3rc61J5O+vYfYhQhHP3sFlVEkihwzx3308+G8/WsTufAIN
         cwcBNQF7ZKvgeQX5PrVZBL06Zd5BidhwibOt30WhNAdpqGZqm3CgOrOHrUeHiXhUp3EZ
         ahAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=y5xEK7R2nb157eewENV4C21/1t6bjW/YfM6JPF2QG74=;
        fh=97WM93tNsbflo6uo3FmW3d7lJCyXjsNt8arCKPSTOMU=;
        b=c/o7ZjgP49519Do9zRl8HNQoyPfS7Km4KVepjD4AYp2HliNKlGspp1bw/ySAH/i2Uz
         gPEutcVwXGAJ49SCj24zqkNc2GRd/5rksVUuR7Ar428aEQyNIMTDawNUxNTHlNvWXuc3
         m6IQNawgvENne8oCU66ImKfEJwI3Wa4bt+u2SAb9OYeb21ayG34mzDvRZ5HAVv6i1cSz
         mf6xHliIXAUwdxQBGkTWJvmZkFXM8Dkq0T1qNqbHDfVXa4TBzAQLMDqERB0gEPO7pMpX
         7h0gwED7Z7MdAhAdtTEznqIBXj0mIhs+s/5dWl9EgjaOCv6FRcnyQnbVFzR13glQHFHf
         0K/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f4EBLCgZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fb1de2dsi122161756d6.591.2024.07.30.00.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 00:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f4EBLCgZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYhFD-0003vc-U1; Tue, 30 Jul 2024 03:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sYhFA-0003id-RB
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 03:26:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sYhF8-0002HC-MO
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 03:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722324357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y5xEK7R2nb157eewENV4C21/1t6bjW/YfM6JPF2QG74=;
 b=f4EBLCgZc+RR9Y7lXNq02S/ejvwlrfToiy1Cs5G4DbyW04vGe1QWG/eiOuFfBA2VfPzzOp
 ORDjIrRsux5CdFiRtDLY7tziz/f3d41C6S0raRxKQtnBtLQ3UqABd2EF2WDiKIq3SUFZUX
 IXURqq75SyiN2Ny3/1xvHh5YLtOtjcQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-36A5fNqwM6Ork4PP2k9o5g-1; Tue, 30 Jul 2024 03:25:52 -0400
X-MC-Unique: 36A5fNqwM6Ork4PP2k9o5g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42816096cb8so31235005e9.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 00:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722324351; x=1722929151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y5xEK7R2nb157eewENV4C21/1t6bjW/YfM6JPF2QG74=;
 b=wYZB6zi0Cor3XKYmp9IDojphA/H+8fCi+WtXQBZu61mXeKInm31BIZ5r/5nV+CnswP
 ccLk699MkYFmV2GW/onyA7JoYGnzbOfO1veMTsexdRc+Bd9YZP6AvKmH4eXJEGUXQkfz
 Of7QZy6vrpM4W85Lmxf5TQKeZcL9JJdvQJ7PoYuz8Uz0AiVc0RmTMyJkkBgV1dOo9/z9
 PTI6T+5/nfosmX/JwWXhHBrToFx4EJsn+U05ZQbHoXOcuFppkZfP9ovxfFSZN3iXk8i/
 el2ocTwtKX3v1oh/Wr+Ddlmae4JajnsHfeYK38v8sMYvRxnR8EtYTQ0MyOl5iWdV6c1v
 UR+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+9uupRU3U1KxB962TCO60K58bA4exH1QBIxlojA7VxNclbcI3Ht/Zz2aA5GTIXS8EsdFUgSM9MO5dqFsnnfAhh+r0
X-Gm-Message-State: AOJu0YwkRyx2FaKQu9te7qMzW7zE6QXsiPG8KTXeLVhAaW+n//XuuBHz
 FeWbITcm/0TavJ3SrR8AmO3zaAeXVL2zfqd0g6fQ03Z5PAnsE+LTvnWPP9pb6nb+icXwYxLpA9l
 3leQ2rrIHVUCdbi7Ea7/KGan1Q838HWak6yBWX+YiFW2Dy9a0Lw==
X-Received: by 2002:a05:600c:4585:b0:426:61fc:fc1a with SMTP id
 5b1f17b1804b1-42811d7792bmr90856415e9.3.1722324351585; 
 Tue, 30 Jul 2024 00:25:51 -0700 (PDT)
X-Received: by 2002:a05:600c:4585:b0:426:61fc:fc1a with SMTP id
 5b1f17b1804b1-42811d7792bmr90856125e9.3.1722324351142; 
 Tue, 30 Jul 2024 00:25:51 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4281225141dsm120696385e9.45.2024.07.30.00.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 00:25:50 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:25:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Shannon
 Zhao <shannon.zhaosl@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/7] arm/virt: place power button pin number on a define
Message-ID: <20240730092549.6898ff3c@imammedo.users.ipa.redhat.com>
In-Reply-To: <bf8367bddfdc95e378b5725c732533c3ba20d388.1721630625.git.mchehab+huawei@kernel.org>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
 <bf8367bddfdc95e378b5725c732533c3ba20d388.1721630625.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: S8DuBxZPWd/2

On Mon, 22 Jul 2024 08:45:53 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Having magic numbers inside the code is not a good idea, as it
> is error-prone. So, instead, create a macro with the number
> definition.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 6 +++---
>  hw/arm/virt.c            | 7 ++++---
>  include/hw/arm/virt.h    | 3 +++
>  3 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e10cad86dd73..f76fb117adff 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -154,10 +154,10 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>      aml_append(dev, aml_name_decl("_CRS", crs));
>  
>      Aml *aei = aml_resource_template();
> -    /* Pin 3 for power button */
> -    const uint32_t pin_list[1] = {3};
> +
> +    const uint32_t pin = GPIO_PIN_POWER_BUTTON;
>      aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
> -                                 AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
> +                                 AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
>                                   "GPO0", NULL, 0));
>      aml_append(dev, aml_name_decl("_AEI", aei));
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b0c68d66a345..c99c8b1713c6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1004,7 +1004,7 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>      if (s->acpi_dev) {
>          acpi_send_event(s->acpi_dev, ACPI_POWER_DOWN_STATUS);
>      } else {
> -        /* use gpio Pin 3 for power button event */
> +        /* use gpio Pin for power button event */
>          qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);

/me confused, it was saying Pin 3 but is passing 0 as argument where as elsewhere
you are passing 3. Is this a bug?

BTW: dropping '3' from comment doesn't make it any better.

>      }
>  }
> @@ -1013,7 +1013,8 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>                               uint32_t phandle)
>  {
>      gpio_key_dev = sysbus_create_simple("gpio-key", -1,
> -                                        qdev_get_gpio_in(pl061_dev, 3));
> +                                        qdev_get_gpio_in(pl061_dev,
> +                                                         GPIO_PIN_POWER_BUTTON));
>  
>      qemu_fdt_add_subnode(fdt, "/gpio-keys");
>      qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
> @@ -1024,7 +1025,7 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>      qemu_fdt_setprop_cell(fdt, "/gpio-keys/poweroff", "linux,code",
>                            KEY_POWER);
>      qemu_fdt_setprop_cells(fdt, "/gpio-keys/poweroff",
> -                           "gpios", phandle, 3, 0);
> +                           "gpios", phandle, GPIO_PIN_POWER_BUTTON, 0);
>  }
>  
>  #define SECURE_GPIO_POWEROFF 0
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index ab961bb6a9b8..a4d937ed45ac 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -47,6 +47,9 @@
>  /* See Linux kernel arch/arm64/include/asm/pvclock-abi.h */
>  #define PVTIME_SIZE_PER_CPU 64
>  
> +/* GPIO pins */
> +#define GPIO_PIN_POWER_BUTTON  3
> +
>  enum {
>      VIRT_FLASH,
>      VIRT_MEM,

