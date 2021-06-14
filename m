Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2092951lff;
        Mon, 14 Jun 2021 08:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywmfJnSUyv2nNJaoQva6Gzq3vuvdo/RW0irqqNuesb9zLwSRBMChuJp2bF1lmGK+tE4252
X-Received: by 2002:ac5:cbc5:: with SMTP id h5mr16694459vkn.22.1623686013023;
        Mon, 14 Jun 2021 08:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623686013; cv=none;
        d=google.com; s=arc-20160816;
        b=T+upNTUQQTc5ECcZaOFcJDkADxAvtgoauuDtHDteKNO2nXHKiG2PTuGC/ZI7VbTJ+S
         iZVKTvFZvnL9ZnNdIdpMFqK7MvpyFwvw4Fw25185dDW6AWojjz6JsvIyeHV8wnNiEaZH
         9Q6+cRYqo2szZGcpfhIzXZsxp6j4pMTSlNINnqTEO3bW3jByFCaJRxeB30w/wYn3Ur2R
         oKo6AzGGPsI68jZy91/hI7w2wwLU4C7EPLP9ApHML6CT1jSwTNHlugiYz2NTHKkJzddS
         CS9SSTBo6BkWgxxv/XOoG6nQtODonOSPuepGkQbaHKB85ySkzVi+S+Rx+6V9zYg+Ud0Y
         hWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=enW6cODi1lOqBa73zLBTRFvVIBtyeyh3uErQRu8sivE=;
        b=LEjpxKHUvXFm7a1H4aXZUvdBURI0raX9/aVcdkzKdxD5xPZQE3kb2TtTkYu9UwT8YG
         6A/GIUqrImbPQIvfKbPkQ3pAgJ1HNSN0xwg3ZmazxaldaBMlAKstpo9nA9ppBACVdYX1
         In1EaJNcFZ4tDSGkIXnAuX8fMkmhLgzT9ptgK9+NWXVlSu5osRVH+HJeknEui0mM6Lhl
         H3Y7/8Xasux465cj6Gx1n9l9AMprz/UpvRxS08MBzgT3RYBADzF14KTfj1S40c1da3cV
         3dHqoGajoQjuGhlFxjB2wf5VBLAeKqT/3h9spkoW12lF45OEu3WyM9qVdnKoiZx+efLm
         ckJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x3xS1dde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o24si2432vsn.70.2021.06.14.08.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x3xS1dde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsou4-0002A1-8o
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsote-00024D-K0
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:53:06 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsotc-0007nz-NP
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:53:06 -0400
Received: by mail-ed1-x52a.google.com with SMTP id dj8so47153486edb.6
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=enW6cODi1lOqBa73zLBTRFvVIBtyeyh3uErQRu8sivE=;
 b=x3xS1ddeAG1zu8cByzOm7OsHI0qbkZxj7SyPa8OeZDUMvbUhVAZxet4IVw7eShyHyY
 PkQercGdWdEZG2Pbqmqd8aCboeb21yBE3QGjeGtM8JJ6wikZotHM2j6N4cdUvjutCEL+
 /bXoHrel4i6arnBcCDzZOVBvAaGZiP0gzfDzp9n54Z12l/VdrB0hwmshZDxceyFtnjFm
 bGUCv5z6+MEo3hMiZ+LnnmHp9SQZ7zuKlwebPpoJFdF8q8psWDnA+z8zfy7SQCcUc1iq
 XEw91HRDa26wJI/qjKWkmCP7BbT8KoTty+AyzbmRZcax3aESnHVHLCPjAfn8rrYphyT/
 vTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=enW6cODi1lOqBa73zLBTRFvVIBtyeyh3uErQRu8sivE=;
 b=UwAWdxrrxu2R2Q5+oqAvoryBRELRC1GzEtJuIwFd7hrM6u3iLBlksGooQSmbEOYe50
 0F1nK1v/wxDay2A884k51BSaBuAMLsmWH7n1ywK+4XYP8KTecIH2MssA1lpY1gqQGlGZ
 NxcLd0MxIL/8s5jl5PnqapSH09Bjy4aT5io1jPLzWLXBfQgw92Uf2+gn13j9JKNv3DPW
 Bh7Kvi8OUOs2hyzzBNAUw+BnweRyppw18LyPsh+hf0cH5nUHxvOW+djHK2iWyY5P2RE2
 HBKYf2Q+xuMEyZkjy6FYJs/hYOC4ma3OP4WnSeaQekWfX5ZFqzfezEgBXWiyqOKPs/rf
 X3lA==
X-Gm-Message-State: AOAM533tgJCdimzvQ8c//68XP/E6TtIuV/cqU8x+9wXPZhLBTI6WkDk4
 DErFqOHB7nHEsPD7WlHm3/tcEH3VW4Gl5XtApgenCA==
X-Received: by 2002:aa7:d755:: with SMTP id a21mr18049253eds.146.1623685980406; 
 Mon, 14 Jun 2021 08:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-3-erdnaxe@crans.org>
In-Reply-To: <20210608161028.4159582-3-erdnaxe@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 16:52:26 +0100
Message-ID: <CAFEAcA9EEOg92Vz3ZiyV3XeWXn8PV=sGm7wiaqoj==K6PoPM-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] stm32vldiscovery: Add the STM32VLDISCOVERY Machine
To: Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TVYkP7T/vPZZ

On Tue, 8 Jun 2021 at 17:10, Alexandre Iooss <erdnaxe@crans.org> wrote:
>
> This is a Cortex-M3 based machine. Information can be found at:
> https://www.st.com/en/evaluation-tools/stm32vldiscovery.html
>
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>

The commit message says this is Cortex-M3 based, but the
code gives it a Cortex-M4. Which is correct?

> ---
>  MAINTAINERS                             |  6 +++
>  default-configs/devices/arm-softmmu.mak |  1 +
>  hw/arm/Kconfig                          |  4 ++
>  hw/arm/meson.build                      |  1 +
>  hw/arm/stm32vldiscovery.c               | 66 +++++++++++++++++++++++++
>  5 files changed, 78 insertions(+)
>  create mode 100644 hw/arm/stm32vldiscovery.c

Could you add some documentation for the new board, please?
This lives in docs/system/arm. Commit c9f8511ea8d2b807 gives
an example of adding docs for a board.

thanks
-- PMM
