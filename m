Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCCFCA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 15:26:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uo1ko-0000WV-JO; Mon, 18 Aug 2025 11:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uo1kk-0000Vu-Gc
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 11:26:31 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uo1kh-0003Fc-HY
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 11:26:29 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e93498d41a1so1249905276.2
 for <qemu-arm@nongnu.org>; Mon, 18 Aug 2025 08:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755530784; x=1756135584; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KHKOlMS3ep/BbZuaagHf0jgXwOxQ5E4gif8GDfgcQkg=;
 b=vrKzztnr0CaQxin60iy7eGINaDFtkx9khwpihZiEjNacc8rQkqWalSmYXUwrtEBgjx
 5r5YNFMjfKxd71ANZ1t7x1WmbBWSrzxQLInJb9LyDK+CJe5CCZ1fg+xaHgrzZO0tCYUk
 wTYk/iTrK6XNHQRqxgqZBGek8tGDYb8PZOlD/GRiI5P85cfbAHWWHHKhpq5JqCsM787a
 5tQZXs1LCJhFIzXbWMX2NNPhhWFc3zjrTjOqLatLmuGv6jwZQJnbyAXZvq2yj36q7FrA
 F5e1wEYL4wpfhob5CV7JFGjcWWPWRgM9VXT8frZuzcdpRMEE3mjs7hZ4lIusMR3r2fOz
 +miQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755530784; x=1756135584;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KHKOlMS3ep/BbZuaagHf0jgXwOxQ5E4gif8GDfgcQkg=;
 b=Ih/16nrmiEowUqfYZZHMfvWYps8fOr0WEIb92XPMIXl0xxxnyNDsj0VQ+X64joDYRv
 /2mEs9wAPZRtdPuoWeuKSAkie+i5kvr1H7KDBgmW71dTRUSJXaClxP+j+IIp0dmNPrwu
 cI7cTIKDSeQczroSBdnr3AaRxOAjzmG6RjUOGkY/AGlvhws0JFkoPHAC5QntE+acWF+z
 3nxT84TKekVXTWbbmDGj0l1+jWQIlo2TjeTyK65EGwLzv+SgtheBNyqvK/Hcku3gjhtX
 qe4dVrIYXFtIO7Vs5gwUYdUpmf4z72k9bQIXAQA0jZVXinE2vc/4Q8CU/gc2LHC/u8Mx
 C9CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUweqSCzUap3wOTHIvbQLRr2c2/WrFYqAxN7AI8srvfLtTW0w70ims6clKj7SgV7dqXxDsiHefvFw==@nongnu.org
X-Gm-Message-State: AOJu0Yy0H5tfwglZl93zJ+aqvytEGo/7duLz5rThXNZYaAaDJvkoU4g7
 0mOxisN4eDk6U9bjzS1DoXbt79OxNxJGIMi/pbg3nU3YfSvZLVE8DCMDbauNiDW0rdIEMGO1NvD
 D+BuPeVHDduyTHoxKkZfjFJe2JnMQptzLOKAyqoQjzvlor4Y8sfty
X-Gm-Gg: ASbGnct5A4rxnJ+2TlVQJjVV4WOcN7dITtLxrmhsMZHMHuGdVNCclotbjLHagoysqe5
 ky7AjvTieZzWzMFHBFqob7QEoniQRW0/Hl8CtM1fPdtYndEjzZi2Dvlq/S6AA0WaFxGFN68R8ya
 qFVuqABYqKmI8uHacQNv45dpLq50g50693ZkJpBDCZC0lplo/ar7lQ5z2xAIswwN10HbFUT5gKq
 s+hykK/
X-Google-Smtp-Source: AGHT+IFhddqeqkOaL1GOlQEgOk4SD3CsCSOn7oxB7QdRMNsKY7HK2u+R2tvsLErD3zR5nBdYycHNDELNCIO4WMOfBP0=
X-Received: by 2002:a05:6902:1208:b0:e93:36f3:5717 with SMTP id
 3f1490d57ef6-e9336f3590amr13844430276.8.1755530784003; Mon, 18 Aug 2025
 08:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250809211051.68824-1-chichikalyuk@gmail.com>
In-Reply-To: <20250809211051.68824-1-chichikalyuk@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Aug 2025 16:26:12 +0100
X-Gm-Features: Ac12FXxmacTGw-JGcyxXYPPhDUhbEFPcUgvKl1yZORWSFHRVvhwc9RGSXsSI1b0
Message-ID: <CAFEAcA-NwTDQUJAerkX2O88_3Mgprh3A7GqaEAFdM4mpN3s05Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hw: acpi: add UART clock freq to AArch64 SPCR
To: Vadim Chichikalyuk <chichikalyuk@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, 9 Aug 2025 at 22:11, Vadim Chichikalyuk <chichikalyuk@gmail.com> wrote:
>
> This series upgrades the ACPI SPCR table for AArch64 virt to revision 4,
> adding the UART clock frequency, which was not previously available via ACPI.

So, what's the rationale here? QEMU's UART doesn't care about
clocks at all. We provide a clock in the DTB because the kernel
refuses to boot if you don't, but if the ACPI spec didn't even
have a way to pass the clock frequency until rev 4 this obviously
isn't a problem on that side.

thanks
-- PMM

