Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9384483lfc;
        Fri, 29 Nov 2019 10:37:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqwoguinhX4ExhrYLiQ3A2z/wWIXUDdxzfWNdblGW5nAsGn0XkQq4ZLIxToAzjOyLSG6kED0
X-Received: by 2002:ac8:4158:: with SMTP id e24mr36785192qtm.97.1575052648304;
        Fri, 29 Nov 2019 10:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575052648; cv=none;
        d=google.com; s=arc-20160816;
        b=PyZCTmSxNZ1zQuaaOoZbBCV/2PF9+6qWDW/ULEU2sNTnuXZqeBcEam3xzUNnTBG4VL
         G0QH0M2gKpEnCEpl/cv9Q9Fb5W2uVD5tKGl3ebkKW8QvuzQcKpO1NZdNohAne3p3DVTq
         E7KUeRMkFzr93KM9T4+y019pVcv6kx8QQD01YKTrMqMXZlz9bBvTMXSc/NbJFbreW1AJ
         5gO0wgVH3s7Afoa+4U4LimSdwCrsjxoe6oxVTE413pLD7pST5HwFUDV3iaOlIxOWJFhY
         8hqE4mYcVppQW6jaFqd5AU9ZnU5Bp0YCnc/y9vfPjVsFfkedGC5la6YBoJxNkjsKK8oW
         XDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wheawXht7WgF8Gt4GGTrhtQ/+VWwWJoI38JiF2ABqCk=;
        b=Rvkc9jX1QCcLqNDvvPEJBguYBN4odf5rxty64TI0ysoGGxn7TpfHDAE1AUKon3qsYg
         WWIVFdewsIEB47KTYx6WspQwoUyq//C7oXBvdFKypempoBBt80lrhFHJtbc3wt1Rde9R
         xNhItDsFIlihjSXwgPUDrD9fU60VdduY5HP7OBwUd6tm/hlFt5HZTrRXiS/0X6th4/Ol
         iHGd0KkQmuD/F0L9z2H7vTll1b3Zj+6mCxCOLafJ/pb5ThFJ3qYAc6idaHgafqp3dTUk
         K+5tuCKz5wMxDXNjfM5dHmbnQrU3K/AQopbwtQnkpeQZEFLatDfArhVhA5PCiEb/KSCR
         nRHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aiIOUEdb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si14432845qvx.115.2019.11.29.10.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 10:37:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aiIOUEdb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ial8v-0001c6-Lw
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 13:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ial86-0001Wv-Sl
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 13:36:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ial7w-0006IV-Tu
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 13:36:31 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38587)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ial7w-00068J-Oo
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 13:36:24 -0500
Received: by mail-ot1-x343.google.com with SMTP id z25so25580422oti.5
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2019 10:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wheawXht7WgF8Gt4GGTrhtQ/+VWwWJoI38JiF2ABqCk=;
 b=aiIOUEdbOAwtWBrCSfhUeDcqsdqF/90GAGvyHzmKkQOX7w/tibrBArDot4aVpG4K3O
 E6iG7LcdNwlHjcrbycZAUddrzdUtBpG1LaOYZds8UesgCckImrU0f//7Sh0m9pFSj8Rz
 hbj1cwBcz202MtxrzEbJgvUvnZvjrUv+yLMTlkzDkZjgeUOanP3MqcoBl/8pADGqrk63
 nC5C7tLyi3K7wVJXml6wJN+Upegx0nhBvO8OOeq7/k3GNtSf7XQ8yBXE9/9ncO7iutwq
 9z38htnGMEGP9v8e8E52D+VeRNy4+FW8yVQRB1GR772qmX5sxNpfM37ng2S9fXAV5NC2
 rjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wheawXht7WgF8Gt4GGTrhtQ/+VWwWJoI38JiF2ABqCk=;
 b=AhIKCdAmLNPqo2n3Raz4lGvX3LUDS7jh94wyDYTBUfFXiPSeZ5pK67WM994gU3Yxm8
 cHCNQKj/SExXFko1PQYTrdo+j4xYoHO0ArRp9s5V3Pmi16oVXfI4O1VtN9VBMbh17m0P
 vYpBkXdBlS8WAQ22/+wHVlCwFAw4jXNr3Z0U5TtTsHOmvv1YFvn9aRPX/dutW+JCpoyR
 FMxZ5DFoQ1y2Am3YtRZ3K7xfy5c/+W35C/o9imzJSsX1fEyD2PkNPp5YB0J+otQyu7jY
 J+jhZYhgHgM5xcqhRKDvDZgVVmeaHsLEPtyxfls9bZiabiFB7zwlq0wFJzyKBj3blpJH
 GpfQ==
X-Gm-Message-State: APjAAAU7A+f8otNfD+r4RRmn21Ih3SXkn5UYnbNXmHkZUU2AP6uHlS9r
 2gKuvMTwSfTB89W9unpJNR/PCYpY9qaQp6jLsCbAOg==
X-Received: by 2002:a05:6830:1583:: with SMTP id
 i3mr11313362otr.221.1575052581790; 
 Fri, 29 Nov 2019 10:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-5-damien.hedde@greensocs.com>
In-Reply-To: <20191018150630.31099-5-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Nov 2019 18:36:11 +0000
Message-ID: <CAFEAcA9z_Tu3jEABbRVgoZfw=_6RDm8MOQNOYh4qwmQzJjBAgQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] hw/core: add Resettable support to BusClass and
 DeviceClass
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-TUID: GXKUTJTu2zCy

On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> This commit adds support of Resettable interface to buses and devices:
> + ResettableState structure is added in the Bus/Device state
> + Resettable methods are implemented.
> + device/bus_is_in_reset function defined
>
> This commit allows to transition the objects to the new
> multi-phase interface without changing the reset behavior at all.
> Object single reset method can be split into the 3 different phases
> but the 3 phases are still executed in a row for a given object.
> From the qdev/qbus reset api point of view, nothing is changed.
> qdev_reset_all() and qbus_reset_all() are not modified as well as
> device_legacy_reset().
>
> Transition of an object must be done from mother class to daughter
> classes.

The standard terminology here is "parent class" and "child class".

I notice you've used mother/daughter in a bunch of other comments
in various patches -- could you change that to the more usual
terms, please?

> Care has been taken to allow the transition of a mother class
> without requiring the daughter classes to be transitioned at the same
> time. Note that SysBus and SysBusDevice class do not need any transition
> because they do not override the legacy reset method.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
