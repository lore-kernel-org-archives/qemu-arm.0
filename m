Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1065155njc;
        Mon, 9 Jun 2025 01:49:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV33Qy6HZ8BIBymItx6cr/f/EpPMfNLKGUwdwO84fm3kz98If0xeHEA06VcG9Ald6W6BE9/9MM6Uby3Yg==@linaro.org
X-Google-Smtp-Source: AGHT+IH3+FkUr5KU6UJRC9N2WX/3z1qXqUdhWhDKXxdBL1R4YRkGUwVg8c4vRtpj4A9EBmb1WXSA
X-Received: by 2002:ad4:5ded:0:b0:6f9:2c6d:8568 with SMTP id 6a1803df08f44-6fb08f8f38emr166834416d6.40.1749458967761;
        Mon, 09 Jun 2025 01:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749458967; cv=none;
        d=google.com; s=arc-20240605;
        b=bOVDW/eUoi2UMsq+qenFl/xSB1oCg24UVk//pb0BhxIJ7piTV9+Qe6VMXMBNLgXvLN
         whKBXArcggX1uhyv4XKKwJZZdYNkaLhTbTOP7liJAemW7HAp1YE7WX+U2+PG1sK8M30h
         JHKNZkvqhvhMT7aqRYmnNJ5JPalykDK5AXJrbUGM7CbuPNY9GRsP2vQ5z/VUeGtiKZSE
         HBhVmb0N9/B88IHwMM0yW87AEOD1e9TbAvfWLwf7i7yS29mTkU8pYAod5ZTB+ahuZSnO
         a/Yxb21kehwfAnB1hBEB/0sHZmxbcvPOzEgVLDOjru0ZDjKjwLVLdNeSsEKIKaUxLkrj
         l3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hbwXZu7dCaQwi0jnqyIdBXAsk/U+tvhL7FIzvPqBYGI=;
        fh=lY9sGZbVxQ9ffNzkz5gsPgzWD2hrptUjGT0h73KVsBw=;
        b=jTY8eTerpu6Kt5FJDlmHOBWXogFXDHijBBugaNm7u6pgMPXREKLj0jb/E3JvUPL97j
         Sd18Bfg5VpxmXHzwccpakxGHdZwSlN0q3/P3ERNLeXD3nA5CEanv9gec+U3t6/j57oRk
         5u1ihKlmhTYb9SLSOhVDamFXyGEveCvTBnZkgyFK7DBnGrlGj/cT3VH6+ctsftGvWWG8
         oGV8TZkX8JhSSIMEm8BetUFa7C5SWX7plNqFJoktPi1+WZdidMIcSEV7uqVLK8oVjvL1
         GNCCTqmlvLJCZgYIU81eYo2Ygx4Fgq3JO+M+fcGMr8DZ/PpMaKmtZXjK1XViZ507qPeB
         06AQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ko7XjX9a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b2fe25si73423906d6.437.2025.06.09.01.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jun 2025 01:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ko7XjX9a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOYBZ-0002f6-9p; Mon, 09 Jun 2025 04:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOYBX-0002eT-F6
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 04:48:51 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOYBV-0005tz-Rd
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 04:48:51 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-70e4043c5b7so32890447b3.1
 for <qemu-arm@nongnu.org>; Mon, 09 Jun 2025 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749458928; x=1750063728; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hbwXZu7dCaQwi0jnqyIdBXAsk/U+tvhL7FIzvPqBYGI=;
 b=ko7XjX9aZaFH7j9j/e7MTCkKuJxdE1tgkA/eZe4wcvBqWMsCxtYDWwKb2G20suEaFa
 9J4RcNg16tiqE6woR1Xt8r0Qo0vRbMpgTwgjpmoUmlyn2ASBLQEw4Fbt6BYQd6BMd1EM
 nnU+jYsoVLuYtStYmiz9CmDJ2Om5ffTUYVZw8JyIZ8SI4nvvph8DUnYv5edPkGMrH9b4
 v+gocvwPDNOHQciCL8FiUr62ZkOHmlYGc3L+9yUlXASMaGkTLrMyIU0RkMWmTKRjgdLT
 rZ/WCE9bXZpQi2NlT8TZqvIi0Dc0wx2X076zGBdwN3WdWPBZPPkDFGhmk9V298FPxAdA
 hNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749458928; x=1750063728;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hbwXZu7dCaQwi0jnqyIdBXAsk/U+tvhL7FIzvPqBYGI=;
 b=oG2prHG8BDY9JWitwSQS6GAWRWtcWfaU3EDZL8WoqwBr6wUwLtJxjJH3AWCZQAc5aY
 XXoESZiqpWqr8ryaaBX46mdwmNTVtifPveNToM6MTCjP/AayBj55B//ydGaChgwmgzWB
 Y+D6IMk0exZPkae+0JxBqNSThy8MvvD1qI06uOvc+cGH9Pjll+dXpQZiszncdC0YBSfR
 XNmPx+CkYfznIk6zIjbjcfWBWBLp1gxia08E9IoPyuK7rh8OOxJZRczjDgBVRm+Pw0WG
 /KqYEXdBa47/iw7MDVeRTM2blVuqAnl1RLp7DLYi3EEvp5CWySjOoagI/0pLcQ20itHa
 tKNg==
X-Gm-Message-State: AOJu0Yysm6KzCzZD/h94P/bA6W+InYAoPgGpEZWiY9umv/B2Q16YKrWN
 4EQsk4o+wyou3nLsfiRf69bWYeCOjSFZYj1JpsyigfaiRUhmcXoxxlG1QeBXA1U59Zc2tVq+5xZ
 srq3qWtiDqo5oAHhQCeQosd5RFCQ5X42zZUMjf5Ofwg==
X-Gm-Gg: ASbGncu/ctug8ePjmuKkSy1HaRh38ChYVBmhgNeUZXDrqqd/js11EDq9R1kE/CPkjT5
 hYO4rQP4lArwkOT+dDe+zdiVpuS5M/VvMB8/UhxgmlYDfMYwVpBhSvPTk++AYKi/NW+CpX3cQ87
 deIp0G2+JZLIETUW0ICnOYWlRG33r7HQMHLO85YDiWGeP9
X-Received: by 2002:a05:690c:6203:b0:70f:83ef:de07 with SMTP id
 00721157ae682-710f773609cmr166789277b3.33.1749458927819; Mon, 09 Jun 2025
 01:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250609073408.2083831-1-shahuang@redhat.com>
 <20250609073408.2083831-3-shahuang@redhat.com>
In-Reply-To: <20250609073408.2083831-3-shahuang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jun 2025 09:48:36 +0100
X-Gm-Features: AX0GCFunjYxq39f4fJ_ibRVrdhrcQ5C0AytFQLXHhrRaKMKNB6e56Maos0OVy2I
Message-ID: <CAFEAcA8eA2wX1oQeNJfNBYq1NhHgoemYJ-ybOYAgBq2-t9ZPzw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/arm: Add the romfile compatatibility
To: Shaoqin Huang <shahuang@redhat.com>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qIhE5c0DG/dz

On Mon, 9 Jun 2025 at 08:34, Shaoqin Huang <shahuang@redhat.com> wrote:
>
> On arm64, it doesn't use the vgabios-ramfb.bin, so set the property
> "use-legacy-x86-rom" to false, thus the ramfb won't load the
> vgabios-ramfb.bin.
>
> This can mitigate the problem that on release version the qemu can't
> find the vgabios-ramfb.bin if it use the ramfb.
>
> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>  hw/arm/virt.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a96452f17a..5f94f7a2ca 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -38,6 +38,7 @@
>  #include "hw/arm/primecell.h"
>  #include "hw/arm/virt.h"
>  #include "hw/block/flash.h"
> +#include "hw/vfio/pci.h"
>  #include "hw/vfio/vfio-calxeda-xgmac.h"
>  #include "hw/vfio/vfio-amd-xgbe.h"
>  #include "hw/display/ramfb.h"
> @@ -90,6 +91,8 @@
>
>  static GlobalProperty arm_virt_compat[] = {
>      { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "false" },
> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "false" },

I think we should find a way to make this default to "false"
and only be set "true" for x86. Otherwise every single non-x86
board that ever adds support for ramfb and virtio will have
to add these two lines, which is a source of future bugs.
(Whereas if you forget to mark a new x86 board as needing
the legacy rom you'll find out about it pretty quickly.)

thanks
-- PMM
