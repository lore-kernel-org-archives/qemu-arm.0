Received: by 10.28.71.27 with SMTP id u27csp2033192wma;
        Wed, 14 Feb 2018 22:11:31 -0800 (PST)
X-Google-Smtp-Source: AH8x227quwiQlxjx2eB+jHqjLbauIdF4bxvZlefw3foWGn7UlljyWDn0WhIfU88NCPqmk6G/+mQm
X-Received: by 10.37.218.147 with SMTP id n141mr1220643ybf.104.1518675091585;
        Wed, 14 Feb 2018 22:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518675091; cv=none;
        d=google.com; s=arc-20160816;
        b=Ov1TckfMY6bhPUSLf3UN2ueOQ99UuD4BfStqxT6Qi9QQpjQZB6lcNtBOT2aOTWXEjw
         Y7yXjY8gyT2H9nqMuEI/LIvTpBHeVvCibWOFgsw3iD8rh84BGiJ0reDoTUjLpNFT4lHx
         SKUHEHWUbITAlNIoA0ThQX5A4HCfs8mVI9FGecn3UeNqe/mmUnH5hnGfvwQVT6KGJdem
         GZlZu1to1+KKv9OmyiCEVU5Ip9YdrHBlHXwLQMhmVe7n+w0SJxJeBieaT27jBmFOshSX
         U6qIJWaBx9aPn9nEcpGd062MxC/hwBEY2UGW/bTCXbACOrG2BQmb3eI4ZbZzqzbM4lmA
         9sZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=o62CNlyVkfXO2rPFV4Jwtk8nIIrh60gpcvdS1ZB+eTU=;
        b=R5Ip0akThTDj9rNg7mCE6tgFQmw0AUs2K24/bY1M93wymPtS08X/F9C6lmPNu21Ct9
         93f0iVkZUmGio1UPUFLP1lG0ylBdmV+oq7E3nydaPEXYRq1uOL7AJPDzJE3S3Z+KLiUl
         a2Vo5LUwq1ngcXuJFxHz0EjdWZ5/j7G7z1NRWRauhjuJc8WxVcAQ5YzBMNQdErUQS9gL
         B1YjIBLvR1OSz7FQDRXgTkBllYI/uFo6GbeAjm9iYkgX5UIkHtdxI1ILKnqEs+MEzV62
         Yww0T1Wq6Bro2jQPAc8wbMsqcKFRh3gmjFPsy6iVRh9ry7zSmEkfOUTkNewG6hdP4fvR
         puXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e10si175773yba.179.2018.02.14.22.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Feb 2018 22:11:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emClX-0008FL-2T
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 01:11:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1emClL-0008Et-6x
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 01:11:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1emClI-0001zp-2X
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 01:11:19 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41078 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1emClH-0001zj-Tz; Thu, 15 Feb 2018 01:11:15 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1750E7CBB2;
	Thu, 15 Feb 2018 06:10:56 +0000 (UTC)
Received: from [10.36.116.121] (ovpn-116-121.ams2.redhat.com [10.36.116.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6866100F9F9;
	Thu, 15 Feb 2018 06:10:41 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
References: <20180215042900.16078-1-f4bug@amsat.org>
	<20180215042900.16078-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8fd4272f-8c40-3804-8449-752aea88a7cc@redhat.com>
Date: Thu, 15 Feb 2018 07:10:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180215042900.16078-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 15 Feb 2018 06:11:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 15 Feb 2018 06:11:11 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/30] hw: include
 "qemu/cunits.h" and clean unused "qemu/cutils.h"
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-ppc@nongnu.org,
	Chris Wulff <crwulff@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Paul Burton <paul.burton@mips.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Marcel Apfelbaum <marcel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Yongbok Kim <yongbok.kim@mips.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w3ucVx8MKHQ9

On 15.02.2018 05:28, Philippe Mathieu-Daud=C3=A9 wrote:
> These files were including "qemu/cutils.h" to use the byte-based size
> definitions, now available in "qemu/cunits.h".
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/hw.h       | 1 +
>  hw/arm/msf2-soc.c     | 1 -
>  hw/arm/msf2-som.c     | 1 -
>  hw/core/loader-fit.c  | 1 -
>  hw/core/loader.c      | 1 -
>  hw/core/machine.c     | 1 -
>  hw/cris/boot.c        | 1 -
>  hw/display/sm501.c    | 1 -
>  hw/hppa/machine.c     | 1 -
>  hw/lm32/milkymist.c   | 1 -
>  hw/microblaze/boot.c  | 1 -
>  hw/mips/boston.c      | 1 -
>  hw/misc/mos6522.c     | 1 -
>  hw/nios2/boot.c       | 1 -
>  hw/ppc/mac_newworld.c | 1 -
>  hw/ppc/mac_oldworld.c | 1 -
>  hw/ppc/pnv.c          | 1 -
>  hw/ppc/prep.c         | 1 -
>  hw/ppc/spapr_rtas.c   | 1 -
>  hw/sd/sdhci.c         | 1 -
>  hw/sparc/sun4m.c      | 1 -
>  hw/sparc64/sun4u.c    | 1 -
>  hw/usb/dev-serial.c   | 1 -
>  hw/usb/dev-storage.c  | 1 -
>  24 files changed, 1 insertion(+), 23 deletions(-)
>=20
> diff --git a/include/hw/hw.h b/include/hw/hw.h
> index ab4950c312..8249448cac 100644
> --- a/include/hw/hw.h
> +++ b/include/hw/hw.h
> @@ -14,6 +14,7 @@
>  #include "migration/qemu-file-types.h"
>  #include "qemu/module.h"
>  #include "sysemu/reset.h"
> +#include "qemu/cunits.h"

Instead of adding this to a header and creating yet another possible
recompile-the-world dependency this way, wouldn't it be better to
include the cunits.h only from the .c files that need the definitions?

 Thomas
