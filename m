Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp2641njc;
        Tue, 21 Jan 2025 02:59:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXZpJr1va2Ef2AM2eW0p0GG5g/96yeOcYueF5dT4HLtz86FrrfCVYV0/EZh3HHyk+wtLS0b7r8caIfTqA==@linaro.org
X-Google-Smtp-Source: AGHT+IF5ktiL4vjakGKHa9zAenCuCwLRXQq4OoNBaeZBQak6OcZ7NDk8LVAd/qWRGXd6N+NIKQ76
X-Received: by 2002:a05:622a:28c:b0:467:6c95:19e5 with SMTP id d75a77b69052e-46e12a0c21fmr235272751cf.8.1737457193318;
        Tue, 21 Jan 2025 02:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737457193; cv=none;
        d=google.com; s=arc-20240605;
        b=BalRgwMAAyPpB4LqqDQdXbd6zcx1VOcEl6efjyMUMbV+epo0zhZjmgdJWKMDVQ5WEE
         SE3CSgmfmDsgLcB2IP7mkxf27AJOhOittIQf07S9GXg3AWzrdaRZtvhUvC+CoGAlVMJA
         x9jassRc4mFHfKOKULH8WsAQrLUI4CqZP1kSdjLTAiYeeshqNGdVA1SOQ/mgL/qUoRfg
         cwhoRC5XYlpLtNVf9zLui0pUkg2iYSAlvaaD9F7VncYjag5BrA3hVJYZN7oCtu6IXVAV
         HXDag3tfwQExpDmZ6kL3ArhPotFY0U1NTmvFJCeMVg74PvlYTP1vPvGv/WSRVP8Q8IrE
         RqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=UzR4VEhqh7U7JLvDc/M/DKVS4N7ahB3cXKMCv0bX05k=;
        fh=3h7grbpvoi9urVCcng24qMnx9kVhsqCImCxYp13lmp4=;
        b=FNPlADobssZp8Hn4Wzgdcsh/BxciT9VEaGe1GUkOagvbQ8yqA1PANNxR1N2yqgs+CU
         6IyY9VhO5AJwdnCvOgMFodooxoT+5D2h0nIcNKYpDl5exiiUDgzrHQNHS/9f1jhZgf5E
         AmCAE01vwA/DSF5HerwGLUvh0S/hu5vRDMu2hVTvKoIn52fERmuE38CODzIFIvyYT5EG
         kDjJukPRKimk7bKlQdHfJd9nvF5qCS8h6Ozs2MbsszV78bKoQCUmIMTt7HHFvRvS767z
         YQjV7LLHuRtxdK0P9c0DF2wScc0HOgCVCTFINcWzjQmPhFdrxK7bOQ5U2u+q/Nr8wdEC
         u3VA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jLOD8cd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e10458ae8si114986841cf.415.2025.01.21.02.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 02:59:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jLOD8cd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taBz2-0004Yy-KF; Tue, 21 Jan 2025 05:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HX6PZwYKCJoNCNOMLAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--titusr.bounces.google.com>)
 id 1taByz-0004Ke-No
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 05:59:46 -0500
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HX6PZwYKCJoNCNOMLAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--titusr.bounces.google.com>)
 id 1taByx-0005IP-Pd
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 05:59:45 -0500
Received: by mail-qt1-x84a.google.com with SMTP id
 d75a77b69052e-46790c5b1a5so165538911cf.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 02:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1737457181; x=1738061981; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UzR4VEhqh7U7JLvDc/M/DKVS4N7ahB3cXKMCv0bX05k=;
 b=jLOD8cd8eW/rJ/wyk4EZ1vKwhKvqh59SvXATIAeCx7kuXPxv6Xzei8Cfjdka9KIXv6
 v1fxinPpjPuTma1RcU1TAiLbYZVVdctnG3SYx9kHUUKj0Iwnh4JDrXNVebwiBvrFnpIJ
 H/Ve5Gn83i2g3d24zXX/jxlQecKovr75RdjF6f5LANCXYyeYgJpxiuZ2Pmj1xc5DVQo9
 6Mbh0iFbf8oSMPyTI857wJfiMKDvrGec+tVjBEVhnkDq1IlbbtnWFq4G+KULbjlk8SNc
 hsyE9lb90nRNNFIjfRCpQxscfsncB/dwbowCkfOWW5GyDoF3nLMcDDgAL9Lyzh+wC6rq
 AiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737457181; x=1738061981;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UzR4VEhqh7U7JLvDc/M/DKVS4N7ahB3cXKMCv0bX05k=;
 b=oPXYdLPJ2bpm3dwlb61ryuKEVHvqE3WeBXcMuc/yW+3GeJXhaTzHE/W/O3hwxPP3fI
 eJMWfDTrzr+h8doUOsACGG1gpyOABrIj40rMVQhqBAYlRwfiEVhTobwlXllUY59IFi41
 pn8xs6SBau8G7DpyaMYE0/zGDltnPYah6jWFbT1YW3pLAUE/BRrh3dEl8M2DmM7FOGS0
 XF7oDAaLjb2nik9aPd33FEifHA+NW9iV7QmtyR+Izwtt9J4WE6xJ5kFrz3IJNZLG5zEf
 PFFBPqxo75DQtYHw3s2S78qRit34hFM4G2hMLWc/L53/WcbpwHP1O45N+PdhwaXSYoCc
 MMMA==
X-Gm-Message-State: AOJu0YyMCjQyUzPHXdl5Du1j+za3Fwib8IQFaDsM/dEjIwVaV07kMql0
 yZ7ONLaXp50nu/H7kBeKYHJdOPUcDssSD7oblIGZmJ0VoJ0DU5M0+HAqeYPvE5a4W5IgEUPMQpp
 TPA==
X-Received: from qvbpf18.prod.google.com ([2002:a05:6214:4992:b0:6df:bb1d:906])
 (user=titusr job=prod-delivery.src-stubby-dispatcher) by
 2002:ad4:5c4b:0:b0:6d8:a7f7:c39d
 with SMTP id 6a1803df08f44-6e1b224bd4amr221494996d6.40.1737457181436; Tue, 21
 Jan 2025 02:59:41 -0800 (PST)
Date: Tue, 21 Jan 2025 10:59:34 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250121105935.3069035-1-titusr@google.com>
Subject: [PATCH v2] hw/misc: i2c-echo: add tracing
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org, its@irrelevant.dk
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3HX6PZwYKCJoNCNOMLAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--titusr.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CxLItodvG4i+

This has been useful when debugging and unsure if the guest is
generating i2c traffic.

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/misc/i2c-echo.c   | 8 ++++++++
 hw/misc/trace-events | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c
index 5ae3d0817e..65d10029dc 100644
--- a/hw/misc/i2c-echo.c
+++ b/hw/misc/i2c-echo.c
@@ -13,6 +13,7 @@
 #include "qemu/main-loop.h"
 #include "block/aio.h"
 #include "hw/i2c/i2c.h"
+#include "trace.h"
 
 #define TYPE_I2C_ECHO "i2c-echo"
 OBJECT_DECLARE_SIMPLE_TYPE(I2CEchoState, I2C_ECHO)
@@ -80,11 +81,13 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_event event)
     case I2C_START_RECV:
         state->pos = 0;
 
+        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_RECV");
         break;
 
     case I2C_START_SEND:
         state->pos = 0;
 
+        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_SEND");
         break;
 
     case I2C_FINISH:
@@ -92,12 +95,15 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_event event)
         state->state = I2C_ECHO_STATE_START_SEND;
         i2c_bus_master(state->bus, state->bh);
 
+        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_FINISH");
         break;
 
     case I2C_NACK:
+        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_NACK");
         break;
 
     default:
+        trace_i2c_echo_event(DEVICE(s)->canonical_path, "UNHANDLED");
         return -1;
     }
 
@@ -112,6 +118,7 @@ static uint8_t i2c_echo_recv(I2CSlave *s)
         return 0xff;
     }
 
+    trace_i2c_echo_recv(DEVICE(s)->canonical_path, state->data[state->pos]);
     return state->data[state->pos++];
 }
 
@@ -119,6 +126,7 @@ static int i2c_echo_send(I2CSlave *s, uint8_t data)
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

