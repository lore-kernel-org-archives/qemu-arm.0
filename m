Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp704807lfc;
        Sun, 7 Feb 2021 14:58:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcZL8BWFpDWIqU2UdgJghM9KOlxBdv2S/CoQo/HxfMEHhWbfmM+IsmMlf00U9sjf2F3NvK
X-Received: by 2002:a5b:98a:: with SMTP id c10mr21710798ybq.406.1612738733270;
        Sun, 07 Feb 2021 14:58:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612738733; cv=none;
        d=google.com; s=arc-20160816;
        b=xN8i6tibF53vWoVHyk5OQGcBOdf5LZQrg4dnOk5X5u7fFJ1gaLMfsfQN6iA+GSluLl
         zomosyTsjGHE3k5U1m4H/3UXPa6zY/TWNE2lpuN6uKe/NjvmE4QsAazJoBNCFws0M+Ld
         wVeOVQNkQ1H4nor6rYiFq8LkHGlE5bGyNeyG3wWcPYWsAFKjXgHCcIVJtlCxCy3hVap7
         vwB3oc9jer8Fa9+mWjyfmHvWxiNPWIU/Ifb6L6bjYHd52K4tA+f6/juZE6NNwyqTolRy
         G+lwoUxQWywPDMd/AY4gubZAflmH9bo+y7HnQKMDyVgl+GRcbKtU74MHViCQUSoOTmI5
         qPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=H7DdpVZKuaTFU+QINWMbbbomeFKhPW3S4eDxwf+nJCo=;
        b=W3rWL70ws60n6x8hPKDmK9n/aCojXM3Eua5Di6QSSWbmuY8wEKtMuHtO5WHHxrI8Jt
         QJWkMUjP4538iDUWkaBAljl8pGET88QtYSdxkjHcHI9S1+tA5tdGbvcHDPZJKMWFRWIW
         /Ozq0JJ4hh6fGU+c5SDvcij8/wy6FjUcikPaUBiwyfzK1HIC2d7heHo/iW+ShQD7/1Cr
         oU6bt0ZLSWQlwL4KomNM2176qkzZj/D/2AL+TPRS/kuKMKBK3mKVGogxZng4nNrG2zew
         8fGiSwyVmdM5g3u45MivVHioXcJYPVF2yM5QP+3pDTKR/i7xbJbw/ODMFGl5gV+U1BQC
         I7Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DuwqKccH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q188si19210052ybc.262.2021.02.07.14.58.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Feb 2021 14:58:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DuwqKccH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8t12-00030m-Jy
	for alex.bennee@linaro.org; Sun, 07 Feb 2021 17:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8t07-0001zC-Me; Sun, 07 Feb 2021 17:57:55 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8t06-00013z-6U; Sun, 07 Feb 2021 17:57:55 -0500
Received: by mail-wm1-x32e.google.com with SMTP id j11so11122373wmi.3;
 Sun, 07 Feb 2021 14:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H7DdpVZKuaTFU+QINWMbbbomeFKhPW3S4eDxwf+nJCo=;
 b=DuwqKccHtBt4dz86RKdnXAtbY1C6a2HgS+5yvCWHJgZFtaXXGTwchErp5vAQyTjPq6
 zpDQmq0x0jdwDD9c+O6S01GcEyxWMNZP55PSPzqFB9FWlSW1Ri8O7Wlshqg+s4xaTeAS
 hRqp7tWRf4EJVztY/4rSkH7FGLB2XnXK2wacllpoOaBiRbXuEtSXeJWDNGEiGOY1/qyn
 VMQgLGtoxwmohWvTGx0uBr6Zb9T2McbRsYj8f7FgJ3xX6HoXOVFsGmDjg7YQSTjzv3zE
 UmdR0rIismdm6Vbdy0zaFmpb2SYcPt95TFl5ioS4vJ5x0rUEcZ5JX2Ayhdik84KTEPjm
 rcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H7DdpVZKuaTFU+QINWMbbbomeFKhPW3S4eDxwf+nJCo=;
 b=V0puv3U8iNirXsbImhztcS8CoERH0ShLz1NQRtl+TNmsnFC3IjdD8NZmbRm0Tb/gq5
 m8u4i7G8ZqdSceQul4s5fJij18FzTmItYie++RnBpWpxWW76nwuYRnmnq034dEVqdCAF
 pjco3nCF7F8pXFQVdkxJ217+FKTrjZtCkEh8G/eaHxOJJGzAWXZ7YU0DJ2DE9NgNMBrR
 H45fum0RteDBKATl2+tU9lp5QSTZ8FBI8P9gB7BXUyENkb1xbzSJfEHSCHj3nnq2ZMSy
 7hz/n7urxZW/1dks2oG1oPpRnU7LF7ry7KNOgolCSze0GYIQLcR84DfNZ4RKDDpAIPNX
 iAxg==
X-Gm-Message-State: AOAM530oBVTmkDexeIqPV+9x0bmxRXA5Q9G6307/YmHR7vVkJfPkzr7J
 dvYSjUac7CPyxEpgG9jge9m3ykvWDF4=
X-Received: by 2002:a1c:6802:: with SMTP id d2mr11968962wmc.32.1612738672031; 
 Sun, 07 Feb 2021 14:57:52 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r11sm18905340wmh.9.2021.02.07.14.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 14:57:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/m68k: Include missing "tcg/tcg.h" header
Date: Sun,  7 Feb 2021 23:57:34 +0100
Message-Id: <20210207225738.2482987-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207225738.2482987-1-f4bug@amsat.org>
References: <20210207225738.2482987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wMdsb+3gXTj/

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

