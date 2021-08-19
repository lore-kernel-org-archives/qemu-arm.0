Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp379940lfg;
        Thu, 19 Aug 2021 07:28:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwB0cYA058EWC2GxKOzujS9440I2pcvkEQpNehf7O1VR/sceRKx+0+RoBf0Gl3CjGPjs7X
X-Received: by 2002:a67:6e83:: with SMTP id j125mr12571289vsc.15.1629383306704;
        Thu, 19 Aug 2021 07:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629383306; cv=none;
        d=google.com; s=arc-20160816;
        b=UZPlbFR4vmfoxAqeWmnRlLE4voV6O2DRN4ms2fzSOOqfzwD1150Y7u1OxZM5pxyjnF
         5AyzHw7+scBg8l3bq5xZWVNCjIbrwDIhLbP2XK4KtR4xx3mDzMa7tESOeQBZVrWiYRWb
         BXErKGwuApa7/3YvsLc2A/b0IC8ETQn7z5psl74W1K3NgfbyvW/tDkIZj3UAVuiXe9/f
         sW/Vr0syBJcXgj23rpIIPO3OGY0lxgLA6Uk4zXjrbDglLf4pft4+MudxMDg6YdkoO3gN
         J/TpIWHDBWtZHzX+i2S+V37Zhslucwk2JOQ0rxUK9YdgQQ4TWlbEpR8bpwW+g/pPSJB1
         Do7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BxHpTsx7fHyGxR3bMEq8sHGo/95EZYvobZqECuQcetY=;
        b=CsSj8X2ij8GIUSlrRR2AEbncqTJXIDN4F2a54hV0LgJKZzW2CGNgmKC5Kge4qhdaMx
         WozzmLhxNjEg/AQ2pwhLmpvjWhm4rdz3SOD3XGJEtLJkWUiYgg3Iw//lw4b+PWuVrJ4z
         pYJTt/IsTa51BEYPSUL8Suxvrq33/ubQEC8Z1H7XLgw3vIb+oa46WZxzbD3Ab3g/mG6D
         9p2uFkaHBroKBE6AB7/Y14Ui5hxHQ3GzGh9nMO5t325fApWZMZIOfTQMuiJS2XLv4k0g
         vcz64QR3A+J//4H0m79+vHrKFszcRstmtRvy4v0FZWuJGP/1LdipLPgG4pQ85ctKs+Z+
         BiJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ehJN3+5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si1777378vsp.142.2021.08.19.07.28.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:28:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ehJN3+5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGj1u-0004UK-0i
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGizM-0006Ro-7R
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:25:48 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGizJ-00025o-Ep
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:25:47 -0400
Received: by mail-ej1-x62b.google.com with SMTP id x11so13462778ejv.0
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BxHpTsx7fHyGxR3bMEq8sHGo/95EZYvobZqECuQcetY=;
 b=ehJN3+5jsWBuJrI65SDJ/Ojay/xGFTzmCtWr24kLXs4jLnlpPHqUZUbwKwUGmqogzO
 3MmDRlJignhNPwoSO1Ywkz4b511TeiZTNi4NEP5yygj/MlPb9bPBnU8Yp3T95xXoWpK0
 Qq/cpPKX7u/Dt63TjWbi/s+GnaN1U4pEQhFkt1Y/s7q+3j1yfqjjVZsDVeSL1mzD544/
 CMW8MQCS0YaW8oPXdrsknRY/C1ppaW3qsKyr0bnorHmPhz2jULhh6V5MZvmLnTTc8qwL
 5z01YU9VmcXt2tXwoHHrmQ/kMQ0mkAXRLtM2UroIQdcmEMQqrHTv9mkKKNGJtC7p7jMl
 CCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BxHpTsx7fHyGxR3bMEq8sHGo/95EZYvobZqECuQcetY=;
 b=n3rEE5pJsO9u0EjK3V0cxPUvN2cyircuuUmbnFC+D01lv9fyyd0cddvWXW0m/OHxsl
 Kt46LZCOLLO+lnUw6IbEea1JYclD/Hbnn41CJ93Bi4HlrcNCn0sYZ4Pi47pTXoVLPSmN
 O1ICHoN+R7/YTSdrX02Qhxgk8I79HeJJWUkNNgH2b7pEHguHQPszu8FmVUlzza5dinfi
 J9aVtAwXD9mS5BCfhBQLW6ckO+2FBzOnKec3GrCoUR3XgY1A7CDVnEMNzOYcWO+qptam
 6yFarSVkimxI0aDY8YqwQv4iX4gXeELTS/WKSr/s8J+kSw+TuAuwJw0Q3mEzn8wR5+a3
 osJQ==
X-Gm-Message-State: AOAM530yrDcXQmkgYEh0MH+NHwcurLElzi7Ysvu94zigVcLJqj7uUF0q
 HJszY2r/zXThyUewEr/kmHz6HH4dO/EIgxVI5fJGKw==
X-Received: by 2002:a17:906:584:: with SMTP id 4mr16461222ejn.56.1629383143590; 
 Thu, 19 Aug 2021 07:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-3-philmd@redhat.com>
In-Reply-To: <20210819142039.2825366-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:24:57 +0100
Message-ID: <CAFEAcA_GxyOYSfg+Su4iNrGNXyBB-KCfNQ+m+k9RywBGkQa08A@mail.gmail.com>
Subject: Re: [PATCH 2/6] memory: Introduce address_space_create()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YpahdFCyTcKV

On Thu, 19 Aug 2021 at 15:20, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Introduce address_space_create(). In is similar to
> address_space_init() but returns a pointer to a heap
> allocated  AddressSpace.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/exec/memory.h | 14 ++++++++++++++
>  softmmu/memory.c      | 10 ++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317f..b353a48c25f 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2418,6 +2418,20 @@ MemTxResult memory_region_dispatch_write(MemoryReg=
ion *mr,
>   */
>  void address_space_init(AddressSpace *as, MemoryRegion *root, const char=
 *name);
>
> +/**
> + * address_space_create: Create and initializes an address space
> + *
> + * @root: a #MemoryRegion that routes addresses for the address space
> + * @name: an address space name.  The name is only used for debugging
> + *        output.
> + *
> + * Returns pointer to initialized #AddressSpace.
> + *
> + * The caller is responsible for releasing the pointer returned
> + * with address_space_destroy() after use.
> + */
> +AddressSpace *address_space_create(MemoryRegion *root, const char *name)=
;
> +

I'm not really a fan of this as an API -- almost always I think
devices would do better to have an AddressSpace foo field in
their device struct and call address_space_init() on that.
Hiding the heap allocation inside this function makes it harder
to notice it during code review, I think.

thanks
-- PMM
