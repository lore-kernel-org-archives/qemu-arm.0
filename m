Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2447291lfb;
        Mon, 11 May 2020 01:20:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypIwxfOPwl82s8tSQ5pi7oKqYS71r/8mSWkNXKGIk5HpdDnoyPc28NsYxhbH2xq7DtZsjAvC
X-Received: by 2002:a37:9b0a:: with SMTP id d10mr7083667qke.31.1589185242753;
        Mon, 11 May 2020 01:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589185242; cv=none;
        d=google.com; s=arc-20160816;
        b=0AmfVkW660P3pCxpKjU62HY39uMVobPw68KCbClYDCCUxlf+TIgusj+uDtMG23ljXO
         GWMkFPamQfPkCaWj9HoBZ4u87ztnQ7cooRT9wCD5ONF0Y0oPFbPQvEoNcz5dl4ZugEgA
         DaN40K5VcXeUYzNZYuY4fRq4by2cPRWC+JolNJYt9ZgmFhmzQdFejoYuwTp68kDVcQit
         +kRU+CzBaUxo5Q6hHh/o5YEOTz/SrqMAHIJcTjPVJGyx6aV4/Ph2T8lz4oYwVuGnSZ0t
         /QJxomRW3UrkdO0l+kQOciA/sykSdcKbdUv0h1GHOAzkrS4oqyCAGEDmtCwiD9X8wqkO
         B9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tSfIOqlIt2t/ygoZKZ0BPDhjsEwlu4jVN7jfPQltXnc=;
        b=bC3+jqHEauH3dbf/oFZyxmib1njHbBSg+shVXXzaAWgPAouk6aUHCslKYwVRw8zo+X
         bPqtU+h2Uyz5wwD9PI2rZq/5JIP/K3272B7nw+3M33P7LlA4UV9GxayRFh/3nsgIUvYx
         ms8Y2eynyeuD51u8NlDXizfW34m+uNmkCllR8Zzz6hAKuYlrEtj8+tvhUWaArbWohLb8
         d2HUQGNQlUZ18zStWqOdSfhIk5DiE6cyk4B2J/NJt4PBt5JoPzJ5+u30r70M0PlD41gD
         I5ZbS90wV7C1xi+iuxMbdS+VwK0mjeFOflCQWVB2hS+/WyGrhSd+Lp1cvDUDU7jGguPm
         c7nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hn9AgbGo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si312124qkd.295.2020.05.11.01.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 01:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hn9AgbGo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY3g2-0007ti-6h
	for alex.bennee@linaro.org; Mon, 11 May 2020 04:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY3dB-0003Pp-6e
 for qemu-arm@nongnu.org; Mon, 11 May 2020 04:17:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37314
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY3dA-0002om-CQ
 for qemu-arm@nongnu.org; Mon, 11 May 2020 04:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589185063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSfIOqlIt2t/ygoZKZ0BPDhjsEwlu4jVN7jfPQltXnc=;
 b=hn9AgbGoQMarhDJ/z4H7gADEwDuKYa2T+qZFkLGfGJd/DaUxaYvbdITtJppS36QGqCX/M9
 xr8Shu0A1dPnJoGUvxVlkYceiuW47UeAs5X6bqcYSmnZDqQFcPfqDcbuq4GsHnLIRS2VQR
 gUrJjF2jcbX01bk61XDBMC21rcavlXw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-hVn4XlWXNV2zpKATc1kiYA-1; Mon, 11 May 2020 04:17:42 -0400
X-MC-Unique: hVn4XlWXNV2zpKATc1kiYA-1
Received: by mail-wm1-f72.google.com with SMTP id p185so1532492wmp.5
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 01:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSfIOqlIt2t/ygoZKZ0BPDhjsEwlu4jVN7jfPQltXnc=;
 b=pDuxn8yOg1PFTMGUdrUmpgcEbL4hbmFbZYuFC9fxjGI7a4GQjFAVWRQdV9cTfo1fER
 N61419N82eBnKhoYoUfqqhS5zIG3COLEKgNwyJY5mTa0IyurJ5netCMct2pZPo1gMYJA
 edZA5S/j5CH+v8dHdAK3rkrdseVh1/ntgEsXnA4aKerIAQSmb5hrPvg2H5xggiJw3eUn
 DtUgDIO6eIRxY4PtsgkvxX6Th17FKczNKCFN6s6dr5qF3HkJeRQ/VbWgAZvrBNVtNZha
 YLp5qLaAsHs8XdNFlOK/F+kk8uKSpvzmqjAl6gZ3QE+NqNxx+CkdXa8UfdRlTfh7FiBy
 6mvw==
X-Gm-Message-State: AGi0Puajjl9dTdxf7bae03UnIITmK7qHP0YxnUAUyq5XTP/Fkyw5riYA
 D4OfVLBwDhhfUz/WmZPh5EhOf7ysvfvC4zI/FlX96pi/9wO2Bg5Y3crYqHpqNk+IrmPI+c+ShSA
 AqD6rATf85Lu8
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr28919810wmh.47.1589185060981; 
 Mon, 11 May 2020 01:17:40 -0700 (PDT)
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr28919798wmh.47.1589185060762; 
 Mon, 11 May 2020 01:17:40 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id o26sm14683656wro.83.2020.05.11.01.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 01:17:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] exec: Rename qemu_ram_writeback() as qemu_ram_msync()
Date: Mon, 11 May 2020 10:17:19 +0200
Message-Id: <20200511081719.31641-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200511081719.31641-1-philmd@redhat.com>
References: <20200511081719.31641-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 01:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rLc1R2cfjRxu

Rename qemu_ram_writeback() as qemu_ram_msync() to better
match what it does.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/ram_addr.h | 4 ++--
 exec.c                  | 2 +-
 memory.c                | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index a94809f89b..84817e19fa 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -136,12 +136,12 @@ void qemu_ram_free(RAMBlock *block);
 
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
 
-void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t length);
+void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length);
 
 /* Clear whole block of mem */
 static inline void qemu_ram_block_writeback(RAMBlock *block)
 {
-    qemu_ram_writeback(block, 0, block->used_length);
+    qemu_ram_msync(block, 0, block->used_length);
 }
 
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
diff --git a/exec.c b/exec.c
index 2874bb5088..f5a8cdf370 100644
--- a/exec.c
+++ b/exec.c
@@ -2127,7 +2127,7 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
  * Otherwise no-op.
  * @Note: this is supposed to be a synchronous op.
  */
-void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t length)
+void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length)
 {
     /* The requested range should fit in within the block range */
     g_assert((start + length) <= block->used_length);
diff --git a/memory.c b/memory.c
index 73534b26f4..5bfa1429df 100644
--- a/memory.c
+++ b/memory.c
@@ -2197,7 +2197,6 @@ void memory_region_ram_resize(MemoryRegion *mr, ram_addr_t newsize, Error **errp
     qemu_ram_resize(mr->ram_block, newsize, errp);
 }
 
-
 void memory_region_sync(MemoryRegion *mr, hwaddr addr, hwaddr size)
 {
     /*
@@ -2205,7 +2204,7 @@ void memory_region_sync(MemoryRegion *mr, hwaddr addr, hwaddr size)
      * different types of memory regions
      */
     if (mr->ram_block) {
-        qemu_ram_writeback(mr->ram_block, addr, size);
+        qemu_ram_msync(mr->ram_block, addr, size);
     }
 }
 
-- 
2.21.3

