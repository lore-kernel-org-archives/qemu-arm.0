Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp728979lfb;
        Wed, 11 Nov 2020 12:05:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOz01Fsg6rABezHbEa8n2CoJzP7PopVxKD6jk5AkE+R1w9UGrw0AbZCcyTkZwyDmZU+Rbr
X-Received: by 2002:a25:9104:: with SMTP id v4mr11282955ybl.109.1605125117997;
        Wed, 11 Nov 2020 12:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605125117; cv=none;
        d=google.com; s=arc-20160816;
        b=jdEronQmlS5UeixK/LDPB05gi+N5Wok3I5eTDIJP+dYSJ1+3Y8yQJBcjp/123Q5iRk
         +0lmPk+XsRP2P/eAGso6YOS2I+G4vO+m8giQqlHFBO5h6f6YxgQwMV3yhVJJxLpWWslv
         GndB/YiSIEY7f2tjJG7H3gHR9lTFLeaUB3EDHEvySPZYf2uSqnFnuNYZphfbKL5HzAP8
         dG29ropSfG6LPWSL7R9u4cKkK1QT+LudLsajQJoMQE2mkVAbytamURYQzmWk0QSCZ8oS
         rnHWBeeTiSvEAZTWBWx0J/+wDJjCGIngAqoBSH+Ffp+gDuwcSYp6K6j0/teEJI4F03sx
         vw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E8jPwQCOEgOvApHbsFfHrygGy294j7/32Mn7bJGcAsU=;
        b=ZocFP8FlPznZDfze84Q2gcqgFAYEjtDItdz+vI9NMvWUpJSRMGmMIUrF9uYKhE2juJ
         +bISXOnXIvnLfOcbaN0xsMnRyoZobU/HPEpqXGo5U+GhWRJ2fMo35ZqLhRllAF+XlNOb
         J4dJDto8og53HuGLeCRA8Waac1shEs6h4xc2v/LQsRd3PdNDe+CcwdCk7fsXZJqdfINC
         dnQnLfEJiyOpJsNu7uYS3k+dQv5B5aVHMPbP+iFZKcPUWNtHIHu2cuu9rX6Hjdybo6VH
         Og/FbkdYWugPrWja39qisTkW75pgq3i8GrM6AcaJ2AqJZRaopdUKLZTrm8WBzDL+cMqQ
         Ozwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=axw8QPxX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si3173481ybc.308.2020.11.11.12.05.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 12:05:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=axw8QPxX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcwMn-0004xt-8Z
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 15:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwLL-0004w7-Rl
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:03:47 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwLH-0000Ti-JH
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:03:47 -0500
Received: by mail-ed1-x544.google.com with SMTP id cq7so3634847edb.4
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 12:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E8jPwQCOEgOvApHbsFfHrygGy294j7/32Mn7bJGcAsU=;
 b=axw8QPxXgVIsECF0fr8JqSLT4m38WJYB1qmhIp6KzaAuV+Y1gn8DwUUxjkUtsLcN4P
 hLlA+A9D5bVeE4etC70ebDaCJddC08CgxaMHEQ54lnJMxHcSMQZPkva1PVVfPikoKmBr
 cjBaqPt+HdMj9+xQPAfxPTkcKngE9T1tO6xOJYyXx1mc7rR/g0QxL5fMFu04tI7gI2Zh
 OoiE9/sxhM0IsjEIEbWaJbZuoI7IEyJge9ploBrStfWoj/f10js6cW6/E8VxjGa53CzI
 mUii1nW9eC6shKB7r9UCFTyZ7H8v5D7Ihb9/MBER+Mq2eZAsBKSiHoX0VlM7IjZNeEmO
 oarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8jPwQCOEgOvApHbsFfHrygGy294j7/32Mn7bJGcAsU=;
 b=CRXySNIYRB7pLfd3494ucKUmb0hUOwJFx4/7EWw0o0elDMUHZLaqv4uDdVRd1VFNAd
 9xC3T3BJUsUwi5ixFLyucI/ARzSSFiqz1plqALKNHj++s4Mcs0LHS28RZJ8Nv++ZQgh6
 NfE5Y2hyVro23pBTTXvYGLsdOX1zKF0QzzrKKrp5c03C6A7KWAmoa133XKv3SGQY+0b5
 co9U7DhWm7v9n0rYsRGKlW9smdXGODknlf3bWL/mx24nf/MOqUwK4xaWzcZvHO90k19T
 0ZKjriYmsKcwOQjUz80aeeFx34ufW6l7ykbS3IWC7pkFSOLWRpd4ickADEKmYG5cjUbB
 EOiQ==
X-Gm-Message-State: AOAM5301ruePqZvgsgP35mwzf6Fyhc/APfE7GOHuRKUu9cLZGXwcdvV9
 DHME6f6ZU+OPsvWinucHBuviCmkAE1WgOU3DHxqitQ==
X-Received: by 2002:a05:6402:30b5:: with SMTP id
 df21mr1297243edb.146.1605125021947; 
 Wed, 11 Nov 2020 12:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-6-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-6-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 20:03:30 +0000
Message-ID: <CAFEAcA8OzhPt+DYnvFpZEe0=se+M35Q8DVNgfcSOmaY12yGAVA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] arm/virt: Register most properties as class
 properties
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /T/j0FwSIUlk

On Wed, 11 Nov 2020 at 18:39, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/virt.c | 76 +++++++++++++++++++++++++++------------------------
>  1 file changed, 41 insertions(+), 35 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 27dbeb549e..53fcaf5e4f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2484,6 +2484,47 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>          NULL, NULL);
>      object_class_property_set_description(oc, "acpi",
>          "Enable ACPI");
> +    object_class_property_add_bool(oc, "secure", virt_get_secure,
> +                                   virt_set_secure);
> +    object_class_property_set_description(oc, "secure",
> +                                                "Set on/off to enable/disable the ARM "
> +                                                "Security Extensions (TrustZone)");

Indent seems to be off here.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(Side note: a 37-character function name seems a bit unwieldy.)

thanks
-- PMM
