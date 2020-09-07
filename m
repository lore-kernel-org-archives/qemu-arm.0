Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3359247lfc;
        Sun, 6 Sep 2020 18:15:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWAel0emZLnq5iGKcCeFXRdcE63i+mtlTOLzNX/JLmlz3Gsk3Kt00FKYd+sToZponGGU1h
X-Received: by 2002:a5b:450:: with SMTP id s16mr25511588ybp.237.1599441354605;
        Sun, 06 Sep 2020 18:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599441354; cv=none;
        d=google.com; s=arc-20160816;
        b=isAPq5dUL87ACnvIGT9WcdnGZed7bxUnJFVxOXJsQMBX7hHXqS1xqpxPFYSw22eAD5
         Ujd2BVhZKR9Oh4Zlhb7e2gEh00AP4YxbTTJ/M6EexuVK+XskgtYG5sdX3AlwwP2UA0dr
         zVlwwM8nWZjh2Z5ZO7S5c0A3OX0RBnMSOEY5lky0k+TZObyeT65DZLuf1Vr8A1iV0PEh
         h5fsMzDVQ2+YtGjXqvs/l3ok/k9phlpKbm7KZLaWXp0z6Ot5FpwlFAs+fOLN81swlNnb
         lQ7K9SpI9XWcpbjhCww7/BZXpgT1gFf/KOfgY6IoGdE4WTRFdCoTeNyacK5khMnXDTQd
         kl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1loAEISkJKUavZrT3lSKkYTAByy0U7cdnzxNpw76mIs=;
        b=ENLE1Hrm+qcM3TjzVDMIPM8ZERvqa8wRtoDvfDoIQjklob2aNpHDPuS5D+IT1/cPv2
         2SMcpxlmRWhsyiHRbnYnSNRk6uASksRhbwLNN94T4RbpQMAJxE8sOvs2oP/CqjmrNHD2
         rFhKmGMYi/aOud4hLIZn0TOt6o6y4ob4qgQzQzONGOWHlSPSctPhY2hn8c10JvX85YTF
         ZJEiVzoyKmhHfXjUgnL3WsyDcr2T4KwrMl+UktMvJ9qkcWtJX865Al2srEsl981FTs5I
         ExzicF6QcxXYPL/fLhzBJZLFpaWUvGvdtYXFLEJml4Qxpmk9U3ZmuzOrhvYYdV7+a5mQ
         FXmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RmpCfALI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si12889742ybp.269.2020.09.06.18.15.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Sep 2020 18:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RmpCfALI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kF5lC-00052b-0o
	for alex.bennee@linaro.org; Sun, 06 Sep 2020 21:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kF5ka-0004cH-Sz; Sun, 06 Sep 2020 21:15:16 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kF5kZ-00034N-18; Sun, 06 Sep 2020 21:15:16 -0400
Received: by mail-ot1-x344.google.com with SMTP id a2so10982035otr.11;
 Sun, 06 Sep 2020 18:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1loAEISkJKUavZrT3lSKkYTAByy0U7cdnzxNpw76mIs=;
 b=RmpCfALI/msotsbAaGwvZ7Kdt/QVIiTAArVrTdum3I4sQ6aAy9j7yQgiFqy1GK03H7
 O4G2vwRRxgmoGRMipc1+xP2o8fwgNDTnwHeI61mb3JzxPxi4IbaS6sWTq7fvjg4C3EPw
 AxUt2QC8GxvJoL7MbTFhLQQhEshqeQ7VkfkVye74SWM1RQc/YzFMZNzDba70QPMZpIQW
 icQYqZkLEoZ1H1WaIJY5k99bHn/hrHDSFVZHWus7M7SJkJiTVEaCVU79HFKBigdKAChC
 BlXRFIc3Yzgofr+tCoxqH+bZFMPLlEifEWg65CFqFPH3F0FvZZYUJHgunEqPYmsl1O0e
 J5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1loAEISkJKUavZrT3lSKkYTAByy0U7cdnzxNpw76mIs=;
 b=DWaBT8DRbpoGs7eET3kvLWESZ9cB31zd3fZBLj4wYLPVYQ5sJ2HYUctSTJ+0V3uMOB
 2HyGtvzcux99H77HFaO0J50vrcRrYKPUYNqf0dIyxl6DUVsKH9Vw5IzE2rprFh7Y8JRV
 bG/UDNb0nvqu2BTzaz+NjJw2b2go3BBK48x589ssA37uOdx5ninDEP+Ru3xvWg8t1sHD
 jeky9CjopzHiPtzNct6IRY+HUbUJ4r6ugd7C/MV5j5B7VQSt6/z+FDG8E4PeUfm6zLo1
 qFuOzMYDgZFA1CCMFptfrZ7jmhsmCVx59CjfHzsnxoFZIDiCWx3it8MEKs6Ms9o61iVg
 tQ/Q==
X-Gm-Message-State: AOAM533dlEF+dUKshyztxbJsuODI/776fFO8Jam/Gc+iSGs4j/UhssQp
 A698hZqeXuSEPeAsWT9pI25e+z3qGmxD11KyovU=
X-Received: by 2002:a05:6830:610:: with SMTP id
 w16mr12175814oti.353.1599441312796; 
 Sun, 06 Sep 2020 18:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-11-philmd@redhat.com>
In-Reply-To: <20200904154439.643272-11-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 7 Sep 2020 09:14:36 +0800
Message-ID: <CAKXe6SLOSnc-bJRZWsPV8=L8z5Se-j_H0HXiSpZwVxZUPDecGA@mail.gmail.com>
Subject: Re: [PATCH 10/13] dma: Let dma_memory_rw_relaxed() take MemTxAttrs
 argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Qemu Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MIHLGCZX85Od

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2020=E5=B9=B49=E6=
=9C=884=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8811:53=E5=86=99=E9=81=
=93=EF=BC=9A
>
> We will add the MemTxAttrs argument to dma_memory_rw() in
> the next commit. Since dma_memory_rw_relaxed() is only used
> by dma_memory_rw(), modify it first in a separate commit to
> keep the next commit easier to review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  include/sysemu/dma.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index d0381f9ae9b..59331ec0bd3 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -83,9 +83,10 @@ static inline bool dma_memory_valid(AddressSpace *as,
>  static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
>                                                  dma_addr_t addr,
>                                                  void *buf, dma_addr_t le=
n,
> -                                                DMADirection dir)
> +                                                DMADirection dir,
> +                                                MemTxAttrs attrs)
>  {
> -    return address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
> +    return address_space_rw(as, addr, attrs,
>                              buf, len, dir =3D=3D DMA_DIRECTION_FROM_DEVI=
CE);
>  }
>
> @@ -93,7 +94,9 @@ static inline MemTxResult dma_memory_read_relaxed(Addre=
ssSpace *as,
>                                                    dma_addr_t addr,
>                                                    void *buf, dma_addr_t =
len)
>  {
> -    return dma_memory_rw_relaxed(as, addr, buf, len, DMA_DIRECTION_TO_DE=
VICE);
> +    return dma_memory_rw_relaxed(as, addr, buf, len,
> +                                 DMA_DIRECTION_TO_DEVICE,
> +                                 MEMTXATTRS_UNSPECIFIED);
>  }
>
>  static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
> @@ -102,7 +105,8 @@ static inline MemTxResult dma_memory_write_relaxed(Ad=
dressSpace *as,
>                                                     dma_addr_t len)
>  {
>      return dma_memory_rw_relaxed(as, addr, (void *)buf, len,
> -                                 DMA_DIRECTION_FROM_DEVICE);
> +                                 DMA_DIRECTION_FROM_DEVICE,
> +                                 MEMTXATTRS_UNSPECIFIED);
>  }
>
>  /**
> @@ -124,7 +128,8 @@ static inline MemTxResult dma_memory_rw(AddressSpace =
*as, dma_addr_t addr,
>  {
>      dma_barrier(as, dir);
>
> -    return dma_memory_rw_relaxed(as, addr, buf, len, dir);
> +    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
> +                                 MEMTXATTRS_UNSPECIFIED);
>  }
>
>  /**
> --
> 2.26.2
>
>
