Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1919514ejh;
        Tue, 9 Apr 2024 06:53:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZdXqHAvNGyatqNVwbAwDFG9WUArmVGikdV2iQ6Lyo3YzL5QLieLpMh7a6lax7GNbCFIaJ+Gon4xdrxUILl2TTRUdILzRj
X-Google-Smtp-Source: AGHT+IETbHU2caTXXHhiCRYEZ4P1USvCKcHWltqEl2cw66RDAVL2yvhf/Ny6fpddFhQ0SBWdBEXB
X-Received: by 2002:a25:f450:0:b0:dc7:4776:e31 with SMTP id p16-20020a25f450000000b00dc747760e31mr9669904ybe.24.1712670807361;
        Tue, 09 Apr 2024 06:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712670807; cv=none;
        d=google.com; s=arc-20160816;
        b=sxnylHW0kad6P9z5f51ok+q5bDmTlVEvlD1HdItgdgqV6auwhArXsg/9uFsZeW9eFr
         IO1ZnHRNYK8m1TtKDy9ilpfR0SA9PPCUpvXyVY2EJlCRVMBOzhzOa18GGIvTCP0D92QV
         MxIeTDhr45LO+KhutBpCs71rC5DG0yvkFbDNnogqz/Yzr7oAq2MWu0bcK3spb1/BXtZ1
         ApJMUtUl9LwxIwQAVngTF5v1RJ0odDxOMJX0nOKM4Bp6bhKhk9D2FnAzjmjk41owTBna
         T9aYg6hWTwSmX38Ou0FgS7UK96pTv66pXHesVXNr++h+2YvNmgQpSAhAWxhuMa3CYsu/
         qspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KAv/jBboVXVGqv1Qr5gynsYiRrvU4aNmMVGB5m6bYL0=;
        fh=BaFVKpKvJyo9elEYT3B/lYzUOP9x4UPpS2C+fyeEda8=;
        b=ZF0Q6cNR7dvOqZ0JeRfSmN5TJ05o+LDXqf4T8eQ9DAAbT0d4LcPDlh8M8l2BZuk+TX
         X/0eGg81TMKXz9y/3mWwPjlUltr0krwMgjS3LJHVlZCyAb4SJxCad6TxzDZzuaUT+d0V
         IdaP/rYC5dfcN2+F8hPNrOcOMpG2i09fTiIVcau2ahe7emNiMFWpqfgSlZVzLtyZCPud
         AvhBrbv2+1pdGvOPiFTyO1rjR5rKXSYX9d9eiDKzv1sKNyY9rMrFkYUqmMo9ZFGE/Qoy
         WE2Mpy7ib7ImikLyw4ppL5uxWXH8ELP5zXs8yaw52Xd0h45Jf7VsBwKElQg3/zReuAWH
         jH+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fUHQ3IA2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020a05622a189300b00432b5a93fe1si10410621qtc.231.2024.04.09.06.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 06:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fUHQ3IA2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruBuV-0003Th-6Q; Tue, 09 Apr 2024 09:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruBuI-0003Qd-7e
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:53:05 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruBuF-0003Df-SW
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:53:01 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso3369157a12.2
 for <qemu-arm@nongnu.org>; Tue, 09 Apr 2024 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712670778; x=1713275578; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAv/jBboVXVGqv1Qr5gynsYiRrvU4aNmMVGB5m6bYL0=;
 b=fUHQ3IA2Ey4Ln4aKZ+uQojVIz3bQSIiZHRDS9GPJkSTGxdHweMLInRaA1kyH3px7Vz
 +G8KXcKuyr3dmXeRrABE7fj0zWwmUF1wvXHDKJtjMzrWEakI/QmjSCjZ1YDPPpM+vNeV
 dx4dr2VH/feIZ0baBwzfS+1pqtZ0QGAcasQH+SCvS9BWdFUUcWHORbmQM/j0H3W5WR1J
 YA0GoIL7qRmeY1GSj5QpwCyzhGXFCjrSzhqbZx2JlhS+d23c70UXd5lfkfADRWcKmDEl
 Dg/9DegfOe/guAS6bG8VfLXP/4WJIe007/w8CC3PZuhfSJ7iivM2l03nXOFCChviJ86u
 Rn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712670778; x=1713275578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KAv/jBboVXVGqv1Qr5gynsYiRrvU4aNmMVGB5m6bYL0=;
 b=WDmPWNx/kwyALkeRYFTPITozpACk3lclgrKb1Q5p6bP6H55bzSU9tuB5eRkij7b4hW
 AE2nv2iEfInHpMvz2aMwnqEEumoEqQfnaPci/ywbT7DxvR60e0zhjlRXpc/PwMDO1qaN
 bYYI4NJELAMq4X/Rwcb7/NlSowUAighwr3OhxuDy7fClz4EgGSDRRO/c4F0t8H8A5s/K
 hTJK16calWn2iH/WLal5lQwpAvmWKd3iWx+/0ApxZghScYYo+CRJkb+cY3o5XwlyD/Lr
 zdCsBWqZqBcCpuHA1qJAUmPccT4Z7hpTsiX7U9h75p3zJvQCsD5MiXvJ/xw/fzmC6z2/
 bRUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXmqLbQspd4+ySnvofDRawkha8nCyj3AH1FuRC4U62fMevLc6S53B6CKs6ENBkesp20o05xYwwLd1VPb7Swu7f+VBt
X-Gm-Message-State: AOJu0YzjHxF+G1zPyasBKrpW5mq1PgKV2aiOA/X0HVWNy1FjmyuEkPvD
 3tQKy/Jkq8yOvDntbSckFyNdWRwMostEXhn0WLzX68jgNXHWBfa7sYz9UlhU91ZpK9SjVM0meuF
 cp7TCKwcyd1JgK6jqC2we4wbA/mjjN4DNyZd74w==
X-Received: by 2002:a50:8a81:0:b0:56d:fca8:d209 with SMTP id
 j1-20020a508a81000000b0056dfca8d209mr8784536edj.10.1712670778057; Tue, 09 Apr
 2024 06:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240409133801.23503-1-philmd@linaro.org>
 <20240409133801.23503-6-philmd@linaro.org>
In-Reply-To: <20240409133801.23503-6-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Apr 2024 14:52:47 +0100
Message-ID: <CAFEAcA8BWKHzLnkRDx313WA+pkX7+cV36retiVdBGmH_ZfONxQ@mail.gmail.com>
Subject: Re: [PATCH-for-9.1 v2 05/11] hw/net/lan9118: Add definitions for FIFO
 allocated sizes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Chuhong Yuan <hslester96@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ad3ldrG04slB

On Tue, 9 Apr 2024 at 14:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Add definitions for the TX_FIF_SZ=3D5 case, per TABLE 5-3
> "VALID TX/RX FIFO ALLOCATIONS".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/net/lan9118.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index a6a869de32..00409927fe 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -158,6 +158,17 @@ do { printf("lan9118: " fmt , ## __VA_ARGS__); } whi=
le (0)
>   */
>  #define MIL_TXFIFO_SIZE         2048
>
> +/*
> + * TX and RX FIFO space is configurable through the TX FIFO Size (TX_FIF=
_SZ)
> + * field in the hardware configuration (CSR HW_CFG) register. These are =
the
> + * default configuration settings for TX_FIF_SZ =3D 5
> + * (see TABLE 5-3: VALID TX/RX FIFO ALLOCATIONS).
> + */
> +#define TX_DATA_FIFO_BYTES      4608    /* 1152 words */
> +#define TX_STATUS_FIFO_BYTES    512     /* 128 words */
> +#define RX_DATA_FIFO_BYTES      10560   /* 2640 words */
> +#define RX_STATUS_FIFO_BYTES    704     /* 176 words */

We could make these do the actual calculations, rather
than hardcoding the results:

#define TX_STATUS_FIFO_BYTES 512
#define TX_TOTAL_FIFO_BYTES(TX_FIF_SZ) (1024 * (TX_FIF_SZ))
#define RX_TOTAL_FIFO_BYTES(TX_FIF_SZ) (16384 - TX_TOTAL_FIFO_BYTES(TX_FIF_=
SZ))
#define TX_DATA_FIFO_BYTES(TX_FIF_SZ) (TX_TOTAL_FIFO_BYTES(TX_FIF_SZ)
- TX_STATUS_FIFO_BYTES)
#define RX_STATUS_FIFO_BYTES (RX_TOTAL_FIFO_BYTES(TX_FIF_SZ) >> 4)
#define RX_DATA_FIFO_BYTES(TX_FIF_SZ) \
    (RX_TOTAL_FIFO_BYTES(TX_FIF_SZ) - RX_STATUS_FIFO_BYTES(TX_FIF_SZ))

thanks
-- PMM
