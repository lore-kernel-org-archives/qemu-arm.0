Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp371902ejq;
        Fri, 5 May 2023 05:16:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6yaVq81gFAvcW4hh8l4dXXbx0EAgFgzXKtQIq9l+0cfTi2xXIbeYsUAfytRNcCMiyFRQpE
X-Received: by 2002:a05:6214:2aa5:b0:5ee:b788:2f48 with SMTP id js5-20020a0562142aa500b005eeb7882f48mr1501980qvb.31.1683289005852;
        Fri, 05 May 2023 05:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683289005; cv=none;
        d=google.com; s=arc-20160816;
        b=uHgMxtmXcW5br2aVRIC47199VH699kCKwVVRNO2NT2j7PetM3MwQuA8Mu4pPu4Qp4u
         kDjRmvLoH4G6z7s0OA33CI97Q/xt75n7bwL2eTPGf94uWPgd/E3Ns1kHnrLNXDHT8+9F
         nIcXAeW1HQ/8iJTpfTvz9xBYARd8zrmsb+bUjyWDfwkDKEYidcnqEduLVZa0hb0AybKM
         y2rJIVNc9/x8CMlraKhad4qAhm+11c2vHWNEmOixYTg9XmvXmnUBXIMAtC0ge7JwlRy9
         EkCBsCAIdIhBeL/c/nlBqTp6kJrJKz9mSmvO2LgaItZPrLHHsbvVuN7QkQJuKdTbN7On
         swiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+HTByYkTJururojW+BljJrcTMEUN8AhXjRN+CMC4/ao=;
        b=BXv/vX+aApdSeVYUcCQq9y9bWan5tpynWCkAHw7vKRkAkO1ebMpi1mC6px0hTkAGz5
         7REyeEe4Oj+Qy8yZTtY/dgfVPgsZRNsH5TPbo7LKMDF5cc/0AWr0s7T8T/Gvu9QiDq5O
         4vYO7sAusyOjYVYVcLubcotNdPiUvcwJNaYlJQ1nBIUmUCGt5Gjv29vy1yqjA6IjKufk
         NfrokjhrFYqZ8rGiXEfM2xajZBPWI3SKmm3YFN1ZHSoZUki+Cp8GTL/8QT6gkTeRf4hC
         LGZeH02PFSt0nhPhto1kLH3SlQXKZNvdxpg/tcyPz/ml5wonC890E6SQfBy0u2E30o/k
         gEjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTdYKPwl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g24-20020a05620a109800b007450bbaf3c2si644099qkk.21.2023.05.05.05.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTdYKPwl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuMQ-0000om-VE; Fri, 05 May 2023 08:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuM6-0000XD-Ss
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:16:14 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuM3-0007yY-1D
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:16:10 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bcb00a4c2so2683197a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288965; x=1685880965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+HTByYkTJururojW+BljJrcTMEUN8AhXjRN+CMC4/ao=;
 b=tTdYKPwl+d+P1oTgDqIyWNxhru+VYl2zoEKkzA85IXtkD2tn5aLdNwbUuNjqYvnXjE
 hwksGKKrfz+IXAeIpkjPmsLNvf3GTV+KN3YZHtYQa5/c19LDcoJpr+HDwhPpavrsDtV/
 6vXGeTkyvD0htoRDu2xXudWoB2TrTtpBXPiM3zDpuDY5bhyStj2/EmLJTPQ9sMWdUob6
 YVjKYbf8kieG8Te530EG0Eny/qqrRglNTDurepQHABrHH+MV8W3/cijlp/q4MEDGohTX
 oGAFzYdv524gGBk1qtuuE9SKodEyiMXePSC3te1KhgmORbwR7NG/Ju7VdkDsq5Zox6Pv
 GXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288965; x=1685880965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+HTByYkTJururojW+BljJrcTMEUN8AhXjRN+CMC4/ao=;
 b=IB8t+O/1DaxhOH5saR6/m72T+oh59GfkDujpZRCA4y4QKz23s9x9SrzwCXGFcYHxRP
 7D9mKrY6jf06KeqM8sTsOSUNDJpzaKSavluQFhvaNQIFG3zifY3lVAW8e5WefmvbbpHP
 se5VsP8jJE264szX2qn5R0WqGfvnHj1QugtA2uBZH01sixaqiI42qUKU/VfOJJJ8jU2T
 yxxz3nA5qhicWVblAPiDnx1aov5F9eBQaOz8THih62+fAunSCO8U33K4K+BTQVHc3N+0
 Tr4eiPjQyXiX/p6ysrt8s8pv7Yy9lt57wT9Zf+zrqMpgtjLyBC/dzyJQ/xE+/uLNTXmQ
 Dc4w==
X-Gm-Message-State: AC+VfDxxtoVHY1K01a5ZwnkYs/RTqXMYDKf+26YOgL6K9kAi+htKL+0x
 Ajc6hzvJ7X6SMa+gNg7QJb1VLkjCXMdbuVzTaG0TFw==
X-Received: by 2002:a05:6402:182:b0:50b:f929:c6d3 with SMTP id
 r2-20020a056402018200b0050bf929c6d3mr1334097edv.1.1683288965409; Fri, 05 May
 2023 05:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-29-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:15:54 +0100
Message-ID: <CAFEAcA_f2OFM30FiUorrK=G3e8uAaS=UDUD5HEwvzzi1-iDeTQ@mail.gmail.com>
Subject: Re: [PATCH v4 28/57] tcg/mips: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3MrXeutPpcj1

On Wed, 3 May 2023 at 08:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
