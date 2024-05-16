Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1409860ejl;
        Thu, 16 May 2024 07:34:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/JG2pLpgBWf6iZUkypWGC9myCPeErUwWvTUtp53qQjiMq9ecEn8i5s6WiQQutH/+3U3x0t3Om7+jXHkJz9yramq3synLk
X-Google-Smtp-Source: AGHT+IE+rAiG42At/9cku5A0zwpOXHakT4eO1GZ7FjUHNCBPMufPWS3wE9RUCnHAp/eciaReiGOQ
X-Received: by 2002:a81:4f51:0:b0:61a:e24d:186e with SMTP id 00721157ae682-622af7e675dmr123845667b3.14.1715870076910;
        Thu, 16 May 2024 07:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715870076; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbPrYD6hUfxjAP1c443qpctccSMsQtzl/bF8buGqbnURrsEMHZbL9CYJ66nPNv81nt
         ilCioqTY2K5zU/IWRaloigahnmywlbAWJBXLjxegfuvmBZirvnQvbYd6tF0END0BbJS8
         aERqfKPOBP24fk+/l5OHivr4Cbf8ksSOqAQDq7GLrLnRm5JAg1H4wnrEG0brGB5mw8aV
         FoEj2buAy7twHXDkYfHAx444Yn3+8N0fCP9UpZIY8NZF0QS5xrsdDcDiV/X4lHPuCmAt
         lnFbHN1FYYQWZO/5jWEtZYsLz2bm1nTkOvco+ALwOqP7WfIxrZCQinZoid+A916X3hc2
         fUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PMVuOr04+dYDbP1VfZJzxP7tsWrGMntkYUPSIF7wQrU=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=Mo6BPH0ZmpNJ2Z4BOHruv5qkl5gj2DXimsQgM7B5z8KGBDdvTcZYIfdS2W/cbAG2sZ
         SyX3hVpm6bKyg/JOSXyOyoBE1/PG+vFzciiDpP8LwFK3QxERiDsZ0OyGx4O7OYRN50n5
         jop5SWPJhiINMAflBxwhQJ0gn9/9LqwXgqIsVO70n9fYruPMp5kF9izkHqIyACxuCyjb
         +Fs3zEWeGw8SWKttoZqUbZQoUxIPLp369y4nTqPAjVfctGVEoxfaSC1oQ06H8E2jsddK
         VgTXStIsZBw1KsUcTRZbqJ1ghFBssA0AwGKzw9bvRKAB/0yqZ56CkPQbsw56kdTSovyb
         yH3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=c5UmojGp;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id 00721157ae682-6209e293332si76263447b3.18.2024.05.16.07.34.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2024 07:34:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=c5UmojGp;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8Fqd0026431;
	Thu, 16 May 2024 14:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=PMVuOr04+dYDbP1VfZJzxP7tsWrGMntkYUPSIF7wQrU=; b=c5
	UmojGpSdqC+5TA79TEtZ14DMkGM+90um0tBpQu+07dnRcyy3EYL0r+qs/5YnULAy
	i6ZI4jMa1+2KEO6B/C22Fz/ZlEJ6T+wz170Vc9DlkyBSZ3M+klzyVoXewCyrj6Ic
	GrW7pFhIpo262gnqLAlU+9ciBqoDZAwlCA06Hm1ttxLjaTfhz2zLmhMGRxu5jwb0
	2f0WKnwfMcdahB5dojxTSzIMADVIS24qsvcAUViyHPUC0Xi5kQCeqTYUkNF+8ohO
	t0K7WauZMYU9CVPJYHWp9/KhomluuXRkxT1/zSrfW5ROW1kXg/NAiuZK+6Q+fuZM
	BnLF3Lppb/cE4gdAXaaA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47egdujp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEYZnq026569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:35 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 07:34:30 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v2 06/12] gunyah: Add IRQFD and IOEVENTFD functions
Date: Thu, 16 May 2024 14:33:50 +0000
Message-ID: <20240516143356.1739402-7-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516143356.1739402-1-quic_svaddagi@quicinc.com>
References: <20240516143356.1739402-1-quic_svaddagi@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zZbDnPbSs5Tg4bm_hAhW_kE7qEPVyG4w
X-Proofpoint-ORIG-GUID: zZbDnPbSs5Tg4bm_hAhW_kE7qEPVyG4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160102
X-TUID: T5miDj/4NfmH

IRQFD function allows registering of an @eventfd and @irq. @irq will be
injected inside guest when @eventfd is written into.

IOEVENTFD function allows registering an @eventfd and a guest physical
address, @addr, along with optional data. A poll() on @eventfd  will be
woken up when guest attempts to access @addr.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 include/sysemu/gunyah_int.h |  1 +
 accel/gunyah/gunyah-all.c   | 94 +++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/include/sysemu/gunyah_int.h b/include/sysemu/gunyah_int.h
index 0967b2d7d7..8c0b479f62 100644
--- a/include/sysemu/gunyah_int.h
+++ b/include/sysemu/gunyah_int.h
@@ -49,5 +49,6 @@ struct GUNYAHState {
 int gunyah_create_vm(void);
 int gunyah_vm_ioctl(int type, ...);
 void *gunyah_cpu_thread_fn(void *arg);
+int gunyah_add_irqfd(int irqfd, int label, Error **errp);
 
 #endif    /* GUNYAH_INT_H */
diff --git a/accel/gunyah/gunyah-all.c b/accel/gunyah/gunyah-all.c
index 19f96225a0..948ccfbeee 100644
--- a/accel/gunyah/gunyah-all.c
+++ b/accel/gunyah/gunyah-all.c
@@ -24,11 +24,21 @@
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
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
@@ -65,6 +75,8 @@ static MemoryListener gunyah_memory_listener = {
     .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
     .region_add = gunyah_region_add,
     .region_del = gunyah_region_del,
+    .eventfd_add = gunyah_mem_ioeventfd_add,
+    .eventfd_del = gunyah_mem_ioeventfd_del,
 };
 
 int gunyah_create_vm(void)
@@ -319,6 +331,88 @@ void gunyah_set_swiotlb_size(uint64_t size)
     s->swiotlb_size = size;
 }
 
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
+    io.flags = datamatch ? GH_IOEVENTFD_FLAGS_DATAMATCH : 0;
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
+
 void *gunyah_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
-- 
2.25.1
