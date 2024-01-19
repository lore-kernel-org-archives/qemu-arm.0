Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp937524ejg;
        Fri, 19 Jan 2024 05:24:57 -0800 (PST)
X-Received: by 2002:a50:f688:0:b0:55a:602f:f5f1 with SMTP id d8-20020a50f688000000b0055a602ff5f1mr539165edn.40.1705670697419;
        Fri, 19 Jan 2024 05:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705670697; cv=none;
        d=google.com; s=arc-20160816;
        b=QLix1Tb4UcMkDU7rf/vWO9K5MaEZ/oZ2pFlICGOyZF2DV8z+py80sGeKLAZLUWUGN5
         r/JFAsf3NU0ZxvUseob/tit8ldrE3ynbfbTCQZGPA2KCSAo0WC2rHggQiMsMKIlUWAsj
         1C5McMfKEc5VQVwu+sTZWkOA3L6Y7XMH7iORcYXXwUtFY4kNBzDe0+LJj1L8V64Uv/dV
         MwibhV9tXGU/AMmiEBNSaCFCtUfCx1pg7KYatkhxaTPz8k/XjowSV8gZMkJrK1HcUDX0
         4mkEzUWuuUjhkQ2YxXyK2RiRN7H62FUZvg5QzMx3AKbCVdGag56ecHyHP86+Nreo0QQ3
         jr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KXo1YLt845Pt2zK9FJiS5jPZDy9N656n9fSj/iWqSqs=;
        fh=lJw5UzM6ifQszfT4HEcQjHZ3kAdCqWnl2xV8CLz9k2o=;
        b=KKVxEgiZm8szOuWdHXcS1+RDNrp5LiYdQJo0lrD9b58sBIYkHI2B/DQBx4p432GJa6
         r8hCtuwkBCcfAOgkpcJ5DqPKKfXk7gl+r+q9C8I67idEYq3JckPlOL1lp/Ac3IOlfPHs
         7KkbrXucUpj7QzJEOo/ZhEY+p4Ud+cQoPkBja3x4m37Yc5HD5DpJ75cvgJCI1x2I0N5n
         sd7w7GMZZyu7XRkOrP7ciNYMcwXmRSA/sSncrC5qdnZUjL2mjSVanqZHS/8urFcdmGhl
         B9M5/MSbp82jmzGG7u5w8+5ZHqNdGzx9Z0R5HcZkQJSDC2OXnZplYhzl6lfyLUBVTJze
         D4dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMug0OJ3;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q2-20020a056402032200b00559fce8eccdsor384828edw.7.2024.01.19.05.24.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 05:24:57 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMug0OJ3;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705670697; x=1706275497; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXo1YLt845Pt2zK9FJiS5jPZDy9N656n9fSj/iWqSqs=;
        b=XMug0OJ32bQpOWNi5MPqynFs8Lj2veJef2REklno+moobYTgXt4MwQ63WupKsker3m
         oCenHymxVW0ttVT7snk54En68KB4F3lyvYn4Cq1aFmV4ScLTxnfdk5fbTidNaUuSvmgw
         fJUGlqxLCsEEERLR5xOxoJ9NsSIrRYS6UkhrHkdlKAA8dVjUP4Div9FyCUpUIeXVb7i6
         QXwKPnzb7sSrAyYQ17eFyUkitywwPOqapogRFeKTLoy1+fdZWCwDdPhqSbG1P3ER9vmI
         AFeSA5e+iMZBg3BG4H6QOdYF/iNzsyadu7P2DlD2JGx4FXhyxr7rGC7i5cjhd7+ox8vf
         ihDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705670697; x=1706275497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXo1YLt845Pt2zK9FJiS5jPZDy9N656n9fSj/iWqSqs=;
        b=q0HKPlhf+Lmnh4Id61HEyX+8WDEY6GPoqSL26yJy3RSwQu7i2+HjLZCJ3wATjfKc+c
         hdGf4FLkKVDcWOW1S8i09lKhFidNEm5x7a0IuBMN65IZ2wTHst5WaeUBrAiWRcbc13BN
         IC2MbiuYYFy16l0uG9QThd54hl2wzm4Y4Z7Enin0mr8QLTIW5LoJdPqDRDTNEiwdqzvG
         T9UGHSFIHi1Q18Vw6rU7g4uonvA+et+/sytd87eSHce1ccQ+6OxbW7aYd2wdQmnscsZ0
         hioBZ6pLX4Ni4b0RzB/tTXGcnE36Fy5Tjdog165w7F+PDZSZeQejv45LilOWmI6u7uoo
         tR+A==
X-Gm-Message-State: AOJu0Yyv6GOt+CUqb3J2SWHHQltY97B3SfDmswEDW+SD15j4HSAyVYPU
	GicEtccczkwSGZoJgQm+6Tcx6pXFSNREs093ynJ9k3SvIMe+25oNEG2u15DiYOO48w==
X-Google-Smtp-Source: AGHT+IFTVbdPtqN7cjbpfHaxqzZHMxlRVkhGFF5UfzIzuqlBikjo68VvlfFRSXx9twRMCr+ktIJFhw==
X-Received: by 2002:a50:a41a:0:b0:559:2e6:bb18 with SMTP id u26-20020a50a41a000000b0055902e6bb18mr1729994edb.62.1705670697158;
        Fri, 19 Jan 2024 05:24:57 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-138.37.6.1.tellas.gr. [37.6.1.138])
        by smtp.gmail.com with ESMTPSA id b11-20020aa7dc0b000000b00558fc426affsm8568310edu.88.2024.01.19.05.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:24:56 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 4/5] hw/xen/xen-hvm-common.c: convert DPRINTF to tracepoints
Date: Fri, 19 Jan 2024 15:24:46 +0200
Message-Id: <651ad62da159524e33edb5741fff4030797c864d.1705670342.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
References: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: H+o+UUg1/Sxm

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
