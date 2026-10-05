Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EF6CA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 15:04:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDkCV-0008Rc-VP; Mon, 05 Oct 2026 11:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkCR-0008P9-CW
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:01:56 -0400
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkCO-0005CB-Hp
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:01:55 -0400
Received: by mail-yx2-x0f.google.com with SMTP id
 00721157ae682-895eaf31683so13214947b3.0
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 08:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212511; cv=none;
 d=google.com; s=arc-20260327;
 b=Y0+CyPCY+EHHwMq+DHtHXyeP6JHBMLzh+4qGoI9RxYfe3jGiAkVe5OjaOhozJdC7Gk
 UjMc1Pl00vedywgOvOqU5pzA/8hPBrqymhfPYczmy1X/Yk9WT0+9AZtVam1Iwwf1oSzs
 1/RB8j4T6Ghit0f7aEtqE8TWA6SSd+M15lv5eLo3yf1POtDOUsAIM7gpp6GdP4Ma1YHP
 t1r/W2FdrQgFnOcYIMQMfAJG7XfSfusgTPdc9tiWKGLhZ0xawLE3Q3S5xmNxB4EGwAYI
 jg0GHc/M9BDlRwFR9lpFFl6OFs6hRkQwElW0Dc3rhbQ/xraHwJtdWBfW1THy8Ne9Ygis
 1IAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sJL1wUq1/9xigC+eDOJFyGhcqLk4A52EajwWjb33Br0=;
 fh=x62z7bpYE5br+UjQkUSqHoGpxCIapYTKxcP7DnN+1OY=;
 b=KTo8mBo2ckfr7T1ucgUR6SnFuBq+Dx51/sNoYn+vQ9jPr5yW3rPAoiY8LhO8RwHBbl
 fIUYAOJablIg950t6T4FPQYxfLOuHivCySh4pU/VNvw9OasdszE7qE4+9GX4af6tFx38
 bcXuIHBwvtaluzAPj474VFl0R/F5ugdRhuMndMqiRdMGrSKXRe0HkpH3haNMTIWZtYdi
 B3rFxtHcJ4Vn+awjfvtvcfr1G//RktJznukMchQz2lQLG3eQlGBPHOMIa7umfNyu313c
 Qo9KaNx848S7lbdlL0sAkkQS+Hzil6rhRw3BAKiSEaqN7bFO8NjlgcZcI1Yb783pgDUL
 GqTg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791212511; x=1791817311; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sJL1wUq1/9xigC+eDOJFyGhcqLk4A52EajwWjb33Br0=;
 b=A+D/07sx3Bo8L3wsCaRL77WEM85oqUhpJ0EI2QpCU7xdnoFV0Flq3Ziwmp1xBN18ty
 OzNdtTl37CVdIERVZZtg5EkpQ85ZeVSnig9vSNO9YO4q/dYq9enUHaRboKAAdCDaURMS
 qeQK9ylBKSlNwpTewPB4JCzHpaNkKAQNQ2XRoiB6mXjre3qRFfNLJFo7DX0asnrwk6WD
 Dwy+vSUbAxRzphcRSusCct6sCumPFVGJJg43f5j+gSwWr5ZMHPw07wAum6lIUAuPKrWV
 vzqHPLCZHThofC3G8DhV7VP2xMJfDzF8uLruJY1LhtxBlLNhbzpF+MdQYHnXG1PKsF8t
 uaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791212511; x=1791817311;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sJL1wUq1/9xigC+eDOJFyGhcqLk4A52EajwWjb33Br0=;
 b=dXgwK4/Z6dubkoF3RPCd6fuqL1GIDWZxTHyhg7Jk9n6McHVL2J0BudTAF/KK0g3Ixy
 MGZe/D/m92NCuNytUn3zUKefvqHv4reOkoIOVM0eLEapmEz3IfCq1lfZPYK/+zE+lTHK
 ddwa/8ZH86T+MnVYbzajG35KZKGXy0dVlehzWw5KKaqAB6Xuspw11FjtvLibPAH9Z39J
 9B3GhuiXxcle+GMmOQ3oCLxVgbi5VCh1ect5eBAaHeR9tDnf7UXZ3TabDIXpu+YMofIS
 EUCWAuIV18UMqiQBaHr0P0v9tm/GpjxIpdDSG5WU65A5SaAYB5JTS/WAscIYPb5BqoNP
 TSlA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxnh1kZQ8J+XQ1FxJc7nRcUEuUUcW1TLd4p6uHckrLQEd+RdpfocsmdzcLVGdbhsX6XJlsI1ZBe6g==@nongnu.org
X-Gm-Message-State: AFq9FYIYAxvIsvx2OdFFizkNGIIcvB4M8obPTJviUFzIVCMjaT9ya4yj
 cLUWm5kzf2WyzTr4kIUL6y7wmUdIQfzYDss5zCjCtxdiPFHOaYFIyRyXUHBWELUBtQAYvY8WaiB
 4QdMSVse4GQg0xnq+IoqO1CLZuloRjMY=
X-Gm-Gg: AYBFou3Po0GMUfu0AEC6Kq0qGkE5gOUgyHoepsqHcSpeXaYioiIOfetPIA41f+BNJ4l
 Xztp0Pq8x33yS19lGO9cukwW50cSKdNCLCHlQpRDIbqI57yjNltBnxXi0ekYAbdm/XC3+MYN3e4
 C74/jQiW85WDPCZFja892MnF54SeT31wdLUMdQumQZrneUoAXNW++5FaLWXopopxCe4Fj4hILlk
 oIpLEHboF/HTYvJ7hUSckQvtDIP+/ftH5v19/M81YUplRCmMa02I1bmf4CnVmDq0LgkJL30A0/S
 aZzuYL8JV8z32tq9CU6WB4J1tR/h+ZE+SFC/Gf0uDb+VxBD6zdXqV6agF95y/Wex+O38xPGW6cM
 dr8izVydCJCR9pUWjKU72AMG84g==
X-Received: by 2002:a05:690c:348a:b0:873:5c6b:a303 with SMTP id
 00721157ae682-8ae3a00d216mr34163507b3.49.1791212510582; Mon, 05 Oct 2026
 08:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-5-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-5-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 23:01:37 +0800
X-Gm-Features: AclHuK-Vc-cwOizJz1bGvTI7Ny-9rajbHeBvLAZXy7l1LoiGbPbi4NS3TMQV4VU
Message-ID: <CAEUhbmXuyb_2=JT0GDDPYaU=z0LycFo7GphY8AYD=hzZmEf82g@mail.gmail.com>
Subject: Re: [PATCH v3 04/31] hw/watchdog/wdt_imx2: Remove redundant attributes
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Bernhard,

On Mon, Oct 5, 2026 at 6:21=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Since WDT and WDE are write one once bits, their values always
> correspond with their respective locked attributes. Thus, the attributes
> are redundant. Take advantage of this observation to simplify the code.
>
> Note that removing the attributes changes the vmstate structure which
> constitutes a migration break. This is allowed since QEMU does not
> guarantee migration compatibility for i.MX devices between feature
> releases.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/watchdog/wdt_imx2.h |  2 --
>  hw/watchdog/wdt_imx2.c         | 21 ++++-----------------
>  2 files changed, 4 insertions(+), 19 deletions(-)
>
> diff --git a/include/hw/watchdog/wdt_imx2.h b/include/hw/watchdog/wdt_imx=
2.h
> index fc01fc46e7..0bf2903959 100644
> --- a/include/hw/watchdog/wdt_imx2.h
> +++ b/include/hw/watchdog/wdt_imx2.h
> @@ -84,8 +84,6 @@ struct IMX2WdtState {
>      uint16_t wmcr;
>
>      bool wcr_locked;            /* affects WDZST, WDBG, and WDW */
> -    bool wcr_wde_locked;        /* affects WDE */
> -    bool wcr_wdt_locked;        /* affects WDT, cleared on POR */
>  };
>
>  #endif /* WDT_IMX2_H */
> diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
> index a15f452d48..e9cb5819e4 100644
> --- a/hw/watchdog/wdt_imx2.c
> +++ b/hw/watchdog/wdt_imx2.c
> @@ -59,8 +59,6 @@ static void imx2_wdt_reset(DeviceState *dev)
>
>      s->wicr_locked =3D false;
>      s->wcr_locked =3D false;
> -    s->wcr_wde_locked =3D false;
> -    s->wcr_wdt_locked =3D false;
>
>      s->wcr =3D IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS;
>      s->wsr =3D 0;
> @@ -156,24 +154,14 @@ static void imx2_wdt_write(void *opaque, hwaddr add=
r,
>      switch (addr) {
>      case IMX2_WDT_WCR:
>          if (s->wcr_locked) {
> +            /* WDZST, WDBG, and WDW are write-once bits */
>              value &=3D ~IMX2_WDT_WCR_LOCK_MASK;
>              value |=3D (s->wcr & IMX2_WDT_WCR_LOCK_MASK);
>          }
>          s->wcr_locked =3D true;
> -        if (s->wcr_wde_locked) {
> -            value &=3D ~IMX2_WDT_WCR_WDE;
> -            value |=3D (s->wcr & IMX2_WDT_WCR_WDE);
> -        } else if (value & IMX2_WDT_WCR_WDE) {
> -            s->wcr_wde_locked =3D true;
> -        }
> -        if (s->wcr_wdt_locked) {
> -            value &=3D ~IMX2_WDT_WCR_WDT;
> -            value |=3D (s->wcr & IMX2_WDT_WCR_WDT);
> -        } else if (value & IMX2_WDT_WCR_WDT) {
> -            s->wcr_wdt_locked =3D true;
> -        }
>
> -        s->wcr =3D value;
> +        /* WDT and WDE are write one once bits */
> +        s->wcr =3D value | (s->wcr & (IMX2_WDT_WCR_WDT | IMX2_WDT_WCR_WD=
E));
>          if (!(value & IMX2_WDT_WCR_SRS)) {
>              s->wrsr =3D IMX2_WDT_WRSR_SFTW;
>          }

In the following codes:

        if (!(value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS)) ||
            (!(value & IMX2_WDT_WCR_WT) && (value & IMX2_WDT_WCR_WDE))) {
            watchdog_perform_action();
        }

Since you removed the part:

        value |=3D (s->wcr & IMX2_WDT_WCR_{WDE,WDT})

now 'value' does not contain the preserved WDE/WDT bits (they are only
preserved in s->wcr in this patch), the watchdog_perform_action()
won't be called.

> @@ -234,13 +222,12 @@ static const MemoryRegionOps imx2_wdt_ops =3D {
>
>  static const VMStateDescription vmstate_imx2_wdt =3D {
>      .name =3D "imx2.wdt",
> +    .version_id =3D 1,
>      .fields =3D (const VMStateField[]) {
>          VMSTATE_PTIMER(timer, IMX2WdtState),
>          VMSTATE_PTIMER(itimer, IMX2WdtState),
>          VMSTATE_BOOL(wicr_locked, IMX2WdtState),
>          VMSTATE_BOOL(wcr_locked, IMX2WdtState),
> -        VMSTATE_BOOL(wcr_wde_locked, IMX2WdtState),
> -        VMSTATE_BOOL(wcr_wdt_locked, IMX2WdtState),
>          VMSTATE_UINT16(wcr, IMX2WdtState),
>          VMSTATE_UINT16(wsr, IMX2WdtState),
>          VMSTATE_UINT16(wrsr, IMX2WdtState),

Regards,
Bin

