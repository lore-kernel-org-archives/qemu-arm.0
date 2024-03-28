Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1181963ejv;
        Thu, 28 Mar 2024 07:56:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEUjRod9g8X0MEmAw7zP8DQs2ylp+ogUQhQw8ODItn9PBSxCLhxdn8bTe+ZeIscPT0UKaOS6x7vfJqJVqYAYJ8D4CVRB7X
X-Google-Smtp-Source: AGHT+IHfLnW5qmMP0bk819tO4L9xkW3IR8hxBGQe8BhIieSf07zwe5s8IdSSyXFcoSVnxoTnWz/X
X-Received: by 2002:a05:6808:3189:b0:3c2:4de3:2cd2 with SMTP id cd9-20020a056808318900b003c24de32cd2mr4014982oib.10.1711637762262;
        Thu, 28 Mar 2024 07:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711637762; cv=none;
        d=google.com; s=arc-20160816;
        b=hZkzjFtEI3b8IPpsypRcrsaaGYzrjhjYtqFTatg8BIfanPV8OTl2fSULXH+9o5ZWir
         2FAczRbrUjmL1KLNp+A//B9JM0h7lZi1Dau0cjIfscVq4keO3O4sKr5YyDU7bfoqJFXa
         +fY9pUweQn/XkcEgudy7MRhObPPR7MFgI3p8jXfYQtgUoglRmEmS2rgdVuSYInRsxAOF
         cJ9Xk9kEV/ak1XWrZxYWFfD3vk8B2NQ1BVP0030/4bgq8APcg77O3q8UA9CGUGx5DlPV
         rdhigqsnZLMxojuCZQ7jI3wi9apT+AywanSrEVKuyvK2juH+8c1L2PjjBx7uRsgiitMR
         m7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8TY7FcskIZBYZwKsnml/Hy1kUHUtaLEmLDD3ELdVs4c=;
        fh=+VKJYP5WM7d5bkCtXS76c21j+vU6NcnKzgiD1FfJkuQ=;
        b=zOHXthv7twtqr6lcjVNqZrSu/QaRUEqgiK7q6RpiYP5JDbhBJLKQNoMH/yfSv9LU90
         xqykfoMuiRDHj2IPORzMdswEGtA6qIWOfWmW1A7FVmP0Rl+enV1FauTvaKj4jBSvHg91
         iZ2+NW2D0KDGpDYqKi9rdaoWiHMQ09Hf+OfimeMwgKjIVFXGI382aiVWaopwqe+YHH7T
         ZQywNgS4UsXQx0mK0jBi4JjLNYgaGRAxzW79RHW0Pttg6FzahA53Mw+FHnL67fHdQ3Hu
         DIr6+d1Kegzdgqod6JC0CN9UNhA0ShVDYx7umSARM745F6dsugtMfpjfYaNNRzCXf38I
         rAhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j8hrZ6jA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a05622a004e00b004315138a4aasi1545171qtw.85.2024.03.28.07.56.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 07:56:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j8hrZ6jA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rprAd-00081h-12; Thu, 28 Mar 2024 10:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rprAb-0007yS-Sm
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 10:55:57 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rprAY-0007FL-DF
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 10:55:57 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-515c3eeea5dso989211e87.1
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711637753; x=1712242553; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8TY7FcskIZBYZwKsnml/Hy1kUHUtaLEmLDD3ELdVs4c=;
 b=j8hrZ6jAUXVbdkJ5cRJKTVXgTmQ31F5JYpXjmOonZby7kE/hmn3CwHviDizomY7MMb
 /+KvzqRNnpmrHMlWNHk2BYMZxP66prD280p5iiPDk3lEL1KvkdGwKhj3Dvn8xcttx6M7
 34A8Sr2mWLUHeVrio6Q9zZCyPHbHSh6s3gG1yqTCHvok+Qu/AaMP055VcA6bzm67ulFR
 Deae188l73Jfec1YJaCBXGYzF1+pWvtUisYLd/qXD83yJEsoJ/1Own3aZvi/InZMoPC8
 dlZRB5C6m0tVmReB2OhPzWZPaZQQmFMjhnlal85xTPAWnJXgOHcbI+ZM1Af33uuxExCx
 TCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711637753; x=1712242553;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8TY7FcskIZBYZwKsnml/Hy1kUHUtaLEmLDD3ELdVs4c=;
 b=hFbavaENoVTr1pCqGSG2EZ4qFPynD8h6ZFmlLsRHwsqwamiGd102Xwgp/hVP5ymnR+
 ZuPMQVcgIeXjNXcSmK4U9pYsbd91G1kH82YC14LNpIC67j4R0TErkE8PIkA95+uprqTG
 LzwNztQIJpb4b03dTZqMjI9fq01zTaW7x+98ke2zTvHfZ+SHS25ZSaRX3FdzB8Z6QWut
 KZPvHCV+H0hyToRgU2GScb+fSeW9f+8WFicfxzJH/W9v6wF7EmsscXm40DJYgUvks4lL
 6oDDDIP9K+muaFkGimd7GxxIZfVSc0j7VNoBACquyCuYqfm5AUyYMwKrvqXJAMUieRIN
 LxUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvpP+5B2H/UNdltKIvXNIH3w9v1P4x2hw+75Kyl052IZ9LTKkgxRWvsk0v+zZWBhPhEB795v0CEYdUSMKh0LOjZGEV
X-Gm-Message-State: AOJu0YwAZEgMjHB4lC0gtUF59kB9abvYJdaNVEcKXUc/kkfQZhgvdFNc
 hsRiWR+RF9HWPwt6Y0C0DfkjRaEeDSCs928MRusdkklLzUGypdDGCQe2+F7uBRiRa8ffKGGvE1E
 nWHWFtjtrcLnh8iMzlBTQuFQfWDddVIdFm6J+aQ==
X-Received: by 2002:a05:6512:2f1:b0:513:1577:3d66 with SMTP id
 m17-20020a05651202f100b0051315773d66mr2162929lfq.64.1711637752622; Thu, 28
 Mar 2024 07:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
 <20240325084854.3010562-12-ruanjinjie@huawei.com>
In-Reply-To: <20240325084854.3010562-12-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2024 14:55:41 +0000
Message-ID: <CAFEAcA912XopYLBo52PEczE8tSp4BPJB-Oxke3OQRW_X-Wrh2g@mail.gmail.com>
Subject: Re: [PATCH v10 11/23] hw/intc/arm_gicv3: Add external IRQ lines for
 NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12f.google.com
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
X-TUID: n1RcPrjs4GKv

On Mon, 25 Mar 2024 at 08:52, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Augment the GICv3's QOM device interface by adding one
> new set of sysbus IRQ line, to signal NMI to each CPU.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
