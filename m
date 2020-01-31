Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp756028lfp;
        Fri, 31 Jan 2020 07:22:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnj/qxROP3CLTSKhG3IeYxu1YZOHSy4vZTHz1IKwXVOtAbdDFnVoot1ldX1KSyy/0oGqXe
X-Received: by 2002:ac8:1205:: with SMTP id x5mr11049018qti.238.1580484164652;
        Fri, 31 Jan 2020 07:22:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580484164; cv=none;
        d=google.com; s=arc-20160816;
        b=TPfTt175IlZ1KPufIkhrzxJf2DmP9L8aD3Im37GQXQxuhX65khvxf5h2EOw15Qi74N
         /Ev01fXlET46V0xJtQQgczJUZv3jP5VFulz1rK1wdufEfiucxTiMIpb7kGyBU80aAn5T
         il3a4s1J5opbMb93rO+f6vB0ZtUicfKmsFgcZbb9LWO4tHy2LI5UyaJLGYpk0ZmjuF5M
         /PgI5Cl3/SujuoZj86CiHxAfv/PgcTOBd9boonaWX8vNEfkje7yEae7Pz+pOTmH1zi0+
         WzeUsdwgRY6yHq3+GQWtXixfipw/5zcyAP0Ltdi7KGrJt/Wo4i4sys5g8ma6kp4Hj81L
         7fdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UfyH5nJ+NIfsObnBZjvRjm5eE82w8cQH6pIlZBQxQY8=;
        b=Wq4Z3D8c0sMmHO/rSeHx+O41ujVb7zTbX3bi0WTHRhSBH7p2/V/t25ErjONIbeyD3h
         9g7YyceAUJze6NtxYWtFwyLdEE29+XhZaw9MhZyuBkstCm5EV5y14VAF2UKGGOesoy++
         q8YT9UGMPTVOB8ughS4YGIhGeIAu5tdU9vmWEWYJ2Kv5keuVGygtONj9vze6cu3DH7D3
         jN5apHkjaK3bf5UGqtuou6I3Wb/S7avB4yiWBS175HBu1rcnFDAX5atCo4gNE2jvchxW
         ahq4H5KRL5cIH4Mwtrkuo+mhtYAQR3i85LDqDc6OnRHWpQZmjGMUmgkHnjbzfNp0sjb5
         1phA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ChXABUpB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si6316135qkk.301.2020.01.31.07.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 07:22:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ChXABUpB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixY84-0000DG-3h
	for alex.bennee@linaro.org; Fri, 31 Jan 2020 10:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyH-0004Is-Tn
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXyG-000416-SI
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20491
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyG-00040P-OZ
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfyH5nJ+NIfsObnBZjvRjm5eE82w8cQH6pIlZBQxQY8=;
 b=ChXABUpBHyJqTnYfpcok2M3O6xviCVDKubbdZ5u27dM20n3kcDVFF97AOmePTFObaeIv6Z
 GzjAbUepJe6AjMhcda1R5glzy1eeFgyBkWlor5sdOtlc0GiU6x2dYYm43c26/LzFO/9nnU
 KDuRjDJtcfv8w8V6yFdrrEs01mmzDrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-gfMpT-SoN_6FUicEP8hooA-1; Fri, 31 Jan 2020 10:12:29 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11C6B8010CB;
 Fri, 31 Jan 2020 15:12:28 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B928886C4B;
 Fri, 31 Jan 2020 15:12:26 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/80] arm/imx25_pdk: drop RAM size fixup
Date: Fri, 31 Jan 2020 16:08:45 +0100
Message-Id: <1580483390-131164-16-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: gfMpT-SoN_6FUicEP8hooA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 jcd@tribudubois.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1eMqUUl1KAW9

If user provided non-sense RAM size, board will complain and
continue running with max RAM size supported.
Also RAM is going to be allocated by generic code, so it won't be
possible for board to fix things up for user.

Make it error message and exit to force user fix CLI,
instead of accepting non-sense CLI values.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: jcd@tribudubois.net
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
CC: philmd@redhat.com
---
 hw/arm/imx25_pdk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index c76fc2b..a2b7b35 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -78,10 +78,10 @@ static void imx25_pdk_init(MachineState *machine)
=20
     /* We need to initialize our memory */
     if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE=
)) {
-        warn_report("RAM size " RAM_ADDR_FMT " above max supported, "
+        error_report("RAM size " RAM_ADDR_FMT " above max supported, "
                     "reduced to %x", machine->ram_size,
                     FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE);
-        machine->ram_size =3D FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZ=
E;
+        exit(EXIT_FAILURE);
     }
=20
     memory_region_allocate_system_memory(&s->ram, NULL, "imx25.ram",
--=20
2.7.4

