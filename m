Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2411603ejb;
        Mon, 20 Feb 2023 08:08:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8Wbr378gS4jowHpH/u7uBVe98lhsfztLnBW6OBM7AAQH9erQ73FbGUFhlirLqFOIdDSe/W
X-Received: by 2002:a05:6512:144:b0:4da:f436:d423 with SMTP id m4-20020a056512014400b004daf436d423mr484917lfo.21.1676909317261;
        Mon, 20 Feb 2023 08:08:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676909317; cv=none;
        d=google.com; s=arc-20160816;
        b=yx5GyeoxZB52rDW4qsU+YHH0NYO/QBGE4DSTpuG7Lltc2uwCDidaejJu0RGDi5tuym
         qN7GKrj8Qgg4szzmdoHVO8ZwCr+HWL6L8D38ELMzspRGS7pkHLpx70dOROrfx4xLbgOu
         50S7le0FD295WKKUudJ7sF4OP+X7PcOS3FC3SZzmKVpOFkih9r05xj5UBmxduyh/+CeX
         e4eqEeqXzgd4i6LssFJ60AK49J6tcXb3KEz1oaPh5tcIp6WqsauYPy00/zhqe6fzfJRD
         d9bvnb44aV799Z8bq+J2/tvF1JzHfF9Z1NIf3IK4Z8AcrZJL6j2EH8YE9O7EcPHChCz9
         XnEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NJSaxpz4H1Ctw0NLzcKRlF9OHtzUjBzt2NscbSC5xvY=;
        b=Y2cdW90WYNOnZLYeXyiU626iwvv/27jjdCyqyxiqGbGTdkMh9/TIwaLip/bBywEEbe
         0jy4kw/XvKo8HUNSzVMC0X3+f6cj8r7c01mYm8bJFkEZbc6LDbLMA0iqyyvUkA7YOkv+
         NFmB2KZXBry/K3ghDQzgI2BCQWfn+YIsyDIlyKfRd7W9qkxgiSnuyYxi/X5bYf99JJng
         rlEWfA3sNjV01KPYNMvtPMmHzXuAOs6v7yJ5FLJJO4S3POwPnQZTqUbeO+lNJ2YCGHHI
         +dDT3q/ZwdHegzgBBWS8Rg1Nxl2FE0OHhhBLackO9x6NbWQTFwBr/VI/7iTyukNwTMjV
         fJBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFazjslL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020ac246eb000000b004a29f0304basi104093lfo.277.2023.02.20.08.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 08:08:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFazjslL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU8i7-00062D-13; Mon, 20 Feb 2023 11:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8i5-00061K-OU
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:08:13 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8i3-0007aa-02
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:08:13 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 b14-20020a17090a8c8e00b002349579949aso1813974pjo.5
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 08:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NJSaxpz4H1Ctw0NLzcKRlF9OHtzUjBzt2NscbSC5xvY=;
 b=bFazjslLR/wfW7mdFyOMAgbX8fjNfzxHPSKWIMevKOglinXUw8qM8jNvdtz3OzE5iD
 DZLG/kDpfrKD2e6ANjwtXBptrt5T/nQvAvn+4y5oETQrvJobxCOhxiZlw1y7PYr1wVRR
 ZgAQClAXS7+TPb8IQ+wrAwW2RO3zYDHLl0dtz5CQasHC6OuXuPeRggMRD4mrLtgECe2M
 3gRER7FgWt4rSGwEMj+h5F/mHs+N7u7mCN/yjsgFWEv752yE33FRr9viGjmuDBXMr/CH
 VtKSrxPbhbzwM4Yqt8wJRaokFuFN8CJwZu6m7Ra9Q5De4hlTZ+sRQKdDN/rgFJGyQudz
 hqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NJSaxpz4H1Ctw0NLzcKRlF9OHtzUjBzt2NscbSC5xvY=;
 b=wNVkr0fS7DyzcY7a4wlK2UZWWNpt4Z8ugFpTuSx3MmYDqifPlfKtENBeaS/9wATEvA
 wwpg/s8Xe2nn2jynv/Y2HXJ9w/m5Z+PVOe2Z5EXFv2h1ce41gocpsq+3X5Zi4RQS9vjB
 vyhQCuHqwDGItHlglh+yLKCui+qubQMw0wi8MpRvhup+EpyFUo5g7nfr6ZV8/3C8xj8N
 vgWCazF43mRnjMXSMfPO7NJ4ugsuKJlHim692C3pWIfIaLvcTg8KGFontwbBB0Ij3sI2
 tsckWYJFR8H4YWeZP4PsDNWXUk6I/I22bEsnowei3g8E6aCcWqpcCGgD5EyrR1NzaNMB
 epWA==
X-Gm-Message-State: AO0yUKX10R6WMAM7oVnxSFsDchRmsueDfxCTzZ9l2GJD3FmcPDYxxQrG
 dxl7KGrqd0PYCPDMlMCA86fTb9doZ1EFeK0p3j404Q==
X-Received: by 2002:a17:903:2c1:b0:19b:5221:4f7 with SMTP id
 s1-20020a17090302c100b0019b522104f7mr265181plk.9.1676909289407; Mon, 20 Feb
 2023 08:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-5-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:07:58 +0000
Message-ID: <CAFEAcA-ctD24O86wsojLpiMU5yd+i-pZ8xegf4pq-Yzh4NCg4g@mail.gmail.com>
Subject: Re: [PATCH 04/14] target/arm: Split out output_vector_union_type
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hTYVl4hkDPbl

On Tue, 14 Feb 2023 at 16:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a subroutine for creating the union of unions
> of the various type sizes that a vector may contain.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/gdbstub64.c | 83 +++++++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 38 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
