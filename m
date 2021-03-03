Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5582386lfg;
        Wed, 3 Mar 2021 10:30:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgH47OOH2MLSSQeE+u6giYimnjNaQRzCQOB0r7Xh3TIZ6LDGsKkQR4OHgEC7y+CgUY3xyi
X-Received: by 2002:a02:a90f:: with SMTP id n15mr175885jam.110.1614796230935;
        Wed, 03 Mar 2021 10:30:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614796230; cv=none;
        d=google.com; s=arc-20160816;
        b=mHj7lAm0/6x9NJ7Z7D+nQKlSXnfYVbqSwom1bfhjtwXrHz79DqO4fsYGZ7bzM3YxBX
         BC9H8P0aJzPwitYjI2DeT6MxBWDsiW3QWEHCSexfI/iGk0nKu+0EgMNRrndPaYb+Zu0p
         eOomMxLVd3+YVtntJFUXtIoaGEd+geYiW1LnXgXroE8p+hpry5DO/3F2vVZn4+m4QzQA
         QmL+/F5GqzO3j1r7HE0q47aB4Pw/RdoWpF3ncaSSrWk4OJeTYDIW6eMcNqDLH11pLveh
         cuti1g3tXcev6Wy800Zv3SyFB2gjj5J6M0Hq6HeOjgdMX5gsNvPkysCTh4xYzoYGf9du
         J82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=M4K8ZUs7Kh4DBTFlI/pvongtlyoWjFjhXN1UWmJlGpA=;
        b=cv31sncF6LuS1Tr1Qr9z3RWP5WFiNbuggz78naBgR6HfkrvEvs5O7d/AGv4nF2OJTG
         ZOH2S34sBqfbjYrMSAiX9wWsW5MGFprrzrJKz4PpeL1VXj53m+obgKxIljBs0y/85pAl
         2W6Jh69/tpaje1EfcKtOZB0+Y69lPViahSzaM6qIVDBy94qvpC5ECjREGVXdT2KLvt64
         0XoJjapxi+KnlBllDioSq6I1nJbnTftghnyIZd6Ds30I4lGX3jI6AohRJLIJFlYRTjjD
         jAjIcXcDNytsSesOYPzOhCMww8wz3kIGHFVicvofCceDhVnYPl2mxd0zM5jBJaRNm735
         Af/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JGgXp64+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si16721214iod.10.2021.03.03.10.30.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:30:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JGgXp64+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWGU-0000PV-7D
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAK-0007fC-4f
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:24:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAI-0000wY-E7
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4K8ZUs7Kh4DBTFlI/pvongtlyoWjFjhXN1UWmJlGpA=;
 b=JGgXp64+CmYvAlCIVehTq8eiZutVObxvoaFiZDQGFEOkbK6dO2rgiHRYI+3NepuUAKvhxS
 yIdLbPDUUqeFcUzQdnBptU3Viq1oEr3TbyfmCgULeIZ9iHXK4M4gaqkMgn/Ttnwe04a/FJ
 E3XMo6s3ATM1OFJFqcnqZ2gPJ4xWWp8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-VJsmv3yaPBa6xgrCmv3E9A-1; Wed, 03 Mar 2021 13:24:03 -0500
X-MC-Unique: VJsmv3yaPBa6xgrCmv3E9A-1
Received: by mail-wr1-f69.google.com with SMTP id h30so13183252wrh.10
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 10:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4K8ZUs7Kh4DBTFlI/pvongtlyoWjFjhXN1UWmJlGpA=;
 b=cchYf5t81RSsOoCQlMJKW6hZjr9JxUItb2Hie5fwl+7di2eQS1WArIggMNHtK/r1RB
 kiajesjix8P+hryIUXfMzUPbWoWG0n74bmS3JR7zgUCgmx4tZr+CwvSLSKBR7QYeoCZV
 L0REOwU3VwdmLnfK9iUSMTANBYLSuDegyOkRERWtx7df5OWk+ikTJufy/K7OOkJ9SkN0
 scMWwvoIQyS5WRfRfJKbb2UR6D8bfyatCvodhi0WXAb1JWvWKHf2eEIbenkOZNqDt6WY
 kzJ7R8zzNN6Z4rV76ot9pnU3jtR9PnqLeI09GFPsgobO6KkzVcgicAn1UI+reCFYCtw1
 3WGg==
X-Gm-Message-State: AOAM5317tO1JpidxpYHdS3oZ/dwEXMnTy3oLWE95KdrNu4lhcXQJrx2r
 HhPXK+fqUJrRwf8rDcgX5rLdhsjuVwaqCt8/rxZBb5BJgxfB7NCMpntWaZAzCPiH7195Pn0Ilzt
 ruAI4XWAcMhzc
X-Received: by 2002:a1c:2049:: with SMTP id g70mr261159wmg.7.1614795841801;
 Wed, 03 Mar 2021 10:24:01 -0800 (PST)
X-Received: by 2002:a1c:2049:: with SMTP id g70mr261066wmg.7.1614795840433;
 Wed, 03 Mar 2021 10:24:00 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t14sm34525941wru.64.2021.03.03.10.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:24:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 15/19] accel/kvm: Move the 'kvm_state' field to
 AccelvCPUState
Date: Wed,  3 Mar 2021 19:22:15 +0100
Message-Id: <20210303182219.1631042-16-philmd@redhat.com>
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
X-TUID: dFseehihHvgT

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/core/cpu.h    | 1 -
 include/sysemu/kvm_int.h | 1 +
 accel/kvm/kvm-all.c      | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index ca2526e6a23..4f280509f9b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -415,7 +415,6 @@ struct CPUState {
 
     /* Accelerator-specific fields. */
     struct AccelvCPUState *accel_vcpu;
-    struct KVMState *kvm_state;
     struct kvm_run *kvm_run;
     int hvf_fd;
     /* shared by kvm, hax and hvf */
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 3bf75e62293..dc45b3c3afa 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -18,6 +18,7 @@ struct AccelvCPUState {
      * @kvm_fd: vCPU file descriptor for KVM
      */
     int kvm_fd;
+    struct KVMState *kvm_state;
 };
 
 typedef struct KVMSlot
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 1c08ff3fbe0..737db3d3e0e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -437,7 +437,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
 
     cpu->accel_vcpu = g_new(struct AccelvCPUState, 1);
     cpu->accel_vcpu->kvm_fd = ret;
-    cpu->kvm_state = s;
+    cpu->accel_vcpu->kvm_state = s;
     cpu->vcpu_dirty = true;
 
     mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
@@ -1985,7 +1985,7 @@ bool kvm_vcpu_id_is_valid(int vcpu_id)
 
 KVMState *kvm_vcpu_state(CPUState *cpu)
 {
-    return cpu->kvm_state;
+    return cpu->accel_vcpu->kvm_state;
 }
 
 static int kvm_init(MachineState *ms)
-- 
2.26.2

