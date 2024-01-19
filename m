Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp868833ejg;
        Fri, 19 Jan 2024 03:14:34 -0800 (PST)
X-Received: by 2002:a17:907:9487:b0:a27:37b8:2809 with SMTP id dm7-20020a170907948700b00a2737b82809mr1830020ejc.8.1705662874309;
        Fri, 19 Jan 2024 03:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705662874; cv=none;
        d=google.com; s=arc-20160816;
        b=uwCBB8X0/KpgBJUUwaOBtrN40lE3uQ7YjKF0Y7O6YYKA22TP1lmBDTL1jHlongOC0m
         lieTlbal7zSWLJqq/ctlgOwoliEu9MnMTNe9oX+XDfuBN2QtpKb0jvhMJBrCS5Wdo5m5
         AR1xXYGd3gflxAFWIKbVJbTsJFKLt3FyqAjwasRe+gpUTTZLd/pGX3wgDtf3lCahWMQO
         pbLaeJ+t98fSWqU5K/GIdh2gH1WFHeAgx0VeMDOlWisDkn0v8Uo8dPODboaIK58ROslT
         L4y2vAJA3I/cOU0yJtYrAcvayNSGbvvuiJrdMsFS/Ltio8KBqY5AHzgMogmXTrfpxypo
         lPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KXo1YLt845Pt2zK9FJiS5jPZDy9N656n9fSj/iWqSqs=;
        fh=2YMDnQ3SxoZ0TW62CmU2DrPnMMetFtoAQMKRN2o0WyY=;
        b=RCpnYGomfNuNW2pVY3H7Hy9ggP9/r3VtBO0b++thd66qpWqlxhHO9e79paSmci2zv6
         edM+m28DdfZQadTkUxUW1SvCcrBdxWEcfXaF7tzp1hwKyJsCTrzLZX3d+Zcrk0ChGPW9
         bduhZt+pmu+63E0rvIH5Xf5bfRGKzKkH+QMPLNwpz7MfjBNdARA17ThQxedaAkH4NLXk
         REFpHnTDfYUXJ10rdM8f2eXS6DXKn6op3M2LvUGXJzny843Stuow3LV57jGNRNBXksEV
         aTsZBim7jmld+/gQqD6irHFqsiycOlmVCpOZT14Mn7vLtaOmXds+A2umdhqLqUxJ6j6i
         Jn8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rRTvhJ4Z;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n23-20020a170906379700b00a2f7216b550sor350252ejc.1.2024.01.19.03.14.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 03:14:34 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rRTvhJ4Z;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662874; x=1706267674; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXo1YLt845Pt2zK9FJiS5jPZDy9N656n9fSj/iWqSqs=;
        b=rRTvhJ4Z1elObERB3Ve8K3vz7XqLQI4h4jK5uFm8AOnY4tSdqf5XVh2uv4okHprSl/
         UL3wbY5CBmP/THExFq8RSTsXdfrgyH+5t0gO7clP5wv345Unt37NRJeE8QhR/Wyf3iYL
         6UPNVu4uZtWXap0IeArOOgKuH1FTvH2DEjGEM1Py66wzOh37WYQyc5p6z+LQDpMtpUhx
         MQAz3prrA4WEXSxJGQkFFbT1LX7MY1GAMutu9j68sGN1aPltzjgOPV8G8qOMAlTafZSS
         OHZ597zi4sWzN1vkKlp47ezodSLbmY/fjoP9tKZzIwHuV/ogepjPSusnWDmgbjcBAP5u
         STfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662874; x=1706267674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXo1YLt845Pt2zK9FJiS5jPZDy9N656n9fSj/iWqSqs=;
        b=ugxP3jssrJMG04vM0rxUmjPgVsQ7rhwwp2FK0RAWDobYugGEvqvndMVjE2UueENGPN
         wfOzhRp+xs1UcFaW3zYBbrRr4PfokTOq5ne8uw/ZWo8WbC2bI+/0t1Bw5NBHN+LHNe4Y
         OF6mZvq8t8Oy1xuvHYrxz6lHvw669JXHF9ptv0LQVr6ySDlLb3EBg+syXByfo0R7iGT2
         v4htxrbkLVUxii26hYtZ+FrmLv6wuV9y9jlUnBjEXvPAe53K6vfa+AWWwCijnkSQKh3K
         N6M+rmbi70cOliK+yv0+N95FxblolAPED2HlerQSUHUDTJV7p6hbtQnStiXfYzysb+3J
         5PWg==
X-Gm-Message-State: AOJu0YxgniIO3PrvA/kAry+fWpAcvJZoVjGRG5fgdit8/chhtxm6utEi
	Zi6bxhsVlBmbpLZucPZ3B8UZbG2ij0eEl9OCGBKPJrVif6Aq1T13Iq906TrVAhTGEA==
X-Google-Smtp-Source: AGHT+IEznSjLNMGlwr+n5quX1ep6ZKbJviBM6ONBmekQp5grAezV23Bo31idmqA5vcPLRjRQH2xw9w==
X-Received: by 2002:a17:906:3b0f:b0:a28:abb3:dd74 with SMTP id g15-20020a1709063b0f00b00a28abb3dd74mr1321523ejf.81.1705662874037;
        Fri, 19 Jan 2024 03:14:34 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-114.109.242.227.tellas.gr. [109.242.227.114])
        by smtp.gmail.com with ESMTPSA id vq9-20020a170907a4c900b00a2ca97242d5sm9283321ejc.120.2024.01.19.03.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:14:33 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 5/6] hw/xen/xen-hvm-common.c: convert DPRINTF to tracepoints
Date: Fri, 19 Jan 2024 13:14:23 +0200
Message-Id: <d1f96a077bce8219dbf480c861eb91502208571c.1705662313.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
References: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: 92GnIoCxrbFT

Tracing DPRINTFs to stderr might not be desired. A developer that relies
on tracepoints should be able to opt-in to each tracepoint and rely on
QEMU's log redirection, instead of stderr by default.

This commit converts DPRINTFs in this file that are used for tracing
into tracepoints.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/xen/trace-events     | 10 +++++++++-
 hw/xen/xen-hvm-common.c | 35 ++++++++++++++++++-----------------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 1b748dba09..dd5b5a7f35 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -42,7 +42,7 @@ xs_node_vscanf(char *path, char *value) "%s %s"
 xs_node_watch(char *path) "%s"
 xs_node_unwatch(char *path) "%s"
 
-# xen-hvm.c
+# xen-hvm-common.c
 xen_ram_alloc(unsigned long ram_addr, unsigned long size) "requested: 0x%lx, size 0x%lx"
 xen_client_set_memory(uint64_t start_addr, unsigned long size, bool log_dirty) "0x%"PRIx64" size 0x%lx, log_dirty %i"
 handle_ioreq(void *req, uint32_t type, uint32_t dir, uint32_t df, uint32_t data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O=%p type=%d dir=%d df=%d ptr=%d port=0x%"PRIx64" data=0x%"PRIx64" count=%d size=%d"
@@ -55,6 +55,14 @@ cpu_ioreq_move(void *req, uint32_t dir, uint32_t df, uint32_t data_is_ptr, uint6
 xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
 cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
+cpu_get_ioreq_from_shared_memory_req_not_ready(int state, int data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O request not ready: 0x%x, ptr: 0x%x, port: 0x%"PRIx64", data: 0x%"PRIx64", count: %u, size: %u"
+xen_main_loop_prepare_init_cpu(int id, void *cpu) "cpu_by_vcpu_id[%d]=%p"
+xen_map_ioreq_server_shared_page(long unsigned int ioreq_pfn) "shared page at pfn 0x%lx"
+xen_map_ioreq_server_buffered_io_page(long unsigned int ioreq_pfn) "buffered io page at pfn 0x%lx"
+xen_map_ioreq_server_buffered_io_evtchn(int bufioreq_evtchn) "buffered io evtchn is 0x%x"
+destroy_hvm_domain_cannot_acquire_handle(void) "Cannot acquire xenctrl handle"
+destroy_hvm_domain_failed_action(const char *action, int sts, char *errno_s) "xc_domain_shutdown failed to issue %s, sts %d, %s"
+destroy_hvm_domain_action(int xen_domid, const char *action) "Issued domain %d %s"
 
 # xen-mapcache.c
 xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 47e6cb1db3..05a29c6f11 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -169,11 +169,12 @@ static ioreq_t *cpu_get_ioreq_from_shared_memory(XenIOState *state, int vcpu)
     ioreq_t *req = xen_vcpu_ioreq(state->shared_page, vcpu);
 
     if (req->state != STATE_IOREQ_READY) {
-        DPRINTF("I/O request not ready: "
-                "%x, ptr: %x, port: %"PRIx64", "
-                "data: %"PRIx64", count: %u, size: %u\n",
-                req->state, req->data_is_ptr, req->addr,
-                req->data, req->count, req->size);
+        trace_cpu_get_ioreq_from_shared_memory_req_not_ready(req->state,
+                                                             req->data_is_ptr,
+                                                             req->addr,
+                                                             req->data,
+                                                             req->count,
+                                                             req->size);
         return NULL;
     }
 
@@ -601,10 +602,9 @@ static void xen_main_loop_prepare(XenIOState *state)
     if (evtchn_fd != -1) {
         CPUState *cpu_state;
 
-        DPRINTF("%s: Init cpu_by_vcpu_id\n", __func__);
         CPU_FOREACH(cpu_state) {
-            DPRINTF("%s: cpu_by_vcpu_id[%d]=%p\n",
-                    __func__, cpu_state->cpu_index, cpu_state);
+            trace_xen_main_loop_prepare_init_cpu(cpu_state->cpu_index,
+                                                 cpu_state);
             state->cpu_by_vcpu_id[cpu_state->cpu_index] = cpu_state;
         }
         qemu_set_fd_handler(evtchn_fd, cpu_handle_ioreq, NULL, state);
@@ -681,7 +681,7 @@ static int xen_map_ioreq_server(XenIOState *state)
     }
 
     if (state->shared_page == NULL) {
-        DPRINTF("shared page at pfn %lx\n", ioreq_pfn);
+        trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
 
         state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
                                                   PROT_READ | PROT_WRITE,
@@ -693,7 +693,7 @@ static int xen_map_ioreq_server(XenIOState *state)
     }
 
     if (state->buffered_io_page == NULL) {
-        DPRINTF("buffered io page at pfn %lx\n", bufioreq_pfn);
+        trace_xen_map_ioreq_server_buffered_io_page(bufioreq_pfn);
 
         state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
                                                        PROT_READ | PROT_WRITE,
@@ -709,7 +709,7 @@ static int xen_map_ioreq_server(XenIOState *state)
         return -1;
     }
 
-    DPRINTF("buffered io evtchn is %x\n", bufioreq_evtchn);
+    trace_xen_map_ioreq_server_buffered_io_evtchn(bufioreq_evtchn);
 
     state->bufioreq_remote_port = bufioreq_evtchn;
 
@@ -737,16 +737,17 @@ void destroy_hvm_domain(bool reboot)
 
     xc_handle = xc_interface_open(0, 0, 0);
     if (xc_handle == NULL) {
-        fprintf(stderr, "Cannot acquire xenctrl handle\n");
+        trace_destroy_hvm_domain_cannot_acquire_handle();
     } else {
         sts = xc_domain_shutdown(xc_handle, xen_domid, reason);
         if (sts != 0) {
-            fprintf(stderr, "xc_domain_shutdown failed to issue %s, "
-                    "sts %d, %s\n", reboot ? "reboot" : "poweroff",
-                    sts, strerror(errno));
+            trace_destroy_hvm_domain_failed_action(
+                reboot ? "reboot" : "poweroff", sts, strerror(errno)
+            );
         } else {
-            fprintf(stderr, "Issued domain %d %s\n", xen_domid,
-                    reboot ? "reboot" : "poweroff");
+            trace_destroy_hvm_domain_action(
+                xen_domid, reboot ? "reboot" : "poweroff"
+            );
         }
         xc_interface_close(xc_handle);
     }
-- 
γαῖα πυρί μιχθήτω
