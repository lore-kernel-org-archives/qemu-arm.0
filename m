Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1892920ejb;
        Tue, 23 May 2023 06:52:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Rov7ZyLU2OpaHOt49fgi9daCY9kFh8cLsVCLFqaQ8Fh1eVz7UdGb1eZzKeLgDJYluJsBm
X-Received: by 2002:ae9:ed8a:0:b0:75b:23a1:461 with SMTP id c132-20020ae9ed8a000000b0075b23a10461mr4164065qkg.39.1684849960572;
        Tue, 23 May 2023 06:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684849960; cv=none;
        d=google.com; s=arc-20160816;
        b=nwF4b0sCljm8UaP0swbMV84C8x4eP9x1Sk2JjZwx5We8+/prjuxb3WbierIEVZy1CI
         ZzRI2xTF6GOoWQB1YECnZrmX2el0235wPoua4ubjvJiq4qS4+o3vw3JWcvZ1OuFYEYEs
         7/zlvLFIgxeF+0d0tpZJMSP+O5AQEeW+ye7mlZM0Aypyq2ByAYr6Oe/+ATqfQ2vk1V2y
         /7pl0LmEnvSeZmIVFANfBve+l1+aXA43QHtshu3+C5y/o41RS6nX9K/h4cBY5IktLVRR
         2Ykik23lpqOZHNNaGIqFyXi/yXotduLrY7gQdssgFThHe6w2GNGuzMzsorPjzEjZ4ppd
         11hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BfscCTbdmN2yfoE2s7O+uig1XfvqHdnwKPHBDoX4nZs=;
        b=d5wJJWnZ+gbaXb1fi9LXIQ5PzcnKitElHxAfAxUsr01kx6mROh10EPqb81sneWcqW+
         gqpCSDTtzK2u6xpNz9fFxvu+/JpJvBA2T1/FZQyWnT1CvAhkYhFEXRctQkx2JlhYLT4f
         V/hAX2KBBr9K+i4DJ5m7XBeizMlzHtfcjsvT35GIssb3r21YA64OOC8atxvZXynEc4fZ
         eSgPINt3BTs3CFDO+4A4MTS0C+up5yvG9vfU7nh1pbqqGW2mPyEKzZCIB5BJDDMmbXG+
         RIOCzAscbVq+qe0L8AYdiaG4fCYNgs0WVRo4ZTAmwW/oDM/1wzIRhmZsdbvA2KHBZIBv
         umFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z8TU5XPn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020a05620a15e500b00746aeb58f76si4744420qkm.78.2023.05.23.06.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 06:52:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z8TU5XPn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1SQR-0004qp-8p; Tue, 23 May 2023 09:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q1SQK-0004Mf-W7
 for qemu-arm@nongnu.org; Tue, 23 May 2023 09:51:37 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q1SQF-0002GP-1f
 for qemu-arm@nongnu.org; Tue, 23 May 2023 09:51:36 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51190fd46c3so1448893a12.1
 for <qemu-arm@nongnu.org>; Tue, 23 May 2023 06:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684849889; x=1687441889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfscCTbdmN2yfoE2s7O+uig1XfvqHdnwKPHBDoX4nZs=;
 b=z8TU5XPn/tB0G7xiqmt9iuWv4rvZ89q6e2NHEpTdDQSzK/Ku3xtpM5eTgB84pJTkyg
 33m+mTGvsIys6sYd8ruK2XIQTeXvq00+lwc8D+8hbWv0WD2A1JwUrFDhhV3GV2KFPKig
 KY9DivDZ25ubpynrbBQ/WqUKID2RE18ws1strLYLoJVnfOyfqomQx05apl0qgF4Lvm0D
 1PcMuIsNl/5qzekoP1jJPp2eubzeLTcOEpK+ojo4Hj3uD3l/NqEyD+WUfgWBTvmTXIxS
 k/1r9XCoss+tWGl/9lJ9M42hRwZ3j3/kF1WVuFEMgVu9ZCtmc5V98ufmRjlYFwt0AslY
 CP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684849889; x=1687441889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BfscCTbdmN2yfoE2s7O+uig1XfvqHdnwKPHBDoX4nZs=;
 b=Kocv22kWH7XVbcBzveHhKjsmM9vYqAP/6P3IcoVBsgXXeH38q9eM3e78zUZqosjVBA
 2sEHonG8StFuH0JtOe9u1HY8NKLLXBXRn52FW3PX+/cBHysJMMIR6t7qZ9G9GKmvBaTi
 1dSKWA57JDCDOUFbhbS4KoBgjpQfpvaLEFAP5bzy0Z1j8jkGI553r6vJSxf4LodTZqbo
 19lkLFJ/pe/vkFOtJsHuRbDoRGYFDz2/LRvtIcRry+gdQZuWoR8vpUWZTkuluMq21YEf
 a7CYV4XADzErMjGPzEleIArzNzZSO32QqDfxcXKrN5k2lPnZaVFUH8PbTawqi9uqVdyv
 RL4A==
X-Gm-Message-State: AC+VfDzZ3DRq9RI++GVNUGSdk/JmlXQXIVclJ/pY/QURBPooEhSPPRRa
 i8sz2mf3/L+sGxHJLwEWBynyXY/XN6wJEVFzk6eVDg==
X-Received: by 2002:aa7:c90d:0:b0:510:da8d:2cf1 with SMTP id
 b13-20020aa7c90d000000b00510da8d2cf1mr9940963edt.18.1684849889462; Tue, 23
 May 2023 06:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230519062137.1251741-1-tommy.wu@sifive.com>
In-Reply-To: <20230519062137.1251741-1-tommy.wu@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 May 2023 14:51:18 +0100
Message-ID: <CAFEAcA_4dW6eakYv9O2hxd-pSF_BOkEd7GjCjV6UZwhdESLOxg@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/xilinx_axidma: Check DMASR.HALTED to prevent
 infinite loop.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: NHj/N/hEHdbF

On Fri, 19 May 2023 at 07:21, Tommy Wu <tommy.wu@sifive.com> wrote:
>
> When we receive a packet from the xilinx_axienet and then try to s2mem
> through the xilinx_axidma, if the descriptor ring buffer is full in the
> xilinx axidma driver, we=E2=80=99ll assert the DMASR.HALTED in the
> function : stream_process_s2mem and return 0. In the end, we=E2=80=99ll b=
e stuck in
> an infinite loop in axienet_eth_rx_notify.
>
> This patch checks the DMASR.HALTED state when we try to push data
> from xilinx axi-enet to xilinx axi-dma. When the DMASR.HALTED is asserted=
,
> we will not keep pushing the data and then prevent the infinte loop.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>



Applied to target-arm.next, thanks.

-- PMM
