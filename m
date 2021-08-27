Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1590147lfb;
        Fri, 27 Aug 2021 06:34:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCg3WXt9qN6eZCbDT/4oH4rOVdWqMaCRmVGH3N2Arl/l+3yzgL8XVo+KtPo74O7lzNA0XB
X-Received: by 2002:a7b:c18c:: with SMTP id y12mr8875339wmi.3.1630071277298;
        Fri, 27 Aug 2021 06:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630071277; cv=none;
        d=google.com; s=arc-20160816;
        b=rSjqkqHJeNsoyG7Y//6zxl7OcJ0qaBWme2izG5ORHM2jKnyBz7sNIjoDk8GJI62qzj
         Ly9RxuY2tdM0z7g39Ki55kp5O/VznxR/LTuceuGYFo9CnYChglv3hIXOWp+Ps4dSAvHr
         Byyy22CJLY7mvnFEX9BUz1l8OKu0K+Ulbmdsn/O/Ldd7vsLfQCWjaHK6T4iyZYuo/PuN
         44kRSgSYrWosBfIYE5gHJa5ngDcqaMixv0uuN/D8GJTut7mwdgimSqA6Y1x9uN6QUfqo
         n8iU+5dz81oeWYP/W56WanTBEWVjcAsrVFVomNXy+hk12c66oase8BA7w4cxeW4cVF6D
         IGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IsP4LK7TFMFvzwQTfXoyqmz55SKCAms1G4WwM4ZlaSQ=;
        b=JPxwQPODThxhcuTs6OB7435y5KNUzecniXSjNzE5Tp3vWAmMCyaSB6/E992wnf9B6O
         ExNG6L4mNzJ1q7pvD5mGi2JRXWh0vUZ6Peq69XXjt9K9mF8swXH4X0F3Fy6IuDP1Fp7v
         zZdr1G/jiShvEK+Spri2wPxFh5hSr435Fn+d0qmu4CxvKVgFenQ7Q3PGBQPv4OZhndIA
         cgrAPHcaAlRgMmdlVueVzlFgnglU+yeaB/i8m7upK/kpTLnTvSKDMxWDZkVpM/vmbcjd
         M6dtZ0KZhsN6BSDfu/ApSEWxcIU/ZCI5ZbuBACxLXgBdhrrWD8OtzvMEgXrMBuBQKWfT
         MO8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LToAHn2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14si7145448wrs.132.2021.08.27.06.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 06:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LToAHn2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJc0C-0004lZ-Ce
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 09:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mJbya-0002T9-37
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 09:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mJbyX-0005ER-I2
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 09:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630071170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsP4LK7TFMFvzwQTfXoyqmz55SKCAms1G4WwM4ZlaSQ=;
 b=LToAHn2LBUYW3TbgZnn7BSKi7xDN0mYvp7TfKGYAPUZ1hgKIWIzIA8dMT+g7a396aeKdl3
 mprzJzW06x1Xixq54PaP9+tN7Hjwcj3LXxuMqKrFDkS/3p7R5vDLzhbEqquIJgAoyUT4jy
 jlBbOulF4N1B1tUK+SF90uP+/lyeD+0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-H9hFAVK3M7qq3qrMBKoaaw-1; Fri, 27 Aug 2021 09:32:48 -0400
X-MC-Unique: H9hFAVK3M7qq3qrMBKoaaw-1
Received: by mail-pj1-f69.google.com with SMTP id
 mm23-20020a17090b359700b00185945eae0eso589165pjb.3
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 06:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IsP4LK7TFMFvzwQTfXoyqmz55SKCAms1G4WwM4ZlaSQ=;
 b=qqgUgnYS+35+EazEuoccu0yPpqS5YV4anl1VEzmpDDmsJ0r8z/TZwOPKU4MIxtlbWD
 pOPG5UHNbYqyQ6GnLlD9RAmBBv5rK4eRxVI6zKzJojdZ0gC5DZtf6hx2eCnbqzRCsW7d
 0kow0CzLvdGh3+sKuf6eouvZgO2G+1fd2PoSQN1j6h1/5mZoka3aurKVY+ZKN4swUQxW
 kW66s+TqO+vq4QvoWDVfb/lF9W3K3IDFlKp1Bd+WYoxGizT9GweMP/FgCKOhDjngaJcW
 W0Ymry6xcJQTGmLTeZxuns6C2xtmBTQNmZyRihcqpWgrjWO36TpfD9TqQSzBZgEbvaBb
 OPww==
X-Gm-Message-State: AOAM530T2y2XK69tmdhp+EIoyPj5/6SXBk6Bj7yr6//YSlEfGWGf7RO7
 1JVCaPgfDk6RuJhqb0U1kmZWaBp4PCLfBGqo8rNFkR83mBF4Qi9yKJWz6kRHtsquw7CNxpYYFtm
 t2U8i1lSxM/PpAr0JsGa5l2kLDN0v
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr23169139pjv.38.1630071167432; 
 Fri, 27 Aug 2021 06:32:47 -0700 (PDT)
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr23169107pjv.38.1630071167114; 
 Fri, 27 Aug 2021 06:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210827060815.2384760-1-f4bug@amsat.org>
 <20210827060815.2384760-2-f4bug@amsat.org>
In-Reply-To: <20210827060815.2384760-2-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 27 Aug 2021 10:32:20 -0300
Message-ID: <CAKJDGDb23P3YDKcQVcHbtgBhsrT6BoWAFropTjuzmE-iwo+KMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] tests: Remove uses of deprecated raspi2/raspi3
 machine names
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pHpXJY0iyCXa

On Fri, Aug 27, 2021 at 3:14 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Commit 155e1c82ed0 deprecated the raspi2/raspi3 machine names.
> Use the recommended new names: raspi2b and raspi3b.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  docs/devel/qgraph.rst                   | 38 ++++++++++++-------------
>  tests/qtest/libqos/qgraph.h             |  6 ++--
>  tests/qtest/libqos/qgraph_internal.h    |  2 +-
>  tests/qtest/boot-serial-test.c          |  2 +-
>  tests/qtest/libqos/arm-raspi2-machine.c |  8 +++---
>  tests/unit/test-qgraph.c                |  2 +-
>  tests/acceptance/boot_linux_console.py  |  6 ++--
>  7 files changed, 32 insertions(+), 32 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

