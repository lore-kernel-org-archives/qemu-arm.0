Received: by 10.28.91.67 with SMTP id p64csp3703108wmb;
        Tue, 6 Mar 2018 04:55:59 -0800 (PST)
X-Google-Smtp-Source: AG47ELvXnwTaAMS/B0D5kNLsbT/YKfSU3Q/MrLpTaBlC1qUGWga8xm0s/1eMg/on6o+I9mAlG5Jr
X-Received: by 2002:a25:af8b:: with SMTP id g11-v6mr11561760ybh.134.1520340959029;
        Tue, 06 Mar 2018 04:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520340959; cv=none;
        d=google.com; s=arc-20160816;
        b=0B3+UhkZBjlE1iivYwy40fB94ZxUi+cGwDHWT8t5ztje1TU4dr93hQZ1QHR4SwglE9
         V7r4uQJKriS5Bu0I+okAnkBsY2YU4yHxHXEZLW/mpvdFJgF5xyoHsCMkB4jRFZJ1tWR6
         XkcwSddNlnFsAD/iOd0m5ebQdhGeqrTNAVM+xH5K3N0c63jE+ziDxEw6iX3K4/UtRkZH
         ptdIGpiqzjc00nvOK14K++NkSqotFLhe5ntrHXsGCcVEn1gwSbIurpkTFmNQD0eusg5d
         nfWoeQaUVGc9XRMEL7Pnl6j9VexfOB8w29mIyIlGrQ5LKy+G0d1jtyeoyjtlIzckZLn5
         +HgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=dJz6U01+3phS1hrzCLSyo5aW74v7Fol+ieZ2/Cp207M=;
        b=fnTr4EohoszYp8TYhUJjUC3Hh5KTZIbj9+1QaE2chDLuSe9R0WfUhrsYInB4B5KgWI
         5NenhyQkIUaHKlu/4DN7Qd4vh470Bvv+2E/N3lbHDQK3eve8TWOtFDaJD79ECiVL68OI
         0ticgAvt/7y9V853VD2ONHaFzMttLFuK1ZAZZPRkAqVAspAtQpHi4anvIS/XmIUitkpb
         jduuHwvBH8ozFogEykf1c60qxViMiuLiACAfckXxxfS3MhwaPmXXjzAsxaXH7Yjd3q2j
         zudhEWz+MEb2/qFX9JMrF6gawNL3G+lf9gBq6UWN4lVfEOFamaMltegGqGRcj9kmVrkT
         U6qg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l188si2488784ywd.262.2018.03.06.04.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 04:55:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etC8M-0008Td-F5
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 07:55:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC83-0008Oi-L5
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC83-0004qN-0Z
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:39 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1etC82-0004jX-Pr; Tue, 06 Mar 2018 07:55:38 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etC7v-0004WW-1Z; Tue, 06 Mar 2018 12:55:31 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Mar 2018 12:55:25 +0000
Message-Id: <20180306125526.27838-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180306125526.27838-1-peter.maydell@linaro.org>
References: <20180306125526.27838-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 5/6] hw/arm/virt: Add "max" to the list of CPU
 types "virt" supports
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rJQYGt3nmsVR

Allow the virt board to support '-cpu max' in the same way
it already handles '-cpu host'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dbb3c8036a..cda4b83586 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -169,6 +169,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("host"),
+    ARM_CPU_TYPE_NAME("max"),
 };
 
 static bool cpu_type_valid(const char *cpu)
-- 
2.16.2

