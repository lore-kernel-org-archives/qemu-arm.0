Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp286101ejb;
        Thu, 1 Feb 2024 06:59:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkWB+9kZnj1Byr1A4QS3wP1Gme6zriFdzQ3HKvDTRBhGrrHUaONb20fKNU+ERaoySxP7GY
X-Received: by 2002:a05:620a:2451:b0:783:e3cf:5e5b with SMTP id h17-20020a05620a245100b00783e3cf5e5bmr3304063qkn.74.1706799590856;
        Thu, 01 Feb 2024 06:59:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706799590; cv=none;
        d=google.com; s=arc-20160816;
        b=ylnchcTqRm8jOC8fOjJm+a+51vWN05lGYPIh2a0BLS/O+xmeQsA+R9DisTNPt2gkR2
         a8xuSsU1I+YFwc/aRrB0DKignZ00VwQvGdKDQ270DoLLiJ17IMPB0WMJdctV/EphGsm1
         esv1ZilbeDkZt7sb6pXopz9/rjA7TeNsVrLvJizJJYqdt5DqdwsI/yOnVqi6+2+Li7ZN
         o1AL0yaTBDgtmjzit0IqG/1YR5//CQyGHu5Rhczcm5J/RKTHbjgsGwDwGLpeG1ygxHAq
         52+gWLLQ9AnY1Igdu88jMKzOPmdV/Xc/8kORKPVG0F7CzWBm95nAapDQbKtuz/Ano8zF
         Lq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PvE5C8HCEnxkanwInSxFVTeh2/qCg7CiB21pHrxsEPI=;
        fh=LcuS39zFdRWtMju9vKEDkBtXM1tW10kawKy+1sEPQBk=;
        b=kDbJalxI7qwr99Ch20FN8wbhCrjbPml3mkt/9Qq+EuofXNje3IQ/Iw48v2CCzdd2+L
         ThdzV/Sfoe3MKBQ0yHdgAUcrvEnuMEjFaAZpZd3pYrHL+XQ5YhMF/rWTn8wDldUnnVjt
         3Ru+TtXDIggKyHs2VaHyT/XUB4vUBTecbFx/ByxhDCapeNbIZKf7cfl0zanbJQDlQCVP
         p3oYIuaU25lDZ5bHMWb78Et1K29Khka6Wrw3sB0z+qLI98L6mSrlS8WMwDbRqaQGsxj5
         0BWc75MzeZl4RQUA/uTT1MvF1zKGlNccvXi/CoC3SOGkdIrku7+s1O60yKEMtFZH1pkY
         8Pxg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a4yzwCf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCW+aGwaM/Sy9sCloluZi3FhbflAr3bj3IbZNz/3z37aKeC/nfnJJzizxIum84sG0MprC8CfdPcbSfp9O1+99hEw+aab3TU0
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020a37db09000000b00783da2644b0si13576144qki.696.2024.02.01.06.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 06:59:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a4yzwCf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVYWy-0002dp-FB; Thu, 01 Feb 2024 09:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVYWp-0002cS-Gy
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 09:59:03 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVYWm-0001c4-1N
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 09:58:59 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-55f15762840so1196291a12.0
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 06:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706799531; x=1707404331; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PvE5C8HCEnxkanwInSxFVTeh2/qCg7CiB21pHrxsEPI=;
 b=a4yzwCf8fAEotaL625/dQp/7MlU94v0m8wns+gr5RS3Ib3o9SiLu+NQh/0MfrQzTcf
 s8599fPwFZxrWmE2xBCRUUn3oDH9bnF5sZ9n7fWLzHY/PT0RJ8PzgmH7ywIMbBrtyU2/
 v1lcnvxFfhIlivwr65MiQhD1+6ZwNN3wnaDLlermJj3HQAKUFohL0syDegepOreusveA
 bTrD7kycPENtUZWfXIPpWq3MqhcAAb/XSd9W+n5Q57KH0u1uIX8Lh7dikDxWhcJgTntD
 vSygSO3dF/RJvIKJorl1t92m6fbVhqCIFGMuXDyt2K7dIq2Knr84dXggZcoBHNnHirk4
 qP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706799531; x=1707404331;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PvE5C8HCEnxkanwInSxFVTeh2/qCg7CiB21pHrxsEPI=;
 b=P1t94NnKNOtRWkwZGP7ElsYYX84jGji/ETnR6bVE2Xb5slFL0LNOpMfyfZJS6+uNRF
 CMQ6j4BdTrk77MIHJMkNWdydKM2fIsXoIO5L6ra8q/FuY4306PgnTajOq8XgXzfEHQXu
 RKkCF51X5y3JdxzhF4UEBSwYbwZSKvNaXvFWa5DAME7Cmr0WpTW8jDqUq1g6ejM9Tsdm
 Ie6xoGZU2S88DJfKHAtMH6NqSyyqhn3uLqV28w8fVVOFo2WrW2sS3THEr93E3TV9zghW
 0Jv6BSVMgpinEbfedkCogXt7ZF3h3c6DoEjBp1RIYNl2B7G2MaBMCYyWEFgrFvaYWcA2
 XLYA==
X-Gm-Message-State: AOJu0YwYISxvQxGIGmGWzJM7TqL/fmpLAGDeYXHBBCo8J4CO/4WZcgSf
 1w9mIh00vmU8qEoA2Qd4d32yPRyz0iVwQraa9eJiMPweTE7yJiG9+9nUxNYK2t1D6WgHMZprmft
 9AJ5Eo3KjjUaXo0N5A4p2Hrr5ilb59gOmFoSh4w==
X-Received: by 2002:a50:ed91:0:b0:55f:4ce3:5988 with SMTP id
 h17-20020a50ed91000000b0055f4ce35988mr3263343edr.8.1706799531593; Thu, 01 Feb
 2024 06:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20240129060055.2616989-1-linux@roeck-us.net>
In-Reply-To: <20240129060055.2616989-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 14:58:40 +0000
Message-ID: <CAFEAcA-pOdoSdRPDc-cpKyoRq0s309zR_0osDaLJqcdy9iy+6w@mail.gmail.com>
Subject: Re: [PATCH] pci-host: designware: Limit value range of iATU viewport
 register
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Nikita Ostrenkov <n.ostrenkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: c+qhwnk5OMgq

On Mon, 29 Jan 2024 at 06:00, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The latest version of qemu (v8.2.0-869-g7a1dc45af5) crashes when booting
> the mcimx7d-sabre emulation with Linux v5.11 and later.
>
> qemu-system-arm: ../system/memory.c:2750: memory_region_set_alias_offset: Assertion `mr->alias' failed.
>
> Problem is that the Designware PCIe emulation accepts the full value range
> for the iATU Viewport Register. However, both hardware and emulation only
> support four inbound and four outbound viewports.
>
> The Linux kernel determines the number of supported viewports by writing
> 0xff into the viewport register and reading the value back. The expected
> value when reading the register is the highest supported viewport index.

This behaviour by the kernel seems to me to be out of spec.
Looking at the "i.MX6 6Dual/6Quad Applications Processor Referenc
Manual IMXDQRM" it says about the PCIE_PL_iATUVR register field
Region_Index: "Must not be set to a value greater than 3"
(there being 4 regions in this case).
Plus it says elsewhere that software "should" write all-0s to
reserved fields, and bits [7:4] are reserved in this register.

> Match that code by masking the supported viewport value range when the
> register is written. With this change, the Linux kernel reports
>
> imx6q-pcie 33800000.pcie: iATU: unroll F, 4 ob, 4 ib, align 0K, limit 4G
>
> as expected and supported.

However given this is presumably what the hardware does in this
case where the guest does something out of spec, and we definitely
need to do something to avoid asserting, we should take this patch.

>
> Fixes: d64e5eabc4c7 ("pci: Add support for Designware IP block")
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/pci-host/designware.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index dd9e389c07..c25d50f1c6 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -340,6 +340,8 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
>          break;
>
>      case DESIGNWARE_PCIE_ATU_VIEWPORT:
> +        val &= DESIGNWARE_PCIE_ATU_REGION_INBOUND |
> +                (DESIGNWARE_PCIE_NUM_VIEWPORTS - 1);
>          root->atu_viewport = val;
>          break;

Applied to target-arm.next, thanks.

-- PMM
