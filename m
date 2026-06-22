Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E87CDB46F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 15:43:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbgnd-0005eo-B6; Mon, 22 Jun 2026 11:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yisooan.dev@gmail.com>)
 id 1wbfrS-0006ej-SY
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 10:42:54 -0400
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yisooan.dev@gmail.com>)
 id 1wbfrR-0002W9-FB
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 10:42:54 -0400
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2c0aa420401so28023715ad.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2026 07:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782139372; x=1782744172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLCOumI8xlezF9WytHpWj4JZYwGJnn+HP3QxVV+wd00=;
 b=epp3E0egUmXVQhtJPGbLJn9Vf9+qIVYXEsFi5OK0rx5GmIi4yzW7XDRhSE3n33MaKh
 kUsUPU+Jh0lt6cAuXOet0Dul2saj2EidoVlAyR8rSBO0Nbsi1KffVdhrX3fBCESX9a8k
 5w/nj16b34mq7+11gzgGTdgN7rx+Y+vFUKAItFLq9mfZSl+X7LJx8wQFIzfSHRvYrak2
 eAMU9+ra1l7Pgi4yzPoOshR4envOpq6ProNwf6mroEusbrIH0Ul7PxSK4eD2Ay4eb/u+
 jVX3+yQ9eo8RjUzhg2wrRrAKt5cI3kpvDlm52ahYI8bngr8CC433lc0wdjS+Rr0clWck
 UX1g==
X-Gm-Message-State: AOJu0Yxq73R6HZpIQgbh30OW6YqpWS4Hd/IyIxsGnPt4QLare5PkSh6F
 SXq5OP35u74ZOEA+U1Jafkf/cLoSmLck51SWujyuHd+0zPvliear5MJU
X-Gm-Gg: AfdE7cl7oo/orjpbs9R4wkzQl81gQLp1TwpDpjzHBCUIjUM+/pKAejRvFBZd58V0C3y
 yGm4Nbynt4AL2Wb8hdskicHc51XEGNclzUUyGz67n/MjoJDvzSPVS39yepDuZIYa5FPGljiSZlc
 ypin8V773pYvxwzml2p9bHk0beEwEUOsHjxjfcKfYCVbGAaCITBBPPtCnpLM48F5lA6F9q3PHis
 ioXLXY/kxVNdWHN63Ill29eV///xnKL28m/QneuyUmAObqmweLrPsNqLxTG2ZarecAv1A3DY1oh
 ii2RC0IzfL3aW/xa0yUEyUDMjyzwrlPB1iOye7Ybx9Ibvd3iI2IO2H/tB2+SySjo90sM85FGPg9
 GmbNyq+7L9t0nHbhWVrbsgJYZzd8XyjPE+J7dKKaXewIf0W9d81hFyLR/sv56EB4Bb9Qd+4hpuI
 YbHj6qnya1VUHe1hDGE7xM3t1yGiHnSYdCUSn+h8dqgTVQtg==
X-Received: by 2002:a17:903:ac7:b0:2c7:9b17:668d with SMTP id
 d9443c01a7336-2c79b176c3cmr39962755ad.2.1782139372004; 
 Mon, 22 Jun 2026 07:42:52 -0700 (PDT)
Received: from localhost.localdomain ([1.213.237.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7439f8cfbsm78955285ad.45.2026.06.22.07.42.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 Jun 2026 07:42:51 -0700 (PDT)
From: Leesoo Ahn <lsahn@ooseel.net>
To: agraf@csgraf.de,
	peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Leesoo Ahn <lsahn@ooseel.net>
Subject: [PATCH] arm/hvf: panic the guest if an unhandled exception occurs in
 el1
Date: Mon, 22 Jun 2026 23:42:45 +0900
Message-ID: <20260622144245.55013-1-lsahn@ooseel.net>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.171;
 envelope-from=yisooan.dev@gmail.com; helo=mail-pl1-f171.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 22 Jun 2026 11:42:54 -0400
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

It's better to clean up any resources that the guest taking and quit
if an exception in el1 could not be resolved.

Otherwise, the guest would get in the infinite-loop black-hole by
unmodified pc.

Signed-off-by: Leesoo Ahn <lsahn@ooseel.net>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8b902c6882..4358cf90e8 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2533,6 +2533,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         cpu_synchronize_state(cpu);
         trace_hvf_exit(syndrome, ec, env->pc);
         error_report("0x%llx: unhandled exception ec=0x%x", env->pc, ec);
+        qemu_system_guest_panicked(cpu_get_crash_info(cpu));
     }
 
     /* flush any changed cpu state back to HVF */
-- 
2.50.1 (Apple Git-155)


