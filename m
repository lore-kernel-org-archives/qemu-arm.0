Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp37488njb;
        Mon, 17 Feb 2025 05:37:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZ4LE/jgy0dwxLOzag1QQ8Cabfvh3gRR9vibn225wqiJFcX4IEefoRkUaF/jlX0UTvlSvK4M4mEI1WHw==@linaro.org
X-Google-Smtp-Source: AGHT+IGXxnLzF93rhmScwLIRiQr+lvVYuDc4Qu7lkEw8eqJ3INpQwUzhSrH3SvYYISbKOfL4QXVg
X-Received: by 2002:a05:620a:808a:b0:7b6:d241:3f07 with SMTP id af79cd13be357-7c07a8b3e46mr2608398285a.15.1739799428426;
        Mon, 17 Feb 2025 05:37:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739799428; cv=none;
        d=google.com; s=arc-20240605;
        b=LwRMBgju8yDI2AlCx4EziRlisuNBV5uDfiHTwaO2Qk7O4sKXRephgRB8YMnlQt9gyd
         GFth1lYNQ+Ey2E8rjHV8D4tD1V9VJr5nNupaRQeWlMEM7qP/Eiwy0r9PA6RH5yx1DNcP
         MCqKvQkSSj2G4jwOX3182YoWTZARkLxClUXlv2akicidB+un1qXTJTneZfXlTBnUkaKf
         Q4nfwzTjuKQYKndvcrhB0py9jX/nBjA5fF3agVGCKAeNhfcKek/MEqsurI+uz1e4+Sye
         zhpk5DkZsDitB8EZTxcH+C2pDDQawdzXwfqODsICLCk1vi/aKgex27W9N3uB+72ETr1t
         h4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6c6UHa65sfkfOyhFhg5Qtleo7e4M0fY7yLvKY4FAG2I=;
        fh=X0KHQeAPMAAafq3QAzggKbNc35Ad7RcAaT3XuD929Lc=;
        b=eaKq8/hSjYcbDJvRGxhwNDmd6khh/j66susK7tr4S5oNJYDwsShAHgbjASuxbEXamh
         PMBzCHm12V5G4Vdf2F5Eedz1yDzNGSCZTssvEtwqk2vvKJwOriiFHc7SCWdC5C3kiHjk
         p6B1H5tB1JfKo7X5kWUQSnJbxL2dkJ0b5A7EXfK5cQ17+IY3dRQ73oxNbdaqGURLwl4e
         W+92yVDjFCohShIlxMhTfMDowkZU0mjQJCp2HpfO23G+GxndvAKbnEO4OT+NUvkDKJuj
         cDXO46eEZ7150cJVc7B//bxXwnrcTZmRCos8GirNlcO3irr4dQcMA9kuInddQafCCoue
         0Z8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pXKzJTWA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c09fe53f0fsi172943985a.540.2025.02.17.05.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 05:37:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pXKzJTWA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tk1J0-0006km-Nf; Mon, 17 Feb 2025 08:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk1Il-0006eS-Pp
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:36:49 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk1Ik-00020G-3k
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:36:47 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6f768e9be1aso43395597b3.0
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2025 05:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739799405; x=1740404205; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6c6UHa65sfkfOyhFhg5Qtleo7e4M0fY7yLvKY4FAG2I=;
 b=pXKzJTWAxJpSOmg48Q9tp3++xbEJtf19V247r7+R95xJERUemfqP4hGbVHgtd9HTA7
 yOnp4+jgg++h5X50wNVvystmpoNuTs4mppjbPJ+JelpIkRMEQsI/df9x1DKNgl1Sv5Kd
 KZc8PdAfH3XcF/AR/ASt+PBTLi9guQBZ1n3OhmPNYzTnecQQTv+fZzloYNINn40TpzA1
 88qPfPiRZ1kVcCCKmxYXynAYOIvY4YThk70oIMsctwoJ2aovuTw9vjEOKkGHNo5qTI+9
 Ty7G1zqRBQWwrMCnygtoXChmJVyM/0d700Va2FqE96R+BkYrNKXOzx12ee8eLZDA79hG
 /eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739799405; x=1740404205;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6c6UHa65sfkfOyhFhg5Qtleo7e4M0fY7yLvKY4FAG2I=;
 b=phLoXIWW77oxs5IzDZ3ccjcPoi8VWOetxSh2n/+awuFj3bsJcBvUgHf0FVSaRb47J/
 9PlBB4mNhPS1WEBhLPuSWm5zCFI70D6R+RQ7XY5pm0fkkft5vXLtbw+uR+Qk4EYCyla1
 LU5E1fCZfTjG8y7ITXZ7KPEPnRIvJd8EnrdUmrBu5ZmiFMp+Z30BZl2vxe+E05NFkbK7
 PS81kC8t4KWkj8gUvxkCxdwZVNs0Q3c1RwP1B11EUovzYYuGDJiBVcXQ6sfnhBSkgT+P
 8U+rbUcopiwe1j7bM8euVe9JkQ1g99iTxPzWApbJnRzxtq22QrpYnEWrHx7Xs1NP8Ph1
 tNEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEiUgEiXkfTNGJW9zpXn7aXHB7P3PHekgmRholZ4Ht02DxbASNJ7zBcx+6C3tS6LBjtUuoT8CFag==@nongnu.org
X-Gm-Message-State: AOJu0Yzt468+kgxRqPYx51Ui/R/a/0Ngdt5tkw6Mx82LGkz7CQNtDJAO
 9FbNuABkhO9Ct5cNKsKcxWhYGNbiTVrmOldJ2YtOdzBDTiLs4RZR0lT0fW2aMowIscsaqT/FQsu
 Rg+PeDltGciiDVIeQKl+VIGakccG+TXVWfbvFvQ==
X-Gm-Gg: ASbGncv0Xs6K2mwDg8zsKXyYnE79PJQFYlxRSbKoUFNkaOt/mvXOm0zpEmty0sm/Edq
 ktPZtSM39MnAs/BdDq6R/ITZRpkr/F+C/X5Z5lIGH5SamZ2V1rfDJ/ILnAcobtufHHIjXMZDf3A
 ==
X-Received: by 2002:a05:6902:1007:b0:e5b:3d71:bfe5 with SMTP id
 3f1490d57ef6-e5dc97f5886mr8021373276.3.1739799404769; Mon, 17 Feb 2025
 05:36:44 -0800 (PST)
MIME-Version: 1.0
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-3-shentey@gmail.com>
In-Reply-To: <20250204092112.26957-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 13:36:32 +0000
X-Gm-Features: AWEUYZlPIZZZL_oRsKyhVAFrnYinW2M1TXvrTBtgzbTL6lKwNNpSDbyThTYpjds
Message-ID: <CAFEAcA-RTdb9tbR-CD0NaqW5+kqMvat9QnLQbcW=FfY4ZQifhg@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] hw/pci-host/designware: Prevent device
 attachment on internal PCIe root bus
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
X-TUID: m2inPEkBp/Hy

On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail.com> wrote:
>
> On the real device, the PCIe root bus is only connected to a PCIe bridge and
> does not allow for direct attachment of devices. Doing so in QEMU results in no
> PCI devices being detected by Linux. Instead, PCI devices should plug into the
> secondary PCIe bus spawned by the internal PCIe bridge.
>
> Unfortunately, QEMU defaults to plugging devices into the PCIe root bus. To work
> around this, every PCI device created on the command line needs an extra
> `bus=dw-pcie` option which is error prone. Fix that by marking the PCIe root bus
> as full which makes QEMU decend into the child PCIe bus.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/pci-host/designware.h |  7 +++++++
>  hw/pci-host/designware.c         | 18 +++++++++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
> index bf8b278978..a35a3bd06c 100644
> --- a/include/hw/pci-host/designware.h
> +++ b/include/hw/pci-host/designware.h
> @@ -25,12 +25,19 @@
>  #include "hw/pci/pci_bridge.h"
>  #include "qom/object.h"
>
> +#define TYPE_DESIGNWARE_PCIE_ROOT_BUS "designware-pcie-root-BUS"
> +OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIERootBus, DESIGNWARE_PCIE_ROOT_BUS)
> +
>  #define TYPE_DESIGNWARE_PCIE_HOST "designware-pcie-host"
>  OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIEHost, DESIGNWARE_PCIE_HOST)
>
>  #define TYPE_DESIGNWARE_PCIE_ROOT "designware-pcie-root"
>  OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIERoot, DESIGNWARE_PCIE_ROOT)
>
> +struct DesignwarePCIERootBus {
> +    PCIBus parent;
> +};
> +
>  typedef struct DesignwarePCIEViewport {
>      DesignwarePCIERoot *root;
>
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 3e8c36e6a7..c07740bfaa 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -55,6 +55,17 @@
>  #define DESIGNWARE_PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
>  #define DESIGNWARE_PCIE_ATU_UPPER_TARGET           0x91C
>
> +static void designware_pcie_root_bus_class_init(ObjectClass *klass, void *data)
> +{
> +    BusClass *k = BUS_CLASS(klass);
> +
> +    /*
> +     * Designware has only a single root complex. Enforce the limit on the
> +     * parent bus
> +     */
> +    k->max_dev = 1;
> +}

This seems to be what we do in at least one other PCI host
controller, so

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
