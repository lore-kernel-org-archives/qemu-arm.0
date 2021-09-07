Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4764470lfb;
        Tue, 7 Sep 2021 07:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfXhtdRhfR7TzRN1UOHJsJoa0xRlSnO/sQY17GjVvoP6/lv3y8/7oHYGxcT3HbymRYpK7/
X-Received: by 2002:a50:fb08:: with SMTP id d8mr18518569edq.160.1631023970245;
        Tue, 07 Sep 2021 07:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631023970; cv=none;
        d=google.com; s=arc-20160816;
        b=MnudDxdP4aCdnoG0PiKTRSfUj8yWLp8oBYAqX//XSJ6P1LMTZduAyawrXhA+dCGsR3
         UptAQxHeJdopM27aflbhdX5jCdx/0gJs+E0v2tupUKTPx2++qv7QTCyyuxsNxeffoa0j
         jrEbyqNR+zeEPmtqiYY18znIjfBHzVCZ0QeCe8hstWhr1C/L9Y0+QTAZJknUtAIAbrIk
         Kyt3+V9gVGthnKA/4RB9E0BObybJ/Tp33m9x5rEvRATcySP8kX1YYcfpIbP4Fh8ROKjs
         AJssg067OPGCivkrlBVXB6JgnMuL9t0/quYg+5OrQ1Ea/kDB00OSXoOJ95OEaZmlZnq7
         v3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WJ+z8oWnobWhi7WpiAZbBhagm6PwoDqoiXTMMwqDJn0=;
        b=oskxMoIGtBjXKvAn/hJApTfYpeGFWEwy2KYjeO2a+ScQn0+l1yOCtYBCAm4NveEQt5
         jR5UAGC9BO82WwiXF3Uc0YL93DiFT4CBYRo4Ls9suTmU2xUSq/QXFlCMjCiatue3I8Hr
         NOOda+0elVGqZlj7i4j/o4tjJx4UAiq1R0iauvUblbb6uFJfhN9Q/cCWQ80YBwSSV+0I
         mNmfikVvrWhUpgsxxuvPlwEc6rhcld61m9LL6JhTRteu0LwHruyjxPgwF3dAR6hETX8P
         pIg8fFaKHvdOeJXmoFpiccQCIEJPRVU0KECdWJl0tmjx1Bdalugs0Ld7qcTIdpmQu2Sh
         mMwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TVMDSxWO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si12418834edm.299.2021.09.07.07.12.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 07:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TVMDSxWO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNbqD-0001ax-CG
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 10:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNbpP-0008RM-VM
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 10:11:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNbpK-0006DV-Vq
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 10:11:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id m9so14711301wrb.1
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 07:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WJ+z8oWnobWhi7WpiAZbBhagm6PwoDqoiXTMMwqDJn0=;
 b=TVMDSxWOFjxnuS/2Ng58JY2SEmU7FN6xMnGjazoX8c4Xcg4UneZQ370sJLK7ZFx11l
 j+mQSUuPOYN2HNyF8ltn7jb6BwwDA7fpeY3+2GgajOVThOz/SNwslIU245ZPj6pB3uSU
 W3yZfQjKPi8hrZZI1gSj6VuXD7e7Y7HpqpUFor6U1dqinWcLpnQk+gm6CTGfF20EI3WR
 O51WYG96vv2VvnLsaKT8PJfbhLCMbXNcQEllvl1W08GJtufSKbcc6icaIDhISfyuc8xr
 1HGFHuxsccs+OxBQtLQ16mDf9dsvZRwSghBLKitZrpO2q52Qrv3rDUYtHXjq0CGKpesY
 T9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WJ+z8oWnobWhi7WpiAZbBhagm6PwoDqoiXTMMwqDJn0=;
 b=V9b9QK9v/+3XSq49ysDvs5lhCeA6pSdnE0bqQJYbudFajoeEBHgN4vcbaHNB+gcgxp
 8tmuwPxCBzxC1yhLrlokn3iurhhXk+Rg1DplbgLbhybj24zb1vfLYedciNJ1uGdDULBx
 Wu3C50asw64FQEj9MEAyPkftOR9RPulijVJKX0r0a1jjzm9R8jot+49cNUTdT16ZqWkj
 maS2El3PxKyREkg0n0pqKsY5JADTabGXDJ72lWrdK0mjaRu+Wcp/lKble9S6og54W3Fs
 /5a9wL18baZ6N+ycd6Ystqs5wo3Mxsm9MbDRormWi+lQjFrqb/B51ov1E/lpAzOIU6vi
 bfrQ==
X-Gm-Message-State: AOAM53112bxd1AYYtcgQ2Y8KGCGxhtxrd0kL6LkZd7LJ4EaivoylQWJq
 kMycGhcQJN7HqKs/bwTx+cyziw==
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr19288607wrh.108.1631023912984; 
 Tue, 07 Sep 2021 07:11:52 -0700 (PDT)
Received: from [192.168.1.165] ([139.47.33.227])
 by smtp.gmail.com with ESMTPSA id u13sm11216321wrg.68.2021.09.07.07.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 07:11:52 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA8EoyaCSzA1vL_SHY50T6Fxjm420_pYgXx1_+E-nV-MBA@mail.gmail.com>
 <906c738e-904c-99ba-b6ab-2556e9262c87@linaro.org>
 <CAFEAcA8-wj4TEQ+VKhVk8JuUW3xKA2NuJ2AnU=2ZTDdMfieuGA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc5b66b4-4d34-6da9-ceb6-00eb524a070f@linaro.org>
Date: Tue, 7 Sep 2021 16:11:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8-wj4TEQ+VKhVk8JuUW3xKA2NuJ2AnU=2ZTDdMfieuGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KVtAF3Fpk/V7

On 9/3/21 6:30 PM, Peter Maydell wrote:
> Let me try to write out the rules:
> 
>   * if you do something that changes the TB flag, and you know for
>     definite the new state, and this change happens and is the same
>     for every exit from the TB, then you can just update the flag
>     and keep going in this TB. (This is why lspact etc are OK)
>   * if you don't know for definite the new state, because it might
>     not have happened, eg a helper function condition changes
>     something, then you must end the TB immediately (in a way that
>     doesn't use goto_tb). This is true both for "I couldn't figure
>     out the new state, it's too hard" and "the new state depends on
>     some runtime data such that different executions of the same TB
>     might end up with different values for the flag"
>   * it's not good enough to say "well, I can pessimistically always
>     assume mve_no_pred", because of the goto_tb issue. You have to
>     be sure of the exact value that a TB flags calculation after
>     the insn will get.

Correct.

> 
> So I think that pretty much everywhere in my current patch that is setting
> s->mve_no_pred = false needs instead to just end the TB. That seems mostly
> straightforward, but there are some tricky cases:
> 
>   * WLSTP. The code generated for this insn has two exits. The change
>     to ltpsize happens on only one of those, which is currently
>     handled by gen_jmp_tb(). I think we are OK to just leave the
>     code as it is, because the value we pass to LTPSIZE is
>     constant (encoded in the instruction), and so the new value
>     of MVE_NO_PRED is always the same on that exit from the TB
>     for all executions

Correct.

>   * gen_update_fp_context() -- this function gets called for pretty
>     much every FP/MVE insn (as part of vfp_access_check), and it
>     can in rare cases update the FPSCR.LTPSIZE and the VPR. I guess
>     this means we really do need to end the TB
>     if (MVE && s->v7m_new_fp_ctxt_needed) (ie the comment in
>     gen_update_fp_context "We don't need to arrange to end the TB,
>     because [we don't cache FPSCR in TB flags]" is no longer true).
>     That seems likely to be painful because some of the insns that
>     do a vfp_access_check do complicated things with the TB exits
>     (eg WLSTP, LETP) that are going to override a naive setting of
>     is_jmp in gen_update_fp_context()...

Well, we could let gen_goto_tb see that is_jmp is already UPDATE_NOCHAIN, and suppress the 
goto_tb in that case.  That would seem to take care of any entry into gen_jmp(_tb).


r~
