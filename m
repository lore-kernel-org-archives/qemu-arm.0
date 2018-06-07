Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2116212wrq;
        Thu, 7 Jun 2018 06:39:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKFk2ZqhXazYNyOXnnhH2qaMHvO08P4QkhPbBXFaMiVPpiPn/w54/1GfT91ROTVg4aGrCzq
X-Received: by 2002:a37:4249:: with SMTP id p70-v6mr1447911qka.297.1528378790743;
        Thu, 07 Jun 2018 06:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528378790; cv=none;
        d=google.com; s=arc-20160816;
        b=PQugbKuLxFl0hLafyhfBOYBaXGB6ToDV0jP5jRgk1akiCW/qDUO5LtFi2Z169Mh3X3
         4/QuZK4caYGdKKbOaSstgYJ7/x8B18BChITa4sJnhG4sRz64RGjWtFj/jY59vLBRk3xe
         ZTIHzI7NapBGDDkwnBSPZEG3ez/O0M5hrN+Thd4RTGrwJkpMEiwOUe5yIMHygV9G8slB
         8lhW8RJjzh+uU/wBrHoHbIDQk+77z4YYmeJ4rLLQE/0nscRixvulMUkh0cahE2my2ES5
         tMkYiTbKms0xXfPO6aekkEgjfq8GTeianYuNZCEhGC0/dwlYjCf6EZdyO+ZB7zp66GCq
         MTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=XT54n0bYpM7E7wU+jTQ0U7Co5cATAKNISde3IK9HpmY=;
        b=juOGqHrbKJrpLzvUydPs9TK2NbMWujPI2D0OSoEcz05Q6JBZpky1cizkA1M/NTRg8Y
         WTWG2ZDcfQ5M6q51eKbG122+ldaUgIjepb1uHbvqV9FnaXpKnADyWT+sc+yhPKwVUcsv
         OaHF94illp0xnrIt1qvTTrMb9zy28OmNMAapQkTi3pjTZE11e0CPTToJq2hnrxypzCKI
         HmxoGAY9j0DbT/GpsHBKH5lBJiwzEeD6rWq+vZXiuuOM3seJBWHL9ulRW/voXmShNK1h
         98lV4sCSqB3TJi7AFB+avMqXliD8fXpJUmJbEOUQPn2nZHG7zBdXbx62dwJhtxPUIYkM
         M8iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cSY4sWC2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u40-v6si67410qth.243.2018.06.07.06.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 06:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cSY4sWC2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQv8o-0007Eu-AD
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 09:39:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fQv7o-0006uz-TG
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 09:38:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fQv7o-0005bZ-2P
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 09:38:48 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:36942)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hejianet@gmail.com>)
	id 1fQv7j-0005Zr-Lc; Thu, 07 Jun 2018 09:38:43 -0400
Received: by mail-pl0-x244.google.com with SMTP id 31-v6so6169487plc.4;
	Thu, 07 Jun 2018 06:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XT54n0bYpM7E7wU+jTQ0U7Co5cATAKNISde3IK9HpmY=;
	b=cSY4sWC2hd9C14hAqQdMQwMauerfE13mUiloqFrLcxOitVFTiexAKCs8srhzEzfwCw
	Ge4KHfmVntXFO2FNXNz4iK+eLypDc/3I4URRaYonFjzJKErzjsKAB8K4PM11mmJinTQq
	eP6C6L06EU72HW/DOxXWPx0Hs9nk96mfhl4rpZB2adLrXbpOxZNAVnLbWdxdAe9H4Kwj
	ps8dRN/Anjhdw5LQpuNF0dqGORn60WhxVtKvqKbgkaduQwMk1aEHfGS06ZsBo7zlG6gM
	ZrzcEjn2FQmpzRZpLEao+AQdBEl6vhdPBxJadpF7MUrd/4EFV5OCol4f/cB1DU15pPT4
	lnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XT54n0bYpM7E7wU+jTQ0U7Co5cATAKNISde3IK9HpmY=;
	b=fuEB8hZEfqAHb06PtDEbPNKTWQOmVfNsQR3K2t+55u/fcmIwhplJ7C1UhhdFZUSl9M
	AqMfetL08lQzsUjHl9N1ReAC25GzRklGXqu+z66bzShv3njgs412eIbAd/DvZne0ybJg
	8FChWNcxBj4sj3/RHRS+ZUsLvGTERRnfZ86qJEFj3ywz+BnUPRED/13EgMeGQcE7oKxW
	cMmu6KGLVTdQablFEofs+FiHTgJ2SyFfkluYK3oxBXYTDrwj/fOWnjPjlD/Qf+4CVWKR
	AVJSJU3n9uPTzYKgURA257Vpzmpi3ZYIdquIesjotLcJU7DfbEAJppgbukeGfBWski0/
	zraQ==
X-Gm-Message-State: APt69E2q1buEWpzbxyccII0hd15Fh3du7iqdhEi4sas04RBzpXlAI9P7
	oSKKMXPgmD0iHRNeBLD0dV8=
X-Received: by 2002:a17:902:6bca:: with SMTP id
	m10-v6mr2131005plt.6.1528378722572; 
	Thu, 07 Jun 2018 06:38:42 -0700 (PDT)
Received: from ct7host.localdomain ([38.106.11.25])
	by smtp.gmail.com with ESMTPSA id
	g80-v6sm34634393pfd.21.2018.06.07.06.38.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 06:38:41 -0700 (PDT)
From: Jia He <hejianet@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  7 Jun 2018 21:38:04 +0800
Message-Id: <1528378684-14487-1-git-send-email-hejianet@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-devel] [PATCH] hw/arm/smmuv3: fix smmu emulation when guest
 smmu is in passthrough mode
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
Cc: jia.he@hxt-semitech.com, Jia He <hejianet@gmail.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O6984FzWve1N

There is an exception when I passes iommu.passthrough=1 to guest's
kernel boot parameter(host QDF2400 kernel 4.17, guest kernel 4.14).
The guest will be hang when booting up.

When guest smmu is in passthrough mode, entry.perm will not be assigned
to flag in smmuv3_translate. It seems not be correct.

After this patch, I have tested in 4 cases and all passed.
host smmu on/passthrough + guest smmu on/passthrough

Signed-off-by: jia.he@hxt-semitech.com
---
 hw/arm/smmuv3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 42dc521..5c46102 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -560,6 +560,12 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     }
 
     ret = smmuv3_decode_config(mr, &cfg, &event);
+
+    if (cfg.bypassed) {
+        ret = 0;
+        goto out;
+    }
+
     if (ret) {
         goto out;
     }
-- 
1.8.3.1

