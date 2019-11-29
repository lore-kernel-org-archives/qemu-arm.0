Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9408524lfc;
        Fri, 29 Nov 2019 11:03:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqxuD5pVu7aCcxc3KpuiuLWBvjdv9oGLAhAq1vGO/imWo5ZP5volipfoFkxWiniijlYFwvod
X-Received: by 2002:a1c:2e54:: with SMTP id u81mr1904392wmu.1.1575054192097;
        Fri, 29 Nov 2019 11:03:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575054192; cv=none;
        d=google.com; s=arc-20160816;
        b=sUhq+8NHSYIEzW3k5gmOk+y8Ih/f0NGFAbu3CswuOa2A3+lDVS3qmJy7E4JUL/txwG
         uGsfuwd/yEzGO7J6ubeD8+h2MsG2Id7Iq8H92Y0ZYKAq8DICigfGkvoKBB+yVcENEtaR
         PL3tGTpfVhdOdiLB/VL6W7aWU/IL9Xoo0ZiE81lqlMG+nsvOkb1jbD+NkXYm/5KXzlXk
         bcjckb6u/PNTB15h+M5+RyQW5vvguwM5veVVy5PGdufd6w7F/Wgib7kwvSrtfOyNIjW1
         GwuWHfEUYLQDn00fhFTtOSUaCHX58iUiUJrxlpKovDbhlzXekMwW7nNUkymyyoK9ybKe
         NpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+iDLHxD8YGQA4kV3gvFj4LmmDNH7bc4343SpvsQUuHs=;
        b=i9SCy+xzNuNwK2rul7WX2zz0CR5THrmu8GAC9LTeTp5MXtYfZ6lcT+E/AG89gJx3yw
         vGYAvoIR/DaBHKNGhaFVuRF25ulLz/4inqUX0JbuzgOaIQm0V5EJCftZnKVIexxRoZ5l
         0hqXtjOGv/o/KoVw65w9M1mC5PlTLJBVYcYxabArr5RO0zxxMtRaGmYVLz/m0YKxh2T9
         bRIxwdCLF7DxRQvoCD73qiZiPW5tXSpw9RGg/TL6XTwW6nyxYyFTKnYUcnm1hLXmOewX
         3/SVyADBdfOsSv/W76rrjI6wpwIchR4eUmkGQLLoT4FQa8AtSI12ylyMF4tG40I1Z2Is
         uOwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="s/f/yjE1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9si15068576edy.221.2019.11.29.11.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 11:03:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="s/f/yjE1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ialXo-0006w5-Sg
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 14:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ialXB-0006t3-RJ
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:02:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ialXA-0003LU-Qp
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:02:29 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38807)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ialXA-0003HA-Ko
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:02:28 -0500
Received: by mail-ot1-x342.google.com with SMTP id z25so25636914oti.5
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2019 11:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+iDLHxD8YGQA4kV3gvFj4LmmDNH7bc4343SpvsQUuHs=;
 b=s/f/yjE18gDrW+6RUtlChtgMnYf7+OHHc3AZFErYFyw855PkBZiEN1++9MOaWgbVXD
 uzS52uSV/KPMKqul9YpjsMHTUK8q0ypvBfjjNLdIWYuxQ26Gg0WiR8stx55X2DvbkqYj
 G5cS5zIzTdrjIKf/CjfBS16KSXEXffAF8x7lkYJl6H1izRTro4y0gVYNv36oZs0WqtwP
 kXpy/WRHMZnMFVEtqllgkSQXnRP64TA6ILs96xl2Mi3eZdwPZYLn9jpmH+O4yIR7DN2/
 UQct35H0CKo3hkAA1odHSC3Xx4rKl/hE+ELkDZRT2GHKzqfW8OVYKQrnGpGG2o1pzcUm
 A3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+iDLHxD8YGQA4kV3gvFj4LmmDNH7bc4343SpvsQUuHs=;
 b=OhsXPWzNymmqNVUM3klbF1mcg1hFNJvGl1yWMk0JYyFZj7WRmMeqTE9Jk16OoJndmK
 OL8LRLLsOnqj0rUh4IpulEHBMX+Y+K+2hpghLhet4ent7/Cmzc4FEnhud5lf79c3FCXz
 GUfU4WKXHCREIMcFJADskSyWuaGU3VbgbnwMDpGWnOPY1VPsxjE+e67BJRrRw4pn619y
 FeHaKb8SLlwECTzlC4Rfxl7KwYUsSvwDPc09MH4TwJKzz5T6xBp0hkrntqI1V4BeBU3N
 K+LgC+xWYRRcWKG918EL+RSN+0ttOUovSiJlQ3xxGPgdHUYCkwcb1E8cCAP8w/6QqqPL
 5QxQ==
X-Gm-Message-State: APjAAAUWI+JMzqnQRtKznhTfataDZEk62ebz1cRCjBNQeUsXLGF1An7E
 hr4Ew0B1NtBtbUIYPTvX51ksD0DrSs+y8vk7piafkw==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr12639617otg.232.1575054147728; 
 Fri, 29 Nov 2019 11:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-12-damien.hedde@greensocs.com>
In-Reply-To: <20191018150630.31099-12-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Nov 2019 19:02:16 +0000
Message-ID: <CAFEAcA_MSK2mLcg6amqE=GdvQTvxLUYMjOH23Xgz9_w_KmsBDw@mail.gmail.com>
Subject: Re: [PATCH v5 11/13] hw/s390x/ipl: replace deprecated qdev_reset_all
 registration
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ogOIIpwTjB+

On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Replace deprecated qdev_reset_all by resettable_cold_reset_fn for
> the ipl registration in the main reset handlers.
>
> This does not impact the behavior for the following reasons:
> + at this point resettable just call the old reset methods of devices
>   and buses in the same order than qdev/qbus.
> + resettable handlers registered with qemu_register_reset are
>   serialized; there is no interleaving.
> + eventual explicit calls to legacy reset API (device_reset or
>   qdev/qbus_reset) inside this reset handler will not be masked out
>   by resettable mechanism; they do not go through resettable api.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
