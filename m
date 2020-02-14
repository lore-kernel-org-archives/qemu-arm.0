Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1917855lfp;
        Fri, 14 Feb 2020 05:35:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqy4y2v4+9AWaPKCLsanzSrhh6zxxkduS7qCaNmOMS6ima4fBm9QOu5z+41+bg1rh8avTKJ1
X-Received: by 2002:a05:620a:795:: with SMTP id 21mr2641137qka.60.1581687322887;
        Fri, 14 Feb 2020 05:35:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581687322; cv=none;
        d=google.com; s=arc-20160816;
        b=A8d4ZFCCpK68lvE+vuhmtM9JVEMtDmCxzffAz5k0y5DxpLPGlykkpEw2BHNugwHEz8
         OXmTKOqRzYGQsXa0HeYetFlBsY+Ud/3Q91Ti9+Kg1S//Y5pzMUqmFstjP23lvCCXh8cO
         4byruMpch31NjjS74TA3747Wk19J4CmQDeij9mdOZDqvwtgdPt27Ro227AOvNFBUDo2d
         yTKfs2rjyJ89l3PtNRLjUYg0nzGNT7Giw1UGvLie0b0E/0ZjC5ayCcvvx0/bimm9/X6x
         rz0r00TlnvJkK0sCq8zDTR7PCNrLFGUZUx/E2PMyQ7piLNFl/KaDOcK2H8CkMZt/rMnL
         rbhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HjKFH/nidefwo3HE1V+8oDIe2P6XzNRGslG25dH2YO0=;
        b=UUO29xZ5fF9Ljg5Ny/eQW9iM6v4A6OSr7z3jlfTucllT0wScjnFOMKqc9WxP5gqU6f
         tYwgSFnKacaWb/9795WeYgVzALeX/3m7R/8PK7XEgGbmC71LdSKItwmRQ8B4V95I/hLK
         PzgAcjamHFz2CcPLDny2ayAJZb5MdVX3/RcxT2D5GWxzROxoelUNxAR5yf4K/VDnd1z0
         qV1K6nYnrW9y5lgFRr+nPHbtm4aRMXrd7maDj/BKVzqa5CW3rcYG/zVTb6NlZdHvvO0o
         gvAG45fLITKIskrDz90AqKblUocCxDyjP0Fdr+ZhErESyC207l/e/VctqZROmETEuwWu
         FZIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hUzU19ru;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n54si583540qtk.149.2020.02.14.05.35.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 05:35:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hUzU19ru;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2b7q-0003pl-7G
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 08:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j2b2X-0003Ac-Lg
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j2b2W-0003Lh-NS
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:53 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34018
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j2b2W-0003JT-JO
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581686992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjKFH/nidefwo3HE1V+8oDIe2P6XzNRGslG25dH2YO0=;
 b=hUzU19ru9M7XMm/p5OBQnUVT5/N3LB8GDl7yYiQ4Xh6DWIrYBn5UVeLZQztPLsOmotUJ2x
 tRIS6MjEKOfGdkOzIBnZeBq2eogzPWZkZ0Zly2nIeExrnOVaSCxzk79Nrzfs1TtU8eb/KA
 4WkMp66XIz31uFSipji9i0DjcntR4AU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-btnV4LqKNDm0DqxunrjcTw-1; Fri, 14 Feb 2020 08:29:50 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35BAD801E66;
 Fri, 14 Feb 2020 13:29:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DF4A5DA7D;
 Fri, 14 Feb 2020 13:29:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v16 10/10] MAINTAINERS: add virtio-iommu related files
Date: Fri, 14 Feb 2020 14:27:45 +0100
Message-Id: <20200214132745.23392-11-eric.auger@redhat.com>
In-Reply-To: <20200214132745.23392-1-eric.auger@redhat.com>
References: <20200214132745.23392-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: btnV4LqKNDm0DqxunrjcTw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kevin.tian@intel.com, bharatb.linux@gmail.com, tnowicki@marvell.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /tPjHbYJYKYX

Add a new "virtio-iommu" section with the new files
related to this device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c7717df720..b7a7a18737 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1623,6 +1623,12 @@ F: hw/input/virtio-input*.c
 F: include/hw/virtio/virtio-input.h
 F: contrib/vhost-user-input/*
=20
+virtio-iommu
+M: Eric Auger <eric.auger@redhat.com>
+S: Maintained
+F: hw/virtio/virtio-iommu*.c
+F: include/hw/virtio/virtio-iommu.h
+
 virtio-serial
 M: Laurent Vivier <lvivier@redhat.com>
 R: Amit Shah <amit@kernel.org>
--=20
2.20.1

