Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp605177lfq;
        Thu, 7 Jan 2021 12:53:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB8s8lw1docMvNxPcQsWbMCxZlmZiuBhkebgBAP/Nn+MEsjI5gr3Sa1PwAEFwgxjel+6oA
X-Received: by 2002:a5b:107:: with SMTP id 7mr943657ybx.253.1610052837029;
        Thu, 07 Jan 2021 12:53:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610052837; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMVDeChEotVkqvo7hJ9fzzBrHN7Wm8+iQEtCpUl032eTrG/k2UzF9C5Qp8edgE4/gl
         OvAgXzWT7BzaiWH4UAeTL675DlGCnnd/EI41t/89kkXBr5ITr2057J295IHt1pxxcZlB
         If/EHPWn0b/jE9bHaz4KIcZveA7AnRqAKOHPRQawMHM/FGxLweVx5SFt8mE786QqhwHe
         NsXwybrYVWnakeSF4bQ5aK+E09cjccQW2Nwr6RicsqSfSUzGnOuF6YhBy3j6ewM3DNX8
         E1zpWaLYVq0xE3+SD/G5lEow1yTCDW2bdL0ZBd17KGWWL3ysiFR9673VYuQBzsKwQb2D
         f0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mCnTY9YH3EC4LSSj4YJLFMo2b7CqxHLmm6hE4pJzs6s=;
        b=s9isM/y9pmk0qqgj/DpqIzihFVa0Lv6U9soH9R6W82Kn4H3lJCLcBDGqag8mPKyTc6
         BAV9WxxhDlXNA+H0ZLotQFv46JpirlzyFzcxDfFq/XOrL1h5kKkQRD+izhI9rUwNmrJn
         0vDqtGABq2coVKqqdpMfaX27KwHjeDJG1tpOe8bO4f+kvJTHnhSJmkrZ0zxxKYA0si2y
         xiQabI+sL3ZOU6eBZvI4AF5xGrGvaWGPyp207oKYG+GLEpfUczxRajHp7GgsOOJZ9CPv
         99lPSwcuwmDWSbqn4QhAUlYqRuPQj6DJ1z9zcAFn0Vn9CuAkL9NYULKr/diWorxgtBYi
         Fmow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HFAG/mkt";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y27si6948876ybi.466.2021.01.07.12.53.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 12:53:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HFAG/mkt";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxcI8-0006ns-Dv
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 15:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxc2j-0004oy-91
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:38:01 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxc2h-0000Zf-KT
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:38:00 -0500
Received: by mail-pf1-x433.google.com with SMTP id d2so4630109pfq.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mCnTY9YH3EC4LSSj4YJLFMo2b7CqxHLmm6hE4pJzs6s=;
 b=HFAG/mktg+NZj22C7bg0yAHn0Fr92NH9PA19yh8a2IrHwQAO4z+oF49iHZnZrxhfdh
 1k9iIIKT97auX160LTFVhzX8ftSsM+AISeRrLc/puBLl5mRVwOMWz/CjnQxSBs9sTXOn
 OF+nF+JcgkrZo5VwWDtXOBUbFTaE11BhOfczY3eN1w/KTC9MMX/FN9CjURCcz+WBOkel
 HB4mdbVAWuWWbAMZALpnbsvKScy7Si1Bn0YPvLWskDg23nsg5M/nziqN+JFFuDaax66v
 uON/C5NMmhrbQunM98Mta4KOv61lupZ2fUj1IGcw3aHbTcpyDjTq0nN1GAaP1+Nro5ZR
 zndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mCnTY9YH3EC4LSSj4YJLFMo2b7CqxHLmm6hE4pJzs6s=;
 b=DB3zNN96y9GviE2a8er3mFPG5vNHi3yTdp9oNunfbG6fv7cFkRvXFl0SHtfKN2QJKW
 HwV+B5kTxdBNnVazshMdl9EferPeoSrJpye9G6C/g1KbfRXJHnUtqH1r19h+EYaQIfYj
 aKbdcQj1WFRePWRvo+yh1CDrgONB8Zzd2r637PFJoKXZ31o8Q9C3/9ctfrdKXE/ScBfI
 ly5x/fH0cfGdZxXSrudjppNc6ayybgdbPfghUZYT/Za4iFf5mAwl2A+fDPYU4OISlAEw
 XTXLb2ottcQ/w5Q2x0EwbULZEdOsfPd8DyX8d0vL12XJj8ogTCBHhFpAx7O+OEw6jS9n
 XVjw==
X-Gm-Message-State: AOAM532HrJscsD5+SdJ4aSmod6Q0rnT8cGwNqMBEqs6wVzlY5Dgs959D
 mr39c2loCHsL+iUQGGjGcRUjXw==
X-Received: by 2002:a63:f64c:: with SMTP id u12mr3600240pgj.98.1610051878136; 
 Thu, 07 Jan 2021 12:37:58 -0800 (PST)
Received: from [10.25.18.38] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id w19sm6951773pgf.23.2021.01.07.12.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 12:37:57 -0800 (PST)
Subject: Re: [PATCH v2 05/24] target/arm: Fix SCTLR_B test for TCGv_i64
 load/store
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-6-richard.henderson@linaro.org>
 <CAFEAcA9sT4JdPWkojp0r6yazJc5vbmzWHwnkMtChTQ1aZ2uugQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1451527-804b-04f2-7d73-89cdb0247b37@linaro.org>
Date: Thu, 7 Jan 2021 10:37:54 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9sT4JdPWkojp0r6yazJc5vbmzWHwnkMtChTQ1aZ2uugQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JwEJXHAn+/83

On 1/7/21 6:00 AM, Peter Maydell wrote:
> On Tue, 8 Dec 2020 at 18:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Just because operating on a TCGv_i64 temporary does not
>> mean that we're performing a 64-bit operation.  Restrict
>> the frobbing to actual 64-bit operations.
> 
> If I understand correctly, this patch isn't actually a behaviour
> change because at this point the only users of gen_aa32_ld_i64()
> and gen_aa32_st_i64() are in fact performing 64-bit operations
> so the (opc & MO_SIZE) == MO_64 test is always true.

Correct.

> (Presumably
> subsequent patches are going to add uses of these functions that
> want to load smaller sizes?)

Correct.

> If that's right, worth mentioning
> explicitly in the commit message, I think.

Will do.


r~
