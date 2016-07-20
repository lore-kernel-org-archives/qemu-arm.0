Received: by 10.25.21.156 with SMTP id 28csp1960602lfv;
        Tue, 19 Jul 2016 22:03:58 -0700 (PDT)
X-Received: by 10.98.32.81 with SMTP id g78mr61587803pfg.20.1468991027249;
        Tue, 19 Jul 2016 22:03:47 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id r71si1236963pfa.279.2016.07.19.22.03.47;
        Tue, 19 Jul 2016 22:03:47 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751459AbcGTFDa (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 01:03:30 -0400
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36803 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750923AbcGTFDW (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 01:03:22 -0400
Received: by mail-pa0-f65.google.com with SMTP id ez1so2564490pab.3
        for <kvm@vger.kernel.org>; Tue, 19 Jul 2016 22:03:22 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wdrpkMn5RYUt6mE5m9S7CEEUXhnzN18D2R7qN/IcEx8=;
        b=GsU9bNTwcLN/NQOY1e4gZNUdSAXkJvHHsQ1bZxU4qwWtLlz8eeVVweHuXIaxa6bsDi
         s0NnvbTxzogaUys3Dq8NTa2H/01qj7+Mlfx/QZoOFJLf/tzJ1eBSMYHNqJteE/9yCU7f
         qBrq+VGyiiPxTxmGqrvubAFCuFAPPCwT/OscFTsDyZx7G+VTCATdFFK1onHSkYW02oHA
         rcRc/f1gb0mh9COSsa2WZcdaYi6bwMmJYrTG20c40ii5RJSi3Wli2MvV79Vo6P8kin55
         ChMOIq2rw/IhR/Cn5BZk4dMxmT4mc7Aomtq2XUNKxwL45e9cK9lSyXSMKYlItBvZc387
         5waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wdrpkMn5RYUt6mE5m9S7CEEUXhnzN18D2R7qN/IcEx8=;
        b=Xp9luh/nFuWr5wWyqdWtI5vYUSNTIxModCFNG0HC/lrkNOi8mrbK0rWgBZ8LkrpKCb
         yk5OLxcaCx0dPWHRZ5w4DhUEiLbi2tFaYOWynKOL5lKfp9SmHsoBI9lqsIpBs053YB+M
         JDjvp6PlsfzAciGpWUySfIBtVaRP7einrxs6Bd7ty5id729pxOAuxCfGD+My2VEu91mp
         uxejqCHIzslHZXynzVBsDEmmS3seE8gdP4kspNPcLpVQQ/63GJVWCGCn+OPRKcXwdUj8
         h1e94XnQwEmWwp36S8ilo5HtvezvRZT2RGwA4TwVRSLBd/jNRuoLXFHvgOyvzvYoQ3rH
         jolA==
X-Gm-Message-State: ALyK8tJUt8zfRDpzPMKaJsn+Hj+lwPIkkSI0y5hTfK6GXDuIQzGwCr/M+kF6m0E/VynAuQ==
X-Received: by 10.66.155.129 with SMTP id vw1mr70947576pab.148.1468991001544;
        Tue, 19 Jul 2016 22:03:21 -0700 (PDT)
Received: from squirtle.localdomain.localdomain (c-73-225-163-254.hsd1.wa.comcast.net. [73.225.163.254])
        by smtp.gmail.com with ESMTPSA id c66sm1031757pfd.24.2016.07.19.22.03.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jul 2016 22:03:21 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v3 04/10] address_space_write_continue: Distill common code
Date:	Tue, 19 Jul 2016 22:02:54 -0700
Message-Id: <1468990980-4598-5-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: DMx9PDxwDtgs

Move call to memory_region_dispatch_write() outside of swtich statement
since the only thing that is different about all of those call is
"length" argument and that matches value in "l".

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 exec.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/exec.c b/exec.c
index 44cd424..e2425c5 100644
--- a/exec.c
+++ b/exec.c
@@ -2567,32 +2567,23 @@ static MemTxResult address_space_write_continue(AddressSpace *as, hwaddr addr,
                potential bugs */
             switch (l) {
             case 8:
-                /* 64 bit write access */
-                val = ldq_p(buf);
-                result |= memory_region_dispatch_write(mr, addr1, val, 8,
-                                                       attrs);
+                val = ldq_p(buf);  /* 64 bit write access */
                 break;
             case 4:
-                /* 32 bit write access */
-                val = ldl_p(buf);
-                result |= memory_region_dispatch_write(mr, addr1, val, 4,
-                                                       attrs);
+                val = ldl_p(buf); /* 32 bit write access */
                 break;
             case 2:
-                /* 16 bit write access */
-                val = lduw_p(buf);
-                result |= memory_region_dispatch_write(mr, addr1, val, 2,
-                                                       attrs);
+                val = lduw_p(buf); /* 16 bit write access */
                 break;
             case 1:
-                /* 8 bit write access */
-                val = ldub_p(buf);
-                result |= memory_region_dispatch_write(mr, addr1, val, 1,
-                                                       attrs);
+                val = ldub_p(buf); /*  8 bit write access */
                 break;
             default:
                 abort();
             }
+
+            result |= memory_region_dispatch_write(mr, addr1, val, l,
+                                                   attrs);
         } else {
             /* RAM case */
             ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
-- 
2.5.5

