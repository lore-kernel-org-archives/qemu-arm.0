Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp341539ejy;
        Tue, 21 Nov 2023 01:23:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGT/TySa9jmxozUI4Maeil8TihzOkXc2EKQaZo0+p9MRoErMSi4eB1H8Gie3qCHZcsSeOZw
X-Received: by 2002:a05:6214:19c8:b0:679:d40d:9dd6 with SMTP id j8-20020a05621419c800b00679d40d9dd6mr8721853qvc.56.1700558614726;
        Tue, 21 Nov 2023 01:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700558614; cv=none;
        d=google.com; s=arc-20160816;
        b=ssg12ZCa/vcRB1ybYgB4jEQVCS4pjpdzroavABDD8EG0tSbNB1NIMH4qnPzM/dQDca
         B9Oirqf2YM8rr2qxqcHqM0vArrs54VusA7av7UhJ8G33LqbzD9mC5UMNxP+8Ev3Bqna1
         6GwaX1id9rfxDrmOKtVzIXAWu3mBLJtoL/BJ7sLAe/s7HkiE17GWs9ZIzBiORPg4VyG/
         OocG2sWH0R9mAMohHkTTtCKVJ4qRBdPMdujgRg707vKkRedHWtMHQoB7MMR+nGx9HJFl
         28VVu7tRjE1iD8UXPtqRdnKD1OMD9RtcD14Bp+FdLqg5SX3mBdboKyDnE2+CPzweYS/J
         5mzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=AZ2OVkdsdYpG7x8BofXhPCXs/4ytZe81MvtGAIcUXxQ=;
        fh=u3zap9dR9jdFFC9h+Qv4o4gjM0h0KN3Svg7xAqib+uE=;
        b=RHIbmnyMmcfUjivjXvLzHgMtIQwsqDtAtmFE3c/qvKDmNWKFVHsKdhEd5aloW1tCyG
         4sK31oxEo68BupF2MBn10UgAmARRwxLvtW2uJsQRWIrIpvIJunE27abmVPMfrukXZvB9
         UF9SI/WvpsDcEZVsP46IL5cMCdxAEJstBzLDlRhiQJyQXoBKJfdWF5Fyn204GfEd5Md8
         f2RM+N3Duse5HHdRg2Mx1FWOY9Qrjp7iqK/Adkcj9b4g/goGhCAIiILk5cxDmA9j1IiV
         0Xenfrl5bs7vknTetevpTXq3xX5FwgZtFXVSqITBwYrH5hb39nIhEXsI9J6CxHhdaCJj
         Q+9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sryd6DNK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020a0cff08000000b0065aff6c7e59si8980803qvt.541.2023.11.21.01.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 01:23:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sryd6DNK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r5MyO-0001Lk-Sm; Tue, 21 Nov 2023 04:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r5MyL-0001LM-P3
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 04:23:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r5MyK-0001h1-4Y
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 04:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700558587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZ2OVkdsdYpG7x8BofXhPCXs/4ytZe81MvtGAIcUXxQ=;
 b=Sryd6DNK54W14R+8ugO8fgdM+4xBaIKOVLSYP+IFZ/5f7Igz4Gw+NZDFPryAOCZtJ5XHQ2
 7eyT04E6tsHsFHeCtBVi7yZ82kTI2YyG5LPYJI3uTF2t/Tl9Ui8y3T7HZv3thJXFunSy2M
 dI67SEzAGvRiRaQaOj9zwijnAiEuUG0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-QwdKL7lgOb2sCg7w_ykZgQ-1; Tue, 21 Nov 2023 04:23:04 -0500
X-MC-Unique: QwdKL7lgOb2sCg7w_ykZgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72BBD803C92;
 Tue, 21 Nov 2023 09:23:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D9821C060AE;
 Tue, 21 Nov 2023 09:23:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33EC521E6A1F; Tue, 21 Nov 2023 10:23:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH-for-8.2?] hw/arm/fsl-imx: Do not ignore Error argument
References: <20231120115116.76858-1-philmd@linaro.org>
Date: Tue, 21 Nov 2023 10:23:03 +0100
In-Reply-To: <20231120115116.76858-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 20 Nov 2023 12:51:15
 +0100")
Message-ID: <87a5r7a2a0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.035,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /S3vf7hKOP35

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Both i.MX25 and i.MX6 SoC models ignore the Error argument when
> setting the PHY number. Pick &error_abort which is the error
> used by the i.MX7 SoC (see commit 1f7197deb0 "ability to change
> the FEC PHY on i.MX7 processor").
>
> Fixes: 74c1330582 ("ability to change the FEC PHY on i.MX25 processor")
> Fixes: a9c167a3c4 ("ability to change the FEC PHY on i.MX6 processor")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/fsl-imx25.c | 3 ++-
>  hw/arm/fsl-imx6.c  | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index 24c4374590..9aabbf7f58 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -169,7 +169,8 @@ static void fsl_imx25_realize(DeviceState *dev, Error=
 **errp)
>                                              epit_table[i].irq));
>      }
>=20=20
> -    object_property_set_uint(OBJECT(&s->fec), "phy-num", s->phy_num, &er=
r);

This is actually worse than "ignore the Error argument".  If this fails,
we continue with @err not null.  If we actually reach the next use of
@err...

> +    object_property_set_uint(OBJECT(&s->fec), "phy-num", s->phy_num,
> +                             &error_abort);
>      qdev_set_nic_properties(DEVICE(&s->fec), &nd_table[0]);
>=20=20
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->fec), errp)) {
           return;
       }
       sysbus_mmio_map(SYS_BUS_DEVICE(&s->fec), 0, FSL_IMX25_FEC_ADDR);
       sysbus_connect_irq(SYS_BUS_DEVICE(&s->fec), 0,
                          qdev_get_gpio_in(DEVICE(&s->avic), FSL_IMX25_FEC_=
IRQ));

       if (!sysbus_realize(SYS_BUS_DEVICE(&s->rngc), errp)) {
           return;
       }
=20=20=20=20=20=20=20
       [...]

       /* initialize 2 x 16 KB ROM */

... here, we pass a non-null @err to memory_region_init_rom().  Any
error will trip error_setv()'s assertion.

       memory_region_init_rom(&s->rom[0], OBJECT(dev), "imx25.rom0",
                              FSL_IMX25_ROM0_SIZE, &err);
       if (err) {
           error_propagate(errp, err);
           return;
       }

This is an instance of an anti-pattern: passing &err or errp without
checking for failure.  Three possible fixes:

1. Check for failure.

2. Pass &error_abort instead.  This is appropriate for programming
   errors.

3. Pass NULL instead.  This is appropriate when errors don't matter.
   Which is rare.

You go with 2., which looks good to me.

> diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
> index 4fa7f0b95e..7dc42cbfe6 100644
> --- a/hw/arm/fsl-imx6.c
> +++ b/hw/arm/fsl-imx6.c
> @@ -379,7 +379,8 @@ static void fsl_imx6_realize(DeviceState *dev, Error =
**errp)
>                                              spi_table[i].irq));
>      }
>=20=20
> -    object_property_set_uint(OBJECT(&s->eth), "phy-num", s->phy_num, &er=
r);
> +    object_property_set_uint(OBJECT(&s->eth), "phy-num", s->phy_num,
> +                             &error_abort);
>      qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->eth), errp)) {
>          return;

Same.

Suggest to clarify the commit message like this:

  Both i.MX25 and i.MX6 SoC pass &err to object_property_set_uint()
  without checking for failure.  Running into another failure will trip
  error_setv()'s assertion.

  Pass &error_abort instead, like the i.MX7 SoC does (see commit
  1f7197deb0 "ability to change the FEC PHY on i.MX7 processor").

With something like that:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

