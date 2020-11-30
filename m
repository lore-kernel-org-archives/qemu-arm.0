Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5044332lfb;
        Mon, 30 Nov 2020 03:57:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrmVuzOHhuPfJ+DDQDmBg+hLHgKV1xEdFhv16uoCAHG+VeHnGkUwZ9blsJvGbOA3/zcMzS
X-Received: by 2002:a5b:acb:: with SMTP id a11mr26609807ybr.493.1606737424466;
        Mon, 30 Nov 2020 03:57:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606737424; cv=none;
        d=google.com; s=arc-20160816;
        b=cF1yie/3lYeI9vSGgWhMAOuObuiJGiQ0SfBbH2pSjBa4rCjtrooAHI/oC4R8WuTkGL
         0GPzSjQVUpZsl2wZ9w5guZmONWM3N8i8DrkoiZJGmTAIRzLsBP4q5QCkyw+jSFkWOugl
         AMsLLFZHBZZvZuGtl3hYaI7kV4DMmoSpP7DDPKh3CTa3HPZ1z71yo1pfSeoc5eyjNGE4
         Y402Ko06Sh+SWPUU+86NQAzT6vLEvdFTttiwHR70GZF8zVxetXgKHRe2q/vi7c5fxoRN
         Wbm33Ckz2LLCBxIjY+msLf/0EMgu/zL8Zs46EzKTD2nNa2jTvjsAgH9C8nCbHO9YwF0f
         OFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J7TdQWFyBiJllZLrTMcwK1fWX3ABOvJIPpciwspLNbg=;
        b=FAOJ82+v5t8SkITp9vjxPdIJuTwuczCY0hr10d5erBOnmg5mhuR62R6SqPDapuVFJB
         f8Zi0e4SxKoiCf3VdAJB2YYv0VT7xoXRDE1jTarIeqizIKdtECo4vdnuY0qSJgrRVQH8
         yzK9nHBLoPp7XafFlsv6ifXL8F1bvqgR9T3hnFeAQm7GLuHtiNr4rA6xswGPdsUoA34b
         TH+uXxTiHbvlozEV5ACFIXu4LdytH9mFPudRfpuS85rPnDZMq1n6tslEinz0ZilhALAn
         VmyhtavT4Z0kx0dLUPu4RHGrS2BXDtKRqgTiF82SOzlRW/3TJamlRSVzOTjeJC5ppBzF
         9wQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XmZm94vt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si16830634ybf.138.2020.11.30.03.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 03:57:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XmZm94vt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjhnj-0007AC-RE
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 06:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhna-00079x-9D
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 06:56:54 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:34416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhnY-0001Ro-Ne
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 06:56:53 -0500
Received: by mail-ej1-x641.google.com with SMTP id s13so5895843ejr.1
 for <qemu-arm@nongnu.org>; Mon, 30 Nov 2020 03:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7TdQWFyBiJllZLrTMcwK1fWX3ABOvJIPpciwspLNbg=;
 b=XmZm94vtoL0Yw4OgDupcNaldUdTPQlHNukSRz+/0pckyGIUKYVjJNn3K9+nz2jK5zJ
 sG6DojnjRp1dqHX6X0F9CSPi0rEriVzcztWneOhqz6NpyJrH4Ue6yIQrlBYXDg6srNhU
 8jUDwUxwBX+7a4Gd7JPpwCUKtagB7kSbGtzqMAlx32F5PyM0V5t8HaSQJuVHbo5Rauha
 mxsnAKfaVpedQu3hwidzUHTGa4ktmprsqSk1+BvtCRPGkCtDoWcwjvyieqGLVKypV/a8
 hNIPmnDcVwzPb6c1TqdwaFIZhbUPzfoO1PHfjjKk4Dlk5GDOvKxTHRfIAxDCB3tofd1D
 OUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7TdQWFyBiJllZLrTMcwK1fWX3ABOvJIPpciwspLNbg=;
 b=RfOI2hSGxOXbQISbR64rYd5ndYg4zEXoajMNQl1myXdvEv7beTHkR8f7+Dqr6eyZdW
 dXPqE91EXyxNyspjZOSBzwPQw/TLiF9ev+ihCxfxOLW8/aH4D2XFBu0+aBIc2HnYLxEE
 mTWEk6KormrUEX2R3Zsgm5+LHeQqX5MLYYQAHC8i324OVlIoJeQFcSjJSeyp9Mscm9xJ
 dLK7aoJDNZOmsjEYD9y0sJJrlhef9IQvHZsAc06gB/WNtQhReIKZKw0gnGDiRD+9DytL
 9YcBlsqHNCFjfCXGm4phULMSkCs4pPJDjMbQl+8T66tIyL6ZqkM5liqMGXU/8N/A1wzt
 Yqog==
X-Gm-Message-State: AOAM5301IZ5VliqA1snPBsMGz2zLnTQUJbnj3OcY3GylSUe8cBeN02cf
 dHLCCxBh7Ys3hetnolrGSdY+g5a+BwjRVs/OD7UaKg==
X-Received: by 2002:a17:906:4bc6:: with SMTP id
 x6mr20919183ejv.4.1606737411120; 
 Mon, 30 Nov 2020 03:56:51 -0800 (PST)
MIME-Version: 1.0
References: <e79639f0-041e-d190-c895-0e1f24d64102@linaro.org>
 <20201124125912.1108631-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20201124125912.1108631-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 11:56:39 +0000
Message-ID: <CAFEAcA-ZPvnf686NJEK=+A8pTZkEtMwiK2yuLz-Snha4r_92Hw@mail.gmail.com>
Subject: Re: [PATCH] sbsa-ref: allow to use Cortex-A53/57/72 cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ABms4f/Ya2NF

On Tue, 24 Nov 2020 at 12:59, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Trusted Firmware now supports A72 on sbsa-ref by default [1] so enable
> it for QEMU as well. A53 was already enabled there.
>
> 1. https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7117
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Applied to target-arm.next, thanks.

-- PMM
