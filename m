Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3160292lfc;
        Mon, 1 Jun 2020 07:35:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQl8qZDnydwSI1flwnM3cCHP3Z6Zerz1x7qa5iNAzla0eRrRgOTwIhhhqWt//C6DI0dk0E
X-Received: by 2002:a25:d9cc:: with SMTP id q195mr9765816ybg.55.1591022109231;
        Mon, 01 Jun 2020 07:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591022109; cv=none;
        d=google.com; s=arc-20160816;
        b=DssUWoabJQnYlkqKZHd0mglogTDCQW0yKc1Ub3dkz5j2k0vfGD1NL0FI+4OAODZxzq
         +xTIFtP4pixB0cjNMlbBaKZ7LW5n0sHIAjMmViXCtPm1cnbPmBIzOSICpsKG9AP3BY25
         ApHiiKJuCXFFF/o8gHTU4Derc7dsoCJ4GfPwo9E4Yox00KOyrAFA3H6e5EGqPTPmwqwC
         hAyvBbZEGM4RteZA5F9dVY8scr0WjLKu5UdgAvoH70NJ3FpUn5H+3krIoMas6XMF7Ghn
         3LM7rfie4XkshFLNCqdsjvCtlFzevtfJGlQzbcQ29VtKN49BQuR2B4bU79EaocLHvGvk
         KgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BWyCSlaGZ5iGWtDERp092wuI7W/yJ6Q5PNPhUdRKhqE=;
        b=DRaM8TzCAqt46H7uCcmb9ut7spj6kBfQMl47VWrmIPYRqCl3qUHvxz00etkHzd3eGr
         aorSpoIVuN2Yi3yPT7fu4gkSMYN2y8DBi/kGm3uPIU3qRS0ec4os92wLjDGEGK8XkG30
         MFrKyfKQsJ1BWxtIoc4ICMloDu0i8vp7r7YtCiTX2eUkLMWmiaW4dgpcbA+7n25g8Vpe
         hG5P/bhLC0ReEdPjhhcKWpIx1B90/lH8qX6z3VW4YAnnPweV1Gvmbl0DdlcWmLDM+n1b
         CZEOF+eupJRUalx/y+8yD19QVi8aJ3N23COf5yBIC/rySd0XwFg60n68Wa9tauaQyPjU
         q07A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YYdDUqhd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si9720952ybk.323.2020.06.01.07.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 07:35:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YYdDUqhd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jflWu-0000mh-IZ
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 10:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRl-0002fv-2W; Mon, 01 Jun 2020 10:29:49 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRj-0002dW-Sq; Mon, 01 Jun 2020 10:29:48 -0400
Received: by mail-wm1-x341.google.com with SMTP id u26so136174wmn.1;
 Mon, 01 Jun 2020 07:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BWyCSlaGZ5iGWtDERp092wuI7W/yJ6Q5PNPhUdRKhqE=;
 b=YYdDUqhdLC78jQgiEyQ97vcy07tygmsEfX05PhXA32BxLX4Qe9twTWzZmVHR3RVHIY
 +iIyt1j0gFZqOFSr605qHbE2POl+jt9MJdfiedY4UGCiWC/djzHGT4gJjI3nG74wfkyf
 E/2/Kkh958INFuor/mhxBoXRwW4pFSd1w3zYBCgs8YkNUZoMLPAcfgJcNIx2hjDevr1L
 kgbcUNCBqqQhZlc+JNsd85h9B66dOpEA3+cInY/WOBNWG0Lc1Pa92lK7g4BUtZ4aaTKV
 mwP8Slp3c6cYpbvlWHqG1VDHdhtDUaTiWEO7Y4qycQdTKuVs8LtVl4dH8Jffj0657DSq
 Qi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BWyCSlaGZ5iGWtDERp092wuI7W/yJ6Q5PNPhUdRKhqE=;
 b=cB4/c0CrO7q6kHmLGYi8tJXSrP0i9vohvRCE+IjysKM9zHEwhhlTWzmWDTPTpTHs3G
 6THIrn0MuMtnZBa0rfzvcoEfZcSeM5QyEsA86dLt+hMF62CktGST5+k+D8FpQE8vc+s1
 qYlVuT6D164J+BMrfchGd3b++j0uYA9gVh/yP7FyRK4Q6BSnYw/R7lN5WD+51SlwIk7o
 s1STDRitbBvcWKKcq/c2/UlDm/BWuxFbQ/omhQGbvQ1rdr0IN45rEX2x4uNWKUZf8EU9
 5EG0lPcfvrU1h+oUVzl5uK8m1kXhIPQuj7FNcBl1fQ0Csi12YAEU/6viPUKiyh9bjqbn
 IfWQ==
X-Gm-Message-State: AOAM533F6MLUH0hhtXl3GdwjMWYPJeN6EBj1X9K+YSwlqmmarsHmo1nc
 DiGJxZCA5M6aw07CIl6fYkDk60Dw
X-Received: by 2002:a1c:b656:: with SMTP id g83mr23163858wmf.151.1591021785290; 
 Mon, 01 Jun 2020 07:29:45 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] target/i386/cpu: Use the IEC binary prefix definitions
Date: Mon,  1 Jun 2020 16:29:30 +0200
Message-Id: <20200601142930.29408-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pa/gaeC4resl

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3733d9a279..33ce4861fb 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6159,7 +6159,7 @@ static void x86_cpu_machine_done(Notifier *n, void *unused)
     if (smram) {
         cpu->smram = g_new(MemoryRegion, 1);
         memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
-                                 smram, 0, 1ull << 32);
+                                 smram, 0, 4 * GiB);
         memory_region_set_enabled(cpu->smram, true);
         memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->smram, 1);
     }
-- 
2.21.3

