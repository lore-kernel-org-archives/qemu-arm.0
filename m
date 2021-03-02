Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4350195lfg;
        Tue, 2 Mar 2021 02:32:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBR3knD2wU6UHsqJ3GX6+9k+MMuthbpNnOw0saShMZ5+HnQ7/c41rbKZw0rU2qpK4TqsF/
X-Received: by 2002:a02:30d5:: with SMTP id q204mr20998806jaq.55.1614681122486;
        Tue, 02 Mar 2021 02:32:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614681122; cv=none;
        d=google.com; s=arc-20160816;
        b=OW8LYye85xmRCANf0iThgfL6u/kM+18qP7qMl7BXZoFOJ9Ajkn4tiPk9oqmpHm/vhJ
         JbRLphMMVqSDLrrMJ2XLBglLDZ9qK2hnSvss9OY6v9K1ojpyOYBZ/QzP2qfJkAILcmh4
         rXt9ktj9x23Umv1EaRr3hGLE5sxaD9cA4Xx7fjk1YYMKqd8RkGrvnhRQrHTvqlne3zaO
         IdTTwZwGBDKyzmhXd+N8xMZ3UjBfQNFGbsXuEMtk8ECPrtdXz/1WsIk2A+yiNx3z4IrB
         7lG6Zo8Jpjel0OUGZyCzWFIA+O6x5wQY1YNvvySE+5+Nx4ItOq8Q/Uvj/kGs7sJ5HATE
         noRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=L7WVeo3JeR2z3AVtoQK/XR045Ce4Y6oo2FncIeho75k=;
        b=HEjXuEmKbP50tNik2L//4ygZyHvfryd7Abn1v7SxDdf0rfBJqhSeaJJTVTJzV/qUcJ
         298K5qIRdGS8PZ/DFDrPPucWzeuGqNOwMvdEzf1Nf7UtQ4v1VGYimC7ntZT7ENuhLVcr
         N+fx3p8AAqNvAllFWXW5cQiSIsuG/zQhq5SWtlkSWGI7WrPjHGCb+JbBwHR0NGkkhJJ9
         aJ9l6jdm0yuSY9fYAGmpo51aq7w8rmwxEHLE8eb9sbQrnCXMhko5eMCoMS+PdmAkbFiO
         6TQFiBmzOtcUNh4Ga2XRxJqXNt4pfTSubGkVypRHNROGsJP68jW7luS4mFADy961PXle
         XPPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PM9Lz9wD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si13986225ioi.40.2021.03.02.02.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 02:32:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PM9Lz9wD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lH2Jt-0006do-H5
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 05:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2GZ-0002qP-62; Tue, 02 Mar 2021 05:28:36 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2GX-0000FK-4G; Tue, 02 Mar 2021 05:28:34 -0500
Received: by mail-ed1-x52e.google.com with SMTP id b13so15318918edx.1;
 Tue, 02 Mar 2021 02:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L7WVeo3JeR2z3AVtoQK/XR045Ce4Y6oo2FncIeho75k=;
 b=PM9Lz9wDcwQWHcyx7h3aFKV73QDzAg2Km6FE13Cp4h/HL3Oy+Zt64BcozCUyhdmpiP
 s61v76fYKsD/ooPiY5BSLje8+vQge/ONQ9Z+/x3rtVHdmv2s8JnyHkPEi9T6zqSdIwPq
 1aNpvmmtLqahcUi+bB2tQrr5kZEpPnxRZdeUhMSTmp/6b/IbOmFsKuZoXdnpttsZqkSd
 6kc01SeZKffU0so3uZhpLKnsqJxgyuxgUkQmg7iKeHAPWo8QCDmsY/g9avbIfTQn4TN2
 avZvDa0XjnEl7aAmGEdnGHZcOkjT1fv+LFlLEWyTg0lDtNbsYeT5u+pqGxAq4zwW9bfg
 YddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L7WVeo3JeR2z3AVtoQK/XR045Ce4Y6oo2FncIeho75k=;
 b=Hfbfr70nC5qkY9efjgCYLRWH4Yzm7dDbFp4e7NcGLgGH5zHF7mRPTSLEeJ/nQhj+sy
 c9uIT0gf0NTfVugMns4YageJSatUCevNTau3p1PyQWi2RweBdgGwUNrowY4Fkg8tTtsi
 E6zqXxlkXHwFeB76/M/6WynDik22DqWUmGDLvGnO6GVhXNSAt+/zRhSIEA63xf6FqXvN
 xDqias/GgCpZjZLSOQqVhk/ouS8N9p5nJKb07eNWdfzu3qy80WvN4X+vhKMXxAJ7Mne1
 jKmhWkBMmL0h8uC/NGICUXpimDH922SAyklxa1NesOScaCs61zdwfhKyPPC3YFDafHQs
 RZlQ==
X-Gm-Message-State: AOAM533Ow/fFIMQvmhqYT3H/XiKaihRewYAwZpaB7VCNMrFoWCIz8YQy
 O2B22ym6lgHHwcG8o7PfG0NUkHymRNE=
X-Received: by 2002:aa7:c609:: with SMTP id h9mr20457329edq.256.1614680908765; 
 Tue, 02 Mar 2021 02:28:28 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n5sm18749468edw.7.2021.03.02.02.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:28:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] target/arm: Restrict arm_cpu_has_work() to TCG
Date: Tue,  2 Mar 2021 11:27:37 +0100
Message-Id: <20210302102737.1031287-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302102737.1031287-1-f4bug@amsat.org>
References: <20210302102737.1031287-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Claudio Fontana <cfontana@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JDFNBjKt6CkQ

arm_cpu_has_work() is only used from TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 2 +-
 target/arm/cpu.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1930be08828..db81db9bf57 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -172,8 +172,8 @@ static inline int r14_bank_number(int mode)
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
-bool arm_cpu_has_work(CPUState *cs);
 #ifdef CONFIG_TCG
+bool arm_cpu_has_work(CPUState *cs);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 09dea233af9..0b4727bd7e9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -74,7 +74,6 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
         env->regs[15] = tb->pc;
     }
 }
-#endif /* CONFIG_TCG */
 
 bool arm_cpu_has_work(CPUState *cs)
 {
@@ -86,6 +85,7 @@ bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
 }
+#endif /* CONFIG_TCG */
 
 void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
-- 
2.26.2

