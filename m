Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3398861njk;
        Tue, 28 Jan 2025 13:54:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOl6C3TVpJp8+KCR62+sUl3TwCR2y7uokOdMBZy/3mZKHGCPSK/bZHH20XiCPAQGvyAZIUYB6KDmEqZw==@linaro.org
X-Google-Smtp-Source: AGHT+IFtWrOF9J5FtVRNQU5A3TB5W0bSODcusrGTRvsENyPzDY6mOgH6aH5+ZSIfQwHNRyE5U/rX
X-Received: by 2002:a05:6214:d0c:b0:6cb:d1ae:27a6 with SMTP id 6a1803df08f44-6e243c3d367mr11364126d6.24.1738101250898;
        Tue, 28 Jan 2025 13:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738101250; cv=none;
        d=google.com; s=arc-20240605;
        b=HENOR3ZBmDW4tY8rXbj9qsjbWA+bhlQQ6K/jbRMjtgnyYqFmuCDOBSqvRNL+YKLOGh
         0iyxFxuJ3dpvKFkO9xk4f0c8A5j6E9DOoslMANxal9CE5XBEm/jrZ8wK6kk3qgFJ4+ls
         PVqQiZrOWttWeyJVHoUzKxinEsRXBsLy8+XHV0XNFXb96i1QXvPt4+finPyBXC0v6uux
         tvo6L5NzxQBCAVl8I1yy5x4q/peVl8z5GDVv5eXDr0VGY6U2TG9KVs5/DS+A5Dy8t94i
         Qg2auhegcm3oCzVOOS2kPtIfjWK1ANe+x7OIKVBLEFSX7JvYyhmw37BFvI2hCzkp50G6
         Ft3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=pdvvjMccK7T6CukrXbRsD3VUnuJMdZyPkQbI6b4Hk9I=;
        fh=CenDZScko71k5a6nw9ykeyXft7x/LwuMLfc6rpLgJqU=;
        b=EUWgTgeaSGWZc4/UN0mZ3ZP52Oe1T0KyXr5UM5Bw7foZQ3P23Sxgt+vSVyYiGT15Yq
         g9CyPnXgtIgwZ6M1UOoiGH/LfCiIu3L6AB+ky2UyAlrP0EJIv+xP4ohn7P+aOOpAVGzQ
         VjCVTAXadyhpCwSgTQPUkGYtALY9/iUZjAKwjHrzK7Igfq//d10mm38dzMGb4V7sL+oa
         TU28uRuP5tzY1E8+qG1N+rBbqQv+dUbd0KRzS3/ekhnJknbRDdo+bby+dFdAux9XdV1e
         tIlpHQJRKw97Xx8xJJ9lg7dcZsGhlSV/o7IpzXpnkZZClTj+MIQy8J0A9POwTvOzCThh
         8Vsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZLR2S3Ed;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205df5c3dsi150251006d6.205.2025.01.28.13.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 13:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZLR2S3Ed;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tctWR-0007bU-O5; Tue, 28 Jan 2025 16:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tctWQ-0007aw-7e; Tue, 28 Jan 2025 16:53:26 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tctWO-0001w7-Do; Tue, 28 Jan 2025 16:53:25 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso11116015a12.0; 
 Tue, 28 Jan 2025 13:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738101202; x=1738706002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pdvvjMccK7T6CukrXbRsD3VUnuJMdZyPkQbI6b4Hk9I=;
 b=ZLR2S3Ed8n1g0AicGUuqVWgrjwf3xYguKWl/yqJaXMfpfvR2Z9VDLU8T0VgBmPQiRJ
 7Yu2uUozLOGiJE5zDgzHtCCsIJphBZ68DzPX1z/01+PnNIDhp901tze+O+Yg+OEo5qgx
 5N3H0cZQ3N1RWh9gfFW27W1ZBIWpZZMtvh9vNON60J4DX7km7V9HXjiQGhffN3mcE9o4
 2X7iVzO4GzjNneIr1W4Ee6//iZNGecOh3Csm8b3luXXRtF8GCLw36aUg5VB8zg1gOvEM
 Q0N55pd5C45lNNdMmBn4HwhuYtz7x63ck6mY95Sutidfv81b+hdpE2YZfMMaAgDOag4L
 UlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738101202; x=1738706002;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pdvvjMccK7T6CukrXbRsD3VUnuJMdZyPkQbI6b4Hk9I=;
 b=K/TOwE1lwvOLhlWPFnkkX94O6Im6Z4bNrguNu6H0JssCjbarkdeLybQ2v2n9CEBNQy
 HdktXMBg03+FYEtUCZ3BcENp+q5g8sbGIE1LOThdEPoJObAoolJ60IsKeERgwaF60lZv
 ROrDMNRDrNBb1RM3ttDuKmRJkb3eFxLiZX6jv60jZpRKAU8VA0NpjydHiX1VFgyCwDur
 j5J0PuVvcVOeNq5WKJlNLKTrJ++yP1qJlT8Mw2SW/IsIC87IfsOrGpnKwsyvaewLkgC6
 Nm7UhBCDSdj701oNrGgY3wyddM8cWA/f7TWqyB9MVF02qNg1ISq6M9z+XCLvuWsKwnbp
 4oZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+35eLYYlZLEj0J8aqqxL35X0XKfdCxH0PNVNlf7W4Oydc78VtbPaiNxiobICEV1HdmeVUbX4XIw==@nongnu.org
X-Gm-Message-State: AOJu0YwqoswGnA+WEi1s4X2o4VQOkrlY8FvMqPYx61C0rv4+mvjjLx7a
 K6Q1OYwoCqYznQTbQd9IGj8X86dkUL3tx32TLBDllaJSiaUJVa4s
X-Gm-Gg: ASbGncvdTQ5YrreAJ1w6IjdkTVBiFKNGCPc586Vk6XiqerwLb54pmx5gOr1k3A66hOf
 n1BQEorQwxAP3I7eimz6ZGoApnClIIyXLP3wvDwvhnY0wTHdW0ffiWuOZ3Z6tsqp28Jifbo7xiJ
 VV8r6Me8Mv55SAAdVi16BUX29BldNsjlN0X0IwgI3VRrYgQ6CVS9Plza/9+w+L259sEb0poboAN
 54vtY6vgkubzDmuy2Jr2O8fb+MFsFD+ZCWAvLBmt2Ia6OTZ41j861CzZMWc1yF83wkAOTLdMiYm
 rJpWLkdNHNYA2/hmMsJyLdTdISyjKo+1IY1QXldTgtAsiei4AMoWuGkdxYH7Wx6B
X-Received: by 2002:a05:6402:524d:b0:5dc:4f4:74c3 with SMTP id
 4fb4d7f45d1cf-5dc5efa8eb6mr458102a12.4.1738101201936; 
 Tue, 28 Jan 2025 13:53:21 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-042-254.89.12.pool.telefonica.de.
 [89.12.42.254]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186183b4sm7789840a12.4.2025.01.28.13.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 13:53:21 -0800 (PST)
Date: Tue, 28 Jan 2025 21:53:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH 06/21] hw/arm/fsl-imx8mp: Implement clock tree
In-Reply-To: <CAFEAcA8Ox+CjVVgPWciFOPv748tvCSOHpcQn_ihwCXAvSNnk8Q@mail.gmail.com>
References: <20250120203748.4687-1-shentey@gmail.com>
 <20250120203748.4687-7-shentey@gmail.com>
 <CAFEAcA8Ox+CjVVgPWciFOPv748tvCSOHpcQn_ihwCXAvSNnk8Q@mail.gmail.com>
Message-ID: <C5F68E08-2125-4EAC-B114-559F253AC20F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: zciv8hHDbGny



Am 28=2E Januar 2025 14:35:14 UTC schrieb Peter Maydell <peter=2Emaydell@l=
inaro=2Eorg>:
>On Mon, 20 Jan 2025 at 20:38, Bernhard Beschow <shentey@gmail=2Ecom> wrot=
e:
>>
>> Fixes quite a few stack traces during the Linux boot process=2E Also pr=
ovides the
>> clocks for devices added later, e=2Eg=2E enet1=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  MAINTAINERS                    |   2 +
>>  docs/system/arm/imx8mp-evk=2Erst |   1 +
>>  include/hw/arm/fsl-imx8mp=2Eh    |   3 +
>>  include/hw/misc/imx8mp_ccm=2Eh   |  97 ++++++++++
>>  hw/arm/fsl-imx8mp=2Ec            |  20 +++
>>  hw/misc/imx8mp_ccm=2Ec           | 315 +++++++++++++++++++++++++++++++=
++
>>  hw/misc/meson=2Ebuild            |   1 +
>>  7 files changed, 439 insertions(+)
>>  create mode 100644 include/hw/misc/imx8mp_ccm=2Eh
>>  create mode 100644 hw/misc/imx8mp_ccm=2Ec
>> diff --git a/include/hw/misc/imx8mp_ccm=2Eh b/include/hw/misc/imx8mp_cc=
m=2Eh
>> new file mode 100644
>> index 0000000000=2E=2E2378c157de
>> --- /dev/null
>> +++ b/include/hw/misc/imx8mp_ccm=2Eh
>> @@ -0,0 +1,97 @@
>> +/*
>> + * Copyright (c) 2025 Bernhard Beschow <shentey@gmail=2Ecom>
>> + *
>> + * i=2EMX8MP CCM, ANALOG IP blocks emulation code
>> + *
>> + * SPDX-License-Identifier: GPL-2=2E0-or-later
>> + */
>> +
>> +#ifndef IMX8MP_CCM_H
>> +#define IMX8MP_CCM_H
>> +
>> +#include "hw/misc/imx_ccm=2Eh"
>> +#include "qom/object=2Eh"
>> +
>> +enum IMX8MPAnalogRegisters {
>> +    ANALOG_AUDIO_PLL1_GEN_CTRL =3D 0x000 / 4,
>> +    ANALOG_AUDIO_PLL1_FDIV_CTL0 =3D 0x004 / 4,
>> +    ANALOG_AUDIO_PLL1_FDIV_CTL1 =3D 0x008 / 4,
>> +    ANALOG_AUDIO_PLL1_SSCG_CTRL =3D 0x00c / 4,
>> +    ANALOG_AUDIO_PLL1_MNIT_CTRL =3D 0x010 / 4,
>> +    ANALOG_AUDIO_PLL2_GEN_CTRL =3D 0x014 / 4,
>> +    ANALOG_AUDIO_PLL2_FDIV_CTL0 =3D 0x018 / 4,
>> +    ANALOG_AUDIO_PLL2_FDIV_CTL1 =3D 0x01c / 4,
>> +    ANALOG_AUDIO_PLL2_SSCG_CTRL =3D 0x020 / 4,
>> +    ANALOG_AUDIO_PLL2_MNIT_CTRL =3D 0x024 / 4,
>> +    ANALOG_VIDEO_PLL1_GEN_CTRL =3D 0x028 / 4,
>> +    ANALOG_VIDEO_PLL1_FDIV_CTL0 =3D 0x02c / 4,
>> +    ANALOG_VIDEO_PLL1_FDIV_CTL1 =3D 0x030 / 4,
>> +    ANALOG_VIDEO_PLL1_SSCG_CTRL =3D 0x034 / 4,
>> +    ANALOG_VIDEO_PLL1_MNIT_CTRL =3D 0x038 / 4,
>> +    ANALOG_DRAM_PLL_GEN_CTRL =3D 0x050 / 4,
>> +    ANALOG_DRAM_PLL_FDIV_CTL0 =3D 0x054 / 4,
>> +    ANALOG_DRAM_PLL_FDIV_CTL1 =3D 0x058 / 4,
>> +    ANALOG_DRAM_PLL_SSCG_CTRL =3D 0x05c / 4,
>> +    ANALOG_DRAM_PLL_MNIT_CTRL =3D 0x060 / 4,
>> +    ANALOG_GPU_PLL_GEN_CTRL =3D 0x064 / 4,
>> +    ANALOG_GPU_PLL_FDIV_CTL0 =3D 0x068 / 4,
>> +    ANALOG_GPU_PLL_LOCKD_CTRL =3D 0x06c / 4,
>> +    ANALOG_GPU_PLL_MNIT_CTRL =3D 0x070 / 4,
>> +    ANALOG_VPU_PLL_GEN_CTRL =3D 0x074 / 4,
>> +    ANALOG_VPU_PLL_FDIV_CTL0 =3D 0x078 / 4,
>> +    ANALOG_VPU_PLL_LOCKD_CTRL =3D 0x07c / 4,
>> +    ANALOG_VPU_PLL_MNIT_CTRL =3D 0x080 / 4,
>> +    ANALOG_ARM_PLL_GEN_CTRL =3D 0x084 / 4,
>> +    ANALOG_ARM_PLL_FDIV_CTL0 =3D 0x088 / 4,
>> +    ANALOG_ARM_PLL_LOCKD_CTRL =3D 0x08c / 4,
>> +    ANALOG_ARM_PLL_MNIT_CTRL =3D 0x090 / 4,
>> +    ANALOG_SYS_PLL1_GEN_CTRL =3D 0x094 / 4,
>> +    ANALOG_SYS_PLL1_FDIV_CTL0 =3D 0x098 / 4,
>> +    ANALOG_SYS_PLL1_LOCKD_CTRL =3D 0x09c / 4,
>> +    ANALOG_SYS_PLL1_MNIT_CTRL =3D 0x100 / 4,
>> +    ANALOG_SYS_PLL2_GEN_CTRL =3D 0x104 / 4,
>> +    ANALOG_SYS_PLL2_FDIV_CTL0 =3D 0x108 / 4,
>> +    ANALOG_SYS_PLL2_LOCKD_CTRL =3D 0x10c / 4,
>> +    ANALOG_SYS_PLL2_MNIT_CTRL =3D 0x110 / 4,
>> +    ANALOG_SYS_PLL3_GEN_CTRL =3D 0x114 / 4,
>> +    ANALOG_SYS_PLL3_FDIV_CTL0 =3D 0x118 / 4,
>> +    ANALOG_SYS_PLL3_LOCKD_CTRL =3D 0x11c / 4,
>> +    ANALOG_SYS_PLL3_MNIT_CTRL =3D 0x120 / 4,
>> +    ANALOG_OSC_MISC_CFG =3D 0x124 / 4,
>> +    ANALOG_ANAMIX_PLL_MNIT_CTL =3D 0x128 / 4,
>> +
>> +    ANALOG_DIGPROG =3D 0x800 / 4,
>> +    ANALOG_MAX,
>> +};
>> +
>> +enum IMX8MPCCMRegisters {
>> +    CCM_MAX =3D 0xc6fc / sizeof(uint32_t) + 1,
>> +};
>> +
>> +#define TYPE_IMX8MP_CCM "imx8mp=2Eccm"
>> +OBJECT_DECLARE_SIMPLE_TYPE(IMX8MPCCMState, IMX8MP_CCM)
>> +
>> +struct IMX8MPCCMState {
>> +    IMXCCMState parent_obj;
>> +
>> +    MemoryRegion iomem;
>> +
>> +    uint32_t ccm[CCM_MAX];
>> +};
>> +
>> +
>> +#define TYPE_IMX8MP_ANALOG "imx8mp=2Eanalog"
>> +OBJECT_DECLARE_SIMPLE_TYPE(IMX8MPAnalogState, IMX8MP_ANALOG)
>> +
>> +struct IMX8MPAnalogState {
>> +    IMXCCMState parent_obj;
>> +
>> +    struct {
>> +        MemoryRegion container;
>> +        MemoryRegion analog;
>> +    } mmio;
>> +
>> +    uint32_t analog[ANALOG_MAX];
>> +};
>> +
>> +#endif /* IMX8MP_CCM_H */
>
>This seems to be implementing two separate devices in a single
>source file=2E Generally we prefer one device per file=2E Is
>there a reason they can't be split?

I took inspiration from i=2Emx7 where these two are also implemented in on=
e file, presumably because both share some code=2E This isn't the case here=
 so I'm more than happy to split=2E

Best regards,
Bernhard

>
>thanks
>-- PMM
