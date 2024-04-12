Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp460604ejv;
        Fri, 12 Apr 2024 03:07:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVk0/NH/bkp592iwIbwOE3WxhNyQmwMdxo4t62SK+jUjy2hhxDgvPSl9Q1kCDoc6nBvY7siuTeg2ngVXjyPT1doybZ1nbcA
X-Google-Smtp-Source: AGHT+IE3TXQdfXhEsBhISLPzWOiFaSTKVuwVTEhCkWDrWothnbvTQ6PKukVAF14T9B7u+XJPK0pS
X-Received: by 2002:a05:622a:148:b0:436:5951:4b41 with SMTP id v8-20020a05622a014800b0043659514b41mr2141386qtw.67.1712916440450;
        Fri, 12 Apr 2024 03:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712916440; cv=none;
        d=google.com; s=arc-20160816;
        b=BgoJBZ07WPbrzoEOTQ1FkM/e8p+Q47wpAbrZMictXJo7E28b5ZAEPy9YlURJxBeySC
         2OjvQ4gehun6pzDahiwGjTIVTd4ft413y8GnBEAANTovFIt+S1Op8D4IBbU5tv/Jld0e
         8lePDukq6jvIQrWgITXtPahd/Qm3ml0zPPxemaLw6Un5moYFj2TGtk23DOzf3DoDgXPe
         1lzIF2jida5ojVExdkYOgU6aP5W7H2VGbxdyvbtQwn232yRb8pqL/kaXLdUhDA3DiouU
         OZEtskwF6HxFfuIJAOKzIbo3gkCnhhpQttkn+bqZOO6jfrtC5uGGb2atJlkBENMiWCoW
         QHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CRq1VK8S0LEFDcUOe52ENFNImtSvO7NrWm3Uw1gqR4Q=;
        fh=AUmFAdCgz8ADBusZDK23/9maqE0d39jfFIvPgWWBnHk=;
        b=aV11YmqikagBjRRLRDu2YKw+Cb5irxy/pYAy6/WidB0AlzO9/eO6ptuIdy2SSxpMUp
         MiRIk3ijbnmZL/ioqQZJTs5tOuhkEkiFHER0v4pIJl5a5RENdVVP8BVOYwEu7ZzMAExR
         4z1SfhkYRttZr49AxZaaILdg1SKv1Zk/w0RnAk7TWiMk5JwsxT4Q8ZSEqdz1SsNhd6qk
         aPWwDQF/BrOcJbXnpyGDVYiOMbdZavS3WVOCX6JHZkSGIqW7Ea5kE0H8531iAODSpmim
         hM12IGCfw39yN9ov7t2WZvuBNJgjDKQtQinwHmyKAsgkhGiDP/gdMrolD3i3PUA2m0dT
         n0jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="in/FYg+N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020ac857c8000000b004366a236d1fsi2811889qta.457.2024.04.12.03.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Apr 2024 03:07:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="in/FYg+N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rvDoQ-0000R9-BJ; Fri, 12 Apr 2024 06:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rvDoO-0000Ox-2G
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 06:07:12 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rvDoL-00027s-1z
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 06:07:11 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e477db7fbso1035647a12.3
 for <qemu-arm@nongnu.org>; Fri, 12 Apr 2024 03:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712916425; x=1713521225; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CRq1VK8S0LEFDcUOe52ENFNImtSvO7NrWm3Uw1gqR4Q=;
 b=in/FYg+NCQRDFLJogW5NSSF/Ti9i8u/NQI7x8pPwPmwj/Ci4lsYCpVIOGogK8DpEkf
 qMf8LFcy/qqMnJJ2eDRb2Tauaz65hPVdFnxa1KhdHZtbkxH8rKuXN+UZM9PcgTxbgWZT
 lGLDVOMrjSYclfNjLXuA7BTH6GvvuUOGIZi54EEONcEH5oXTx3+b73J5BTtS6/rxwafQ
 VR9ptlYQkjv01wYEguTJz59pj4QJpfXeqtgFI+4hQGodkYNLd9J+ARF88uOTA7/z49Gp
 g/tMQmaRhU/+218whA+h0cxWI99WDQzRt4YAYeRpndtk9FQ1HoCK7gmQrDVzEOgzAH46
 4v7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712916425; x=1713521225;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CRq1VK8S0LEFDcUOe52ENFNImtSvO7NrWm3Uw1gqR4Q=;
 b=DfkMqboSTA9syBcbbNJHNotrnMMnZWd/D5IDE6+V1kckoMGyU4DIUy0+/1DNl/nofe
 AN9C+AnVkvYrnFbgsWY9JmYVnq+WrHF0Gp+8mlCUJPrAMFKAwgAN3dV1fEeyKPxJKVlE
 VMwWUlSGFvIwyiKyrTZL7OiGcJAV9uv93voCYonbt2xYSC19F4eIJgrcQw82coCGUXjE
 q5/+/olPD23V+4CBR6BDWkOi05weU/UIw8KgG4k2/QqzeS0MMeOKT/6VEe40nDif2j6S
 QXkJUmEPZRy6MdVRRz+JAdmKngQTJ1DG/zSHi//WPFwRq1NuiiWsnx9OB5qHrmj1vKhM
 lisg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWBqyno5fHlY2Ed4ixTe4ftOoeJMnLhQG8Um+9YfoeXLfUXNkAcSQLwU5sYvsJaFeWBVNKrNdW6K3gxJdT/KzE5nNA
X-Gm-Message-State: AOJu0Yx66VuaOdWtTdzayWRmOVblmfzevh+BdX4xB7AdzicN5IjqPvPI
 2ErVjoYNSoKnw7Nx3pkdSs9ZvQp+pmqPsgc8Jvy5tYWuNJrwHcHeLxcEtbhEHgkIcpE80dWUebG
 cM8J7Bj0xj2HHhBGKVkYbq2+hRdE9gLZHzQjPZw==
X-Received: by 2002:a50:9e84:0:b0:56d:f979:8d82 with SMTP id
 a4-20020a509e84000000b0056df9798d82mr1430825edf.25.1712916425565; Fri, 12 Apr
 2024 03:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240412081328.11183-1-adiupina@astralinux.ru>
In-Reply-To: <20240412081328.11183-1-adiupina@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Apr 2024 11:06:54 +0100
Message-ID: <CAFEAcA9wfzpc74iA_2G-YbtQtwGCA9VPQuXagg-Q0FwC92tg+w@mail.gmail.com>
Subject: Re: [PATCH RFC] prevent overflow in
 xlnx_dpdma_desc_get_source_address()
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: oCJB0ylEzYnG

On Fri, 12 Apr 2024 at 09:13, Alexandra Diupina <adiupina@astralinux.ru> wrote:
>
> Overflow can occur in a situation where desc->source_address
> has a maximum value (pow(2, 32) - 1), so add a cast to a
> larger type before the assignment.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d3c6369a96 ("introduce xlnx-dpdma")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
>  hw/dma/xlnx_dpdma.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
> index 1f5cd64ed1..224259225c 100644
> --- a/hw/dma/xlnx_dpdma.c
> +++ b/hw/dma/xlnx_dpdma.c
> @@ -175,24 +175,24 @@ static uint64_t xlnx_dpdma_desc_get_source_address(DPDMADescriptor *desc,
>
>      switch (frag) {
>      case 0:
> -        addr = desc->source_address
> -            + (extract32(desc->address_extension, 16, 12) << 20);
> +        addr = (uint64_t)(desc->source_address
> +            + (extract32(desc->address_extension, 16, 12) << 20));

Unless I'm confused, this cast doesn't help, because we
will have already done a 32-bit addition of desc->source_address
and the value from the address_extension part, so it doesn't
change the result.

If we want to do the addition at 64 bits then using extract64()
would be the simplest way to arrange for that.

However, I can't figure out what this code is trying to do and
make that line up with the data sheet; maybe this isn't the
right datasheet for this device?

https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/ADDR_EXT-Field

The datasheet suggests that we should take 32 bits of the address
from one field (here desc->source_address) and 16 bits of the
address from another (here desc->address_extension's high bits)
and combine them to make a 48 bit address. But this code is only
looking at 12 bits of the high 16 in address_extension, and it
doesn't shift them right enough to put them into bits [47:32]
of the final address.

Xilinx folks: what hardware is this modelling, and is it
really the right behaviour?

Also, this device looks like it has a host-endianness bug: the
DPDMADescriptor struct is read directly from guest memory in
dma_memory_read(), but the device never does anything to swap
the fields from guest memory order to host memory order. So
this is likely broken on big-endian hosts.

thanks
-- PMM
