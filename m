Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp224761ejc;
        Wed, 11 Oct 2023 09:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcOCux50L0ooBqN0diPfJUiTU+4y+ao1K9qeeVbflwNwzGfMFmuJ4O8IxpJPWQQRry0vgr
X-Received: by 2002:a81:6c0c:0:b0:5a7:b4ab:9d7d with SMTP id h12-20020a816c0c000000b005a7b4ab9d7dmr6863615ywc.20.1697043195490;
        Wed, 11 Oct 2023 09:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697043195; cv=none;
        d=google.com; s=arc-20160816;
        b=SNx4sqEARX5hSc043AWQU4BVgg7vzPO7TuKeCL+fXighPPlGDJyykHS0CrvJwHgp2/
         5UKprZjrSwGNLxsKnGwy3/cNU5gcIB5L+oXNVyrN2xDGtGYCslCkMbS1tbbS3iCqbzGi
         lDrc/BbxE7hn1S1fpMhCj+wFBzXoqMy4CYokYQTicbQjoP1MN3in9DkMh6eXawPe8u1u
         GWM0SEcHZXmzujGGuEqL7XTENAl+IgD4puH150UuTgDjp2qFQsQiiTf9zWbJ4fMl+doT
         3qmlz8FgK/gDvRrge+p1MDhd2RRXBFyKmooQY69sbXdVRjOSWfiwbvEABek3ZWhu/s2P
         JimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zDvbt+k9krB0i+A+ICzkaDSaljC3RarYq7UNK++Je90=;
        fh=mISachWtBfNM+xwhtkUSxPXJbL9QWI2VyucuYtl+xAM=;
        b=z/9TxVtAVazHXWYTrk2v6we8rJYRBEHF41G8fVQmGH5wu9u1Np8ZqoMrgJJxrtUWxR
         E2y3GxpzkynPhllopem7OLKIdB1uiE5SmRgz4Ddoa7daYvEJP9V1xQWZ3XWU9IjDFS13
         64Wcc4/WD+1yG2wCqJOKARiEpo1giOh6b67M+sPeTB0cP2MRSczy7/h9E7XJkkpR8lz7
         mcxGaVK9gGo6cB2+ZMVjDuGCbSYtPOMW92Z8FPFKZiqylfJsZlw3gMAIYUkIxgJrpVEr
         ygGovnUtaT4HSKtRQcKNHNpbfoM387TAC7DQjcOkTk4o4ggR0gS08LDjKO5MrWN7+w+F
         luzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Ad+asRBu;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id j12-20020a81ec0c000000b005a247d6f44fsi5025460ywm.519.2023.10.11.09.53.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 09:53:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Ad+asRBu;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BGmRgv032365;
	Wed, 11 Oct 2023 16:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=zDvbt+k9krB0i+A+ICzkaDSaljC3RarYq7UNK++Je90=;
 b=Ad+asRBuwTy3EE1TTGpOfbz7CUO+QOx5ckFr3MPqnCgY41UxW0+/2ktIjITiMZWXR4Ub
 CrgiZY1dW4CnCvp4TpqqbWASM3Ro+Jq85+DKDQy0HlVzFhDwb5d50j5+dTvWKGPxgX+D
 jExXf/mNjxy4ekn/NYTvmPrf3BMPJToXjH9GyB6HRM8ujkbydyegkKESFXcsFr4cZ52i
 89SlTnoeZ6wqCGx2PW9eVB+e+EFXSz28ntAdXfLe/goKAf8HUZk8Hg2tRBWygzieG02L
 5eipZ9jL709E0Rou2ST7aU1yHlFcXQ0BHBTPotnsk6NhWzQpCVU650RNpoaGqqYmYP2U sQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnnvw9hhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:53:14 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGrERu002132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:53:14 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 11 Oct 2023 09:53:09 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v0 06/12] gunyah: Add IRQFD and IOEVENTFD functions
Date: Wed, 11 Oct 2023 16:52:28 +0000
Message-ID: <20231011165234.1323725-7-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: p-uxFust5u8GDY9p8ZavubnM7nac40HH
X-Proofpoint-GUID: p-uxFust5u8GDY9p8ZavubnM7nac40HH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110148
X-TUID: Ffv42h6+kfKT

IRQFD function allows registering of an @eventfd and @irq. @irq will be
injected inside guest when @eventfd is written into.

IOEVENTFD function allows registering an @eventfd and a guest physical
address, @addr, along with optional data. A poll() on @eventfd  will be
woken up when guest attempts to access @addr.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 accel/gunyah/gunyah-all.c   | 94 +++++++++++++++++++++++++++++++++++++
 include/sysemu/gunyah_int.h |  1 +
 2 files changed, 95 insertions(+)

diff --git a/accel/gunyah/gunyah-all.c b/accel/gunyah/gunyah-all.c
index 38d0a52b7f..6ec60aa8e8 100644
--- a/accel/gunyah/gunyah-all.c
+++ b/accel/gunyah/gunyah-all.c
@@ -23,11 +23,21 @@
 #include "exec/memory.h"
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
+#include "qapi/error.h"
+#include "qemu/event_notifier.h"
 
 static void gunyah_region_add(MemoryListener *listener,
                            MemoryRegionSection *section);
 static void gunyah_region_del(MemoryListener *listener,
                            MemoryRegionSection *section);
+static void gunyah_mem_ioeventfd_add(MemoryListener *listener,
+                                  MemoryRegionSection *section,
+                                  bool match_data, uint64_t data,
+                                  EventNotifier *e);
+static void gunyah_mem_ioeventfd_del(MemoryListener *listener,
+                                  MemoryRegionSection *section,
+                                  bool match_data, uint64_t data,
+                                  EventNotifier *e);
 
 static int gunyah_ioctl(int type, ...)
 {
@@ -64,6 +74,8 @@ static MemoryListener gunyah_memory_listener = {
     .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
     .region_add = gunyah_region_add,
     .region_del = gunyah_region_del,
+    .eventfd_add = gunyah_mem_ioeventfd_add,
+    .eventfd_del = gunyah_mem_ioeventfd_del,
 };
 
 int gunyah_create_vm(void)
@@ -316,3 +328,85 @@ static void gunyah_region_del(MemoryListener *listener,
 
     gunyah_set_phys_mem(s, section, false);
 }
+
+int gunyah_add_irqfd(int irqfd, int label, Error **errp)
+{
+    int ret;
+    struct gh_fn_desc fdesc;
+    struct gh_fn_irqfd_arg ghirqfd;
+
+    fdesc.type = GH_FN_IRQFD;
+    fdesc.arg_size = sizeof(struct gh_fn_irqfd_arg);
+    fdesc.arg = (__u64)(&ghirqfd);
+
+    ghirqfd.fd = irqfd;
+    ghirqfd.label = label;
+    ghirqfd.flags = GH_IRQFD_FLAGS_LEVEL;
+
+    ret = gunyah_vm_ioctl(GH_VM_ADD_FUNCTION, &fdesc);
+    if (ret) {
+        error_setg_errno(errp, errno, "GH_FN_IRQFD failed");
+    }
+
+    return ret;
+}
+
+static int gunyah_set_ioeventfd_mmio(int fd, hwaddr addr,
+        uint32_t size, uint32_t data, bool datamatch, bool assign)
+{
+    int ret;
+    struct gh_fn_ioeventfd_arg io;
+    struct gh_fn_desc fdesc;
+
+    io.fd = fd;
+    io.datamatch = datamatch ? data : 0;
+    io.len = size;
+    io.addr = addr;
+    io.flags = 0;
+
+    fdesc.type = GH_FN_IOEVENTFD;
+    fdesc.arg_size = sizeof(struct gh_fn_ioeventfd_arg);
+    fdesc.arg = (__u64)(&io);
+
+    if (assign) {
+        ret = gunyah_vm_ioctl(GH_VM_ADD_FUNCTION, &fdesc);
+    } else {
+        ret = gunyah_vm_ioctl(GH_VM_REMOVE_FUNCTION, &fdesc);
+    }
+
+    return ret;
+}
+
+static void gunyah_mem_ioeventfd_add(MemoryListener *listener,
+                                  MemoryRegionSection *section,
+                                  bool match_data, uint64_t data,
+                                  EventNotifier *e)
+{
+    int fd = event_notifier_get_fd(e);
+    int r;
+
+    r = gunyah_set_ioeventfd_mmio(fd, section->offset_within_address_space,
+                               int128_get64(section->size), data, match_data,
+                               true);
+    if (r < 0) {
+        error_report("error adding ioeventfd: %s", strerror(errno));
+        exit(1);
+    }
+}
+
+static void gunyah_mem_ioeventfd_del(MemoryListener *listener,
+                                  MemoryRegionSection *section,
+                                  bool match_data, uint64_t data,
+                                  EventNotifier *e)
+{
+    int fd = event_notifier_get_fd(e);
+    int r;
+
+    r = gunyah_set_ioeventfd_mmio(fd, section->offset_within_address_space,
+                               int128_get64(section->size), data, match_data,
+                               false);
+    if (r < 0) {
+        error_report("error deleting ioeventfd: %s", strerror(errno));
+        exit(1);
+    }
+}
diff --git a/include/sysemu/gunyah_int.h b/include/sysemu/gunyah_int.h
index 17b4ef9920..011b5a072c 100644
--- a/include/sysemu/gunyah_int.h
+++ b/include/sysemu/gunyah_int.h
@@ -50,5 +50,6 @@ struct GUNYAHState {
 int gunyah_create_vm(void);
 int gunyah_vm_ioctl(int type, ...);
 void *gunyah_cpu_thread_fn(void *arg);
+int gunyah_add_irqfd(int irqfd, int label, Error **errp);
 
 #endif    /* GUNYAH_INT_H */
-- 
2.25.1
