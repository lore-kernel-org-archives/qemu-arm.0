Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1630337lfa;
        Fri, 30 Oct 2020 08:16:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFjgwYDDjlOFRvtNv7skgzJ+FeexzW6r81+kzhVs8WOg6UU0/NzCz2SKBNO8bzOoKaIY1i
X-Received: by 2002:a05:620a:66d:: with SMTP id a13mr2503426qkh.301.1604070959956;
        Fri, 30 Oct 2020 08:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604070959; cv=none;
        d=google.com; s=arc-20160816;
        b=GuOepA/TSHFUL8P0yMeizk8KcdfyzRCgXhIInSd7JYLK4od4VLwXvBPtNBXhC/id9A
         sJni2cWi7R2C0Td5zn0RgcZ9fVlf8x+yp0UQVr2QduOs1JlrjzkTPERgL5N89ZuKo9Ss
         XbxlLm2r1hBcDbZ1gmNTIixyJLuuY3MBUa9jNmbpPQw0FlnfxlEtEJNEHKhKQdnN3xFT
         xu72UUKzb2x2sxuj9Q8K81fN0lPU+jMJN21FAyn4Y4il8VkT54r26A0i8ICi+fUwp0xH
         yjc+ns4oFpnKUlp258CG9OQ+OOQWFonTVx/bjuv7lOvJpSar3NvPjw0QOHG+3/xAVcw9
         dZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=UWbOnVF8zS8gv7LmBg3QTVKJWRhoExH2pis5BbvUm5s=;
        b=ZINsUc8sY47q5nxgn/cTt1o+pIVOBwRHoMnMraZGo2uwQv5EdDaBijGDvgcDVaYuQj
         s46zjvn4fZOR9DG8NksH0kpkjrQd9VrOyAQ4tP8vpQHaVnS2XydyJrrdgOF9o2UavNEY
         XnwmavJcZBUaqavBucF/Vib6zwXQq3B0jOBwbEo4Tgs0zeLOcLHmRoM3q+BNF9bq4qMD
         I1TUDgzuLhUWt1GOgPEHC9YYqmAM7maI5KwxTydnb64raFa0ZiGvUbrXfdfN63eAs5nv
         LfxSu6vpQzaUcibYresaDI1VgCc23Vr0CjV69m0u0F+YC8sDxtSg4NE44RLoF6vfK9WB
         8K+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11si3744024qvb.94.2020.10.30.08.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 08:15:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYW8F-0003In-7B
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 11:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kYW83-0003Fd-VR; Fri, 30 Oct 2020 11:15:47 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54018
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kYW81-00079D-0y; Fri, 30 Oct 2020 11:15:47 -0400
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id CD3295FC12;
 Fri, 30 Oct 2020 16:15:41 +0100 (CET)
From: remi@remlab.net
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/boot: fix SVE for EL3 direct kernel boot
Date: Fri, 30 Oct 2020 17:15:41 +0200
Message-Id: <20201030151541.11976-1-remi@remlab.net>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 11:15:42
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AUquJ1+eB3CU

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

When booting a CPU with EL3 using the -kernel flag, set up CPTR_EL3 so
that SVE will not trap to EL3.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 hw/arm/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3e9816af80..cf97600a91 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -742,6 +742,9 @@ static void do_cpu_reset(void *opaque)
                     if (cpu_isar_feature(aa64_mte, cpu)) {
                         env->cp15.scr_el3 |= SCR_ATA;
                     }
+                    if (cpu_isar_feature(aa64_sve, cpu)) {
+                        env->cp15.cptr_el[3] |= CPTR_EZ;
+                    }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
                     /* This hook is only supported for AArch32 currently:
-- 
2.29.1

