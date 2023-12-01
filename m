Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp1023742ejb;
        Fri, 1 Dec 2023 06:32:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRjoa0mCjn0ktPpgQx1kcJfWh+SNoavc8ShQi202Fv5ilL1xT/bCUs04A9xRaysCYVYHz4
X-Received: by 2002:ac8:5f13:0:b0:423:77e2:6fb6 with SMTP id x19-20020ac85f13000000b0042377e26fb6mr32671544qta.30.1701441144002;
        Fri, 01 Dec 2023 06:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701441143; cv=none;
        d=google.com; s=arc-20160816;
        b=U/m9oFSM0R6tQXjPZqOunxvOKdhYW5nd10h3wZfzr0TDySyaHoZGg8hxoMY+vV3BCu
         B7SbZIx5nIcdk9axYuX5tyimoMH41fqllczib6H6fsog0nafbH1uXewvjhLqcho008a4
         d+wR/6OumKyNQILw6r8kJx2IiD8VVzQDWOP8zKElue57NnkpAuGI8+vJHVaKD327TWs4
         oq9pXkZS0JXqv7aeknuTZZSoSqRfks1XwSZ9MzVWB+1rmQxO7JYREONR9ChfA5o/dp1D
         nHGEsGTTi4VyA1eIlCTPIM8X7T0Hgozoqf3myb4dxb/C0Gp1/G+kZKbd+PuHGOC7dbjh
         2jNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=lzQsYOZx1lby/03o6yhLAnKTrunXv93oPFAjodmUZ7Q=;
        fh=o3lfIpO1LiWB5YaKx2qN0pZoVgkt08VAmJbZ6Wpmxfk=;
        b=xJ0j5S03DKBRFCeAYdX/wRrXfr0Hz2ETNo0u10f8VRsdnqdUPpl4gRAJ0fslw0s958
         MStbsuIXIZhJfhxFb17wEzYLM3a2TRY7vxdIWAhbaOItK3PKLNt3zLii99+soTZFjxWE
         469VScDD57MjUfpIW1qDwARpMx3+iS9+bjd4RF62XVnBDvZGiumCtrmq3nGdQHnwxsRk
         O8+MtEYsiVK20M3KRcqBMF7DV0k4J4mEnXCnZB8uG2ZNkazEC7XSfVS+UPq+JxA4dLva
         XQTPe6USpf/vVwIgqgpRcd5R3TLyFfp7f85Lc27Ju7omMJE8L/emUrfgCTh2/88X0j+k
         A2tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DbDilatH;
       spf=pass (google.com: domain of kvm+bounces-3127-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-3127-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-3127-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id y11-20020a05622a164b00b00423e4453177si3483335qtj.691.2023.12.01.06.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 06:32:23 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-3127-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DbDilatH;
       spf=pass (google.com: domain of kvm+bounces-3127-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-3127-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44EA1C20F54
	for <alex.bennee@linaro.org>; Fri,  1 Dec 2023 14:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4122575F;
	Fri,  1 Dec 2023 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DbDilatH"
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1B410F3
	for <kvm@vger.kernel.org>; Fri,  1 Dec 2023 06:32:16 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bccc2e3efso2826897e87.0
        for <kvm@vger.kernel.org>; Fri, 01 Dec 2023 06:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701441134; x=1702045934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzQsYOZx1lby/03o6yhLAnKTrunXv93oPFAjodmUZ7Q=;
        b=DbDilatHQBQcO1yJhbm354RNR5X9Y87QGZF4YZXStJ5M8CApPHf7qdIt96UO2QdcNK
         +8jOpWLIge2Zqhyr6kFALbM22SJwBEDXCD1+fZqPGH0jqPrUhr+SWkcKXqhAIwT/LiYq
         dWO7JQJyicRB+Drl9GMLaEADM4qtZCtYpuvu3hR7yXgTc+fF2pDPI4yZvpTZAtHzkFEZ
         dg2MrMus7Qe30k6EvpeHNjM96Z3C5VdPwxVNld075skzBb+T3zJkYBPksMhC0NBt0N3b
         Jm1tuNkRTwOQnVBNQYOznECfAjUO+Xm81QgG5iOE7yFtdhfMy0Jva3tUixhnXWUwauMv
         8BWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701441134; x=1702045934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzQsYOZx1lby/03o6yhLAnKTrunXv93oPFAjodmUZ7Q=;
        b=XtttBxr2hVKFJ6oIH5U2yf0vyC9+eHcnJp/niOE8lR290vVv/2Me5/SbtyLAW+OMPe
         l1qTEzzx6Mq7guO+Id7PaIM/lXk8aklIeb9BOnz+esp5MNkWA1aHtEzeOfSF4PkxwpIc
         ODfcV2Fr2bVdOlyZPCee0cYbNlcBGRykJ5zBbWHWSAKNavz0Xjcn/0SkCrYsjr03JO8S
         q7mRF+hen5cqrBo/xY5jjjJuPkxEqvnqQIoOKQoEtvWxRjzo9qiboVhHLC7LW34Jv32n
         NFgROMduTk6PmiJ0fmwhpD1Mz6HoSpbes5+niElhHYin76dH28qLSmgKaLnXEwdod5wG
         Gu1Q==
X-Gm-Message-State: AOJu0Yx5OrsTKiDgYfp/f+D5EGtAsZBsUh5jtmwr/I86XwAnhTcBlLsl
	/GETfM7ZHPhqQ5pVm5bebSVvFg==
X-Received: by 2002:a05:6512:1598:b0:50b:d763:fe35 with SMTP id bp24-20020a056512159800b0050bd763fe35mr1096852lfb.80.1701441134581;
        Fri, 01 Dec 2023 06:32:14 -0800 (PST)
Received: from m1x-phil.lan ([176.176.160.225])
        by smtp.gmail.com with ESMTPSA id d9-20020a056000114900b00332e8dd713fsm4350612wrx.74.2023.12.01.06.32.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 01 Dec 2023 06:32:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 2/2] target/arm/kvm: Use generic kvm_supports_guest_debug()
Date: Fri,  1 Dec 2023 15:32:01 +0100
Message-ID: <20231201143201.40182-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231201143201.40182-1-philmd@linaro.org>
References: <20231201143201.40182-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Xj7n2kdRu5qH

Do not open-code the generic kvm_supports_guest_debug().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm64.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 3c175c93a7..031d20ad92 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -32,13 +32,8 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ghes.h"
 
-static bool have_guest_debug;
-
 void kvm_arm_init_debug(KVMState *s)
 {
-    have_guest_debug = kvm_check_extension(s,
-                                           KVM_CAP_SET_GUEST_DEBUG);
-
     max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
     hw_watchpoints = g_array_sized_new(true, true,
                                        sizeof(HWWatchpoint), max_hw_wps);
@@ -1141,7 +1136,7 @@ static const uint32_t brk_insn = 0xd4200000;
 
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
-    if (have_guest_debug) {
+    if (kvm_supports_guest_debug()) {
         if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
             cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
             return -EINVAL;
@@ -1157,7 +1152,7 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     static uint32_t brk;
 
-    if (have_guest_debug) {
+    if (kvm_supports_guest_debug()) {
         if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
             brk != brk_insn ||
             cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
-- 
2.41.0

