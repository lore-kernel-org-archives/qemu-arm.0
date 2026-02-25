Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8F5FD3779
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 17:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvIdN-0001Rv-F2; Wed, 25 Feb 2026 12:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vvIdL-0001RC-PI
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 12:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vvIdJ-0000Aq-Kh
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 12:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772040307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGb3rIPrdkAZP+UMuAlFB/rUzyknUZtqzELTuwD6o34=;
 b=PKneZDzBTXf7ZW0WdNUPpU14gV8OsFsFOjnCTaXswvHNDA/Yn8kKFYy5Xx3Q4ZQ9K8GGtH
 91HsvIYTxYeINtKbdVlu2NyOGFdpeHx02/myANcx6nUt2+OvKtDqMwiN7/DMwjpfeRi36Z
 k4ZFjLuNseS8bY20s2pj9TR1tMjN4Cc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-M8P2PEenOAG8bMGOnpbLOg-1; Wed, 25 Feb 2026 12:25:04 -0500
X-MC-Unique: M8P2PEenOAG8bMGOnpbLOg-1
X-Mimecast-MFC-AGG-ID: M8P2PEenOAG8bMGOnpbLOg_1772040303
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4836bf1a920so73102835e9.3
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 09:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772040303; x=1772645103;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SGb3rIPrdkAZP+UMuAlFB/rUzyknUZtqzELTuwD6o34=;
 b=WP4cajbFZ7eQOljnaf7moVyvf+m1yRIBL1rhmvXBxyUAFME6gKjs/kM/auMU1A8otG
 fKM3I5j0xcTM4iyCPI1L2XSaV2wSqTEgzoDTG3ffhCLLeQJ3rLvofKgWTKa9N1+WnjZl
 JIEuKDqOkpKMdEyKdWysM8pG9ywe5s9s5THchIU1Ep24zFuHuAH59bU++UaAeI90qDRv
 9NTsUP/vdrg6A3LvjQXeUjUDs7LSGBjEdOfXlrr7fnFJAjIpA7f0PQnNt1mSM5335V3M
 PNvgYQ4vst8iL92G737pG79I7kcbzwwA+Kjpx1LOYRNlhH0APdGh2QQX4UNZJdZ1dVbb
 aIew==
X-Gm-Message-State: AOJu0YzZRFDgTWK80o9Be/o54zg/fvjxisvB1s9o+DA14uwJ93Irw2FO
 EM8Geqv3GmL2217ACn97BmVFX8XQC5CHMgAK1mBNl4x35dAId5WlZ3i2NaMWkS4Klhd7nGRqliW
 SNvb6MJjhD3qYpLG/EEH4hvp87JlrrAJu29pQyGBMkp6Y3VwPLFkOCw==
X-Gm-Gg: ATEYQzzkQ6oQ07SFQln++nppZAlbgU74TfPQHd2GwhrZXkrJpHaOOPy348ncn6ICE8i
 JqaCMF/0V8mYqS8J5Nw/jzRNwEgkt9cvV+70fmOFtJG4ZG85opBt/70gEgfYXtxUjK6wruFBYt1
 CMimM89fS27rHAbrLo+LA9lu9/2tk1mmH08Z57WeiT7M9SqLfmSVsik6zwaOmRGzmVKzBLM48qO
 WxOYd4zIm2T7WS78zX3amS4RkJ3kS0KTxQ2Wm9YqhiXI25lvBfdOkNGsmb6o0ZPpQ9UBEjq9mM3
 mtAMiJn7eiMYuYQfCUgv5QtSySABK6Gtr+05Q89RVKyGciJ+OxrM6CKp7BRbLuyru7c5AG8Fu9y
 LbGKLd8ZlnBeDtcz02sNhF0f6xMg1z++opqT/VMgbrIt3OifShq9f06Jf16A8806y43bdjutnSv
 0Aiu8J9XizQTAKqQHMTIf4A7jjCwA=
X-Received: by 2002:a05:600c:6815:b0:47e:e946:3a72 with SMTP id
 5b1f17b1804b1-483c21a10c5mr20770485e9.27.1772040302847; 
 Wed, 25 Feb 2026 09:25:02 -0800 (PST)
X-Received: by 2002:a05:600c:6815:b0:47e:e946:3a72 with SMTP id
 5b1f17b1804b1-483c21a10c5mr20770065e9.27.1772040302437; 
 Wed, 25 Feb 2026 09:25:02 -0800 (PST)
Received: from [192.168.10.48] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm130006215e9.0.2026.02.25.09.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 09:25:01 -0800 (PST)
Message-ID: <9efd00f1-1cce-4518-ad85-4304805828b9@redhat.com>
Date: Wed, 25 Feb 2026 18:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] hw/nitro: Introduce Nitro Enclave Heartbeat
 device
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org, philmd@linaro.org,
 berrange@redhat.com, marcandre.lureau@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, mst@redhat.com,
 Dorjoy Chowdhury <dorjoychy111@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Tyler Fanelli <tfanelli@redhat.com>, mknaust@amazon.com,
 nh-open-source@amazon.com
References: <20260225144532.84673-1-graf@amazon.com>
 <20260225144532.84673-7-graf@amazon.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20260225144532.84673-7-graf@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rd8geVMyGFXxYqi_8Ez_2nIEkujKIBA8vJ4zLCVIemU_1772040303
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.734, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.78,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/25/26 15:45, Alexander Graf wrote:
> Nitro Enclaves expect the parent instance to host a vsock heartbeat listener
> at port 9000. To host a Nitro Enclave with the nitro accel in QEMU, add
> such a heartbeat listener as device model, so that the machine can
> easily instantiate it.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> 
> ---
> 
> v1 -> v2:
> 
>    - Convert to nitro-vsock-device
> ---
>   hw/nitro/Kconfig             |   4 ++
>   hw/nitro/heartbeat.c         | 115 +++++++++++++++++++++++++++++++++++
>   hw/nitro/meson.build         |   1 +
>   hw/nitro/trace-events        |   4 ++
>   include/hw/nitro/heartbeat.h |  24 ++++++++
>   5 files changed, 148 insertions(+)
>   create mode 100644 hw/nitro/heartbeat.c
>   create mode 100644 include/hw/nitro/heartbeat.h
> 
> diff --git a/hw/nitro/Kconfig b/hw/nitro/Kconfig
> index ce24c09c21..d3fbc7b683 100644
> --- a/hw/nitro/Kconfig
> +++ b/hw/nitro/Kconfig
> @@ -4,3 +4,7 @@ config NITRO_VSOCK_BUS
>   config NITRO_SERIAL_VSOCK
>       bool
>       depends on NITRO_VSOCK_BUS
> +
> +config NITRO_HEARTBEAT
> +    bool
> +    depends on NITRO_VSOCK_BUS
> diff --git a/hw/nitro/heartbeat.c b/hw/nitro/heartbeat.c
> new file mode 100644
> index 0000000000..dc41323266
> --- /dev/null
> +++ b/hw/nitro/heartbeat.c
> @@ -0,0 +1,115 @@
> +/*
> + * Nitro Enclave Heartbeat device
> + *
> + * Copyright © 2026 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * Authors:
> + *   Alexander Graf <graf@amazon.com>
> + *
> + * The Nitro Enclave init process sends a heartbeat byte (0xB7) to
> + * CID 3 (parent) port 9000 on boot to signal it reached initramfs.
> + * The parent must accept the connection, read the byte, and echo it
> + * back. If the enclave init cannot reach the listener, it exits.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "chardev/char.h"
> +#include "chardev/char-fe.h"
> +#include "hw/nitro/heartbeat.h"
> +#include "trace.h"
> +
> +#define HEARTBEAT_PORT      9000
> +#define VMADDR_CID_ANY_STR  "4294967295"
> +
> +static int nitro_heartbeat_can_read(void *opaque)
> +{
> +    NitroHeartbeatState *s = opaque;
> +
> +    /* One-shot protocol: stop reading after the first heartbeat */
> +    return s->done ? 0 : 1;
> +}

This made me notice that the nitro accelerator right now does not tell 
QEMU that it's not resettable.  Ok to squash in a

static bool nitro_cpus_are_resettable(void)
{
     return false;
}

in patch 4?  And then later on we could reuse the vmfd-rebuild machinery 
that Ani has plumbed into KVM, together with reset functions in the two 
vsock devices, in order to support reset.

Paolo



