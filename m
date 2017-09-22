Received: by 10.223.172.38 with SMTP id v35csp3216369wrc;
        Fri, 22 Sep 2017 08:06:45 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB+Bspwqc31IOt53kwnlMAAnW84iyv3LLY3/FYW7YxvbOIS7WeJMY5EiVh6dZTn2thR7QlG
X-Received: by 10.233.235.17 with SMTP id b17mr7692751qkg.254.1506092805824;
        Fri, 22 Sep 2017 08:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092805; cv=none;
        d=google.com; s=arc-20160816;
        b=pOgUqliJvtAhh+NuOFtW3wvUA/DFIAj5/+Qg2KhAaHLZjH3IqlKF9D5325MYeMkmlf
         KH7y1CjuTzKCq/hosaCQXTW20l7tshEadwjGfohgBLlwzM318qORSWAitGMuJUyhV0NR
         Rr+40+SH8vmG9iQNueScup7ByavBE+0tdf8+vs+vEpsLIRpLZipjwrY28X/nBGF4pWnA
         YLVsB70dPG6iVeSTSYPj7o83wXsYRDMr6CKIWmklh1XTzu/LqzkykF3d28IN20bR3xP/
         Lx4QXTKmIqb9lO8Hy0t6+wN3pToxNu/MDf2sPot2FpqI0JGwb/icdnsO4wFVCp12bT1l
         MwnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=uPO11BNzIv7vz899Ht/+YwTX8A/SEtw3h5ZF3Wqohig=;
        b=d7o/HhK9Tk2IwOK5mDdYE+saXZbZqvH6v1XVNyYHTHg4n5nqssCcZwVQNbGOtha21o
         +Yy5cNBjMDZqZXQkjwjw/fzpfzUNy8tUzGwgb96Jib+2wdET6smTZa5hVagvSeg4aXTV
         fvbf51cC3MPjFTBEhcxxkk67e4d20Y8+jF9HdeTUmFLKn4LBQ/pdUsmhCQRWVrbXMyjE
         +ynWVCx7RR7oe9l2dfNY+yoRD3Hdx3nQ4POZbSYDk+fHTsKgtdfDZDJpuBWzv7+84Ag2
         DGBDiWFAJFH4Zkd6Y4msgEdkohn2eTWepPR62dYd6DHW7MupizFFUD1lKPuDCVSBdcZt
         AYWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v2si45576qtb.9.2017.09.22.08.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:06:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPXP-0005Om-7F
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:06:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQg-00086Q-If
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQf-0004Hr-PN
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:46 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37588)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQf-0004EW-G1; Fri, 22 Sep 2017 10:59:45 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQd-0007H9-Mw; Fri, 22 Sep 2017 15:59:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 16:00:07 +0100
Message-Id: <1506092407-26985-21-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 20/20] nvic: Add missing code for writing
 SHCSR.HARDFAULTPENDED bit
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
X-TUID: RctE+VwtiGVh

When we added support for the new SHCSR bits in v8M in commit
437d59c17e9 the code to support writing to the new HARDFAULTPENDED
bit was accidentally only added for non-secure writes; the
secure banked version of the bit should also be writable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index bd1d5d3..22d5e6e 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1230,6 +1230,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
             s->sec_vectors[ARMV7M_EXCP_BUS].enabled = (value & (1 << 17)) != 0;
             s->sec_vectors[ARMV7M_EXCP_USAGE].enabled =
                 (value & (1 << 18)) != 0;
+            s->sec_vectors[ARMV7M_EXCP_HARD].pending = (value & (1 << 21)) != 0;
             /* SecureFault not banked, but RAZ/WI to NS */
             s->vectors[ARMV7M_EXCP_SECURE].active = (value & (1 << 4)) != 0;
             s->vectors[ARMV7M_EXCP_SECURE].enabled = (value & (1 << 19)) != 0;
-- 
2.7.4

