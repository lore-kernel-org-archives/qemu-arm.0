Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2914827lfy;
        Mon, 27 Jul 2020 07:38:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+W5IPKezl3kKqhIKir6R/Cr/fFOq6LzRIuNgp6Fe6HHlyvg9ewlDByFW1caBDn0IY+xRv
X-Received: by 2002:a25:da10:: with SMTP id n16mr35197337ybf.373.1595860698956;
        Mon, 27 Jul 2020 07:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595860698; cv=none;
        d=google.com; s=arc-20160816;
        b=vD/4xr+XiUeZUKPhTi0NERGvwqph5xeJ+sB4k0oog7i7qek14odsqgB6cPCTecBs1l
         81DXLVyqXMlTSSNAwcVEmPymoG6qLEefHBcLbE7TLECGciJGI3lcbg5wkOWpDXNQx3k6
         1D8MUEAOQn1HoJGNkXa1UO3boV3IgnlSA4avsgbNIfHKo4Jt2QvdXfdbYUDlYqo3OgnN
         xIru5Br3fLBtjei4totDtj+83MaJ04BJF4JRJaY37x9tovv6ZVfezfnahSeE1HJ52NhC
         orVnJ9iLqEekKFUXBdcy/RJPee0/1SxpdZVMv1sikIMUSAEefmAdZngebHSjy3eP4P8g
         eS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NqnmO5m4f6KLp7y2Sqo4eQ7ncsiIIY83YKWr8V6ikSo=;
        b=gexcAs2X2qfJw/f7mlhjf8ulQAnIXmY/pBuAn6EZdE+C/fN6Ha/fUTKE1jQGp1H7Vt
         cgof4h86eSpGPlTHKQ38AhsnSFFSOKRxJP6PS4GUlBj7oFkGnasZgq3HOVjLZIqg7pic
         p6XVJU2qY7GTL9ZBq2aUOkA8AHax+9Z1qviKGiHpCK71GTnmyh++reK1KRKHIhu8Vl8I
         c3KaQQwrXTRt1NV/t8tY+rNVrEIj4jmyLeMIvm77kBL/nu+a9j4cdSt1t4kNZ511Wwzu
         KCHfB9TeGx2KlbH+794o/RSmY6xK2CsoAkeCmhHI0FDGbe6IWHhiSLMfv4hnGW6N3VgN
         tYNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K1aEADQ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si10101769ybk.232.2020.07.27.07.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 07:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K1aEADQ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k04Gg-0002dS-CQ
	for alex.bennee@linaro.org; Mon, 27 Jul 2020 10:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1k04GY-0002ce-AS; Mon, 27 Jul 2020 10:38:10 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1k04GW-0001wC-V8; Mon, 27 Jul 2020 10:38:10 -0400
Received: by mail-oi1-x244.google.com with SMTP id s144so4584208oie.3;
 Mon, 27 Jul 2020 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NqnmO5m4f6KLp7y2Sqo4eQ7ncsiIIY83YKWr8V6ikSo=;
 b=K1aEADQ03rrQyFaaUQyQIxBysSGblWgAO3rEkmx1I9RIag/GqkeKdIqzU6aCJfyETa
 kILGV82UgJkhcM0Cg7GnSDt6UZXQacaEnDFVQPGnS96if/RD5iMY/SPTJgcdfP5UulBy
 O92k27UzpMwqTptK3aoFcn1ihcRFw6xmDXH9qyFy4cEWsnrcbuo9/vAGz49yyVi0ZGf6
 tpoDj56SgGoVjNarbNPi08cRFIuPhUfVwy8SzQ90PN42kPZmkJd1mggjEQe7C/tBQdiD
 BSI+tldaVXltlIR35GIqNWygUhdBSidK0iM748OfbSscgKdT2hBYd/BVrvOGZBgP5nZA
 xUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NqnmO5m4f6KLp7y2Sqo4eQ7ncsiIIY83YKWr8V6ikSo=;
 b=Y/8LXNkmshmJmSjbyjrcNmVayRpvK79VA8uun7q1E3QV7v7PGx6ikjWZ07RIjvDDGu
 0jCb1wnUPdmAWS/YxFeZoD8QRc2hT9/ThDdscqMk9Rk7QxgyZKGaH4tJ/7i0ehXK3+r6
 +YPUcQg5KuPjdk/Tzcsq15ViqiXeqhMYmw6NNwO5q/KyGWvurennwaK6bC2qy/cEBb2G
 NooN205p6/XdvyLMPDSrcAP23u+FRQeF5Fl7qfM8gCcNPXYCmZxt43/JhBfYgSw1Fu/U
 WvmwcGwbEOpw8Di7wShyu9aWklDyHsr364humN0NrPrX+wTlqpqIt7cFFOkjkuE08erh
 4vEw==
X-Gm-Message-State: AOAM531n+Nzi48YBHcZbQM5VGfIzFLAUjOTyGzFrlJFFj19Bwjk8hjCz
 p46lAdHnvBLdWPb6Zn56YBAAt3Jlc3Js88DtMIk=
X-Received: by 2002:aca:494d:: with SMTP id w74mr18790305oia.97.1595860687436; 
 Mon, 27 Jul 2020 07:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200727130225.32640-1-zhukeqian1@huawei.com>
In-Reply-To: <20200727130225.32640-1-zhukeqian1@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 27 Jul 2020 22:37:31 +0800
Message-ID: <CAKXe6S+L=Uze9Eo8jmPgpCDob_S_fXzvquHw2D974_5+haKdsw@mail.gmail.com>
Subject: Re: [PATCH] bugfix: irq: Avoid covering object refcount of qemu_irq
To: Keqian Zhu <zhukeqian1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x244.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Esteban Bosse <estebanbosse@gmail.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, yezengruan@huawei.com,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zbpbZARzzkKx

Keqian Zhu <zhukeqian1@huawei.com> =E4=BA=8E2020=E5=B9=B47=E6=9C=8827=E6=97=
=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=889:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Avoid covering object refcount of qemu_irq, otherwise it may causes
> memory leak.

Any reproducer?

Thanks,
Li Qiang

>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  hw/core/irq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/core/irq.c b/hw/core/irq.c
> index fb3045b912..59af4dfc74 100644
> --- a/hw/core/irq.c
> +++ b/hw/core/irq.c
> @@ -125,7 +125,9 @@ void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_ir=
q_handler handler, int n)
>      int i;
>      qemu_irq *old_irqs =3D qemu_allocate_irqs(NULL, NULL, n);
>      for (i =3D 0; i < n; i++) {
> -        *old_irqs[i] =3D *gpio_in[i];
> +        old_irqs[i]->handler =3D gpio_in[i]->handler;
> +        old_irqs[i]->opaque =3D gpio_in[i]->opaque;
> +
>          gpio_in[i]->handler =3D handler;
>          gpio_in[i]->opaque =3D &old_irqs[i];
>      }
> --
> 2.19.1
>
