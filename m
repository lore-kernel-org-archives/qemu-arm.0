Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3105640lfm;
        Tue, 21 Jul 2020 03:03:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6/yUokKiy9qz9NhVzEMbSyuCwBmZbY173ejzf0xa0b0N5DxA8Ua4exPGBv1brVVdsLHdW
X-Received: by 2002:a25:2685:: with SMTP id m127mr38993598ybm.368.1595325823742;
        Tue, 21 Jul 2020 03:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595325823; cv=none;
        d=google.com; s=arc-20160816;
        b=HSpXya7KxAXKv8zDgXPhW/XU2PkQ5y7dJ8z6iwmDAJR2i3fiRwPZ7XrwkM+lzqFwdh
         Q05h/yODr1F+870FPT6TvFGudl8jNF+Qg6vsaTBv4T1ytqlcZgaDprcPe7dsWxFefLiR
         C/ZRLhYZfuwQwYouqVGmnX5BBRdAYimqlGFSrRtCHn0+M35u6R/pJpSLHQIUAj6cERjl
         bgh848hrPffwBLuaMq+Puq/0R8CY+7vvxNoxyqkiFA0GhTm0i227HCAEi4ikE7poVJRe
         HBt2RpPE5I0em4sbwn2nH4qMnxYrOBRqCpI5UopyHKzY7aJslqTjZT+Zu1VQ3Hc0SadT
         VS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e7xcg5KmGjBqHll9tFqg/k4svQLOxoH7Gl0fD0088R4=;
        b=RcaaAwBouIwQYqr52CcZ+U+8vI6PppG4nQJshBuN0y1+/s/PF5JQSEJDTfxj0XPLM7
         +I8U6PjBePW9PkXx6Cp4FEIcNxgE6wOHHYc9rHT5P50F6yfNwhQe5QBdupSBogpU1Z2f
         ET2EWtE8fVMy0i7bxvD2MUiR8nG7C91I4HsV12cYp2HHIee9GP+95Alt9igdms9nq8ic
         dL0R10e8V/p3/UWkmbWzuG8Z9Tfx72gOJFQUTSHGp++3vtM5+hY21LNev+qGHYG5ubgQ
         jswry1siwbXGjuMfZ8zkBJPjQsNOLcNajvdWF3UlqN0Apzp25BT+KWyrmp+kB+d5eSh9
         zPHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kOlLPkgQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 207si8871405ybd.431.2020.07.21.03.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 03:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kOlLPkgQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jxp7f-0003Dx-5y
	for alex.bennee@linaro.org; Tue, 21 Jul 2020 06:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxp7X-0003CP-Ka
 for qemu-arm@nongnu.org; Tue, 21 Jul 2020 06:03:35 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxp7V-0007FB-W8
 for qemu-arm@nongnu.org; Tue, 21 Jul 2020 06:03:35 -0400
Received: by mail-oi1-x242.google.com with SMTP id j11so16706760oiw.12
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2020 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e7xcg5KmGjBqHll9tFqg/k4svQLOxoH7Gl0fD0088R4=;
 b=kOlLPkgQToWn9AJWJEXIN54kBJTri0u6rFnvw9a2f8FoqDSos0h+pWW1GmMvOYxmC+
 pLB/lXt2f3Oeza7Qhi7ysRtBb3VBmA9NRyfuI8SDn3tP+Zjw205Vh4TgmeFM/hYUos6n
 SizpMpRUtrM91fAnJP/0bFKcV+tSP/lEbUM/3xwSlSbRT2390VND8J7Ah/RYdtC3Rj4/
 mqyhRp3obkJO/mWNZoQIcXIM6sTRpVbsNAsmqpDsTE98gd62pXrxEVKAjqKbL0PHrAjC
 FZrzn2ehrX95+2/rLZJ1tkP0l+WGY+7EZaAQ0nE2KQJ3sdWhh5vfXX2vpniNI1f6C5hd
 yHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e7xcg5KmGjBqHll9tFqg/k4svQLOxoH7Gl0fD0088R4=;
 b=aIL+Vb5CUtQ0pZm/bHquO8GwC1xS6gFZQnPtrCRVomm36nxMf4rOmfbEJUQOuchXmA
 LkxIKF5gHE0s8EylvX+po29znvqVguGnd8weFW3M3EAKk9eBtiU/Y4tBtQFV6D6nuk05
 w42XIXT6QKEv/JfeBeSsNOtfBr2Gv4foeAFiJKr4N1Mb8yh9FYfa6gkJyUuQ330LZVyu
 dzwx5z+nULUXYSNdSRaKyL7OQDd0pvH4Lzw6n4GtYUJzV1mzFqt0a3tp5NzJcWAudrRC
 6lu6ODaAib8QZu7SMyfxpYWb72dBprzfpUP85CN+h8SdYE2UWbrl7EDRNksByae6lyc8
 E4JQ==
X-Gm-Message-State: AOAM5338Y/P74fVtjdmZlHjIw809HCRzyAesjMzrO2HoBpwe/H39/HNK
 KzfYhC3QqTj+fDnlG2r3wgkNWFgaVBB29XfmzTVl4A==
X-Received: by 2002:aca:2819:: with SMTP id 25mr2221544oix.48.1595325812895;
 Tue, 21 Jul 2020 03:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200711101033.47371-1-drjones@redhat.com>
 <20200711101033.47371-2-drjones@redhat.com>
In-Reply-To: <20200711101033.47371-2-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jul 2020 11:03:22 +0100
Message-ID: <CAFEAcA8D6xvNhaWtf9PPzQuDqj5xucioTYqygGhGJT_2XekT+Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/arm/virt: Move post cpu realize check into its own
 function
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Beata Michalska <beata.michalska@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gpO/6j2F4f52

On Sat, 11 Jul 2020 at 11:10, Andrew Jones <drjones@redhat.com> wrote:
>
> We'll add more to this new function in coming patches so we also
> state the gic must be created and call it below create_gic().
>
> No functional change intended.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c | 43 +++++++++++++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 16 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
