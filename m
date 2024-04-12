Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp375245ejv;
        Thu, 11 Apr 2024 23:21:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+FRIsnstjO9wSBd1sJDVkOKBwyucZSlzf2nTkt8uijTyf7JVn/YrxxeuhrAanACtOxGWc4/DOrQxZj2v1UIn0tHjstMju
X-Google-Smtp-Source: AGHT+IE7dudT9bFmPQtlR1W2n9zd7VdOoGLzP7arH7nVR7e/JIF+GxXac9Evk/Nxbc2Yyr92OtXu
X-Received: by 2002:a05:622a:189e:b0:436:5e08:9aef with SMTP id v30-20020a05622a189e00b004365e089aefmr6722193qtc.5.1712902902063;
        Thu, 11 Apr 2024 23:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712902902; cv=none;
        d=google.com; s=arc-20160816;
        b=bOw5CYpQ40HyZEjDLE+bNo5j2Qv8mM7iREDuVD1y+r6BJjXrBNvi6xQBSBmAF31xZl
         vW/M9N3FZ5UYpgmbXfIWSNY32Z7gGbaYr6WVvvFTCaHjCwgm6JRRNIm9fMnOMnLCJ+2u
         F80ECx9m0Kvk72SJmm7OZ4L7VS4Y25S2aV/1aqyJMW9mDp+DgzrxeIVIjZYMvk/LmAxa
         w6XZSpzXSVRD1Tp4n7aBiFEp/1CESqoXDOT86AdZPQ9aHuTy3h95scf0lx45iK80/7VJ
         1KBz89XnLrme1ib1YpwU1bE6RttmZoIuBqudjr7pHMBUYnDWKV3Y4gSBlgYyBPG0/zmp
         j4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uyMEVv+Qr1JCuwaBXRg/o4Yz92IoErl3L0BiP00m6ZY=;
        fh=FgpzUiSKNMTtMHyk5kkuAaa5ueEJtER2oT+Q/1wxShc=;
        b=m+NHoffSKAL1z7cwyUaZpiS5G0VnRPQGLDOSBYsGDPr4T3IPJOsxJiamO9FwfqKzRR
         GekSDNrSbiMtKCDDRnQhR8kCbL9p5KXMFa+EAiuGwHpQJCKMJsk36hAyS/ejeUVObnRQ
         5rUM07mmWAHubKBKRPXsByzeFNx3fxzxZsiflk+7RrU06oKiHSXOhA+2C7Uubt4tBsvY
         CobwKjL8qpZ6nSPO+OMs9jxqh4VpDNyL6d76sc4kByO+xHrMCuCbfWxr7Tv/gladhotA
         jKI9VD8ZpRgNyCSFX7ecoDfIfySz5xiCl+mj1rXRtgkyskIAvTKtVj+kgW7J9qq5SBPm
         7jMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FNznimEy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020ac857cc000000b004369a6fd37asi187934qta.605.2024.04.11.23.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 23:21:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FNznimEy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rvAHX-00082U-PL; Fri, 12 Apr 2024 02:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rvAHV-00081G-G2
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 02:21:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rvAHS-0003wM-KY
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 02:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712902857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyMEVv+Qr1JCuwaBXRg/o4Yz92IoErl3L0BiP00m6ZY=;
 b=FNznimEy8i3qYpCHOAjGFA2a3yR1imptMojcKfnjD2HMcinHoWyOio3BYFjffM3C8BKDGt
 ccQkOAwm2De81tJYhWcvg77PcdDZY7ydlpHUlwjnvjPGEfvr1RSqSnpLgR29bbXt2VXco4
 8AdprOt4U5begpziJXGH3atU1feozkg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-BbUu1v88PzmQK77FvRhb2Q-1; Fri,
 12 Apr 2024 02:20:53 -0400
X-MC-Unique: BbUu1v88PzmQK77FvRhb2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0ED0B1C29EAD;
 Fri, 12 Apr 2024 06:20:53 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C99BB1121306;
 Fri, 12 Apr 2024 06:20:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 1/2] hw: Fix problem with the A*MPCORE switches in the Kconfig
 files
Date: Fri, 12 Apr 2024 08:20:41 +0200
Message-ID: <20240412062042.105174-2-thuth@redhat.com>
In-Reply-To: <20240412062042.105174-1-thuth@redhat.com>
References: <20240412062042.105174-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.49,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Q8U0wH+BxQVV

A9MPCORE, ARM11MPCORE and A15MPCORE are defined twice, once in
hw/cpu/Kconfig and once in hw/arm/Kconfig. This is only possible
by accident, since hw/cpu/Kconfig is never included from hw/Kconfig.
Fix it by declaring the switches only in hw/cpu/Kconfig (since the
related files reside in the hw/cpu/ folder) and by making sure that
the file hw/cpu/Kconfig is now properly included from hw/Kconfig.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/Kconfig     |  1 +
 hw/arm/Kconfig | 15 ---------------
 hw/cpu/Kconfig | 12 +++++++++---
 3 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/hw/Kconfig b/hw/Kconfig
index 2c00936c28..9567cc475d 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -48,6 +48,7 @@ source watchdog/Kconfig
 
 # arch Kconfig
 source arm/Kconfig
+source cpu/Kconfig
 source alpha/Kconfig
 source avr/Kconfig
 source cris/Kconfig
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 893a7bff66..d97015c45c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -678,21 +678,6 @@ config ZAURUS
     select NAND
     select ECC
 
-config A9MPCORE
-    bool
-    select A9_GTIMER
-    select A9SCU       # snoop control unit
-    select ARM_GIC
-    select ARM_MPTIMER
-
-config A15MPCORE
-    bool
-    select ARM_GIC
-
-config ARM11MPCORE
-    bool
-    select ARM11SCU
-
 config ARMSSE
     bool
     select ARM_V7M
diff --git a/hw/cpu/Kconfig b/hw/cpu/Kconfig
index 1767d028ac..f776e884cd 100644
--- a/hw/cpu/Kconfig
+++ b/hw/cpu/Kconfig
@@ -1,8 +1,14 @@
-config ARM11MPCORE
-    bool
-
 config A9MPCORE
     bool
+    select A9_GTIMER
+    select A9SCU       # snoop control unit
+    select ARM_GIC
+    select ARM_MPTIMER
 
 config A15MPCORE
     bool
+    select ARM_GIC
+
+config ARM11MPCORE
+    bool
+    select ARM11SCU
-- 
2.44.0

