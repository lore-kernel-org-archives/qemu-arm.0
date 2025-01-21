Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6578589njn;
        Tue, 21 Jan 2025 02:36:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWle9s6eD9WMFsmYetfdA/1TaiJm1y2R95Ymb9x8IHWkjDO+tAVfWTZBICXTlA0UrwuYdS0QOyzSj/TvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IErkJ+YCi9icq5l0AmSY3/218EJPdROn4BPaLJOKdDfp0IeoEzQ+LLhPbNamTxMeIh1IwHn
X-Received: by 2002:ad4:5c4b:0:b0:6d8:a7f7:c39d with SMTP id 6a1803df08f44-6e1b224bd4amr220764886d6.40.1737455805776;
        Tue, 21 Jan 2025 02:36:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737455805; cv=none;
        d=google.com; s=arc-20240605;
        b=OZY1Qq0DnhSbh4+61k8Z8Ck5iNbcWQAuH3hzMhdjrpTYBIInwmTUNPlRWRSxFsa/e2
         lI7aE1Bs027FH/N/iPn039OrIAjA+yu+yHBtlo0pmrmLhJVOCv4/8AZwkwZ5MNBkrf3k
         5SsptKhAg1mHGqz1ZeIq/ghfn6P8C3hpI3k+eRFFdjcwMvkcWmTPXtU9YZXNlmIooPWr
         t/Y3GXoLo9G4fRyr/BUCovfLWIUW7t3mr1t0cJW6o2VBYebnlxkPyqqZ/hoJL+XNHqrw
         W1U1i39W7/JJKGO5Rd8wn6+cmzwv4/9NC3DtAo9N1cXRHkZSNoWmhYBLI6xEBlqutq3e
         Pf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=OMbO0p1M9omrKU79xN5rgRVktWMV80RU838b/dw3Qzk=;
        fh=I0Pj3BiWaB3mwNoR/fziRavv0C2rZXFgrGYxL5T70LY=;
        b=bL2S4+GuTMfFi7iwqSLMig0HFW8lUlbWEPZJ7CD8H4LD7M7nHo3LMck6Ji6PbfczVs
         z0aV4R9nKnFYJ5w1VOr1GQLUeKczeJ7WCigGbZuY2gIBBHBYcdjmTvnSazlHdbg/5+Fm
         JFSUy4QLdN4bZ3Re82oeBrM/Ap3ZmUz9DOy/3FYkZ+lBxp1gca6Vz/62du4kV1xUj9jz
         jRUnQ6gSRJPBmKiynMZfOuybAWxc1yg+fcWBzIufw7UYgAjNJNPkq9F4mf8SoySLaEDE
         GElOxBCRc7lJNd33WOxI0aQoqpMZSRV+SlYpTaHTIdePkTa0j6Z4y6TZlp2WepIdzTai
         cUeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=t6cBxEzW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afd171f5si127489806d6.437.2025.01.21.02.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 02:36:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=t6cBxEzW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1taBcY-0000ef-7b; Tue, 21 Jan 2025 05:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3pHiPZwYKChcG5GHFE3BB381.zB9D19H-01I18ABA3AH.BE3@flex--titusr.bounces.google.com>)
 id 1taBcQ-0000cR-IW
 for qemu-devel@nongnu.org; Tue, 21 Jan 2025 05:36:26 -0500
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3pHiPZwYKChcG5GHFE3BB381.zB9D19H-01I18ABA3AH.BE3@flex--titusr.bounces.google.com>)
 id 1taBcN-0002Se-0h
 for qemu-devel@nongnu.org; Tue, 21 Jan 2025 05:36:25 -0500
Received: by mail-qt1-x84a.google.com with SMTP id
 d75a77b69052e-4679d6ef2f9so150374611cf.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2025 02:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1737455780; x=1738060580; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OMbO0p1M9omrKU79xN5rgRVktWMV80RU838b/dw3Qzk=;
 b=t6cBxEzWYic9Ji8Ja+QoC9qYDpEwStgbUE7Y1j32I8DWluTDMUIGOfDI1mrNVNXPY3
 vlP1JJTIKjtf79BzQBSHle1b5kgrpeCivWmn1sEtoqZIRmDnm4GH+8NXcljkNrN92Oxs
 BOo5TxzvQK1jOG/fgCYsPnM0gEhMXJ5EFIXKrLVVo79eBw+1KeAeEwJnolvuyQZnMlF5
 RMwj31DDuM0R+wTBSDFcg9y282JU+2tKWvUmRjq5Th+cdamMmVODC+5IUV+Yqhr94912
 7ubDnaYjaFpCIlZG197gfHNEUaa0ht2caoLc1ihuSvBQm3Scvsi6r24Oy2hfydnut9Qj
 XfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737455780; x=1738060580;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OMbO0p1M9omrKU79xN5rgRVktWMV80RU838b/dw3Qzk=;
 b=lnyeDnIFt35MmYA1OrLQY4j+TQjDYHWfr/Q8xaYBURReXabn1htmF1MRF56eB6gX1z
 0Kg6eDRfqgj8J15/jvSct2FMrkClvCgtolufFhNw6tbB045IU7yekUGwTRS27lL6HBDz
 yM0kAIQpNaey62P8i/bPJfxuLX0PxPCcHLpEDdFeYfsyQyv3dJG2bL5Vte1HtsJgcrIT
 R2hU1OXnPEC7n87119HY05WkN7LjO+qAGRU0AGGG0YKlBmyysxmlG03QJbEH2MnOj8LZ
 gygG4uTnY5pntRPmj+K2iVYap1OJXDsBzn/+C4afLgk7IlG7h1aoM1ZoIxTz67eq6fZD
 oW1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKIftzaCooNxxlntb/rY724jHTBq89VjDkoUEDuuuWa3Z1qq407HplKslnhT9V2t3Fz/KiTU/i2Ma4@nongnu.org
X-Gm-Message-State: AOJu0YwwD8pkaX5lf2HPMnGWGKWrl5ilkhHtqiLP5kifYn8YFdlOs681
 oljNCNBRR6GBZeVdEKyBtxZ0EpQ0ZMZhx3lckq9knB6bF/Vpq5N5XJHMz80gYWD2fcfciIBA7hc
 3vQ==
X-Received: from qthh13.prod.google.com ([2002:ac8:584d:0:b0:467:5057:4372])
 (user=titusr job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:24b:b0:46d:faa2:b6e0
 with SMTP id d75a77b69052e-46e12a6138emr274948591cf.18.1737455780235; Tue, 21
 Jan 2025 02:36:20 -0800 (PST)
Date: Tue, 21 Jan 2025 10:36:08 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250121103608.3056288-1-titusr@google.com>
Subject: [PATCH] hw/misc: i2c-echo: add tracing
From: Titus Rwantare <titusr@google.com>
To: minyard@acm.org, its@irrelevant.dk
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3pHiPZwYKChcG5GHFE3BB381.zB9D19H-01I18ABA3AH.BE3@flex--titusr.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T13Hb0/pgtGU

This has been useful when debugging when unsure if the guest is
generating i2c traffic.

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/misc/i2c-echo.c   | 13 +++++++++++++
 hw/misc/trace-events |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c
index 5ae3d0817e..06110e0f8e 100644
--- a/hw/misc/i2c-echo.c
+++ b/hw/misc/i2c-echo.c
@@ -13,6 +13,7 @@
 #include "qemu/main-loop.h"
 #include "block/aio.h"
 #include "hw/i2c/i2c.h"
+#include "trace.h"
 
 #define TYPE_I2C_ECHO "i2c-echo"
 OBJECT_DECLARE_SIMPLE_TYPE(I2CEchoState, I2C_ECHO)
@@ -80,11 +81,19 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_event event)
     case I2C_START_RECV:
         state->pos = 0;
 
+        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_RECV");
         break;
 
     case I2C_START_SEND:
         state->pos = 0;
 
+        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_SEND");
+        break;
+
+    case I2C_START_SEND_ASYNC:
+        state->pos = 0;
+
+        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_SEND_ASYNC");
         break;
 
     case I2C_FINISH:
@@ -92,9 +101,11 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_event event)
         state->state = I2C_ECHO_STATE_START_SEND;
         i2c_bus_master(state->bus, state->bh);
 
+        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_FINISH");
         break;
 
     case I2C_NACK:
+        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_NACK");
         break;
 
     default:
@@ -112,6 +123,7 @@ static uint8_t i2c_echo_recv(I2CSlave *s)
         return 0xff;
     }
 
+    trace_i2c_echo_recv(DEVICE(s)->canonical_path, state->data[state->pos]);
     return state->data[state->pos++];
 }
 
@@ -119,6 +131,7 @@ static int i2c_echo_send(I2CSlave *s, uint8_t data)
 {
     I2CEchoState *state = I2C_ECHO(s);
 
+    trace_i2c_echo_send(DEVICE(s)->canonical_path, data);
     if (state->pos > 2) {
         return -1;
     }
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index cf1abe6928..d58dca2389 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -390,3 +390,8 @@ ivshmem_flat_read_write_mmr_invalid(uint64_t addr_offset) "No ivshmem register m
 ivshmem_flat_interrupt_invalid_peer(uint16_t peer_id) "Can't interrupt non-existing peer %u"
 ivshmem_flat_write_mmr(uint64_t addr_offset) "Write access at offset %"PRIu64
 ivshmem_flat_interrupt_peer(uint16_t peer_id, uint16_t vector_id) "Interrupting peer ID %u, vector %u..."
+
+#i2c-echo.c
+i2c_echo_event(const char *id, const char *event) "%s: %s"
+i2c_echo_recv(const char *id, uint8_t data) "%s: recv 0x%" PRIx8
+i2c_echo_send(const char *id, uint8_t data) "%s: send 0x%" PRIx8
-- 
2.48.0.rc2.279.g1de40edade-goog

