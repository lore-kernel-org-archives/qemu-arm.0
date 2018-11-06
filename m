Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp1097974wrw;
        Tue, 6 Nov 2018 08:38:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5eTYTdL8hSu/oPg7muFTPA/N7cLMFD6N/3KqsdDCfYB9W3KvmGFBA3+Nw5+gf66XC8uDmYf
X-Received: by 2002:ae9:dd42:: with SMTP id r63mr18786105qkf.264.1541522302445;
        Tue, 06 Nov 2018 08:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541522302; cv=none;
        d=google.com; s=arc-20160816;
        b=J/UGCgEx+6Wouj62a8/FTbX5xEp80CqsmkHXb67PVrUQWmhjbsMIslCpXj88NyhtCE
         2Abz7uBOSusEGqFOdfpzW1YsB0qnhiDLo/jM5HcAcurnZeIV8y0eLz6MvbxwO7F4+WNV
         ikvWxHanqhkszTDtuEzN6cczal5vkrwsl7KRFiUs0XloCns0bLMhY3mIxUPwBj/jfOR7
         86OLUQXDocnIm9TWI+kbr8++UZ0d4r3BZ6rov5GKYMIDRPC2WKvgbO3eGv8vEvYRU8ft
         b0ldjJ6JwT4j6fv1ysr1H7w02zMPNfyHVg872AM2mh5fBKVwo3oAOq2Ml4Hz80RCay3q
         pNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=zG3QGUCjEHS3pElQsZV+ebAY/HVCdSx9z4zHa/1B2wc=;
        b=02aTjQFoGgf3Iyt3zSfre+ugENCI6H9zaUEEusliTbM3JzFKqZ2H9Ld1g4wrQ8jflx
         KdLZFNJkz4PHcUfoyWUrzCBWm5dj7qi5eTuiCzSmbpNSCvCKjnsI1P/04DL9wr5Tz1TH
         TFaslXxUxqpxhrZ9nDnFIIzkEXvJ+dsyugxEKuyFxAPMeqezClyp3vKKHuacc2mck5XN
         fPDci/NTdFjXoX8y1EOSMB8hE1bglzb/FM/K73sn1o58mUoVJaY0nWEQrzRaL1U3caHg
         4vy0NazG+nbo016ZOcmmAXoSBGFPq2rNPvKD/tw5nUtDNfGNtrAIMaBJeaQ4reAxPovn
         pxmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i2si2080138qvg.76.2018.11.06.08.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 08:38:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gK4Mw-0005rb-0G
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 11:38:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gK4Mm-0005rJ-7b
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 11:38:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gK4Mg-0004Wp-Cg
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 11:38:12 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52390)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gK4Mg-0004V2-36; Tue, 06 Nov 2018 11:38:06 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gK4Md-000842-Kl; Tue, 06 Nov 2018 16:38:03 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 16:38:01 +0000
Message-Id: <20181106163801.14474-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.1] target/arm: Remove workaround for small
 SAU regions
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
X-TUID: BMjzM2foJw0u

Before we supported direct execution from MMIO regions, we
implemented workarounds in commit 720424359917887c926a33d2
which let us avoid doing so, even if the SAU or MPU region
was less than page-sized.

Once we implemented execute-from-MMIO, we removed part
of those workarounds in commit d4b6275df320cee76; but
we forgot the one in get_phys_addr_pmsav8() which
suppressed use of small SAU regions in executable regions.
Remove that workaround now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 96301930cc8..ec56becc394 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10560,18 +10560,6 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
 
     ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
                             txattrs, prot, &mpu_is_subpage, fi, NULL);
-    /*
-     * TODO: this is a temporary hack to ignore the fact that the SAU region
-     * is smaller than a page if this is an executable region. We never
-     * supported small MPU regions, but we did (accidentally) allow small
-     * SAU regions, and if we now made small SAU regions not be executable
-     * then this would break previously working guest code. We can't
-     * remove this until/unless we implement support for execution from
-     * small regions.
-     */
-    if (*prot & PAGE_EXEC) {
-        sattrs.subpage = false;
-    }
     *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
     return ret;
 }
-- 
2.19.1

