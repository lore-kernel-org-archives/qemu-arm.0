Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4677026lfg;
        Thu, 27 Feb 2020 08:47:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPK+DRem0c6sTmtLecFgNwxrsS/sbKW4Obt16ACiZCIqMVw+MCh0nYSCOvJCSpBBeGMHLG
X-Received: by 2002:ac8:7484:: with SMTP id v4mr26337qtq.19.1582822076377;
        Thu, 27 Feb 2020 08:47:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582822076; cv=none;
        d=google.com; s=arc-20160816;
        b=on2byHMReIBGfPP82XYw2T4cEjbhMPs1jtrxWbRzobyOHtPWg3MA++tWgDhqEgyyC+
         WX3dgi7ZmXlecyZxWgZaXa4Ps/ZgFx6X2cQFjNxw5AFIY/zgGlv19GVFb3Jj4pFBvO0f
         rRQbg/IvvRVsFHIPkalxctH69Ln0TpGvHu+jMcbKRqYqI1SFcLM5RAUrJh2SQxtN1rYa
         LaDHhlWJyobdbSSZlJauRuy+7SbumWr1cNhZLpgFRNHHrV2J7VIlcSgm/jtl9XfdcPr7
         FXAZvAsIgqR2FZQM5Ml1YKr9k7Efnu/5I5zrie+AkciA3mlD5cDgGeFY1CZctiHALBKu
         3oXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lLYJa04/ib8S/ZD5NLXELObh98IS1WlwLAmx6ECTU+w=;
        b=Z7Iqt048tSBE17y4ZAngEHDiNn75/lX+dWCLhMZocagRf8qMYuHHa5lSdun3zQBTIr
         q9hXTCMb/Ipys5dMZl4hBQCLeROR5sDO//qtHfwCSSMh5HF2ijXk26M0fx5nGvDCYjkM
         VELJhO0yOM0JckHCrl08XdGUdc5FsMqOSURS53jPtz70eGM6dIOSJ7eBiSdXhmn5BRxh
         45RwVecQxGfACYpsHxZa39YXoT6cniKG/lji77+9Sv4TRh7oYSLsxEEYzy/9OoEXXFRu
         N8DFD91q02/haLbiN/K067WTy9p47DahRmF1gLbd0f33wyJcY7vxzvRXDhSHWczxtuu6
         PvKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MMn1YmNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22si1653048qka.346.2020.02.27.08.47.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 08:47:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MMn1YmNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7MKJ-0007S6-Ql
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 11:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7MK9-0007Qs-61
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 11:47:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7MK7-0002Go-Hx
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 11:47:44 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45991)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7MK7-0002G9-FB
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 11:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582822063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lLYJa04/ib8S/ZD5NLXELObh98IS1WlwLAmx6ECTU+w=;
 b=MMn1YmNKnqhmMRsoLTvqK2qpYywk4AWUVg+PPZ044X9sQPPPgIkkawDcHxTliZvj5xK0Ga
 n1SO9fy/Qqbvn0UAoZcoh5X/8KPBLpptvk0sXIJYePYWfRW8BkOY50gShVEgrfZQjJB+kH
 UxpQr4+5g31xZGCYOsWjE4J/2j3fclk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-oj9voCXsO-qcVs1eIct9FQ-1; Thu, 27 Feb 2020 11:47:41 -0500
X-MC-Unique: oj9voCXsO-qcVs1eIct9FQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C8C0189F760;
 Thu, 27 Feb 2020 16:47:40 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B2FC5C883;
 Thu, 27 Feb 2020 16:47:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
Date: Thu, 27 Feb 2020 17:47:27 +0100
Message-Id: <20200227164728.11635-2-philmd@redhat.com>
In-Reply-To: <20200227164728.11635-1-philmd@redhat.com>
References: <20200227164728.11635-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l1PMVDKQIODX

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

