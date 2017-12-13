Received: by 10.223.159.74 with SMTP id f10csp5305263wrg;
        Wed, 13 Dec 2017 08:52:42 -0800 (PST)
X-Google-Smtp-Source: ACJfBosC4c2pI2MPHuD079KS3NB2VmdlxbuV81cta0vgG65lmW08pzEEUAUe27McbbT5kPQH/z7m
X-Received: by 10.37.192.65 with SMTP id c62mr2381892ybf.75.1513183962562;
        Wed, 13 Dec 2017 08:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513183962; cv=none;
        d=google.com; s=arc-20160816;
        b=krJ+3b+vmv9oryZUZzm3sq1kFNtRJhAP/XGZBtvmk3FR3oZxgtb5c1LAELDTDmVUN+
         CMS8puEvg0lHOlOLVH7cWSxRWgw8gQnmUT4Yhp/pgwm/9bW6ub/txeMC9fYF7M8yxGPV
         NjgvOzZWZ53yRN5ZKx6yiP3xQtgdRaug1s2IxQQfNmrtVoD66AhVXsnU94ej5bihhPbp
         b+xO+ryvWhObXAVbGdXjmP9HTmdEdbVRalpXRq+cxTYj4S4i8MCBpxKaJ9yNNoCXoedf
         qEs5WEPAm+ZwQf9U4l5TaVkMTbV595MKRpVMOXM3f3h5ZMfWFXNW1mpFGFst3CEofyoG
         +qNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gUU4tqNCfsNprvJRsRytJfnLhN2Y+PYyU4SMpLbCNEU=;
        b=twP0PJJ6I4l9rmkjiXnrDTKO4Et9gqJKTIZyZXozVTvk2TmUABVnlRXkjJl5R6QV5I
         U2dVSLSprLwTBGvgd/0F1+TH15aXwIORcK9AISiSF8bIbOPyFsl23+Z2D+W5Rgoyjv9O
         KUCCoIt99XwP3iVGHom/f24ym9VWGozMr0jnK8cKH+DJZYN13WXBSXJR7AeDlGvY8a+O
         4opBVxKWixMoKXC/LZVn4kNZ7GpTGsbuas6rETDrqb7GPnP9B+p7Ya2FxUxqxHv/gc8W
         XMFQNJ168/XypTDY+NgpY/m7S1wS8CIJjgfU76aHXPIQbvIB1BdbljuFes7wvOxN6VN4
         TzbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x83si406670ywb.345.2017.12.13.08.52.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 08:52:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePAGw-0002N7-1j
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 11:52:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ePAGh-0002KY-7w
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:52:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ePAGg-0004I1-Cu
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:52:27 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:39072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ePAGg-0004Ee-66; Wed, 13 Dec 2017 11:52:26 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ePAGe-0007Oi-Ec; Wed, 13 Dec 2017 16:52:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 13 Dec 2017 16:52:21 +0000
Message-Id: <1513183941-24300-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/2] hw/intc/arm_gic: reserved register addresses
 are RAZ/WI
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Laszlo Ersek <lersek@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iwWmFF/RWuJ5

The GICv2 specification says that reserved register addresses
must RAZ/WI; now that we implement external abort handling
for Arm CPUs this means we must return MEMTX_OK rather than
MEMTX_ERROR, to avoid generating a spurious guest data abort.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 5a0e2a3..d701e49 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1261,7 +1261,8 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_cpu_read: Bad offset %x\n", (int)offset);
-        return MEMTX_ERROR;
+        *data = 0;
+        break;
     }
     return MEMTX_OK;
 }
@@ -1329,7 +1330,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_cpu_write: Bad offset %x\n", (int)offset);
-        return MEMTX_ERROR;
+        return MEMTX_OK;
     }
     gic_update(s);
     return MEMTX_OK;
-- 
2.7.4

