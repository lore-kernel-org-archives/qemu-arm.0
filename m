Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp679133lfb;
        Fri, 15 May 2020 10:08:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5EZNMxGGIPldf/ZPRkCfnjPdq8//BpGJMmlkFkOJief5woyN3LwjFds4KsP1oJeY71NBI
X-Received: by 2002:a25:15c8:: with SMTP id 191mr7373607ybv.31.1589562515054;
        Fri, 15 May 2020 10:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589562515; cv=none;
        d=google.com; s=arc-20160816;
        b=XzCGFY6WLdooZ//oBlodd62u8q08MOB0cKV7jbBqQsejMi3zutGEzTyUkJ8tCNyTOL
         69S6zJLKQBwFe1aBa6/Qwon5NPm/T0WDRPZmICabP65ScHLdRztVw+ddT4hh78goQbCI
         89tTtPkyrgL8UDSp39W+QpvcrCjKR/0I2OvdI8jppChuk5N02a0lUSueVnJeEbJAByHa
         jj9c099ibcIl00bhx9sF/Gk+sxuZy0ZOizTpLTbqe0nbW6l7kt6HtTvdl7wtZ5iLwExv
         2prFfOTbmNhmCdFt8zHvB8AjTqCuupA4kD564Gim/0q3JF5fVSdBYEBpXEUYIqZQ0tU3
         e05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AfdJ0fb3pUn/q8r2VJ/7T43bIwJswLi3uwi/HIViWEU=;
        b=g70ichWyiklsj8kTmHJaruklt+V9779zp00tM+SOc0VSwCIEanj96q0AB9Y0KpHAi/
         q2A3Dgm1tBxUQGJmDUinQD5X/jYb3PLLksaAi39qeI62ak2V8V+s0Bfye5QjjBuUuDSI
         RVaMxr2gf6MRpKPhA/yrueg8r299VhSX7pG0yMu5HM39gaXUaUaxrh3qrgToDOIEv45n
         XI5bP7FozGuNkjh34995khg2hxvhw6HlUvAuIuQkh8XiroWGTpIVXk4ShvWRKRfYYRU1
         xFr36q2K5te2/MzvUrCsz0/xJ/ie2zadeoTPfDc/2ZqBcrzsUkzyDGZ9C8yj9Y/RW4Ui
         iPew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RHtn2xbL;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id s83si2124555ybs.224.2020.05.15.10.08.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 10:08:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RHtn2xbL;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589562514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AfdJ0fb3pUn/q8r2VJ/7T43bIwJswLi3uwi/HIViWEU=;
	b=RHtn2xbLYsBWrpZMWUczSDTUiw7lNilXotjdBtAUVLq3vax5nJe1jAA1FBFvVvOOa5vNxJ
	LqXJcFcQimRL4Hfue5gwnZA8sv/jBsjXbDkBSs+Vz6kv6JDGCs0kLRu09JTLRI7rlgUewV
	Y3zmLdJvC1cvh7dkbbt+7lkdRcIO8JU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-7EG6T08AOqmiiDfs-t88Pw-1; Fri, 15 May 2020 13:08:30 -0400
X-MC-Unique: 7EG6T08AOqmiiDfs-t88Pw-1
Received: by mail-wr1-f70.google.com with SMTP id p13so315051wrt.1
        for <alex.bennee@linaro.org>; Fri, 15 May 2020 10:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AfdJ0fb3pUn/q8r2VJ/7T43bIwJswLi3uwi/HIViWEU=;
        b=pDjpuz/So5spDHM+huGWMNM2DRIptTg5o8RH4GjfbXThMM6Jf0sD0QG0QqM0TvbDJK
         dd7D5dX7OCNIZjCBxK3q0SrI8JNuPUYtH0w8dKxz2s+5mGbJEoWY7h+QelVOgCBg6Wmj
         kb4LcQy900BDyxuawYeDf4xYzJYyhAAlOCYXngaSri1C0uTOy7iqoNgE1dNECVGt7oSG
         m66uuBFbXiLGsfuJGUSFruRnYyDFtyleAK54MfoSzlgFFciG9tYZo4Emk2kQ8lHpq+PP
         9N096lN4EL+kfn8G7DNJbVpdNhiQEIsM1g2mJr2+/gHDG80Pi61mIwOq8Rh3Dir1hqDE
         BV5A==
X-Gm-Message-State: AOAM531DMYB0oxeiYcx78v4F9NP8qbkikm+BaXcYAd+brnfRiCY2q9Wj
	dm0ce+JL1aGsHyjiPaL0MLEiclIr4xgDn+j/TQxi7MBgN4BGiF6Tm11neVCCeNgbEnHe4cbucbf
	JfhjJbSltttoZB+KU
X-Received: by 2002:adf:ca0e:: with SMTP id o14mr5606784wrh.254.1589562509771;
        Fri, 15 May 2020 10:08:29 -0700 (PDT)
X-Received: by 2002:adf:ca0e:: with SMTP id o14mr5606762wrh.254.1589562509614;
        Fri, 15 May 2020 10:08:29 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id s67sm4362738wmf.3.2020.05.15.10.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:08:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Marek Vasut <marex@denx.de>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Emilio G . Cota" <cota@braap.org>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 04/10] accel/tcg: Add stub for probe_access()
Date: Fri, 15 May 2020 19:07:58 +0200
Message-Id: <20200515170804.5707-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: TU9mHSbEvjnL

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The TCG helpers where added in b92e5a22ec3 in softmmu_template.h.
probe_write() was added in there in 3b4afc9e75a to be moved out
to accel/tcg/cputlb.c in 3b08f0a9254, and was later refactored
as probe_access() in c25c283df0f.
Since it is a TCG specific helper, add a stub to avoid failures
when building without TCG, such:

  target/arm/helper.o: In function `probe_read':
  include/exec/exec-all.h:362: undefined reference to `probe_access'

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
