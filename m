Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp751967lfp;
        Thu, 23 Jan 2020 06:54:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwUX+kPcP7qQhqOL7oKZGrtxz25qNr4Uxxox9cQwFPHWdQ7nly7k15GsowrRX8fsrM/YNK
X-Received: by 2002:ac8:4a95:: with SMTP id l21mr12717040qtq.353.1579791278865;
        Thu, 23 Jan 2020 06:54:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579791278; cv=none;
        d=google.com; s=arc-20160816;
        b=QMnRx44imTs8Jp36XyZ1jx9ROsCQu5N0Uw0zped7NuGwlagEEMCG1A2DBidj7YrNYe
         VNg/QhyHO9/flkNtgcoGeNB1dUrtWUCk0I97HaCeB48t8Pi2tlscTH4TT8PXuOMxhXed
         rrrFLO3kdlZ9wxAUXpDpenkFh1VOk/8HfVFbjO7ixXkfR908uwWXdVtucXZUKb1dh+07
         FpD7RDyOH1W9GfhCeiUa78hxH2HN6gJamDrebJpDrcaP2P2H3O/eJSt2hMIKOpKBbFPe
         cDIkAIt87JvQb/n8sJMX9tH5z+NPuzojwn/Bl6c9SJBdt953oUGdQWzFX6GyhFUBa/Tw
         IqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=+TC+nC2953LkxJR8vEt5nvvgeRLEdVxwCY4K7LgWPMA=;
        b=InrTknVwiFjxQ0WFOmtBsymjjeo46EUhotjXlj0U1uLNdfn/c0bCwK6b1hlaXviqwH
         em9yHMyBxqLBZAl13otMdw9g56cUoq2tvfWklOR6Udm+SxyEybzg1xp1asoDN7qbhgU8
         TKWXF2pQ+NgTNnCOEHBD5Gd1ouUWpe7oBYyMizDxJYBXbrmUAJ6WBGrElMF1pPwPofGd
         fnC18Wxyq/9jANtD1nQHX4dfIwZrLb9cZe3vy2sFF7xMOEqHMcavmzs5Yy31js0yH8eF
         4HyaZMe7g5g3mEQ9eLx6/laBeOmYYHP402qWkr6cZtWfKyddr1o/pzckV6//9E9N6SRV
         pYTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Cqg1ZzVa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a198si1663546qkb.38.2020.01.23.06.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 06:54:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Cqg1ZzVa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iudsU-0007Aj-1U
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 09:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iucL0-0007IX-5A
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:15:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iucKz-00006Y-1C
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:15:58 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52963
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iucKy-000066-TO
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579785356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TC+nC2953LkxJR8vEt5nvvgeRLEdVxwCY4K7LgWPMA=;
 b=Cqg1ZzVataSrlQwEfz9yQRsFChLtaXN0j7eWtsAUk/rnFEc4v4n63TABHqboaTioDanw2C
 SfRN1TH2/wPRRtm3jTbFdTOQoPgizxXjv4/hg+rhkzuUh3yjiB+rFZi41rHqe180ZFYsP3
 7KWDtFozoXTKXlo28tEJ0K9RTPWjJuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-1p3WcDNWP26Aj1H2By9v2A-1; Thu, 23 Jan 2020 08:15:54 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EE51107ACC5;
 Thu, 23 Jan 2020 13:15:53 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52F055DA7C;
 Thu, 23 Jan 2020 13:15:52 +0000 (UTC)
Date: Thu, 23 Jan 2020 14:15:49 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 27/80] arm/sabrelite: use memdev for RAM
Message-ID: <20200123131549.py7lx7cvl5zs42i2@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-28-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-28-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 1p3WcDNWP26Aj1H2By9v2A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jcd@tribudubois.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gFwa8rQpwqWk

On Thu, Jan 23, 2020 at 12:37:52PM +0100, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> PS:
>  remove no longer needed IMX6Sabrelite
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: drjones@redhat.com
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> CC: jcd@tribudubois.net
> ---
>  hw/arm/sabrelite.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
>

I don't know anything about sabrelite, but I promised Igor to put
another pair of eyes on his changes. Looks fine to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>=20

