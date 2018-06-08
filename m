Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp497738wrq;
        Thu, 7 Jun 2018 23:27:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLtGMfrv42RNEIWrv5UWH/Z/xWRcQChYrA6ZcGXEz7SI1pehpQfZgQMPSxKu/3PY8CMqlY5
X-Received: by 2002:a37:204c:: with SMTP id g73-v6mr4323942qkg.164.1528439248604;
        Thu, 07 Jun 2018 23:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528439248; cv=none;
        d=google.com; s=arc-20160816;
        b=LwWGhB+tUmBeaC6Z37RzPWLqABCOuHhiVXv6lul7/+r2wULAE7EiF7QuZUdgdRpREr
         o3obDQGLLGNPqYq8bJl2TWZSUpjOHYYHRcU7iL8pgNZfz3lyNQSwIK+n2Y2ftJ8KEKbw
         BHIFA/J5nTpKZlVDucouN/ESk/qX7qSvd6oBAAx/B/Z2eUJPzuTXDs9TOf4yYfgBctPL
         4Ozt2aWQwsh83QoArx2voy2/Wp9WzIXXMKAvDLryKC51LE39ukDWZBG3NL0zCuqXwM79
         kY4VluqsB4ZOi5p0VEeFfxrv9d+jXG7j2Bx4rey/xcdcsRL5KIpySKJr3ELJFMPIOUG9
         OZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from:arc-authentication-results;
        bh=dRxIT0EN/RW5nW11UEpWiZ594HNib1vQV+z7RIn5cAk=;
        b=AetBWMEhVPJuoN7PaBhODkP6N8Dh+K/cnpMTXDVDzNwuVmk4wPCwGtV5xhI3cmNjDJ
         wIWECo3NuL7E29MC3XesvyIKcEktc7gpCUPnRpEC427/0Q6I2K1KSo1C+hQ1a2Qepr8w
         LVq2qStWT1gwhw/i9E9qUDo02w3bXFH+bsx78MVD9CSHWOVnke7+UJzBYI7Q4nMdsR3g
         BVlRtwXOTmsqnpdn8Rib9DfbQaadtUZxVYfoVX31zhlz6XE+9IgnvdH2Sgs/SoZvo58F
         O2wYCxz8xf47R/bWJ7c9ZJIs9HUCG2lgQP1GHHnN6yQtBQeLkyzlmx3WKw09d+XEtGA1
         tLeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m20-v6si3199579qvl.87.2018.06.07.23.27.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 23:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRArw-00087K-3O
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 02:27:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fRArp-000879-IB
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 02:27:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fRArm-0004ks-Fr
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 02:27:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39814)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fRArm-0004kY-9D; Fri, 08 Jun 2018 02:27:18 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com
	[10.5.11.25])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6392A4ACA0;
	Fri,  8 Jun 2018 06:27:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 258B02016361;
	Fri,  8 Jun 2018 06:27:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DAD241138645; Fri,  8 Jun 2018 08:27:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20180607144645.10187-1-f4bug@amsat.org>
	<20180607144645.10187-4-f4bug@amsat.org>
Date: Fri, 08 Jun 2018 08:27:15 +0200
In-Reply-To: <20180607144645.10187-4-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 7 Jun 2018 11:46:44
	-0300")
Message-ID: <877en9bxoc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.25
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 08 Jun 2018 06:27:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/4] hw/arm/sysbus-fdt:
 Replace error_setg(&error_fatal) by error_report() + exit()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t9Beh/1WNLPH

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Use error_report() + exit() instead of error_setg(&error_fatal),
> as suggested by the "qapi/error.h" documentation:
>
>    Please don't error_setg(&error_fatal, ...), use error_report() and
>    exit(), because that's more obvious.
>
> This fixes CID 1352173:
>     "Passing null pointer dt_name to qemu_fdt_node_path, which dereferenc=
es it."
>
> And this also fixes:
>
>     hw/arm/sysbus-fdt.c:322:9: warning: Array access (from variable 'node=
_path') results in a null pointer dereference
>         if (node_path[1]) {
>             ^~~~~~~~~~~~
>
> Fixes: Coverity CID 1352173 (Dereference after null check)

You lost

  Suggested-by: Eric Blake <eblake@redhat.com>

Intentional?

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/sysbus-fdt.c | 42 +++++++++++++++++++++++-------------------
>  1 file changed, 23 insertions(+), 19 deletions(-)
>
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index e4c492ea44..8e2784fa11 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -91,7 +91,7 @@ static void copy_properties_from_host(HostProperty *pro=
ps, int nb_props,
>          r =3D qemu_fdt_getprop(host_fdt, node_path,
>                               props[i].name,
>                               &prop_len,
> -                             props[i].optional ? &err : &error_fatal);
> +                             &err);
>          if (r) {
>              qemu_fdt_setprop(guest_fdt, nodename,
>                               props[i].name, r, prop_len);
> @@ -102,6 +102,7 @@ static void copy_properties_from_host(HostProperty *p=
rops, int nb_props,
>              } else {
>                  error_free(err);
>              }
> +            assert(props[i].optional); /* mandatory property not found */
>          }
>      }
>  }

This is not the conversion the commit message promised: it replaces
exit(1) by abort().  Why?

[Remainder of the patch is unchanged]
