Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5585788lfg;
        Wed, 3 Mar 2021 10:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/QTWY7DHhqkap2v8c6COAq567ZvGYDcz0kKxoQck8PRbMV+fClxMBrP6QsKlMoHw5/Mad
X-Received: by 2002:a02:30cb:: with SMTP id q194mr167207jaq.57.1614796511386;
        Wed, 03 Mar 2021 10:35:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614796511; cv=none;
        d=google.com; s=arc-20160816;
        b=sc2tIhHwsZ/VfudaW+RNyFa0swCiYbNI490DUXEq0zAG6RUTDwvCwOXPk8IqVzRf2H
         zi1HiKMoy49dHdam1LWv7miuhkU4/pqGqMMfDuVGt6SCwZhZdCwxy8E1eolUM+T3tvnD
         fQ1Wct0eL1jMAf6yaYpKnWqx8BMn1LsX0WWtemHbqk1KjIFeX/iesVMKcvpWMbzIcL1Y
         HT2Hl1B1GbT/Tq1/Ry1jIRtYo/fMFzuB4BkmpsBBMdZ1a/zafoDWTm7ORGAHazWw+XNa
         w8ywfvULP7QciSzL9YziMz/lUEzxGzT5MKNSc+Y4CqXRYDUzYbWnsm2DRIPN92Om5ZPm
         wL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HpZXUiaC2c4IcwOvA2cs846pRcaPAAbCPhPXUPapPlg=;
        b=ynr7p5hLX0p3llz/VYVmEgeryL+UmUIgsjwEj4yon9ag8LB7705Sz8qNYVeD1NCHRP
         D9dVUPaTJvdhZBwUFG6MMZbYOA2RpvcAiQwWActncKE9Cn2cX0W+TYyLJyjjK7h7f9cH
         wlU401gtZcfLShtejVZV+FxMIXz3Pwh/T6sBcfZe+1G28wppXwmznlpiXousMnYwwhlF
         F5qWs70l0MndsobX9GoF1DqHEFIUBeUoKSI8PxXrRwO9SZwl88U2BpJF+piKF4GYpSb4
         4PFceFVVrm69aIe4su3+sBQGPZ6g3Gy1gaa+7zDRiC0YOzsB34RWMcBVstUj+77mE9P4
         MfaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hSJg74Fq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si23264422jav.20.2021.03.03.10.35.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:35:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hSJg74Fq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWL0-0007Pe-Me
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWA7-0007I7-Ln
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:23:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWA5-0000rI-7F
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpZXUiaC2c4IcwOvA2cs846pRcaPAAbCPhPXUPapPlg=;
 b=hSJg74FqOG1CbtNJiNt0LNxqLkrhLpC+SQOYVi6ipfSA6v9tmS3L5QZvGmmi1BRdSTcnmv
 Z+iE7wRNglIO5wbUVVJye0dgKsCCE565lCPjLxkMs9KoLeR9TrKf8TO2Hsnp90HW/vs3i1
 BvJBEuWd+wnpkEFnvzGuTr32TqGQtMo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-6tOugk3jON2uJnSeSyfp5A-1; Wed, 03 Mar 2021 13:23:51 -0500
X-MC-Unique: 6tOugk3jON2uJnSeSyfp5A-1
Received: by mail-wr1-f71.google.com with SMTP id l10so13161424wry.16
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 10:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpZXUiaC2c4IcwOvA2cs846pRcaPAAbCPhPXUPapPlg=;
 b=WNWbzA9DvvkjQMMI+wy0ssKIziqc9eXwu5waxSBWwOWxzcK50gL1TQ962dzbTf8058
 Mo/BZvt/APIUdf/5bZSGxkjzQ5duLE/fEX8ZdSSJVQgiFBe/iGnbYQ9lEEQq+j9g1jyd
 dohKRhH+YQmCXBBPQ/rdWk75YxgsaodkHMkXwwYC8TY/WfQH1x2d6M5xWxGpJdtlwRMy
 Fo/tTsp6Am9U1Neo4zA6zSCDNzFKn/Xz1YLS4ySplRiJbhaPy/3LTWwUtv0taxQ4uKqW
 uSLEVDaxSMjCzq89ioVJqmuSkiUfcyvdyu6+4bNL+MQjSg4ozZ2F5ViDuxcZ0aT8RbXw
 LIBw==
X-Gm-Message-State: AOAM5327xj7kCBhkUKKapCIq2ep9sr8UwywwZJ14/EjCcVo4c0DKbObv
 Eat7sw0GyASw74QY1+Vs6LI8xsNGyw9x9uruo7QuT8egiuEn/3TJ6cjYNZd55pm4dDxWk0I/0bE
 Sb+43IoveoVX9
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr38395wrc.48.1614795829793;
 Wed, 03 Mar 2021 10:23:49 -0800 (PST)
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr38385wrc.48.1614795829618;
 Wed, 03 Mar 2021 10:23:49 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p14sm6718722wmc.30.2021.03.03.10.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:23:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/19] accel/kvm: Declare and allocate AccelvCPUState
 struct
Date: Wed,  3 Mar 2021 19:22:13 +0100
Message-Id: <20210303182219.1631042-14-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tVqKFGbpoEuI

In preparation of moving KVM-specific fields from CPUState
to the accelerator-specific AccelvCPUState structure, first
declare it empty and allocate it. This will make the following
commits easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/kvm_int.h | 3 +++
 accel/kvm/kvm-all.c      | 5 +++++
 target/s390x/kvm.c       | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index ccb8869f01b..f57be10adde 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -13,6 +13,9 @@
 #include "qemu/accel.h"
 #include "sysemu/kvm.h"
 
+struct AccelvCPUState {
+};
+
 typedef struct KVMSlot
 {
     hwaddr start_addr;
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 8259e89bbaf..4ccd12ea56a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -399,6 +399,7 @@ void kvm_destroy_vcpu(CPUState *cpu)
         error_report("kvm_destroy_vcpu failed");
         exit(EXIT_FAILURE);
     }
+    g_free(cpu->accel_vcpu);
 }
 
 static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
@@ -434,6 +435,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
         goto err;
     }
 
+    cpu->accel_vcpu = g_new(struct AccelvCPUState, 1);
     cpu->kvm_fd = ret;
     cpu->kvm_state = s;
     cpu->vcpu_dirty = true;
@@ -468,6 +470,9 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
                          kvm_arch_vcpu_id(cpu));
     }
 err:
+    if (ret < 0) {
+        g_free(cpu->accel_vcpu);
+    }
     return ret;
 }
 
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index d8ac12dfc11..cf6790b2678 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -2085,7 +2085,7 @@ int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
     int ret;
 
     /* the kvm part might not have been initialized yet */
-    if (CPU(cpu)->kvm_state == NULL) {
+    if (CPU(cpu)->accel_vcpu == NULL) {
         return 0;
     }
 
-- 
2.26.2

