Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BBACCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:05:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcpK-00051Z-5X; Tue, 28 Oct 2025 02:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcpC-0004zk-PH
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:04:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcpA-0005n8-Jr
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:04:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42420c7de22so2751539f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761631490; x=1762236290; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5rAlH1/lu+rh7awee2lje3uE1FvJDSXtcSFDkovTFo0=;
 b=Ey/HZHUlloaZ/2+tZX7OQk9yvqOv4MQ3aukkEh84FqpBVvtLCRNrjJG21aCs8b8S6n
 f9w5MH5vAaBQSt0ISRdam0GqqKcnmBUwXcwV5QwopJ+WITSIPLvLR/w1RLY0VRBwQcNg
 fAtCrFtRLl5juTYzLQ2QXM36pPbfsro7Mb8fWKt0o8f77/5J95KNPdtWU6E7c3lHhyOa
 qJOcOlbjT8rKcQqizPb5i+yTZ3HS0pWGgmD2KbBxDUwTpmf8qbaX/qxZldAgygpGteRZ
 XBjxBGAM0E3MCGrlwtvCfvHisZHuPxXuVQBsNZuYTMEF49ByxZyzlynzw4ly/OCRSwrZ
 VU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631490; x=1762236290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5rAlH1/lu+rh7awee2lje3uE1FvJDSXtcSFDkovTFo0=;
 b=np2rJqv2Mtl4LRwOfj/GLjacxEVMfhL1Iuw70Q8DV7HmTDCiLMQRSE66bpI+vfEUwq
 1S4b17F3wrWTfclBaK6LdivJqCEAh8ppZefNcwLC+wk6zoJEeCkivn5oB1wz72xer2ar
 3T4FbuTijlghr6+6qwnAG4hCIyrEwvPCdpN6th+03t9nIPYNQEH7mDkiZNiTRnKDpMln
 dN/xx8wnnsTB8pNQ2/2Oomnwn4zo4L9jz2AUM7G2arKreC0PiHIlxzr6cPzSnmgwROhZ
 lEcwzNohx4RyBz0VW5jhS4z3kGYXTDl730zo0fmLjl4SCdaL2shvkQr8zEu4tUKDhwSA
 KQlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsS3uLtgdpbvRkeNshQWd+uB61jrMENmV2JcsPBWzki+gWdRNQtJ2ffKU+K8S2L0JR5Y4yUi5S4Q==@nongnu.org
X-Gm-Message-State: AOJu0YzGq6Nb4RJQbt4UVBCQO/dKa+fzDQ/fjJh52VA07o1y0jwJPqf8
 J1ehrXEOc5+bR9pQ742zFY4yl45YtyMNF2xrLqLKM6wptvZiTIINgRybF1drE/7ZQm8=
X-Gm-Gg: ASbGncsxzACiY+MosJqIRI4O7hOSO1zA3n3T+EbHmaLCU+UMNk5B9WgEq8hiw4AtzqK
 vlrjGRs8u/kX+l0/oeJd0XMfVOGRx0V8wUGh5+qUyVxjmkWeg0mYtM7ahPazyj7PbdvLkZFtso5
 2My8UN5EOhtrWYupOTWCZJUfzZQHvPJUrgYQnonvc3rUL3BL8WTJD99mp1pRpKUXlMFfj3FNtTB
 aGLCdQOz6i+IVVBIECgeEERFZWPPUIau7Z18S1G+lfGxa/lLRdlwHdztIvzSAgh6f+nwdPW889I
 TtFy9+/VNII2jf16U3tfOuzEtoS5XpHXRCiyRGckbsHpFW+5TGFgMQYtClsyvy3Bn49dG0z1fsd
 l5dK2ub055QDDF5Me8L6VmTsjD9Mx4putuMaeq2ZywHmK5i8EUIF6R4gJzK5+A2clDNMcx9rJsK
 xEz0Ka8EgzfXG6HNcgXgr/RkRLRyZ6hsB56idUqONcyDM3/SF8SkfQrnWHvTzwwES1sQ==
X-Google-Smtp-Source: AGHT+IG8zkd+TJv5KiWfrzhXB6ZTjqoPB1XyO0nMC8KbMR1x7q52BJzIfXG/0i5W8BVCYWo1X+isoQ==
X-Received: by 2002:a05:6000:430a:b0:425:75c6:7125 with SMTP id
 ffacd0b85a97d-429a7e59dd4mr1695553f8f.16.1761631489856; 
 Mon, 27 Oct 2025 23:04:49 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db80fsm17842412f8f.31.2025.10.27.23.04.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:04:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 31/59] accel/hvf: Create hvf_protect_clean_range,
 hvf_unprotect_dirty_range
Date: Tue, 28 Oct 2025 06:42:07 +0100
Message-ID: <20251028054238.14949-32-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h |  3 +++
 accel/hvf/hvf-all.c      | 25 +++++++++++++++++++++++++
 accel/hvf/trace-events   |  1 +
 3 files changed, 29 insertions(+)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 3d2be4092ef..5a57691885f 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -89,6 +89,9 @@ int hvf_arch_get_registers(CPUState *);
 /* Must be called by the owning thread */
 void hvf_arch_update_guest_debug(CPUState *cpu);
 
+void hvf_protect_clean_range(hwaddr addr, size_t size);
+void hvf_unprotect_dirty_range(hwaddr addr, size_t size);
+
 struct hvf_sw_breakpoint {
     vaddr pc;
     vaddr saved_insn;
diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index 0a4b498e836..e13abddbd9c 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -58,6 +58,31 @@ void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
     abort();
 }
 
+static void do_hv_vm_protect(hwaddr start, size_t size,
+                             hv_memory_flags_t flags)
+{
+    hv_return_t ret;
+
+    trace_hvf_vm_protect(start, size, flags,
+                         flags & HV_MEMORY_READ  ? 'R' : '-',
+                         flags & HV_MEMORY_WRITE ? 'W' : '-',
+                         flags & HV_MEMORY_EXEC  ? 'X' : '-');
+
+    ret = hv_vm_protect(start, size, flags);
+    assert_hvf_ok(ret);
+}
+
+void hvf_protect_clean_range(hwaddr addr, size_t size)
+{
+    do_hv_vm_protect(addr, size, HV_MEMORY_READ | HV_MEMORY_EXEC);
+}
+
+void hvf_unprotect_dirty_range(hwaddr addr, size_t size)
+{
+    do_hv_vm_protect(addr, size,
+                     HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
+}
+
 static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
 {
     struct mac_slot *macslot;
diff --git a/accel/hvf/trace-events b/accel/hvf/trace-events
index 2fd3e127c74..f989da59492 100644
--- a/accel/hvf/trace-events
+++ b/accel/hvf/trace-events
@@ -5,3 +5,4 @@
 # hvf-accel-ops.c
 hvf_vm_map(uint64_t paddr, uint64_t size, void *vaddr, uint8_t flags, const char r, const char w, const char e) "paddr:0x%016"PRIx64" size:0x%08"PRIx64" vaddr:%p flags:0x%02x/%c%c%c"
 hvf_vm_unmap(uint64_t paddr, uint64_t size) "paddr:0x%016"PRIx64" size:0x%08"PRIx64
+hvf_vm_protect(uint64_t paddr, size_t size, uint8_t flags, const char r, const char w, const char e) "paddr:0x%016"PRIx64" size:0x%08zx flags:0x%02x/%c%c%c"
-- 
2.51.0


