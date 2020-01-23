Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp760849lfp;
        Thu, 23 Jan 2020 07:02:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqw9fo5yAoQY3alv+CGrZ7vpxvdh3pUKL8b/uQVEAngcDxkIbvz/oQLlFeTNy92JaXWtS13Q
X-Received: by 2002:a37:ba03:: with SMTP id k3mr16007964qkf.127.1579791741126;
        Thu, 23 Jan 2020 07:02:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579791741; cv=none;
        d=google.com; s=arc-20160816;
        b=b/WKrCIl8VuBPg1gbOawQWeeNaIE1OMWSRzXNsLoPX+i0uBmfrBLpiJW7M4UdLDqfV
         ZjCtC2oUMDGXH3LXcN/dRlINvk88E7vYvcXCE/Q12qU+OnNrw1U2ZhNI/h50buO9YH3l
         idKhgCqQ4L1/JBSlj9sejsoFt4u2DGika1YZ5Q5C1df7U6yOHFW6Dz0e1KSzozBtWo94
         FRsx3/TTkqbY6VSC/SqcffKa3HXrBYEuLcgubcweTA+wkccqDFdfX6pVvryuoAl2ktmY
         rG+Ze8ckeSrvGMXEEs7SnBLXMPgsh3ZdBX783lJNiYhCbl1rLZFxDBCUDZ3vogB8OERj
         wEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=ik9+Ni0I2HIpFjFmmPCpB/I8lei/QzZGMkRoelzzCmo=;
        b=VkmuEtH3m7NX5LgaNbJuDFv9JWXptgPfc1XkLL71ewWOrrtWLAU/2rJUfE4R0TSa3i
         aZLcV0QRazBXRCYmK73buEey4opyl7TEj8XUXM58HxQRXXQhsBjj4dQnIeVPhP6VNnk8
         JuQgd/0ypL/TK9IIECY3jtXxHoFE+rKnZ3X37v8aQiajPbbalC/mlSQN2ElX8I22kFDZ
         PmydkdLCJQz7s+O/iuzhcWkZ9jJNM3gBR5Pbi/e4IokOEMoNrlWyMln7PZQYDQhE8Z67
         0wyaIQfpVkw/0pS0BIdqyUEJg7zqNVFjZxRlipixlIxuXCVww4+knYr14RuoR6Be1YlZ
         P2uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hmasso4i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i27si1506964qvb.150.2020.01.23.07.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 07:02:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hmasso4i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iudzv-0001zH-8Q
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 10:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iubZn-0003KP-Rm
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:27:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iubZm-0006Nb-Q2
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:27:11 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48897
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iubZm-0006NF-MB
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579782430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ik9+Ni0I2HIpFjFmmPCpB/I8lei/QzZGMkRoelzzCmo=;
 b=Hmasso4iEtMqrN4PPhUBRhQ6YPocDYxdENIr15GiDmqWIU/jRjMHKnErXwIGdohUSp82JS
 geLxlrVIGF5iYJ21iP00gfExYGOalcASixdO4TBGOnZ/LssFZoL4Pf8C6Q+s5EFDfk5WLr
 4AphoWqjlHoUVgYRrqVOOiQUW9m6UDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-xAxm1qUhP9WIlZDX3QUqNg-1; Thu, 23 Jan 2020 07:27:08 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99140DBA3;
 Thu, 23 Jan 2020 12:27:07 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A30BC5C1BB;
 Thu, 23 Jan 2020 12:27:06 +0000 (UTC)
Date: Thu, 23 Jan 2020 13:27:04 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 09/80] arm/collie: use memdev for RAM
Message-ID: <20200123122704.qb333etpxfkjek5y@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-10-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-10-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: xAxm1qUhP9WIlZDX3QUqNg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DwowOYfx/AMW

On Thu, Jan 23, 2020 at 12:37:34PM +0100, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> PS:
>  - while at it add check for user supplied RAM size and error
>    out if it mismatches board expected value.
>  - introduce RAM_ADDR_UFMT to avoid build errors on 32-bit hosts
>    when specifying format string for ram_addr_t type
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v2:
>   * fix format string causing build failure on 32-bit host
>     (Philippe Mathieu-Daud=E9 <philmd@redhat.com>)
> v3:
>   * instead of RAM_ADDR_UFMT adding use size_to_str()
>      Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
> CC: drjones@redhat.com
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/collie.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20

I don't know anything about collie, but I promised Igor to put
another pair of eyes on his changes. Looks fine to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>

