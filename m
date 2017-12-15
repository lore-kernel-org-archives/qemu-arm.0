Received: by 10.223.159.74 with SMTP id f10csp7092338wrg;
        Thu, 14 Dec 2017 19:19:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBou5aTHOgzv1ZdGnoZq7letChuhlAV3bR6GO/OhdWROVGYgFpMK+KIINRLqu2hxP8uqVltpM
X-Received: by 10.37.136.141 with SMTP id d13mr6333306ybl.277.1513307964781;
        Thu, 14 Dec 2017 19:19:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513307964; cv=none;
        d=google.com; s=arc-20160816;
        b=HL7dxRHNppnFJ4Bt9RJY3WvJJD/vbIJavXB5RhEWMNktXU7lvWVNzliWQgJlegDngf
         smL6aSsiGfLBaILbix88AOiju4NjrAguhyjRTC38/aInnnM3ePtlky9ozG2ECXp7D/20
         KrHoSQMrCKnucKjRdn/+yDujG5oswmKqVZyqMe/aFb1+bEtGDLDFRJC+qPLULvcKlt2/
         raF1Gz58Fph02M5cH+zhUYtUk6vqtLNvuQecyDkkpee+iwXEyYsJqYckS4Y3xR4dTlJL
         z2iPo58G5wdzCGVnv53awFNmtBn6nB4bF5BldWdZ+MJd6vYN/nJ3ij65c9ImZlVWkVzA
         Trwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rnBBtaCu7CpYvlb66OM09K3kE8oHqz9H4CESxgFEEA8=;
        b=FxUMpIwKr6oAHoXQ2gttFegLxFl2wJnCkMhpR1vjdZhQsr+ldPdI+sOlz6iPTo9G4P
         d1kz8Dneqe3uAZWDLKZ7XDLb20stn77Bd+DRGtUfk21/LOnSgWfGunsPagNXEMRKqyQ+
         XbLpIJqs/i9JWfkBsb8mMpPc9CH7liHcgspNyKn9ORddpmtOfJGokS3bW/QJSQGkU1Nw
         09j6LmN2ZSEWowpsKkVpcyzAYfxu1XnEqj75Wj0MuWgbjhbvcZpwXUgLRsrBgYjezf4h
         SKMYKIulADEXsXqxh3J1OYWxwsbjI7sHtVaDZL9d7Fr4AkY6OuFqcH59SbFH/eQJmuiT
         Vgzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vSrKPVE0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s33si845946ybi.130.2017.12.14.19.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:19:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vSrKPVE0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgWy-00085i-5C
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:19:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTx-0005aI-L0
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTw-0000nj-Q2
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:17 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:45811)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTr-0000jh-HY; Thu, 14 Dec 2017 22:16:11 -0500
Received: by mail-qt0-x242.google.com with SMTP id g10so10522005qtj.12;
	Thu, 14 Dec 2017 19:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rnBBtaCu7CpYvlb66OM09K3kE8oHqz9H4CESxgFEEA8=;
	b=vSrKPVE0uHR8CnTxJu9Flvx5t3Di+Pd1zQ2iYsBGUNzwsUHkmFVWAYppRfcS7oRw6X
	/kVfFODqT3r//3xjkjXdFHvjJ2VTJ43NyT0MGJu3QhqIgHIIw/5kIJEvYdftyRM7zJRI
	iZDYJLoW3Ax2RzRdaBBx7UBWdNKeGgGG1l2NpORGaugZrDEM0Rr6SrovSkkNiZd0nun9
	Q1bCTBRqYTQheTHc+mRtwQ5XNun2Ea0GIZB6hYriWytOSfaXlDvG98NwHv1FvCE4El/O
	q/41whWwg+kvH9iQLFAi0h171vTorOWaw5si5dvFdXBlzLIro0TekaO0VGujaEJfjyZM
	U0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rnBBtaCu7CpYvlb66OM09K3kE8oHqz9H4CESxgFEEA8=;
	b=Fqxsq51W6GqcbnVh5o92B0v6FNWdUFBnwXF3FEZk73pVipWQrpy9HTZxt0e1lku2/N
	1xNWZhEmuB3rQyVV8XnBBKiagjZhbq7qYtYlkAdlz3yofcWxy29MFKV+9Zlujg3vMUTz
	siaLuYLiE5yMRPpJb5NGWOAbao05NBDH86BImwJERnxu259sxyoUJQov463tOzZB20p4
	lPFfb5YmAmXV0FQAVbCqnWpvnxgVr9oqFMUBekW79ldgJ+u7vk5PJ2FZ3HWaKrZCUFpO
	2Yv8njKwLi4Hs3YmanVWKuIfRWVkUhIqaPYbhvj3eNrro71cxlL9KKS1GJzbAyLOjeQ7
	Hqug==
X-Gm-Message-State: AKGB3mJvOMVFC1L+WzD8jnTuic12HaSl9/XE8z0pL+olK9tCoSPsuILz
	k9rRdNaPi0UK/Pi6dHLOHtA=
X-Received: by 10.200.56.72 with SMTP id r8mr20784032qtb.203.1513307771064;
	Thu, 14 Dec 2017 19:16:11 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:29 -0300
Message-Id: <20171215031547.31006-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v2 02/20] sdhci: use deposit64()
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 92KyAlbeKm3j

This makes the code slightly safer, also easier to review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index b7d2a20985..3c78033d49 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1132,12 +1132,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         MASKED_WRITE(s->admaerr, mask, value);
         break;
     case SDHC_ADMASYSADDR:
-        s->admasysaddr = (s->admasysaddr & (0xFFFFFFFF00000000ULL |
-                (uint64_t)mask)) | (uint64_t)value;
+        s->admasysaddr = deposit64(s->admasysaddr, 0, 32, value);
         break;
     case SDHC_ADMASYSADDR + 4:
-        s->admasysaddr = (s->admasysaddr & (0x00000000FFFFFFFFULL |
-                ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
+        s->admasysaddr = deposit64(s->admasysaddr, 32, 32, value);
         break;
     case SDHC_FEAER:
         s->acmd12errsts |= value;
-- 
2.15.1

