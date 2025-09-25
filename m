Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E34CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 16:41:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1p1l-0008CM-F8; Thu, 25 Sep 2025 12:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1p1h-00089q-DY
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 12:41:02 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1p1V-0006Uo-2G
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 12:41:01 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-633b87e7b9fso687233d50.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 09:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758818438; x=1759423238; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a1SrA9qW8iJXA9m4RI6rO99YKCYpL7/K1t0xvBg+EYg=;
 b=K/tPgmuLFy76l9JQNPhFForyRP8Sd96MXHMKpA3ttNS0mZ3uW+ylCXjiYIRI7H+fec
 EMYNlDB0/WEgcMert3p3zDkZej2ro7j/DuSc8UaczKo/CCewc75CB6bIjxqhWoQHPidg
 b7wTwSjuYuQLQFATc/oHQ9OJRb6y46Aq8Bi9EGNgWaRN24MywjXRKS3g3xqqSByEaxzR
 Zsvic8Ph5reD08s1+sJsFN/zqj6KPN6Gv0zPVf43kBOF50N1cLs/5oXV5Hkh4+pg6rAN
 v8jLCYYDpXjkklK5XcTfkREf2vaFnMetF7Y6E39rMDhieKASYHUTeneT5DySSU+VaxAX
 4+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758818438; x=1759423238;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a1SrA9qW8iJXA9m4RI6rO99YKCYpL7/K1t0xvBg+EYg=;
 b=NuNs4mzXuqF1cx7j0WTOvPNu0NeR2VYrDXdLB2A1Y3j15Qib5VA1dcH26LXrEalQeT
 lTu8659Gd2zJGWvEeWrPRtK1/2yMbVhm0Dac179wzt7hectWMDnZQmq1qTUZQ+X+OR2u
 v4s9zCwvRUn+T/1pRe2Adi/JjH02a1t+KkhN1PbFrL0PVydj4Pc7v1B/MuaP/bh5d/4K
 4iagteNMd6QfVE7Crx6hdT+h1WudmS2VRXdA/PJuKNHH5R7o7fspzs3OKWF3QaQd6/kw
 D6WX9zRG6maNoNCzqTNgKxFXU9XYKKEvr8TX97fFLY3ofaJu4cFveSzP3INl7cl0vOTB
 rjjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXhy8bi91GR8cHw237fkBDnP5y+y5HemPRBsFHEtzCjx6rWnAZl81WQ7D/Sx3obuV4kRXi+kadwA==@nongnu.org
X-Gm-Message-State: AOJu0YxZ7vRzOWoX8GhC9v/hJg4wdxs0mhbnlhikgKiO4tCGxPc9MZP1
 A1DkvQywXGuwj3yXBHigLpcyPToLZuiKHZ1aJ44ISCff/QFHoQi5nmn4UvKcbjmAj98c9QUvegC
 OEjihCQzD6ACY72+byVS9xNteWmLWrRfewqcSXJYIeuzyRU0zvNFc
X-Gm-Gg: ASbGnct8d9DYtUCv+MwsfuwfNBSX6w600dwZEWk8RbQdbmCq/zFAH/zCecV3eKa+i5C
 bS13bfHEih6zoks+VwAQk4vKqHqMifvCaYf85zYWlFf+e2KnTWkxM3/IYKiNn9nbSTfX2GUtgAU
 QwkI4wg744QiQr1tTLKWmniyEJGGO5lq/fVi1CMYkcImOZY+fThfy656IkHeIva7i+KlbnXUP2m
 XsxET8D
X-Google-Smtp-Source: AGHT+IE0EF4qIw6rBhJcAzpsoAbpdzFxHqkMobJTpgmkt9iUdcVfN/APYfvZrWkq8uU6RM5M3ZW123DBfQRvhWaXDD4=
X-Received: by 2002:a05:6902:6c1c:b0:eb0:7c5d:6a8 with SMTP id
 3f1490d57ef6-eb37faf44f3mr2977778276.7.1758818438093; Thu, 25 Sep 2025
 09:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-pcie-root-upstream-v1-0-d85883b2688d@google.com>
 <20250909-pcie-root-upstream-v1-6-d85883b2688d@google.com>
In-Reply-To: <20250909-pcie-root-upstream-v1-6-d85883b2688d@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 17:40:26 +0100
X-Gm-Features: AS18NWCH_gG1_2GuTQD-5iyF6piN61m1IS2b9sKVaWj15G-s7kMV7UB2Wy0KPyM
Message-ID: <CAFEAcA_Lp0hv_b726pSZg9CbPZrxEZ1gShOz+kJZuE2x3TG+Mg@mail.gmail.com>
Subject: Re: [PATCH 6/7] hw/pci-host: rework Nuvoton PCIe windowing and memory
 regions
To: Yubin Zou <yubinz@google.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 qemu-arm@nongnu.org, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Tue, 9 Sept 2025 at 23:11, Yubin Zou <yubinz@google.com> wrote:
>
> From: Titus Rwantare <titusr@google.com>
>
>  This switches to a using a fully sized PCI memory region that's
>  separate from system memory. Accesses to this PCI memory region are
>  gated by the AXI to PCIe windows whose size and offsets are validated.
>
>  - PCIe config space is not necessarily aliased with PCIe mmio space.
>    Ignore translation addresses for config space windows.
>  - Make window configuration register writes order independent.
>
>  Tested with pci-testdev.

I'm in general not a fan of introducing something in
one patch and then "reworking" it in a later patch in
the same series. It's usually easier to understand and
review if you implement it the right way the first time.

thanks
-- PMM

