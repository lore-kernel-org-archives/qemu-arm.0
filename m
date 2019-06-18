Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3446340wrg;
        Tue, 18 Jun 2019 01:35:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxfZhmj7jkssopztfT44wFIujNc3hPsEUWEm12docSJw617T4lqGsSaAydqQqY6CsxoAE82
X-Received: by 2002:a50:ac4a:: with SMTP id w10mr103014829edc.33.1560846917402;
        Tue, 18 Jun 2019 01:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560846917; cv=none;
        d=google.com; s=arc-20160816;
        b=IUlwjZnyMiTsRkz73M+QYzHiwe02vDGUYtceroWXaGP9SOgtSsHyyHr+u+L4WrwW7W
         sLsKUfDnpnBZTaPESl6ECRdAqXh8DdlTuIbE+XGrXBKEAGubikLccNd+9OXoLikz4+ek
         z+d0VFmPoFA0f7p3VUGeGUlewVawXIJjIPcHPE6bf0Fgv4fTLsiFuJPt74ReZ7RjS001
         RQkEtDBMDCzIn6btjWq5z0N6lSeiG78sj9ljq1aoyvNpba26rm5C/kIYJ20Vir1ubZ6H
         RpMUfCoHOID0O/jTq69MKTB1WMbC1iUOsTqVoaQv5n0zOJAveJ23vzYIC5Ui1cSx/8Tx
         cskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=Ybgj9ymHBe3I4wIlf9SANjUkWNFDc1rJ7T86oUhayzQ=;
        b=WloppMXbS7tsu7AErk6l/ISv8vjVhE1Oko8vjPUN+0+7lgPLpA/EVCo6wpJpgTyHRa
         P/VI0JILDa2lej3st8/S8dEhaEBBuc0Qz4m5/IvtabxgjV4vv5OEhNhpINwwE+Ql29dU
         EUFelGbEHIZSu5HP5Hf7cL/2HfI6ed+FSQoMzu1sg0XesdAibeiT5HnyMCy8VrH8cn+r
         FHT+G9MP994L5XVfDlSfaUIqBZQvbDazxK+P2fDCw4kHu2USz8vKcNNJvxefGBr9lgaz
         02JaYTR8mHJZOS4nX9btpM/ym3lV0zQu2FpUvZxfWGvL3mBruDEYPLf2DmE8Q4eGb/wm
         B5yw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si8742344ejc.69.2019.06.18.01.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 01:35:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hd9aG-0007E8-FN
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 04:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41237)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1hd9Zy-0007E2-GI
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 04:34:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1hd9Zx-0000kQ-GM
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 04:34:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48712)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1hd9Zx-0000cP-Ax; Tue, 18 Jun 2019 04:34:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 54863307FBCB;
 Tue, 18 Jun 2019 08:34:45 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C6A882749;
 Tue, 18 Jun 2019 08:34:44 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 18 Jun 2019 10:34:42 +0200
Message-Id: <20190618083442.10407-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 18 Jun 2019 08:34:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/boot: fix direct kernel boot setup
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rbn1+XO0WXS7

We need to check ram_end, not ram_size.

Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
DTB off the end of RAM")
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b2f93f6beff6..8a280ab3ed49 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1109,7 +1109,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cp=
u,
                              info->initrd_filename);
                 exit(1);
             }
-            if (info->initrd_start + initrd_size > info->ram_size) {
+            if (info->initrd_start + initrd_size > ram_end) {
                 error_report("could not load initrd '%s': "
                              "too big to fit into RAM after the kernel",
                              info->initrd_filename);
--=20
2.20.1

