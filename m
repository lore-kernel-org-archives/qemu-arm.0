Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4978846lfg;
        Thu, 27 Feb 2020 14:04:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxL4JtOuQcocjFJ/fSN0WycLRlcRXkO+F4E/kpMOz8Lq8VN4ltFJ88oGMiUs2CGMbP/KJAl
X-Received: by 2002:a37:a646:: with SMTP id p67mr1643455qke.124.1582841073121;
        Thu, 27 Feb 2020 14:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582841073; cv=none;
        d=google.com; s=arc-20160816;
        b=PI4Dcp5c+mdXcQn0N/hV5Odk0ir1ezXSirjzGIu3IX4ryPdLDNxwbWS5tVbBxuIsvu
         4Xu7nVgXqNjouK+1FqDnY+5uy+EuA76GJcM4thjCQJlcCQyIpRmrfvkQnzufeZDQ1G2E
         kcp21K7OrlmCZsUDnME3jSVVLy2dRJ3Xhjp5nAp7egQdGZ6P2qCch4O5jcKy5QJeKcXj
         b6GBF761tlguj62Xl4dt3lq4l9UCdUkpVhQklNQRSOyijO23+b2L0+mI/yDlx/Eg1OVx
         SgG8aRPsDNnHmuH2dQhev8aTQLhELq0xpwviRe3h2hL0eaeR4E0jXfhU4x3KoE1LqT22
         Xvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=X9+GBaHNQ0BV0SNlMsqulSGS5MEkF+1c8Vya4T3i8EM=;
        b=rnLSeXe41Tp5nuXIxt89dbNNL60tu0IwdQembCUsv2JRsLRHYQZBXcjEl/k1Hr26U5
         lmmgcbgnU0Y57SA2sIm0TvTZ7iQzx7xt9v9eoY6FzsR3x5wdA3cuQ5EcK7LqB3xlRoBF
         qwbdxhJHVk/VDtH3PEx5XOfCEYB4cxBJFN/VC1jySTZwZBh7R06bx54JkGdb0UybcSpV
         xPnYJajVAA3oNkcASRwR2UBYYmOLlfjwgekb8bkM5rEJ4cPJ6z3U2hl8TVRA5xi4SMCx
         NqWHpL5JdLb2gPjAgNdaveCShR0DG62Kh4oYHQY9FNxdNq2+6eSLhBORuTh5LkpunosX
         kPjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Od/fXhru";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si472090qtr.208.2020.02.27.14.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 14:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Od/fXhru";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7RGi-0003pq-Jo
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 17:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7REL-00019M-Bx
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 17:02:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7REK-0003lo-CF
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 17:02:05 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:33450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1j7REI-0003l2-Qa; Thu, 27 Feb 2020 17:02:04 -0500
Received: by mail-wm1-x341.google.com with SMTP id m10so7951060wmc.0;
 Thu, 27 Feb 2020 14:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X9+GBaHNQ0BV0SNlMsqulSGS5MEkF+1c8Vya4T3i8EM=;
 b=Od/fXhruoZ+KNDek1dEp3DgjiZ7Jc8Rdwy868UZK4/3W9C7KW4Z0vVChI66+z8xEzv
 inwgiKQ8GNpwa1xhdTdI+kti2gFArlhqkymHnGoZ2xfKKTkYpv9YmYtQ8NEUkZ/rz9JG
 9lUHgkhhuMFmNqq/C0rvzWiQsMYFLIdIFNbin9bbzdy/15o7R4dLP3PV6/2td21KkC6z
 Pg5z9p9Zb78iQpMNvTWyKlFVUEJ7u0GVriIUgD1z9OK5yVhHSS7jF+LAUyaAI7NGfcM8
 f9d2mXgsOx/66upnquK0AADEMZQFcHxriKvs7jsWQZTXlNYtU0Im0O5aDBt3+iVI/mwQ
 A8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X9+GBaHNQ0BV0SNlMsqulSGS5MEkF+1c8Vya4T3i8EM=;
 b=djHcLIDLHqu2zfjykHB/9YgwpvCm8/AvmtjPcEwa2Ef0CUmXFDSp5wiWUVS2cDyvZ+
 hFPZujWi+s7jcWmFqVq+q+i7o+Rrtik1/swX9Sddzwbv2GIuc/TeBtebu812peoUDWZA
 36IE2C/LEZ3SlzfPQYma2qQAUsS7iQjDS7sPmvPoMlSDkYlmhiyp6nfTunsIuXjQE37F
 I1wV10+AU8bWo+IQLJkGXLQNCm4IX27u5PQWVqyN1bEz4US3DJztNs839bJTqJcKkOpJ
 lg+8PjC+B/Pcw2RsEviXdMHOai8WybJmKMKQiE2m4hf4B77cLY+KpuGU9fCDqztfw11s
 s38A==
X-Gm-Message-State: APjAAAWg5lAJJFupRRAfHiqo6tL7l2IxX+KzK90do5QqEzyMGQ5WAcg1
 01WobWH0fahTh/nhf12n2IxWpgl9
X-Received: by 2002:a1c:8197:: with SMTP id c145mr833224wmd.176.1582840918868; 
 Thu, 27 Feb 2020 14:01:58 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id z14sm6447040wrg.76.2020.02.27.14.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 14:01:57 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/4] hw/arm/cubieboard: restrict allowed RAM size to 512MiB
 and 1GiB
Date: Thu, 27 Feb 2020 23:01:48 +0100
Message-Id: <20200227220149.6845-4-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227220149.6845-1-nieklinnenbank@gmail.com>
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: b.galvani@gmail.com, peter.maydell@linaro.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MMxAeCBxvp6h

The Cubieboard contains either 512MiB or 1GiB of onboard RAM [1].
Prevent changing RAM to a different size which could break user programs.

 [1] http://linux-sunxi.org/Cubieboard

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 hw/arm/cubieboard.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 010375f0a8..6c55d9056f 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -33,6 +33,13 @@ static void cubieboard_init(MachineState *machine)
     AwA10State *a10;
     Error *err = NULL;
 
+    /* This board has fixed size RAM (512MiB or 1GiB) */
+    if (machine->ram_size != 512 * MiB &&
+        machine->ram_size != 1 * GiB) {
+        error_report("This machine can only be used with 512MiB or 1GiB RAM");
+        exit(1);
+    }
+
     /* Only allow Cortex-A8 for this board */
     if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a8")) != 0) {
         error_report("This board can only be used with cortex-a8 CPU");
@@ -78,6 +85,7 @@ static void cubieboard_machine_init(MachineClass *mc)
 {
     mc->desc = "cubietech cubieboard (Cortex-A8)";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a8");
+    mc->default_ram_size = 1 * GiB;
     mc->init = cubieboard_init;
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
-- 
2.17.1

