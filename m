Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp778480lfp;
        Thu, 23 Jan 2020 07:16:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqwM2UjTZ+gUhVj40ryCsEzAct8jqRnp+742oLr/EFPMeAAMEfbZ9jlskZOcfAuKT55Kbc6s
X-Received: by 2002:a37:8ac4:: with SMTP id m187mr16284998qkd.277.1579792615044;
        Thu, 23 Jan 2020 07:16:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579792615; cv=none;
        d=google.com; s=arc-20160816;
        b=A7oGok918vX42nuGtnJNnPOHi77SMy3XCRzUxuC6UUp3BS2rRN1A+EOycAj7TOwDFd
         fBm4gKZQ3Jxl7yelqBljmtTNK+2cGAoer2cX5hFBUspr+0lCY+KolKcYWbDsHvQ+A4R8
         N8oahIRGxa3mZXOnn+uweNrxnoLPgNhT28CSPOXDm6pF9d0VJWt7+xOi0zV5WuR+QmtY
         P2X026kLKU/+obrIuHM3J8AqoiI/HWb9cOoaYxCEan3l1XI16HE8CXnL5Fkc31xPlJLF
         nn7I8Yf7xwF/1LzsnecDscZOnV0qmD2T9ZUPKnrH2tJXowkaphV2AyN2f8uWLKpVph5I
         O3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=iLxTbnOG8vDH7PQwBtLcGLHK7NiXIN80ZHr5O/oU7KU=;
        b=VNtTGqcxrp2GDomHzB4E7G7FmT623Z7jcE6b5udAS3ECK+d4mqelEW+33r1+9FW/yo
         PY/7LGGE5znumL49Tv+P2WneWkd5DsnRz4VBaarTwsN8P2n9dz7B5zI52xuCQbtDge75
         uY/MYHQsY5iVMdQRGOj7YUP4qjxrRJ22mRVzwXdaAfsxek+n1sj6F40UdxvAbKeIGsy9
         HAXONwDefDZrhzB9hJNwcTN8o+4NfyWEDn2Kdg6XCjcfADpCWK9188TXVXYuPthEjyfQ
         RhJAO8UMcoCx7gC9srmSm7BO9flmQ2akwBUt8fWqxp8bNl9ztQ+EcAvLabJaGzZwlztc
         47Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NPIGCZhi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si1761606qka.208.2020.01.23.07.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 07:16:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NPIGCZhi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iueE2-00051U-4m
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 10:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iucHN-0003AZ-4b
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:12:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iucHM-0001O3-3e
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:12:13 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53075)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iucHL-0001M1-UM
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579785131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLxTbnOG8vDH7PQwBtLcGLHK7NiXIN80ZHr5O/oU7KU=;
 b=NPIGCZhiJGtM7YwfbYIaopxpigGY92VbqKeiOBHsfbxzhxbLKnryaj6dTzpXsEpGfZTzGf
 a3EsApgjH0M9FTtp9MVTBn+zphU4+4dY6BHR/ezkJzAv6NGeVZwvB69L4nbyhEP2V2O5Et
 UHDduSmGRc5VXUvaVXR7a0eIrv5viTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-_mUU-qebNLehTgkE4NG_ww-1; Thu, 23 Jan 2020 08:12:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D227318AAFA2;
 Thu, 23 Jan 2020 13:12:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9B9B1CB;
 Thu, 23 Jan 2020 13:12:07 +0000 (UTC)
Date: Thu, 23 Jan 2020 14:12:05 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 24/80] arm/omap_sx1: use memdev for RAM
Message-ID: <20200123131205.4ss6d3ss6y7c5fxz@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-25-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-25-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: _mUU-qebNLehTgkE4NG_ww-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VRQBD4fviSgF

On Thu, Jan 23, 2020 at 12:37:49PM +0100, Igor Mammedov wrote:
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
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/omap_sx1.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>

I don't know anything about omap_sx1, but I promised Igor to put
another pair of eyes on his changes. Looks fine to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>

