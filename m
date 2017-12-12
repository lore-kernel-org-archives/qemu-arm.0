Received: by 10.223.159.74 with SMTP id f10csp4075709wrg;
        Tue, 12 Dec 2017 09:22:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBot1tdUwt8bA1rfmcfbK2g0i6jEgZe4p6K6YW/Qkv7Z8bq7u1AOh8j+qnhLJYNoDRGNYZxeU
X-Received: by 10.129.81.147 with SMTP id f141mr3462911ywb.194.1513099367472;
        Tue, 12 Dec 2017 09:22:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513099367; cv=none;
        d=google.com; s=arc-20160816;
        b=cE2Y1mGH8r9pFXum0TglWPolJo5kUydTJNmrZCetx+nFkqA5AN9rp3UaAGL4Ulsdiq
         ijr09bSq118qHM9AH0S7bJUSgbV6MABR5YDzWiH4gm7y/wmGgraBavA/FfpEwIFCCKf+
         oA4NH55CuAx1KnICOFHw05mm+IWHYwMStp+fCuQTxlh7txuXa/7uxho4gN+YRXpTkpc6
         PrRsWjRAHZufP9cm+buyGSRr6mWNXHzdF6CpCyU7ElkE65xAOiK0Nx23AJVPgtDcIzo2
         w17bJvmqh9fKWJ82hAnctopGzjgGQlOdMwYn8DuhRgVyG2aeltB6HDrRioGptEOAA/Y/
         MDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=/XRrAmAt87ZG3QpNK2cUtroZY5BatJCFfXajhPAtN8o=;
        b=PQ1N0MruqWQ5smHdEiQO6Mr2OeyEn84um/Ry0/36cTNS79oEu2LYw/xCY6gFkr4ttz
         CXpHYsUu3sxQoRkpusNpS+Dpr/5nQ3tQoo4RSBsA+N3maTFakoC0nrKxCNDtxwxsHPmE
         C+TE14fP7+hVSOiwNc9JuIbG6WZYhi55UJoG6cC/kQnDKGEqSe94OXMqXkXWYJ7KPcJ1
         wnc9j9+SW9XYxcYyEE2EREjN54/pTO/nVfa5vPzUYY3B4Nx+dH0cH2GtMEV7AnFcWGG4
         rMN2KNLLCQ13qynEUUilZkZlOQqh4v7JUdWLKNBvOdahFgAWzGbR6QYRUoeRSKNXnJ3U
         G8lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EKeL7d2l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v137si3444897ywg.348.2017.12.12.09.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 09:22:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EKeL7d2l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59665 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOoGU-0008DT-TL
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 12:22:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOoGH-0008CD-If
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:22:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOoGG-0002Wi-HS
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:22:33 -0500
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:35775)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOoGG-0002WH-Bq
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:22:32 -0500
Received: by mail-ot0-x233.google.com with SMTP id q3so18437758oth.2
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 09:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/XRrAmAt87ZG3QpNK2cUtroZY5BatJCFfXajhPAtN8o=;
	b=EKeL7d2lbZvUyxRzKOoz8w1EeQaTEc2y0IZgQGRRwEB8LMTCySQ3kuc5oTMlppPU/D
	tRfX/e9PscH4pZ58VGCLONslHUxY2XIZNFXFdXguly5DVOF+oAUzyh78e6OamkUwdzqC
	3XDrsk7WZzYaRqtpTxPFUOcSXAbsZ+VKV/QQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/XRrAmAt87ZG3QpNK2cUtroZY5BatJCFfXajhPAtN8o=;
	b=nLmB3W3057bZ9ADl/Ni/7mL63QRqlMwa6jp/b2w45FN6HL9KxreWDZj6P27e6iWNvc
	+cmUlsYhayCQdWiWzCCf0CL7fVm1Jr9CmQ2tFQbH/rGD1u4WLRV+CkWwW13gMee3FnnN
	UfUO5yrBYsDM+TOkrCMkfXJCvFvsj1c87xqYTH48+kQ922e66CfT0Ytz6L5GweGbQfd6
	091W2ZRjhgqwIF21Afer615CeqqY0psg6qiuOXMnvzp8LAb702vLaNV1cvVM5Pj7TbW7
	MRrmlSPrBUfy4qD51Pp0K0nHo+igcS8r+DVXb/hUGpy2+Lm304EMBHXWN2A6V/6zUT4y
	vigA==
X-Gm-Message-State: AKGB3mIwqu26ro9+E6SQWOl4aChIBMBAyle/5vO3DgjdnTPp7srxkXsJ
	7VdYiIphRd1sWP8Jrd8A+LVxC4ntcI5EObT0mDaEKw==
X-Received: by 10.157.13.168 with SMTP id 37mr4185251ots.197.1513099351497;
	Tue, 12 Dec 2017 09:22:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 09:22:11 -0800 (PST)
In-Reply-To: <b8fdafd1-d8d8-056f-681e-d5469dc79edd@amsat.org>
References: <1512154296-5652-1-git-send-email-peter.maydell@linaro.org>
	<1512154296-5652-3-git-send-email-peter.maydell@linaro.org>
	<b8fdafd1-d8d8-056f-681e-d5469dc79edd@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 17:22:11 +0000
Message-ID: <CAFEAcA-ON_8zKaMeUMf84gtFTYeCMFQzJahnA=kXXTkh-yHEmg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
Subject: Re: [Qemu-arm] [PATCH 2/2] nvic: Make systick banked
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BmEHW16Lfdpi

On 5 December 2017 at 04:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Anyway:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks; I will squash this diff in when I apply to target-arm.next:

--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2068,9 +2068,14 @@ static void armv7m_nvic_realize(DeviceState
*dev, Error **errp)
         return;
     }
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), 0,
-                       qdev_get_gpio_in_named(dev, "systick-trigger", 0));
+                       qdev_get_gpio_in_named(dev, "systick-trigger",
+                                              M_REG_NS));

     if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
-        object_initialize(&s->systick[M_REG_S], sizeof(s->systick[M_REG_NS=
]),
+        /* We couldn't init the secure systick device in instance_init
+         * as we didn't know then if the CPU had the security extensions;
+         * so we have to do it here.
+         */
+        object_initialize(&s->systick[M_REG_S], sizeof(s->systick[M_REG_S]=
),
                           TYPE_SYSTICK);
         qdev_set_parent_bus(DEVICE(&s->systick[M_REG_S]),
sysbus_get_default());
@@ -2082,7 +2087,8 @@ static void armv7m_nvic_realize(DeviceState
*dev, Error **errp)
             return;
         }
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_S]), 0,
-                           qdev_get_gpio_in_named(dev, "systick-trigger", =
1));
+                           qdev_get_gpio_in_named(dev, "systick-trigger",
+                                                  M_REG_S));
     }

     /* The NVIC and System Control Space (SCS) starts at 0xe000e000
@@ -2161,7 +2167,8 @@ static void armv7m_nvic_instance_init(Object *obj)

     sysbus_init_irq(sbd, &nvic->excpout);
     qdev_init_gpio_out_named(dev, &nvic->sysresetreq, "SYSRESETREQ", 1);
-    qdev_init_gpio_in_named(dev, nvic_systick_trigger, "systick-trigger", =
2);
+    qdev_init_gpio_in_named(dev, nvic_systick_trigger, "systick-trigger",
+                            M_REG_NUM_BANKS);
 }

 static void armv7m_nvic_class_init(ObjectClass *klass, void *data)


thanks
-- PMM
