Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F94DCA0FFF
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 17:04:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut7wn-0001gF-9l; Mon, 01 Sep 2025 13:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut7wi-0001fc-Uo
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 13:03:57 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut7wh-0006tg-CT
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 13:03:56 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-723960ded6bso6741327b3.3
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756746233; x=1757351033; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s8i6D5jkAUDyThSuzViGDH9PwKhirlJq1D1dtTZbZSI=;
 b=VpNnjF8No2fhck9DxilmcZerk7VnqSvv3arp/phhUfc7WYwb2ZQbr8rkeahqy1WXkW
 E3JgIgYT8XHB7r3MLePJroRMSKe32gRSyVoj44drh8zuS7VSk+hsUjOoPn3OHjA+smkE
 kFx98RFUOcGyhENwUTGbj+Krj0KkIUNujgICGPpn8yhP3BtyNxZYkCrpcsW1U9OzXjYR
 iHq5OEGLuR60aOt9zBDxVfoMetLPH0gIvN5tJC/C9VxPYMHw3J+JNwWpvsItsraNQnV0
 NjO7a5FgqstlIbxb7NdPDzvLSheHoJB47Kl+GIX+swsI/uqkDWzDFzt4mqbvi9Lu421O
 Zf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756746233; x=1757351033;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s8i6D5jkAUDyThSuzViGDH9PwKhirlJq1D1dtTZbZSI=;
 b=MSVwtKamtwiMsnqk5Y/OcY1Zaw6bOVNGI1rbEg3eWVIn5IDaCEH/3S9lF7B8BBRPHr
 HHLzfrQNBp3mHn2nAWoPVirckv1Ujmv75JnPcZ6h2OQ6uLlTbIjQO1xvVQkBNMY5p0mj
 j6uoXAHaJZfn6I5Fx7R85s3PBqORP28UcO3002D+llaW64VGfbcOgn47/AgqJ5AR7TP8
 o3reM6tOI1LoYVCn7ZLhB5Up3MD3kt6VJ9lnI/FKDukXlzi0n7ThQd//0priYBHVcIo1
 n8FsQhgff2p/krYnO4fzN9evM0fD08xw4Nk9bhc/Wj2Q5ey60DM9hssLvBvjKX6EAfjG
 Qobg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW31uYZYPR2o+X68yyM2aJcYsUsMAI2rXPUwT7x4R5F9nmCGnBujGZwLFysVYu4I7njSSTxsWObSg==@nongnu.org
X-Gm-Message-State: AOJu0YyHk3cy3btHqE/jrp1aWwowPgR1X9zA4tuHicn0MdBKP0UhVJKE
 2VDywX24VxG/Dsd2ZPW7K10qyEju9D246AGJSPU3vk7ZZbRnLH4gCAUbZEfnJsxcTxVJqbAAUgG
 CXxI/EYUpAbt/sUFRVCJGlvzPRRyAPE88mYMatCECZA==
X-Gm-Gg: ASbGncslQlbu/rnVbv7eSjlIsbP6VIuCBv7woWKJib0CEEMdJDzKq5d2IpqrXz7hOOU
 jhBqvOghdb16eTQ8dxrNlLFQGYhAw75D9LZjHly8QNfJ5Hbk1gbM090nHWZIL9J+rltKcl2lSOG
 TfXZaTi461fEOcNWp1fwWhmSlS24lq3fRA47Dm6WXr6WEa5Ph907iQ5uLC1wKeDvldvl3MIWESm
 NwOETWk
X-Google-Smtp-Source: AGHT+IHnqnDvMl20p1XdCy/6NlPhO8udKqWBZ37/pVmHfoBv8D4Av3q7gGUUgjzxo2rIeIGZZFGkCaa/cVhKbzxlmNA=
X-Received: by 2002:a05:690c:9985:b0:71f:b624:322e with SMTP id
 00721157ae682-722764af341mr104788327b3.26.1756746232816; Mon, 01 Sep 2025
 10:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <20250822092410.25833-9-cjchen@igel.co.jp>
In-Reply-To: <20250822092410.25833-9-cjchen@igel.co.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Sep 2025 18:03:41 +0100
X-Gm-Features: Ac12FXx5i4R9R1zWKUOD0YRdUrFqyEPkAA1Wf4Ok6RoZdovbeM5ESEnmpbbH1sU
Message-ID: <CAFEAcA9FAnnQrAf1eUPr1=FQ+=Wbu13gyfj3T3z+k6BhxHj6uQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 8/9] hw/misc: add test device for memory access
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 22 Aug 2025 at 10:25, CJ Chen <cjchen@igel.co.jp> wrote:
>
> From: Tomoyuki Hirose <hrstmyk811m@gmail.com>
>
> This commit adds a test device for checking memory access. The test
> device generates memory regions that covers all the legal parameter
> patterns. With this device, we can check the handling of
> reading/writing the MemoryRegion is correct.
>
> Co-developed-by: CJ Chen <cjchen@igel.co.jp>
> Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> Tested-by: CJ Chen <cjchen@igel.co.jp>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v2:
>    - Fix the typo of ops size of big-l-valid.
>    - Replaced the huge macro blocks with dynamic loops that fill in
>      the `MemoryRegionOps` arrays at runtime.
>    - Remove test cases valid.unaligned = false,impl.unaligned = true.


> diff --git a/include/hw/misc/memaccess-testdev.h b/include/hw/misc/memaccess-testdev.h
> new file mode 100644
> index 0000000000..c1b17297a2
> --- /dev/null
> +++ b/include/hw/misc/memaccess-testdev.h
> @@ -0,0 +1,104 @@
> +/*
> + * QEMU memory access test device header
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Author: Tomoyuki HIROSE <hrstmyk811m@gmail.com>
> + */
> +
> +#ifndef HW_MISC_MEMACCESS_TESTDEV_H
> +#define HW_MISC_MEMACCESS_TESTDEV_H
> +
> +#include "system/memory.h"
> +#include "hw/qdev-core.h"
> +
> +#define TYPE_MEM_ACCESS_TEST_DEV "memaccess-testdev"

Could we have a comment in this header file that documents
what interface the test device presents to tests, please?
Both this patch and the test-case patch are hard to
review, because I don't know what the test device is
trying to do or what the test code is able to assume
about the test device.

thanks
-- PMM

