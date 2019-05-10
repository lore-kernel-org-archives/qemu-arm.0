Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp253377wrg;
        Fri, 10 May 2019 13:53:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzr18Xa42WIceVXB+6AzmdgxcTX9n0aXu3F+Tp5Lx39fhwZHx3jMY9BZRJqgt3AwI2CSiK/
X-Received: by 2002:a50:b18e:: with SMTP id m14mr13349387edd.234.1557521625816;
        Fri, 10 May 2019 13:53:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557521625; cv=none;
        d=google.com; s=arc-20160816;
        b=xlt0vk1KqEYcoTKy7a1s73TfpMNy6lFjCz5E+fc9WQUSuAJa/68BLqNP5AgpsyMDPL
         G7nql9xtvKBpBxDxvzMZXTZGwiAHXQepd09LcNfcpT151VJO+TVL6pJY93ALzSal5RQD
         b72/OyVb/F8MT4hks50jFC9v+Uv+ZLjNv2MVzQsCOAUAHIEoIvk2JZ6/aGKcB13Lm8JZ
         0Iy6pWcAV1f8zt4bB4ATfMtGCeOtNlY1mUadpjDv22KCpZFBsGmTqRXKP2IGplVVUE6+
         68dOGksvFM6sc4vl/E+L0xuymcMrd0aeb7ArGzFP8SloxQN7WDILI1jaEsMrzey6u6hO
         1dng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=V4FO/4vDfUYXhv0hUf0VkpD2C+NuA0Nhc2FW6S1ZLPE=;
        b=QUIUOltuadAzNsntGbksch5O5+JXXdHZkPpUnRcKT0K8ZK0pdmFbx6tptQmUogd0rO
         q+o/yYv5PEeow0NsY6MQlCliiql7XgvYLb5kRf7UPOvSJN2e5bo0Zp2X3SOn2q5H5M0Y
         9x1cZbEtprGqjiNkXh0q6VuY5hKnvjd647/jdpFk2q7iaKK5r5NxkbRZyyplOl4xDsAi
         frcy974aDFPpoIJEOCo6jnytjDk2ijCqmtysuegcmu6uY/UEl5C2gM6eST/gTXiSWrNg
         fZITApG/Y+CXrs9rn+7W9cNF9OXSYIPeilQLeU6xCKgbdu15M0kIr4kEyhTwjtmRImZe
         jXWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aBviLL1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si382325ede.239.2019.05.10.13.53.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 13:53:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aBviLL1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:49823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hPCWW-0002qv-M3
	for alex.bennee@linaro.org; Fri, 10 May 2019 16:53:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hPCUr-0001jr-V1
	for qemu-arm@nongnu.org; Fri, 10 May 2019 16:52:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hPCUq-00046y-PJ
	for qemu-arm@nongnu.org; Fri, 10 May 2019 16:52:01 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:37477)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hPCUo-000425-8T; Fri, 10 May 2019 16:51:58 -0400
Received: by mail-lj1-x241.google.com with SMTP id n4so6199091ljg.4;
	Fri, 10 May 2019 13:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=V4FO/4vDfUYXhv0hUf0VkpD2C+NuA0Nhc2FW6S1ZLPE=;
	b=aBviLL1LffFjlUPTlOrkIPYWamZFF+z40+aaxA5agV21Oab4LKj6j/QP414LyoH6J8
	kEjmQtOfuoFzbUfjXSHEPli4sU/6FA2KIHc47EHeCL4X7bovL23/J30Th7/6fRqhYdVu
	dWnJUoIL0vJXe3qFbftHWuD93+hLNXGHsRjqd8AdRjfoT7AxZeFfftrsa7jLx9IvGNDI
	SazUqTnmrGIu6uMxbh+vethmsCX8uTHVfscpRatqKrBtg6sZ6Yhgqiu8ju8jiyF5PVkE
	WbudynB54437gSjYKL/ZDbH0iu6eELb4fW+b/dH2XwridFZeyln1dyIzSh6//Rvz0S76
	4ACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=V4FO/4vDfUYXhv0hUf0VkpD2C+NuA0Nhc2FW6S1ZLPE=;
	b=DPc7vAE0JmeR86K3J2UzhVH1UdZKR0o4lRIRpWZcJfml9rP7psg9Y/x4woPHqqS3IO
	SyMVsKpdLZCHQ/PT7CvbdtCLSowBTswx6FTxAqBmAvOY97aQcNN87EGa5VV5qI6KojCF
	3M1ISZqMcUgoJUAOnu4oyDKGUoPZ9mP8eO7JHAtJPdGreKyPAOJIwx72ZrE4DY7e3OLO
	amaaH0AUgFL+BU2ji0c8/dA02F+KwtH+NnBKLCm4UBnTxIX5z17zdOwxVGfP8S1iKJ/I
	5Fmri5XYQ9xyuDTVi5ZdDN0zZg4Zgm3muocp594BjDpsOBjI5ohThZ1G2pHpG0G4RpEp
	yJDg==
X-Gm-Message-State: APjAAAVUsmrEUSBoT3gxEOXN/VgFfHkuNkWMRE4g2p/QNY8sOW3hyISn
	vgqR3hvR1E4MRlc0HJi/Z2snH20zfWNZd2Z7ZRM=
X-Received: by 2002:a2e:824b:: with SMTP id j11mr6832502ljh.197.1557521516851; 
	Fri, 10 May 2019 13:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-17-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-17-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 May 2019 13:49:48 -0700
Message-ID: <CAKmqyKN_rKoPCf4Lk+v4Ly0P0gvp0gJYJSqm-ivWdE5+wFXy4w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 16/16] hw/intc/nvic: Use
 object_initialize_child for correct reference counting
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Paul Burton <pburton@wavecomp.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Joel Stanley <joel@jms.id.au>,
	Antony Pavlov <antonynpavlov@gmail.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z65ldneMXnUu

On Tue, May 7, 2019 at 9:48 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> As explained in commit aff39be0ed97:
>
>   Both functions, object_initialize() and object_property_add_child()
>   increase the reference counter of the new object, so one of the
>   references has to be dropped afterwards to get the reference
>   counting right. Otherwise the child object will not be properly
>   cleaned up when the parent gets destroyed.
>   Thus let's use now object_initialize_child() instead to get the
>   reference counting here right.
>
> This patch was generated using the following Coccinelle script:
>
>  @use_sysbus_init_child_obj_missing_parent@
>  expression child_ptr;
>  expression child_type;
>  expression child_size;
>  @@
>  -   object_initialize(child_ptr, child_size, child_type);
>      ...
>  -   qdev_set_parent_bus(DEVICE(child_ptr), sysbus_get_default());
>      ...
>  ?-  object_unref(OBJECT(child_ptr));
>  +   sysbus_init_child_obj(OBJECT(PARENT_OBJ), "CHILD_NAME", child_ptr,
>  +                         child_size, child_type);
>
> We let NVIC adopt the SysTick timer.
>
> While the object_initialize() function doesn't take an
> 'Error *errp' argument, the object_initialize_child() does.
> Since this code is used when a machine is created (and is not
> yet running), we deliberately choose to use the &error_abort
> argument instead of ignoring errors if an object creation failed.
> This choice also matches when using sysbus_init_child_obj(),
> since its code is:
>
>   void sysbus_init_child_obj(Object *parent,
>                              const char *childname, void *child,
>                              size_t childsize, const char *childtype)
>   {
>       object_initialize_child(parent, childname, child, childsize,
>                               childtype, &error_abort, NULL);
>
>       qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
>   }
>
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Inspired-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/armv7m_nvic.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index fff6e694e60..2334fe51426 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2568,9 +2568,9 @@ static void armv7m_nvic_realize(DeviceState *dev, E=
rror **errp)
>           * as we didn't know then if the CPU had the security extensions=
;
>           * so we have to do it here.
>           */
> -        object_initialize(&s->systick[M_REG_S], sizeof(s->systick[M_REG_=
S]),
> -                          TYPE_SYSTICK);
> -        qdev_set_parent_bus(DEVICE(&s->systick[M_REG_S]), sysbus_get_def=
ault());
> +        sysbus_init_child_obj(OBJECT(dev), "systick-reg-s",
> +                              &s->systick[M_REG_S],
> +                              sizeof(s->systick[M_REG_S]), TYPE_SYSTICK)=
;
>
>          object_property_set_bool(OBJECT(&s->systick[M_REG_S]), true,
>                                   "realized", &err);
> --
> 2.20.1
>
>
