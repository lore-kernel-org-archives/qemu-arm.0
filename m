Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp682269wrq;
        Fri, 22 Jun 2018 03:53:53 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJTBd7V6RNLXkT4MM+47xzeBadWlnJhtfpTGulKRkFYVr4spXF2miw2Av+J+VfwJ9X/O45Z
X-Received: by 2002:ac8:2e25:: with SMTP id r34-v6mr824216qta.341.1529664833347;
        Fri, 22 Jun 2018 03:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529664833; cv=none;
        d=google.com; s=arc-20160816;
        b=j/6FR2DTULo3GxDCYUX6qhM0/Ig7owmGrjOdhe6PjjVce3kkxERTlximgGu+mQ0bDo
         n6VZYYVUKEoj9gj4TBugdGveIn9ds20bEiK7NZ5gt9nhuWW6MpWy1sprgNAzDFC2IfQq
         2rxmeqVNVDM4gqX8R2/PSsEtFDcV9Zvfjr8SY9oQs+7OABIrlzn4qSC/sZPnYDeoJkNp
         jwOuOSXSkqHVjBLN4iGcofxW83EnY4C6MI2pfwgBMpir8Qnp6XtL3lkU7RaSmmH1x5lz
         08sZLUN8RuGfVSVYm6Bb+zCQQhsFek0hM491mq8+Dukireot3x7h/rYPok+8fioZx4v3
         ulmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=+kmkR6nThCnIWy9TO/Aq1TeDlmpHgXE/qS7ytzlitl0=;
        b=Ml0OA1lch6Ga3ywT11GoVZKGVibiSi5H7sk++Y+QaUGj77vcPTVyn1PX6GEPh9oAOL
         OlljMpP+4t9E4WOdazF4FcHxvRN2VULHX3ysMV/9hjiqHMXSURnOfasIuAZ/s3QlCgPl
         3pAuXL6wGUP36W/8uUcC68wE3xpjLVfJX+NFRdYq/ppnt4aKOIQ1o9bLt6tkf4LhIm29
         f8qtD31PfrSXxaQoxS+6EZEFh7rb2wJF4or5UHJSMxsI/aX+k+T2+1k5Jw6f/PDjA1sc
         7Dj7jndZ3wcuCJovVSuym61WieDxZIL8zGBbPdaZ+VzvlGDF2dZR/7dZYUbFjA6sBPCj
         lkyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MvlJNhJs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5-v6si6554298qvi.257.2018.06.22.03.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 03:53:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MvlJNhJs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60773 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWJhQ-0006JR-P4
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 06:53:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fWJRR-00023n-Nx
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 06:37:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fWJRN-0004Pe-Pk
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 06:37:21 -0400
Received: from mail-yb0-x242.google.com ([2607:f8b0:4002:c09::242]:35415)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1fWJRN-0004PR-L4
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 06:37:17 -0400
Received: by mail-yb0-x242.google.com with SMTP id a16-v6so2372051ybm.2
	for <qemu-devel@nongnu.org>; Fri, 22 Jun 2018 03:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=+kmkR6nThCnIWy9TO/Aq1TeDlmpHgXE/qS7ytzlitl0=;
	b=MvlJNhJsVecrCy7+NiktvouLUzr8du9+YTcmra74S0pEwPk9ZYj9PEHNTv003G+JNK
	f62WaYL+hKtMEFenEV/gAGIZb0pqx/jWOtiLNEBvdmcuGsNRhxwvD+ES/B+35r5rZ837
	ijjv9T43xQqStagxxzaNxqcizrwLB/x/MFNsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+kmkR6nThCnIWy9TO/Aq1TeDlmpHgXE/qS7ytzlitl0=;
	b=T2cXQae/pmTS5Qhuy2iDqEXPe9cHnJPJmODkAyM++jc5kP2gLosBsbVR9mGDlqa4J+
	cMrjrOZpIVLv7Z8FoDU39o6oQeKOsJvEMkYUhBbtTvLfyoDSfKh50BzCLudb3/TUttkE
	vN8ISBc5YdreCzIeXLvAleQ27CZnAJTGDty8M52qreO97HaRlCU6IDPtqNJfNGg6O6xb
	NJnLVb/aq8/2V1Icl33sg20c4SU7DQJSJqFa8geDnQs0DYnabD1MJn5uGFLS6rTf0JEX
	mjxBLgmdq2G2kfxOZTXF00HfBakq57n6GFt8jG9FigULpHbLe7+ZofEvBdKK8w5AtXHx
	t8CQ==
X-Gm-Message-State: APt69E04VTM6kUAgJ89t7KZ2ffGwS9K7sjkMdE/fAsJgnNHiRDdNyMGg
	JyTIvdXpkqmjaYSR0n+QXB7cIQ==
X-Received: by 2002:a25:fa02:: with SMTP id b2-v6mr452946ybe.315.1529663836554;
	Fri, 22 Jun 2018 03:37:16 -0700 (PDT)
Received: from localhost.localdomain ([104.237.86.172])
	by smtp.gmail.com with ESMTPSA id
	w3-v6sm2594614ywj.66.2018.06.22.03.37.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jun 2018 03:37:16 -0700 (PDT)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Date: Fri, 22 Jun 2018 18:37:07 +0800
Message-Id: <1529663827-28854-1-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::242
Subject: [Qemu-devel] [PATCH] hw/arm/virt: fix psci conduit in acpi when el3
 enabled
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lAVa0Sf5KbNw

When QEMU_PSCI_CONDUIT_DISABLED is set, it doesn't mean all the PSCI
conduits are totally disabled, it only mean the QEMU built-in PSCI
support is disabled, in such a case, e.g. EL3 is enabled and external
firmware (it is usually Arm Trusted Firmware) is loaded, SMC should be
used for the guest to trigger PSCI functions.

Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
---
 hw/arm/virt-acpi-build.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 74f5744..e5b4947 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -715,7 +715,11 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
 
     switch (vms->psci_conduit) {
     case QEMU_PSCI_CONDUIT_DISABLED:
-        fadt.arm_boot_arch = 0;
+        /* This case means QEMU's internal EL3 implementation is disabled,
+         * but when firmware is loaded, the guest can still use SMC as PSCI
+         * conduit to call external firmware PSCI services
+         */ 
+        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT;
         break;
     case QEMU_PSCI_CONDUIT_HVC:
         fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT |
-- 
2.7.4

