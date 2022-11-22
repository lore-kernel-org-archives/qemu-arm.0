Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3327985ejx;
        Tue, 22 Nov 2022 06:20:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4FLOMeW4iGjCkdIodwYMygSeABsfSUE67yq3lAnAyGpJZzDewfOP28JCxq8l8DSRRI/TBw
X-Received: by 2002:a05:6214:3b85:b0:4bc:18ec:59fe with SMTP id nf5-20020a0562143b8500b004bc18ec59femr21806780qvb.43.1669126825556;
        Tue, 22 Nov 2022 06:20:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669126825; cv=none;
        d=google.com; s=arc-20160816;
        b=aT4BX3SN/EIsQHO8eUHxvTfRqVyU4b+zNjsNZCuVyGVn/YFq5Y0NuJYhEucFKLQ9fJ
         re9Vy+ZEkIaF06NhMVvYBA/NXtZvGgTEb0uMAj9vZ0aCuNZiJaZN2G/oP5jPm/t1w36L
         WGRQO4FtfVEoci83J8b3JnAXKC3CjLnXAi0NnSLfrl7G5O/Fm1SpiJmPUv9sRRRI8HxD
         yhQgZVomVuUcrZruN2s4c0gKwF0pgGkbDqAPcAvVsWWvXwrB9Imw756tjhsAtw0y6OPe
         iEN1KaD7D/dAN/lIQUVrWAhiyxi5c7f0JSsJEXc/4fEgBNyKPE5brbou91+fTA1KXqji
         RCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HjpQwX/QkEepYSPRKoMV1yV2gkyB3MGQc1uvI8dS9rg=;
        b=JGWsOlQULO5Fb8Xmk6Xa64Y5OfOqjrFuA8x9cLZi2W2ZTX0Qx0/PB7P7quAHg2J+eS
         B1YjURzVCn1PvLNp69JbjOKiphFcriK4QacsFrBaKIdlDl/v0jMjjiiERF6eo8LcTmeV
         65uqu4jVw31JgW6h9JkMg5gaRx42nYt6590z04mdHHRh0tQUoPHf4W678wMvxYy04fDt
         BAgKVYkmhf6/B6hGC7MITJtMct+3vwlfWGFz9J9dONW2oPdiyicpQmxYhzjlzvsnLslO
         4/LuWG4gcGvc5SCKnY5coqM8nqxWPDRUVv4btH6fiYApDWmO0tSw5sj/0wf88LcgrUM6
         OZlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QZRlG6u5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cf14-20020a05622a400e00b0035a6ccecfddsi8045598qtb.463.2022.11.22.06.20.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Nov 2022 06:20:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QZRlG6u5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oxU8M-0001Eg-RO; Tue, 22 Nov 2022 09:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxU86-00018i-E1
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 09:20:06 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxU84-0001ai-7H
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 09:20:06 -0500
Received: by mail-pg1-x532.google.com with SMTP id n17so14183680pgh.9
 for <qemu-arm@nongnu.org>; Tue, 22 Nov 2022 06:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HjpQwX/QkEepYSPRKoMV1yV2gkyB3MGQc1uvI8dS9rg=;
 b=QZRlG6u5fsXv03X+9BwBIiaWN8yNYJD3OdzxUMc9AwMuonZxN6HX8mIwGq2UK7Ecrp
 IY2b4HXlKKs4X7OOmzKEAGQdW4moq8OvjpGRM5sZabCRm7B52y7Bs9YjhOHJ++qBk1t4
 vy9OwWsGSCK8kJGdBjOdszYVF/VGRouxJDf9u8voN/MILMYC2RSaUP8WNpI131z0/oW1
 P3/KEpbUpb22cjthO9vHpOlZUP/hEDPP5A7y4uPWZ2rPanPIJVpyQW5mNZUOn/lTRosv
 wlZ/8eivaCn1zSr8JnFlKXoe0nbfzuN1vod46Ym/gXTiwgCPiF1gypXOG4pvB/qWg9yy
 NDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HjpQwX/QkEepYSPRKoMV1yV2gkyB3MGQc1uvI8dS9rg=;
 b=1ixp8Loh7I49KY0SNXNKznB+NHJzQ5zbsDXuNDmQrO5HLtDkx+u4HkAQkpGQAV+inw
 uv83ZsGaGJXv6kgIgaYN1jIMDADyGJErjOzjmn6hwzK/MFFegat4xMzbMuYUGXlWB6Sf
 gMOe+mOe//h1HisjnKjhLUf5oF0z7gPhzWM14qTgGJbAk/x6BsLgIQUXMoY2zCJt1m1m
 7F+zPr54f2aKeM7BQmQbm5JbAypd6wKXy28dollEMqd7OUAhlgR01EbZ/NhOzLnozRX2
 EEYMZVofrbX38ikuQDJmEROu5P4U6LHRfqteOCovL4dMMgCC3mg4w4gwrMc7pCAQOHy3
 g5wA==
X-Gm-Message-State: ANoB5pkwF759ndByWXq51i1KNAU75DqzIk0Ye6VNwjDB7CnqIZNBBZi5
 QdRhmBTgdus/EOFv7xOfHGwzsqrpXXWxuuAn8EzfBQ==
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr3713887pgl.231.1669126802501; Tue, 22
 Nov 2022 06:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20221112042555.2622152-1-richard.henderson@linaro.org>
 <20221112042555.2622152-2-richard.henderson@linaro.org>
In-Reply-To: <20221112042555.2622152-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 14:19:51 +0000
Message-ID: <CAFEAcA-mjT_hTJZatLmsB+9b5_9XD_9nFbQ_5fGOWMEPbBXi3g@mail.gmail.com>
Subject: Re: [PATCH for-8.0 1/2] target/arm: Use tcg_gen_atomic_cmpxchg_i128
 for STXP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: t62m1eqiWfKf

On Sat, 12 Nov 2022 at 04:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.h    |   6 ---
>  target/arm/helper-a64.c    | 104 -------------------------------------
>  target/arm/translate-a64.c |  60 ++++++++++++---------
>  3 files changed, 35 insertions(+), 135 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
