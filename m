Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6578301wrx;
        Thu, 21 Feb 2019 21:58:20 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZqQLvuXM8n5Rkg4+sbGuIRhIOXD58aJjacSMJ++mkGNuE3y3kRKWsmfe8DhEhce1aeVwjV
X-Received: by 2002:a81:c902:: with SMTP id o2mr1864385ywi.208.1550815100025;
        Thu, 21 Feb 2019 21:58:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550815100; cv=none;
        d=google.com; s=arc-20160816;
        b=mFiNvvg0KTEotMX1ppxDMP7Joixh6cZ9uUFqyXlLWmMGkDf9t59H8JAvnfzh+u/M9T
         JA20BhsbBN3qAapicvjKf9Osw2TikEZ6+5niXI8jhCJBsQ94A9KtZ0b2Mp0nq3AIwX8p
         45vzJgSRKRLcZr1GKZvipxnC+PLizkD9s0AVPlIYXbsHo5pVfjcriZtphmOlK3pEzRI3
         BoYrAtjsdXAcFrSwvekkOyocaiORjjB6MQ47QNKVRiizXHmHZc5FYUTUYNujr+uSDtZV
         eV/2BhR3Xuetjrk5eGo3KSzim9xyeAiGGz2siLj0uKr5lZJIFACFEiecZjjlP2kFZI8U
         U5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=xzEcpM8yuucPqkTEdOBm/8QtqTdj4eGqBklzEbsbA50=;
        b=CwgLJm0BU2niwkfSGMhza4kZejdv9+tIC4QEmwZ6bJotVQO7dXQoeJgK5g/aDR3LzP
         bdaV5dxIr2YzVBtHw5iL4dWaABPBONPf9rsI5VoyACDeXGS8vZj0O2ZQw0zl60znHcWR
         o25CA9mlNDjREAOBQMxihFLUIdq+hGBMub05LMHxr6dYg7FRwr5LWw1jOaQHKfCvwxyz
         uAaYPiTc3kGgKySIvsqvD9fP8gCnR7t7YLoHhlw7WT+Tq/RgsI4MczlLa8x/ej0ZqmvT
         aIKnS6hBWVk2z17bTNVT0lYCPTRtA/uUMm/WqKlxB6Z4+cZZz4iRG1aNiqG3+0oFfnJt
         Fj1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22si369734ywa.41.2019.02.21.21.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 21:58:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44754 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gx3ql-0000FV-Gh
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 00:58:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gx3qc-0000FD-2m
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 00:58:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gx3qa-0005jg-R2
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 00:58:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43540)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gx3qa-0005HW-8H; Fri, 22 Feb 2019 00:58:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DAE7C057F2F;
	Fri, 22 Feb 2019 05:57:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4D995D705;
	Fri, 22 Feb 2019 05:57:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4F4651138660; Fri, 22 Feb 2019 06:57:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190221183829.31019-1-philmd@redhat.com>
Date: Fri, 22 Feb 2019 06:57:34 +0100
In-Reply-To: <20190221183829.31019-1-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu,
	21 Feb 2019 19:38:29 +0100")
Message-ID: <87mumotlf5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 22 Feb 2019 05:57:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm: Use
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VLBiLjB3/3DN

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> As Thomas Huth explained:
> "Both functions, object_initialize() and object_property_add_child()
> increase the reference counter of the new object, so one of the
> references has to be dropped afterwards to get the reference counting
> right. Otherwise the child object will not be properly cleaned up
> when the parent gets destroyed.
> Thus let's use now object_initialize_child() instead to get the
> reference counting here right."
>
> This patch was generated using the following Coccinelle script:
>
>  @use_object_initialize_child@
>  identifier parent_obj;
>  expression child;
>  expression propname;
>  expression child_type;
>  expression errp;
>  @@
>  (
>  -    object_initialize(&child, sizeof(child), child_type);
>  -    object_property_add_child(parent_obj, propname, OBJECT(&child), NUL=
L);
>  +    object_initialize_child(parent_obj, propname,  &child, sizeof(child=
),
>  +                            child_type, &error_abort, NULL);
>  |
>  -    object_initialize(&child, sizeof(child), child_type);
>  -    object_property_add_child(parent_obj, propname, OBJECT(&child), err=
p);
>  +    object_initialize_child(parent_obj, propname,  &child, sizeof(child=
),
>  +                            child_type, errp, NULL);
>  )
>
> and a bit of manual fix-up for overly long lines.
>
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Inspired-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/aspeed_soc.c          | 43 ++++++++++++++++++------------------
>  hw/arm/bcm2835_peripherals.c | 41 +++++++++++++++++-----------------
>  hw/arm/digic.c               |  4 ++--
>  3 files changed, 45 insertions(+), 43 deletions(-)
>
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index a27233d487..81665f2948 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -106,11 +106,11 @@ static void aspeed_soc_init(Object *obj)
>      AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
>      int i;
>=20=20
> -    object_initialize(&s->cpu, sizeof(s->cpu), sc->info->cpu_type);
> -    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
> +    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
> +                            sc->info->cpu_type, &error_abort, NULL);

This flips from "ignore errors" to "abort on error".  Quite probably an
improvement, but should be mentioned and justified in the commit
message.

[...]
