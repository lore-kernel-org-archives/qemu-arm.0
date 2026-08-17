Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD8FC5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:52:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvzcI-0003aI-EU; Mon, 17 Aug 2026 11:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzcC-0003La-LY
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:51:09 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzc9-0004Kl-DA
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:51:06 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66ca4bdccfaso1676797d50.3
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786981864; cv=none;
 d=google.com; s=arc-20260327;
 b=DR9Fm6T9/b0d7CSJg7wWtFQ0tpEyGqhudM7qViuXSZOj+qZ4aJ0zwsGt08xrsPf9tT
 NAFxa6kB8ybweaxpWtzqYQfo9jKumWYEWC2CQRvQiW1V8ox3wYDzmkHswEQtSQP8DgxW
 KZstqDK3UzbCOmsZgnqMrdTBzN/1+1yRuCFA1F3r2qndOvhECFJZXZAqCjyXhzF/1Fns
 v/FWNGrEm3Gg6bFsGBTl7VYMw77M9PcxR1l5Tui/YP+/GGKlYk2txcLZheogxWIjQzES
 2VTSfH4LTNr4DsnZSSWzk0eNqNYBfmLXUbRmRybAsyjpuovVM0hrLCEv61hwk2GKDNVx
 z+qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=vM5BNPuePd2kR65SJoqxnhvEPlvFj+pZbFCJNrLvjxs=;
 fh=Wvk+Jo6Ymse9oLqwYDdbbgy+ORPymqOC6fZPBj6RyJM=;
 b=nMK0/iJXDdh743bYJzr0+l3Efcb3ntQkdtyYjgPdp3w/7fBvlhvFsmKBB2ETgTZAPG
 JIzbK/WlZnoh+j8wwoL9iyJue3UjRFHPhBQoDOGHqkI23pp490LtQh1dEk/n78tOao2i
 3d+2Wi8a8Em/PSNcBZDjXz26u5Z9bmALnUspCRu01xbXVIE+RPgjDRNJxdRq1atiMjIt
 l+wBFgNwVsKNocnNtGPHn3k94twwu9957bYyn/sf50kDMi0hiu/BlxuiXaRfalWvgl/j
 XhcvlUslrbPqvpS+xNQw87tl5ocSP3oCJdxwILggw+Jt1N5Y9tvzWYTKouAP5WjNlUAy
 ezNw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786981864; x=1787586664; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=vM5BNPuePd2kR65SJoqxnhvEPlvFj+pZbFCJNrLvjxs=;
 b=DIZ2xFKanMs4MRxkZIwCTFDbBlep5Ax6mJFiCDYBA79Uakbb5Vl8ioAfxtWt4tHxQy
 PYAi+LBsCJSHuHblP8+C8gvgQ2FPWLsz5GCVD3OERaod0Vb1wHZzD1DnYw1QTEgz18XD
 FFRIayfVqd/sg3kf9Jkk5B/6YQPGfAxtpgJO63YX3vEbFJQ+85ffpYgY6tvnVM2JkLW0
 9lQ26W8cvq59WaAYELAYVEexUzNA4T2zvZUbLVQjrnq3VAvw6b7xh+3F5KjGRlfWM9Ep
 9K7fEPMZ1dx8zcL9byv3DeKZ7Kvxt2Hcx+a3yaku5+BiuNZoLdO83XuerhvT/xxTjPkD
 5PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786981864; x=1787586664;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=vM5BNPuePd2kR65SJoqxnhvEPlvFj+pZbFCJNrLvjxs=;
 b=eNzIvy5nb4jhEIeSd369p+j+DoSAnpWtIHVdHtDTLWz1NKjF4X1UvFWancHvT/4ONW
 bxHc5NIBpVfjmd7Ag1xRxOiyy48qIwzuBJKsgvofn5BNjLq5MtJOr6z0wo4KVZhzFMVM
 ce7m7bE0/L6Oif5ebt01VbuUMIMiflpcIjSF9JbtQzjmLCuqmDAfHx/VakYSw0L3ybw3
 TtJhTxSNghR1hAEraQ3lHaUrukOZLAQJdtmqiAHGLrgpibnGucEanwtwki6Nq0BivCV2
 qxbmQslwNSbPtiT4ZAYfEQE4b6G20wk3wEajltzq8Hf/He5y7NMoKbDBDEjzSO2jJMia
 MC/w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr8zZZeHs9ToPkNAQtDyZWdDFed8/m37dyJnLR2n9J4KMh3JWu2JpE53Ad4aNHcxPAO8nTBAICSRA==@nongnu.org
X-Gm-Message-State: AOJu0YwduxNxrh9ASpfhL7v/ht6iiHYr/o/IogXlF2HnlQFnNWVYFwSZ
 l6IRBZDYtiwg/yoHhc+TE3oJZahs67y3t865JWXeRhSZmd2JYMEbAWuiCVDWhHecmPJo3CA1O/m
 myVyAuC9QtsuiyjaiGBeikhNRymj6inOsXcDEQBsa/A0unbuzFyI7
X-Gm-Gg: AR+sD112VBlAA+QKUxWodtH/a/6vR9acr3KuMUACVG2dar+pP7A0lYMC9byhHvpH16t
 URUWnZkQQYrGFxfRrJfDVq9pFmfOJ2S7Cg19NM298aa/4uCADauGMIq6qLZRIpeNIEAlJhMibW0
 /GTNToCp/ENRI0SUD4epMZpUgS3S3QW09/WStvOKlzyU5xyKh6OaxfbrBNJpjMOpmQuA6+BHJY5
 F+ZL2Jl8sOuWR1VihxaXmiG2Lz5jvSrxT96IhlAPIbu+rzRIZS1yBCPZ8Jl9a1V9jt67KsuYEuT
 3+Eg6sSWQ8JkjhAhMwKMHgq1JAgioB/LQIsQO5L4ZbQ3taBVr0dvygwCcVTKJURAbm+KZDzKYz6
 qHlvP6kcSAXPM9yIqlpnxvbKk3Ius
X-Received: by 2002:a05:690e:12c9:b0:66b:26cf:6e35 with SMTP id
 956f58d0204a3-66c72c7b4bcmr11014684d50.30.1786981863905; Mon, 17 Aug 2026
 08:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260805153005.9989-1-simonxhy0404@gmail.com>
 <20260805153005.9989-9-simonxhy0404@gmail.com>
In-Reply-To: <20260805153005.9989-9-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:50:51 +0100
X-Gm-Features: AcwNN1UBdjNCKN9qGaOYl5lGsSeiqGNYuKZMgH7BbOV7xcFHq0y2CUSDd7xoQsc
Message-ID: <CAFEAcA_fMJA4m_HYoTh70=t2XhsdSOn_g+X2=1LVgXXxa7GqqA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] hw/arm/mps2-tz.c add Arm mps3-an555 board
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 5 Aug 2026 at 16:30, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add mps3-an555 board modeled after the existing mps3-an547 board.
> Add UnimplementedDeivceState for timing adapters and qspi controllers
> in MPS2TZMachineState.
>
> Changes in AN555:
> Timing adapters in APB PPC EX0 instead of MPC.
> Additional QSPI controllers in AHB PPC EX0.
> Additional AHB PPC EX1 with DMA.
> Create standalone unimplemented devices for MPC instead of timing adapters.
>
> Include documentation for SSE-310 and mps3-an555.
>
> Arm mps3-an555 TRM: https://developer.arm.com/documentation/107642/latest/
>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---
> v1 -> v2
>         Move board and application note documentation locations
>         Revert MPS2TZ_NUMIRQ_MAX to 96 from 100
>         Fix timing adapter and MPC creation location
>         Add QSPI controller to AHB PPC EX0
>         Add GPIOALT2 register to FPGAIO block in next patch
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

