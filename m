Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1101029ejb;
        Fri, 9 Dec 2022 03:08:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf52tfYlmeOFEdVnHq5cKAhlOavj9JG3SEGYNGVu8weNGBSrTju+3t8kurM0+QBd6wpwcDFC
X-Received: by 2002:a67:fc10:0:b0:3b2:ea11:8c14 with SMTP id o16-20020a67fc10000000b003b2ea118c14mr2364048vsq.24.1670584123403;
        Fri, 09 Dec 2022 03:08:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670584123; cv=none;
        d=google.com; s=arc-20160816;
        b=inxc2caRUx/q4isocR3G4Slkjy4WwyeDV02D4AwI5gZFjo0O04A6OlW+5AesuRAnUl
         4SZ9Dy5IB5UzkIiJa9LY4jyJVfOlBxJHCOCiYJ2tEd6hq8F+y2j4MUFfa3bEjIhPbgjT
         gxBezNPYbg6QkRndaP9J6eic4U9U7GFgyu01/9QBpBRS8JhW2sG06Y5KG3VqOuNPIqJf
         4pdBTqhLK8fcHo8TQgK+uRFIqdHH49jHGk1YlaJ+CfwnUAcNI90LCzj7bU5Ei0WVb1RX
         BTLwHcjCuzDxkUZdZCFXJqQTmoEqT/LB5VeuulPb9vY88D7KEHgbkayjL3Ru1F0tY9ij
         uGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=lg2hbJIGbmmNDLWAHuLeniZDxHEsZyoXVXtfI2RWSI4=;
        b=jUb44sO2uCBvZhgWTSRtNbMw3CbEi+sPEgJH/I/ucQWagrUVBe6R8xwVJiAKx/0Qvk
         RJdueEeZMVC5gzzDDWh2SJJz1ff1TqNzVVJK3Ksp+1zH/fzIF221qk5ugZWTxzUeGqBM
         RJOiNwHmet7odKo/iKv3PTbtSyXDYyncm/zc0/HnoXlGHO48f2zCnnEKBHCsm+ofl5Ps
         cByVWxZRJgpSRxr333mQIVlhTFC3LCq2FW1ZYZvx5jVNzVrfAlOGfLfFkzlOzIy6nENS
         Xoy9URIu9sJmHE6TmCV50RoTVJ3GMNhqxh9/DGnK4W5Kxr6ARvAYbmz720AQCq579gRd
         jpqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQN80jcZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea10-20020a05620a488a00b006fcaeaeee52si550630qkb.476.2022.12.09.03.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Dec 2022 03:08:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQN80jcZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bF5-0006Bk-Ek; Fri, 09 Dec 2022 06:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bEz-000688-VI
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:08:30 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bEy-0002mE-DK
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:08:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id v7so3326813wmn.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lg2hbJIGbmmNDLWAHuLeniZDxHEsZyoXVXtfI2RWSI4=;
 b=YQN80jcZki8ydHiJ+d8HtsEK7ScAZqqKP4kQ7f4kh2xRZbXgcYd7zZJpJ0dvLFk4Sl
 OTkg+fbSnPb+sZ55ciOOR/+piOpMrk0mUxN7Mt9MuQnBf0xffdfbBbinU9fnovEDaMMo
 t2ZuIKSnpmfaFnnMIjuOUMTkQ2T4wF9cni2bOpc7UXQP1TpB7I8rGjV7lsxUgIDf5HM4
 0QHpEn+882M+H7EJBSe1TjAKVtqmfBQQUB2+EJSraucaJhvkvJP9Nid0/6qU74ALUZSp
 gNhSKAhOxbhYNVgT7HabN+e7Qv5wtImmF5RP68/5DvseBMAEMnAa5hpzFmivBkaUfyl0
 TF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lg2hbJIGbmmNDLWAHuLeniZDxHEsZyoXVXtfI2RWSI4=;
 b=JbuIxbNrkYwHnZwV/cpAfX/fhTdOLbGGKH1NRA73NtqO3rNIkh4jfd+ffHtI5WVPQq
 5uc+8XcG4bC+4bVcQpq5vdX9eL6QH9lE2/eDGD7YFWAhJWNXP6c5aYLVm9w1N6NV5yPF
 T2oK8sBKPUvgLRtrYnjg08WlHM+QDBfRVef4XxASMJ0yUDVeySAls9Ez8zsaJXxW6MvL
 EJ2v5SBiYh654MQsB+a4GE633mYX1QGcimJM4KpaUoQ7POwdD131wR2IUAABXrOtC1sQ
 xWnHP937iAAyM2KJA8MzaNL4WrwZ1oJV3htMktMICclhw/GUxspude2sVjwS0k0aRhZs
 osfg==
X-Gm-Message-State: ANoB5plqa40uwdsxoTkpG75e+g2k4fUgS8S0J3yeNq+WB3ccaV88W47j
 QKoqR9BHfa7X5KY/RPwiTutno0Yu9qTvIg8Y3JY=
X-Received: by 2002:a05:600c:3295:b0:3cf:6a51:2e75 with SMTP id
 t21-20020a05600c329500b003cf6a512e75mr4482085wmp.28.1670584105035; 
 Fri, 09 Dec 2022 03:08:25 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c2ca500b003c6bbe910fdsm9787199wmc.9.2022.12.09.03.08.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 03:08:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0] target/arm: Restrict arm_cpu_exec_interrupt() to TCG
 accelerator
Date: Fri,  9 Dec 2022 12:08:23 +0100
Message-Id: <20221209110823.59495-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: m6wAjqunY3p6

When building with --disable-tcg on Darwin we get:

  target/arm/cpu.c:725:16: error: incomplete definition of type 'struct TCGCPUOps'
    cc->tcg_ops->do_interrupt(cs);
    ~~~~~~~~~~~^

Commit 083afd18a9 ("target/arm: Restrict cpu_exec_interrupt()
handler to sysemu") limited this block to system emulation,
but neglected to also limit it to TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 38d066c294..0f55004d7e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -528,7 +528,7 @@ static void arm_cpu_reset(DeviceState *dev)
     arm_rebuild_hflags(env);
 }
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
                                      unsigned int target_el,
@@ -725,7 +725,8 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     cc->tcg_ops->do_interrupt(cs);
     return true;
 }
-#endif /* !CONFIG_USER_ONLY */
+
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
-- 
2.38.1

