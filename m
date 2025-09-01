Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B43CA0FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 17:22:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut8Es-0006HW-Jr; Mon, 01 Sep 2025 13:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut8Ep-0006D2-Ei
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 13:22:39 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut8Em-0001dh-I9
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 13:22:39 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-71d60504788so37112237b3.2
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 10:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756747355; x=1757352155; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W32JbMj7HdeUvsjOu6FpTcDvcbyBGjo1P+nBU4sazrw=;
 b=LhlQX25Qg7bR52yB6k9YCEzoONeLtHobIjC1RXB8YsIfkepXZHLnr/jP5gUMWRbug/
 fD4d2IUSI92EO4X2qgpeasZPODMquFfqMj6sE722l9h72KRMxKgxEYji62Yn9aPT9oaK
 SZ+c4OvAMMn2HHNdBBssWkgHPK51oFiNyGU+BR/HDsbjNBdwMwrZJnazbud+08CNsjgq
 coOoRVmVNkoR1/WFPOK1PFjuDQkAl9DeyYtdFicT5Yw7OUnLWzp+dYfH3P/ErTCNWIMS
 f330C4CNyVkcLeqWyGbhRRoaEbQguqKHNOexy4ZfKMkzIa68fO3csq80cM/zKn+y57+j
 atIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756747355; x=1757352155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W32JbMj7HdeUvsjOu6FpTcDvcbyBGjo1P+nBU4sazrw=;
 b=So5MUD1zdvkIZut17lWUcjMwy5atNmQVeRsxipE3JAN5byIp0iaDk9Q9x8cuslFnL1
 9alZpFNcawSYFRcLqbpR0O+wbBzMtRIx/WNJQ8wYNkjcw5e2i0kRDZO5JV8yKlBPAjTF
 U1xm70erChTkOV5ErdIIV8HJnUOy4F9ZrFdht9tsSA6HRyqpnPjDbEZ9aVsbPNMhgPEL
 KmVe3jcPKHSy5Ry/3cRScqA1h5OrsRmL3tBXzc2b86l10997wo0LB2ZRu+Eu6yMJebSF
 qw+pjAeFElf0KLwKJNya2TvBrrdWNk9bv9Uyc7Y5ChsDx7QZVmIkL7Qa5Tdpa+zGsLdY
 dYFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN4NH0OLkWS9R1dwoPwzua6ZREukMO7OENt8qN0ZsPTIjKLaTifMMhckW/YNEZVx/jM50RBF2HJQ==@nongnu.org
X-Gm-Message-State: AOJu0YxS6ZXIbtehcYaSHg13lM+hhJKi3kPjNJcFCao698SLgoCq9lai
 RS4/rcR3opsmre2hhn6a2RhqETJYIz7aFAKOeafZ/kFeexjKIlohkUDLyz3Sx3QdbWb4cS/1LUM
 w1O7T9oU0bXcJJlqeEP3wongbU8s0MPCivtEih/R95g==
X-Gm-Gg: ASbGnctzmxoF9EsP/vGd7kZzG9LGAok1GZTK7aU1+VZo/0Rw8OpTS8vnfluVNxVdr+V
 RXWNVjoStHXrkHbt9ibotk6YDmOEOskkwQPQO/QLGP/215o2nzieQbpuG6spnwe+Ik4EEcZj5m4
 tf74wN3Zx2p7ErKl3UJQ2OxzxlZUgOiaI0C5Ci5ouGbPC+07evbyka+XBKmcvXVaagB9UHKAGbY
 of19fEe9uArIxu5uwY=
X-Google-Smtp-Source: AGHT+IFMBNAZpOfvX8SbnCB3gv+7ItfdwgvkhTuf6t2hwSVPw1ztr3LJLm91g41PCVIvBPMTH8T8y2DlJbGJ+ny2TR0=
X-Received: by 2002:a05:690c:9416:20b0:722:7a7f:5381 with SMTP id
 00721157ae682-7227a7f6e8cmr78637077b3.14.1756747354887; Mon, 01 Sep 2025
 10:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250822092410.25833-1-cjchen@igel.co.jp>
In-Reply-To: <20250822092410.25833-1-cjchen@igel.co.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Sep 2025 18:22:23 +0100
X-Gm-Features: Ac12FXx4bqVFmiV0CZPmFhtyvqOeF2ktAnEx6UW5G9ETXHK22vVaMgcmrLmZ4TQ
Message-ID: <CAFEAcA96Dk3s=SGfm-vtiuxCnjpHmA0Oh5P81wyvtWJzK6KPSQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/9] support unaligned access to xHCI Capability
To: CJ Chen <cjchen@igel.co.jp>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, 
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Tomoyuki Hirose <hrstmyk811m@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Fri, 22 Aug 2025 at 10:25, CJ Chen <cjchen@igel.co.jp> wrote:
>
> This patch set aims to support unaligned access to xHCI Capability
> Registers.
>
> To achieve this, we introduce the emulation of an unaligned access
> through multiple aligned accesses. This patch set also adds a test
> device and several tests using this device to verify that the
> emulation functions correctly.

I think it would be good if we can land this series early in
the 10.2 cycle so we have plenty of time to fix any
unexpected issues that might crop up.

I've left my review comments on various of the patches.

thanks
-- PMM

