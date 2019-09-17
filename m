Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5063910wrp;
        Tue, 17 Sep 2019 03:36:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHd7ydQvrHTDJBO/VWY1LivspGs60KFPvKmmaXcOYQOenz3JDsFl5ivvhsR1qJE/GtMboZ
X-Received: by 2002:ac8:2f81:: with SMTP id l1mr2886061qta.269.1568716615684;
        Tue, 17 Sep 2019 03:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568716615; cv=none;
        d=google.com; s=arc-20160816;
        b=oRtHLsBPWMt8CVyZaD2cG+YL35ocGfjB+iviJTI2AeO+nuSMCRHBdrDYPvoykGtRx/
         Dulv4Smx7kxkoOswptoeJBjFlNQSLO8T48Jm9CYXpNyWeiQsF7XjJ5ut5xNli5xhGUf5
         34Ow8ZlsqYXUlzv1dH2R495tHeB5SfjgOhGcTWSIKpVFoCe4mCDw3tIOugUiPiknBc2H
         38SSRQAh7U5Y04icYNuprBz5EBM8FefIypR2P+na4E2tXzpEF9Bk+iV2zI5pnbnEZVCn
         7t93JMoYr5lvlQpVTVFm5A/9mDPcJzh/FbPwgYA7mCYcHxvXiP4ImvPiJ43sQ8qGnq3A
         gZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id
         :content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from;
        bh=iEkleBwtDQQwHl/vd68hjm9nUUEy/ia9/y2x4NyZY5g=;
        b=nRehhnDmzC8XDU7y2/OpqQGzqZnPkcquQpyP5ToJWdKzbiV6sgseNfxcIw+Ha9hEN7
         RTqu0jj2NchXtyfLaU+fj251RmBsp9ETUyUz4EVVgYmwro3jRRIS2qQCEEdx85ZI3D/e
         gJ1dBSlAHIlTCcOkMbZf7ourjlMcvJBgfqO7/lYXJojhqeQBH+/BBcgCs52LKI30jmzZ
         uL07l2KPoFLxQz/EvwOi/YXU66RyVksWzvfU8mdd3peVSH/I6Jf31tTMkeOQigClcfu8
         1OlT72PTtbuXCaxyn4JK96m5TW+BKTcTfEBe08Y52ULwUEPJjqirvsf9CeezutmXL8UD
         fIOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y82si344066qka.381.2019.09.17.03.36.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 03:36:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAAqs-0002X8-BX
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 06:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAAbr-0006xW-I8
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:21:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAAbq-0003mY-9E
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:21:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34564)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAAbq-0003mK-0z
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:21:22 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HAHFVW110704
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:21:21 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v2w62hc3e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:21:20 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Tue, 17 Sep 2019 11:21:17 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 11:21:11 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HALADO49217772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 10:21:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02A3BAE055;
 Tue, 17 Sep 2019 10:21:10 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C731AE045;
 Tue, 17 Sep 2019 10:21:09 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.22.84])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 10:21:08 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 17 Sep 2019 12:21:08 +0200
In-Reply-To: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091710-4275-0000-0000-000003678A42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091710-4276-0000-0000-00003879EF77
Message-Id: <156871566867.196432.11276188812327366259.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=509 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170106
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH 06/17] vfio: Pass local error object pointer to
 error_append_hint()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. =?utf-8?q?Berrang=C3=A9=22?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org"@d06av26.portsmouth.uk.ibm.com,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x/5HqQFlMn3v

Ensure that hints are added even if errp is &error_fatal or &error_abort.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/vfio/common.c |   14 ++++++++++----
 hw/vfio/pci.c    |   12 ++++++++----
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3e03c495d868..05b1c39a426f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1469,10 +1469,13 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
     }
 
     if (!(status.flags & VFIO_GROUP_FLAGS_VIABLE)) {
-        error_setg(errp, "group %d is not viable", groupid);
-        error_append_hint(errp,
+        Error *err = NULL;
+
+        error_setg(&err, "group %d is not viable", groupid);
+        error_append_hint(&err,
                           "Please ensure all devices within the iommu_group "
                           "are bound to their vfio bus driver.\n");
+        error_propagate(errp, err);
         goto close_fd_exit;
     }
 
@@ -1531,11 +1534,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 
     fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
     if (fd < 0) {
-        error_setg_errno(errp, errno, "error getting device from group %d",
+        Error *err = NULL;
+
+        error_setg_errno(&err, errno, "error getting device from group %d",
                          group->groupid);
-        error_append_hint(errp,
+        error_append_hint(&err,
                       "Verify all devices in group %d are bound to vfio-<bus> "
                       "or pci-stub and not already in use\n", group->groupid);
+        error_propagate(errp, err);
         return fd;
     }
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index dc3479c374e3..b037dec2215b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2527,10 +2527,13 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
     g_free(reg_info);
 
     if (vdev->features & VFIO_FEATURE_ENABLE_VGA) {
-        ret = vfio_populate_vga(vdev, errp);
+        Error *err = NULL;
+
+        ret = vfio_populate_vga(vdev, &err);
         if (ret) {
-            error_append_hint(errp, "device does not support "
+            error_append_hint(&err, "device does not support "
                               "requested feature x-vga\n");
+            error_propagate(errp, err);
             return;
         }
     }
@@ -2714,9 +2717,10 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     if (!vdev->vbasedev.sysfsdev) {
         if (!(~vdev->host.domain || ~vdev->host.bus ||
               ~vdev->host.slot || ~vdev->host.function)) {
-            error_setg(errp, "No provided host device");
-            error_append_hint(errp, "Use -device vfio-pci,host=DDDD:BB:DD.F "
+            error_setg(&err, "No provided host device");
+            error_append_hint(&err, "Use -device vfio-pci,host=DDDD:BB:DD.F "
                               "or -device vfio-pci,sysfsdev=PATH_TO_DEVICE\n");
+            error_propagate(errp, err);
             return;
         }
         vdev->vbasedev.sysfsdev =

