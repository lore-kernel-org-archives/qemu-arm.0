Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp702829lfp;
        Thu, 23 Jan 2020 06:11:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqyavfWo1X9W2hEhdwlWIGdpB6A427YSLZbULnva2NSe4Mhv4nh9TZMj0gR7hrCmY1gP6OEu
X-Received: by 2002:a05:620a:78a:: with SMTP id 10mr16255749qka.392.1579788699048;
        Thu, 23 Jan 2020 06:11:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579788699; cv=none;
        d=google.com; s=arc-20160816;
        b=FtMvfEZkAEqrSr3v2pF0Kx5JAD47A+hhyrtp7GnWtaYKLSpEXZDYnbf4EHyhJiwdxo
         akglYTULDkh+E6PHFj5O1HV2VVUFW9yLElCF2HoAPWYbXXh9lyZ5035ylfF+OD4z1ATl
         y1b7FvFp88rObQWQOQ8hd768dE59YznD6jaP9YBeDSEUcrHqIK4Ev0nYKTnqStYqECuO
         Hzw2IVn5YzJRi2QuvJ0+zl8jvCyicLjx86efHgjUvspkWyS2wrbe/5XhwFpg7uh1zdhk
         CmzxhpmAJW0glzGCkOifMyW1zpk+BRBnKmFKrh8RdGGBlmpuAbkKXsCqTfpiAk/YO1rO
         nGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=fkfmcNeYQfjWC5118tu8AD02acPOElYkiX3uk7Pn9R4=;
        b=YzZh+Po+pCbCF9VYM62E83R8Cd97kpTzTCbslNqYgrpXnLTRs96t1iMUJSz+OPTe7h
         6gc+Vz8L1BSgoYIhRldq1W6uYjDCUNxeHPXjN7304ZiNEIu+YWt4Ur5X2HNWkGX/BeBn
         h8+r6V3dbdd0UlgD009NuYvi0H7fROgkwrhhPKtPIJngs/NeDe3gkffigOogZ6bCmToQ
         rYzTiMoTCVWjsPsOiGuHvSYg9k3IHTGvwaLFvp3NwLzkDyATVP4jpRlfVtttOvFWv6Ey
         rLQrBaOywbSPVGQ6BgmGT8OkJqEoXVFLQPFE2XxCnjJrfzxsLYflin8yf2ADwvh3ceMn
         x9wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WJtXkPsj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n59si1243250qva.59.2020.01.23.06.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 06:11:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WJtXkPsj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iudCs-0000a0-4k
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 09:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iublX-0001hg-IZ
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:39:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iublV-0008K5-Fk
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:39:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31538
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iublV-0008Il-Bq
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579783156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkfmcNeYQfjWC5118tu8AD02acPOElYkiX3uk7Pn9R4=;
 b=WJtXkPsjs338MPB3iZ0TWHrF3DKuK8lSS8QdH1g0zioFf1h3wFEwCHm+Uvit2rX4UUTVO1
 wK1hwZ4yilLDq9q2S3okADQWhykl95S3pndTzIYni7bZQ0OTYGTcqlxv/lDrwtljtMqMi2
 3lg+6Q43pAiH1rAxu3mBwu2zKnu+4h4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-pBFS4jBAO5qEN6XOJKabNQ-1; Thu, 23 Jan 2020 07:39:12 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BA15100551A;
 Thu, 23 Jan 2020 12:39:11 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AB3419C69;
 Thu, 23 Jan 2020 12:39:10 +0000 (UTC)
Date: Thu, 23 Jan 2020 13:39:07 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 13/80] arm/imx25_pdk: drop RAM size fixup
Message-ID: <20200123123907.qa2fyg2iqlzyemmb@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-14-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-14-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: pBFS4jBAO5qEN6XOJKabNQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jcd@tribudubois.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +aF4bg33uYpi

On Thu, Jan 23, 2020 at 12:37:38PM +0100, Igor Mammedov wrote:
> If user provided non-sense RAM size, board will complain and
> continue running with max RAM size supported.
> Also RAM is going to be allocated by generic code, so it won't be
> possible for board to fix things up for user.
>=20
> Make it error message and exit to force user fix CLI,
> instead of accepting non-sense CLI values.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: drjones@redhat.com
> CC: jcd@tribudubois.net
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/imx25_pdk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index c76fc2b..a2b7b35 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -78,10 +78,10 @@ static void imx25_pdk_init(MachineState *machine)
> =20
>      /* We need to initialize our memory */
>      if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SI=
ZE)) {
> -        warn_report("RAM size " RAM_ADDR_FMT " above max supported, "
> +        error_report("RAM size " RAM_ADDR_FMT " above max supported, "
>                      "reduced to %x", machine->ram_size,
>                      FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE);
> -        machine->ram_size =3D FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_S=
IZE;
> +        exit(EXIT_FAILURE);
>      }
> =20
>      memory_region_allocate_system_memory(&s->ram, NULL, "imx25.ram",
> --=20
> 2.7.4
>

This would break existing command lines that are happily using the max ram
size, which is only 512 MB. Yes, those command lines are wrong, but I'm
not sure we want to flip the warn to an error without machine type
versioning - which this board doesn't have.

Thanks,
drew=20

