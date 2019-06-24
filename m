Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3879731wrg;
        Mon, 24 Jun 2019 08:08:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyV64T3EnX8olcT3XBvja/c2Zy68V+f73Q1D0udo34Yyup0dccxfmQwYmGPepLRZqmaAKQg
X-Received: by 2002:a50:d0d6:: with SMTP id g22mr93891313edf.250.1561388926903;
        Mon, 24 Jun 2019 08:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561388926; cv=none;
        d=google.com; s=arc-20160816;
        b=Uk2y2T8SkkHtqthBDRO5IPVsOZTTi0QVhZ9Onw76vlU+U7YPWymNw18JklDKQBvMHU
         3JtdwaBogVTIHOCnXY+ZR1Tc4rYT6OMSd7KgT2F2C9PSiXRJEoYTzkl0epzwnFkQjvbG
         yI/dSii3ggOQZbjr+Xl7ctaoci34VypcWAFnWusdaRWdUYMEiX1XSQcICGgM1qaOF+wr
         FBU7lC1DrzOwKjPVnQbIW7ORHTpTgRYNl5PvHpvd37L4FuSOuSLjFZblkCXo23rlPNNl
         g/Mwi8hjML8Bxv+4Dkl7iqkuEDyJ2y/ROYtirhmq1Wx3jq6R91N/l+kaAXHRCC2s3rzm
         EGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Uq6fYfK6Axw09wwZ/BI/YaDt20uve51sDShjo2rfs3M=;
        b=IktCHUX5LyttasSLLgFnsRTGy9BoFM04Kr0BLVZYMYaiTGPrVI+agMECvKynNwO/TO
         Y95I1gJFBIaac6fZqBekDXvYv02TVUD9iE1T6mP9ViMfbgpvChEQh/JvYBTS3Ua5KqUu
         ghBTvtYhXNY5LUTVSUUjC1eQRib1Nwk2nI8puHQW7YLRoUHkRK8bC0VHFrlucCn03Wb8
         jbbW2wF97HT0uqTaC0/i1drLZ/6quCNXt6PBcA6UVKpQWh0FYuAxVf8kd2EzJAgQ0zNg
         2uDnCiEcwRShABzUBGjQZEPeED7UDfWQJxNMtQ2K5P18TKGF1bsgxzCErbYXqvRexnu+
         Gexw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17si7296692ejc.114.2019.06.24.08.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2019 08:08:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfQaM-0003DU-0E
	for alex.bennee@linaro.org; Mon, 24 Jun 2019 11:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36159)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lersek@redhat.com>) id 1hfQTL-0007Y0-9V
 for qemu-arm@nongnu.org; Mon, 24 Jun 2019 11:01:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1hfQTJ-0002Yy-VY
 for qemu-arm@nongnu.org; Mon, 24 Jun 2019 11:01:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48228)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>)
 id 1hfQTJ-0002Iu-N8; Mon, 24 Jun 2019 11:01:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2A8366E777;
 Mon, 24 Jun 2019 15:01:18 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-226.ams2.redhat.com
 [10.36.116.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0DDB60C6C;
 Mon, 24 Jun 2019 15:00:55 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190620122132.10075-1-philmd@redhat.com>
 <20190620122132.10075-3-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <afb007ea-ec73-2065-2d57-63ecb3e5c968@redhat.com>
Date: Mon, 24 Jun 2019 17:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190620122132.10075-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 24 Jun 2019 15:01:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 2/3] hw/i386: Use
 edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eYZBx3Mwd6em

On 06/20/19 14:21, Philippe Mathieu-Daud=C3=A9 wrote:
> Enable the EDK2 Crypto Policy features on the PC machine.
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/i386/pc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2c5446b095..fe99ebfe3d 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -39,6 +39,7 @@
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/timer/hpet.h"
>  #include "hw/firmware/smbios.h"
> +#include "hw/firmware/uefi_edk2.h"
>  #include "hw/loader.h"
>  #include "elf.h"
>  #include "multiboot.h"
> @@ -1049,6 +1050,11 @@ static FWCfgState *bochs_bios_init(AddressSpace =
*as, PCMachineState *pcms)
>      return fw_cfg;
>  }
> =20
> +static void pc_uefi_setup(PCMachineState *pcms)
> +{
> +    edk2_add_host_crypto_policy(pcms->fw_cfg);
> +}
> +
>  static long get_file_size(FILE *f)
>  {
>      long where, size;
> @@ -1653,6 +1659,7 @@ void pc_machine_done(Notifier *notifier, void *da=
ta)
>      if (pcms->fw_cfg) {
>          pc_build_smbios(pcms);
>          pc_build_feature_control_file(pcms);
> +        pc_uefi_setup(pcms);
>          /* update FW_CFG_NB_CPUS to account for -device added CPUs */
>          fw_cfg_modify_i16(pcms->fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpu=
s);
>      }
>=20

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
