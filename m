Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FF3C4451B
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:23:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkrtz-0001bQ-Vo; Fri, 17 Jul 2026 19:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrty-0001at-Al
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:30 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtv-00071c-FE
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:28 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-caf707e3a70so1291353a12.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330606; x=1784935406; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+w4gM7iFRV4DJ/pj745QODhhizrJBFDLfIGD0SvwnhQ=;
 b=X6QcDhXFWYtTddJfZzOMrZ1unD8DomSrXtYRSq8xbYh8dpgpx35lmeDr2NWOmimJ4J
 qyxAsvh5dx+cECaFR3jH6rQ5vtRAP7WoH3AdZ6HcPBCMHiXk/dL+g6tTOBKqd/8Uwwhl
 gluCTZOQywz8JKchBhwGnGMAzAs+CrEjDhPMBc4Ym0k+qkOUkx0idPme2V38OWcRK+RL
 YuWnUBEY3FC6imgs1Fm3znX2TkMHCcZbS5dgHgVWh2j0OwL8sbFcMfwH/9wYsFK9oYK8
 I5cRLsCrNsVJCt10RDyeia5seVuHgGwUifMFU5fHghFB2pwcmWxdRHlWFgBo4NzoZdHR
 Oi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330606; x=1784935406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+w4gM7iFRV4DJ/pj745QODhhizrJBFDLfIGD0SvwnhQ=;
 b=Y9buJPyRj+/Yzgq/tx5KN/MxanploAZgvkhjkhRlEn10QPtOWAO5uXGw6FxHuJHwVu
 dbdolEQt6Ia22M+lfY+QMxtRmlCf4Rh8duhWTQLYECoJb+UniXb9DvhVF3x1pHWYF0qx
 /c+FVTHDYnPpwaro2HR891UMIeZDYevW0DOOPnrQiGK2r4DhmT4g3We9sFj0Y2ed/aNy
 aFW8Cb6XJNs7FcNIqu1Iv++oO7wBS20kd4xnJaV68UpbK56EZmkJw4A4h5B9bnjkQutw
 2vjYipchiExT1k2HluIjR+h60gG63uBWgS+VwvZWXKeeKIZZ2dw7N0qge0P2JG/OzGwi
 dqHg==
X-Gm-Message-State: AOJu0YxdXSZTNSwYbfXXt4Ca/3FUwceCHed61xESIlmS2iSliuB4neRT
 L+9O6PJyUURZlunksTvxj0/+4Hmru7H4XzHJ+r0UQ4/fTThXrgvcy4WVdw8oXWouzY4=
X-Gm-Gg: AfdE7clq/1MFDcBtO+P3JUed3ycznKxKcfT6HsKk7fp88BaE2Qu3WGqpUtuc+SGcIAN
 8vfRuuH5Cz4smtNBQFsIJQaXje3ElkMhFuVcpSKVmHjlD0xK1IZblGebSOTyHRwQocX62jmWKXl
 Ok2yAqcDteVLriUjr3Sv4XhJ+pNWLgIPl3aJp2hCIJD/2Xj4vi4e2z2mo0N00rd3I0AVTLINHSc
 R8IAxss1YyDrEEslCBKH3K8Oc9+BNHShFjUDpG6rOkIZ5KzXq39Z1ibMjEyF07RsInDnUD771M4
 w5m8nOUWl/G1Rz9RooHv5NPGb1JX1pueMoWyDPH6+ucvZwX4Odq33W5Egj1G1et1cYODIoTJ0xT
 l1gnsbgpVxGr+GzIgQLe8q4NhFPDUZQBnDkiCD+H9/7oHZPKw4R2xsc904pA8mJn+wc35vBwJZw
 EqEwLcG28=
X-Received: by 2002:a17:90b:4e85:b0:380:86d8:8162 with SMTP id
 98e67ed59e1d1-38e3d299be4mr9939591a91.18.1784330605511; 
 Fri, 17 Jul 2026 16:23:25 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/17] accel/tcg: Clean addreses in the user-only probe_access
 api
Date: Fri, 17 Jul 2026 16:23:01 -0700
Message-ID: <20260717232306.378988-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717232306.378988-1-richard.henderson@linaro.org>
References: <20260717232306.378988-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On the system side, tagged addresses are automatically handled
by the target's tlb_fill callback.  Allow user-only to accept
tagged pointers as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a35aca7889..3b3ee73d4e 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -752,6 +752,7 @@ static int probe_access_internal(CPUArchState *env, vaddr addr,
                                  int fault_size, MMUAccessType access_type,
                                  bool nonfault, uintptr_t ra)
 {
+    vaddr clean_addr = cpu_untagged_addr_vaddr(env_cpu(env), addr);
     int acc_flag;
     bool maperr;
 
@@ -769,8 +770,8 @@ static int probe_access_internal(CPUArchState *env, vaddr addr,
         g_assert_not_reached();
     }
 
-    if (guest_addr_valid_untagged_vaddr(addr)) {
-        int page_flags = page_get_flags(addr);
+    if (guest_addr_valid_untagged_vaddr(clean_addr)) {
+        int page_flags = page_get_flags(clean_addr);
         if (page_flags & acc_flag) {
             if (access_type != MMU_INST_FETCH
                 && cpu_plugin_mem_cbs_enabled(env_cpu(env))) {
@@ -823,11 +824,10 @@ void *tlb_vaddr_to_host(CPUArchState *env, vaddr addr,
 tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, vaddr addr,
                                         void **hostp)
 {
-    int flags;
-
-    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, false, 0);
+    int flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, false, 0);
     g_assert(flags == 0);
 
+    addr = cpu_untagged_addr_vaddr(env_cpu(env), addr);
     *hostp = g2h_untagged_vaddr(addr);
     return addr;
 }
-- 
2.43.0


