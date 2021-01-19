Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3237116lfq;
        Tue, 19 Jan 2021 03:28:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQKD15P42PLuYnHUy2ewHfXazQeLVuFKN3wM7SR70UDmfGMttBhu/YK904bQ731iGgxAeD
X-Received: by 2002:a25:bbc3:: with SMTP id c3mr5145434ybk.345.1611055713425;
        Tue, 19 Jan 2021 03:28:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611055713; cv=none;
        d=google.com; s=arc-20160816;
        b=tb1D82hjeU4eRHW2ttDsTdY6eo5DuZnjUoHIzxvWGyZjtbRd+EBQuZ0qocKgVNWuvN
         20FyS9op5F61CRPX9ApqU6955BpNNCCpAluMIZGryVX9bbqEnniiyiVzk/8hTZlehNVi
         9E3ftsnIv1C+Ce2/ykrYtmCE8gmLuyfKggl6hjrob1Gmwbox+U7Sq8AskrrOl8JkIwxv
         UCFJvHnvJjJfNtTNMIG0SaBf2I/eitInZBh6HnZ+vlCbOuAxtKZKu0XUzB7yI0akcMLo
         r0gHdvXWS8h6iOykwEkc2e03ut4D7ZgxanPpq4dYSNPEvv5NzZUBL9/jFmsbQ72B0/+S
         cHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K+TcLFw/uO2ce2majfh9q8JMObqRCpJz3IWRacF/D5U=;
        b=qnLxyktEGp1lao3/IQgjKJUTrK3wM7Kn/BbcfjJ5KGmZpSUJpkq4iz3HyesLEDqIFS
         ld0v+LF4UvoCKdHzjzYFgaCNm+vJY7OMU0nDkGldyo3agaxhF7gpG6lTJaJCK02wKeZn
         kO+lZqnnTDNPNHEX5qDp/XR78JEn3bDde7vWqtxua31MhI3PZc1e3eYz0ImvbWMzIpJ9
         kMhnXPYsyAHkLhHQhDCYKj8HbA0W8s8FC9JtnsNUeJktzrqVRm24qBkQDMhbrBqc5tbd
         Bsn5nZCWQgfoKfOD2DJYg2r/FtOXauFllc1vb8evah0h8wkX5uOtEvOGmvoPejuKqxeF
         E4oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yO0jdxiz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21si19971367ybg.275.2021.01.19.03.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 03:28:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yO0jdxiz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1pBY-000349-Rh
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 06:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1pBN-000338-8C
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 06:28:24 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1pBL-0007WX-3S
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 06:28:21 -0500
Received: by mail-ej1-x632.google.com with SMTP id ke15so20303275ejc.12
 for <qemu-arm@nongnu.org>; Tue, 19 Jan 2021 03:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K+TcLFw/uO2ce2majfh9q8JMObqRCpJz3IWRacF/D5U=;
 b=yO0jdxizQ2aa++R1xr+g1v+MuyQ9l2ojTkZsgOJ/ja/AgOltglH9qI83IcpUocqa+C
 MAnuWzNqbbKjqjROcmhkVM6tqeMh/AKm/I3sDDEhxYz1OEwjO3mBDuxBGRf7GlZkG9Nb
 fIym6HsRbiYTcFWhluAUSC35c+2kOvZV5eYsvcbpcpPWG7a5Aq6RkxMV2L3sV/SmW8zY
 qDIoblZjnTIZtb+NDCx41+Pw3/Ty4XAxxY90IBn2jGDNNZChhb0XP3cW1OHGnIjM7a29
 bKwXNVNJTCZ3XHhIz02KP/d6Vp4IzfaFCPmGJmLdu08lhaEcr2mKxcwdkE2GX7Lj8ACr
 SGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+TcLFw/uO2ce2majfh9q8JMObqRCpJz3IWRacF/D5U=;
 b=Prp9rReifNBrOx8soccJOaltJjipNjxdPF+hxL5jD3FOqisP7zvh18/nogIrKM8yrZ
 9OSXPlHRYve2FMwZDqdnGEzEQ6rblR5q6MApDhlO86nloYxX0gKC0TAX1yqxza27I9/7
 VZjPZqVElbqo084R6QGOrAzZuEjKVaLoh5Axj6pGi3HRtlAoImXJkphXgvOVr3OQnHbK
 OcrtP02i1p8i8VqlyEAnPws2j2/987bgWslSYF2aFvpC2viAtStE7xXAA6yP+T2im0FU
 OoXI7YF5270LaIMgqLfG1LJNax6Dqme39aR2OddJQL74aaFkjnHF1sYp8BRl6JTZR2zQ
 yLXQ==
X-Gm-Message-State: AOAM530Bd6DW2EWIrLaXmPh1bVUy6jWlr57N4KypDipnlTQAa5CtDsP+
 1IQ7AkmrBDJ2pwo3ABBFTrblE1bLKjAsBi1bMWxtgA==
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr2641017ejv.4.1611055697533; 
 Tue, 19 Jan 2021 03:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20210113062650.593824-1-richard.henderson@linaro.org>
In-Reply-To: <20210113062650.593824-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 11:28:06 +0000
Message-ID: <CAFEAcA-t6FDkR3FMoRUaQYQHwmo2-hLE12tOYvBd0hknTpshzg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] target/arm: Fix sve pred_desc decoding
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: EGr7WVoQGiyx

On Wed, 13 Jan 2021 at 06:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There was an inconsistency between encoding, which uses
> SIMD_DATA_SHIFT, and decoding which used SIMD_OPRSZ_BITS.
> This happened to be ok, until e2e7168a214, which reduced
> the size of SIMD_OPRSZ_BITS, which lead to truncating all
> predicate vector lengths.
>
> Changes in v2:
>   * Introduce and use PREDDESC field definitions, rather
>     than abusing a different SIMD_* macro.
>
>
> r~
>
>
> Richard Henderson (4):
>   target/arm: Introduce PREDDESC field definitions
>   target/arm: Update PFIRST, PNEXT for pred_desc
>   target/arm: Update ZIP, UZP, TRN for pred_desc
>   target/arm: Update REV, PUNPK for pred_desc

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next.

thanks
-- PMM
