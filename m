Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1231900lfk;
        Mon, 5 Jul 2021 06:33:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymqCOhS9ngTQvRXy+ceNfqUtN/SGsUH4XyYXqMPk6m8n6WwbnHmi/qMJaGo67FcllIKXDt
X-Received: by 2002:aa7:d804:: with SMTP id v4mr16144925edq.232.1625491994998;
        Mon, 05 Jul 2021 06:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625491994; cv=none;
        d=google.com; s=arc-20160816;
        b=pCfgjewvvhwzQjO12b7JkkokNDWn6KJTQzE8hQjqxZtp94p68141/dqpo15/XSq1Qx
         S7LIm8zdURfi16AJYg+b1aDLc7ZAi4s7LMiJsB/6+9gNsWdlcvY1BPOFvCAh3bVUUvbR
         ZZdn4pUPZ+gHTCLyL/kHG3xF7JofCMWjD3fHPKAA6e4Q/7P5RHxC9cccSn5vJlXh/KFI
         9pIUhQGq/KBKPnZSq9YIEB8MY2g2DIAZpJu71VXeGbUMOl1m1c15zYhYLZCC7Bc5Ta1D
         312c1euiyCe5z0ZJynB/fsVdu228Y6hJmkZcX45unP/1aiHjJbJbM247nACnrYh6WWQE
         mi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jCCZapk8HcyKdE6udf+TE8WAzb3DjFDijdv6CbUn8F0=;
        b=zRvctyECs/ON0C57ibU1iPg8PcnWVHJfDcQKzZKeS+y7JWMm3SoP+y2FFUyT8yebcY
         INljRZaRXbaKP0Hb5uJErekoD8gUqcW9vLwQk+wT0ha225LKQPJDN70Q0NU8bOaE5Pzj
         Sd3y6wI1qNtWIWlZhWXtwbYJ5SHUXjr1f1hn34vks4UehM82OlV/bSQ6CqEtLPELpjhl
         ABKhE3gPLQIfLt498UsNIkQA3/K7QLM0btGGdNRrt6npr4saCh31/CqX/Obl+MlzZMiO
         QV7sapySuJ5kZTJMlVJvU/3pAJ/xjHctcXyARfr2hDk6OnjpckEcb8SJp2xff379drXM
         ujbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tu4EzYVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si11364379ede.429.2021.07.05.06.33.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 06:33:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tu4EzYVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0Oin-0005aP-Rl
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 09:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0OiM-0005aF-Tq
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 09:32:46 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0OiJ-0004p5-OI
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 09:32:46 -0400
Received: by mail-ed1-x52d.google.com with SMTP id l24so23704370edr.11
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 06:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jCCZapk8HcyKdE6udf+TE8WAzb3DjFDijdv6CbUn8F0=;
 b=Tu4EzYVZ0S/JIB6hxhvhIBEhDgNEGKeTABzXyjOfZ/7JHmQmxy2wAh06bbiWhdDmBI
 2ciwKafyPjySha0IDQO5e1lBNGlGDLKkyX6k6nk4ONmkMJH3Ars8Ygm6oBL/c6VLZoOA
 MZbYri8MzU+hPd5E+7Gw+uOMVopuqSvu19BFC9jLkzXNAveY1jiQEgFv9T62wQ5OrF0S
 k+n0nwEO9heTykpolGZuSwgl/pdLqx7Bm9wdcDeDP7NP6CrzslI8Xq3PA3s0LT4owBl/
 rKGl4CCGexqE0uUxdL+d4zndubW//J7A12OPnkn+N/G1LDg2MuZoxF1ASkkAOYprZr8A
 rLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jCCZapk8HcyKdE6udf+TE8WAzb3DjFDijdv6CbUn8F0=;
 b=smcFvCen7nAm2O/aWhX1zpGyNWdtO/lwtQjJMPxnd66OwaPrLnpbeAVYj/ZU6ssQA6
 kSjrDbG9WtTT0BgkULtagZ3926u/2pJ5ftyEojNJHVw1KvEObJvudD6WRDlLOCkGk18P
 QTyxl7we7XjKXb395YhLKkTuwGWhx1L9g9reb4zbcrEkYzNHSfEGDZc+QTC57hg38mc9
 68lbhzBoOFGtFHQEelA4XXP0HV1HYX3vhts2NN84w7ccshLAeomLIT6IkXfysLNvXbkX
 H64Put5APN3jYiOcRwN5E/16TyVQc+lNJVqrOew+pSpwhZI5/bmht8dX1jgjLDrzYL3d
 xucQ==
X-Gm-Message-State: AOAM5316Jj/gZwuRmXrt7FgfXmZduoi51LSHqbDjJwjJN9K0T3eXa6YJ
 31R6LTyd3ZINCQe8qSvuwFgePju+AQdPMH7CJTb51g==
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr3593095edf.52.1625491962096; 
 Mon, 05 Jul 2021 06:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210702233701.3369-1-ricarkol@google.com>
In-Reply-To: <20210702233701.3369-1-ricarkol@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 14:32:04 +0100
Message-ID: <CAFEAcA89ek38DKx00W=pq6H1a-2Tw2V00GoDDcMW1QotMt5DwQ@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Fix virtual irq number check in
 icv_[dir|eoir]_write
To: Ricardo Koller <ricarkol@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1c98R2XnlbaP

On Sat, 3 Jul 2021 at 00:37, Ricardo Koller <ricarkol@google.com> wrote:
>
> icv_eoir_write() and icv_dir_write() ignore invalid virtual IRQ numbers
> (like LPIs).  The issue is that these functions check against the number
> of implemented IRQs (QEMU's default is num_irq=288) which can be lower
> than the maximum virtual IRQ number (1020 - 1).  The consequence is that
> if a hypervisor creates an LR for an IRQ between 288 and 1020, then the
> guest is unable to deactivate the resulting IRQ. Note that other
> functions that deal with large IRQ numbers, like icv_iar_read, check
> against 1020 and not against num_irq.
>
> Fix the checks by using GICV3_MAXIRQ (1020) instead of the number of
> implemented IRQs.
>
> Signed-off-by: Ricardo Koller <ricarkol@google.com>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
