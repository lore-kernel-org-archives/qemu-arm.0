Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3457984lfy;
        Mon, 17 Aug 2020 20:34:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUjMDSSlp1WUog1fNG9aoLQfVsuHraDMbnM6XFPT+t40jMArP2hCMOyL5zox0+oz5x+R8N
X-Received: by 2002:a63:700e:: with SMTP id l14mr3272520pgc.22.1597721670530;
        Mon, 17 Aug 2020 20:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597721670; cv=none;
        d=google.com; s=arc-20160816;
        b=g3VkwQJHIXw9jUpFvpEYUilSv8v9ieVlidT4whVVAw0o73p2DXAmvsxN5e7MkMe/ae
         og56B01CrgTb6WBggND3fWmCRDxyUscszvhok6kPKZHyNfK+QDEjjZbSO+jqi18HKO+0
         RWaIP4sL60fM6Y+j0z198PCYd7Lo85LKVjcmxzkeVSyKMaKf/bLEtjIdmibVrZLAv/1i
         keXFhfSMWvtk9Yj1MkGrGfnf9BRUIAALqzuvzOCYmAt1DSMNcvznR4X3xZ5AIJMCVrIh
         Rsw0LbhLSukHqX2n0pY8R9ywu/2FWvtzhyiMDSxPYWDtw2/p+49L2l+nnf+oMct4SIy/
         KeXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MvO/3TaXIaWi0NFqkMYr5QRYsMxBjotQRfyRCmT/j60=;
        b=IQQJ1Fc3pujNantPrFkAqVGh/oMPQF2ROLy086otMppOZQvLhCoOKTyDhhhdPsZfcJ
         h3CP+8Pn568HxR02/D/S+n5YSb8/wWBbz3sRd+fWV1fnYEBr867JaJ1KGno8AG8QYtmi
         LQM5PB+fhLG7+tDUqsUDTcfbg6e2w+EZBnV1yA/az6CvPDg/PbMjooh1U8kzbXrawzUA
         ap8m9Z4gGTBhz3xI7WS3fzmBeDlfthLVDRJh/LGpoX+Eo2k6sRLHFQ6rNbHB/CTjj5CC
         Gh+UN0+yEYUo62LT/MpIRFhEGZZW4Aj5hRgShnVdv/3DiIw4AnCyILbTCdGwui0B5Mns
         Ad8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="bZ/yPHEM";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id z23si4574237pge.333.2020.08.17.20.34.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 20:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="bZ/yPHEM";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07I3Vmg1040227;
	Mon, 17 Aug 2020 23:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=MvO/3TaXIaWi0NFqkMYr5QRYsMxBjotQRfyRCmT/j60=;
 b=bZ/yPHEMhpxVIuf4tn/xLNMuinBJ1YDuCD8h6inPgHQrBcZWm3CAFEMWZp4T8mXb6s5O
 JFjdGpB3wQ02fMixkM91SkOaqX8YTHhRJl4XHohh4aXFaWz6sBuOCODnooJ2DJRNoZkq
 K3r1syiVyMoxp7pocB0ANCGf9dN6uGc/nBxrgyJM9dUisPmjVWTX9GA9ahAxk20PPd/9
 BSJfnghzdr9TEnnMmK1Q+bpfSYDdIOkXupHM2e1FRzy1Mq8Q0vbQzXNdZLMl6yAxeCiT
 P6RVuII+p2hQSGvbNOuXgda6TRDH2to4Aw8ozxAmYZbc6EDRp6AaaBohhPZyc/0ugoLA kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304tdk7b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:01 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I3WH5t041299;
	Mon, 17 Aug 2020 23:34:01 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304tdk7ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:01 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I3UBaI027184;
	Tue, 18 Aug 2020 03:33:59 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma02wdc.us.ibm.com with ESMTP id 3304scgsmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 03:33:59 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07I3Xx8N48824662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 03:33:59 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4564BAC05F;
	Tue, 18 Aug 2020 03:33:59 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FDFAAC05E;
	Tue, 18 Aug 2020 03:33:52 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.138.167])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 18 Aug 2020 03:33:51 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
        David Gibson <david@gibson.dropbear.id.au>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Peter Maydell <peter.maydell@linaro.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Greg Kurz <groug@kaod.org>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: [PATCH v4 1/8] target/arm: Move start-powered-off property to generic CPUState
Date: Tue, 18 Aug 2020 00:33:16 -0300
Message-Id: <20200818033323.336912-2-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818033323.336912-1-bauerman@linux.ibm.com>
References: <20200818033323.336912-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_01:2020-08-17,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 suspectscore=1
 mlxscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008180022
X-TUID: ADSkJo/LI6AM

There are other platforms which also have CPUs that start powered off, so
generalize the start-powered-off property so that it can be used by them.

Note that ARMv7MState also has a property of the same name but this patch
doesn't change it because that class isn't a subclass of CPUState so it
wouldn't be a trivial change.

This change should not cause any change in behavior.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 exec.c                | 1 +
 include/hw/core/cpu.h | 4 ++++
 target/arm/cpu.c      | 5 ++---
 target/arm/cpu.h      | 3 ---
 target/arm/kvm32.c    | 2 +-
 target/arm/kvm64.c    | 2 +-
 6 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/exec.c b/exec.c
index 6f381f98e2..82e82fab09 100644
--- a/exec.c
+++ b/exec.c
@@ -899,6 +899,7 @@ Property cpu_common_props[] = {
     DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
 #endif
+    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8f145733ce..9fc2696db5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -374,6 +374,10 @@ struct CPUState {
     bool created;
     bool stop;
     bool stopped;
+
+    /* Should CPU start in powered-off state? */
+    bool start_powered_off;
+
     bool unplug;
     bool crash_occurred;
     bool exit_request;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 111579554f..ec65c7653f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -174,8 +174,8 @@ static void arm_cpu_reset(DeviceState *dev)
     env->vfp.xregs[ARM_VFP_MVFR1] = cpu->isar.mvfr1;
     env->vfp.xregs[ARM_VFP_MVFR2] = cpu->isar.mvfr2;
 
-    cpu->power_state = cpu->start_powered_off ? PSCI_OFF : PSCI_ON;
-    s->halted = cpu->start_powered_off;
+    cpu->power_state = s->start_powered_off ? PSCI_OFF : PSCI_ON;
+    s->halted = s->start_powered_off;
 
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
         env->iwmmxt.cregs[ARM_IWMMXT_wCID] = 0x69051000 | 'Q';
@@ -2182,7 +2182,6 @@ static const ARMCPUInfo arm_cpus[] = {
 };
 
 static Property arm_cpu_properties[] = {
-    DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, false),
     DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
     DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9e8ed423ea..a925d26996 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -810,9 +810,6 @@ struct ARMCPU {
      */
     uint32_t psci_version;
 
-    /* Should CPU start in PSCI powered-off state? */
-    bool start_powered_off;
-
     /* Current power state, access guarded by BQL */
     ARMPSCIState power_state;
 
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 0af46b41c8..1f2b8f8b7a 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -218,7 +218,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     /* Determine init features for this CPU */
     memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
-    if (cpu->start_powered_off) {
+    if (cs->start_powered_off) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
     }
     if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1169237905..f8a6d905fb 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -775,7 +775,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     /* Determine init features for this CPU */
     memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
-    if (cpu->start_powered_off) {
+    if (cs->start_powered_off) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
     }
     if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
