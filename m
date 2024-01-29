Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp277136ejk;
        Mon, 29 Jan 2024 08:11:02 -0800 (PST)
X-Received: by 2002:a5d:4f8c:0:b0:33a:f6ab:7854 with SMTP id d12-20020a5d4f8c000000b0033af6ab7854mr94715wru.37.1706544662530;
        Mon, 29 Jan 2024 08:11:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706544662; cv=none;
        d=google.com; s=arc-20160816;
        b=fHuvPUJy47LIbngRsdZ6w7W1h4kwi5Q/bzs9q8v/UBp+nKbuT3DLwA3HWVD0G8CTOl
         5hxV3MIcrLMy08NzGtsnBQ9H3ss1KlkfFC8CIV6YoMAXbGLTsBVhuLqjVn7r4vMnD8i5
         /JKrOXXrtcxzeJuedSN4GzNknuGLsrIgfQ0hzTzBrmEN7w1oQ1KI1jZ6JNbr6QrIzrlE
         jCZ5BFTp0MbZISsFcWy6S4VZHs6Oqgnp1lEkRk1pfPQakfpEim+MxocT4IH/rVgz9fp7
         rGkwkpZI9ynX1TLGuiujDLZMQIb2Le5AKEE/IwhWQ3xK9xzfzajgWEERbWhPkCYMlWdX
         ikpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=twCbSHojWsbr5gv/7yE94TkwwcJ8Z3GKHFCgEYch/Mg=;
        fh=Xb4KIKmbdaaiPlPH1bCESW8KkxUeVgZklsOwpxb0HGc=;
        b=yNVRdj3KUmJann+SRAPLlAmNFEGXUF22cayphHr1L7U+yBXm+E960nIuDzQCjwEBe5
         VkcZkCa8Z5XUZeRjYN2Fnskr3QjiVgkG3hCscaZuqU0UrjzSpnc9F+oAhoXEVLRujlEJ
         enDRxtb+sde2vTbVs6j5MXq/U/WSiukqB8R5Yp9sjwn73axpDzOA8F//OzbBRpi69VWj
         0fQUlvF65VT/jtcETtx6WupQLHBebgGnwkAtkW81YYRLb0P3s65ne7+K4BaO6zDLrmtg
         BVDXOBSVd7ylr/vayHMnvzAeSmnbvbqTtXhl8J9ILbBOL+7+McK2hZgYZqgD+ePvr/9i
         AoNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IsXWRf10;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r25-20020adfb1d9000000b00339274351dasor2584680wra.2.2024.01.29.08.11.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jan 2024 08:11:02 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IsXWRf10;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706544662; x=1707149462; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twCbSHojWsbr5gv/7yE94TkwwcJ8Z3GKHFCgEYch/Mg=;
        b=IsXWRf10lfwplpKsA2Ll+T9Lzv2/Smje/B/4/P4AXBAO/h8t0WjxXSLeWdl3Gsaa1l
         vqUx2SqDBfADZTM4X0BL465kLiHpsMETb370DyXfrswVvNHmr8HdYL8AyyMd2ySUdupW
         V0I291YkRbDJri3MFUeGf6Y9HDKvqQTeRfhnwnOkZtO1gIkd3FPva/RgIr4/qPlP/Jk1
         zC3T2h0HDMCU+OXThoZ7ieGH2Uvg7/kijhfnsH6/56QpYoxjVAt0spj5InAnfTDqJip2
         zPVHThRw7WVdVf/OJ7xsLnm+p2O0/SPbNL1pFjEwALGOujCd3w+gnncGQi2910uJpLkl
         7oOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706544662; x=1707149462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twCbSHojWsbr5gv/7yE94TkwwcJ8Z3GKHFCgEYch/Mg=;
        b=o7VGEhtKZA+/18/H6WeiyyXRnKKT762eYnghAZ2OudByCmdvvg674GnjNg0d8tBrDb
         xBJocRtxhbSxpfXUqg2bpOHuqXYKEJMCbCHvYLUJcH0fFEodOUk8DJP4btmfpQ1SJck0
         LlnmhqtOgDrNAvZVfEjHib/ZKMQYfurG9rwUE6YCz440liCGBqtCt0FzxFrm/mj5/kEY
         UIS9P85RKp4MF/PzIzKgvcW6NcNvhQS3ns2+3xNcf9SlBlxDq925KwrOYtWKFWDq+HGf
         +dPs1rZECixKF6N5HiaFN9a/zoUnmhRssr9+Em7tyxz4iB9JjOjMwElmnBBzTwRmXgpA
         cPpQ==
X-Gm-Message-State: AOJu0YyOEhfzWMXTMLEHsdvlM8/PRjXQb3dqG5coDLv+OWNQlOioh0a7
	6uS8oN7pUBh0wrAlKDgdeVM3cTmJUm1Mxg0MhT8yFe3jD2/AJfmNvN1ULUzvvLqxLQ==
X-Google-Smtp-Source: AGHT+IFHfef60/eAVVHH0kuTs/lfrSLJKa6iuHY11S8YaJiIhT6WLh5nB2VDle+t9MxY8DzYa8+KtQ==
X-Received: by 2002:adf:e584:0:b0:337:c097:db9f with SMTP id l4-20020adfe584000000b00337c097db9fmr5003853wrm.17.1706544662220;
        Mon, 29 Jan 2024 08:11:02 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr. [37.6.163.245])
        by smtp.gmail.com with ESMTPSA id co6-20020a0560000a0600b0033af4df8e1esm1219957wrb.47.2024.01.29.08.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:11:01 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 5/6] hw/xen/xen-hvm-common.c: convert DPRINTF to tracepoints
Date: Mon, 29 Jan 2024 18:09:41 +0200
Message-Id: <b000ab73022dfeb7a7ab0ee8fd0f41fb208adaf0.1706544115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: avtSAhub1mQ8

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
index a65dc0e55f..d1b27f6c11 100644
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
