Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2316842lff;
        Sat, 14 Dec 2019 07:58:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqxoktoHeyExRfo8XaWNv+21cbn2hXNAJuSGz5cO7nlOpnG0fwlPwl+lNPHe48qEYx+RpUE1
X-Received: by 2002:a05:6830:10f:: with SMTP id i15mr21504620otp.199.1576339083366;
        Sat, 14 Dec 2019 07:58:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576339083; cv=none;
        d=google.com; s=arc-20160816;
        b=M1QIRLwwsEVTQQ60yUFiXcQDQpPQMtvugaMZHsPz3n/uBNxbhr3z0jYtxvxv3Ex/Uw
         v9+PwFLEuBEnkIQxEGE1sljVZtGCfgKobmrshVIko0WEw1+dC5GT9xoteSCzv2xY4WBL
         PRPpDYDjeToXUxe65BJITbIhBUP/TvyGEQdt5dNlTivK5Vzlwmk/KUHDxlBU13yyBKJL
         +NLym0Fp1xVeOHxa08w7P+Bua906fUqhjysPXKCt7cxjkZEgAej/yl2+iPp4WfYv7w9c
         g5AdqNATzFJ0hOQHhgM3g2AG93peBXbMVxWi2jtK1w9VADMSCciBQSGBWcnZVqNSkFvc
         B7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=LRDNXmBjVfes+8mRt7KTS+s8kaJK3nwCAodGqedjxW4=;
        b=jbhGXaSbY5C+Snea0e0vRk0b6Ama37180p0wwLfP8OViQD9mbM6HxiQRMr3/3e7XjV
         iLOvB2l5y7Zh0jHP2TK9WGeSfKN+D2s7Q/evymbjpHDTVAvwMP/dgIp1j0QusN5t8EDb
         vyE7ePT0B3bfW9H0oXG/3EA5AyIi6EsRcewCayyl6MRE+vwnt0EnRW304RS6E4iAerG1
         tMih26jjQrK7x9aOgQynq6y8TJeRFjmfP1eIZDJpx0wsZGq10BCx/LjfjXR6qqSv1hOq
         tBcgq7qq7HgFC87sduBa2Ba8yvM80Oaw8DslL2A+q02XvPBgP6uDToO1FjAXGLigky1e
         +sEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RT2uAExz;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a205si7330504oii.95.2019.12.14.07.58.03;
        Sat, 14 Dec 2019 07:58:03 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RT2uAExz;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbfLNP6C (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sat, 14 Dec 2019 10:58:02 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60239 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726802AbfLNP6C (ORCPT
        <rfc822;kvm@vger.kernel.org>); Sat, 14 Dec 2019 10:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576339081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LRDNXmBjVfes+8mRt7KTS+s8kaJK3nwCAodGqedjxW4=;
        b=RT2uAExzwj8fwuCWNwuWjj8NxuW6xnFndTijxeKxu3PThXPIxienBBbTFOXVoIEkoyNgeC
        ECJEgs/ZOtUPePgVznkBktVAgpzHvvyDG7Ik1uTYJQhh0cFMP3qFlWZo8MhLrTfKlg1R3N
        woon5/3M/vzW24YX7FmgmixnIS5n1lA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-InHhu3ggMleXW3tOq5yXNw-1; Sat, 14 Dec 2019 10:57:59 -0500
X-MC-Unique: InHhu3ggMleXW3tOq5yXNw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1EA11852E2D;
        Sat, 14 Dec 2019 15:57:56 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 88D2B5D6A7;
        Sat, 14 Dec 2019 15:57:42 +0000 (UTC)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Andrew Baumann <Andrew.Baumann@microsoft.com>,
        Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
        Alex Williamson <alex.williamson@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        Paul Burton <pburton@wavecomp.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 6/8] hw/vfio/pci: Use memory_region_add_subregion() when priority is 0
Date:   Sat, 14 Dec 2019 16:56:12 +0100
Message-Id: <20191214155614.19004-7-philmd@redhat.com>
In-Reply-To: <20191214155614.19004-1-philmd@redhat.com>
References: <20191214155614.19004-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: VP9SMNGOf7/O

It is pointless to overlap a memory subregion with priority 0.
Use the simpler memory_region_add_subregion() function.

This patch was produced with the following spatch script:

    @@
    expression region;
    expression offset;
    expression subregion;
    @@
    -memory_region_add_subregion_overlap(region, offset, subregion, 0)
    +memory_region_add_subregion(region, offset, subregion)

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/vfio/pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 2d40b396f2..74b1eb7ddc 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1095,8 +1095,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDev=
ice *pdev, int bar)
     memory_region_set_size(mmap_mr, size);
     if (size !=3D vdev->bars[bar].size && memory_region_is_mapped(base_m=
r)) {
         memory_region_del_subregion(r->address_space, base_mr);
-        memory_region_add_subregion_overlap(r->address_space,
-                                            bar_addr, base_mr, 0);
+        memory_region_add_subregion(r->address_space, bar_addr, base_mr)=
;
     }
=20
     memory_region_transaction_commit();
--=20
2.21.0
