Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2859117wrp;
        Mon, 23 Sep 2019 09:26:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5OSPgnl0OFU/1jTZur51WuFuV+iankfUQY18zU19KXXOQcaTU9OJHY0GAwHhV0NUZO4Il
X-Received: by 2002:a17:906:eddb:: with SMTP id sb27mr667601ejb.304.1569256014425;
        Mon, 23 Sep 2019 09:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569256014; cv=none;
        d=google.com; s=arc-20160816;
        b=QZuz4wCEOH9xFEOqT/5E1snbtxah6lL0gFZiAp333SYBzJyKiFM8671obSbKP0+45Y
         QuEYXg4UXSslKxWZf22aM307AKurz7xIvECTLJ/2cTz2ZARHJJRGVk7G3q9dpdQjivpm
         WEyu/Em94AuhKFCJ33wpJMw22+FAeEym9GAE/rKy8yc8r/KdWx1bbu+HM+L0c4rJGuBn
         YUft/HbEROkptmUCYaf1YvNF4z8DbFkjWjdL8KkP7Ay1INTxBM61A0CK+BBZVEb1Kyht
         u2Y+4yk4jAW1w+mGzFVjELWVY56646a1xlZTEPR8UnlMBOVHjrR5RjSgst5Wp0fTPsD0
         toKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=iT9Sd37XLydDdHT0iBDVwSabmXCiocg1xvI9TIFmGno=;
        b=Le8weDsZx5WVdAJ3phuqW/9Nx2Lgo52jtWVANfGRF6jxK/fyPT5jyidVAODdDh356+
         L+xoj/OBQfyc0CMhBNbze2x2o0xgtMJJlFVo7/3HQxsvk474/e7dS/Z+WjmQbg4E5W0w
         uKzy4bIZ2sgsryLm8gzH3+kKw3UYNtmOhF0+kJqWMMqAm+6JW+MSmWMNdQDHM5klYkKm
         n7U4ePk4pha5dr05CkalACGnQdWTePvRyzjTpQv/A/knrfI0G1Jau5dKa1sbcc35A/pr
         KjQwbiYk4GBtlfYuP/Tir7zQcOiF78rdM98Yv0bwnhg4eCo3Y6XHmyUMBO78PCS16ehH
         /Sgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si7595695eda.111.2019.09.23.09.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 09:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:59344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCRAq-0003Wx-QO
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 12:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxY-0002au-IM
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 12:13:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxX-0003sm-5A
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 12:13:08 -0400
Received: from relay.sw.ru ([185.231.240.75]:39502)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQxN-0003a9-HI; Mon, 23 Sep 2019 12:12:57 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQx0-0001Fp-4Q; Mon, 23 Sep 2019 19:12:34 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 5/9] net/net: fix local variable shadowing in net_client_init
Date: Mon, 23 Sep 2019 19:12:27 +0300
Message-Id: <20190923161231.22028-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
X-Mailman-Approved-At: Mon, 23 Sep 2019 12:25:24 -0400
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
X-TUID: 8yGiTmJdba+Y

Don't shadow Error *err: it's a bad thing. This patch also simplifies
following Error propagation conversion.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 net/net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/net.c b/net/net.c
index 84aa6d8d00..5fc72511c1 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1128,10 +1128,10 @@ static int net_client_init(QemuOpts *opts, bool is_netdev, Error **errp)
 
             if (substrings[1]) {
                 /* User-specified prefix length.  */
-                int err;
+                int ret2;
 
-                err = qemu_strtoul(substrings[1], NULL, 10, &prefix_len);
-                if (err) {
+                ret2 = qemu_strtoul(substrings[1], NULL, 10, &prefix_len);
+                if (ret2) {
                     error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                                "ipv6-prefixlen", "a number");
                     goto out;
-- 
2.21.0

