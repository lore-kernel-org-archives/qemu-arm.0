Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2558302dye;
        Mon, 30 Jun 2025 08:43:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2ZwmqRsymKYCXArFX8koMG3vg7WMPChnItJXiMhyAA+wL1Jp6Q59EJEz9FSZQnudkM8rfig6j3VLC8w==@linaro.org
X-Google-Smtp-Source: AGHT+IELVLsyIB9oPKmIjZ/jsOqbDhuEBq0Wqu7u/TBKCW5JgoFT6Ll7rPu49aRQKVj1+babsCsZ
X-Received: by 2002:a5d:60c4:0:b0:3a4:d898:3e2d with SMTP id ffacd0b85a97d-3a90d69c269mr9629681f8f.24.1751298235232;
        Mon, 30 Jun 2025 08:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751298235; cv=none;
        d=google.com; s=arc-20240605;
        b=cJ5HWUVBkewETJgnO+ygXpmIotyBZpy6NrGque9jJa8NpMR76Icp1R5ZutA8q/mJY1
         TqFb7Xdxlqs3mO9wHGC7oGjZD4Jl4JMq8C6OqVxaRGbjdXQ8hLIABkLIFbqdLmXPynSm
         X1FBhyxfxLxkykRsDaGt3ojtNZo1gjzS4WYDNO91M7yRYW464NX1qakVE4RhwVUObt13
         PnjPFdtKsCjkbh21vfUmqImAAuBw0p0Y2AdVn533F1JOM2lCVefFlSoscSwFvzxCDjnS
         zQu0RjhnWOqK/snZsjvS8lwdHD0xtZWPAWz6l97xc0J2kSljqxYtA1OTAgX6mWFEHKsV
         7YhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tpgMN9h+M63CoPGwNEgkGRr9c5WoBO81ddlM3dhheL8=;
        fh=SwEoowr0S8xDl1eTxQpM/RFpTe6Q6VSHlvSOFR18pKk=;
        b=W0yWs87RCYuBrer1wFubQOnU+ZD9QDhHxPLbqqnPARvsA0dWJfeoGJvBkF3D2UPhgf
         /KEfSrz6xKUmxtMlPz8NmXS0Y2Cu/Ywm1X79L17C5SaVzh8EqR4s0LOcDhQT2C11fmaV
         PUu1Fc+YqzDT7UtNxjxq3/JOzODt6KAts1Ftj5KN5vey82NQI1nBjFnDJ3kmKkmh6P4s
         UDb842mvr7vJ6cNNotvD/QxxGcTJWMEj+/goCxKAfdxCVA8Vtxmug52Ico2XGWHdNxIi
         3Tyt+aojwiWCVy9T/bXhCh11y8hUM2/iOu9wBl8lCmW8pMQedDhK4ldCg5c57bmOenxK
         D4/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UVuHYTyU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a0710065si5999718f8f.486.2025.06.30.08.43.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 08:43:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UVuHYTyU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWGfW-0005St-72; Mon, 30 Jun 2025 11:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uWGfV-0005Sh-1l
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 11:43:41 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uWGfP-0001dz-52
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 11:43:40 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-70a57a8ffc3so48219337b3.0
 for <qemu-arm@nongnu.org>; Mon, 30 Jun 2025 08:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751298213; x=1751903013; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tpgMN9h+M63CoPGwNEgkGRr9c5WoBO81ddlM3dhheL8=;
 b=UVuHYTyUFvvCBMDDgr8qyv+hq3PLXcCZWmaqVNlGHVFcWE9LEyYBJhF8rqke+cV0sJ
 cnTKDgtBTtFt3opoCf04ZPL0B35Bd/oXb403KeTjJBrgGQbJLQ2bg8LuSMrUkEwesCBB
 8Zbg8SRkpys6oFgSkA+b7gVxzNESBAIxX5DrS6tQYOUxKzByQLDLyzDgmziUp/9HZfE3
 92u1bX62y8AUNNFOxSfFsazzfcCwsiHOCYOLCqEkHK1jqMMEexg66cqwCGQf5r+uV3wO
 BTMultIdfggpuu8Ms7Rl8cF4LJL95V/3Y5gBDlJqVNQXvQqMSoGXWhr+qApmz61RkbTb
 mNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751298213; x=1751903013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tpgMN9h+M63CoPGwNEgkGRr9c5WoBO81ddlM3dhheL8=;
 b=nG9q7CvHMnF2Fawjw1X6579Dyonw5ypf2206u6K77kJw3IeEfHFFk4a8Be+ypJpUJY
 /1dZKdVpTVN0OjijClj8u3Osi9KDwrV7T0mY4shz8KxCB0StgRuc1cVdOTjx3K2yQofs
 Q9yc3THdgtz4/tQdojTA0fSAXlIQawBd59n5HEU7NvZna0c9f9s/hKGtPvrdoe/vCqGI
 RxoedzcH0bcb0zhN9k1Wf3mYZ0cLmJFUCjBl0W/V5S1BJJHnYAdq3pIN4s96KVZcDbys
 Gh6IItZ1PVPz4escYhdkAzDqrzH4B6yqycAS6PpP2yRt+R4ZlBfTElufzQiF7YHREYh5
 onTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgy+ijofk6Ko5q9eF+OP3J7MpAhj5xkvQ8gIocelZfpvWcgdU21JQhYCOxLC/dyT4JxTo3vAtIrw==@nongnu.org
X-Gm-Message-State: AOJu0YzRx+JZ2eqpM6KHFcm/FCeqcwdKNlkEZAnqG3A6OGfniAPigTPf
 U7tHbF1cASbh9uLgo13cI1S/AtTLsE6Lw5hfC8axM41myEzLfxBeoJ/JgKc5Kq2h6qNjGYbM834
 zZ6S28N+TFYFfMbPvMnpYH14gsHlecFB6X5hI+Q93lw==
X-Gm-Gg: ASbGncv/dU+zas1wid73eWKall3w3M2lrpwUKFFCb5ms7sFvD1uRBX303BrDd+rpHSK
 ytr3fVBiiAec564KfGQ3aZccOKhT555nC+sDcc9kqs72Kovgc9WSnceF8qZKvseM7TFA8sSN+qu
 5v6iXK+w88GT2zznK6LstnNiWpY1roa/mwNULhfkv76iYF
X-Received: by 2002:a05:690c:8:b0:710:f39f:a2bc with SMTP id
 00721157ae682-715171582damr173292087b3.8.1751298212786; Mon, 30 Jun 2025
 08:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250625105832.1277378-1-kosasihwilliam4@gmail.com>
In-Reply-To: <20250625105832.1277378-1-kosasihwilliam4@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jun 2025 16:43:21 +0100
X-Gm-Features: Ac12FXzRNKfDSUYL9PHn7gSiA3g1lzHF_hkG8ZIGyFqYrUIZA6mRN-US7EuQz6Q
Message-ID: <CAFEAcA9X8B8cUbv2hj8dXEnu5OgBW=mzO47PBO9HEDzAVOnGCg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix M-profile helper loads/stores alignment
 checks
To: William Kosasih <kosasihwilliam4@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aqY/qCJ3+q5n

On Wed, 25 Jun 2025 at 11:59, William Kosasih <kosasihwilliam4@gmail.com> wrote:
>
> Historically, M-profile helper functions in m_helper.c and mve_helper.c
> used the unaligned cpu_*_data_ra() routines to perform guest memory
> accesses. This meant we had no way to enforce alignment constraints
> when executing helper-based loads/stores. With the addition of the
> cpu_*_mmu() APIs, we can now combine the current MMU state
> (cpu_mmu_index(env, false)) with MO_ALIGN flags to build a MemOpIdx
> that enforces alignment at the helper level.
>
> This patch:
> - Replaces all calls to cpu_ldl_data_ra(), cpu_ldst_data_ra(), etc.,
>   in the M-profile helpers (m_helper.c) and the MVE helpers
>   (mve_helper.c) with their cpu_*_mmu() equivalents.
> - Leaves SME and SVE helper code untouched, as those extensions
>   support unaligned accesses by design.
> - Retains the manual alignment checks in the vlldm/vlstm helpers
>   because those instructions enforce an 8-byte alignment requirement
>   (instead of the 4-byte alignment for ordinary long loads/stores).
>   References to cpu_*_data_* are still replaced with cpu_*_mmu(), so
>   that the individual word accesses themselves also perform the standard
>   alignment checks, in keeping with the ARM pseudocode.
>
> With this change, all M-profile and MVE helper-based loads and stores
> will now correctly honor their alignment requirements.
>
> Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> ---
>  target/arm/tcg/m_helper.c   |  33 +--
>  target/arm/tcg/mve_helper.c | 408 ++++++++++++++++++++----------------
>  2 files changed, 254 insertions(+), 187 deletions(-)

Hi; thanks for doing this work, this is something that it's definitely
nice to see fixed.

My main comment here is that this patch is really too large
at 400+ lines to review easily. Could you split it up into
a multi-patch series where each patch does one coherent
thing, please? (For instance "honour alignment requirements in
vlldm and vlstm" could be one patch, and so on.) This will
make it easier to review, and also easier to track down any
problems in it by bisecting to the relevant commit if we get
reports of a regression.

thanks
-- PMM
