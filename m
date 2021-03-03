Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5579752lfg;
        Wed, 3 Mar 2021 10:26:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtsoFZ+K+1SOkLAJVEEa4+cMXtVQG2P99EkeAApzmX3sIvYy2noXNWynuHIpznTaWzKyWf
X-Received: by 2002:a92:d6c8:: with SMTP id z8mr542529ilp.162.1614795979337;
        Wed, 03 Mar 2021 10:26:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614795979; cv=none;
        d=google.com; s=arc-20160816;
        b=I2rETPsDfWf9EbrdcbUGBZXumVkf6KlJS+aJSDgJ+UXioBAHaPvHoKSoavqUyJbzp/
         YRMltT+c1+7Qp0Jmt1C3VU3kJ/hwmsaykVQphJ7NYNhLigW7MOOD/+TLIFbqzk5chg1S
         0SByuA51HMSAICxXVJxoJm5eBbp1UrFjHW4C+UmiMh4A6lHIIiSNmBClI1e/C/HhMywg
         uFmoEpxNmiscc5I4RX3BiFc25j+OZbEdNXLwkESUEwpP5dLTktAfXbAcQFjmuPAmOZ2x
         UpEFzvYVZrHq2lfYF6iL6DfPJ9H0zpWlfgHndgyM/KApfh6ERylUKsMveGfnxpMUG9mp
         2Rzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PLSHq+T6Ji51VQxldUQn+fMOB/V6gychel2awYEX8OQ=;
        b=gls6vVbxmDUYE+y4bG/5afyd5YmOyXKAY4Zdpzzrd7zQU1Mi7jDdpo9U1ZMp2zIE1I
         nwQ3p/3y5o3R2u40ZP8+lOyRYwipD5aN7NwLIkrLZIVDkd6+8PBsClOmoRCoUeF14QOO
         UHtwYr7k3LozHeWRwY7yPgsfe1kRhwJxnY9KRtSsWb04DL9a0TYFmYcePJB0VDJFZxik
         Lz+JxueH4Mo/ftEWhAeVy1WqH/S2FpSj00GMj3Nc72bVRREL87t99W0PgthvWuSG6y8j
         w8OVsa+tW6sJ9DY0J48cXqleBH5NZG2zde0wID6hteEqBQwHkGrDHFSDNInM19GKobnD
         uC8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VQKnhB0L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si1459961ioq.100.2021.03.03.10.26.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:26:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VQKnhB0L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWCQ-0002AV-H5
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9H-0005Mj-5J
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9F-0000Zc-0h
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLSHq+T6Ji51VQxldUQn+fMOB/V6gychel2awYEX8OQ=;
 b=VQKnhB0Ll0OSNCfBjnovaibuIHYiEXA7TvissbPJXodoKPIzgJwOiVvCc8YJIS7EDQpoRT
 +9dNYKtTjk13IExXL3t+9ZuDaTVJX40t/PjxOgd3lA+CoC3JuOdVZhpe+jnZn2LKtSxaiE
 b8FrePGM3K+AbMn8i4uB7354F8O7xcU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-L_y9mhIHOxiezLMMv009Hg-1; Wed, 03 Mar 2021 13:22:56 -0500
X-MC-Unique: L_y9mhIHOxiezLMMv009Hg-1
Received: by mail-wr1-f72.google.com with SMTP id e13so13133089wrg.4
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PLSHq+T6Ji51VQxldUQn+fMOB/V6gychel2awYEX8OQ=;
 b=qtfuXoAatQvPxKtj9K8TU4EMLdMIgOS3tnO8mUH1X/qmqZaViJ71/vKbeJxKygSPZO
 KGlttszgaMiSfAO0MYEzDdt4rk3hILG3ZXGSMOFZYO38+h46BxvtT2BXphZmPSmYvTHm
 I8QNOnjCZiHmPTz0u9552Q5JMMtyPWSY9BxlEJBdu0Om4y15afDvJin4ZYuSyVaW3VyZ
 B/Tt1uaWbccP62vABsRwXHiJkGwwwEBiJftxj/HZjTC561O0tiRCVqH9UECRwwvoT993
 JrOvFnTr+QkEa3SvtOkWemkbD6aQ1KGM5y2gtP8SWKDnevFMG1UpeX6duYurhSvZ7SqK
 eT+w==
X-Gm-Message-State: AOAM532DzFWtEDrcRqPEPWaGfrz2Ro5ZV78GRzvvUgC2bnkaUy/M0R0V
 nxDzSiTz8rSqUJ8FYDsuIc0gLe8xVi7Ltv93VvLQrNvNrIFhO3CLxSAATmHqtexARso2ZDUbCrA
 6SZGv5JoJuvg48TgT1GgTmCkrj54HuQqZvWOfDf13kYmfDOJWisJo+bZFUxFKRBUi
X-Received: by 2002:a5d:4445:: with SMTP id x5mr36758wrr.30.1614795775646;
 Wed, 03 Mar 2021 10:22:55 -0800 (PST)
X-Received: by 2002:a5d:4445:: with SMTP id x5mr36729wrr.30.1614795775449;
 Wed, 03 Mar 2021 10:22:55 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g9sm34117131wrp.14.2021.03.03.10.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:22:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/19] cpu: Introduce AccelvCPUState opaque structure
Date: Wed,  3 Mar 2021 19:22:05 +0100
Message-Id: <20210303182219.1631042-6-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jML2fj5cbdOk

Introduce the opaque 'AccelvCPUState' structure which will
be declared by each accelerator. Forward-declare it in "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/core/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 074199ce73c..d807645af2b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -274,6 +274,9 @@ struct qemu_work_item;
 #define CPU_UNSET_NUMA_NODE_ID -1
 #define CPU_TRACE_DSTATE_MAX_EVENTS 32
 
+/* This structure is defined by each accelerator. */
+struct AccelvCPUState;
+
 /**
  * CPUState:
  * @cpu_index: CPU index (informative).
@@ -312,6 +315,7 @@ struct qemu_work_item;
  * @next_cpu: Next CPU sharing TB cache.
  * @opaque: User data.
  * @mem_io_pc: Host Program Counter at which the memory was accessed.
+ * @accel_vcpu: Pointer to accelerator-specific AccelvCPUState field.
  * @kvm_fd: vCPU file descriptor for KVM.
  * @work_mutex: Lock to prevent multiple access to @work_list.
  * @work_list: List of pending asynchronous work.
@@ -413,6 +417,7 @@ struct CPUState {
     int32_t exception_index;
 
     /* Accelerator-specific fields. */
+    struct AccelvCPUState *accel_vcpu;
     int kvm_fd;
     struct KVMState *kvm_state;
     struct kvm_run *kvm_run;
-- 
2.26.2

