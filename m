Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp718581lfc;
        Sun, 7 Feb 2021 15:24:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZXvfI0e3JHGYVF+5zbQ9DiejfUSr7CyA/ulNmylfFRTFPcAmvSNRNHf7Dc3GnEm2PxLhC
X-Received: by 2002:a25:8590:: with SMTP id x16mr20700588ybk.435.1612740262813;
        Sun, 07 Feb 2021 15:24:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612740262; cv=none;
        d=google.com; s=arc-20160816;
        b=Lbi1SipcmhJSehlM6XBeQ2UTO4GzGbDRQNWvvpxwh4SypLBX6LaKzH+wVHk0WA2ZJE
         yBZ00b26KDG/5Dlcczmf7RgLR+LOjXPfXXim1/zaXI+hmHtJSSfH2GxV6AeiPOanhAfM
         9p4b8kEzL6/sm/CZ4hOaJ7pkI20RnNfpElbUf+iPx+0qhMk26tPOYju17OMJoDCOTJUz
         fnmxXkCTgKbsPday1bvZnpI2HunclQECZIgU+bGkpYminMQWkeXZSwKwAbjQT3zo5tBk
         o+LA/B+5wez9wlybm77vXvfwHXcPbNhahtuNQO9v31uH3T+qumvH2lw1b54LJZczx0An
         YS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NB0PxeiyUnyh7a2jT9hNZ8p231d4tVFomh4sbxGsRA8=;
        b=0ROgArg0yPigQxFlhUy3Ma69eD87NfqnsM1u8wV+kemLT8rEtXnmOrq//1T2OmtLgg
         iIfzAFbir2vvFuDepO85VYzWUifzLPHzlnyHrULtBFxwuNDNf+EBixJafgSiEUmrD9gB
         cwqEnZc+Lm1pcCjVPnm2xG8bV0XHidrKMr+ozKY5hthNY/X2EXYocLupm50zpA0oyWFg
         s4oEJBEmhaqgN7105dab5iQ7oQSgdFhxyiM8w+bSDMUVIr8sinP2tWbG/fxwnOeyO15c
         sGB7UaEzG8X1YV2n35tBjUi9m4NVZBp7E9z9iO0c29LhouLIpGt4gP8ZQ9lvBqjxn6a6
         W60A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="H6dm/1g2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si15477278ybj.201.2021.02.07.15.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Feb 2021 15:24:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="H6dm/1g2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8tPi-00084i-7w
	for alex.bennee@linaro.org; Sun, 07 Feb 2021 18:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tOu-0007cy-VF; Sun, 07 Feb 2021 18:23:33 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tOt-0001AF-D4; Sun, 07 Feb 2021 18:23:32 -0500
Received: by mail-wr1-x435.google.com with SMTP id g10so15171303wrx.1;
 Sun, 07 Feb 2021 15:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NB0PxeiyUnyh7a2jT9hNZ8p231d4tVFomh4sbxGsRA8=;
 b=H6dm/1g2ElXpRCdyGyvOLm4dKRdC6BeKWByg/dXiUz0knV2bgWzJd3p7kpSMk48iUj
 n0YgH4Mi06hj9k34E/GnUesKNDs2zXLHIY2a403RiqM/29KiHeHOfIrt7Eru9EIavz8F
 2vBeGt9jCLeMEBHZtC9XBCbJBitHKeb8N2hdWhxlTB3LdatBjksFWjR3jwVSgVbGyGTc
 +GUX9kmB+ZzY9XmyyCjpzeQYAtrvw/3diNFHUWKzGwOAlYQ0Pvx80vzkjfMiY0C5FY+2
 sBWm1dY2uowJxUj2hcDyp1SbD1RLCBzO+u5ylJ5C8VsTboAptYR0Gq9PQYentVq26HUp
 vlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NB0PxeiyUnyh7a2jT9hNZ8p231d4tVFomh4sbxGsRA8=;
 b=WppPWDLDR46c5wZ46otFtMh3AgHtDcycVGVjSYlLiUN+21zvk73mED1mZOE+DyIObX
 2Uj6NaaHUgVkz9e0hcRwHBDmu8o0x369iempXVSmpwBgIrhGrGjMFfu1okZuoj3J/HB9
 w75hhQoXwfy+oYs2YQs1hcPhxc7+TQWQZ//XIz4JoHi4mRuOZ/4jcfC17Cvo9ipvyxES
 gkkms/vCUYU3bRuh1XjCtgi2fldTiFmF83y/yIjZYS6Uvwln/dIQVml1uX8PyRt8vPWi
 6OsN9Bygc6utAsX3VtgHMfqSxcEKJ+5slYztr60Oel+zH6K6bClhxEfSx4CbWoz6Birf
 17WA==
X-Gm-Message-State: AOAM533+wK+ad9DdwIdJcIrJFGT43jhVL4FckH6bSKN3mEni3v6qDNzk
 UxTTfMNiQG/So356Y2S/US2Ubk2Lj60=
X-Received: by 2002:a5d:4292:: with SMTP id k18mr17223984wrq.218.1612740209256; 
 Sun, 07 Feb 2021 15:23:29 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z15sm23614358wrt.8.2021.02.07.15.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 15:23:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] target/mips: Include missing "tcg/tcg.h" header
Date: Mon,  8 Feb 2021 00:23:07 +0100
Message-Id: <20210207232310.2505283-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207232310.2505283-1-f4bug@amsat.org>
References: <20210207232310.2505283-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yb4q1j6pFtkK

Commit 83be6b54123 ("Fix MSA instructions LD.<B|H|W|D> on big endian
host") introduced use of typedef/prototypes declared in "tcg/tcg.h"
without including it. This was not a problem because "tcg/tcg.h" is
pulled in by "exec/cpu_ldst.h". To be able to remove this header
there, we first need to include it here in op_helper.c, else we get:

  [222/337] Compiling C object libqemu-mips-softmmu.fa.p/target_mips_msa_helper.c.o
  target/mips/msa_helper.c: In function ‘helper_msa_ld_b’:
  target/mips/msa_helper.c:8214:9: error: unknown type name ‘TCGMemOpIdx’
   8214 |         TCGMemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,  \
        |         ^~~~~~~~~~~
  target/mips/msa_helper.c:8224:5: note: in expansion of macro ‘MEMOP_IDX’
   8224 |     MEMOP_IDX(DF_BYTE)
        |     ^~~~~~~~~
  target/mips/msa_helper.c:8214:26: error: implicit declaration of function ‘make_memop_idx’ [-Werror=implicit-function-declaration]
   8214 |         TCGMemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,  \
        |                          ^~~~~~~~~~~~~~
  target/mips/msa_helper.c:8227:18: error: implicit declaration of function ‘helper_ret_ldub_mmu’ [-Werror=implicit-function-declaration]
   8227 |     pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
        |                  ^~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/msa_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 1298a1917ce..4caefe29ad7 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internal.h"
+#include "tcg/tcg.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "exec/memop.h"
-- 
2.26.2

