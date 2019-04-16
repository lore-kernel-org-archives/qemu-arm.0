Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3365548wrx;
        Mon, 15 Apr 2019 18:39:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyisKtuysTuRlffbHT79i5SKExryGVjUkVDVuH/GuyjDTPaFtCLv4hGs4+teoxsKrhAIPPJ
X-Received: by 2002:a1c:6783:: with SMTP id b125mr24374759wmc.41.1555378792098;
        Mon, 15 Apr 2019 18:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555378792; cv=none;
        d=google.com; s=arc-20160816;
        b=BNUqgIFI7s9MhXGsxo/mTrDUgfcl05QY7TU34zxeCqb+PEMacwPLG3uw+FCteo/94R
         QvxwkdpwbUlQhzkZYY+vNwmXXz+KsOAyneyR5i8lUufjI1W5YneMDqxdiozMhDEk0YC9
         Rau9Ze+WG43X9jAW8+JSmi+T8V06/tGSTKThDiai3X45Cosdyorjt00WLKTwL/tBdpow
         TIzVmvS2dphqlqoAyh2S9MNP/NybuHAojp96k1lbbxTc7Q6x3/sX3YjrIEF2FLlGswqW
         Sve3cyWUDqkAUc/sqoBBBx/+vYpS4tCWfHRBf8l88vzHbe5BssW2IRPG+Ru1WuI5Ky20
         sClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=HyeSXtTi0HQGgMHm9SM0E/AgTMzg6uy5FrM4vtsvYjI=;
        b=LzPUrzEwovXjTP4UDrqZXLJlF38v040E76mZpqaE/QzF2gMvXqwOMMNnvyRr3vqghe
         pOVY+0OCZyRcjLWPQMH+/5EiWNCLvvIpuunt1FLGqcMojiWa6oPIJ72t9RN/VZ8LiWWf
         pcC1qmkZyiXmhWx2XbGEjCAkKIldbOdWSiKnGrWmHO7lewIvpJt/Peq03jb43V9g/gmJ
         kwpmcI3Wqwn0323k0DdvkTge0lV+zLNK4xDlvM8ZSPwv87rAMXm+QNAKwnKUN2xis11X
         /gKasPKyBizsH5ztybKVelzJJ+60tZYjMlxBtGjlemCFv4wqIndlrwyiR1FxfRW0qPKN
         yD6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kryYvyWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10si34258707wri.15.2019.04.15.18.39.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 18:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kryYvyWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:57782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGD4h-0006TU-3A
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 21:39:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4R-0006Rv-23
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4Q-0007na-2B
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:34 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36822)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1hGD4P-0007nC-RT; Mon, 15 Apr 2019 21:39:34 -0400
Received: by mail-pl1-x643.google.com with SMTP id ck15so9490824plb.3;
	Mon, 15 Apr 2019 18:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HyeSXtTi0HQGgMHm9SM0E/AgTMzg6uy5FrM4vtsvYjI=;
	b=kryYvyWFlB1f7D/S0hTTm2TKpmJ0zAdUcYaou7GfWqVAs+0iSZGdI/c+2FMlqUkvLK
	NDRC7Z38xvI03qLCseG6Sk1GMDJiKpiwh4eD70NONO5VdIPQ2j7PzzwOgz2neVCc0nff
	rLbj/XcvWN4ZrNH3tmofXTLpGC7bYKPhvr2Yup2s11iukEzWrcAKcfxiXc8UT97LVfUx
	f/gzuBo7kJy+IklAv3jDK0qFlnCOb0WlNiRSBbgBOw7lalBUIZVFJqP7DQnmHU06CPoU
	/GqC3O0yoppDgluXmiT6k7C5dbhhmyC9v3MqXVHmx+ebz+XfIGib8KD4epIgqXpha0ST
	F72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HyeSXtTi0HQGgMHm9SM0E/AgTMzg6uy5FrM4vtsvYjI=;
	b=hyKdJHd9TUAmHyAZsDD+B6ohUWJY1Gyry3WcQk1SCoWEvPD56GWoHc4mKShZtmcUDs
	p2eCHziHbqa4z1K0fb3VlgiULS6gQMrzg8be8l822EN57CHVuXtiRvaDPW0OuPCSPg6L
	rNMSbG5dXTClpBdK5ww8QGyeKAkhRahMJZxNo25UopmpgSVwdlBxlmaTO05n3XmbmNoL
	ribqIO3inENvuPSjN4X/aTliL5ferGc93IhSvRH1iqWKYo0vTLJ/4VkLw0rwqT58/pCa
	H89H5CI+81Gc/3iD1ch9dvwS+pS9C9caa72vKmPCsDz4ukSPspoRuNX4Gyn8w8i79GZu
	8R/A==
X-Gm-Message-State: APjAAAWRQb1W45OQ7FsYXC1iIQ58jjq71jJq0X71LyY+gOrwHM9eJViY
	9i4pFBRlsNGuY16buCdKNwxrVy4x
X-Received: by 2002:a17:902:1124:: with SMTP id
	d33mr55345928pla.268.1555378772610; 
	Mon, 15 Apr 2019 18:39:32 -0700 (PDT)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	v20sm74710362pfn.116.2019.04.15.18.39.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 18:39:31 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Apr 2019 18:39:00 -0700
Message-Id: <20190416013902.4941-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416013902.4941-1-andrew.smirnov@gmail.com>
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH 3/5] pci: designware: Update MSI mapping
 unconditionally
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wrIE9ykMvdas

Expression to calculate update_msi_mapping in code handling writes to
DESIGNWARE_PCIE_MSI_INTR0_ENABLE is missing an ! operator and should
be:

    !!root->msi.intr[0].enable ^ !!val;

so that MSI mapping is updated when enabled transitions from either
"none" -> "any" or "any" -> "none". Since that register shouldn't be
written to very often, change the code to update MSI mapping
unconditionally instead of trying to fix the update_msi_mapping logic.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
 hw/pci-host/designware.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 29ea313798..6affe823c0 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -296,16 +296,10 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
         root->msi.base |= (uint64_t)val << 32;
         break;
 
-    case DESIGNWARE_PCIE_MSI_INTR0_ENABLE: {
-        const bool update_msi_mapping = !root->msi.intr[0].enable ^ !!val;
-
+    case DESIGNWARE_PCIE_MSI_INTR0_ENABLE:
         root->msi.intr[0].enable = val;
-
-        if (update_msi_mapping) {
-            designware_pcie_root_update_msi_mapping(root);
-        }
+        designware_pcie_root_update_msi_mapping(root);
         break;
-    }
 
     case DESIGNWARE_PCIE_MSI_INTR0_MASK:
         root->msi.intr[0].mask = val;
-- 
2.20.1

