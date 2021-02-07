Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp718509lfc;
        Sun, 7 Feb 2021 15:24:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcKGqQ6oyYARmPT+W/JgWA0gV8PaQ44jo+Xu6GHCa7CZk9t2uGlnBp3rdp4OvBZlXl1vWW
X-Received: by 2002:a05:6902:706:: with SMTP id k6mr21274355ybt.52.1612740251031;
        Sun, 07 Feb 2021 15:24:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612740251; cv=none;
        d=google.com; s=arc-20160816;
        b=D054Jrln0pll2yv5M+RBvj09C9rzyCo2G4f5NeFJ4Dm4xhmroECgmYzEKzmoYtt8jS
         oD/V9RgoTRB/O7Vh90bcIAIm0PJLLRlRtLZXrBZp+EK7NGKJqZJ/G1wYOMn8gJSIWU2v
         apXjRWH33VYx+DNpzjf0YNMMowmptmROohk+aN94fsoysGVc1vxnfgi/ZQxEzAl29W4r
         dyny7ZBO7g2bHGIz7bK5mB+vyZHnEFD6jYjE8ls8z5BT97hWl1/sBt/wCs0Y9SDZ+Yqf
         pL2ZUUfgXARKTPG8z/C/aEFukrxP5vPOehFOh2dOtXJEHoZwuBuXlqAUaw3Vv5imKEce
         Gj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=H7DdpVZKuaTFU+QINWMbbbomeFKhPW3S4eDxwf+nJCo=;
        b=CDHb4zyZg5f1oaSdIup1r8c0QB5VbW2tZ+DH1UN6z5QF9xN4SrCjFmGwAsZS2/FGir
         ArlL2koN5quAPDaQ7+lK+wxzQvyjNrxQjM/F3u6fMLNh6rXi+YMMXX0igucUyH3cte7N
         MXAXmUeRPm8tCMeiX1g/V639bs1HDEQ+QeRHUh+bMzuh+kgbuTx/rwWN4JF6FUOy5730
         pAHNkc48C9EaKMKEJFf2LKlLbeRfbhVUT60PlY1hjeiwW8kAjrEKYyIz3spYGeP+9GnZ
         oLLWBzKTcijVboh0nNM33tUIPp3Mk3CX8p4gLFV/+SADzzbEiYo+vXA8UpuWTuAozW2o
         wjcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Cbe0/5Qw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si16335358ybp.142.2021.02.07.15.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Feb 2021 15:24:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Cbe0/5Qw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8tPW-0008ML-CP
	for alex.bennee@linaro.org; Sun, 07 Feb 2021 18:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tP0-0007o6-AZ; Sun, 07 Feb 2021 18:23:38 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tOn-00018J-Vg; Sun, 07 Feb 2021 18:23:38 -0500
Received: by mail-wr1-x434.google.com with SMTP id g6so2132025wrs.11;
 Sun, 07 Feb 2021 15:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H7DdpVZKuaTFU+QINWMbbbomeFKhPW3S4eDxwf+nJCo=;
 b=Cbe0/5QwUe4ZyDD3MCWKIRYwfN9+3L6rNnWC2TOjH7OXHTThDg2a1ZbJVNQ3Kzf3st
 En6PUVBxAp4PxuocUpThjh2BUbXwmj4TsUAq7zyP/wF/zcmEyBp7UsQy6xsrBppchqPb
 xaKn+OA362o9B5Pfn+32MFxsnEaxvQmoexp0yQS5CrniIOSwJ9UVILT4OQ0YV+l4a8zb
 UIDtHmQtVDPxPhHTOfcOKsjj00ADyCFI+YiUb6EKu47ho7vr5MjQQly8zmSOk2hxHeGo
 q0CgRJRIbHzG8ADxnWIbKDypHAzL8Wkz7WT/WiLYiSMgUGkKHqucN8bPsg5DIZX6MVT3
 KL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H7DdpVZKuaTFU+QINWMbbbomeFKhPW3S4eDxwf+nJCo=;
 b=TXLaBtazlv7gk1LKmfgk0aEeTq0I85n+i246bo30W1tcbqw/aT93yodk3JHPmsON4R
 KNm07i/lVfAvmD+yAETYilkSEmsKODk+XcVbShmv5NGg1R3v7k+oZ5BJEJTCA1rPGepu
 ZSfOOFs5Mk06JzMIYuA5lVvJh74yRzv6n3YvlQ0hVdwcJxNQ6yosTPgS9vk5ICax6rcK
 UfSD3GdCH2bddODEtfrtk7EOIVycg8RgfICSe1MydWMCwJCAyA2wNfLLVURq2+DLdqKY
 bD4aJuJ+HCjK/bL7f1wEIwWkPn5IuaCnKWcaPAL/zyD0HITS0+1yuMAIXa1W0+hDV4oX
 CVIw==
X-Gm-Message-State: AOAM531yXW718cgq7dGg4/E/KGw4w9lpfEL7e0clA4K/yrVlHYHBDiRQ
 pbjBVc+a56hLrifgCAO7V08SvulzR+Q=
X-Received: by 2002:a5d:5283:: with SMTP id c3mr16559778wrv.319.1612740203868; 
 Sun, 07 Feb 2021 15:23:23 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l1sm25605825wrp.40.2021.02.07.15.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 15:23:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] target/m68k: Include missing "tcg/tcg.h" header
Date: Mon,  8 Feb 2021 00:23:06 +0100
Message-Id: <20210207232310.2505283-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207232310.2505283-1-f4bug@amsat.org>
References: <20210207232310.2505283-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 307Nso8qlBbY

Commit 14f944063af ("target-m68k: add cas/cas2 ops") introduced
use of typedef/prototypes declared in "tcg/tcg.h" without including
it. This was not a problem because "tcg/tcg.h" is pulled in by
"exec/cpu_ldst.h". To be able to remove this header there, we
first need to include it here in op_helper.c, else we get:

  [953/1018] Compiling C object libqemu-m68k-softmmu.fa.p/target_m68k_op_helper.c.o
  target/m68k/op_helper.c: In function ‘do_cas2l’:
  target/m68k/op_helper.c:774:5: error: unknown type name ‘TCGMemOpIdx’
    774 |     TCGMemOpIdx oi;
        |     ^~~~~~~~~~~
  target/m68k/op_helper.c:787:18: error: implicit declaration of function ‘make_memop_idx’ [-Werror=implicit-function-declaration]
    787 |             oi = make_memop_idx(MO_BEQ, mmu_idx);
        |                  ^~~~~~~~~~~~~~
  target/m68k/op_helper.c:787:18: error: nested extern declaration of ‘make_memop_idx’ [-Werror=nested-externs]
  target/m68k/op_helper.c:788:17: error: implicit declaration of function ‘helper_atomic_cmpxchgq_be_mmu’; did you mean ‘helper_atomic_cmpxchgq_be’? [-Werror=implicit-function-declaration]
    788 |             l = helper_atomic_cmpxchgq_be_mmu(env, a1, c, u, oi, ra);
        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |                 helper_atomic_cmpxchgq_be
  target/m68k/op_helper.c:788:17: error: nested extern declaration of ‘helper_atomic_cmpxchgq_be_mmu’ [-Werror=nested-externs]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/m68k/op_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 202498deb51..36b68fd318f 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "tcg/tcg.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-- 
2.26.2

