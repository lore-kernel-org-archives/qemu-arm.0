Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp727870lfp;
        Thu, 23 Jan 2020 06:33:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhkynLWhA0X0lzVzK9fCgABiXwIJd/ymlcr/ZDdWYiXYOYKsk7n922kZM5VdF6JTBU77RQ
X-Received: by 2002:a37:a085:: with SMTP id j127mr7598432qke.89.1579789982432;
        Thu, 23 Jan 2020 06:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579789982; cv=none;
        d=google.com; s=arc-20160816;
        b=tk/zd+50x5qTJWO6oip5BO3kzuMYLRBlDP3jyYzFyoUWjbk0H5gubNX5+Uc0n2D8qK
         /YzrHKl08fSG2+RveCT9L/mCSxj468DZ2DHet+siCVgpm8zlI9GCw1WKien5XTW0IeGC
         5s42LfpvVgixOvuHzG/1QNa1uW7ioyw3j/pZ7G6KjS7ssPdLe1yhBgnPOBwFOopEVrK9
         7Bz6vwl1xbftj62e7C0kgukDSgNq6QT4hmUHJVfj1GTZ4EvLfDzd1cKlgbaIuhwtQrKm
         bmLq00EczG4yvakoFNhBrjtYepVOE1vJOb4lxNLAH8gTub4itE4IuGgkdo8Ljz6K5gBk
         EqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=RSTj+1tKMOpIFCYTOzDON3ZEdM6QPdsUDIXmGqR/T3Y=;
        b=JAE3e3QLn1NTEkJsPzFfbMOUbIxxkhQHgwF10TpCJfzXajEzTP7eR8Y7ZMhH+WYH+c
         AMmXxqAMwjNS0MnOrO8pB7puvmHGQQSsOxzAG9lt0S78g/+EgWMz/TuJ0g0mdGUfdHzg
         RC9lJc0U+vexGWlSCHYsfYgSkULyg6lNjd3FzYBzByv2n/2BnETLSkX97R9Iutiq8t3p
         ZOTbo+Y+Edy0kNHxtXmX2oDgUa5HGu/0dto329i1jmg0MJ8X/icQCpyWZ8qMD2BsJrlp
         pV28VXfKzb5gILbqjU+CvPraD/EFflM+UtyWi3Y89gbqT6pCcuaopa3pUVMJnVgBQcJr
         5ZJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FCL6eyiN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si1695306qkj.36.2020.01.23.06.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 06:33:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FCL6eyiN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iudXZ-0003Rp-F2
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 09:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iucIz-00057n-AA
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:13:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iucIy-0005IX-5j
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:13:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21911
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iucIy-0005Gf-2R
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579785231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RSTj+1tKMOpIFCYTOzDON3ZEdM6QPdsUDIXmGqR/T3Y=;
 b=FCL6eyiNxSWoXtqtSsZ7z7kchN1siGA+SuBGVxyXIkEkYWrQWSYU4aR3E7PEk4qMkifLVg
 a5Qb6oQ2FWZOe7zEXU+1TV0sg0Pc6rjVJgJWMS/JMNt383/GNBXcOsINdb09wZJG8XB+j3
 k0njHIOvr1t+X543udTFL94JNrKptvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-of2WUiuGNk2z7WxnSyL8NQ-1; Thu, 23 Jan 2020 08:13:47 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D2BD18B9FC1;
 Thu, 23 Jan 2020 13:13:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E82DD60C85;
 Thu, 23 Jan 2020 13:13:44 +0000 (UTC)
Date: Thu, 23 Jan 2020 14:13:42 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 25/80] arm/palm: use memdev for RAM
Message-ID: <20200123131342.du7myii7felanpk5@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-26-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-26-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: of2WUiuGNk2z7WxnSyL8NQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, balrogg@gmail.com,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8od57UFYnyft

On Thu, Jan 23, 2020 at 12:37:50PM +0100, Igor Mammedov wrote:
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
>  hw/arm/palm.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>

I don't know anything about palm, but I promised Igor to put
another pair of eyes on his changes. Looks fine to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>=20

