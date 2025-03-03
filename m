Received: by 2002:a05:7022:4195:b0:99:f831:508e with SMTP id i21csp898521dli;
        Mon, 3 Mar 2025 13:51:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0Cjm1CBhGIQr0Ji6dpk1en4EgDc1leeLzvJFIVWJudOgroaDfnh4GAerrsMrOXGdgisIJm7oPNBtg4A==@linaro.org
X-Google-Smtp-Source: AGHT+IE31R3Pg11AngAZ2QXOi9r/oJSxJgLf71nYKL3lprGGrgpd45g8+GCyG5hUWHL3sLXqDr7j
X-Received: by 2002:a05:620a:890a:b0:7c0:a264:4de1 with SMTP id af79cd13be357-7c3cc379bbcmr104523285a.24.1741038702676;
        Mon, 03 Mar 2025 13:51:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741038702; cv=none;
        d=google.com; s=arc-20240605;
        b=HIfGX/sbxAtQP238EQXwV+LlfmCBLQfbrW1TQllrPlzJC05MxnHipxcIL5AopjyOnO
         ekY8/rSttP8Krt2hzHDb5GiWadGGRuv4o3L6WVsit/gfKCleIOScCFeXLdiOQr5LPC16
         e836vtzF4a48zxM5f0Vg+XTkkC4mOUMBNlwiAxQtHzRi5AAy7Z11CJRJKV5bDWho5R6R
         FyubJRlHp9pGNymOJE4IORnTVcUvp4YhGDURG3rgQS/8D/OlmLqFWUWNN+VVqtu0q0zP
         GnHQsq4jsOkWY06COBH4wm6NYJrPXj4GRUHjM4YYuXfaezgfDCqIboCLDm12WvUHJOrh
         T8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OEYnAufkvHwQxZqdjsRxCZVyQP4M9G6zKwjU8KHtHSk=;
        fh=8az460q1k0rYUlL87FyBGQK/HvZLoCAWyvphc8W6DDI=;
        b=auIm9vaR6BAaEX8+u2M3Z4BnIvoJpi4mevEEib+agtVMpYfOZUgKy1QI5VJ+2m1gOH
         16x4vBS9xzgwedjXS5+JRoMCSt6qB//KkhcAr5mvaEuzxwDXkKhAE90O0F4MfloIMc3z
         DTkAIHkghDW/4p92j5ph6//T/fkzVzEinQxkwC9e5C9BMjD1AZO+q+cm+x724IwJgyFX
         7Ajl/pCB+AtDNW13BCHS10zlvgTlFDIRnXVqZ1K5dNKCQoNMNeqP3wc1l+svPdoxtThx
         d6xH91rULa6oULBBT7SjVJQ0bXg+QREncUE6dLUep6kkJMZJJKA2ZZubShHJS+DL/Alz
         79tQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jAU3iKBP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c378da6b5bsi954185685a.527.2025.03.03.13.51.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 13:51:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jAU3iKBP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpDh5-0003F7-Ed; Mon, 03 Mar 2025 16:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tpDh3-0003Et-Iw
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 16:51:21 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tpDgz-0007v7-Ov
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 16:51:20 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f406e9f80so3748493f8f.2
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 13:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741038675; x=1741643475; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OEYnAufkvHwQxZqdjsRxCZVyQP4M9G6zKwjU8KHtHSk=;
 b=jAU3iKBPw51INxzrS6Jr3+IOCp/yiViV+2GV9eUH9Ksa4feUBx5ic7EqlOGEgIYzl0
 T+FJy/dravZgUtkfBhNUfWBDMmGmYkT6XVCIDUjOyep/aCfxYY3aMScr4Z+s6P7DJbZh
 7F2ebY1dg3H3UTvlrWKVvKx94udqkMzNmLsFA0mvi7MRn5PKnZK5W4OLmLHchwuW+Tr4
 BmRP7Fx+YT0QN24bIOKIh0uHOMvN5IBPw0xbOWaVaZttQYQfB/f+jIVGsP66PapqL+i0
 zSyWLta1zW4APIilHLxsaZ+PP91ZyMDSvGaNV1Xxn+XARtHNCEK0wRw+NlJZngTOXHep
 EVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741038675; x=1741643475;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OEYnAufkvHwQxZqdjsRxCZVyQP4M9G6zKwjU8KHtHSk=;
 b=Szba7SvmkyeZ4mFdKO+WGrmnmOaLA96BJq43EUUfMqqVRVldsmjrei5fapVYd3LRCS
 eGs4M/1G/DCdt+1s4tfOzZmSeSf+oK7PK5QM8jH9NyIemmevXWSK9UDEbpTFt7MjtEJV
 rCVwjoGv5J9WMJ+6gHTn+VAb6CQxwSSSL35WpHk64gds4Swap1ixBXiE/wCqjAX4gwPj
 mdNcJ2U6LbjG2x7ibUHDpeZoZlyoPPeqMafcapkCZbduyBGHG/SkqWK4TJ085vh7mnL7
 9Yl5QHch/d2T4rSYHaa4R7GuwsmHofPyDoXq2hDvOZTflpfMOBnEAdwPgK75iXm740w2
 3BmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgzh7utsntkbmPOZpbRs1+KMK0Cg0TIpjdYWq+PQD5JIoQA6QVT8Yuk2+4XGXbsK/4xPXDj/aK7w==@nongnu.org
X-Gm-Message-State: AOJu0Yz+psgND3kWcGsz5jrTYJkWiHRN9h2XVbpUrPvQDEyPSpWqdAD8
 virrAc5lD50KRuKQlnhAAuP1vBSzRaVEsM/TS52zwaeNYHlUOdRjJ+lB42BxZhc=
X-Gm-Gg: ASbGncttPqrtXQSwkzaAQD2EEQvQWrds7umoISnL7prMzZAfbXoq04op62EnNOyV8dj
 nkOlZHkwlVqzxcJtgaL7QfpXuyXatfjfJbmKLAwILIWJfLVqTZk6hm51HbrriLbucHxTBde7qAU
 n89R0Q0sQF+oiVBVRzIaPjZNtQIgt7xtkl/Zr1gje7QnTENQNoYlQ5k5GtlneCMbbvSmDR03hHH
 4ReidkBFp/l2tR2SB/15wQ+EJBD0QAtcne/D/xukjnJm6XxSlkaVtE/ovmFZgeZnEIym0wZwbt/
 Qui84LqgoYtnDkkrX66jaEkuVa1CoZuBKEu/PIX/WnPJbtslsNVw6LQmHVssWj7u5rTQkaMuIpk
 5SnIfQsDMF7eS
X-Received: by 2002:a05:6000:154a:b0:390:f9f9:3e9c with SMTP id
 ffacd0b85a97d-390f9f93fc2mr6453506f8f.25.1741038675224; 
 Mon, 03 Mar 2025 13:51:15 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a66bcsm15466605f8f.21.2025.03.03.13.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 13:51:13 -0800 (PST)
Message-ID: <2f5820d0-9cd1-42ee-aa74-c4c9c4bb2a46@linaro.org>
Date: Mon, 3 Mar 2025 22:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 11/11] hw/vmapple/vmapple: Add vmapple machine type
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, Alexander Graf
 <graf@amazon.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20250112210056.16658-1-phil@philjordan.eu>
 <20250112210056.16658-12-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250112210056.16658-12-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1rdlAd1IUPMa

On 12/1/25 22:00, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Apple defines a new "vmapple" machine type as part of its proprietary
> macOS Virtualization.Framework vmm. This machine type is similar to the
> virt one, but with subtle differences in base devices, a few special
> vmapple device additions and a vastly different boot chain.
> 
> This patch reimplements this machine type in QEMU. To use it, you
> have to have a readily installed version of macOS for VMApple,
> run on macOS with -accel hvf, pass the Virtualization.Framework
> boot rom (AVPBooter) in via -bios, pass the aux and root volume as pflash
> and pass aux and root volume as virtio drives. In addition, you also
> need to find the machine UUID and pass that as -M vmapple,uuid= parameter:
> 
> $ qemu-system-aarch64 -accel hvf -M vmapple,uuid=0x1234 -m 4G \
>      -bios /System/Library/Frameworks/Virtualization.framework/Versions/A/Resources/AVPBooter.vmapple2.bin
>      -drive file=aux,if=pflash,format=raw \
>      -drive file=root,if=pflash,format=raw \
>      -drive file=aux,if=none,id=aux,format=raw \
>      -device vmapple-virtio-blk-pci,variant=aux,drive=aux \
>      -drive file=root,if=none,id=root,format=raw \
>      -device vmapple-virtio-blk-pci,variant=root,drive=root
> 
> With all these in place, you should be able to see macOS booting
> successfully.
> 
> Known issues:
>   - Currently only macOS 12 guests are supported. The boot process for
>     13+ will need further investigation and adjustment.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Co-authored-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---


>   MAINTAINERS                 |   1 +
>   contrib/vmapple/uuid.sh     |   9 +
>   docs/system/arm/vmapple.rst |  63 ++++
>   docs/system/target-arm.rst  |   1 +
>   hw/vmapple/Kconfig          |  20 ++
>   hw/vmapple/meson.build      |   1 +
>   hw/vmapple/vmapple.c        | 618 ++++++++++++++++++++++++++++++++++++
>   7 files changed, 713 insertions(+)
>   create mode 100755 contrib/vmapple/uuid.sh
>   create mode 100644 docs/system/arm/vmapple.rst
>   create mode 100644 hw/vmapple/vmapple.c


> diff --git a/hw/vmapple/vmapple.c b/hw/vmapple/vmapple.c
> new file mode 100644
> index 0000000000..ec0896dd32
> --- /dev/null
> +++ b/hw/vmapple/vmapple.c
> @@ -0,0 +1,618 @@
> +/*
> + * VMApple machine emulation
> + *
> + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * VMApple is the device model that the macOS built-in hypervisor called
> + * "Virtualization.framework" exposes to Apple Silicon macOS guests. The
> + * machine model in this file implements the same device model in QEMU, but
> + * does not use any code from Virtualization.Framework.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitops.h"
> +#include "qemu/datadir.h"
> +#include "qemu/error-report.h"
> +#include "qemu/guest-random.h"
> +#include "qemu/help-texts.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/option.h"
> +#include "qemu/units.h"
> +#include "monitor/qdev.h"
> +#include "hw/boards.h"
> +#include "hw/irq.h"
> +#include "hw/loader.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +#include "hw/usb.h"
> +#include "hw/arm/boot.h"
> +#include "hw/arm/primecell.h"
> +#include "hw/char/pl011.h"
> +#include "hw/intc/arm_gic.h"
> +#include "hw/intc/arm_gicv3_common.h"
> +#include "hw/misc/pvpanic.h"
> +#include "hw/pci-host/gpex.h"
> +#include "hw/usb/hcd-xhci-pci.h"
> +#include "hw/virtio/virtio-pci.h"
> +#include "hw/vmapple/vmapple.h"
> +#include "net/net.h"
> +#include "qapi/error.h"
> +#include "qapi/qmp/qlist.h"

FYI I replaced "qapi/qmp/qlist.h" by "qobject/qlist.h" due to commit
407bc4bf902 ("qapi: Move include/qapi/qmp/ to include/qobject/").

> +#include "qapi/visitor.h"
> +#include "qapi/qapi-visit-common.h"
> +#include "standard-headers/linux/input.h"
> +#include "system/hvf.h"
> +#include "system/reset.h"
> +#include "system/runstate.h"
> +#include "system/system.h"

