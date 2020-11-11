Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp465574lfb;
        Wed, 11 Nov 2020 06:35:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrdBEpmz8B+hrrGu2CDpkXLTjusp9uZ3QgYpxwvkXTo8dN7ztsVykPMLZaLbLVpWgGka2p
X-Received: by 2002:a25:3c81:: with SMTP id j123mr34604865yba.359.1605105356118;
        Wed, 11 Nov 2020 06:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605105356; cv=none;
        d=google.com; s=arc-20160816;
        b=atJAGOutP4GWn5S+qQZRs3Sp4jEjnhtErCo/lczKio5oWYP4Ec1RuiAw7v2ARvLe0y
         43oOka+wN+F1psyoWNK6x1gsnAroZfjg5ciktLPX0fbeHcQQNiom+PXofCExeCKxkrA0
         hBOptvwVtiPbC6FqNIwXHkOmK4sJT8qZHc8+lqtsykOKHusDm7PRZJDbjYq5jvJtMHKc
         6345VcXIokQj5ITJc98JIpD6nDfR8fQSCoZSqQEpAZ9Kzfv3UaiONRCNzf1hRJ53IlrS
         lqH6nyms2i2j+VemdBPL1hF92w4iyKihlwE1i5uW7BJprBJIAIDv7qS2IUXj1uB4p9/N
         LHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=evmH/zd1WgDle1PKcNM4t5SArloxCeaBBVoNfNLvu5A=;
        b=MHpEh7aBHpFr1Yipr90NZ+l/Bqt5pL+fJty8BdbmdlNVBgQMOv6uU91+Xqfy2FahLR
         VMOS3CXqyo/CGwRcSMF6mChfH1TzPv+hduTO+fvwUDQCLMLG/CkNKNmXLJYkP/yI65ot
         Ubb32ACQqTQjJG3S2GazFm+nX20Sc3zG/VftaccOz3io490aXoZHOjqHpNJzwlLcTW/M
         ZQ/sNoP9qFIiKnri5QpJYnk7pfauHBmNlqslnTbriASRD2yscwXJzZGeLwYL2l4YTXcp
         s4tAzEd57qU28bjRyUON2ylGatXrOh79qWpX9P3tnfmULoxRZtvPoAoYmuhAhJ4wbMiv
         I4Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RBvXJqw0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si1950922ybp.90.2020.11.11.06.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 06:35:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RBvXJqw0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcrE3-0004f6-DM
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 09:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kcrCz-0003Ho-B7
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 09:34:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kcrCx-0004k0-93
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 09:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605105286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=evmH/zd1WgDle1PKcNM4t5SArloxCeaBBVoNfNLvu5A=;
 b=RBvXJqw0WeGrP9tw0uDmz26oYqEQRVNJyHuJ3NTZzh8xjgVtdmoxoTfAFqjVpi3QcBqTHO
 qFKgK/Q/N8dKPfQiKUsT+9DK5ZOcXUPodpp1I7APHz60WqHCiW/SNODL+IVGnJPKewWeQn
 wKRL2J9tDW2+uCNjqzK3slD3flCxYVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-WR7tkhIPP2yTiRMbaLbj5w-1; Wed, 11 Nov 2020 09:34:44 -0500
X-MC-Unique: WR7tkhIPP2yTiRMbaLbj5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B32586D584;
 Wed, 11 Nov 2020 14:34:43 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F8281002C34;
 Wed, 11 Nov 2020 14:34:41 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
Date: Wed, 11 Nov 2020 15:34:40 +0100
Message-Id: <20201111143440.112763-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, Miroslav Rezanina <mrezanin@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lLfsVYNEmwrY

The removal of the selection of A15MPCORE from ARM_VIRT also
removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.

Fixes: bec3c97e0cf9 ("hw/arm/virt: Remove dependency on Cortex-A15 MPCore peripherals")
Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7d022eeefdbc..e69a9009cf0a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM_VIRT
     imply VFIO_PLATFORM
     imply VFIO_XGMAC
     imply TPM_TIS_SYSBUS
+    select ARM_GIC
     select ACPI
     select ARM_SMMUV3
     select GPIO_KEY
-- 
2.26.2

