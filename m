Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1887962lfb;
        Thu, 21 May 2020 12:59:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1w+Sg3tkH9VixZ6qPg86YaW/E/O0O3yqdr5jU3B9Ok34l1u/4bfOzPnKFwrh9lb0+VZxF
X-Received: by 2002:a50:955a:: with SMTP id v26mr333220eda.5.1590091180234;
        Thu, 21 May 2020 12:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091180; cv=none;
        d=google.com; s=arc-20160816;
        b=Cq+5HgzSFDKPrnlBFyovWqJLscQgYOt83mWNYHT7EhvBeaS8Jo4RKgPmfQQEE4dMI3
         q4gFQyDYnaKGT9HzLT2nQWqEyzOOEVIIgsoRBABJcghVH29rJkmv+6EnCpSPYxXGE/xH
         jqz5cCoej9r2GYErwJV+P9eqZKn9RrDhgY6FGK+1nM+KufAXnw4gLindH5rMoBZXcH2+
         uUwLIa+PyHkArGmL/wqswIv9ZaegderijtbJUwJ6S9pkTy0srBpG1p/iLaA1g+UcP7ZF
         xgWbjs+XSja4h4HszQIVCVJjiG3ifKIg82BLAgPxM2Dx/WOHTgImEF5xO5hl0kiywL/7
         Wh6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gy7eiStux+gIOMgnul3BY8RTTpwPoXMNvRdb9ailA+g=;
        b=mMN8UoC8+kWT/Mc/SdK5MkGhieFaw7TWCx53YUzvqp8I1e0VVPfHZqW2Bb0myRdnGU
         Oy+yzPPzk3gbcCnImxp/h3pA/opnM3UK44gWTO9WSqRfKSudBpc7VMObqC3PdxOub/WG
         C3ckzixqwxJ/FFcfq1NeBVVqqfulCWKwg72lgrxNzVU3bRkXilkGHbEeQhLn115TxInH
         L/5Z6/kzVJ1QAQZbVqSmr+hXFJUTir4m2jdYzd3u2sOWuppFdaoTuk8fD9uiXJpeyn8c
         jrcoMtwiFMPcdTNIRShTRoreRliIQcJKEmT3ZOyNKY/HZIQ/W+FPqS3Sq0YypzA763V3
         aAhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UvRkVDA8;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id jx21si3709985ejb.740.2020.05.21.12.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 12:59:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UvRkVDA8;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gy7eiStux+gIOMgnul3BY8RTTpwPoXMNvRdb9ailA+g=;
	b=UvRkVDA8pH+0oA6/vcFLA4ZfxqDx2xXqoqlwXHxRUy+ljNiCaQ/SFnbf/hj1HfGvgymYbe
	6mBj89LjZjo/srNOoeHhh0H9Svk3cw9ufWZDomxW992vYShlvvVlSarMfS065ZVmi7Bglp
	D8aUFUjyY1Yt1gTON+EtVnyQ4ysvk5E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-Ibi3VVS-NZCBxSbFRxe-Jw-1; Thu, 21 May 2020 15:59:37 -0400
X-MC-Unique: Ibi3VVS-NZCBxSbFRxe-Jw-1
Received: by mail-wm1-f72.google.com with SMTP id z5so87277wml.6
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 12:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gy7eiStux+gIOMgnul3BY8RTTpwPoXMNvRdb9ailA+g=;
        b=AVBe4NMOuF20FXeNRWEFu9iAuKgrldNlR+MeKY1vpVEc3xoKwH+8KF9wwyYjPctIRQ
         CEWiIyQ6Xd3gMha1bvNESMSE9ZNvvUB83rvVGevFtNxCb5BARALteSapL9cEtZN5obtS
         B8pd5B9MdTObwBIbub1P8IUW5qkvQbYPZmlKkAgg8DMhHwNWmr8bPfvMpKlMwoQAZA5C
         xLeyfUsJTY2Nv1ncwKA0i33duMeOQ3x6Zf1NksIjJGDDrVHY149aphGz1aHkEigHK7f3
         cf+BJzY1PdiekBAT7mKOd+vkGX2gTUFWWgLLYMRJp1kp/BWZT2Hq/HGgYCExVXSTSMch
         Ld9Q==
X-Gm-Message-State: AOAM532lK+4tXaHxDEUGwSMmkV5RDcWHliifK1ZIykjD9lF1I/hAdeNu
	zpZVHubx0CyNFsm/E2rdWRYBD5zDfJoHF2h7KBMuPfAlh7fcObIQKOKg18b8FwjhXY9zrIvJ1tV
	ENcn95bmwv1pwMfpI
X-Received: by 2002:a1c:6182:: with SMTP id v124mr10231014wmb.30.1590091176370;
        Thu, 21 May 2020 12:59:36 -0700 (PDT)
X-Received: by 2002:a1c:6182:: with SMTP id v124mr10230993wmb.30.1590091176198;
        Thu, 21 May 2020 12:59:36 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id p8sm7269705wre.11.2020.05.21.12.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:59:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Richard Henderson <rth@twiddle.net>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 04/11] accel/tcg: Add stub for probe_access()
Date: Thu, 21 May 2020 21:59:04 +0200
Message-Id: <20200521195911.19685-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: qX56F5FIFZtN

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The TCG helpers where added in b92e5a22ec3 in softmmu_template.h.
probe_write() was added in there in 3b4afc9e75a to be moved out
to accel/tcg/cputlb.c in 3b08f0a9254, and was later refactored
as probe_access() in c25c283df0f.
Since it is a TCG specific helper, add a stub to avoid failures
when building without TCG, such:

  target/arm/helper.o: In function `probe_read':
  include/exec/exec-all.h:362: undefined reference to `probe_access'

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Richard Henderson <rth@twiddle.net>
Cc: Emilio G. Cota <cota@braap.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: David Hildenbrand <david@redhat.com>
---
 accel/stubs/tcg-stub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 677191a69c..e4bbf997aa 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -22,3 +22,10 @@ void tb_flush(CPUState *cpu)
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
 {
 }
+
+void *probe_access(CPUArchState *env, target_ulong addr, int size,
+                   MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
+{
+     /* Handled by hardware accelerator. */
+     g_assert_not_reached();
+}
-- 
2.21.3
