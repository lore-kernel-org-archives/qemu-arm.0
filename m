Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1340253ejc;
        Fri, 3 Mar 2023 09:28:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9ixCi2v+wm4Rl9b6ewGJZVwp6n3ApiBsDtjQ84h8sQOA32hETRMZxPffU4uI2rISKT9Zvp
X-Received: by 2002:a5d:634d:0:b0:2c7:ae57:5acc with SMTP id b13-20020a5d634d000000b002c7ae575accmr1895096wrw.26.1677864495954;
        Fri, 03 Mar 2023 09:28:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677864495; cv=none;
        d=google.com; s=arc-20160816;
        b=BeTLoFeFeOLxmNUpVx9HB9jNsDgi6Hqb47OEzBfiXRHUUXMQpKO+/eA+9JKLD7p4zN
         SMzZet5UjPNX2IuevQeERJ6pv2IXqANsdo8ifFDTLcDxGCaxp+vuhBCFoRrhDsNn5CVq
         axw/eEnfQQSFndIltK5H4gdVi2mbDTO88OEC5wqMEqTl+Ea0quZwefSUiV9AwirC+Rma
         JrGcoKkqTb1rNGz0fl+kFTJ3cLbEkcJRlaoJ6fZHSnGbFPJeNBZ5CTQN/vQrCWGkeHNO
         5xbATG0gUa6t8zUZej5nLahCOQF76EFtnBnGloVLKyx3iClbY8l0WTfmuIEUWOV/WbP4
         +y7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=raqoH4xnGC35ms6zXFn3a1ISCKigouTArbSSUf/deY4=;
        b=AeO8gmUfWYLTwUPdLnB8icbPXCMFHTJAQYUWPmp0u9toBuDh6x3nh4cE++RPMAqR/v
         /WA39gOjvHZqtxI/2U9CCoIMCC3LFh2D0YQBsIoywSIZ6imhM/CYi3kmC6NrOTYiyRsv
         WI+Fp9oGZ9a7FOGtjxP9zxj520CYVif+IquRhhif6WSLIVvD7w33CzI/CCGBj3SGrhHb
         AcOuK6rY73CTx9jdMjwxh5tnhCCMFI05t2nD7reZrUc2mGTsFEUl+rDZP8lO9J+29Lif
         MmIAr4OOxsuESnJNVaQBPC+4lmR+A/T2fwQOhWgEJYNK6GmxkICau0jOCd75NC+UlF8J
         ATnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OA+E4IEL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10-20020a05600012ca00b002c568d21f95si2120039wrx.285.2023.03.03.09.28.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:28:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OA+E4IEL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY9AN-0001Ta-Pw; Fri, 03 Mar 2023 12:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY99y-0000qh-JG
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:25:36 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY99w-0005id-Fp
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:25:33 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so2939817pjz.1
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864330;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=raqoH4xnGC35ms6zXFn3a1ISCKigouTArbSSUf/deY4=;
 b=OA+E4IELnfNcQfbsHXoAI+7BVSv/InEaDzNALq7lj5GP7jOog1wOh0IYXlk1IxoU5t
 sOwNesKYdpb7VDdO3XQ+i2uNXMXc1czH1FWf25xdLx0QrUAEKc6+oEhe0wdbNO62c8kc
 VUC0uv08kxlzuxB7CLs5Gn7IymRXMJsOHC8JCLDnu4fA9ROVhOq9eTZrd2wD3jpPqgXZ
 vl0NSqtzHNflkcnvY9HXroRg7ILzI+y6JOaXUfhmIuZ7plPvdM5n8G+bOt3OdlTd2u1A
 hlYnaTDIEpMUzioVPrJQI+dXbSPibrGRhtavqvndXJCEqHeCQPaI+L5+baoZq/Kl9QnD
 eWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864330;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=raqoH4xnGC35ms6zXFn3a1ISCKigouTArbSSUf/deY4=;
 b=t5z9JPqHHbtmZ8nCSYbUQKz3kRctMBAz5Fg7x5yzQlITNy2FJguUZVSs0BpOxkoHBJ
 PgTx/jPVVdqCB/6F5nRrpP3xDVTBlRR2EKv1ytNxuYBrWiuvrqMFI1+BWCPv40OQMRXl
 fIK9kkGEJjhlw1boZf780N37PgZhHyZ20vged+9XPDK+QE7BDLdB6iIwWdI77QXklI3q
 b3sPsYz8vb+ySKSsb5jeb8J8z5vkyeafp/saexrCsPpzFLIHkU8ZMFGNRj7nzTPn7bTv
 1XZFBys9l6BmpzuWp1EmxbFqBXmXGDq7R27oGWzQ/tN31MYj3RI/khac6ADS4mLPsZnz
 Kv3g==
X-Gm-Message-State: AO0yUKUHLfCWENTX58w9sP0M5KFpIux8B/g1AxkFpFOtwHUpTf+2FuAQ
 zIJRy6nG0yB1yeEVjq8ZCycZE+7AKJZUjgfQoQjWIQ==
X-Received: by 2002:a17:90b:893:b0:237:7edd:2e08 with SMTP id
 bj19-20020a17090b089300b002377edd2e08mr901355pjb.0.1677864330484; Fri, 03 Mar
 2023 09:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-2-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:25:18 +0000
Message-ID: <CAFEAcA_+PNfRrYR3=2rHtg2w+BRWRmeP8_kpzec-Xejb4Loidw@mail.gmail.com>
Subject: Re: [PATCH v2 01/76] tcg: Remove tcg_check_temp_count,
 tcg_clear_temp_count
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: GP8Zpzc7ZxRE

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since all temps allocated by guest front-ends are now TEMP_TB,
> and we don't recycle TEMP_TB, there's no point in requiring
> that the front-ends free the temps at all.  Begin by dropping
> the inner-most checks that all temps have been freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
