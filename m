Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3124347wru;
        Fri, 5 Jul 2019 05:43:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwK+do/Ks/ins+KoxE3hrbJIAZBG0xCq7lxf4T092bOEbAwGg9jZVJSWjF2/lt8/rl6owNc
X-Received: by 2002:ac8:2f07:: with SMTP id j7mr2510567qta.359.1562330608201;
        Fri, 05 Jul 2019 05:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562330608; cv=none;
        d=google.com; s=arc-20160816;
        b=l0xqKlonxc4Ri6oNOJk8Vo4PGedwbsQMQfLWujlBHwIRtA4VTdDfusnflyOe9sq4Nl
         p7xiHiQQ0dLRUV/Qh89kBAW49IR8rjaf6UbQwAhzlemwN+sL0SNmhvikKrlVq3gE3Fdv
         kme5X7HOjDtjD405SCpe8Ke+VMeu5B+Q+42IUJwPQ+41JTyVBNGTrSiwmeOyESo4b0z6
         P2OhKPslPChXQbASHiNAxoRxN/FrPxlv8gDStwtNfeVAdHpq9hX0qqsFPE7mvh3EDu1V
         UrXrkJtld9RtIOpojix9Vv/cJmYbeRliMaytzSZfItSAatNpjZKCFGGIhINMhju8szB2
         BXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=fpAgkVqlG+SnZwl2IONW6jCLvWABSgwikCUcAomD76Q=;
        b=c+PgfPSYebPEuBFx4U4ylkKzgr78yTaftj6GBmr4iRCyV8s+Bb5hXNh+3KgF0aAKIm
         mmOpUbFr4z0mBADkJzmgueJzAkhadEIJyQj1q6QJUGvW4Ud02HXP1pKYDoPn7k2Gys6a
         qNuUqTgIgKJZ2I4kzHLKPzT+izOsaWfNXsdscrWv0qfgHWL/qJ2sjWwNyuv0G8mFePm0
         3vEnWVKZRy3l2t2yWeZDFM4sv7NxRkTRDV35Rw3S/cLz1zigen47+DRtNLk3jT6Lq1+Q
         qZTz0wIfr/sWs+PAui6LploZ6kTCIyHlC6k7h/sRUxb0TeRM247QiYNBhuJ7SRG7qWjC
         Fh9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s25si5877192qkj.26.2019.07.05.05.43.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 05:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D21A34CF;
	Fri,  5 Jul 2019 12:43:26 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-45.brq.redhat.com [10.40.204.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DEE08E170;
	Fri,  5 Jul 2019 12:43:19 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] target/arm/vfp_helper: Call set_fpscr_to_host before updating to FPSCR
Date: Fri,  5 Jul 2019 14:43:18 +0200
Message-Id: <20190705124318.1075-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 05 Jul 2019 12:43:26 +0000 (UTC)
X-TUID: KK4PSgu4a+n/

In commit e9d652824b0 we extracted the vfp_set_fpscr_to_host()
function but failed at calling it in the correct place, we call
it after xregs[ARM_VFP_FPSCR] is modified.

Fix by calling this function before we update FPSCR.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/vfp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 46041e3294..9710ef1c3e 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -197,6 +197,8 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
         val &= 0xf7c0009f;
     }
 
+    vfp_set_fpscr_to_host(env, val);
+
     /*
      * We don't implement trapped exception handling, so the
      * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES0!)
@@ -217,8 +219,6 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
     env->vfp.qc[1] = 0;
     env->vfp.qc[2] = 0;
     env->vfp.qc[3] = 0;
-
-    vfp_set_fpscr_to_host(env, val);
 }
 
 void vfp_set_fpscr(CPUARMState *env, uint32_t val)
-- 
2.20.1
