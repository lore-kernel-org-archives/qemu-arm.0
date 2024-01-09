Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp259749ejs;
        Tue, 9 Jan 2024 01:01:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENMwA8tcchZGBb3dMCo86g5TwzIEbYdLsQOXGU2evZqnWR+yQFcN6VelAEbL+9X5kPSQqr
X-Received: by 2002:a05:6808:1594:b0:3bd:40ed:497b with SMTP id t20-20020a056808159400b003bd40ed497bmr106973oiw.90.1704790877090;
        Tue, 09 Jan 2024 01:01:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704790877; cv=none;
        d=google.com; s=arc-20160816;
        b=fhHoUKi4DpYRZFpb9p21YlQfCJKRKjsbfeoqr4LqjcqiloEZ6qNFrcNB5R3D5Wlk95
         +1Y3YziqgQm/1E2bXonnabm6cxaVQZvg6ze0oO2I8zLUB/o+AGhFkHxUEwrkR10DrL0L
         3g/9itmi2OXxx7C0wBWfSG8MGU1/QR9e5rf5OooFobQpUQmwtfoihG8Vd+86jR/CjLYj
         de80ExVmpN7ifSACcwkybz5HUuDhKosC3rdifUtsgYi6xuwD0AJAsGinEU1fAtlYcslv
         nmrNSGOk/1t1bcCkBXyTG5v67OCrb7QeIol12QnH1xbqnBq6mQpKQKXa4VwhYM/aiWmT
         PUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2q/l05M8hfQsIs/AAF4VzkjwGAbJy1GX/X3R6gCt3LI=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=zoPS0Mwu77AlNwMZQJxAUp6nALNP2C5lupeRvf+KXSphElhJ1w2O2APFPainXVr/nJ
         TOtUbNp9kJKSHwvK3XkmYrlOPIv7haG3NvhYcDWQCk/vslyXfM91tSEo1dHhQelDMmE0
         sFuTOI1Rp4HcnumibQLWu00zHBSS4gP7IJ9C0ocvVeHvRWzdPhwZL14stW4W+xrl6J8i
         UbolFeEvTsfdf1kcMYtBLEJwWIwNRSs/FXcTdAMiRjrZrsgJiu4SnEFtG+A5srPRpRZq
         uCdp9Z16Vo5Dix98oHJWcUGmJOSaY87kDiPDJ1Y8yb+g+KDAbDf6cSnRrybGSJpJdAkw
         Vi6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=RoI6Iiwh;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id bi21-20020a056808189500b003bd41a6a386si877oib.66.2024.01.09.01.01.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jan 2024 01:01:17 -0800 (PST)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=RoI6Iiwh;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40979Ddn017737;
	Tue, 9 Jan 2024 09:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=2q/l05M8hfQsIs/AAF4VzkjwGAbJy1GX/X3R6gCt3LI=; b=Ro
	I6IiwhbPztkT/xCTpsCqDElnDi1WaFwd78eVCotcnuxP/y4rnJTyfnh49B7t33En
	VsNjpQE6oj9fiPIiURx0LuRpMjZWOsqTM/Xyp9IMGE3upVWhANSnHLihrXsh+2+r
	BYeIfRuF7JTPm8hqgYkLhC5TDS2jqswbeZ5j3nKYcuRwK9RGleLpri0CwwGuA1X9
	S/oMhiJxjJSSExmJr/p8jOmZbSVLA6zrmSWu15sp+h0vhGSVHNCZAwXTBKhjb+YH
	70ms4HhnlbCIhh0rLcxXm2siwLbA7efX50C+wLFb+c5cVA/MeuvHc2pI9ZJdTCzf
	S4WoMYcidsHq6eG/kQcQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgwx38k1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 09:01:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40991FX0003565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 09:01:15 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 01:01:11 -0800
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v1 05/11] gunyah: Add IRQFD and IOEVENTFD functions
Date: Tue, 9 Jan 2024 09:00:33 +0000
Message-ID: <20240109090039.1636383-6-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109090039.1636383-1-quic_svaddagi@quicinc.com>
References: <20240109090039.1636383-1-quic_svaddagi@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KcQcQ5Dyxe6AAqHeZN-VSPFf3E-hgDfV
X-Proofpoint-ORIG-GUID: KcQcQ5Dyxe6AAqHeZN-VSPFf3E-hgDfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401090070
X-TUID: ExObXM1oP1mw

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
index 8b6b2d2017..8aaf5b7354 100644
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
@@ -306,6 +318,88 @@ static void gunyah_region_del(MemoryListener *listener,
     gunyah_set_phys_mem(s, section, false);
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
