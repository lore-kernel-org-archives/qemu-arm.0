Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp224669ejc;
        Wed, 11 Oct 2023 09:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa6n/kCB1Rr0rCTKZ3yfp6inQDPcsrJTnpdezhnsTQzDsCOBH5sORVP0aCpeqYZIf0TQT7
X-Received: by 2002:a25:641:0:b0:d86:74e5:9469 with SMTP id 62-20020a250641000000b00d8674e59469mr18003094ybg.16.1697043187111;
        Wed, 11 Oct 2023 09:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697043187; cv=none;
        d=google.com; s=arc-20160816;
        b=YvQ3ZYbQ/RW9HBfsBgkVRiq/SVsT7ZDsj8Jg1CNxie74JRDpeOy4/XctnKbCl85yrO
         gYf6DQ1l1x58EZfp4UTPNDIuPusguQ4aWaJWm/rhhONqQTHCFKy0e9ZhTQwS3ba2tOE8
         4FJ5sw2emkOS8Ojft5Yt6c+Oek9pYcG0wy/xRx96rSnFpqbT2TA/kCweM1O+29H+dZcI
         broAimce5dOioaO3IRBWczC3s/Ny4LjOBIoRxwLP1q+rl+JUgva+1C/wfgRNt05impyp
         VfqmC/gxyn1ZsHPmijnhp2oVdpuUNooYjTQ6YERJcKf6Eto4cxcDeYt+v+m9u3MM7BFs
         S4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aKCik6loT2tDTTKOP+RQkmj+QfmfOkUlBUcFV9MK+s8=;
        fh=mISachWtBfNM+xwhtkUSxPXJbL9QWI2VyucuYtl+xAM=;
        b=yJYY1nGKyEuBOlm6AuJ/RQD21BKlFQ27IWuM8c4FzdUmMcpiqWx4LJJkwwKS1zjRxB
         raCuNGoesYDpsa82tgf7QptCG9vKaFzsNiCeJMszliq0iD8JPecwuy8qXcWe9ykRM9Uh
         mhDOO0fBoh3HDAAI+q1VG4A7sYABo/dytWU4rKpCJXVhIYzVYultnEf6ET6Quu0rc0YB
         u7S9PjOgdOiVOZNJijUqfkvQjnJcFz2q5H4Oj2LvB00VjPUTwkBmfX1RHIDBrcx6/Q74
         2NVsjZzXXPc30WbmRNrwjNoVfrLgpfFGXXGIQTtIu8sjAModAZnhP4uSAdx75jg7wFKB
         Hr8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=luhnnf16;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id x8-20020a25ac88000000b00d8678348cfasi4801824ybi.276.2023.10.11.09.53.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 09:53:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=luhnnf16;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BFqO4R018254;
	Wed, 11 Oct 2023 16:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=aKCik6loT2tDTTKOP+RQkmj+QfmfOkUlBUcFV9MK+s8=;
 b=luhnnf16F7VgiAZm31pQMY6xPT37XzVORo2Q69wPgDO9oxtRgtO8BUmJo6b7n3PQmLU1
 zcSfzqsyoOrEO0D5S6+UJ3akTgpPibslb13EvBUo+3qegDqndRaXdInsEHeCJJcvI5Em
 4TMjKbiUcbXNMt4dAAXATOML+6xPVbeUygbVctFnL3c1Ac1JnvAE5MKDxagW+BkDgFB6
 ngfDRtONeoe2MEgubWGVJNlkKBHRaLnBGpJmioJ1F6BFozxO1h4Xu/zEyPRZIKU/dJeH
 j2o4cK/fm+2ohlwmKC6/SQiBTEgf6H/lLjqf49i/jhFOuOBseoHd0D/ihz6jfWoMzT5u ZQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnn1gsk70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:53:06 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGr5H7002055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:53:05 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 11 Oct 2023 09:53:01 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v0 04/12] gunyah: Add VM properties
Date: Wed, 11 Oct 2023 16:52:26 +0000
Message-ID: <20231011165234.1323725-5-quic_svaddagi@quicinc.com>
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
X-Proofpoint-GUID: WuCR72cGOGkJL-ITG09u2xXC6wcirWtI
X-Proofpoint-ORIG-GUID: WuCR72cGOGkJL-ITG09u2xXC6wcirWtI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110148
X-TUID: 7r2lKZx8lL+k

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
index 1c1c20abf1..77089c4f36 100644
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
