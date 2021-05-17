Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp837716lfm;
        Sun, 16 May 2021 19:34:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhQ9YccHnDIN5yIuQ8LM0n4UThAzVdgMSeP36QN2RsIj3oW81+a/dOROYaGqLjkmdGGgpZ
X-Received: by 2002:a05:6638:138e:: with SMTP id w14mr36688489jad.33.1621218844408;
        Sun, 16 May 2021 19:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621218844; cv=none;
        d=google.com; s=arc-20160816;
        b=IFKzKhdAeZQEnL5ae69u7wcKBgqGm6hdawKYcl3Mr9i0c+UTdP3Tzz04YyfMEu6ZW5
         Yu/u/Ww/A9sJaLY+hV0TWkixX3kgWK4xETm4suaC1B26uL6j1S3tFWHkdAbIf33qp/RD
         dbLqGSLSvasZiPBRb1LlO+FUwPPMc6e/N2rZCdEbsYqoVgmdJX5WOxaQgb/6WfWBVDp8
         EsjOaAtUxq0/PhSpo15D9wL7cDc9kXiFwyff+lqZgqs3Lh5Zb0tCNUB173WEdHlp/Gsr
         yxThlSCQa6fYkkHuGOFJdHNqIf1gIhQXV7HbgWaVoTnJUUn+RNk+Sly98s4qLdOKDDhD
         lkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=V7wEQKqwQ5OwwmeDdQ+DZv3iAllQc9fyfYQrfy4q71E=;
        b=l/EKk0hLqByPDm+z1JL1wUWt3MRSL2m+5u72pFP9tSJgxCZJzg426+pm52BboSmZ9K
         qRa+MMQ/NX6kyx34MHuf6NBLX3rpuEfgWk4dmXt4vzJ3L6CfHxuuH8QAta+HxxX5sCTO
         jreWL+6V6MXupxHJwKHplEZkZ1QRYXbzFpnCTgPp6oD3gl80zsw+t7ih1Xkwx+EYM/E2
         OsQUFnS5aqfLHP1k6tXK3Q+5E733Ax45K0ivOZwS0T/qqNPo37FjwSm6dDVKAXlJaS1O
         NCo6wkEiF6e3Sim9RcQwU1WJrdYxPrPEGAHw5TzGeG+cffa9hO+8W64cuOwqxg71m/To
         qULA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OaFMee8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si16678179jat.11.2021.05.16.19.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 19:34:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OaFMee8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liT51-0000em-Oc
	for alex.bennee@linaro.org; Sun, 16 May 2021 22:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liT4s-0000dS-Aq; Sun, 16 May 2021 22:33:54 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:41527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liT4q-0006ks-P3; Sun, 16 May 2021 22:33:54 -0400
Received: by mail-yb1-xb34.google.com with SMTP id l7so6529005ybf.8;
 Sun, 16 May 2021 19:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V7wEQKqwQ5OwwmeDdQ+DZv3iAllQc9fyfYQrfy4q71E=;
 b=OaFMee8tVZKlExJiEatUiFTa4bRH69+wmMUkGRoEmNFxdidcCVi9EUqS7ue5KMyoux
 ZIeMCbioyMft8Xh3hkjdDAzXoYUA9dhdJVoz0WB4MYe8zXre/lBKEV70eYusYKcgQIcL
 Orjg43K9WbVNzsyMZY+GBz9XcKKaqQPRUaiR9nCN6wCdCuu8AaRbyAe7dVLy8CbGSJ2y
 sGOHEQp18c0TZ55AjNQvqzDORllw3JOTyY84DfZwbXj4k6OcNIjmYIdQSKuPMkjaMe4q
 QzbLm8lAg/ppdbNBHStx20jEmjSUytvRNFVK2ZLgBY3bwQ1+KW8JFdTZHfcO+IMwyJ/j
 UMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V7wEQKqwQ5OwwmeDdQ+DZv3iAllQc9fyfYQrfy4q71E=;
 b=m4/omGaHdgmkZ9wIyYHlQfqExNJAfyj/pJxtsNCyMcPDQr9xr0KKBCq53dv6H9nKvW
 NUhU/ShZgxQ1kzEeT3Phba0DYOp6MZjQ3lzmlyOX0Q2ogivwcfMi1wL0hGfu68tU2iGj
 C2vmgP5UL7RoH1G7r8tVBpRlqrgisSOKCqueihUkH7ekYWCe9Q3yH0CiqBRZNpuuBXYd
 l5HsTL4XksvhNtLFXwanDj6FPxUJEyeIt1kucIQgHSsFFq03fe70XH20FKWIa5i1cECW
 L+oGZ+h8DVcDU+VJE0OPsXTyo8dDAm4M8PQiDiZBZdEPLZ4p3DhYZd9wuoWmH7TLYmur
 55Sg==
X-Gm-Message-State: AOAM531B3Gv4mF9W5VrDaycuDBe04GkpqFDOQ1ySFns7xEGo5jh1jyWq
 BDvRgM/G+pBncL9LWUMlSo9Jd8TMDe96ry+/Y3Y=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr46586081ybu.332.1621218830803; 
 Sun, 16 May 2021 19:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-2-philmd@redhat.com>
In-Reply-To: <20210515173716.358295-2-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 10:33:39 +0800
Message-ID: <CAEUhbmVYC6BE5En83KdujZu7uEbg4DKgNiz0MRUeWVAM7KdWiA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GZ355ucCtlJx

On Sun, May 16, 2021 at 1:37 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Per the kconfig.rst:
>
>   A device should be listed [...] ``imply`` if (depending on
>   the QEMU command line) the board may or  may not be started
>   without it.
>
> This is the case with the NVDIMM device (it is certainly possible
> to start a machine without NVDIMM) , so use the 'imply' weak
> reverse dependency to select the symbol.
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  default-configs/devices/ppc64-softmmu.mak | 1 -
>  hw/arm/Kconfig                            | 1 +
>  hw/i386/Kconfig                           | 1 +
>  hw/mem/Kconfig                            | 2 --
>  hw/ppc/Kconfig                            | 1 +
>  5 files changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
