Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8FBC531F9
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 16:23:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wokaa-0004ak-A1; Tue, 28 Jul 2026 12:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wokaX-0004Yd-15
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:23:30 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wokaU-0002mh-Tb
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:23:28 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2ce87c7e3bbso847975ad.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 09:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785255805; x=1785860605; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yYyRSAX/g1Iejpbm6ya2TgQIt0bwszHU43EA+UAC3Ww=;
 b=EqwjhcGGNdbcp40MFzJMH02y5QwqSlhRW8woCB+ICdUydWeVrIDQgoPHG6YkQbXKTv
 2LxhW9DcaM1OUy3nMM5x+LAmO+K4GHzTRsUslT1mxOnGhTRb8ppBue6Y4dqa9+QbUyHa
 FdudaXFLQC0NA+TG0EK7sAPzQX+6iFWBSEQrL+0Gd5c6hyloI6QKFHNF8jHK+TeXwf9M
 6kbM9nlwKT6FXJX5V+tACypDBA/KKAlHNc2vqtYi4qo8s+rBxKJ4trHowAZBKUsaQS0F
 MMy1mdNHDAg7Hqqd0eNx+y6hkaMA2+xleWLihLZrHxYH3iTHdMXPlSIXNzyakFjAIDlK
 skNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785255805; x=1785860605;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yYyRSAX/g1Iejpbm6ya2TgQIt0bwszHU43EA+UAC3Ww=;
 b=i7U2xc3son4OAyglBMSDWhny2X6H9kWf9rFjgPiqa7Ne2mzUy+e69MmLfCsm1ZVSwX
 u4RzEVxGQKDo+OUOEaHStm7boNV90p3jkTHQazeAPybM5ViMeNxD14itPSNg4uX+ygmX
 2UhnG2LyvJpgc/IO8v3dJ3r1ug1NQyug7i6ga7aQtEB5LnF9rCGkoZCkCHi2uKfajC42
 +56JYnKYEpBVMaPzm2Ha134N1tnrEgM97IgSmOLBIV8K4klJaNWugSpy+kReirglDq0P
 ZPnnbUp0n9tc5kdGvUzb/QnAFIgRiXFbh0ZjvuQ5gxR5XVIcfjjdoevtn0Uc0//6uUid
 t4tw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rot/HUdMutsszTry+SyZpBhqO2ZyV1z8xhSEYKVFZm7bR23mDX+EFMGb79TSRXwAKWXW8JKZFRJ1g==@nongnu.org
X-Gm-Message-State: AOJu0YyM9LfzQ53QVGTL9glLIECff0voPZdEkvem0ghyJlndLfx/zaMy
 iGTqkot/G4L6ImctKyTDOlt5P/uMK5n+6QwvK9qN0ogxIltwkAJDCr7wcPrUvQSQwco=
X-Gm-Gg: AR+sD1186JOls3bMuPdoqJhH1+E1845XVtfRQ8X65nnVdxylKq4jItplcKdLykZ83Oa
 HFn+PtgRDx6FtL0jzMyUD7kvs4I98DFEJpBZI//Zbv4Sq80C4D+sZTG0Y+u60/qh/Z4zDaaFMw1
 LW+95e8eGaMI+BsBntC8PqggYDAIzgW3+hw6txQRB1FjpePqCMyaWj0FwhO8QUJXiPudc70sXDO
 mwbiaAAdC/h7rsEt9zH5er3x1TVb7dG+A22X8rlsF+mPPr3IIUaebJpEdlScEBXllpL7V5iHR9m
 2pmavzgU0EdT1AVL/Um/PHoD4+gB5cX7rlgUmwHvvPnIgq0YA3NivAIoCiaeVyEKj0NyDYjWUBU
 QFhcudJLU2vhqnLD+NsvEiUoMIos69SHh2ViJtpHLNOLS+/gDgxntGfxIvyeQj0jpVBz+Q9iVJz
 ol7pF96OBTRdtQ3FzYsfkLwRFAFhrxoTjuv1641+/u0RsdLlgIGuaI
X-Received: by 2002:a17:902:d2c6:b0:2c8:4c29:afeb with SMTP id
 d9443c01a7336-2d015ae2738mr34920375ad.8.1785255804910; 
 Tue, 28 Jul 2026 09:23:24 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfe1ab9c71sm50758215ad.73.2026.07.28.09.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 09:23:24 -0700 (PDT)
Message-ID: <b5f4565b-ae3d-4731-b90c-ba006f3218af@linaro.org>
Date: Tue, 28 Jul 2026 09:23:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] target/arm: Raise alignment fault for DC_ZVA on
 Device memory
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260717232306.378988-1-richard.henderson@linaro.org>
 <20260717232306.378988-6-richard.henderson@linaro.org>
 <CAFEAcA9gNvMD5YVTy2Zj51riyY9j+eCurQpH8M-ymb4yaf4-Kw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA9gNvMD5YVTy2Zj51riyY9j+eCurQpH8M-ymb4yaf4-Kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 7/28/26 07:21, Peter Maydell wrote:
> On Sat, 18 Jul 2026 at 00:26, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Raise alignment fault when DC_ZVA targets Device memory, as required
>> by the architecture.  With MTE, an alignment exception is not always
>> correctly ordered vs a tag check fail exception -- to be fixed in
>> followup patches.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3005
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>>
>> +void HELPER(dc_zva)(CPUARMState *env, uint64_t addr)
>> +{
>> +    uintptr_t ra = GETPC();
>> +    size_t len = (size_t)4 << get_dczid_bs(env_archcpu(env));
>> +    int mmu_idx = arm_env_mmu_index(env);
>> +    MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> 
> I feel like some static analyzer or compiler is going to complain
> that this assignment is pointless in the !CONFIG_USER_ONLY case.
> Maybe better to set attrs = MEMTXATTRS_UNSPECIFIED inside the
> #ifdef CONFIG_USER_ONLY block ?

It's officially used as an argument to do_dcxva_traps, so we're safe there.  It's ignored 
within that function, but we don't enable -Wunused-parameter, and even if we did I'd then 
annotate with G_GNUC_UNUSED.

> Is 0 really the right size to pass in here? Looking at
> probe_access_full(), if you pass in a 0 size then it will
> call notdirty_write() with a dirtysize parameter of 1,
> which will then not invalidate or set the VGA/migration
> dirty bits on the full range of memory we're about to clear.
> This would be OK if we then went through the slowpath and
> did a set of byte accesses, but probe_access_full() will
> clear TLB_NOTDIRTY from the flags it returns to us if it
> called notdirty_write(), so we will take the fastpath if
> that was the only flag set.
> 
> Maybe probe_access_full(), probe_access_full_mmu() and
> probe_access_flags() should not call notdirty_write() and
> clear TLB_NOTDIRTY from the flags they return if the passed
> in size is 0 ?
> 
> The notdirty_write() API also wants the base address of the
> DC ZVA block (since that's where we will be writing from),
> not the address from the guest.
> 
> (We may be getting away with some of this because of various
> functions rounding up/down to full page addresses, but none
> of these functions seem to document that, so we shouldn't
> rely on it.)

Good questions.  AFAIK, passing 0 to probe kinda-sorta means "the page".  But I'll 
double-check what's going on.  Needing to explicitly handle dirty is I think rare enough 
that we can leave that to a couple of callers.  SVE might get need a poke with any changes.


r~

