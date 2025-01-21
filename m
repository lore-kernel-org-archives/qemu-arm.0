Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp155209dlq;
        Tue, 21 Jan 2025 06:29:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVP4tzgbWcjvdSTpUHCpqQXh/UoSqmflvITy4MKLaLaQaoVKxSYIQ35mBvbpl6h27aFzStGL+5uMPzc+A==@linaro.org
X-Google-Smtp-Source: AGHT+IGC8KC2D+4/IUD2XuKFdSt/Nq9udL8+HHtRZiJHN1cPSxkPbu3e4y0rX7+xAQYR2U/RMJun
X-Received: by 2002:a05:6102:2ac2:b0:4b6:18b3:a4db with SMTP id ada2fe7eead31-4b690bc7e21mr11173068137.8.1737469742313;
        Tue, 21 Jan 2025 06:29:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469742; cv=none;
        d=google.com; s=arc-20240605;
        b=e3PtCurpzfyfISsLJRmE5gGZaPwV1bc1x/4B44atOiJCPVwejsTXYO1FcNnjnfEgIJ
         VX/f1YZ0grvGcrtGRy5PB2Q3of5L41/eB3XEt/Bs15zVh0t0dGPp7D6lJPEgFeiDdszS
         k5UP2akJ0ma0S0/p6RvJpTiuJBIPT9D2NWohJnj1v911n4wi97+8HLnGurpUuq1UlCp/
         gsqSfPPPmFmo89NtWMjS0/C8roXaJNzCnRyRPlB8TyPHvuCdUwcKtodLBJ0ZDHfU6R7R
         0FTdWI6dJvOG1OVXS5Xh7nIqQea/ejmcVaeRIxQTwRWkrbFbyEi1kJp6kVSpAaC35PQ0
         XgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fr9YdHbhOcKThpVgYMMFdjV9+ofIfxxdmaz/V1NjYlM=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=fMa0M0psibnmtkTQgc+m+7NYmzPMKw6Uy5PeMgoPep7D6HkmjguofKoKd5mRTi5+Uq
         0RTc1oQBhGBNmdMj7WAGfkyiz2tarqzHc/7gzoydeUE1oIFe4n+xUKy7GHqwQrXYpcmR
         sWa9XrWK9CDFg7D7/WHy7OA51U/M2auKMVGlIi+aK8JLuI7PXRA4FqkBxXWWKYXXM5KP
         uiqMplSE+QDxB3iGSED10n/8lCmEh2sVFVaahK9Oq4+ET6aL34DXGFykqNA6W4ixOcDr
         bvyNW82V6GEwvzJnSqEWfUx+QZO1jlBLdKN9HjgquhcHnouj2XaSPNqS0b7neQZDJ5Yt
         B1xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSqpmHGP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b68a2f985esi3443008137.312.2025.01.21.06.29.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:29:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSqpmHGP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFEA-00064O-Qs; Tue, 21 Jan 2025 09:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCQ-0002Ys-Op
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:25:52 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCN-0003ex-Tw
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:25:50 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso39885545e9.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469543; x=1738074343; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fr9YdHbhOcKThpVgYMMFdjV9+ofIfxxdmaz/V1NjYlM=;
 b=WSqpmHGPk6i8G3sbwYP0y9gvZVDR0dZgpEIv9xnsHcsRAPNEGxC5/pR8Z99ENLi0IL
 sFjqADgkbU896wjWZBTDq/+/wPFGZysM6aTpVsckleLW3dhhsCZTCLZT8elARtmVLogD
 tmdOzpbCZV9V0TPicJdEuMSWYYXo0rKTTw4j1NMGSZTiMlYPmy5HiiRqk50h7fh3JPCe
 HvEzA0CQcX4zWh23/0cLyVF5994fUHcuq2fEBrnjRsipy+KNFJjI7J/smNGp2mVqwJFQ
 mdNganYAbLs1ErmUI865ncL1eCX7Sizu8vya1N0gWHImamppW/6hNBs7l8c8oeSiTrfl
 caOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469543; x=1738074343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fr9YdHbhOcKThpVgYMMFdjV9+ofIfxxdmaz/V1NjYlM=;
 b=gV0s57Y6kj5uoJRZZ6x+L7TTAABxlY3rbghYhppVciEXF5BhTdiY5R96mBGFMYzWZy
 QplvHWOAJ1dS0cdWac4xitPITVHVVYJpyjwOr/LdBu2bx5Ixehp47YHDBF2ilGl5BPW9
 twApd1s4yui4VSvhC43rAbt3eQz4zQ6N1/UfQbbPOgeV3WF8U9yRVieAUFyepVlVcDQO
 LmhF5wTH0F5KZnNVEu6RGpUYin39gHEwU3OJG1NBqYj7gTscvG9SrP79yfmVF1+e4iBb
 ZAgPDwxqhRk+CKBunKuFPtzV7m1Ep0B8yW9F/OHQEzJc9ct5lun2uVdeD4bp7dB60fv8
 VLdA==
X-Gm-Message-State: AOJu0YwVLtevYx0f+dzbm+NEdIXMiYAwZ6kqc/5//Q7jCSjkaiwAd7Mm
 r73IM0/NfAJ7F9dLBwb99Gu4HJqr/0RomdeVQMcTllhICzHN2eVZMjH84iYrwBE=
X-Gm-Gg: ASbGncusrryMJvgcX2+hJ7/idROZI20ujmEsbaNpZ/ZmNWAysL9dtLL3WO+LS4SZdYX
 B/KXfYSwclETHW6d/SpW83DMoWU39utYu7/OlnT3KhY9VFRSazKEpockrOwX+phmtPzHWjt5An6
 5P69noEpDpzd8UrCoyWsHTyrnFH3qYDzOI13T734+zRMYwbm/tYc6cRmw9j7PPm2piOcRBjx0OS
 j5QUsA3q+hXcMuAqH2yZlknXs1hzYh0miLeMhdN4KZ+hjoZmWP0t/vSEtF5BYW2yZCQfhgRWrus
 biJWBrdX5eeLxYqQh0wPazb8+RbhA/fgZiqVHyZxUDzQ
X-Received: by 2002:a05:600c:310a:b0:434:e9ee:c1e with SMTP id
 5b1f17b1804b1-4389144ee14mr176936965e9.31.1737469543400; 
 Tue, 21 Jan 2025 06:25:43 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890461fc6sm184735035e9.29.2025.01.21.06.25.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 25/28] target/sparc: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:38 +0100
Message-ID: <20250121142341.17001-26-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nHg/vKDlL3VI

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index fbd38ec334a..94e807f9f84 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -776,11 +776,13 @@ static void sparc_restore_state_to_opc(CPUState *cs,
     }
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool sparc_cpu_has_work(CPUState *cs)
 {
     return (cs->interrupt_request & CPU_INTERRUPT_HARD) &&
            cpu_interrupts_enabled(cpu_env(cs));
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int sparc_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -986,6 +988,7 @@ static const Property sparc_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps sparc_sysemu_ops = {
+    .has_work = sparc_cpu_has_work,
     .get_phys_page_debug = sparc_cpu_get_phys_page_debug,
     .legacy_vmsd = &vmstate_sparc_cpu,
 };
@@ -1027,7 +1030,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
-    cc->has_work = sparc_cpu_has_work;
     cc->mmu_index = sparc_cpu_mmu_index;
     cc->dump_state = sparc_cpu_dump_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
-- 
2.47.1

