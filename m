Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp701474wrt;
        Tue, 20 Nov 2018 07:34:21 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U4D2q3uDyO5uFtT1Y21wK31X2OAY7dm1AX47xLPtQtIe4iRt8WJ1nhHjw1F5DaUZN8BzJ8
X-Received: by 2002:a25:5186:: with SMTP id f128-v6mr2234355ybb.203.1542728061593;
        Tue, 20 Nov 2018 07:34:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542728061; cv=none;
        d=google.com; s=arc-20160816;
        b=QNs8zWx9c6O0X+vw0qIQQ2YLkbDM+1lBzwJOqrh7tB9CwZF7EpEgGAig6KsZC+m585
         MRCkCUWnhCO3GO88RNffGMeB7BUro/PIchLxBxD5PEpCtHC4uxlaba3jrcYPmDfqBOhC
         e5ps21oulXT0HHltLOfBhDVKMDEn3kd4sHGJEZcKso25u31iAhQ+c3GiOG+beok7vDL4
         pFO2BCAUENRcl6wkeYpMlEubwL+oufZU7cNu8rpwT/RsbRni5FJKVU/ZUlZ0jT45ttsG
         7fEWWozjnFPXH9HEhRt4XZpNTNGPSRLrYoszNFT3+ynvXKY5MUcTkioGRAUPxDYwFX4v
         SBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Fua+oWJwOmNxIa6GdlZh0jtc/fX6o5sP8gtXMpvnAhQ=;
        b=huau7sy5FW/EhRSw6lsaxgtyn8qyFM/6ZD/P8O70TWTJACyT85nsPU1i0fCHhY4i0S
         c7zW60GHj9FHKPhmOppM3rSWkFwzfPg+Emwc0bbXB0Afgj3H3uJ0l3CbM0EdS4thCaLg
         y1W4S3QykmXZKNpIMLgyyYkqZ+Vzgjj7U9kOdGuviiM2j5q3ZABpLcGv33ZEpOvPGUM3
         GP4HSNCkkzTNAKAOtQQX8DtDEEPFZTuhzTkT6yB5lVYGOc+IVxDg+Z139xl51hXiZ0d0
         jKTXtSeemLgivluk/wP9fdA5RTafgB9S7hp5pw/JceQBeaxvayf+WfTR6YBHCFD96jX3
         xIKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p124-v6si29628513ybp.332.2018.11.20.07.34.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 07:34:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP82f-0008ID-2N
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 10:34:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP82R-0008Gr-VR
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 10:34:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP82N-0002P0-Li
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 10:34:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gP82L-0002MZ-Hq; Tue, 20 Nov 2018 10:34:03 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47A5D80467;
	Tue, 20 Nov 2018 15:33:57 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C45E705AA;
	Tue, 20 Nov 2018 15:33:30 +0000 (UTC)
Date: Tue, 20 Nov 2018 16:33:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181120163329.6c960628@redhat.com>
In-Reply-To: <20181107123652.23417-2-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 20 Nov 2018 15:33:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v3 01/14] tests:
 qdev_prop_check_globals() doesn't return "all_used"
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Poussineau <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XddubGVn6nQm

On Wed,  7 Nov 2018 16:36:39 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Instead, it returns 1 if an error was detected, which is the case for:
>=20
> /qdev/properties/dynamic/global/subprocess:
> warning: global dynamic-prop-type-bad.prop3 has invalid class name
> warning: global nohotplug-type.prop5=3D105 not used
> warning: global nondevice-type.prop6 has invalid class name
>=20
> Clarify the function return value.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/test-qdev-global-props.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-prop=
s.c
> index d81b0862d5..ccdf6c57c1 100644
> --- a/tests/test-qdev-global-props.c
> +++ b/tests/test-qdev-global-props.c
> @@ -214,7 +214,7 @@ static void test_dynamic_globalprop_subprocess(void)
>          { TYPE_NONDEVICE, "prop6", "106", true },
>          {}
>      };
> -    int all_used;
> +    int global_error;
> =20
>      qdev_prop_register_global_list(props);
> =20
> @@ -223,8 +223,8 @@ static void test_dynamic_globalprop_subprocess(void)
> =20
>      g_assert_cmpuint(mt->prop1, =3D=3D, 101);
>      g_assert_cmpuint(mt->prop2, =3D=3D, 102);
> -    all_used =3D qdev_prop_check_globals();
> -    g_assert_cmpuint(all_used, =3D=3D, 1);
> +    global_error =3D qdev_prop_check_globals();
> +    g_assert_cmpuint(global_error, =3D=3D, 1);
>      g_assert(props[0].used);
>      g_assert(props[1].used);
>      g_assert(!props[2].used);
> @@ -259,7 +259,7 @@ static void test_dynamic_globalprop_nouser_subprocess=
(void)
>          { TYPE_NONDEVICE, "prop6", "106" },
>          {}
>      };
> -    int all_used;
> +    int global_error;
> =20
>      qdev_prop_register_global_list(props);
> =20
> @@ -268,8 +268,8 @@ static void test_dynamic_globalprop_nouser_subprocess=
(void)
> =20
>      g_assert_cmpuint(mt->prop1, =3D=3D, 101);
>      g_assert_cmpuint(mt->prop2, =3D=3D, 102);
> -    all_used =3D qdev_prop_check_globals();
> -    g_assert_cmpuint(all_used, =3D=3D, 0);
> +    global_error =3D qdev_prop_check_globals();
> +    g_assert_cmpuint(global_error, =3D=3D, 0);
>      g_assert(props[0].used);
>      g_assert(props[1].used);
>      g_assert(!props[2].used);

