Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp293249ejf;
        Mon, 15 Jan 2024 06:58:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj8MvpVxYJjbECzg4fqvK4w7Wyx46twlf/XT3XuS5WEJ+/84iemgf3K7z/McEBu43TudcI
X-Received: by 2002:a81:9a8a:0:b0:5e8:14a6:5608 with SMTP id r132-20020a819a8a000000b005e814a65608mr3824031ywg.95.1705330726778;
        Mon, 15 Jan 2024 06:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705330726; cv=none;
        d=google.com; s=arc-20160816;
        b=dt0eI8OsdFy2ma4gWnuVhdXB41yAklctlwYn0bIVex0cw4G3PG3Dj9+uUSXKOof8G4
         onm3ol2jIBuWPWpTi8cW5hlALfVHXbYbJksvvK2Yn0XNBh40L9/lJE7yDjq9GHHD2u1D
         MU/cgjUVXu5Tbc6meayr9bQ0VjswXme6yecpH6nBLX88KVMy+trmmpu8WUn5ZftMdIkB
         /sO9XutFkOBNC3Ve6iNYChN2jDop8Ddk81pQDWx3QjPQwKdJvwu7K6AVJDufUzPlyBW9
         tM17sWKrvnSwMoKFY2H0XuwhNZ9FlM1PDDpi0pbMhzCwEDrXJIaw+KaaqpkmPDbTF6YU
         7QlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hROscwwMm0aNciaHc/wxiXeZ+5kQK+edq78Gjj+wHtU=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=Hu/DKEfHu4785a29zd6KcjvmuhEROCc3fRVpM+gNAPgBavJo+Lz2P/Zg+A9q7s43/a
         YbL1THErKpusOzZIV9MH1DaGe47BZsR1NeLhXCSeQnAEqsRh2VJ/gao47ZsCJmWKJOo1
         MCGH8xzMhM3MhOpYsYIWL3/grQJS9mc6l5KQh05ddFuXoGcSo84/Ag4u0N/uP0bC3QPu
         9AOFgzRLr5zJibb+maRBzD1fPkDTLMznaaCQTVWPjoJ5df0F/OX+iEzz1WQLWKf7gX/R
         IRGqtYY2b3OlvQyieUcGwyo/77CzNftaGE6GAUgpN4C7Ib9m5rZ9rofJA8XJf3ZDBRMa
         VT6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fdQrU04T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8-20020a0cda08000000b00680640b9976si8020128qvj.549.2024.01.15.06.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 06:58:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fdQrU04T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPOQ7-0004Dk-UA; Mon, 15 Jan 2024 09:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOQ6-0004DI-2d
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:58:34 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOQ4-0007Rz-Gp
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:58:33 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-557dcb0f870so8155052a12.2
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 06:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705330711; x=1705935511; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hROscwwMm0aNciaHc/wxiXeZ+5kQK+edq78Gjj+wHtU=;
 b=fdQrU04Te6gQjBtw9ODtryhdTjHTFdisIExRw/fp0dH8hJhzIRHOcS16OEEEkAlqwd
 7ZXSKzviZV0j7LjGyhkGe0Bi3TBDdZ2P9R1t7sEkRX1o/6VPCXz8DepsylmjNvRsDvfg
 PK33sY5BVZHHtxdDiDCvWJxB6gl6GbO6zacc6zRncsUh/rCPSaR5kzovoaCN8F3wwWV9
 GRUx6E4zHao2h1CcGeki8d0Vydmybw+Cdscfdn+nR0J2i/v0lokUs94DgLgZ1WF9/E2R
 JYMb1RZRymbGPFK3MDbKD0BFd9ensQhgVonNgRHSCGqHrbiwSxhWMdgMYGMHo4fEaOOR
 hsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705330711; x=1705935511;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hROscwwMm0aNciaHc/wxiXeZ+5kQK+edq78Gjj+wHtU=;
 b=o+Mtguc59y+ZzOnFAXgbUU0QPTvsAcSCHK7DVbitKk5GdSB3SKqOBtI/n0Cs1dIIOa
 stTSjpxf8OwIidZbFK9c0pXl4Awe5w+ePx1zferrgPC31fXAGt2nuefmwqe94UkinJZG
 ijxY6Vy2yXCtk8gyNln3rjvuUl28eo7Fek340FfRoZCaOGIpV0EsqxyJD3oAzeNJIe/z
 8+wOc9pHKbLbBA7Q6Bg/91q2JYq12njWoINUyy2fEUDGtkApNFV9iwtE5INoKdBWVvRk
 yAftlQTSSjlvPSTwid14P3EpLe86BdkMOn/rci2+Xy6w9Asb5Jf0fOivVm5wIuLBNfgx
 rBzw==
X-Gm-Message-State: AOJu0YxQIzkb7N6hq27Xjj0JGa3QPcqn/RqfPqBdAeLyhFIMSx69Qv5Q
 ubhzPKEPzcIF+g1yC0ykf6N3aLfIffp9c0Sb7cb1VzomNxlNUQ==
X-Received: by 2002:a05:6402:33cb:b0:551:14f0:f7ae with SMTP id
 a11-20020a05640233cb00b0055114f0f7aemr2650559edc.25.1705330710914; Mon, 15
 Jan 2024 06:58:30 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-38-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-38-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 14:58:19 +0000
Message-ID: <CAFEAcA_UqjoP2e8q+0QenKdzRPd93Sn1hg4H+a_senvJ4r+y5A@mail.gmail.com>
Subject: Re: [PATCH v4 37/45] Add mailbox tests tags. Part 1
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DcWQQpNeiEyv

On Fri, 8 Dec 2023 at 02:38, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mailbox.h | 195 +++++++++++++++++++++++++++++++++-
>  1 file changed, 190 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
> index 8acc4bd2ff..04472fe23d 100644
> --- a/tests/qtest/bcm2838-mailbox.h
> +++ b/tests/qtest/bcm2838-mailbox.h
> @@ -147,13 +147,21 @@
>  /* Used to test stubs that don't perform actual work */
>  #define DUMMY_VALUE 0x12345678
>
> -REG32(MBOX_WRITE_REG, 0)
> +REG32(MBOX_WRITE_REG,          0)
>  FIELD(MBOX_WRITE_REG, CHANNEL, 0, 4)
> -FIELD(MBOX_WRITE_REG, DATA, 4, 28)
> +FIELD(MBOX_WRITE_REG, DATA,    4, 28)

I don't strongly care whether you like to line up the
macro argument fields or not, but please pick something
and stick to it, rather than doing it one way to start
and then making whitespace changes in a later patch.

> -REG32(MBOX_SIZE_STAT, 0)
> -FIELD(MBOX_WRITE_REG, SIZE, 0, 30)
> -FIELD(MBOX_WRITE_REG, SUCCESS, 30, 1)
> +REG32(MBOX_SIZE_STAT,          0)
> +FIELD(MBOX_SIZE_STAT, SIZE,    0, 30)
> +FIELD(MBOX_SIZE_STAT, SUCCESS, 30, 1)
> +
> +REG32(SET_DEVICE_POWER_STATE_CMD,        0)
> +FIELD(SET_DEVICE_POWER_STATE_CMD, EN,    0, 1)
> +FIELD(SET_DEVICE_POWER_STATE_CMD, WAIT,  1, 1)
> +
> +REG32(GET_CLOCK_STATE_CMD,        0)
> +FIELD(GET_CLOCK_STATE_CMD, EN,    0, 1)
> +FIELD(GET_CLOCK_STATE_CMD, NPRES, 1, 1)
>
>  typedef struct {

thanks
-- PMM
