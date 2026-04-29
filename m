Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDD4FF8873
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 07:53:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHzjp-0003Au-BO; Wed, 29 Apr 2026 03:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHzjd-00035g-B2
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 03:53:31 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHzjX-0002gp-Fr
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 03:53:28 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso94266815e9.2
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777449200; x=1778054000; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4iJTF7s4xf7jEja14GUmMXd4Uy2YPQsyOGJb5Bfuvm8=;
 b=t8UO5yNs9Q2zx8O0lWRRCyCnFMdJj244mJ6Rl8tyAbjapeog4tC4vI2EY+vtieS10Y
 QUB83qeSvb+ezk1k6s1I9tCJ9YhFForzlRp1LfLG0PhLxRt05JKP3EuDM90fVeReTjqO
 5A3LFAyyerjXWk1KONjBDWwJnMtf1Gto6PT1Y77BTJEDIG/xnbHiAfJpJbusUFmAimbu
 hyZudh3T0/RKvwUM8uPIL0Ek/y1rZpDyxM2tAvamyXndEiCW32zYj5cXJOaaEWRoqlZR
 J0Q6V0zlUaYWrgeUu55kgMxc9DDlAZPuz74p3u6cinaBaegPuQLoy4qGEXuqEPaTeWu+
 jJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777449200; x=1778054000;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4iJTF7s4xf7jEja14GUmMXd4Uy2YPQsyOGJb5Bfuvm8=;
 b=L9WwNEry/Un5alQkAjwlf06erBkBNCUsleKdbexBB9b85VAJc8dnVo324wEUc1MwA5
 j5J1+sQYTOQx7KikzlQ6aw2zvSdDeEGIO16Bi0yq34ZpvJ8RSyPNAikQWuN4208kyo9d
 dWK9qpcVCHQ0iuPQx0NTGdkxJzOp39j7sqtathiJkRd079BNXgOp2wDkvQh4nh+cuGxA
 D7jA+0AqOL66SQKLDA8SMZVWJ4GReJXhTatuGqEqdXiJrsOy2olqh0DvAXhEwMxcuhR3
 yC+1zTkjZqXn8HIAKZyw7uEcy2HCs3dtr2w+QmMqytkTuLh3dO279hNG47av0/jPTmGY
 wdeA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ejn0kNTYdqccAytDW8iQeh2GG3go/+Ei/p0k8BU5m7RclN4vM7voi3XzgMg2p/y0LsiakfGIIZA==@nongnu.org
X-Gm-Message-State: AOJu0YxQ0G6pAAxTnuJ+e/Zaj92FV37e2QVm9kEOsk3VujQVO5mRgFvs
 1w8YXafZZRy/mb0sU5fegQyJn/YjFpT42zZOd8lu4/CXMuMfEb05E122+JKnBolttTo=
X-Gm-Gg: AeBDieuQn7SVGzD/9Cr/0zg+HosngnXEbyKPf2e0AGIQLJKa9fteKIgPbw60XteLf1M
 8e5weZJHjnHfsazy4vtakKEZG50Y1YedaYgTtYmcM1QKl/c629KscF9ZicRqE/dXJHJNMOyFuoJ
 LW6JI705pMqvfDV0H4j0mRlLbZLu/UMp3M/FqlAoyFHYWHFd+cq2xwpZz83yAzrB8aA2JjTAOaw
 mgvbxKe//zBOYap11isVsotDrLBrAH6DXqBAG0xEPCV8BzxUlbhSseEGfRE19f9m4X/aiwIZfVW
 nnUtCFrd/yMwkm4vwv9b7wMyeDoRbTvxfUvks43RytVGU4KRcQJelBJg5m+3aBKx+3Ktv7p92Lt
 CwiTLQNFd5lvNwfuFKMI00/3MYjzLkNlCvGsYn2cK4D7+sGza9bdCHblHUz9eYvisu6vNWI59CA
 ACt+PZ1WhvfSwFtfABchOfA+RNg6P918TXHk+PrLbvY6Zd/kJxq7uk5ZzHhLCY9dV79X7pzyfbb
 krp
X-Received: by 2002:a05:600c:3b13:b0:488:9e43:9690 with SMTP id
 5b1f17b1804b1-48a77afd324mr103392925e9.10.1777449199758; 
 Wed, 29 Apr 2026 00:53:19 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a7bc23f4asm42959205e9.7.2026.04.29.00.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 00:53:18 -0700 (PDT)
Message-ID: <9ce0f3a2-3593-4fad-84b0-256494e3fe1d@linaro.org>
Date: Wed, 29 Apr 2026 09:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hw/riscv: iommu-trap: remove .impl.unaligned = true
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260428093339.2087081-1-peter.maydell@linaro.org>
 <20260428093339.2087081-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260428093339.2087081-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 28/4/26 11:33, Peter Maydell wrote:
> From: CJ Chen <cjchen@igel.co.jp>
> 
> The riscv_iommu_trap_ops MemoryRegionOps specifies that
> unaligned accesses are not valid for this device but that
> it does implement them. This doesn't make much sense, and
> we want to add an assertion that registered MRs don't specify
> this invalid combination of settings.
> 
> Drop .impl.unaligned = true, with no behaviour change.
> 
> Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> [PMM: reworded commit message]
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/riscv/riscv-iommu.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

