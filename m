Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F01BC5DF89
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 14:08:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxPuv-0003hG-9w; Fri, 21 Aug 2026 10:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxPut-0003gW-Go
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 10:08:19 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxPur-0008Uh-M9
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 10:08:19 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-848743155bcso361560b3a.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 07:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787321296; x=1787926096; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ca9OqSC1QwtOqditJCClsvQfxL64aHZGZmIuqvTG8F0=;
 b=IVBj8CtGqpdqeVJH8M8FCEBdOOrsxVNJET+RefGUvczdLTVFhfV9S/Jid96eKmVWfY
 ZYqm7Z1u73qIJ0xFMZQM4yel39ot0T8xDmKsUAQ09Aj36peyL0dg9vAvP+kRXfQuW9uQ
 aZ439sJ2/W6I1Ws+ejsTC2DI4bzF3O+1gLZMDTAIdHLbwn3wTKa6Uo5A14lcz1jbfBmY
 42NzKdy2dO/CkDY79CoS6Px2i73b1mj+ishj1uCLvWk2K/yStAMH6N9xjCVTDDxqBYlb
 wfUzuj9a8J/Tvtx22dQDW0f8iMg+79H8lYKXYMDnf2LV6lWtfWHQY1vW/l8j3zLJmICM
 YRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787321296; x=1787926096;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Ca9OqSC1QwtOqditJCClsvQfxL64aHZGZmIuqvTG8F0=;
 b=Yn8KKLv1mwiyWPlhXK0t5eIPJtYZHv0K0HyeBcrAnGLviS9Up+9IKYVLsT5yJSzzVA
 RLBxN37G9xChchSEXKdXmtcFhDJEm3dfW6dvVfUMJ2qbjGt4NItOP2OSruxfifPnUgpZ
 KlmIvoHKs9msx9BRwujfjAmyCBIEowB9TJVqiwF1Wk9OxaQ9Xq1uc1AHgG3J0t4n99B1
 VKmw+GDWBy1lBGecYSWT02kCtPwNXPL/8cQBO8vDQlnMZbxVkPGj6IRCTBMdr7MzXTMH
 66s0arH1aX/4v/8+TTevsAXYH+TY+YWkKw/PuMUz/6NqwHhpuXrLebZfaOVRuHyI3z4C
 /otQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqMRQBSCqND9gdFG1uTZwj7+Ia9qXU8wvhXNcMtrwqf+HJlFtslRtkCnGI/j4FNrBRywVC8c2OUlg==@nongnu.org
X-Gm-Message-State: AFuF++nOR4GV6WrissQFrSbhA46k46pdmiWpqF4eEOW8/ssPHXRcY77s
 lpvgebDu638sn5FJbDzLFJfi6W7R8v+NDYhc0Ow023nIxVVqMWI1i3Wh5utaQNCmn9w=
X-Gm-Gg: AR+sD12s4vbL44TNcMuLKy/Vmeb4zeN9TAdXfA/NIOLe5CGILKN5Tpmq6dAtbgXsZ86
 BSIchRyMsKSQoSQ/nUPW7HstC6CsUoRXAQrvo7VvzzCeZuY10ChdutO+cddgTAK+W+Uc2AaS6Dd
 SMtbTSpqdSIYkREFv4kqiqwBfxOv94aX+SzqU2JLP7j4/IF4ghVhbJ1o88i3VZaXzP+2OQFi2uY
 49lujpLqvQK0XopHS3eNletxzm0s3EWwkSYBIv4mHj+QO3MIc3AkKQYlHBwTnxu5ppHEg2kD4il
 2WXPWuIL+RoSSjfITPkcY7dISTG5yuDAlT/eLhSnua6zZelxIjjC3//6u7mt4PESSrF+f81aAuG
 pifdwpRd1kw51/iU4x86RSsjOSEu87BDDrBE9HyrLxjHXuJyLxU85AVRXKaJBBgJbS9xZjJB/eC
 Kx/8tdGjr0WeEoWu6YvmH9LHmtJBE4/j2f1yr4gx3rbk+1nlIlpBf9JRL6SyeXmgaUxJAXeTvVT
 F+k
X-Received: by 2002:a05:6a00:a91:b0:845:ba94:a56 with SMTP id
 d2e1a72fcca58-851f987d3a0mr11336749b3a.5.1787321295885; 
 Fri, 21 Aug 2026 07:08:15 -0700 (PDT)
Received: from [172.20.6.168] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc155675287sm2935671a12.20.2026.08.21.07.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 07:08:15 -0700 (PDT)
Message-ID: <33169105-2250-4149-9e86-bd961f349624@linaro.org>
Date: Fri, 21 Aug 2026 07:08:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/arm: Correct reset value of SCTLR for arm926,
 arm1026
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260821114138.4068582-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260821114138.4068582-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 8/21/26 04:41, Peter Maydell wrote:
> For the arm926 CPU we reset the SCTLR to 0x00090078.  This is not the
> value specified in the ARM926EJ-S TRM (ARM DDI 0198E), which states
> that bits 16 and 18 are SBO, bit 17 is SBZ, and bits [31:19] are SBZ.
> It's also not the value seen on real hardware.
> 
> Similarly, for the arm1026 we use the same SCTLR reset value but
> the TRM says that bits 18 and 16 are the SBO ones.
> 
> This has been wrong in QEMU since 2007 when we first started actively
> resetting the SCTLR to some fixed value rather than zero.
> 
> This wrong value didn't affect any of QEMU's behaviour, because we
> don't implement any handling of the old pre-v6 meanings of these bits
> (which were IMPDEF), and their v8 reuse is guarded by appropriate
> version checks.
> 
> Correct the reset values to 0x00050078 (i.e set bit 18 and not 19).
> 
> Cc:qemu-stable@nongnu.org
> Fixes: 610c3c8afd99f4f11 ("Reset ARM cp15.c1_sys to default values. Fix XScale cp15 accesses.")
> Resolves:https://gitlab.com/qemu-project/qemu/-/work_items/4202
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v2: fix arm1026 as well, since RTH found its TRM
> ---
>   target/arm/tcg/cpu32.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

