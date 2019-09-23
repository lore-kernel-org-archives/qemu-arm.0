Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2858329wrp;
        Mon, 23 Sep 2019 09:26:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzp2S8GQfqhQ25aEXIQ5ukHRv/8IdOHfWTeTSUfGRSFZvZy7DPHRVxKF7EecFjgGmBW2ma/
X-Received: by 2002:ad4:544a:: with SMTP id h10mr5725343qvt.239.1569255964036;
        Mon, 23 Sep 2019 09:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569255959; cv=none;
        d=google.com; s=arc-20160816;
        b=nV+M+01zIuF4VgDLgjUJ6SN9i1/AnypAXAGcBl7Xb/KDG8Nt+IuxwoAccJHPUxMVDc
         US2MBvdqoXf2QSwUVacq4L7TxlYlODmXuY+ivk5FN8DC9TQSjSGGMBiI9P/5xPy+vqK0
         0ACGwHYHzdHLQ+2StbM1ho7OJ7/2ECjW8Ej40nDFYZSQ7TE6JOekfnKz5NX0D20agYRp
         lOzw+CxgloOYaPW5BSGefi3ivUu4qZqL90GPb1jkMYCsOCuIpSoOv23fi+KRfp0y2QeU
         KCVHZrcpj7k4agR9u6Vhzn/uDjDK6bOHkCQfyHcP/rdyVCYgIMAzK2yWDniXiUlTZ0vm
         KopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=b7rpVtQ/xydboulmiOzrz/XOOvRKDv9pKYF4qXulfCM=;
        b=SJu3dHXaza0BRVjJggKAMNiGnyWRN2mqZHnHryrmmaoJPOb2IPAlo5tl91whkM+C2P
         1C1l1/dpue0cHBde9YCe5sJenYEP7taNrYUfDPhVMW/+hxIKfhkB7eYS3oDHXvDr/dTh
         l3KUU9EibHrmiJQIexwL76Pz7aUMdpdtW6Qd9L8OSOA6G6sULr39OCKUxF7KKKAEqN0G
         nlBhrUGjRAH6/PRek8ZCd/21MxBzdVCHsEFe8Yj8ZB5abMeEobZ16ztiHZ3QCLc9eYgt
         PVOiErjP5vlAm98aKYOzDbVciGso5aWg6pn5d9lnWXawJF4PLrLuyTGZa9vQMuCpQlTv
         ERRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22si8271558qtc.355.2019.09.23.09.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 09:25:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCR9y-0002O5-4K
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 12:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxW-0002Yn-Iw
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 12:13:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxU-0003r4-UR
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 12:13:06 -0400
Received: from relay.sw.ru ([185.231.240.75]:39528)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQxM-0003aD-9p; Mon, 23 Sep 2019 12:12:56 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQx0-0001Fp-Dl; Mon, 23 Sep 2019 19:12:34 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 6/9] scripts: add coccinelle script to use auto propagated
 errp
Date: Mon, 23 Sep 2019 19:12:28 +0300
Message-Id: <20190923161231.22028-7-vsementsov@virtuozzo.com>
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
X-TUID: Woa907qnFGOB

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/coccinelle/auto-propagated-errp.cocci | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci

diff --git a/scripts/coccinelle/auto-propagated-errp.cocci b/scripts/coccinelle/auto-propagated-errp.cocci
new file mode 100644
index 0000000000..1a3f006f0b
--- /dev/null
+++ b/scripts/coccinelle/auto-propagated-errp.cocci
@@ -0,0 +1,82 @@
+@@
+identifier fn;
+identifier local_err;
+@@
+
+ fn(..., Error **errp)
+ {
++    ERRP_FUNCTION_BEGIN();
+ }
+
+@rule1@
+identifier fn;
+identifier local_err;
+@@
+
+ fn(..., Error **errp)
+ {
+     <...
+-    Error *local_err = NULL;
+     ...>
+ }
+
+@@
+identifier rule1.fn;
+identifier rule1.local_err;
+identifier out;
+@@
+
+ fn(...)
+ {
+     <...
+-    goto out;
++    return;
+     ...>
+- out:
+-    error_propagate(errp, local_err);
+ }
+
+@@
+identifier rule1.fn;
+identifier rule1.local_err;
+@@
+
+ fn(...)
+ {
+     <...
+(
+-    error_free(local_err);
+-    local_err = NULL;
++    error_free_errp(errp);
+|
+-    error_free(local_err);
++    error_free_errp(errp);
+|
+-    error_report_err(local_err);
++    error_report_errp(errp);
+|
+-    warn_report_err(local_err);
++    warn_report_errp(errp);
+|
+-    error_propagate(errp, local_err);
+)
+     ...>
+ }
+
+@@
+identifier rule1.fn;
+identifier rule1.local_err;
+@@
+
+ fn(...)
+ {
+     <...
+(
+-    &local_err
++    errp
+|
+-    local_err
++    *errp
+)
+     ...>
+ }
-- 
2.21.0

