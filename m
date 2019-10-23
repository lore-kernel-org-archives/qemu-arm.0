Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1040596wrq;
        Wed, 23 Oct 2019 08:28:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLsFFPtPoE0LwmKlVE8yDXnifQlD5KD3HNu5FObrvC97OryJBgwtL7fpQepUdyuNWsDVYK
X-Received: by 2002:a05:6402:1492:: with SMTP id e18mr37566388edv.140.1571844527816;
        Wed, 23 Oct 2019 08:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571844527; cv=none;
        d=google.com; s=arc-20160816;
        b=kD2oXTK93RlfrL4XWkVvcLzek2oHpcXNmxImHI3zQ2D5JFQN6egAbiEaOjK2ASPQb7
         V+l8hIIEtPna8BtsUDvhdax65Bru5w9UkwZydEbMiBIt4eDEzXFOkEvBbp99Wr3Lpuar
         OX+vhJbtjRPkHASDTaNf6QyEWebQFMoIxhxjqN0ODGPfA99ADOV2ZFP43V9Y3f/P4T8J
         4DA/EPZN4HY2ZKfTMiIQKbFoSNdnQosh+S1ftgCkWQFq7kk45giN/BlrpVJbWCbPwC21
         poxwF1eLoCSZyEWEkEedTRszyUoxbLKgazLiasZZJeKmEF+LdhFKx9jGlB8Ioz9SS7B4
         p1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=uBYls1SEkoMOURVj/C3yUJq0TivKPiwCZV3WGA+/blg=;
        b=xMTxlTeaF2R7xoH/Ls5Q8wuT1Px2mJ/aNdZM0ee2sWKCa6pHE4u2en/uXHmE+yPBkg
         KqFULjIeus5dMwhm34n5dopNThLPUYJqRGKNvh25zicZ5bFx0HlDrD5vAPkLs+QwEpBw
         To3zxBO/bu0qrbtnkgumO9JzdTxD3n8iJb9jERFCvhRKsramYz3qWm6xhzEuHVBfr4rq
         v9AKZKUeGAzNJTHomdNjfXhK5Cert39EryVZYoVImkAqzEMreFLNZmA+a1C8DTotxa4+
         3Cyfm2IV/rqWj//N8DSCxIisfXp4NZowPoXJoieGvQU6/WgtHCrLqKNlWwZe5MuWW/U0
         lnTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jX7BbMZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si14111452ejn.192.2019.10.23.08.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jX7BbMZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIZ4-0006ZS-Pl
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8v-0008BN-3o
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8r-0001Gf-OD
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:44 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:38204)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8r-0001Ag-Ih
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:41 -0400
Received: by mail-qk1-x744.google.com with SMTP id p4so20047088qkf.5
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uBYls1SEkoMOURVj/C3yUJq0TivKPiwCZV3WGA+/blg=;
 b=jX7BbMZtmCMcQNAA2JyC6isSAjc+uHKsYPzLSkyYxQgRloKo42DLTG2el1Pwy7imCD
 c9eiFdTNnoxf7+6KQUiKcQDjBaDlGXbeDOOq1a5hMcR4PF9SEeeHXAjNZlavdHdnohSA
 bzHeCUYYPhi67/lGkgfVTnkE2nsbg8B5aX3RbNaszoXSBi57+5WP74ubw5Bwe1bSe8n/
 /gHB3Tj0jR4d4nWsuoNI0Ium1zSjP1SF6wk1kgXNhL7o3wYmzyOzdiVWuSE0ThUWxOxj
 bmYckK8vgNfJtWX6FGtPLMxneKPIv2sGvgebn7RciW9zPEmKHZCois8utIQdhpoXp54G
 UIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uBYls1SEkoMOURVj/C3yUJq0TivKPiwCZV3WGA+/blg=;
 b=Cl/bgFj8g2rdJMAO4wUvyIh9Vnug0Vi6ZdK1hWM+1rZ0MIR0GaDiAoBHjzwFlNo5i0
 /ztH2qFbVtHApQyB+mMHz0LDdYtFkdLZQypXVdSswnWEQLguSuk55uv+0gQnMvB9xLTp
 wlaX9h+t0p/YuCnDst70xamoTHMDGxtngevoGurnL/P1mlZHR4Pm7rylJ0XpGhFDzjkm
 ea4tda6fjMPuT5Q7atIlTpMxne9yZTAtbEFOv2BqgP6IM58ukfkcPC7Mq7GeRW/3szaf
 FxQoErvJVfk+7COv3lwBmlrvhoQMj05e6SfxfK8f8z6DlXremZv1cbnemMw6aJ6Q83Tp
 0RHg==
X-Gm-Message-State: APjAAAVdZFXtjrGpxLcGeh91T0CI8+471snmPoYV1oAHVaLveS1jshh5
 G6aTxQMI8BusaV3JiczscMyFVg==
X-Received: by 2002:a05:620a:204b:: with SMTP id
 d11mr8974408qka.379.1571842891810; 
 Wed, 23 Oct 2019 08:01:31 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 22/24] linux-user/aarch64: Rebuild hflags for
 TARGET_WORDS_BIGENDIAN
Date: Wed, 23 Oct 2019 11:00:55 -0400
Message-Id: <20191023150057.25731-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XbtIT+zRR4Vp

Continue setting, but not relying upon, env->hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 1295fa8531..31c845a70d 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -173,6 +173,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     for (i = 1; i < 4; ++i) {
         env->cp15.sctlr_el[i] |= SCTLR_EE;
     }
+    arm_rebuild_hflags(env);
 #endif
 
     if (cpu_isar_feature(aa64_pauth, cpu)) {
-- 
2.17.1

