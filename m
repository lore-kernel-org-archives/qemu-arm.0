Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp252734wrg;
        Fri, 10 May 2019 13:52:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxiJKJMUgD0qGJNaoBOqbnzMlWnqpNZbxptOTL+k+znaWvm7uSK62rfJTVfzwJRNjAZSCV+
X-Received: by 2002:a17:906:110c:: with SMTP id h12mr10666204eja.215.1557521562590;
        Fri, 10 May 2019 13:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557521562; cv=none;
        d=google.com; s=arc-20160816;
        b=lw8rdujQm8iaiqK0I+BKqT3VkOUGtQZlpMMHJiPaChCcSGsMo1aKRRQdX4u2gCOBqC
         bDZWQA6eWrc1dT2jjmd4RUAeBKVx578F0tgbFU1tNex0aoY6TZGiSCJhsKgj3jkVqmxs
         J+eGIzHIJMqbvz6rCCpPI1/99fBBuoI80Fb0oVuZw5agDpRHXIC18uZVpcTERlejJz7v
         gU+0ntPxBVYj1x/7nE/ele+VNuLdZulYw3xbQ9cHHE37d7kVCQXPxVka3+vO2SP8UtIP
         Q8C/l9j+p8QjNH3sL15xLfa3rpOelQ2hx48nPR1jcvRCGeTaJBiv+FlfO47Ugv8T86CN
         IoJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=6fAiRzgNXrfYcpso+96yNIf18bf+QqR1W7fdgjYw+40=;
        b=sGS1oH1zpzwdG8atR81GJV3kfvxkxTmwt9JuthVB0OUnfCidJ+9vZ5aWbUxxKSJQ6T
         sLE4gwkYqAmZSQebdhiluuJZF8+rpdnIB/h0NorwN2inHXXa3OT6tPuutYKFXOy9S4fT
         cIv4bjBEA/ZE3ryXbtKBYIMWqTCcYGfgxoxfgnWpv+C+30mXcRpl6R9OCLyOzaCrUKVA
         bn337EZgruAtMZUp3c6bn0E/s4iOEId2gUgcm41+Ln2QT0Udnwyl8BJ49o0W4NgGaAbW
         zqZ0cstopPkUuT7KOJnRJRQ3FSJma4q1wD/lUfXb8rgzUtzaxUkqdb+XzxfUjXC7inx3
         8yew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QZdKudUD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si4877460edm.208.2019.05.10.13.52.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 13:52:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QZdKudUD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:49798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hPCVV-0001f9-I2
	for alex.bennee@linaro.org; Fri, 10 May 2019 16:52:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hPCU1-0000td-3y
	for qemu-devel@nongnu.org; Fri, 10 May 2019 16:51:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hPCTz-0002tx-UD
	for qemu-devel@nongnu.org; Fri, 10 May 2019 16:51:09 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:37476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hPCTz-0002rJ-Kw; Fri, 10 May 2019 16:51:07 -0400
Received: by mail-lj1-x242.google.com with SMTP id n4so6197613ljg.4;
	Fri, 10 May 2019 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6fAiRzgNXrfYcpso+96yNIf18bf+QqR1W7fdgjYw+40=;
	b=QZdKudUDnx8QPMQ9C8TnAsOaWpOVIpo1VsEymgjQHuf0KsrmRMg7FVd85G1KP3j5zn
	jivqqyzJCqjy/zwcUKDO4n9A/zrfSrrl5gdx6MhyU/1W6rWo4wSNzUUzGvzd5Xkp8nk4
	s3OhwBMic7GV5M7b9RKnDKyVwJEJbywImdMbLlzOpFXHZNrVpXbwj0nK2XSjz3ldJ4IK
	YshcEl0QNHVDadMBrxvR5oEeksEnbj47/1Q0r9oXZQV33OpmPzk2V7K7qT2qVy/c1YE+
	/lPyh3Fxqp3lxc7R4s8j1znyjyd/NCpOARhKlP6DFFQAh6LFvl2e9PqOixK8Ry93CstV
	UbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6fAiRzgNXrfYcpso+96yNIf18bf+QqR1W7fdgjYw+40=;
	b=EyTiSi73Rx/jiPmSnxy34REe/fpKFim/CvnowCcb2nQqulqw0spmV33aBvmFBpmBSu
	0XcFMh0I3N8firDJioJJFU48xRbOZrvZi2LdaOqJJodng5qPBYDLlEbgPQP6/l0pOc+o
	E6RBE+H62JfGwGQaeOhJxGr1qKHoAc+HzL6Qn9SN1jG0KZiuKq8y5n/DIOHXEgIKeFFD
	AaI25/u2IVLMZCw9lUg/toZ9mp/hTTEwTMrP9OnD81WeSsxEni2dznFarXhrm1fD6L4q
	GLrWlpQip0IjK26DvAu1Xn4nquoE46l1PU5neMAN8wFVGVQxvpugEM13P9J8h1gGXBa0
	nAxA==
X-Gm-Message-State: APjAAAUjUnTOwl3mYIv4fIA9+ki0owU7DHpzNFXsEzNPubrWJkXBCKQR
	PYy3PQp4K9ff+/49XVt0ad7W7cVK3UhX015FqJc=
X-Received: by 2002:a2e:8988:: with SMTP id c8mr2966973lji.99.1557521466373;
	Fri, 10 May 2019 13:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-15-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-15-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 May 2019 13:48:57 -0700
Message-ID: <CAKmqyKMkQR6FTXSo=zLm48mD8L-66g1iTiU0uupejTe4V0fmYA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v2 14/16] hw/microblaze/zynqmp: Use
 object_initialize_child for correct ref. counting
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lfo0m+iIT+yw

On Tue, May 7, 2019 at 9:52 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
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
> This patch was generated using the following Coccinelle script
> (with a bit of manual fix-up for overly long lines):
>
>  @use_object_initialize_child@
>  expression parent_obj;
>  expression child_ptr;
>  expression child_name;
>  expression child_type;
>  expression child_size;
>  expression errp;
>  @@
>  (
>  -   object_initialize(child_ptr, child_size, child_type);
>  +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
>  +                           child_type, &error_abort, NULL);
>      ... when !=3D parent_obj
>  -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 NULL);
>      ...
> ?-   object_unref(OBJECT(child_ptr));
>  |
>  -   object_initialize(child_ptr, child_size, child_type);
>  +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
>  +                            child_type, errp, NULL);
>      ... when !=3D parent_obj
>  -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 errp);
>      ...
> ?-   object_unref(OBJECT(child_ptr));
>  )
>
> While the object_initialize() function doesn't take an
> 'Error *errp' argument, the object_initialize_child() does.
> Since this code is used when a machine is created (and is not
> yet running), we deliberately choose to use the &error_abort
> argument instead of ignoring errors if an object creation failed.
>
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Inspired-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/microblaze/xlnx-zynqmp-pmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-=
pmu.c
> index 0948b1fd5f2..df6c0048aa6 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -176,9 +176,9 @@ static void xlnx_zynqmp_pmu_init(MachineState *machin=
e)
>                                  pmu_ram);
>
>      /* Create the PMU device */
> -    object_initialize(pmu, sizeof(XlnxZynqMPPMUSoCState), TYPE_XLNX_ZYNQ=
MP_PMU_SOC);
> -    object_property_add_child(OBJECT(machine), "pmu", OBJECT(pmu),
> -                              &error_abort);
> +    object_initialize_child(OBJECT(machine), "pmu", pmu,
> +                            sizeof(XlnxZynqMPPMUSoCState),
> +                            TYPE_XLNX_ZYNQMP_PMU_SOC, &error_abort, NULL=
);
>      object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal=
);
>
>      /* Load the kernel */
> --
> 2.20.1
>
>
