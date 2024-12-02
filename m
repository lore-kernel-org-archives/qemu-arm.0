Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2553130njk;
        Sun, 1 Dec 2024 22:05:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWErNj6cxx8bnqpC3esUCyaMBv3Vjto3ibgbqFOlZM46SwKXP3za2WoPVu13Lo1fDeqEZkXNnvHSVP6JQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE9gff1Bd0ln+oGevJt2BxS89Zl4pfgVc/kMcyb3iacnWwxhs7uPbotYyjI/PuK71srNvcG
X-Received: by 2002:a05:6214:f63:b0:6d8:a148:9ac9 with SMTP id 6a1803df08f44-6d8a148aeb1mr74075286d6.30.1733119546481;
        Sun, 01 Dec 2024 22:05:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733119546; cv=none;
        d=google.com; s=arc-20240605;
        b=XfYjcEzhNVGfdI8Xj95ae21HeuaICSggiebYggJGSL+aH3VKd1p9gT6xVPqdah17zO
         GAlWWyaWaeeQn3vEPc+H9S8DI3hXJUxrMFhPUBzNhCTjtMkgRIBUhnio6/c/7+HtDYs2
         OQPvVGThaVTYLN2ogzqi2gGXfPANxd0xeMnMKAKIBCJVwyCRKIsvSfRF1y4/DmX3u51F
         xtiACcyXHqtlhLHjVOFGvrc4+6GypLAd+T2C2oLlZKnWAt7kzFyPM+7VnPF3HcmbnYEJ
         6PFR97aNZxvftLy4gCjPda/kpIL2CIJMqb3KJ3TcHpoCRYMwjHg7XHiOYalkMvEYjF3X
         LuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GisRIIVFJOhNsOFfrYvIqLASrIH2WPDMnI3BEboU0qQ=;
        fh=MZrLGUPlfMP44E57/Lue1SR7FA2iHPkPrB+BaBuAFBA=;
        b=ZXrTny+iNvidC8QtGdvwuwQlj+1vCSFCUITzdzATyvuttH7bIsJDulhCnTM2qfQsII
         q6xYyA4q5ld68ZApO62ATuUPYkL9FAhRZzeIw095HbRy+9PysnPcyR8hycsXw4fctiM5
         Y0uZhMHyD+GWfQwaFD2mCyjIn7vxznnU54F1j2uTYQhzsjjxJ4aZOkJ4qs5HCRmJc58Y
         3lKmoZx2Lc+BDBlbym1mYlTbPiUbO7DB2M/VGpDZAEiukPWO11lC3sOzE/QOLksJobYx
         6HDnm2u35ByjY/+mmT7zjfwr2Xa8m/abtSsfpIQTqwtMETm0DH03WRp8DmeR/7Y6UWpP
         XSqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ei/jTBY0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8751ac1fdsi106149986d6.47.2024.12.01.22.05.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 22:05:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ei/jTBY0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHzYb-00065W-Ve; Mon, 02 Dec 2024 01:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1tHzYa-000646-2I
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 01:05:16 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1tHzYX-0000zZ-47
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 01:05:15 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53de5ec22adso4584573e87.3
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 22:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733119511; x=1733724311; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GisRIIVFJOhNsOFfrYvIqLASrIH2WPDMnI3BEboU0qQ=;
 b=Ei/jTBY01wiMY81/POpRdnfBnKW9h2gHm5kHitHAhdQP8+MVZTqrQ+gMtkbzhIO7Nx
 eUcjtAbCtKHOc8w4nZaFCsojIGrvAZKXY1SBpSPCNfHqtaGHWf/NlFjNtS8N+2W0BcKS
 qFcdRjwkSO0+R/4+Oo8ucDzD5mDGKS3UM5ObwaOXn4pFanzLKYKGpYYckzHDSmL1p5Xv
 kHLLZcM7AaCyVmtDTGbUUcAWpKJ/bqBd97IGXuOKMx17iz0DkPN272i2sNgPn3uBQ1P/
 6sN85RplktKbkLUE2KJPLfDmeViA59nE8BRbW0rnH80Eu1RqVCmXpq9W9yrdUn7NyMGe
 hSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733119511; x=1733724311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GisRIIVFJOhNsOFfrYvIqLASrIH2WPDMnI3BEboU0qQ=;
 b=T9CIRgC7pb/Wg7y0na/f/tjYnb92t9881yZLlJrvaRFjMfWpvIhokfIDGUpt1Oro86
 A2bfmbhu0ELyxX/IyQnYFL0g4G/3gjh0yAgfq2TwtwgmbbRoh/VuaAZRNaeVoUGUEV+i
 PhN83ufB/B7uAgiwcsw0ltVD3UnsLwsw9cKlj8hc+L3u6Oe3C+i6ynj++AVOMorOHBy1
 CopgOx8GapgulwuOnXKnj1AAOrF2B2uTftFUsbL7o+Z1jt2FU7CX1TFvc9IGUkfj/nEJ
 iWlE/CXRQ/vWlP8aFXS/dYglcFBXXTNUx4RiAOYdM3bl9HaF0+SZVdu+cpYTGcYtFUBq
 dHMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnihTZ76TunPVb6sI1HKaZp/Pdi8yVJzSsOOCjYo2OW0aiz5jlbSQ4aNAK6NpAcqh8kXSslBZMkA==@nongnu.org
X-Gm-Message-State: AOJu0YyqhbCBLHoQDsCwUhOggcjLYdOBWIdgXtDStxhXtGP8Vs1UghPe
 kjunNatC7+QpJQoSnzZXK/8r1PfrP9srN0wH8wlJhmvCI67EngWL6dgm20j8D3SBnadWGY8xOlZ
 uVW79CWQ/o5CrUFnhb4Vt7+djbf0zACeyolc7YQ==
X-Gm-Gg: ASbGncsIhiWUtgBtIoDPyKFTCSZm8bMne1W4IqL+cg4uNop9xckda1lqwUwOyZL74re
 r5fNk8gRn3PIoKxScN2BJ8Zg2+DFxow==
X-Received: by 2002:a05:6512:3da9:b0:53d:cb91:2f3e with SMTP id
 2adb3069b0e04-53df00d1afbmr11467790e87.22.1733119510609; Sun, 01 Dec 2024
 22:05:10 -0800 (PST)
MIME-Version: 1.0
References: <ZyRUcGKKS6NbIV5O@Asurada-Nvidia>
 <20241101115501.GS10193@nvidia.com>
In-Reply-To: <20241101115501.GS10193@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Mon, 2 Dec 2024 14:04:58 +0800
Message-ID: <CABQgh9E3ba1F_4bTxkzRmt0sDmyVR+hbxocnqSvrvwerFZwiug@mail.gmail.com>
Subject: Re: nested-smmuv3 topic for QEMU/libvirt, Nov 2024
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, 
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Eric Auger <eric.auger@redhat.com>, Mostafa Saleh <smostafa@google.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Moritz Fischer <mdf@kernel.org>, 
 Michael Shavit <mshavit@google.com>, Andrea Bolognani <abologna@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 nathanc@nvidia.com, 
 arighi@nvidia.com, ianm@nvidia.com, jan@nvidia.com, mochs@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=zhangfei.gao@linaro.org; helo=mail-lf1-x132.google.com
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
X-TUID: KfQTw8zmFn3J

Hi, Nico

On Fri, 1 Nov 2024 at 19:55, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Thu, Oct 31, 2024 at 09:09:20PM -0700, Nicolin Chen wrote:
>
> > FWIW, Robin requested a different solution for MSI mapping [1], v.s.
> > the RMR one that we have been using since Eric's work. I drafted a
> > few VFIO/IOMMUFD patches for that,
>
> I also talked to MarcZ about this at LPC and he seems willing to
> consider it. It took a bit to explain everything though. So I think we
> should try in Nov/Dec

When boot qemu, reports this

qemu-system-aarch64: warning: IOMMU_IOAS_MAP failed: Bad address, PCI BAR?
qemu-system-aarch64: vfio_container_dma_map(0xaaaadd30f110,
0x8000200000, 0x10000, 0xffffb8031000) = -14 (Bad address)
qemu-system-aarch64: warning: IOMMU_IOAS_MAP failed: Bad address, PCI BAR?
qemu-system-aarch64: vfio_container_dma_map(0xaaaadd2bc310,
0x8000200000, 0x10000, 0xffffb8031000) = -14 (Bad address)
qemu-system-aarch64: warning: IOMMU_IOAS_MAP failed: Bad address, PCI BAR?
qemu-system-aarch64: vfio_container_dma_map(0xaaaadcf90000,
0x8000200000, 0x10000, 0xffffb8031000) = -14 (Bad address)

Will this also be solved in the new MSI mapping patchset?

Thanks
