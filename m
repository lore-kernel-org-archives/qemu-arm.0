Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp288266lfo;
        Thu, 28 Jan 2021 06:54:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxurICmjKtL+5LwzNXKBU/acKd9u9NtSkizTu0RwWdYGgdlGEH+anWlRsnAzjRCwjd7Nn0d
X-Received: by 2002:a5b:711:: with SMTP id g17mr23126879ybq.197.1611845661547;
        Thu, 28 Jan 2021 06:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611845661; cv=none;
        d=google.com; s=arc-20160816;
        b=CaX3KIvRzXz6x9ungtOvoeo4t+k/5FcgLThQLr9yS/Y2eLzjpXhecfbWjqIcCwYzfA
         0/zy/G6OF965DkJ9X0OhEaeTpq3zLRIkG1cqZoy0tv14m+oLi3ZsNKUj5I08/tsZ5v9d
         yDqdHp5heh++PUMW8HEIjkuKlAN5nD/oT2wKda43beNrsL0fws0DC0J+dnYqCfwXfLvN
         VKGiUjmrXRQaWgBJS29+AUKvvU/66VKqJgS/y8625dmyC3ldgLwr3uHcTmCimVkZ2gIg
         TNI4HGDSfMVPThT4/MuyezohSalJnHJF1OvbclEP+ZNfACUY5f2HQpa3GjYDys9qzBLm
         48nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :mime-version:references:in-reply-to:message-id:date:subject:to
         :dkim-signature:content-transfer-encoding;
        bh=WLf0qVfx/aw/gBN+uxHGigDzdAlrFc13ZKO1nsSReWY=;
        b=ZbbbOOfPh6iaVizfir96mKLI+ZqIFr4Kyfhq68vk3955aqXLHxOvnc+rjBfE0L5z9V
         mHhD5DE7tRZg6kNyQ3jAPzDclN36cY7SCUiIwNT5oDszM4jqagJCMlZf1VGtLXCI1zqe
         yU2PLsZRZorlwyCB4n7XtH+/zf0+hwVgrjFu9JJMFcNh08BZacK3o1KZ4lcf/5DznmOF
         KsQk3P59fk0OcwzrxL49wXKCV3f1wdcFtv/TPZBYLGZLvao0jp6X6RwB53HjnrMCTkF0
         st35mvYXNKgWRJtj2XSQ/apFr3GxEMQd0RJup9hM5j4l2BqnbZCd/r0FnQgMz+fGhIO0
         cyqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gtri.gatech.edu header.s=unifiededge header.b=flLeISIF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16si5323266ybp.314.2021.01.28.06.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 06:54:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gtri.gatech.edu header.s=unifiededge header.b=flLeISIF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:54266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l58ge-0000NE-TU
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 09:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l58ZO-0007Xz-IR; Thu, 28 Jan 2021 09:46:50 -0500
Received: from unifiededge.gtri.gatech.edu ([130.207.205.170]:28786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l58ZM-0000c2-0Z; Thu, 28 Jan 2021 09:46:50 -0500
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=gtri.gatech.edu; s=unifiededge;
 c=simple/simple; t=1611844301; h=from:subject:to:date:message-id;
 bh=w/EyQalOWuVWocDQhP95aCvyNFJVs0DYo9EJN601YUQ=;
 b=flLeISIFqKBUHRaHsrxqNnIlUwKDKvZcdrH/m5LurAIsOJyMAPFB6t82xabk7DSBCIq8cagn7rR
 TGYUXztfF8VaSrjpiKVZXMKqVBkDTCLJI0cIzIq4oRhbIWm9rhBdWlg+6PfnDJtTMA1Q+3A5Ck5Ef
 0/MiCkp3N3lTy18+MqaIEudGNqZxtNvU6R3PNyR4jneXl/Eg5zy7ME/hISPCxj8vQ2iRa3TpIZr4N
 gCr2XBENOSGCiTSuvqnddKuUNZz/JfXRwbHFa2NCZKbNUUMFHDpIxSJ9zK+THWOZWSN+RcwWideU3
 zxufOLKIrxAnXgm4IT12qsCdArRueIALxptw==
Received: from tybee.core.gtri.org (10.41.1.49) by exedge06.gtri.dmz
 (10.41.104.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.721.2; Thu, 28 Jan 2021
 09:31:41 -0500
Received: from localhost.localdomain (10.41.0.30) by tybee.core.gtri.org
 (10.41.1.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Thu, 28
 Jan 2021 09:31:41 -0500
To: <qemu-arm@nongnu.org>
Subject: [PATCH 1/1] target/arm: Add raw_writefn to SCR_EL3 register
Date: Thu, 28 Jan 2021 09:31:02 -0500
Message-ID: <20210128143102.7834-2-michael.nawrocki@gtri.gatech.edu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
MIME-Version: 1.0
X-ClientProxiedBy: hatteras.core.gtri.org (10.41.22.72) To tybee.core.gtri.org
 (10.41.1.49)
Received-SPF: pass client-ip=130.207.205.170;
 envelope-from=Michael.Nawrocki@gtri.gatech.edu;
 helo=unifiededge.gtri.gatech.edu
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
From: michael.nawrocki--- via <qemu-devel@nongnu.org>
X-TUID: 4YvR6PKIDvoT

Fixes an issue in migration where the reset value of SCR and the value
produced by scr_write via the writefn for SCR_EL3 mismatch.

Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2ead3fcbd..e3c4fe76cb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5785,7 +5785,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
-      .resetvalue = 0, .writefn = scr_write },
+      .resetvalue = 0, .writefn = scr_write, .raw_writefn = raw_write },
     { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
-- 
2.20.1

