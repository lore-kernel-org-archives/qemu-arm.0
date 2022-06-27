Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2641192lft;
        Mon, 27 Jun 2022 12:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tejHP9ePFmf8v62bUxKyJWnBJjRwS4me8sVd25fniHz0oQr47TqZZYhA6bJfTaauwyZGTA
X-Received: by 2002:a37:62d2:0:b0:6af:7b8:28a with SMTP id w201-20020a3762d2000000b006af07b8028amr9330894qkb.452.1656359937390;
        Mon, 27 Jun 2022 12:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656359937; cv=none;
        d=google.com; s=arc-20160816;
        b=uYy29pcBeM87ORaIlVXIlAESo2Cq36Ip4y7jSLOOe9DzvVUuRtkPj31Pk96ADpUOIg
         JZawjkdLNWT81diKUM2zg/HV2b2oobKOiiKlrLmSxsdb6YheG1sRM0vM9BA5xh9lBLwc
         Wjj/XqNNSeEezVhZQwpYQFB24RH6q++x02qKn2j43dcwOvR5b6cZYNJDiQC3xEUUrQn9
         h5v/8mWDQkn1npjqK6FzySQAMxgeSg+B3uJ9MgAo5SeoVc2C3Lfaevt+CxiHdFD3/uzE
         M4CpuU/5H5uclNhgmpm9Vxm1bIv9drMa4Tp14vCyxrxKHYqsaLiezc6cKtaDtPn5Z9HJ
         BQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mo+Wpbct7Exgx+EdBxqY+i88RyTpKdpQDWK3TFqkI0o=;
        b=PpuUwuSFB71iiUUaJwW/4cmF2NPrXjVQSjDqE8YKtK/AyhT5a+XdIfvb+mXkC4Disy
         0qJptebs1/FfsfwcNghfmKdcDwQW1me5Zn83w+xSGgMVu2CJvBXMOx4eaQL12NqgLFTz
         yiJEgseQ82Ilxr9bRKAb6ij6oi3O4qMMBChH0Zc3SCPlhx+T6yCi1elrqsDPBLyrFGSc
         fLB+2ohXEJ/arVALOw1zI5kahVKlIqXqwuOfp8Ae5nfEAcQMgt9YFyElbITljqV1X7nX
         9VLmNhvsZ2nnQxIBMU/TF3Ux3aFN8gOiJ2cGMryq9KzcxLT6R1FRbVM0jMDw+z5HxHGc
         +g1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=iwFJqd3S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv14-20020ad44eee000000b004704581366csi6788785qvb.249.2022.06.27.12.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 12:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=iwFJqd3S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:34984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5usq-0007UO-PQ
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 15:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upR-0004Io-GA
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:25 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:59380
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upO-0000Zh-70
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:25 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1QF8015418
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=facebook;
 bh=mo+Wpbct7Exgx+EdBxqY+i88RyTpKdpQDWK3TFqkI0o=;
 b=iwFJqd3SgHI+8SGHpKkBfwl3Z06GzxxBLN/CbmLEoa8aZp2rpnSeGTPho3RdojUeQRC/
 +q35LiYX+ZELVo7SFLZYsA7trM9DTW5z/zs/q2ltyHl/mORnK2TIye9hsrH2powYQhIp
 3/Jk5Q8YcDd2uYxqnmyOV8HCM1hcDMS8ao4= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net (PPS) with ESMTPS id 3gwwv756s5-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:20 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:17 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id B14298D206E1; Mon, 27 Jun 2022 12:55:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <zhdaniel@fb.com>, <clg@kaod.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>, <komlodi@google.com>, <titusr@google.com>,
 <andrew@aj.id.au>, <joel@jms.id.au>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 01/14] hw/i2c: support multiple masters
Date: Mon, 27 Jun 2022 12:54:53 -0700
Message-ID: <20220627195506.403715-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
X-Proofpoint-GUID: k-QqyTJb0nwwQ7EODBPvGxBH1v1-C9hC
X-Proofpoint-ORIG-GUID: k-QqyTJb0nwwQ7EODBPvGxBH1v1-C9hC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Veizxg/xr48G

From: Klaus Jensen <k.jensen@samsung.com>

Allow slaves to master the bus by registering a bottom halve. If the bus
is busy, the bottom half is queued up. When a slave has succesfully
mastered the bus, the bottom half is scheduled.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
[ clg : - fixed typos in commit log ]
Message-Id: <20220601210831.67259-4-its@irrelevant.dk>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/core.c        | 34 +++++++++++++++++++++++++++++++++-
 include/hw/i2c/i2c.h | 14 ++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d0cb2d32fa..145dce6078 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -13,6 +13,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/main-loop.h"
 #include "trace.h"
=20
 #define I2C_BROADCAST 0x00
@@ -62,6 +63,7 @@ I2CBus *i2c_init_bus(DeviceState *parent, const char *n=
ame)
=20
     bus =3D I2C_BUS(qbus_new(TYPE_I2C_BUS, parent, name));
     QLIST_INIT(&bus->current_devs);
+    QSIMPLEQ_INIT(&bus->pending_masters);
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_i2c_bus, bu=
s);
     return bus;
 }
@@ -74,7 +76,7 @@ void i2c_slave_set_address(I2CSlave *dev, uint8_t addre=
ss)
 /* Return nonzero if bus is busy.  */
 int i2c_bus_busy(I2CBus *bus)
 {
-    return !QLIST_EMPTY(&bus->current_devs);
+    return !QLIST_EMPTY(&bus->current_devs) || bus->bh;
 }
=20
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
@@ -180,6 +182,26 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address,=
 bool is_recv)
                                                : I2C_START_SEND);
 }
=20
+void i2c_bus_master(I2CBus *bus, QEMUBH *bh)
+{
+    if (i2c_bus_busy(bus)) {
+        I2CPendingMaster *node =3D g_new(struct I2CPendingMaster, 1);
+        node->bh =3D bh;
+
+        QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
+
+        return;
+    }
+
+    bus->bh =3D bh;
+    qemu_bh_schedule(bus->bh);
+}
+
+void i2c_bus_release(I2CBus *bus)
+{
+    bus->bh =3D NULL;
+}
+
 int i2c_start_recv(I2CBus *bus, uint8_t address)
 {
     return i2c_do_start_transfer(bus, address, I2C_START_RECV);
@@ -206,6 +228,16 @@ void i2c_end_transfer(I2CBus *bus)
         g_free(node);
     }
     bus->broadcast =3D false;
+
+    if (!QSIMPLEQ_EMPTY(&bus->pending_masters)) {
+        I2CPendingMaster *node =3D QSIMPLEQ_FIRST(&bus->pending_masters)=
;
+        bus->bh =3D node->bh;
+
+        QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
+        g_free(node);
+
+        qemu_bh_schedule(bus->bh);
+    }
 }
=20
 int i2c_send(I2CBus *bus, uint8_t data)
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 5ca3b708c0..be8bb8b78a 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -69,13 +69,25 @@ struct I2CNode {
     QLIST_ENTRY(I2CNode) next;
 };
=20
+typedef struct I2CPendingMaster I2CPendingMaster;
+
+struct I2CPendingMaster {
+    QEMUBH *bh;
+    QSIMPLEQ_ENTRY(I2CPendingMaster) entry;
+};
+
 typedef QLIST_HEAD(I2CNodeList, I2CNode) I2CNodeList;
+typedef QSIMPLEQ_HEAD(I2CPendingMasters, I2CPendingMaster) I2CPendingMas=
ters;
=20
 struct I2CBus {
     BusState qbus;
     I2CNodeList current_devs;
+    I2CPendingMasters pending_masters;
     uint8_t saved_address;
     bool broadcast;
+
+    /* Set from slave currently mastering the bus. */
+    QEMUBH *bh;
 };
=20
 I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
@@ -117,6 +129,8 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
=20
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
+void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
+void i2c_bus_release(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
--=20
2.30.2

