Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1360855ejb;
        Fri, 20 Oct 2023 09:37:57 -0700 (PDT)
X-Received: by 2002:a17:906:c109:b0:9c4:4b20:44a9 with SMTP id do9-20020a170906c10900b009c44b2044a9mr1849313ejc.65.1697819877322;
        Fri, 20 Oct 2023 09:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819877; cv=none;
        d=google.com; s=arc-20160816;
        b=n/j8OofcsiEGE2qyBBYlcXIxFvgyKo5lCwSxg1smHNyZH0YqA5ku6hxRHnkmCOOZGe
         aABWIsiz/Yidp8C5GjWq8z/eRbvAkbBX3RQo5cn9q6cdqH5SKiFhzDC8qXHx408QlPs3
         ydr1a/0f1cZpU48N1Z3GmdwNER+UP9PrYGHzDzJUtV2eFQHQBxKQU0YZx3GvzRRbxsND
         6swfss1bmyM/e2+WBAuwCSLIVymWGrB9GkV0Mx+2S9/CkkI+sWEK2RJQf1YBQXfSqv5j
         l2hURjaiZZSNZdUNFLYzcB4LHKbc/F94gYbs6O6sJjMuIEI1aae6bSfMl4go39xou5Vb
         8crg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0QpJSioSzBNTf91irQMN8BpZyzwJ1kd2+nNN3fujF2w=;
        fh=G7el6kS6mgIkmN4TGMLCfgJ3jrtLeyv2+mgbrNuwVGE=;
        b=yeVeDJzTPHYgPVCF7vQWdHkx7IXFJ/LaHt1ACViJy2+iqn4n925wZzgDf8HrTYqsiR
         aAmOC0Z16km5qiolH3IgPN4z6W/9T7ybOYmyJ9x9Y0d4LH2TTRBJFfJW+x/6GjEYVDib
         QtS1GurcEWLoTWoi3N0K7lkKO7suyeDiE6/k5jpuooGNCTX41PZDyMJogkQYs/9iQsO7
         T/N7Vs5Xpytr5ILLiAtQuGYg2zR3suggsRzA85W0P8hHm1MucGdBgzjvrtj/dUkpV5gp
         tK0pJB9cHuG4Usx+JNSeVLELHizL3bEl7wwlZFWYUUszQCbDGFXu9BJB6VE4OOTi5x35
         SGYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrFqPzml;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gx18-20020a1709068a5200b009a1bcccef54sor705375ejc.12.2023.10.20.09.37.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:37:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrFqPzml;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819877; x=1698424677; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QpJSioSzBNTf91irQMN8BpZyzwJ1kd2+nNN3fujF2w=;
        b=SrFqPzml0uRLEJ+abtrODpGiVB7O/gQn0FczLQrXf+YzabFTYBxsyiiXkJWV3Wt/qP
         ieRoO2r7rnQ4Js/RfBIfE7Ks5t1IfebdgOTDyVt4sZtUemkC6/+5UdtwYgKN/pvNu902
         BpIo/zMopHc4VXL+t3EHL+xvChHrmOYGItfA4UaccfoYmzXdjBauwZQdoNz9o5V7B2kx
         I58viSgc2jfWNlTOv8MhgzJCNv03t+5MP65YN7rCNJy9UGkEAt8MLR8mvyfocnsvQ06/
         jD/cFZ2SsHGW4Ir5X4ykVyAO79leL33vu7Dh5rLxBwRn8xQv3RnyGFR4mb0YWWGa1zNf
         HFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819877; x=1698424677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QpJSioSzBNTf91irQMN8BpZyzwJ1kd2+nNN3fujF2w=;
        b=EftP4Zz1wDGtzrGwWiolEoTDhatKJtoQsxrlp3vFDpTNrlH00RivB4nPS09v0UaaDe
         3Q6f8jqAGtd8bjca31jXBErpJGe8nYb6OmxWsUHWgv1uxaBxYqrVV0J4nIToUHe5Bz/h
         IaLqO41ctS0YlO1ncW4LJDihhGiDAUyI1/i5m854CwvpV2mVSvQQwU9QJ04BJRLLzuxA
         hTqrUJM7oEiiOLzlzGkg8SohzAdJ8P+P/0mocq1clUsbGDhBcJAH0tTlYx3ZUzNNG+xI
         S3E+iyFnSqyORGEsDgVWSain9sLD4rUyq0IY4jnLFbP5t16Chjgyg+nSOEp0SmzVr86u
         QqEA==
X-Gm-Message-State: AOJu0YwRZdW3Ek0fDBTk3Jxm8iGJLAo6IX07/TIUxUC2ui2MJfyv4oeC
	yLLkOtHGghostwzi5XoFaUeZHwC7
X-Google-Smtp-Source: AGHT+IHqqcCwQhtVKj3SGAIse1HKAYov1qgaQecpg8n6CsqYo+8qJqXaoPpYybRA/SRbJ+rMfgxwJw==
X-Received: by 2002:a17:907:988:b0:9c5:2806:72e2 with SMTP id bf8-20020a170907098800b009c5280672e2mr1733573ejc.34.1697819877055;
        Fri, 20 Oct 2023 09:37:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id pw17-20020a17090720b100b009bd9ac83a9fsm1771713ejb.152.2023.10.20.09.37.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:37:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	kvm@vger.kernel.org
Subject: [PATCH 09/19] cpus: Filter for target specific CPU (x86)
Date: Fri, 20 Oct 2023 18:36:31 +0200
Message-ID: <20231020163643.86105-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uJE4HsKSrVhR

Enforce qemu_get_cpu() to return X86 CPUs in X86 specific files.

Mechanical change using the following coccinelle script:

  @@ expression index; @@
  -   qemu_get_cpu(index, NULL)
  +   qemu_get_cpu(index, TYPE_X86_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/hyperv/hyperv.c        |  2 +-
 hw/i386/kvm/xen_evtchn.c  |  8 ++++----
 target/i386/kvm/xen-emu.c | 14 +++++++-------
 target/i386/monitor.c     |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index a43f29ad8d..cdda93e14d 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -226,7 +226,7 @@ struct HvSintRoute {
 
 static CPUState *hyperv_find_vcpu(uint32_t vp_index)
 {
-    CPUState *cs = qemu_get_cpu(vp_index, NULL);
+    CPUState *cs = qemu_get_cpu(vp_index, TYPE_X86_CPU);
     assert(hyperv_vp_index(cs) == vp_index);
     return cs;
 }
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index de3650ba3b..d75b53934d 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -542,7 +542,7 @@ static void deassign_kernel_port(evtchn_port_t port)
 static int assign_kernel_port(uint16_t type, evtchn_port_t port,
                               uint32_t vcpu_id)
 {
-    CPUState *cpu = qemu_get_cpu(vcpu_id, NULL);
+    CPUState *cpu = qemu_get_cpu(vcpu_id, TYPE_X86_CPU);
     struct kvm_xen_hvm_attr ha;
 
     if (!cpu) {
@@ -589,7 +589,7 @@ static bool valid_port(evtchn_port_t port)
 
 static bool valid_vcpu(uint32_t vcpu)
 {
-    return !!qemu_get_cpu(vcpu, NULL);
+    return !!qemu_get_cpu(vcpu, TYPE_X86_CPU);
 }
 
 static void unbind_backend_ports(XenEvtchnState *s)
@@ -917,7 +917,7 @@ static int set_port_pending(XenEvtchnState *s, evtchn_port_t port)
 
     if (s->evtchn_in_kernel) {
         XenEvtchnPort *p = &s->port_table[port];
-        CPUState *cpu = qemu_get_cpu(p->vcpu, NULL);
+        CPUState *cpu = qemu_get_cpu(p->vcpu, TYPE_X86_CPU);
         struct kvm_irq_routing_xen_evtchn evt;
 
         if (!cpu) {
@@ -1779,7 +1779,7 @@ int xen_evtchn_translate_pirq_msi(struct kvm_irq_routing_entry *route,
         return -EINVAL;
     }
 
-    cpu = qemu_get_cpu(s->port_table[port].vcpu, NULL);
+    cpu = qemu_get_cpu(s->port_table[port].vcpu, TYPE_X86_CPU);
     if (!cpu) {
         return -EINVAL;
     }
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index f289af906c..0a973c0259 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -384,7 +384,7 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
 
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
 {
-    CPUState *cs = qemu_get_cpu(vcpu_id, NULL);
+    CPUState *cs = qemu_get_cpu(vcpu_id, TYPE_X86_CPU);
     if (!cs) {
         return NULL;
     }
@@ -418,7 +418,7 @@ void kvm_xen_maybe_deassert_callback(CPUState *cs)
 
 void kvm_xen_set_callback_asserted(void)
 {
-    CPUState *cs = qemu_get_cpu(0, NULL);
+    CPUState *cs = qemu_get_cpu(0, TYPE_X86_CPU);
 
     if (cs) {
         X86_CPU(cs)->env.xen_callback_asserted = true;
@@ -427,7 +427,7 @@ void kvm_xen_set_callback_asserted(void)
 
 void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type)
 {
-    CPUState *cs = qemu_get_cpu(vcpu_id, NULL);
+    CPUState *cs = qemu_get_cpu(vcpu_id, TYPE_X86_CPU);
     uint8_t vector;
 
     if (!cs) {
@@ -491,7 +491,7 @@ static void do_set_vcpu_timer_virq(CPUState *cs, run_on_cpu_data data)
 
 int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port)
 {
-    CPUState *cs = qemu_get_cpu(vcpu_id, NULL);
+    CPUState *cs = qemu_get_cpu(vcpu_id, TYPE_X86_CPU);
 
     if (!cs) {
         return -ENOENT;
@@ -588,7 +588,7 @@ static int xen_set_shared_info(uint64_t gfn)
     trace_kvm_xen_set_shared_info(gfn);
 
     for (i = 0; i < XEN_LEGACY_MAX_VCPUS; i++) {
-        CPUState *cpu = qemu_get_cpu(i, NULL);
+        CPUState *cpu = qemu_get_cpu(i, TYPE_X86_CPU);
         if (cpu) {
             async_run_on_cpu(cpu, do_set_vcpu_info_default_gpa,
                              RUN_ON_CPU_HOST_ULONG(gpa));
@@ -834,7 +834,7 @@ static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
         return -EINVAL;
     }
 
-    target_cs = qemu_get_cpu(up.vcpu, NULL);
+    target_cs = qemu_get_cpu(up.vcpu, TYPE_X86_CPU);
     if (!target_cs) {
         return -EINVAL;
     }
@@ -1161,7 +1161,7 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
 {
     CPUState *cs = CPU(cpu);
     CPUState *dest = cs->cpu_index == vcpu_id ? cs : qemu_get_cpu(vcpu_id,
-                                                                  NULL);
+                                                                  TYPE_X86_CPU);
     int err;
 
     if (!dest) {
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index aca7be61dd..01bfb4e3f1 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -592,7 +592,7 @@ void hmp_mce(Monitor *mon, const QDict *qdict)
     if (qdict_get_try_bool(qdict, "broadcast", false)) {
         flags |= MCE_INJECT_BROADCAST;
     }
-    cs = qemu_get_cpu(cpu_index, NULL);
+    cs = qemu_get_cpu(cpu_index, TYPE_X86_CPU);
     if (cs != NULL) {
         cpu = X86_CPU(cs);
         cpu_x86_inject_mce(mon, cpu, bank, status, mcg_status, addr, misc,
-- 
2.41.0
