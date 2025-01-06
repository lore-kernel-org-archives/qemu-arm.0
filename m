Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp11948311njk;
        Mon, 6 Jan 2025 10:24:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUoJoKpHIV06KwFBH1g1SjmCJrlvEPr0VeluSwHtE6TMv7GzlMSRAnC0vBuinodH7mkRZ4J9YAUZTSe2Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHzP9zFOuosb5HjPPEW0F6Aeg5+JLu4wyh/PTSawe3t5hbM9B276S0SeI1iULusHoHIw8fL
X-Received: by 2002:ad4:5e8a:0:b0:6d8:9065:2033 with SMTP id 6a1803df08f44-6dd23397e70mr932187566d6.31.1736187861212;
        Mon, 06 Jan 2025 10:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736187861; cv=none;
        d=google.com; s=arc-20240605;
        b=ImEwYdcba43LP2bBLA7DFF+2olkXXKr1OQEYkSD2jG5OkTU93NlI6wpcCsau18xzJA
         XjYW/8JjM7NadlS/Sk9oCSRe648bDX1GIYqmko/O0kxu/0X5v+eQpSjt9WYqQNYRGXFG
         HWsi+FGeWU/yGqR22N1YI1NQS9359bonx7EgfJXEIuTas8buaDrgnzZwjE4zbW9bhmNG
         iPnGX/w99rSx4Nb5KBRNaC1sx091mGXpsQjwkNoZ9GF/D7oj6mucMFo6qKUuyxfFkMVa
         WoZEzHjxmQe2L0QVnk+AIImi1roBrRk1cn+RvgcdAMTxV7WK8Ij9iWx7j4kOQWtz3ah/
         wBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Zc910N+AlVa8sNqkW1fDdSYDbUFhwPoB/5c2YYYivWo=;
        fh=Jp+sOmRXwRIM/x24jAHlPH0ZULPzc92S42QjCEB5TQk=;
        b=MUwL9cnX7H8R07HZIcc+nEFOu3Qoul7tQEa9qmwWu9YrH2GdG4rOZ4dhVAX8l8S5qU
         PfbZgJxk1pNP4k4L/+lrJ1snVTlCGCEVrZUwPCjRMCIuMQVJd/9Di3tMjyMld4XTuRYn
         E/W1TgzUPXKb88yBTkL5i0C0vohyhGwY6eFD/lMuQ/fEmaf6izyrNOixXKtPQ2TplyfK
         iMCwT55ItLI5yjsbdlCVBpPfBCWJpZLhkLku+szIKlZm5Bo7JjhSaVX0nii+n1cIHn9n
         pECVAgnq7u2bWGqH29Wrh4sWQHzidEud55ETOxGg7sAc4uaMJtx8qR2BClkfO5Jlez3u
         yN0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NwAnbMoS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd1810c3d2si437785136d6.91.2025.01.06.10.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2025 10:24:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NwAnbMoS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tUrlY-0002jB-H5; Mon, 06 Jan 2025 13:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tUrlW-0002ij-7n
 for qemu-arm@nongnu.org; Mon, 06 Jan 2025 13:23:50 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tUrlU-0001ns-1C
 for qemu-arm@nongnu.org; Mon, 06 Jan 2025 13:23:49 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso7881561f8f.3
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2025 10:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736187825; x=1736792625; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zc910N+AlVa8sNqkW1fDdSYDbUFhwPoB/5c2YYYivWo=;
 b=NwAnbMoS8EVZwgyU0zwQzcyGYGb+FL2nLGAXcydvmnBi16rLdAG3o8hnV3bjcxTxkP
 EHyFHTAgVI57zoWmk3r83H97MICZZqnlNvxw3KZrZb/6j6bzj8nZz6VhJRTWy+wG7MyB
 socDObxC0USZk6MxUdpVNftaTWb2SQradhnVZKWYkc7FPTrXlegvOhpl+XG/jMgRbVYa
 1y3ELcZH5RbChOwF/x5vGDQFHQLnjr+ODuDlZGQBVaabdC5SgcK3toiyW+u4PjtVjjrP
 9b5wyBL3VmTPyI6zWeundABw6bBjA47F2+Bvj4JaMPYuaIEkV+jBgnhQWww0XjXqI0lp
 lEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736187825; x=1736792625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zc910N+AlVa8sNqkW1fDdSYDbUFhwPoB/5c2YYYivWo=;
 b=d14KODFjjAIyTLsElQ+l0zmJgxvdrVo3tUWlLzeJiatCK/43W1RN1M99YHS+sTFn1h
 /0+Kt7JkdvL2uWuXhlviTozxdMx/6xhxYnrDlaW/WTCusaRJy+3jvR0apuVx52kgORtH
 Wm+aIJADyB7kSvxfnf9OqiAlm4i1bVc9/bIXEfCQzDBwRK67pXLawNvUQBoxwRk3kcHk
 +uM2XZ6Oe+EVhuWPa26sbu9v0tiQEBjs/2QNnEFq3J71vvV+PR/UXeM2+MlDjxxfEizo
 uZ4Gtdx7YXjA9gZIgcEYtxeDuusga5YGKYofZofDNjTm8oekQdhwowaGMyit/LQ1eUH0
 l4pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQLNJhGFV7ctdH+9ypg2h31KZp1UoYtOo5JCNf+8VFZBl3b/RidZ9Vx2IHNw95dC+2FCo3CUdNAA==@nongnu.org
X-Gm-Message-State: AOJu0YzMTcYZyAm4el2EXDM9olUqctsg567zKIHkuIdvtb2gQX0AxHvP
 1tLGtS7BvTG+3lCP5tLvOPUtvRvCeSf22xaH93SAUy/eSiKoLAwjE4nF5WqG+0Y=
X-Gm-Gg: ASbGnctfJrZyYRktrNtuxbGkmbYWOJ5hYkRgWBPjQCNFBDduLJxxL0jv/gDeCVu90ND
 8W9v29DVgAmgD+ktMkP1mVvwH7pF4g8yI7FZreGAexOLZK3nI7tBCs36ruxiVFVoTtUNKzAjCHP
 uW2OFtJ7xvikJk6ZXhC9cT4hclzZ5MS3O9e3GFCgzPIlPnjepm1Zb5ZK55QL0eivZvnVuwZeVWK
 923hciRA+dE6ZN1lebK5oaKtNe/9WqL2nF/6KD8c/xIieqVZyCHxKckEMxmpHWSYc20SB8UVynB
 Wiec38OImWn9Z3dNn+NiZwzEffe3k9Y=
X-Received: by 2002:a05:6000:144b:b0:385:fb2c:6021 with SMTP id
 ffacd0b85a97d-38a223ff339mr54211455f8f.39.1736187825609; 
 Mon, 06 Jan 2025 10:23:45 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acc02sm47920579f8f.104.2025.01.06.10.23.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Jan 2025 10:23:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Eduardo Habkost <eduardo@habkost.net>, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH] target/arm/arm-powerctl: Restrict to ARM cores
Date: Mon,  6 Jan 2025 19:23:43 +0100
Message-ID: <20250106182343.35859-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: dvMSv55f5q7T

When running on a heterogeneous setup, the CPU_FOREACH()
macro in arm_get_cpu_by_id() iterates on all vCPUs,
regardless they are ARM or not. Check the CPU class type
and skip the non-ARM instances.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/arm-powerctl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index 20c70c7d6bb..a080a6ab79f 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -36,9 +36,11 @@ CPUState *arm_get_cpu_by_id(uint64_t id)
     DPRINTF("cpu %" PRId64 "\n", id);
 
     CPU_FOREACH(cpu) {
-        ARMCPU *armcpu = ARM_CPU(cpu);
+        if (!object_class_dynamic_cast((ObjectClass *)cpu->cc, TYPE_ARM_CPU)) {
+            continue;
+        }
 
-        if (arm_cpu_mp_affinity(armcpu) == id) {
+        if (arm_cpu_mp_affinity((ARMCPU *)cpu) == id) {
             return cpu;
         }
     }
-- 
2.47.1

