Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp780867lfp;
        Thu, 23 Jan 2020 07:18:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzfemKGHngnosp+uRvPn5Mn2iBGiwiahFj4AAR08x5hm3foZcZ5gLJFLewJAAUOlPYlbl2/
X-Received: by 2002:a05:620a:557:: with SMTP id o23mr8693550qko.246.1579792724476;
        Thu, 23 Jan 2020 07:18:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579792724; cv=none;
        d=google.com; s=arc-20160816;
        b=teGvphl5REsto6Rdvq0tVGGV0ojI0gvujjIevqJvfz8Wt90F4F2L1RbfW7D6Wwd5aH
         2phTkIt6us2WJDfVxLLi5z33JBXrV0U1cwDWI1ylvpzy6o03qCN4hqkEZXzlREVM1sQF
         8vTl//5mbiwtJmu8LexEqLrPE0/nhZF+W9XOBJFCvkK4pdmiA/xkVwb556WZXVX2xd6B
         di62KY6mRP+XrwZpvcA0g9lN5gTx6klpfyZ/uVg49GivmMwI7d4VVm3WHWwJS2u8mziE
         Em2ZmTMntg6dv7DgU8BY5BjOViqt59cXRlc9/i6p96mxZX6NlMogEimYbBaYzk0lWnOM
         ae+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=xv5vbNu8PSICXX8AC75b7aG4Hck1gKUFS8RTUUuWOhY=;
        b=CCLTuT9sFGpFZoINfhJ13e/Ck7gH6B3sihc7DlU2LW3p6LBZSnIDJWbHA80dOIaAWa
         6auhv8I2IRnt0Ufsa6/DHBSPaWDlCGyOu1mKkqlLZlCnJOTl3i+kc1f0wg30TfhCMa6l
         C4ctD+5MYw77TOjHTP8O9eK9I5k+VUfdF/9scb01SLqVCqXOQB45uLEXZQ4LgYh1dODB
         cueMuYcBZcn1lO7dw1QdmwwxOI5chjWmmSLBVbxw6UILKz97nCV1Ms2fOXOHeUeBNm2+
         62hiPwCUtsYJHjz1UbkTKK9/sHXA4XsrXMTDv7hHdHMLtvE4/h7zdT0a8PF/etMfmQEo
         YrFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EPTTzvRw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si1704455qkf.351.2020.01.23.07.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 07:18:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EPTTzvRw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iueFn-0006FL-0O
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 10:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41975)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iucEt-0005vU-3D
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:09:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iucEr-0000zN-UP
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:09:38 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48441
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iucEr-0000yk-Qf
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579784977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xv5vbNu8PSICXX8AC75b7aG4Hck1gKUFS8RTUUuWOhY=;
 b=EPTTzvRwLv1kojJGMtUEI2oFVg06W0bXSj03dP5EU3DubXxGXb25TyGsFSuAWun4jCzVbV
 xUKi5W9KAn0NHd6v4uNC4v8GXlPHg2NE0SXKrIXL4tsTRtgNde+xrKP26qS/4RnkXOfVhP
 gv8Jw75xAcH2IAumFp8doOJxX/AdPDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-BBaqDW0eNyqFUI9_QqDwdA-1; Thu, 23 Jan 2020 08:09:35 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 626B018A8C80;
 Thu, 23 Jan 2020 13:09:34 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4474E86C54;
 Thu, 23 Jan 2020 13:09:33 +0000 (UTC)
Date: Thu, 23 Jan 2020 14:09:30 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 23/80] arm/nseries: use memdev for RAM
Message-ID: <20200123130930.ysa5hgn2uefkyz2k@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-24-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-24-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: BBaqDW0eNyqFUI9_QqDwdA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U9czfKxnP1cc

On Thu, Jan 23, 2020 at 12:37:48PM +0100, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> PS:
>  while at it add check for user supplied RAM size and error
>  out if it mismatches board expected value.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v2:
>   * fix format string causing build failure on 32-bit host
>     (Philippe Mathieu-Daud=E9 <philmd@redhat.com>)
>=20
> CC: drjones@redhat.com
> CC: balrogg@gmail.com
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/nseries.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
>

I don't know anything about nseries, but I promised Igor to put
another pair of eyes on his changes. Looks fine to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>=20

