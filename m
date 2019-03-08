Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8138171wrx;
        Fri, 8 Mar 2019 01:24:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqzT/oyB4UFRFAgfVwqjSI6xuxfnOj5B60aeq5RqpxRKVERtNdsejiupELWkAX5nGBVuLQM4
X-Received: by 2002:a0d:e401:: with SMTP id n1mr13534296ywe.297.1552037095335;
        Fri, 08 Mar 2019 01:24:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552037095; cv=none;
        d=google.com; s=arc-20160816;
        b=a//AbtOIWZkXwLSV7ZOvvg46sUoRtrnXLGO12AEZBfScaZ8nFVzjtuPpEHmYMW0luv
         iK1Py2JDZFLeM0Fbh7mf/YX4xm+jvseN5CMATiuedcPn54xbyLQwwGzgzXGS0/BhNcQ+
         +plFGwN3dDFtymSqV0T5zDDl3ZV2LMbDtm57Ra5yF3+ZIy8jzlQbfWeZ8xIv20ByR8Sg
         LtqRpGr2wQ1ALL/QpLQA9TZKL3Mm9frhdt9KWigrfdrUE5NWIiUrFJ2jhVVq7XAtHih4
         R2X+dOPbpE7bDJI8vkOKBopLaztG30DToCGuKaQ70lB7nFfE7ZfmvB6nfsVQ9gljTNhA
         zMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=GZyc7orowSQcfWDnPGkpbSVzdEPcLxNBwQ4LkUcvtPU=;
        b=sW1pXaycnP3Xdsf3LHZjjMuSvVrjH5wThkTB3opF7sT0f8Aghdu4+DAU5P6Drhvv3f
         c7jiS+PFCWVvIqj8MeNVwsgA705cyJOHzfnJMsHOoaGkckXgseToyEk5aW/644VTlKLS
         nB02xUvlKMnjPGw8lsmsGyvPSi7BoEp3Jj3yqxHIa0c+JlugD2W/fb+WHjPP7b3hEx0F
         PRErdAGCCKmyj6+wZqu0g/SCzvh4bvV4Hz7FdorMi/bRN23grXuARUmv9uW8T1lJmKXt
         b+loIszxjfni4gS4HtFkF6nIa7nvApkL23khcdCUFuIaxzKKpu5QrUOIeQfxhR3L4xlD
         ibdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v186si4372929ybb.337.2019.03.08.01.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 01:24:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2BkM-0002Fq-Nd
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 04:24:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2Bi5-00009I-MK
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 04:22:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2Bi5-0004fx-0l
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 04:22:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54933)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h2Bi1-0004Vl-0Z; Fri, 08 Mar 2019 04:22:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 748D0309266B;
	Fri,  8 Mar 2019 09:22:24 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-151.rdu2.redhat.com
	[10.10.120.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34DA7692A3;
	Fri,  8 Mar 2019 09:22:06 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-3-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0d347de2-ad47-d71c-764f-f10d449f5510@redhat.com>
Date: Fri, 8 Mar 2019 10:22:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 08 Mar 2019 09:22:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 02/18] hw/i386: Remove unused include
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
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9kubdGfF37yj

On 03/08/19 02:32, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Drop files that do use fw_cfg (Michael):
> - hw/i386/acpi-build.c
> - hw/i386/pc.c
> ---
>  hw/acpi/piix4.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 8fd25a5926..7b98121070 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -28,7 +28,6 @@
>  #include "sysemu/sysemu.h"
>  #include "qapi/error.h"
>  #include "qemu/range.h"
> -#include "hw/nvram/fw_cfg.h"
>  #include "exec/address-spaces.h"
>  #include "hw/acpi/piix4.h"
>  #include "hw/acpi/pcihp.h"
>=20

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
