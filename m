Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDC0C88E56
	for <qemu-arm@archiver.kernel.org>; Sun, 13 Sep 2026 03:51:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5bEZ-0000ye-Qz; Sat, 12 Sep 2026 23:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5bEY-0000xX-4t
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 23:50:26 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5bEW-0002OH-LD
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 23:50:25 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-39dbdfaef3cso900234a91.1
 for <qemu-arm@nongnu.org>; Sat, 12 Sep 2026 20:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789271423; x=1789876223; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Hk0rmQA4S8Tz52CHnUhIhJv6vrx46CLqt4n+9o4hG5E=;
 b=BW+9taPvLLHMjocNIRwBGKyeTP8v4gZ3bSIDgdFHAWhO0YefAieZBh/hAxopRLm0U+
 arFOSBAV/mNr2fb7qoJj6Ex0QDlTkkQ0uZ0ENFWseeD77n31RYCujkLtNvJ6wUIkmgkr
 xx/dzAedNqAAzOd12bIIHZTwy6ZfMPSpP5idt0VTYcIe4b0QjGgnAGwvPrDkbJoprNpr
 80z54veagyDbJGw76wVb0H2xvEsKlhEuuM6cuaZ17d8gatqpDspbeXTHkf56Gf7+0Y5R
 E+lEdWW42lZOsvPLwm/+XMkEtm5qNMCp0PWBo6FUjD4sTh+9YSKvxtjmKchyGgHlz/Q8
 3sQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789271423; x=1789876223;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Hk0rmQA4S8Tz52CHnUhIhJv6vrx46CLqt4n+9o4hG5E=;
 b=pbyKAEEG4epeosjHmFURGBkuM+WDIBZs8Q57L9WOiNmkcyV7KmohKANiIlPvVTchsh
 peU4CIe6c4FL53VE0JD3evqn6YbpyjyivHtGORKeUMHiZ2MhyYoj3ofDQlOkmcHnkOYh
 Q/HW5u8qW4QIIwTin5Lhoehld653LLWEWnBEINXYmWhVizyGZ8E5OARXDZv13/Cuf8Xc
 DGR3SjE8xcuVYsjoMyk5n+fm2W+Zn/bgzPyQbpF9Vf4NWab3R89d0VTdGoRPE/JL4hrZ
 lNluf21QJMJjpr49rB3aQYhyBWY2Lig35IUfcPCnBmWa4Shp5XWEir+drVEv7SVHjIdd
 w8Ww==
X-Forwarded-Encrypted: i=1;
 AKwUvBzZXzeauDLX5qesXYSj//YzeKnzg1ax7wSiuHHncPFgJLYod3wpuDdCHF9dPWw7hrPbQtJ+U7p7QQ==@nongnu.org
X-Gm-Message-State: AFuF++lWX3RSQ/GDw9ubKyxgW+YFqNRVGQjGYbhmMVTkGXi2pWAxe1FP
 MlACx2leFDdMBtCudLqHo4mhzS7RX0JEmu5/jJQ7YvrrQIqW7EwnVZl6HP7gQAec04A=
X-Gm-Gg: AYBFou3AGF0Xdjovw1nMC+FutirkoEbgA8nmUNQ04Y5kCTsTwYWOCTFv3Jdfhv4el+R
 UJ7LI0eLeSkcbaH1J1+KIIv7gPUe9QYlrKNBazRb/WzOV0Rcl49Zx7DSwnM/Fi13IKRTd5bBqBs
 ikalwcFET5CiFoczHTByY1SOcL0NJ+xuigMf2shwClLO9mXSxUAj5KIPGksslXtTR6gMsl4S/fx
 mtRqT33e5l8LeXBxYlHbsAAEdIMnA+fn1S9gvFI9AWQDPc0uDHUSN29Zjkeexi82oI8ZLb+ovL7
 3XXLtsaZhl++aKempNG6k39Zrtn861zXvwrvQlqgYFYpYitqND52tZKGX91eNl8XxWhM+GENfDw
 D6+7vP9axJ0x7REtwjciAzjdO0ZHdnSYUMPLp7NSV5wCmxOsXvPlysLcID2b/sJixdsdPw2fAay
 KfX6g2igZ1f0sAJTGIDtjGEDBbUTpIyEB9wil0WWgexU6+Y3Dulrd7QcZqjRiISyzkFKOjCl6H1
 5FJN2MxNksmmMxL/wCGmikMAXgXEu7WXJSCFkk+3FVvfa+9sL+4H7E7kQoyfw==
X-Received: by 2002:a17:90a:ec8c:b0:395:4290:46e0 with SMTP id
 98e67ed59e1d1-39d9bbe4910mr22492663a91.5.1789271422987; 
 Sat, 12 Sep 2026 20:50:22 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365b97994sm30505266c88.12.2026.09.12.20.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 20:50:22 -0700 (PDT)
Message-ID: <9d27a935-305a-4623-96cc-93d09173b8db@linaro.org>
Date: Sat, 12 Sep 2026 17:50:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/11] accel/tcg: Add do_interrupt() wrapper for
 targets to manage BQL
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-8-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-8-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
> Add TCGCPUOps::do_interrupt() as a wrapper that targets can
> implement to control BQL locking independently. The existing
> do_interrupt_locked() callback remains for BQL-held contexts.
> This allows each target to decide when to acquire the BQL.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   include/accel/tcg/cpu-ops.h | 14 ++++++++++++++
>   accel/tcg/cpu-exec.c        | 12 ++++++++----
>   2 files changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

