Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp755679wrd;
        Mon, 20 Aug 2018 07:33:10 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaNSta41RPQ3LVHiVW2N5tQ/fwDWDpuS4/ktjKLsKoBVBZ7nWmR83ZnA7qLIvn2WWKZu3NJ
X-Received: by 2002:a37:1c9:: with SMTP id u70-v6mr5833259qkg.135.1534775590749;
        Mon, 20 Aug 2018 07:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534775590; cv=none;
        d=google.com; s=arc-20160816;
        b=j64loIPW8ff6zKO4ZGcgjxn57EyEBL4z6o3DRzbtl0ayeN/jh1TxPfOl3TgnBaFsJV
         BCJYr/vj0Q9/tJGMFUoVv0W8X1iLPSm0H9Y29q9HQmStAgN3UBN6wevVUZGsuhq5eQ0p
         jAEM1Ns8G4QFO01Ds0Vp4a1kaxaBUwS0tiCSbs6yl1DudKlpLz2O2/zvGcw89KLN0km8
         s6P+8cAWh2tiB0Yu9Qhh68MHtr3dpUD1hDdS1idA/Q9YoQK/7p0WAlUAAvzwjXrbwZL1
         aVrJeCtqfpIoQ+vb4HiYswqV8SSliDbNv0FJJZ4vDSUVvoq8Q3cTg78E4WjccbB07GhY
         eZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=VQ+6PuDu2e5Ih/khbWrojdSuHfFXdwhFlTIWvCLT9kQ=;
        b=J2wA7t2zcKzzHay9HlTHAYFjVItxngexL6oAHYGSEA2qFAEK5s/2QEushho/zkSRNB
         MtPVsQN0dpqX3ZmG54k+ThD7L6sO12Gd8dnuQLFuqZe9JQUCGcWgbvD7JQ+2dlFkthkq
         ZvpBEdgNVqVYhbfFFUG5GJjp+EfG/s77VgxQlZcRu7fF8iqEutDQFLwEHvBiZKqGtiXB
         e016F5+7TpU4ziH5p1rItNhI8qsfI4Pbph3cJPeC9vBL2zved1HIfP18DTyZZU/UdeeG
         RlLTPBYAroXVLv2CsBUPPzS5CB+9DNy+5ZKUvZytCQhpoCKdfuJOxPIaNDplLyB4y8Pz
         qqoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 186-v6si8815105qko.53.2018.08.20.07.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:33:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frlF0-0005rW-7Q
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:33:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frl6u-0006qT-3W
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frl6t-0000S7-CG
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:24:48 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44690)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frl6s-0000P1-60; Mon, 20 Aug 2018 10:24:47 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frkuC-0003UX-In; Mon, 20 Aug 2018 15:11:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:13 +0100
Message-Id: <20180820141116.9118-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 19/22] hw/ssi/pl022: Correct wrong value for
 PL022_INT_RT
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bL7MPSrN6Sz9

The PL022 interrupt registers have bits allocated as:
 0: ROR (receive overrun)
 1: RT (receive timeout)
 2: RX (receive FIFO half full or less)
 3: TX (transmit FIFO half full or less)

A cut and paste error meant we had the wrong value for
the PL022_INT_RT constant. This bug doesn't affect device
behaviour, because we don't implmenet the receive timeout
feature and so never set that interrupt bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/pl022.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index 3ac57f4c96a..d310671d18e 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -38,7 +38,7 @@ do { fprintf(stderr, "pl022: error: " fmt , ## __VA_ARGS__);} while (0)
 #define PL022_SR_BSY  0x10
 
 #define PL022_INT_ROR 0x01
-#define PL022_INT_RT  0x04
+#define PL022_INT_RT  0x02
 #define PL022_INT_RX  0x04
 #define PL022_INT_TX  0x08
 
-- 
2.18.0

