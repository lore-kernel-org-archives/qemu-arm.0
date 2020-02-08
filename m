Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1922115lfp;
        Sat, 8 Feb 2020 09:01:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqxT1H59mCAVbXBO5eKbfB3YCrz0J08NqCK+ATlJ+QvUiXmW2Vnf7ibpKS7HudwPU4ATp3n4
X-Received: by 2002:ac8:1866:: with SMTP id n35mr3434445qtk.28.1581181286173;
        Sat, 08 Feb 2020 09:01:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581181286; cv=none;
        d=google.com; s=arc-20160816;
        b=YSvTZHMASTI9m/HYDSw0pb9HlEJqBOfnx8JsvyogU7uEhe6IHXpQkXTRDmOwjdkaLK
         SDHhYfuPuQKxJ5xTDl7UzBFzXb8PbwcY0g7eWOn6jWx9sh0wD7GhDJ0EzwgPB/7buA6A
         UCnDLkmgVXKFxQSanoJaFX+7ORiONUXa2ByL4HJhY+YL4W6HNwyMhOjxVMFT+TOix2yx
         +aiXopGm9giFgak6+G/njYaX4ex+d3RfA9B0Dkc0pqko6ihXSYExkPjm9M4U4Y40V3qx
         Jzt7rUFxX2o1tKLtSLORDkb5dDO0/pEcxUl9tuSyYT8d5qY/pteGjhoLWXLV5gONyjvn
         f5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=I1ANtru2D3HkYCis4oA6m7f9tmoOY3ITOVs2JLAacGI=;
        b=BoT6ok+oGJPVOyPfIc+RGOjjDrWl9vqgnUbUQKlsP/i4fp1nX0vB/mUMbDmX98a3uQ
         sQF4t4oNDjevjY0dehNLiPUHrfGdKLPVVzA2ChcFvPFSyLgmldGtSGCWW+5MNa/SZJ/5
         5TkLmX+0kYvcQeDUzq9V1grO+Tfru3NpDXaXbNFVFntN1g4hFXDg3OVjgmwYcVQ8rKkQ
         +J9qoxOxRG6FMAZ4/XytqNl2P4B1GSE8pIdmczyRq63qKMmmTYyQ3V7Rbt3DcmuPIo6p
         HzeN+VcabMG/FiwdlOdPv4hqD2uhn4bH5W5fp38HXhrO9ZZynQGtd5g6eV0aw+eC+gXS
         KUPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VZk8ndr9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si1626623qvk.88.2020.02.08.09.01.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 09:01:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VZk8ndr9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0TTx-0003Xp-H8
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 12:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ1-00064x-QN
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ0-0001pw-Hj
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:21 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42576)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ0-0001pK-B0; Sat, 08 Feb 2020 11:57:20 -0500
Received: by mail-wr1-x441.google.com with SMTP id k11so2466913wrd.9;
 Sat, 08 Feb 2020 08:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1ANtru2D3HkYCis4oA6m7f9tmoOY3ITOVs2JLAacGI=;
 b=VZk8ndr9V+wlgKGno4YlyVHLYbXW72LQtDapq/FsBaTeEB4SPSw+/mqKGs1CSgS2/K
 Py/aY80pR7H8mz+aScCydnvg+9VLZpMnCHTZ0aJD7kNGIj5ZVxiJcT3vQCWxoV3RPqE6
 RNhXnoIhd4eNn8/koSSRHGCDg9KJ2C3Fex7iVm3c5Qk9zu6qSufYCnPy7kCJVPhCHAd5
 iViKiEhZkeTl5j82tlzMmjCSoAUZXYq9XUN9azo9pJ4n1xwv2N4cFx9iuQzL/1JZHV78
 Amy4YRDSfvOMCwhUUzhHiGWntqUvYBvaUPPRvg6v6gy2ZDHxO6guIKTskO0Yqbdap+ah
 xupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I1ANtru2D3HkYCis4oA6m7f9tmoOY3ITOVs2JLAacGI=;
 b=lEm64eXsp3uHXsZOCHvz8GIHCRzvAA3FeMJal1mJY9JmglP46GkxNv5H042SJWbIH5
 zMi2if6M3BgGigm3GQK3VbIsNnJJbqa9CD//juZQFLFgGoGBjlPpRRH3TpQOMs9Sm5s1
 BJMIfma0nv72dFr9b9gPb4dKojzEdAU3rhWFGuyq/4etBNjJweSWwGDeH239l8N5JKT9
 NAYEMNpr7bCmnNxYQGDccBbPFomVbAVYyizla33DCkd1tUjvJ4QPluvt8C+CEkk0NWPR
 03VJ4g/IBrjjACeHp4IXGyj3DjRuYwRsTgTtDZ1BdkGrCl2EjVo0btgBmAT9WejAElQx
 cxmw==
X-Gm-Message-State: APjAAAVgyVsvJIqQ7TSgXLTAECdCDK6/xZkCWrlltDoUMuVcbCVutIa2
 qgvBZ0dagJkxwz08fGC4OtyBEXO4
X-Received: by 2002:adf:ea4a:: with SMTP id j10mr5927231wrn.119.1581181039263; 
 Sat, 08 Feb 2020 08:57:19 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a5sm7872763wmb.37.2020.02.08.08.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 08:57:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/13] hw/arm/raspi: Set default RAM size to size encoded
 in board revision
Date: Sat,  8 Feb 2020 17:56:42 +0100
Message-Id: <20200208165645.15657-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jxKl+hnLKIOp

We added a helper to extract the RAM size from the board
revision, and made board_rev a field of RaspiMachineClass.
The class_init() can now use the helper to extract from the
board revision the board-specific amount of RAM.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 1628b0dda7..f0dcffbc2e 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -296,7 +296,7 @@ static void raspi2_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = BCM283X_NCPUS;
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
-    mc->default_ram_size = 1 * GiB;
+    mc->default_ram_size = board_ram_size(board_rev);
     mc->ignore_memory_transaction_failures = true;
 };
 
@@ -317,7 +317,7 @@ static void raspi3_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = BCM283X_NCPUS;
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
-    mc->default_ram_size = 1 * GiB;
+    mc->default_ram_size = board_ram_size(board_rev);
 }
 #endif
 
-- 
2.21.1

