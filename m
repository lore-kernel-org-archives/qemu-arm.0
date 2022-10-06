Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp521194ocb;
        Thu, 6 Oct 2022 07:31:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7WxJDcvxE9X0RbYRa8g3v9pVERIoLJILA3jnkAZ5X/9vjHdZy5IEosGjoTTNqhj92L20po
X-Received: by 2002:a0c:f349:0:b0:4b1:a0f5:4a2f with SMTP id e9-20020a0cf349000000b004b1a0f54a2fmr4186224qvm.112.1665066673415;
        Thu, 06 Oct 2022 07:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665066673; cv=none;
        d=google.com; s=arc-20160816;
        b=R6vFQygMy6MrGb0/Qhu3SV399Fk/p6zbHbFeYpJvHMVcectprOx2iv9NC8Rb0LYszk
         M/xMGoHg5In3rkPPFKsCm+tPbqlbQ/vYwEy0UeuXN32edyXcYEQoSHCBhr0oQsDLDbri
         eVkgC4aeEyTcYhhNLd7mtx+y6PvIqjwQcsXGnLgiyQmWJlOQe5zxZo7+Z/ZGIBn9ZrXN
         WJLZMN4SXzeOZH3UM4n33XmlLtKrOCtDcrzPSHJ/VaLrCRH+YjtpAigqxN7mI2FQyRvw
         gCSZ3LxP2IF7JrA5mYWu21l2EtG8BfwceMqwpqAl3erk7XXto7EfWqOPtvYSeKj+W6Y2
         YmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AR4lyX/wyhqtgbyqoNkHHhtcoFLIClOuWSj8xUdTB3Y=;
        b=gS0MCDD/9EY7LlMug/eY1fZfXTxlywouDoJ+LkEyoAilQaMMyHRamqF7mB/J08Nhfa
         u+p5rsAmqGcUrrln4jalgMNaIkJFL+xfHlRrizY81Bux1ADQCX4ti2XyuIXg0i4rGd/0
         8TOylI7WU8vSTAYRUkkO3cL/Ro9gRHDFuEzEcg6+idxI2sHgNowpOtcZyZfuoY0Sv+j6
         AbrnsNGTYQXBiNRuqC355KTAtmziI3Kfw2qcvvZc8Z56SaGooF3c+M9Nt3X/IXTQ5y1L
         qi2PL20YntV2s6Sirs+dL/Vbw5bfIYo0E0TriwnuAeG9/YYa02T8bzcvxB6bhSlep0s1
         gWZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vFUXUJkb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020ad45ca6000000b004b186aae391si3554287qvh.296.2022.10.06.07.31.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 07:31:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vFUXUJkb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogRu4-0008Sh-T5
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 10:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRtI-0007N7-G7
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:30:24 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:56142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRtG-0006kS-VV
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:30:24 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gf8so1883596pjb.5
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AR4lyX/wyhqtgbyqoNkHHhtcoFLIClOuWSj8xUdTB3Y=;
 b=vFUXUJkbEYgpHiQK0vuxkcqbLpmov9j9J8qR4yg0b87jdsRZD9UrfW+9PXeKNPOItc
 gBy9D0dtPwvg0rlcUyeB+hFor4fTbcbRgwYiB5RRxC1PeKviXiArquMeuQWvC6c05KgZ
 TFevKIjFfiFGyaAKwoHxRlMfzWJYPMsYkH9SUOlk408ZKuSLwN+8t75l0qRX92gdb+Rq
 Jp50g35krvq7/T6cc2fOyRq2NMPvQyRjSj7dCTwL5XoUpe+JSxSEv7es6KnlU2pwGz+/
 ivS6myr3OFPOIrH368WD/wMe/0w4it330ITKFVprss6aR0J/Gcdh89DJ1UQUVTsYpcKg
 LMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AR4lyX/wyhqtgbyqoNkHHhtcoFLIClOuWSj8xUdTB3Y=;
 b=LkfWNqkXum3/kC7prDF3CvOrMIIGG7eqA88yj87Xai9Hm8VmV1gX5Ybj13VeHx13ea
 7cRoHouNcMjdDESQxFFC0L2QNki08ekJClEtif3zJbdhs25sIPrZkxsrwcM1TGdiFgla
 RpjaOsCBcgy5lff32okDFu8CWSGNc0sB/WMJdWyJ2xFc9p+DXiN+wW+9fTkjdfTeVhQE
 e4hHkEOKT8qkl2LUqxcQLNkAVc9f6JHA+RLRZD2jty6/ZbhqlvgWYTcOlLlMnqkTs33C
 flOHa/0oNMG1WQJMTnMVSrPGkjhlhcNHL19H8SHocsE+HnsG33nAfWJg1Uexov9eRUoQ
 BNBQ==
X-Gm-Message-State: ACrzQf2ZbnFq8d+nIwbbAWXRqNwqy4YPnGPK42YYgNCHc1Z6pXnEmh2u
 PwaSyhB14A0TuTyIVk3b+auok2ZMMjJDR6+X67mjsyBHJKE=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr207641plr.168.1665066621678; Thu, 06
 Oct 2022 07:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-16-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:30:10 +0100
Message-ID: <CAFEAcA-UKa+-BycHqY0cLoz3p0vO9+kkuu=g3YTkNt4x+JZAjw@mail.gmail.com>
Subject: Re: [PATCH v3 15/42] target/arm: Remove env argument from
 combined_attrs_fwb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tSwAwE1n9o0y

On Sat, 1 Oct 2022 at 17:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This value is unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
