Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp123119lfc;
        Tue, 25 Aug 2020 12:27:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX1m9UqpKZuzFfWXsM1dhZXpAD+gzFkBFRMu9Qs76MbLVH3ZLUwZYbF7zpSuT0PqhxACaQ
X-Received: by 2002:a5b:744:: with SMTP id s4mr17226061ybq.26.1598383653330;
        Tue, 25 Aug 2020 12:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598383653; cv=none;
        d=google.com; s=arc-20160816;
        b=CNhH6Ui6btoQs27mvtwesE+IK1YjalhBLjKk3csCUTl3PmPN+geI4xMVrXYYVUqDEA
         8tKoWV8Tsx4NY+PgqWVR5uwYuTnkn+m6mp+mRdvSEpXfD9Aw7yVFezVlfiKwTAxF6JgO
         RSmstbGTy9sNVXKW3J2CuCZjna8L5gmUJPvF8CngKXLIScyHiVp63oYM1gwcGXQyi/yQ
         /E1BW6NMCHpgzu5cvAEeK+LgB0PSan6tsp+7vsTwWb1dAvq7MG6r+Uoq0fv2F8Er7j9E
         zVrUf/hcYSXcTFC0jmCwAXwt4Vvw1rvox2W5J8u8xzbzE0cn9C0DBDippK7v+ophqZ2C
         kuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kB64T7i3kXkMtfQ317GQ0ohm6MFBHi7RerpHcgGX/OU=;
        b=qC8XmaiwZBNbchMlUti65GeCwf9vw6bb0K0dueVLEcn5NbgkxoFgWGbyiX+k2PWxFV
         Hug/GZ7QixC2WwgcxViG013lucbjtPXXZnjiYXVwpdtKXuf0NYFRUbwistfpDu6uxM1o
         ticQnsC7LO1lt/G5L7cV94dly3QbhdO7foMnBFp+9VLjbVCDkHsX4JKC1BQ042/HitO6
         CPn8MH8tRYWH8fylXZ0hLjIujWsPntyiuMg9kcsrE6t+UYjkLda9I7/ZcDX0YImtx2Lk
         lE0kdpsIy+YrNGK5+2/JFVWKTvHajHWsKwsx/CE4Hix43/XVYW+R/tiO/0Io0U04cKlT
         5etQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Wor2W/iu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o187si15916741ybc.427.2020.08.25.12.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 12:27:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Wor2W/iu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAebU-0001cm-ND
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 15:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeVl-0006oj-Ec
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeVj-00064n-GG
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kB64T7i3kXkMtfQ317GQ0ohm6MFBHi7RerpHcgGX/OU=;
 b=Wor2W/iuBTGaF1PfAFZH4KpEy2CcerrIPjF54X72qlPa4U6no2JuQvpTHnPo1coD/1kVAW
 JzEd/bathmwFsXYYPn0CgnBa3oLMHOsnzuKScUzQYNuBX7ZNGn+jf7jxagfEbleqdaB75g
 YD3GzjN94M1ppZwH73D7i/h70q+oelI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-CLaCmThcPteGfdEvP_gu8g-1; Tue, 25 Aug 2020 15:21:32 -0400
X-MC-Unique: CLaCmThcPteGfdEvP_gu8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B2311074640;
 Tue, 25 Aug 2020 19:21:31 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7F67808B2;
 Tue, 25 Aug 2020 19:21:30 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/74] versatile: Fix typo in PCI_VPB_HOST definition
Date: Tue, 25 Aug 2020 15:20:07 -0400
Message-Id: <20200825192110.3528606-12-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 02:03:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dBEgkSA4IRPV

Fixes: cd93dbf375bd ("versatile_pci: Update to realize and instance init functions")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3: none

Changes v1 -> v2: none

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/pci-host/versatile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 616882a80d..7e4aa467a2 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -161,7 +161,7 @@ static const VMStateDescription pci_vpb_vmstate = {
 
 #define TYPE_VERSATILE_PCI_HOST "versatile_pci_host"
 #define PCI_VPB_HOST(obj) \
-    OBJECT_CHECK(PCIDevice, (obj), TYPE_VERSATILE_PCIHOST)
+    OBJECT_CHECK(PCIDevice, (obj), TYPE_VERSATILE_PCI_HOST)
 
 typedef enum {
     PCI_IMAP0 = 0x0,
-- 
2.26.2

