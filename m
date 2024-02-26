Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2203448ejf;
        Mon, 26 Feb 2024 09:38:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXdS9k1fQ+ch+dVQc79qKJkvwcXVz5apbUbPF679TxYFDfKxppsLrCCZeW9futiQe32BjguUtbyhvDe5llDp8ru9BLeY/z
X-Google-Smtp-Source: AGHT+IF5Qr8VZLS8zJJ/GZlSB7Jln8fUsYFSYGKz3Jd6fz/d0p77dl/ACmWqPjtWWkMvj7QkyxBN
X-Received: by 2002:a05:620a:12c7:b0:787:2224:5cbb with SMTP id e7-20020a05620a12c700b0078722245cbbmr8023134qkl.50.1708969134671;
        Mon, 26 Feb 2024 09:38:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708969134; cv=none;
        d=google.com; s=arc-20160816;
        b=isYzpAZuExzvH9YRtAwfWHJiY6C95PIO4A9ztymNOOpNdUSct6FIaHp+iFi/bAy1j7
         M83vBxqkfpOobDwMzzXqPl2Ij0OaHJ0RWUeexPqeYSTVmP9CUH//0Jp94RfPhuthdz5A
         T2WoBWdSY1Q+zZOhyOhoimAvciVx4ZfTMu350Bo0+h7LMQvTlrKlObBP2fdSFAKD6aU+
         QF8XZwgeFfiD+pRAy8d8PYuzAkDxQtPvXBEcDcwiCwjGTJgBpgBePVUpmo9NLJ2im2ex
         MA3hWLx52mrIVSmYoYY7FJR5XrZ0UgKJt1MFFo7fOMTyYgaSbKwoqIeR11ViWCnd4zI/
         E4sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ibVcW3lwaKG1GGTyMtc1ku+JoJ+rReT+MXHBNQRHkgA=;
        fh=n0PTKc6cFaTUPm+4LUzQHB6y5ChB5NluvE1RUm3gstw=;
        b=xVGUEBpgHtnf4wrd3SWC5y9Cmo/926hN7Z0NnMNa40NGFVKOzkUFdSbVd4/7GorhUP
         fR2hCGhnnvCf+V/NPMtFkf8zrP3819YhyVFd6MKny5WwZtFaY7w6KzBaJgDg3k6fPefi
         mnfpCTfoaSnSqy5DNMF6XHSfvxI0ZpVEufW1t0O8w3MxElKvdIl0VjPlkGIfK/9iGNIU
         a5mombN2I+JUE0EFkLv6rGXtHLHJ1pS+ipkJtngA4IjG3z+LM/oIpDmW/3Ae6PVU/TsP
         /rGoTIr8GXeaF5JyJIcpi+xIOPj9xYE8D5bsHiFdkuUAm6HvK30B2uB97ZCHud0Y2mI2
         mtDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWXD2Kas;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj8-20020a05620a190800b00787e006b6b9si263181qkb.537.2024.02.26.09.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 09:38:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWXD2Kas;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reew7-0004Sx-0R; Mon, 26 Feb 2024 12:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reew4-0004FP-2i
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 12:38:41 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reew1-00079c-A6
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 12:38:39 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-412a38e2adaso10228955e9.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 09:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708969115; x=1709573915; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ibVcW3lwaKG1GGTyMtc1ku+JoJ+rReT+MXHBNQRHkgA=;
 b=GWXD2Kas0o3bCKek52U4V18Gkimi3pSbE3BOSVXHsEwmeHLzb3iNw4pE82e377zHGy
 m6w53sX828oCFEIXDs03oYzT7Zq5cwufQkYJmgg69wfh9LV6JOYSZ5LCublk1mROaVC8
 2dO0w6FlXRziCyfbstb0g10rhAF//xwYWk3jSGSWTeQS73RE3MMqI59Vf45GdqwUtR04
 5+Mx/RTeg3yBB4MLKdvw+NYgRB5C6jpqGn90RzYKPeuBfpOO45rdjgHgdk6kIi4faZst
 YmutUHAtL+VPJQoCv5eN5cWtTk9Iw68yBj4+TMDPyxl958SoXEMWlyOFj8reuT6gdP//
 lB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708969115; x=1709573915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ibVcW3lwaKG1GGTyMtc1ku+JoJ+rReT+MXHBNQRHkgA=;
 b=KfpngtNpj239EZjoaHMB60OVdRdeIeAggT9CmKwptRob/jPZ9vnKifA7+BYXtSYMiT
 wLGnaR6CN2il1gwvX3OIHgRgp6ZyQwXPRuKTsol5VHnml6qzyrRViAx69HLz17S+Q/BO
 cih2M/LJhklHePfXCpw4SbQfqjmuaqvXwWrnU1xfvQwYhzeyXMg9g21KuoR8tvxheMll
 +TdBB+35a4EXrIoGSXNfrCSjIe8hhp6/M1JysUmQBVqojUEq67RxJbs6k/QMKDPKAA9U
 VRDn+nlvL7AH+0ZcfZQSYVIaNDgLObrlEuI3f9qbk7TNZX1Q5sTKPCjyyEyfDzSuZj2G
 Wf0Q==
X-Gm-Message-State: AOJu0YxRNFRjokYXf0s0KIHh5v88id54W4W7Hm4TDy0138tW50jeR1GJ
 cBiizaK1c5kKC2wUazh31F6jp4HlJqhF+iJo/PixcWb0FsQwtlgqSgff+5QwrwA=
X-Received: by 2002:a05:600c:5246:b0:412:8d98:78a with SMTP id
 fc6-20020a05600c524600b004128d98078amr7017617wmb.13.1708969115328; 
 Mon, 26 Feb 2024 09:38:35 -0800 (PST)
Received: from m1x-phil.lan ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05600c470600b00412a2919d98sm5708711wmo.10.2024.02.26.09.38.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Feb 2024 09:38:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org
Subject: [PATCH v2 5/6] hw/i386/kvmvapic: Inline sysbus_address_space()
Date: Mon, 26 Feb 2024 18:38:03 +0100
Message-ID: <20240226173805.289-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240226173805.289-1-philmd@linaro.org>
References: <20240226173805.289-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XP0UmeKRtBm7

sysbus_address_space(...) is a simple wrapper to
get_system_memory(). Use it in place, since KVM
VAPIC doesn't distinct address spaces.

Rename the 'as' variable as 'mr' since it is a
MemoryRegion type, not an AddressSpace one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i386/kvmvapic.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 20b0300357..61a65ef2ab 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -58,6 +58,7 @@ typedef struct GuestROMState {
 
 struct VAPICROMState {
     SysBusDevice busdev;
+
     MemoryRegion io;
     MemoryRegion rom;
     uint32_t state;
@@ -581,19 +582,17 @@ static int vapic_map_rom_writable(VAPICROMState *s)
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
@@ -614,7 +613,7 @@ static int vapic_map_rom_writable(VAPICROMState *s)
 
     memory_region_init_alias(&s->rom, OBJECT(s), "kvmvapic-rom", section.mr,
                              rom_paddr, rom_size);
-    memory_region_add_subregion_overlap(as, rom_paddr, &s->rom, 1000);
+    memory_region_add_subregion_overlap(mr, rom_paddr, &s->rom, 1000);
     s->rom_mapped_writable = true;
     memory_region_unref(section.mr);
 
-- 
2.41.0

