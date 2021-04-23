Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1560210lfb;
        Fri, 23 Apr 2021 10:45:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdlaKrlZBkIEF/cCVaprh1OvvIthqxuOwHWZav6rz/08gEPxOkx5BlreKFGD+tYhHo2RYT
X-Received: by 2002:a6b:6008:: with SMTP id r8mr4212174iog.125.1619199949627;
        Fri, 23 Apr 2021 10:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619199949; cv=none;
        d=google.com; s=arc-20160816;
        b=gN+YmC2p3JcppKQ+wdwiS15kQ6QWepIuGrLJbe28BSgbtBHrcqMf0vLRkbDg9juBor
         njRYnsiUU9LTeJOCBnWD4JAWMLDIfaZ2TtXWhPmtxtie8Nnq6vDaQBe+r1UA0qTUe5qJ
         HIoVMrc5Dz21nRQ7vDTNgAVmgixQfdIq4bc7Myufk/tOD+g6XZrIQDLGGZZh/cKMMMtX
         tA0qs3nCrtpmG83uqgRTgVsSa8BexpyPMz1Z5OCO/uCtBGNYtgAYk9e+LRNgCEk091vv
         QYlbpZKMVRXU7IyZ2POcSsyrqSRXcw71IVooiphZXGNA+Pdi0QTRCaHsPOujkcczjPoZ
         +TMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sewNWV1TNP6wUtwXwXG9cYSJCjsfFUZRNXFfYVZ8B/w=;
        b=wJEvgDF5Y0T+6Bd/TVH3TFqy1/5+ndqDay00yxL4Ohxho7hAJ5alNeSQ0u6keOhDq1
         xfRZE5cXbK263ZfPCNioEUu+HLxV0gMfJKxUTUgov25gX+ONVjb4gfWNBEqYdzRS0GE+
         e81ZRjZB1MsL0Q73E0WBuYaqYitelybGjLhkBPkP9GDVMTJRU7NJdm8eEs1u0rnvKRb9
         4Bt3WA8w5H9gxeZMb25h7z1TvEGBvdyIGraWLm5CANfD05IBDnB8+3Px8q7fLs1RJc9J
         XTb7CRXQu9EzESmMI97VvglZdl/s8MdtX4od/fRRgEyyzmYfB80ZNhPr4WyKal8MqFod
         OvIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QI8bfUJB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si5822443iol.87.2021.04.23.10.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Apr 2021 10:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QI8bfUJB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZzsD-0003U3-07
	for alex.bennee@linaro.org; Fri, 23 Apr 2021 13:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzrz-0003Tv-EI
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 13:45:35 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:42762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzrx-0000cu-PP
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 13:45:35 -0400
Received: by mail-ed1-x52b.google.com with SMTP id d21so38239944edv.9
 for <qemu-arm@nongnu.org>; Fri, 23 Apr 2021 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sewNWV1TNP6wUtwXwXG9cYSJCjsfFUZRNXFfYVZ8B/w=;
 b=QI8bfUJBVCTdAk212Y+edXdzvEO0gfq8BBw5YWH7gfeiC1zQYJr4VWrtgix0qps81F
 g2RCpLAafWPARb543O6BD7MH5dkA1RbddhkOp/liyOSPxR4lgSkoiyMUogUfnCZ5M4ZM
 IZ+mo+RSzSNw7RCUDEct87eksRP+WgR0Us3cgJJzjV15yAWBDJI2ux2Q4YyJ1E9iudCm
 YKXF8fMr5rsxIDSLU5zswaNc3zExxB6OfkXNz4sdP/6AFKGoeJcAfzikKVUoDBtGtNGW
 OQYJ8s+B14Z4Kku5lzfNhn9T0cXarHKpQRH3NTaGk1kCfgBkooKF6AiM9QuW+tH7vVq8
 4E0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sewNWV1TNP6wUtwXwXG9cYSJCjsfFUZRNXFfYVZ8B/w=;
 b=HF1fiNxBGAXO56YBQBWgVTYiIBQwvxTu7QPeQRDwlhQlY9DE+2Gir2wleW0U2s3Qmg
 RxjrUR3YNW7Y2rScDlAsIYmck2fVe0Yo1+ZwAe/kzK7EflRZWqaZQAdPxBkfDjiSxojl
 XZlfKS86YGi9I6i2twpWlmseYQrp9X9MVEzyJ1FlXTBAnHe0HSF0sVimbZKuBzuyGsEY
 bf8W7EEX75LAhktHSLZAv28jI81UZ/ICmszuR90bTRUN+n0eBBtSE2VAJgDyMmp4+8PN
 uzezkpsGrw7NGq5mGoZRzuDGsATf5WEo38ba3e3GMYICZ/43HxY3e6YydfvFNv1LSCD7
 9XDg==
X-Gm-Message-State: AOAM533lSpV1mkr6Pk7irC1+iT+P4Ai2bRepxCIk8Vh0zBLF4gJm2P3u
 3n7ctlllACif6Zzm3Vx4IKko8cGOLYXIerTeg4bLDA==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr5807708edv.44.1619199931792; 
 Fri, 23 Apr 2021 10:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165413.338259-1-richard.henderson@linaro.org>
 <20210423165413.338259-5-richard.henderson@linaro.org>
In-Reply-To: <20210423165413.338259-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 18:44:36 +0100
Message-ID: <CAFEAcA_=ux_34CW6KQmCrsm+6b_+CBdzJeJKo0yamOFKy-v+fg@mail.gmail.com>
Subject: Re: [PATCH 4/4] linux-user/arm: Simplify accumulating and raising
 fpa11 exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: 9Yzi8NeYF7PG

On Fri, 23 Apr 2021 at 17:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use bit masking instead of an if tree.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 50 ++++++++++++++-------------------------
>  1 file changed, 18 insertions(+), 32 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
