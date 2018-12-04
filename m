Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8070251wrt;
        Tue, 4 Dec 2018 05:30:49 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VyCTzmBdJkwtz5Pp7D11myRglwtDS3Nx3Ge/0fqOHUaM2WAakE3ctaHSq7jG6HRkgeH/BV
X-Received: by 2002:a37:4f8a:: with SMTP id d132mr18211486qkb.17.1543930249306;
        Tue, 04 Dec 2018 05:30:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543930249; cv=none;
        d=google.com; s=arc-20160816;
        b=G2Y1boSeYlr0sEd9u7m2bNjfgrqd/hPmRdXIBcgO3rF9L34JfL2EBKBsma90dr+d2b
         15k47eveO6m9LImUhecG9E2MEwLQ+aO1SfyLj72lh+hjbnYF/jIZhofuey1Xwvwmb5fD
         bJxPuAxxUL4bqVdI8BuKI3Z5A1ERwANxiQConFZ+r8HED0rDjRLHofn4dG/gSUrOgh+9
         H9YUsNv2/8++PFaY/8T/P9a00npMLiZvVRdNZVizRH88CWfXLmkzwQDRCHjiQQ3ZBEy4
         OhJzbM9blpLNLMgDHOWHK0rYK675MTMO0XJtZTobHAZQ8xfS1AoNRPgaGH68OxOk7mFJ
         UWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dVUOj6WpfKVEYGsvW2icnxFYs7HyXKfbA4YvqKiZlg0=;
        b=oyoaBiwV491FCIc+fG8nm3XFUlaZYxGo2ZRV1KOz7LfS4wPWnbsgxBwtvxGYR9BqVe
         +caVNrwpvjeonSECtU7F7h+LBYb0dLN+DcjSGOjJpUEbrACKa/0vOv4fuehEb8WlUCZw
         aH4FuMm3PqNCIO0n0D6mG/4uBPw9kFxYhOhnX5n1aJB2gBk8u+G20ZJjybEwxlBO39GK
         Zge2icVbGEf3saxf9eJeVkcbUP7A/uryp8sG2G5cFAuyJlm4J7e5e/JlMTPbPGvjWCuK
         4bLRigjPHOy7Vnj+uKPI2wAjzb0dMpBiGrOTnRF7fNhBlrWunk+JjVmkMOQ2c94oFTPT
         lkvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2si54883qtf.302.2018.12.04.05.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:30:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUAmm-00086N-HG
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:30:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAm9-0007jH-0Z
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAm6-00011j-Cc
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:08 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:53236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gUAm6-0000pO-4y; Tue, 04 Dec 2018 08:30:06 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gUAlu-0008C3-3R; Tue, 04 Dec 2018 13:29:54 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  4 Dec 2018 13:29:49 +0000
Message-Id: <20181204132952.2601-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204132952.2601-1-peter.maydell@linaro.org>
References: <20181204132952.2601-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/5] hw/arm/mps2-tz.c: Free mscname string in
 make_dma()
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5rFNefoi3tps

The clang leak sanitizer spots a (one-off, trivial) memory
leak in make_dma() due to a missing free.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 6dd02ae47e8..82b1d020a58 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -322,6 +322,7 @@ static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
     sysbus_connect_irq(s, 2, qdev_get_gpio_in_named(iotkitdev,
                                                     "EXP_IRQ", 57 + i * 3));
 
+    g_free(mscname);
     return sysbus_mmio_get_region(s, 0);
 }
 
-- 
2.19.2

