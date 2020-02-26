Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3337571lfg;
        Wed, 26 Feb 2020 09:26:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqwGoISbTtXt1nb2MlBreBvmQDoP9HbaaxC5OAM2i3DE/Jueq0Zymyy3/9yiXHjgC2TPz2Oi
X-Received: by 2002:a37:5206:: with SMTP id g6mr140112qkb.287.1582738017720;
        Wed, 26 Feb 2020 09:26:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582738017; cv=none;
        d=google.com; s=arc-20160816;
        b=dR7xt3Of4F4VIxDggTSKLoOTjmXIUg5+C3LrnKpF168nH96gL4wgqZK0PObEPKDLM8
         oX6o1mCP5EGdh1p+vI2g4TSCJPRGc6i2CsryEpNFtpahQ1/3dI0PyZxP3YV4ZrBzEcPv
         1M/O5vSrZtMQ3LmN2CrhfhXNh9rlgSjDAA/4sPWmdnFrcIuGuqPkcbnB7NOzE/xy19p9
         /dsUqQXWFVH0zVnv3n5Au4PvQXB8tUcQQZ4GxXA62uQXshJdaYrZTviq/69y+/RfvLMc
         Ily+9mlL4EN5H1ucZDxQO7+htUAn1TCY6O1BsdlIc/5IkUiuB80LdxWJDZ8qIYArt4+j
         ncpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=J9wll+plIfhDIdmgkRRYJeSJEE3Lh0NPJHy67PoM9Ss=;
        b=jTQAwDWca+muHi7+3AE9VCFzB0ajgs5lppgCJbas97MisbWlF76G1FXyrrc4zPMN4P
         R4q4MJ+V9OAeNprkhnJFeckYZnYHt9ys9UZwEsOYDJxwQaUqebkMG0l71HasCgDWn8S4
         yiQ9aR/75jX2LrFvSF4Aw0cSkptCMbfoCA8/l6RspoKxihM+uiil6xLraX1ihQZZ+1SP
         tNEUMfv2r4TxT12OlY6agvFG3UVSiIDdPAPDAZlpfaVs/F6fKpctM3Fe24+peCqfR6FD
         N3Yf95l9wE0lgOXrA7vxtL7mk2Hk0NsLrQHm7fjfmCDSPlxntrMPszfPK8vhSpQDtiL6
         dIag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PeyUcFAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c65si74751qke.156.2020.02.26.09.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 09:26:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PeyUcFAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j70SX-00083k-2n
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 12:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48250)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j70SM-00082k-TD
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:26:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j70SL-0005Ln-BW
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:26:46 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56284
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j70SL-0005Fq-6M
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:26:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582738004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J9wll+plIfhDIdmgkRRYJeSJEE3Lh0NPJHy67PoM9Ss=;
 b=PeyUcFAjobH5RTPQCD2u54L/5hlhTltz0hkgc0H2SzeFbWueHIb3MH+d6ceVOaEf/1j3H1
 y74zOE1U4Kf8DIm1SYdnIvdu9lXf1TUWU4Z6EwQAp7wHmI1mr8N4V7hUt8dPKyAtjxeLKH
 E98tKYkLH8qNI4xGb4d1CK4UCbzT7Q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-_5ErXceoMQCESc6wiSA_0g-1; Wed, 26 Feb 2020 12:26:42 -0500
X-MC-Unique: _5ErXceoMQCESc6wiSA_0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 971F4100726B;
 Wed, 26 Feb 2020 17:26:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F095491851;
 Wed, 26 Feb 2020 17:26:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH] hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
Date: Wed, 26 Feb 2020 18:26:28 +0100
Message-Id: <20200226172628.17449-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rnNkgMi0vt+5

Make sure a null SMMUPciBus is returned in case we were
not able to identify a pci bus matching the @bus_num.

This matches the fix done on intel iommu in commit:
a2e1cd41ccfe796529abfd1b6aeb1dd4393762a2

Signed-off-by: Eric Auger <eric.auger@redhat.com>
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
2.20.1

