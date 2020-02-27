Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4105834lfg;
        Wed, 26 Feb 2020 23:52:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHdRgTuIh5bWVCE1WR/VcT0C9X3HZ5QRxRoCHszEeIWl/XsvPg5n+L+gGoqK6kw0HbP6IU
X-Received: by 2002:ac8:969:: with SMTP id z38mr3362277qth.203.1582789926619;
        Wed, 26 Feb 2020 23:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582789926; cv=none;
        d=google.com; s=arc-20160816;
        b=a4HsQXnztUkh+LEgR9v3uDqzGC3vASGOAGotZqmfJlCJlG3iv30EPZCls6BRCVCgJs
         YpLDuB5V6hybu9Wq/N4YOF8xzsvPgXjD4wHz5Gwm8NGqrIBhklABohQa2/Cw0+Sq4QIw
         Kb63g3oUfzjbK/xnHxqmW19c0FFJqyk7Vq6QZYDzfRx8fD8xrPAtDox5XpZIJlOMEsl7
         lXIWizuMtw+gJnSa7vQVSv3/ePFaJW0xCfoZC7odFXrn/bUD+v1S7yBsjPlk1mwMV+tH
         lsb+0HyjsZVclVqx2LnKitr07SDv+w/YRjP+Ank0Z8k9LzsyJBaYZZLME6LYcNNDxIVq
         59Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lLYJa04/ib8S/ZD5NLXELObh98IS1WlwLAmx6ECTU+w=;
        b=pt9y+fUxJefhtZ5IfNgkxMpHx7rnROuE/diCo9x28SarhRsaj0BWWxsBrJehgcQQPU
         FioOcKbNgy3NuqKAyHkmrjNjfVTyPr2l660qOYrtDmVHzWwB/JrvLgabivBYlRX6wh4j
         9BCf8fCGwwSCx9g7NQ0wg/2fk/FM3FlQY17/6cWOcwOWNDA7ulWmKbTvOQEgloyA+GW6
         ObDA99itjyy0yRMxlejkJ+sKffWwK2LB2OUoToDQ3mfm/vEpXpUWOtdPN3ZQ9LNDHPWn
         fuuEvzB1oVETIp7e3SYX6QKEBvyZlfhPF0SsmXnRGFatK8dyWs5/hvUx8Iw1m+mHXtPY
         SiBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LE5YYYuM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si1055654qkl.168.2020.02.26.23.52.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 23:52:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LE5YYYuM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7Dxm-0005Ds-3A
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 02:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7Dx8-0004xG-T4
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:51:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7Dx7-000154-RW
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:51:26 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41935
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7Dx7-00014j-O1
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582789885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lLYJa04/ib8S/ZD5NLXELObh98IS1WlwLAmx6ECTU+w=;
 b=LE5YYYuMcYoX3zusWLGNIa+AG9VZ4z0DUud9R8AAStzlcOINsEc4zusH0gu9jKn9Aifw8d
 OhJCkOI7eXjLQhFEqEoWb8unQuCl4rpN7hy3TO4S45yt6U7lFvgXpgbc9o+w92uNLwiAe4
 QtXp31+guKhvysqlvc0nIYtodmtJLOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-Y23t7X9WML2C2gp7QWycuw-1; Thu, 27 Feb 2020 02:51:23 -0500
X-MC-Unique: Y23t7X9WML2C2gp7QWycuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89A1D800D50;
 Thu, 27 Feb 2020 07:51:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 550A85DA76;
 Thu, 27 Feb 2020 07:51:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
Date: Thu, 27 Feb 2020 08:51:10 +0100
Message-Id: <20200227075111.15275-2-philmd@redhat.com>
In-Reply-To: <20200227075111.15275-1-philmd@redhat.com>
References: <20200227075111.15275-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jzmLcr0JfdkK

From: Eric Auger <eric.auger@redhat.com>

Make sure a null SMMUPciBus is returned in case we were
not able to identify a pci bus matching the @bus_num.

This matches the fix done on intel iommu in commit:
a2e1cd41ccfe796529abfd1b6aeb1dd4393762a2

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20200226172628.17449-1-eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/smmu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 0f2573f004..67d7b2d0fd 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -301,6 +301,7 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t=
 bus_num)
                 return smmu_pci_bus;
             }
         }
+        smmu_pci_bus =3D NULL;
     }
     return smmu_pci_bus;
 }
--=20
2.21.1

