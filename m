Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp259666ejs;
        Tue, 9 Jan 2024 01:01:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuNEMDBwxWTv6WWS0y9m5WyvoKFeyd+I5JbM+iz9LjlvytBjOrTXXzSeNuBP1f4kIi0nwN
X-Received: by 2002:a05:6830:443:b0:6dc:5dd:8727 with SMTP id d3-20020a056830044300b006dc05dd8727mr3684994otc.68.1704790868851;
        Tue, 09 Jan 2024 01:01:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704790868; cv=none;
        d=google.com; s=arc-20160816;
        b=cXdlILhyoUXfbj11oXlx1Xp1KKJzpq3T7K2VlT5tZrOdMEaIc1gGDCFSJB+85hs4cc
         9mZlxkn/B7PcmL5miHJSeRWOIE89d4DdzI0NN38SFU0WFDz+kkXzs0RokiaFW+j3zWL3
         rFnOZ+ZRJGjo0pJyZ2aswnIzkPpfSdGasB1jkyosER/F20Per0Zf3cJZGFzFhcPC9G50
         Ec4ha030/SlG2Xn9lupgp0nWwiQ8NFOZaT/9HS+1zf69tO9kNdE1iFY2UUZ1vgCJ8nsU
         rzKzep1kNW1WIT69EtpGEaIreWI6e3akNiEr9IYWzWolO00FX1bFj5SnaGKtmGqHebQT
         g7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4LLPJmcwNDYE6zAIgfTw5xPBLw1+IKRY6ytH61cWc0M=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=wjEwMumOLSzv2KMUFY6A5FlycDqZ6FlwxwgIn0cO1NiLxK+Cfhzs9lsyorRExOmkhw
         IVs721W79OA1q8ZbRNJOfdhwjpl6EiVlJ3lhAQbYacy54KM7/PeJWscH7eNGSPfGc+za
         SVb/QDWBWj83xotmPpFpM9OvDHHC2L2i2x8lYkMp1CJR1cVGXQjM+NXcPjtTI3lGjvJ2
         ueFys6vZgD6Elrym6ipV7Peqfx9k68OKI88ro36eCiPUxh7XHDE/fvPSkpmJmfXX37zn
         OwZrwfLQGqSkxcS+bK6PJ/Lkj7D9AH1v4uY3DTU2laYaG0RSSXDc/NZFqnQymjombynX
         ssOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=UEC99BKA;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id ca27-20020a056830611b00b006dc044391b9si536485otb.196.2024.01.09.01.01.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jan 2024 01:01:08 -0800 (PST)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=UEC99BKA;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4093aCwW024213;
	Tue, 9 Jan 2024 09:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=4LLPJmcwNDYE6zAIgfTw5xPBLw1+IKRY6ytH61cWc0M=; b=UE
	C99BKAHOLV3FTxN9UgHQDJpWjbBxRPPK9NbrrfyDe2RmkGeBeblJ7TD2HYPYsk4C
	OE2y7KRipdXXuEeccUnXtdCuwuduhCNPrIIXBu+G1RsOQU2VH/43e7E5xW0alqks
	5PfH7wkViHtOlslAjKZ1XRxtozRJNkFjKu/+RrkhqGCP1mXHN5iP6Pr6pf5u/reQ
	C8kGH5lXdKYvR5Xupv0al1EHIRsDHlG7r75P8UgQ3rY2YBUEJetUbrbTV7Pbp/yw
	6uTtWFErxcBkfkxPhd9ihxoq46x6mdf1Z+JTDEHFslNJrVPcb61/99HLwbqTADr6
	gaBfCl6kSBy6FHEOcOvw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgwhs8myu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 09:01:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 409916xp026295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 09:01:06 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 01:01:02 -0800
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v1 03/11] gunyah: Add VM properties
Date: Tue, 9 Jan 2024 09:00:31 +0000
Message-ID: <20240109090039.1636383-4-quic_svaddagi@quicinc.com>
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
X-Proofpoint-ORIG-GUID: MmiqAHrQ_umje1y47YZ-kNygh9osnzl5
X-Proofpoint-GUID: MmiqAHrQ_umje1y47YZ-kNygh9osnzl5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=966
 suspectscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401090070
X-TUID: 3kJyJMaDy+vz

Add 'protected-vm' and 'preshmem-size' properties that can be specified
for a VM.

Protected VMs are those that have 'protected-vm' property set. Their
memory cannot be accessed by their (potentially untrusted) host. They
are useful to run secure applications whose data should remain private
to the VM.

Since a protected VM may need some memory shared with its host, for
exchange of information, 'preshmem-size' specifies what portion of a
protected VM's memory should be shared with its host, with the remaining
portion being private to it.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 accel/gunyah/gunyah-accel-ops.c | 65 +++++++++++++++++++++++++++++++++
 include/sysemu/gunyah_int.h     |  2 +
 2 files changed, 67 insertions(+)

diff --git a/accel/gunyah/gunyah-accel-ops.c b/accel/gunyah/gunyah-accel-ops.c
index 1419de57e8..fe732a1d47 100644
--- a/accel/gunyah/gunyah-accel-ops.c
+++ b/accel/gunyah/gunyah-accel-ops.c
@@ -37,6 +37,60 @@ static void gunyah_accel_instance_init(Object *obj)
     s->vmfd = -1;
 }
 
+static void gunyah_get_preshmem_size(Object *obj, Visitor *v,
+                                    const char *name, void *opaque,
+                                    Error **errp)
+{
+    GUNYAHState *s = GUNYAH_STATE(obj);
+    uint32_t value = s->preshmem_size;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void gunyah_set_preshmem_size(Object *obj, Visitor *v,
+                                    const char *name, void *opaque,
+                                    Error **errp)
+{
+    GUNYAHState *s = GUNYAH_STATE(obj);
+    uint32_t value;
+
+    if (s->fd != -1) {
+        error_setg(errp, "Cannot set properties after VM is created");
+        return;
+    }
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        error_setg(errp, "preshmem-size must be an unsigned integer");
+        return;
+    }
+
+    if (value & (value - 1)) {
+        error_setg(errp, "preshmem-size must be a power of two");
+        return;
+    }
+
+    if (!s->is_protected_vm) {
+        error_setg(errp, "preshmem-size is applicable only for protected VMs");
+        return;
+    }
+
+    s->preshmem_size = value;
+}
+
+static bool gunyah_get_protected_vm(Object *obj, Error **errp)
+{
+    GUNYAHState *s = GUNYAH_STATE(obj);
+
+    return s->is_protected_vm;
+}
+
+static void gunyah_set_protected_vm(Object *obj, bool value, Error **errp)
+{
+    GUNYAHState *s = GUNYAH_STATE(obj);
+
+    s->is_protected_vm = value;
+}
+
 static void gunyah_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
@@ -44,6 +98,17 @@ static void gunyah_accel_class_init(ObjectClass *oc, void *data)
     ac->name = "GUNYAH";
     ac->init_machine = gunyah_init;
     ac->allowed = &gunyah_allowed;
+
+    object_class_property_add_bool(oc, "protected-vm",
+                    gunyah_get_protected_vm, gunyah_set_protected_vm);
+    object_class_property_set_description(oc, "protected-vm",
+            "Launch a VM of protected type");
+
+    object_class_property_add(oc, "preshmem-size", "uint32",
+                gunyah_get_preshmem_size, gunyah_set_preshmem_size, NULL, NULL);
+    object_class_property_set_description(oc, "preshmem-size",
+        "This property is applicable for protected VMs and indicates "
+        "the portion of VM's memory that should be shared with its host");
 }
 
 static const TypeInfo gunyah_accel_type = {
diff --git a/include/sysemu/gunyah_int.h b/include/sysemu/gunyah_int.h
index 37de628b37..b1fd7f9ea2 100644
--- a/include/sysemu/gunyah_int.h
+++ b/include/sysemu/gunyah_int.h
@@ -19,6 +19,8 @@ struct GUNYAHState {
 
     int fd;
     int vmfd;
+    bool is_protected_vm;
+    uint32_t preshmem_size;
 };
 
 int gunyah_create_vm(void);
-- 
2.25.1
