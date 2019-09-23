Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2857999wrp;
        Mon, 23 Sep 2019 09:25:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4jgRtn6puhImgg4mx1jlHwu/MG5lN4YbBbYcr56FzUCKG/hS/QdC8z35k+u2D7cg++Ck+
X-Received: by 2002:a17:906:254d:: with SMTP id j13mr691510ejb.30.1569255944144;
        Mon, 23 Sep 2019 09:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569255944; cv=none;
        d=google.com; s=arc-20160816;
        b=LrdqOsJpoOovNHorzbWDmc4RLCwAeoOhtG5Rz8egStyk0HlQcHrtdTvzx+NLO2FIMB
         8VAtuKxj+i6GybYmZaynvn+sbnVlPt1YkCORGnatoF2T+wk4aqlW0YKa1noMN0F1qJrs
         f3S/J46BqLA9YmFtCKc4Z4g+UOjOwaaw0eRu6Vk6dVoVV4S/1XASBeZtYNHkBIW9nCkP
         OMwPnWPqyxEHt55QazAiX2RzIij/+GqqbSD7vhU8scJ8ZLZS3U+U3jgtPjPPLL3hQZDJ
         uKSV46lsrbhvSWc/I88Q8fzA6X7Y7rQ1/Hroz3/hoixd8I6YZauW7RHEYJrTYgYeFaQS
         ONRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=B0y8U3sDHPqaycOZBVH05XSBeYxJtW7Iu8HO1pRgvY0=;
        b=FRmDjUvgEHJ9A1x8RCFjSew5TEY9UsfQODm+m9Le4fWAGkw4J/ct+EQvuoI0ZJTJU2
         RbZbyPgk14hoISrWD5bN11TEi6DpntT+r1FINkC3EW7SRBQdVix/kzdAo1Bc/Of3y8K/
         D2T/smnmB/lFxuO3zM7msl9i5iE3IGA3RTN8DI9x9jqNhNeEk+0krf5qrPpkGk2YfgAK
         CeqsXOdCEliBNthyXRGgTuXyMoiISnFK5X4zaeL6F9mEoE8EZPCYncdx/NZc1rBOaKeK
         jPp3aBqPfOuhWjN+CIjNhKqNtAiVDj6focORWqNrK2HVAsOcTpAlRK/XD0z3SaJ/g5Ov
         q6UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt14si5293564ejb.168.2019.09.23.09.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 09:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:59306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCR9i-00021t-Od
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 12:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57285)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxW-0002Yi-DA
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 12:13:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxU-0003qO-DX
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 12:13:06 -0400
Received: from relay.sw.ru ([185.231.240.75]:39508)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQxM-0003a8-Tg; Mon, 23 Sep 2019 12:12:57 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQwy-0001Fp-Od; Mon, 23 Sep 2019 19:12:32 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 2/9] qapi/error: add (Error **errp) cleaning APIs
Date: Mon, 23 Sep 2019 19:12:24 +0300
Message-Id: <20190923161231.22028-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
X-Mailman-Approved-At: Mon, 23 Sep 2019 12:25:22 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: stefanha@redhat.com, codyprime@gmail.com, jan.kiszka@siemens.com,
 eblake@redhat.com, berto@igalia.com, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, pasic@linux.ibm.com,
 hpoussin@reactos.org, anthony.perard@citrix.com, samuel.thibault@ens-lyon.org,
 philmd@redhat.com, green@moxielogic.com, lvivier@redhat.com,
 ehabkost@redhat.com, xiechanglong.d@gmail.com, pl@kamp.de, dgilbert@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 ronniesahlberg@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 vsementsov@virtuozzo.com, andrew@aj.id.au, crwulff@gmail.com,
 sundeep.lkml@gmail.com, michael@walle.cc, qemu-ppc@nongnu.org,
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, fam@euphon.net,
 peter.maydell@linaro.org, sheepdog@lists.wpkg.org, david@redhat.com,
 palmer@sifive.com, thuth@redhat.com, jcmvbkbc@gmail.com, den@openvz.org,
 hare@suse.com, sstabellini@kernel.org, arei.gonglei@huawei.com,
 marcel.apfelbaum@gmail.com, namei.unix@gmail.com, atar4qemu@gmail.com,
 farman@linux.ibm.com, amit@kernel.org, sw@weilnetz.de, groug@kaod.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org, cohuck@redhat.com,
 amarkovic@wavecomp.com, aurelien@aurel32.net, pburton@wavecomp.com,
 sagark@eecs.berkeley.edu, jasowang@redhat.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, ari@tuxera.com, quintela@redhat.com,
 mdroth@linux.vnet.ibm.com, lersek@redhat.com, borntraeger@de.ibm.com,
 antonynpavlov@gmail.com, dillaman@redhat.com, joel@jms.id.au,
 xen-devel@lists.xenproject.org, integration@gluster.org, balrogg@gmail.com,
 rjones@redhat.com, Andrew.Baumann@microsoft.com, mreitz@redhat.com,
 walling@linux.ibm.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 v.maffione@gmail.com, marex@denx.de, armbru@redhat.com,
 marcandre.lureau@redhat.com, alistair@alistair23.me, paul.durrant@citrix.com,
 pavel.dovgaluk@ispras.ru, g.lettieri@iet.unipi.it, rizzo@iet.unipi.it,
 david@gibson.dropbear.id.au, akrowiak@linux.ibm.com, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, pmorel@linux.ibm.com, wencongyang2@huawei.com,
 jcd@tribudubois.net, pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y4lnpLMOwwdZ

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qapi/error.h | 22 ++++++++++++++++++++++
 util/error.c         |  6 +++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index f6f4fa0fac..551385aa91 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -297,6 +297,28 @@ void warn_report_err(Error *err);
  */
 void error_report_err(Error *err);
 
+/*
+ * Functions to clean Error **errp: call corresponding Error *err cleaning
+ * function an set pointer to NULL
+ */
+static inline void error_free_errp(Error **errp)
+{
+    error_free(*errp_in);
+    *errp_in = NULL;
+}
+
+static inline void error_report_errp(Error **errp)
+{
+    error_report_err(*errp_in);
+    *errp_in = NULL;
+}
+
+static inline void warn_report_errp(Error **errp)
+{
+    warn_report_err(*errp_in);
+    *errp_in = NULL;
+}
+
 /*
  * Convenience function to error_prepend(), warn_report() and free @err.
  */
diff --git a/util/error.c b/util/error.c
index d4532ce318..dfba091757 100644
--- a/util/error.c
+++ b/util/error.c
@@ -273,9 +273,9 @@ void error_free(Error *err)
 
 void error_free_or_abort(Error **errp)
 {
-    assert(errp && *errp);
-    error_free(*errp);
-    *errp = NULL;
+    assert(errp_in && *errp_in);
+    error_free(*errp_in);
+    *errp_in = NULL;
 }
 
 void error_propagate(Error **dst_errp, Error *local_err)
-- 
2.21.0

