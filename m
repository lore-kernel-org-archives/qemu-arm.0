Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4347916lfg;
        Tue, 2 Mar 2021 02:28:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhh12zr0fqIdaPSkmP17T8vHRqPSXPeUzHexiggwcdR61obzJVlOFh/v9B40zq2NQR/GNl
X-Received: by 2002:a25:8008:: with SMTP id m8mr28989118ybk.495.1614680893425;
        Tue, 02 Mar 2021 02:28:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614680893; cv=none;
        d=google.com; s=arc-20160816;
        b=lproe/74vW0jrvRI+GJ8swZu+Lddm6u+o3WX2kcobEbhioJzK9+gYuZGipf3k9MOv3
         mBB0tAN9RFfwcXaekLSnPIfhBOna/13WGJfJq3SFgHJJHsBYTr1h1/Bnp7qeibHtd3/D
         JDBa2uB3572WdfR7lCBTyjbhGF5/QXzCItwrjHwIVFme5ZBN36wYsl/y8JkBfyEUe2Pj
         f9o7IyTtCH+aQE9SO90OKHdq+YTQDvsyxRhiH17T5g2ga5j0OQtCT84h+VVkdvcjcU7E
         zKG6Few5fGiVeLveF8QhM4LBTeh7DRl+lmFB0d7Ym/rzAw5b9hJj+Tr5efbHmK+X+LBi
         NKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CGeOm0jundDRZ1ITFIsaK/vmviPguy9Zg4MX9Tcr6Ys=;
        b=Ym0wUeMzU1W3D7vkVTMy/9NAjbSNR80rbuBi48SqU2EQSr+mNSI0ZGFwkbBIE9hqlY
         vuOMvFdMCXrecwyYYgTAQile8j5MDfN/G0hzbKiQDZRf5PcPOJl1FqRTSjEPHg1OqHgM
         aZcUgTaBDoHm+hsEK1zYGeeFMhzqQq9g1UWk3gkLlvhYn/cvqNZl+xk7oj9B7nFlzgDt
         Na/E0IMThatfK8LmYnEYQ3jCNFfwhYu1sIhEkj0rOPkzPPgOK2va6GZxwZLLTQNAjgJD
         me61Nv8co+7fyDBItnz4mr1mfyAOYgwgzrjOiYAbJSLDlV8UUzngEFqKUFeGt0vm4cwa
         /fWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FxCLDzNz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p196si20741326ybg.213.2021.03.02.02.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 02:28:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FxCLDzNz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lH2GC-0001qq-Px
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 05:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2G1-0001kJ-8J; Tue, 02 Mar 2021 05:28:01 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2Fz-0008MH-OI; Tue, 02 Mar 2021 05:28:00 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so34251066ejc.1;
 Tue, 02 Mar 2021 02:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGeOm0jundDRZ1ITFIsaK/vmviPguy9Zg4MX9Tcr6Ys=;
 b=FxCLDzNz6QdYCdDoY45WVE53tN9ZvFhJ/jwMOjKC8oaESrRhF7MIdsPRyP/PtAqm45
 +BZBOuCyrnW5MPhOgWZOSzYbh3paahSGCRQ+BUaZ/UmeZwaxbQHWfRjDf0fp35Qy5HzU
 a5e3aNUGk0z3rcrp+QAVUaIgdfatSvwNKaa6crhUO6Eun7l2V52NtDQz8pqtKIGUwUZ5
 UIbY5lwY9ekZLR2GAVIaVLQqThMZlAqVGbXaJK6LQZzC03NFPWcwpCqAPA7gUflYxFGE
 bglfG+HwMOaZQ0gTvyITMOTpR1XZLX0vzBOgSXey+rBfV9NgonVfkwBMPHQzeJjiLxUf
 +WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CGeOm0jundDRZ1ITFIsaK/vmviPguy9Zg4MX9Tcr6Ys=;
 b=J/plKPfx+V2CR390kCrEtH6IIn1t3Eb4N7LEvbWpWgNbYAfjEyx2rKVYdsd/SLu91S
 oMV+6cM6/r6dbfrBFFKkB5DCSZ7ATdr/+d8BCC59RaUcqNxWpR8CkwFEqmWbv//KXbHN
 ERxb/3LF4VdUt6Rz2XdSlomyTxeOi33rVDR58uYzyLefVqHQl/L4c1spYbwChsitEPtt
 EdybTHuZ4Lpq/HmD1uqblUkRTsoEFnwRB+fkTaBMbrfeNXLTeIuyLyauujbFskgROT8S
 3OVs283WPI6/5pKh8gQ/V9+offiB/SXITLZShUjrBj/y4AZtDcvj0Rr5+7z2o0h6Hk/9
 yCpg==
X-Gm-Message-State: AOAM533ovKuyotdGjkjHq7dsUPqU91k5VZbhC8wm+sHN/c8aaeWg0LEc
 Ov8WjABiAtwx9R2KZU5jBgKqnXK2kqQ=
X-Received: by 2002:a17:906:1b54:: with SMTP id
 p20mr14852707ejg.307.1614680874854; 
 Tue, 02 Mar 2021 02:27:54 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l61sm19862564edl.37.2021.03.02.02.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:27:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] sysemu/tcg: Restrict qemu_tcg_mttcg_enabled() to TCG
Date: Tue,  2 Mar 2021 11:27:32 +0100
Message-Id: <20210302102737.1031287-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302102737.1031287-1-f4bug@amsat.org>
References: <20210302102737.1031287-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XOfdY5Noer5/

qemu_tcg_mttcg_enabled() shouldn't not be used outside of TCG,
restrict its declaration.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 9 ---------
 include/sysemu/tcg.h  | 9 +++++++++
 accel/tcg/cpu-exec.c  | 1 +
 tcg/tcg.c             | 1 +
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d8..7f57e57464b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -454,15 +454,6 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
     }
 }
 
-/**
- * qemu_tcg_mttcg_enabled:
- * Check whether we are running MultiThread TCG or not.
- *
- * Returns: %true if we are in MTTCG mode %false otherwise.
- */
-extern bool mttcg_enabled;
-#define qemu_tcg_mttcg_enabled() (mttcg_enabled)
-
 /**
  * cpu_paging_enabled:
  * @cpu: The CPU whose state is to be inspected.
diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index fddde2b6b9a..c16c13c3c69 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -17,6 +17,15 @@ void tcg_exec_init(unsigned long tb_size, int splitwx);
 extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
 
+/**
+ * qemu_tcg_mttcg_enabled:
+ * Check whether we are running MultiThread TCG or not.
+ *
+ * Returns: %true if we are in MTTCG mode %false otherwise.
+ */
+extern bool mttcg_enabled;
+#define qemu_tcg_mttcg_enabled() (mttcg_enabled)
+
 #endif /* CONFIG_TCG */
 
 #endif
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 16e4fe3ccd8..7e67ade35b9 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -39,6 +39,7 @@
 #include "hw/i386/apic.h"
 #endif
 #include "sysemu/cpus.h"
+#include "sysemu/tcg.h"
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 63a12b197bf..4a4dac0bb3e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -65,6 +65,7 @@
 #include "elf.h"
 #include "exec/log.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/tcg.h"
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
-- 
2.26.2

