Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp813063lfp;
        Wed, 5 Feb 2020 17:21:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzme5eKjH/pwpQr0DgiwTPo6Y+SmWIJ6ysq5hQOTfO86rgI7bdLNS7fre0t+4LNCF9AhMWt
X-Received: by 2002:aed:35e4:: with SMTP id d33mr506365qte.389.1580952116428;
        Wed, 05 Feb 2020 17:21:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952116; cv=none;
        d=google.com; s=arc-20160816;
        b=nBibeRm4Bea3N8d9IQK2YMqTvjvfHkRYzbFiJ+JUAqS/sFnmXo+JN/45w4qj6/KdnP
         70mO+gibyi1JTUcsIskGkXAHClckNwwESqjq4E84PWrEhP1SZk+wvkIkNyn7F6ZkhJux
         VSMbF3zD1RzGyBqeKukXuRFUpY/ey5KJ+5swgF5cZcjHAI5AZRLjjkiDNkQss3a5GF0e
         K2of+PpHm5d1BQWR+ZQ6JGN40ekgRyRf512GI+DfUr20MkI8tfCzmDh9aCw132L+slPQ
         aywR7qjdI0MMeRNTebNdMdJWeVm3sjo2wV9qFzxdX3ENFyJngGqQuxCwvr22tZ2cwNBS
         poQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=26NlFhB7W/cGbdiqG5QYqxUB4TwmMhCNQJ4yaNv34Is=;
        b=JdLhHIXaFVP8kKOR/4YRhIeXCo4tdgFSzQy1mRzDHEEE8WELSEnF+05eLdvWNCslwm
         hYzsHS8Nni5OSrZEAabBeInAROCYuTeJbdbCpkYQhUljoN/Qx3425acz+QIyoHKBFTim
         V7uWqJQ2TlCom0jExz4j/sR02cMxAB4gyo1OYgOz4lgn5cOWK3UZbkUPkeZLYOVHFuZH
         2wLCFSp6KhHIhXBr5dwfYRHw1ITEiXj7lvlEWCmuDH7/qqr76FL1Sh16Rdzoo7VF/9er
         6YyFIWqmD5Ze4otIxFc0TtgzY/3Y3NpxcfAHcMuiLY8dduGVYtIJCgbM2bB31KOhK1X1
         Anbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mNXgTA7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si771370qkj.177.2020.02.05.17.21.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:21:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mNXgTA7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izVrf-0005X4-Qt
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoJ-0000fi-Sp
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoG-0002rf-SA
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:26 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39337)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoE-0002i6-Ri; Wed, 05 Feb 2020 20:18:22 -0500
Received: by mail-wr1-x443.google.com with SMTP id y11so5131491wrt.6;
 Wed, 05 Feb 2020 17:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=26NlFhB7W/cGbdiqG5QYqxUB4TwmMhCNQJ4yaNv34Is=;
 b=mNXgTA7kADDjSX/C1lu3LYdrez6H66N07uAVR5iI9y1uJV5CkjfSACSIQMDrNLEPuK
 xyjDVSvzrp6xnJeUbAGN+71rquyTKTnICaQ4FhoqIvxXhH13hYghOS2mlhZ3ZVKl/6Kn
 fiN4rUjbe8louxbxG8us2qDadtUvJeWCC5KjQUshwkOX02jFbRu0LVP80Bz4dfek1G5w
 rlLXVqxVseaSkylXtqtldqkwKfuMj9cbGl1KzsYzkan67WGvSJvtNPNXiAREv6HopDGD
 jctgDLuZPDgZhmH8umZjxVTfac1FQWp2n4H3TTrVdCEBqyDEs6C6i3kWQEF73bTo7I7B
 OgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=26NlFhB7W/cGbdiqG5QYqxUB4TwmMhCNQJ4yaNv34Is=;
 b=OTFljgnJ4gHbXMjnXUei/fz8ObrU9VJ4bUZOrvDb8k8s336WOfDEgfrO1UXRhkrQOm
 FXmGIuSzkorFYJmkI8wZ1P3eoUXah0Lbzsu93aoEjsimX9TrrOdPaK2LJO8J7ytOXBVq
 OzScAh71GpiffMwMbG6O7+xAs65KX0+5w3FWYAsh8VA5dFIRmfOKKN1nGPhUvgvyV3pJ
 +epZ1B3I1i5cVDjjoPHav1krTLIhCnekfNvB6adCjDCzeUqwMv9L+Vf4DSrWU0BDNe5i
 ZF96Iu0eoyBEI0VRz9cqPBcCKM3JiyU/L0ZqF5wlftnbaj48e3JmphmpweR526DO2znX
 4kqw==
X-Gm-Message-State: APjAAAVdTYYzKr+ZvtT6T6sGVnIFcJ84XgGteJ/GDaxneEWNLpqWrJyQ
 /bF1/2LkmXdgAGZDfTFKEQ/dIImT
X-Received: by 2002:adf:bbcf:: with SMTP id z15mr376135wrg.266.1580951901629; 
 Wed, 05 Feb 2020 17:18:21 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/30] hw/arm/raspi: Set default RAM size to size encoded
 in board revision
Date: Thu,  6 Feb 2020 02:17:36 +0100
Message-Id: <20200206011756.2413-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X9zfNFaTC+2g

We added a helper to extract the RAM size from the board
revision, and made board_rev a field of RaspiMachineClass.
The class_init() can now use the helper to extract from the
board revision the board-specific amount of RAM.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 651585ebfb..43f8b1d677 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -295,7 +295,7 @@ static void raspi2_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = BCM283X_NCPUS;
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
-    mc->default_ram_size = 1 * GiB;
+    mc->default_ram_size = board_ram_size(board_rev);
     mc->ignore_memory_transaction_failures = true;
 };
 
@@ -316,7 +316,7 @@ static void raspi3_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = BCM283X_NCPUS;
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
-    mc->default_ram_size = 1 * GiB;
+    mc->default_ram_size = board_ram_size(board_rev);
 }
 #endif
 
-- 
2.21.1

