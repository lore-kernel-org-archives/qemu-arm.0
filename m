Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5583035lfg;
        Wed, 3 Mar 2021 10:31:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHS8Q+q9ho8ewexhjD75DQFJMw00GGIrXTbc5A0sVyfgzO9f2jv9agFH0Y2+uqlZxx/ils
X-Received: by 2002:a05:6602:2e93:: with SMTP id m19mr434552iow.122.1614796286704;
        Wed, 03 Mar 2021 10:31:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614796286; cv=none;
        d=google.com; s=arc-20160816;
        b=PQ+eHWXNpk2EFzHgzrPu9J+Ljz5pWZ1ivO6u9QX0wNMlP/O8Slzrti19WAun5OvQ6l
         6//drUexJY+vSFphJEDbby53TD7nzkPeXksyMh2k2W1jAsVObCJzXirP/htgQ4L8+7K/
         RBcIXyqHBmSWVE2QDzVwWLQl+v8ZXDbgi6+Q9UiJ5Ls+2p2SlnB8b6NiMfBgq0NokllV
         cM2vD3C/2UYXLptKEtzm/pERzTrbibjfmlqIGO2CdvWw7yaPCbCv87TLeuID5jLKV8jr
         enMCISKa5MXWN4KBEeJHsbbz4ZGabckGqRUZ1pjkdzR/dbeIUzImO7Qk7dB3AZ0/kmGP
         eVkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QekL+lZ5BnBNsP996/ujwa8S4r0MydEApZGppEXSzVI=;
        b=Ai1+POeIisIepmeijOMTCBAYi8Dl2MDiqH9h36eIqbgfDmiOQ7kJ7dBa2ejDPjXIXM
         I5JWBbzZHWW43DwSF4yJOTzX0vWq19+JXbBo3vBoXMh1yVF2NdVmPsDwhUewifVP8sIR
         NNByGp0ydk02etWxlDf+uuqemANGfxdj3VhsjO/TmF5bW+ghHJVyZ0Vhpm04CrHb2zkp
         T9OHuzhZz404jHq72Oz5RKZIf+fVX3LAA5X3nVZ25OocyR68wwZluQWY3CaLdBTUKBmQ
         q8CKu7q2/o4tRm0ONV8JOxMHcn7De7RGgE9hpSl/4uvrndU/oDnzSccZvSvbIUy6os5h
         +wvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ipXmRkFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a27si2180025jab.1.2021.03.03.10.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:31:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ipXmRkFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWHN-0001CR-TS
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9s-0006dC-Kc
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:23:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9r-0000lz-1r
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QekL+lZ5BnBNsP996/ujwa8S4r0MydEApZGppEXSzVI=;
 b=ipXmRkFPFH1lEBooeVIEz0/Pv+DEXb3HkxMW2FCTF3vOWZb0Z0zdk3j9EQDw2deK/FeAGq
 pCCTYb1UV8TIsRrbimrK73KLJnR76MMSwb//RuA8MO20tkwJo3k7/0EV1QkTXoTzRB16FX
 GmQF+Ns1/0yDufEQuzXmVtwDAQwFIeo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-EoKLDVjKMsyRlkiKpXe0KA-1; Wed, 03 Mar 2021 13:23:34 -0500
X-MC-Unique: EoKLDVjKMsyRlkiKpXe0KA-1
Received: by mail-wm1-f69.google.com with SMTP id j8so2169876wmq.6
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 10:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QekL+lZ5BnBNsP996/ujwa8S4r0MydEApZGppEXSzVI=;
 b=RfCIiyghP5M/gMOTQPRrNiRfdSubGPCsK9FyZ+Y2pvl9DKB20PUrnKX1I57vViKVqf
 O/VhV5l5xcQLAMULC9iPIGvx1piDStii4m7DLoRN19AEOsG2qG7i6Q1JE0vbIJcP3A1Y
 5AUp5XRAB3yjma6Otadl0H0HkKrrGU8M/gSeE8sdPWxfm4ZO+rMnvc9MP4kCGlK4v3OV
 sR6BoQQLKc19djAnFgH4xx49ed15TNcC3eLGvec6W6XDXCIAze2wivNRsNKPURKQaaSe
 73RWtvzQJjMR8nb5E5Wir/p+7TXjwNiKWzyHgYzYEbq7kxJRfe6FZEXp2VZBjmLaaqHx
 Fp1Q==
X-Gm-Message-State: AOAM533cTyTwhrigO2vQnspAWxWJp74AeyIBU5HJR4PaRua8dtY+XpoV
 Jj7g1jchkB6LnPTYdstNBIm0iojj55b2Bx/yCpatNe4jJKQp+7jmmxnUY9f/8GCNBKyx0rB3JwL
 Cr8ZjbMk5G6Vu
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr24165wrx.166.1614795813577; 
 Wed, 03 Mar 2021 10:23:33 -0800 (PST)
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr24137wrx.166.1614795813286; 
 Wed, 03 Mar 2021 10:23:33 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 1sm6435516wmj.2.2021.03.03.10.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:23:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/19] accel/hax: Use 'accel_vcpu' generic pointer
Date: Wed,  3 Mar 2021 19:22:10 +0100
Message-Id: <20210303182219.1631042-11-philmd@redhat.com>
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
X-TUID: JJTfutU3e1BQ

Use the 'accel_vcpu' field which is meant for accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/core/cpu.h      |  3 ---
 target/i386/hax/hax-i386.h |  4 ++--
 target/i386/hax/hax-all.c  | 14 +++++++-------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d807645af2b..65ff8d86dbc 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -244,8 +244,6 @@ typedef struct SavedIOTLB {
 struct KVMState;
 struct kvm_run;
 
-struct hax_vcpu_state;
-
 #define TB_JMP_CACHE_BITS 12
 #define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
 
@@ -421,7 +419,6 @@ struct CPUState {
     int kvm_fd;
     struct KVMState *kvm_state;
     struct kvm_run *kvm_run;
-    struct hax_vcpu_state *hax_vcpu;
     int hvf_fd;
     /* shared by kvm, hax and hvf */
     bool vcpu_dirty;
diff --git a/target/i386/hax/hax-i386.h b/target/i386/hax/hax-i386.h
index ee77406a6a6..61ff0d84f2b 100644
--- a/target/i386/hax/hax-i386.h
+++ b/target/i386/hax/hax-i386.h
@@ -26,8 +26,8 @@ typedef HANDLE hax_fd;
 
 extern struct hax_state hax_global;
 
-typedef struct hax_vcpu_state hax_vcpu_state;
-struct hax_vcpu_state {
+typedef struct AccelvCPUState hax_vcpu_state;
+struct AccelvCPUState {
     hax_fd fd;
     int vcpu_id;
     struct hax_tunnel *tunnel;
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index 08c2b60b437..ce671760e64 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -68,7 +68,7 @@ int valid_hax_tunnel_size(uint16_t size)
 
 hax_fd hax_vcpu_get_fd(CPUArchState *env)
 {
-    hax_vcpu_state *vcpu = env_cpu(env)->hax_vcpu;
+    hax_vcpu_state *vcpu = env_cpu(env)->accel_vcpu;
     if (!vcpu) {
         return HAX_INVALID_FD;
     }
@@ -194,7 +194,7 @@ int hax_vcpu_create(int id)
 
 int hax_vcpu_destroy(CPUState *cpu)
 {
-    hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    hax_vcpu_state *vcpu = cpu->accel_vcpu;
 
     if (!hax_global.vm) {
         fprintf(stderr, "vcpu %x destroy failed, vm is null\n", vcpu->vcpu_id);
@@ -414,7 +414,7 @@ static int hax_handle_io(CPUArchState *env, uint32_t df, uint16_t port,
 static int hax_vcpu_interrupt(CPUArchState *env)
 {
     CPUState *cpu = env_cpu(env);
-    hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    hax_vcpu_state *vcpu = cpu->accel_vcpu;
     struct hax_tunnel *ht = vcpu->tunnel;
 
     /*
@@ -446,7 +446,7 @@ static int hax_vcpu_interrupt(CPUArchState *env)
 
 void hax_raise_event(CPUState *cpu)
 {
-    hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    hax_vcpu_state *vcpu = cpu->accel_vcpu;
 
     if (!vcpu) {
         return;
@@ -467,7 +467,7 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
     int ret = 0;
     CPUState *cpu = env_cpu(env);
     X86CPU *x86_cpu = X86_CPU(cpu);
-    hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    hax_vcpu_state *vcpu = cpu->accel_vcpu;
     struct hax_tunnel *ht = vcpu->tunnel;
 
     if (!hax_enabled()) {
@@ -1113,8 +1113,8 @@ void hax_reset_vcpu_state(void *opaque)
 {
     CPUState *cpu;
     for (cpu = first_cpu; cpu != NULL; cpu = CPU_NEXT(cpu)) {
-        cpu->hax_vcpu->tunnel->user_event_pending = 0;
-        cpu->hax_vcpu->tunnel->ready_for_interrupt_injection = 0;
+        cpu->accel_vcpu->tunnel->user_event_pending = 0;
+        cpu->accel_vcpu->tunnel->ready_for_interrupt_injection = 0;
     }
 }
 
-- 
2.26.2

