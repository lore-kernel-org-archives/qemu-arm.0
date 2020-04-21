Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5367483lfm;
        Tue, 21 Apr 2020 11:00:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypIRcuA4Rbs695yAP7f/i1f8P21rxXrliJ0xPHsa/ZiYV3uN8BVRvAS4jHM+USo549R986vx
X-Received: by 2002:a37:6e87:: with SMTP id j129mr23172880qkc.358.1587492058199;
        Tue, 21 Apr 2020 11:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587492058; cv=none;
        d=google.com; s=arc-20160816;
        b=LXeenfLWbHhAQP5YgDPFwxEkuWtb4hTSwDLXcwTIwqS/pyawE1XKFx1QkzkZqGXVdO
         RvJc0GDz8JK3ZpX6M4QgXByiJ0IRaCXqsehkjVPJbqSgzxfBQRG895uO+WnLMg6f4cAj
         iUnsAOL62PqfXdsbx3GcASauRiv3AF+pXAUbK7EFlHwWLwbLf6wlcEKZJuda744y94zl
         BQOqyhSUUqVk37B14JGm9+CWKZPI9NffZuFmTS9nRubSud7KfbTmMH794aBqp7EFCjqI
         0cSf76iRGrvLBs3cQSZvwrgJIy/sitSPLVL4wtLNo9mVa9KZ8AEKutSE+f+CC4WKCUe4
         QiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=xwpNrYKj/zzgQ1bzbyDvID/w73eI2bj4wJvZ0HwZmO0=;
        b=FBMZDTBHhLCKiPNGGkpuAiAgygHj4MIGXmlwrJAWi1h8rfQllcfWdGzXvEMnR85G+y
         kCaGsMznGyasR9yM2QzUN9G2M9Awj9M4YZRtzCYzywTesqt1qLNE4UEsk0RcFS+G7fNE
         vNvC9L7YM/iuhB4ja63bctgP4S9VN3v9o/prCJtw14H3UbSpfQF8LHdzTVQKYXHpiaqq
         Gl9zo3/945Xk74TLpLt4Q+fx63GkDj7LkrJks+T9ZcKEKDbW6U/XuA/heup2/P/VVGfw
         5OpBB+H5XMJ6fWF2Pg9GSW6HxJ79yJQ+d0PzhTT1RS1wb1yhPeCmMuk3Ijts55R9OdXd
         XeEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R4LPYUUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7si1831892qte.51.2020.04.21.11.00.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 11:00:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R4LPYUUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQxCb-00070m-Fk
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 14:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jQxCL-0006zS-SH
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 14:00:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jQxCK-0004D0-6P
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 14:00:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45163
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jQxCJ-0004B5-PC
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 14:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587492037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xwpNrYKj/zzgQ1bzbyDvID/w73eI2bj4wJvZ0HwZmO0=;
 b=R4LPYUUrz78vwFbbcZm3Bvj+1nPkcWDyqzrVdNGRkmmp/LncO97cIKCEEgJb/biweuHO+I
 J4V1O2wnTo1TcqWMN8ieZuZlTINK4MBzL+3IFx3Cu8S7rpVuVx4qxOlnW1EqGTVz2zZtA2
 DuN9X4WJ9zyhWIc2HQ8XxLVfQdhLn5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-aB9XF869Mta-plaDVrrYDw-1; Tue, 21 Apr 2020 14:00:35 -0400
X-MC-Unique: aB9XF869Mta-plaDVrrYDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE8F2107ACC7;
 Tue, 21 Apr 2020 18:00:30 +0000 (UTC)
Received: from work-vm (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 307161001B09;
 Tue, 21 Apr 2020 18:00:26 +0000 (UTC)
Date: Tue, 21 Apr 2020 19:00:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 03/17] hw/misc/temp-sensor: Add 'info temp' HMP command
Message-ID: <20200421180024.GL3029@work-vm>
References: <20200421121626.23791-1-f4bug@amsat.org>
 <20200421121626.23791-4-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200421121626.23791-4-f4bug@amsat.org>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 01:28:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4vjLBlvitlB+

* Philippe Mathieu-Daud=E9 (f4bug@amsat.org) wrote:
> Add a command to display current devices temperature in the monitor:
>=20
>   (qemu) info temp
>   Temperatures (in C):
>   videocore                          25.00
>   bcm2835-thermal-0                  25.00
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

How do I set the temperature?

> ---
>  include/monitor/hmp.h |  1 +
>  hw/misc/temp-sensor.c | 29 +++++++++++++++++++++++++++++
>  hmp-commands-info.hx  | 11 +++++++++++
>  3 files changed, 41 insertions(+)
>=20
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index e33ca5a911..f023230bd1 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -129,5 +129,6 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict =
*qdict);
>  void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict);
>  void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict);
>  void hmp_info_sev(Monitor *mon, const QDict *qdict);
> +void hmp_info_temp(Monitor *mon, const QDict *qdict);
> =20
>  #endif
> diff --git a/hw/misc/temp-sensor.c b/hw/misc/temp-sensor.c
> index 27750c533d..5f591bd9c3 100644
> --- a/hw/misc/temp-sensor.c
> +++ b/hw/misc/temp-sensor.c
> @@ -12,6 +12,8 @@
>  #include "hw/misc/temp-sensor.h"
>  #include "qapi/qapi-commands-misc.h"
>  #include "qapi/error.h"
> +#include "monitor/monitor.h"
> +#include "monitor/hmp.h"
> =20
>  static int query_temperature_sensors_foreach(Object *obj, void *opaque)
>  {
> @@ -59,6 +61,33 @@ TemperatureSensorList *qmp_query_temperature_sensors(E=
rror **errp)
>      return list;
>  }
> =20
> +void hmp_info_temp(Monitor *mon, const QDict *qdict)
> +{
> +    TemperatureSensorList *list, *sensor;
> +    Error *err =3D NULL;
> +
> +    list =3D qmp_query_temperature_sensors(&err);
> +    if (!list) {
> +        monitor_printf(mon, "No temperature sensors\n");
> +        return;
> +    }
> +    if (err) {
> +        monitor_printf(mon, "Error while getting temperatures: %s\n",
> +                       error_get_pretty(err));
> +        error_free(err);

Maybe use hmp_handle_error

> +        goto out;
> +    }
> +
> +    monitor_printf(mon, "Temperatures (in C):\n");
> +    for (sensor =3D list; sensor; sensor =3D sensor->next) {
> +        monitor_printf(mon, "%-33s %6.2f\n", sensor->value->name,
> +                       sensor->value->temperature);

See my question on the earlier patch; I'm curious here whether we want
device name, and then subname within that device.

Dave

> +    }
> +
> +out:
> +    qapi_free_TemperatureSensorList(list);
> +}
> +
>  static TypeInfo tempsensor_interface_type_info =3D {
>      .name =3D TYPE_TEMPSENSOR_INTERFACE,
>      .parent =3D TYPE_INTERFACE,
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index ca5198438d..77f1c43ce3 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -880,4 +880,15 @@ SRST
>      Show SEV information.
>  ERST
> =20
> +    {
> +        .name       =3D "temp",
> +        .args_type  =3D "",
> +        .params     =3D "",
> +        .help       =3D "show device temperatures",
> +        .cmd        =3D hmp_info_temp,
> +    },
> =20
> +SRST
> +  ``info temp``
> +    Show device temperatures.
> +ERST
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

