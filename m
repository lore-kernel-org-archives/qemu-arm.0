Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1307877ejb;
        Fri, 16 Feb 2024 07:37:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcKzK5s8bOYk6ggmJtibi3PLa2BqpB3srUznl0+BQ683Se4O+u2G+XGXVXUqQSCp5xeVhDoc9X8UXZKY1KbXenma0rhxwu
X-Google-Smtp-Source: AGHT+IHXgpE2+WG5rIor66Yd/YzfVONGCYH/O5p8oYtAQGvjcaacx6OtsGNEApHp4b1j33VgAaSq
X-Received: by 2002:a05:6214:5c49:b0:68e:fd3d:fadb with SMTP id lz9-20020a0562145c4900b0068efd3dfadbmr6766846qvb.41.1708097822768;
        Fri, 16 Feb 2024 07:37:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708097822; cv=none;
        d=google.com; s=arc-20160816;
        b=PBf8zqfrQAYItRwZaOX4lAiWuzMAQImJ/nMB3CSf5jpAoayPQC9ik9y3n9oVoXQrcP
         Y3cDCtevALeM9nnENlL43uedOMNkl0E0fCrawvQXePZeCm+O3Y4BoyoBBZlBHA0oKk5J
         BL4D1jls/LxSJJ8Ntw9Z9GSkC6mmkN0Hc6Hnq2q0z5L6Aj8ByACwv/oyqCNr5SXaHoco
         LA+aao5FUZ4rWg6NdxTA/v4aHuaOrZljMRmj64JisliZOvpivL701CPUvMfSlyILjKJE
         +xySt+MScdB8jUj3vXqprOY3qlVZHIm8myexpMU6ScBdsJcZNQrojPPowl+kKAAejGlW
         Tt/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6fLBBhh1GSx7gD4Lvttkm3NNOOv+Jojp8q0UUHVCrGQ=;
        fh=uMY8WrrG4rf5woj9ob9mzQHpvMlqXpHLtJDnG6Nsxcc=;
        b=QA4BkafepzyPyi1VDBrYoJarna2DFtaE8pUKizhRLxb/fWxmlDEZIsLrOHQxZdCDLf
         K64VpZR48gyTVYoVSE2O7T+3YF5nPPZbDUThsrwu5V488F/eeHKjmtGOMySb3owgQI3z
         UTR5F0PEo49dY5AXqwmAtEZVfr/BeDnkzyjai6zHMVNarl1fWTrCB+cOyQCtK6C5EuWd
         xQCmrmc1kiCrIUTxooQ3FypWEzHy9KXc4iuGouTS57i8w0z0vCBr1WOoW6DupIlff5ut
         uD88Ee6rpaF0QuQKe8zjpEnPp6/6sABQNcMK0jo3Skc4DZXGYdGTV+MHQApYKPb2bxE0
         dWZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zpab49Gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im12-20020a056214246c00b0068f2bb8bf9esi11842qvb.65.2024.02.16.07.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 07:37:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zpab49Gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rb0Fr-0004GZ-Mb; Fri, 16 Feb 2024 10:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rb0Fp-0004DJ-8F
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 10:35:58 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rb0Fk-0008Jq-Dp
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 10:35:54 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5129859c6b3so798507e87.2
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 07:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708097750; x=1708702550; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fLBBhh1GSx7gD4Lvttkm3NNOOv+Jojp8q0UUHVCrGQ=;
 b=zpab49GdHR407PIxh5Gd0ldme4YocbRxvc/IrE1JsLfO29RoA+en4LtQ/YGwzhEk77
 52+E4OE0qrGgKBtDIdbnbLwLiD5rsGXzEdqwe79M/iLoF0KfmWSdDbaIQJMj43l8+Mv+
 P77mzyX8JiZC29066OSSQQDdNY+3dcpr454PAC6buUD+PTdYkF9E3JH2uhet8om/BkJ/
 mPNG9QKNG+R8E/VLcU6yrlfKifhnvgUxtBCPoanApzWEwrocshA6Pwt2G6GeajKtG6P/
 PO4BqHdgN2qgK9N5/VLBW9/eODa1rZIFyCTNd6nrEj7+qhi9DZJfzJk2oj2T17hwYO5f
 LypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708097750; x=1708702550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fLBBhh1GSx7gD4Lvttkm3NNOOv+Jojp8q0UUHVCrGQ=;
 b=Er6D9WQhIG0y//1lokGgtsoG2ioZ0CAtBK57LzA5QVAaa/8n9JHS4cczlqI1h3ImT0
 YXkvIWo9ky17K7iKUxD9rtoiRW//60hC9ZYUsGnX3Xt74YXF0b/mchiuQATJ5J3ZBjgz
 tGqxnVb8jFfVR8Ep0wJ19sPxyvL89mWOZ4GG+q1TsdcsdccUf3pEtO+Z2zFLgzoNZDMi
 NAYk+SRKAsGOsExC3BBc7HIOk+4vD8a8BfFluaS+Q0jjUHwBQ330Nyw+4zobzrgpVcls
 KKGaXMlZWWrvfReySmDEpECofR7HvkUP02ysHYKJ4REckRg14qZsBCv4vJfr3pJOAilI
 XCbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8w2edzDH+9QVaFdkILMXidHycFYb5aW7hU0HATlGNy9qQ15NIj2LtrzHKauzB4zoQiGrIfAPjRF7evd2vRFsUXbOV
X-Gm-Message-State: AOJu0YyjJQGkjtLvLOFdnP+XrMzqZgmUdg385k3TeNXB7A1xIDGLJsun
 eGrirJ1LacVOi7Ujfhbowbsrv99kvHiK1DkhRKITriBCp3tRorCokAH1lfTQ+SA=
X-Received: by 2002:a05:6512:224d:b0:512:99ad:d465 with SMTP id
 i13-20020a056512224d00b0051299add465mr995055lfu.16.1708097750674; 
 Fri, 16 Feb 2024 07:35:50 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 e1-20020aa7d7c1000000b005621b45daffsm85225eds.28.2024.02.16.07.35.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 07:35:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/6] hw/i386/kvmvapic: Inline sysbus_address_space()
Date: Fri, 16 Feb 2024 16:35:16 +0100
Message-ID: <20240216153517.49422-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216153517.49422-1-philmd@linaro.org>
References: <20240216153517.49422-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gVTPqs+ac4CM

sysbus_address_space(...) is a simple wrapper to
get_system_memory(). Use it in place, since KVM
VAPIC doesn't distinct address spaces.

Rename the 'as' variable as 'mr' since it is a
MemoryRegion type, not an AddressSpace one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/kvmvapic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index f2b0aff479..25321d4f66 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -16,6 +16,7 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
+#include "exec/address-spaces.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/sysbus.h"
 #include "hw/boards.h"
@@ -57,6 +58,7 @@ typedef struct GuestROMState {
 
 struct VAPICROMState {
     SysBusDevice busdev;
+
     MemoryRegion io;
     MemoryRegion rom;
     uint32_t state;
@@ -580,19 +582,17 @@ static int vapic_map_rom_writable(VAPICROMState *s)
 {
     hwaddr rom_paddr = s->rom_state_paddr & ROM_BLOCK_MASK;
     MemoryRegionSection section;
-    MemoryRegion *as;
+    MemoryRegion *mr = get_system_memory();
     size_t rom_size;
     uint8_t *ram;
 
-    as = sysbus_address_space(&s->busdev);
-
     if (s->rom_mapped_writable) {
-        memory_region_del_subregion(as, &s->rom);
+        memory_region_del_subregion(mr, &s->rom);
         object_unparent(OBJECT(&s->rom));
     }
 
     /* grab RAM memory region (region @rom_paddr may still be pc.rom) */
-    section = memory_region_find(as, 0, 1);
+    section = memory_region_find(mr, 0, 1);
 
     /* read ROM size from RAM region */
     if (rom_paddr + 2 >= memory_region_size(section.mr)) {
@@ -613,7 +613,7 @@ static int vapic_map_rom_writable(VAPICROMState *s)
 
     memory_region_init_alias(&s->rom, OBJECT(s), "kvmvapic-rom", section.mr,
                              rom_paddr, rom_size);
-    memory_region_add_subregion_overlap(as, rom_paddr, &s->rom, 1000);
+    memory_region_add_subregion_overlap(mr, rom_paddr, &s->rom, 1000);
     s->rom_mapped_writable = true;
     memory_region_unref(section.mr);
 
-- 
2.41.0

