Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9407576lfc;
        Fri, 29 Nov 2019 11:02:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqx4bmSGhe3llO5zVCPRznLdxAKFxAKuj6lduTmMyzhTOHSnrev1oV7yoOZbss23tW2QqG/+
X-Received: by 2002:a17:906:a28d:: with SMTP id i13mr46218568ejz.154.1575054149658;
        Fri, 29 Nov 2019 11:02:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575054149; cv=none;
        d=google.com; s=arc-20160816;
        b=KCB0rEZ6lbtGsCWoLuV77UYRTksG/f9e3mLj+ytvxt65pqSmFxCZxmNbo7DiSnQ6Tr
         xOF3mjCzS2Zf2jfpBWnN8tIypPnqqxqjZAdo/UZKm9vV8YGffXT/60qnLG05scWi6gi/
         A+w3Zk3OnuIbAroXz1eB5ZZr9Yp8O/uqANi2Z8rqFBOJbWaIYkDbJjUNGlPInhpzgdLy
         BctXhXNU1WzhMyVf8eCzmfLuk/Zy7YMofTJVNyuE27AuPoy7y7XV6buGGnpPyDYZ11Nx
         TyRv4tSg/UViWdcg9ZYXzuz8lF/vv2mrQy4TJlL8zKexbmvUDEU26xPqaQwKUC/voM5J
         GJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PwstR7XPWAEau24OphkQepHt5ecvZPpZxm+5ZCeHSyk=;
        b=CVdnDutpx6Jk+wcJnCpSI1AE84XE+f0HY2/Qp6zSVswQLVfVoUhyWVxJDVQ1yAO/1K
         OQOGRfPtgUtK5u5NGpzpq3/77TbVLhoozUNIKgnLjmzseV0aWwNI7vQRppYfAlIIgKhu
         INe8HkCxLSvwyK6AuGysJcVoUrc2V5REg6CLNyt+mZ8CYtymgUv+r3H4ApfmEftCEdHP
         ocSO9ufo2cOum5d15UCXQH3mY5ITOqFvKazsaWKeuvUFsyoOUcIm4hg2vPV6TeenrzUN
         NSmz1lztgtQarOjWx0gEnjeBV7LcA/bTxpVILXYM0pn5tSYvtwGuF6U4j4BF7jaGwDUq
         xj8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="y7JoXk/b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j23si15385104eja.393.2019.11.29.11.02.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 11:02:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="y7JoXk/b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ialXA-0006Ot-Nr
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 14:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ialWs-0006Ml-AE
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:02:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ialWq-0001dD-U9
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:02:10 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43380)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ialWm-0001Dq-HU
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:02:06 -0500
Received: by mail-oi1-x241.google.com with SMTP id l20so26858290oie.10
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2019 11:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PwstR7XPWAEau24OphkQepHt5ecvZPpZxm+5ZCeHSyk=;
 b=y7JoXk/bAgn6toKzBevyaiA2FGizDQDWvVb9YovZa6Az9Zihy1ZpTg8JP4ak7xWpfU
 9pPmou8OHTMCyLiPE6YhQLO3DxQKaSUefMO1K8lQBf3PYbbMmOWa26LFyxXgi+ALrKXu
 NOFIXAkF3SnEElKrdNlxIB4NpuKg8MPSnSCv0udbYr6gx6Rv3g9RU4k6+dedy0Gx6u7m
 XVJcaL/864F1B9AALlEX0datsb5mFh9nLOfPVoX5gLYBvEU2ujZlXRiY+wns8oc0fo+v
 SiyJnv2KXKjLcbXNaNK8p8u6mRY5KHJFSP218c+DW98YZvHVE+i1fX3cwzlMyPexbpea
 2kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PwstR7XPWAEau24OphkQepHt5ecvZPpZxm+5ZCeHSyk=;
 b=Y65NmWG1renClr+hErp1FnNusUdyzha9hywyxj6mTQrstQw4yKnwpRDndW6FXf7xDq
 MpnC6dfoMysS5/iQoFN1gkqZe9SSps7rz/zfemnUNIqQfoXQXOUkCfgEWXoohz0j7hm/
 oIojjgBqLe7pEhSfoG6M2aki27C2SeV1X8D4Hsx8Cx2A/lbw68eBvkEagc7pYulEaQyW
 9y1eELFQ+CmYxDYwUrchWq4eq0sxijjU6mBq/IHtOzRJ/qBOmStJpmywZLuIaL2UArK7
 PtwvuBglgrMUITSFppFOczwyE7Mlda++jXWkJN6NFd//ZC727PPIrfmF7RvxmFEJxu+r
 9hZA==
X-Gm-Message-State: APjAAAWYgpTGJiLPcUyj6ZKN8Z0W2OnEnsZIYc7KbqHPjn4zRKgEOq2j
 hANMamoQLkxI95aA8XpB4nrcNfNVDvVnB1uOpr0Rew==
X-Received: by 2002:aca:edd5:: with SMTP id l204mr1999749oih.98.1575054116608; 
 Fri, 29 Nov 2019 11:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-11-damien.hedde@greensocs.com>
In-Reply-To: <20191018150630.31099-11-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Nov 2019 19:01:45 +0000
Message-ID: <CAFEAcA_TJSSoqd+gCL=r9b_W4mpFyWOOb0ouLiXP5k16L0TOZA@mail.gmail.com>
Subject: Re: [PATCH v5 10/13] vl: replace deprecated qbus_reset_all
 registration
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yvv+iprFLBal

On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Replace deprecated qbus_reset_all by resettable_cold_reset_fn for
> the sysbus reset registration.
>
> Apart for the raspi machines, this does not impact the behavior
> because:
> + at this point resettable just call the old reset methods of devices

"calls"

>   and buses in the same order than qdev/qbus.

"same order as"

> + resettable handlers registered with qemu_register_reset are
>   serialized; there is no interleaving.
> + eventual explicit calls to legacy reset API (device_reset or
>   qdev/qbus_reset) inside this reset handler will not be masked out
>   by resettable mechanism; they do not go through resettable api.
>
> For the raspi machines, during the sysbus reset the sd-card is not
> reset twice anymore but only once. This is consequence of switching

"a consequence"

> both sysbus reset and changing parent to resettable; it detects the
> second reset is not needed. This has no impact on the state after
> reset; the sd-card reset method only reset local state and query
> information from the block backend.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
