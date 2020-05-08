Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2669643lfb;
        Thu, 7 May 2020 23:26:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypItvi+JJMQzXhb+ae7svV5NsTHwLJ86DB7NHKoldYVTvj8AwBb6AJfQZh7Fnhwvunzp9zX9
X-Received: by 2002:a37:c8b:: with SMTP id 133mr1144273qkm.418.1588919173437;
        Thu, 07 May 2020 23:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588919173; cv=none;
        d=google.com; s=arc-20160816;
        b=IPrSMhKGPCooJ3ot8AdHE4vK+JB3H6yDID17+qyjR0zm+cAa1iEt/MN9JZz5DPE64x
         WZzqN6yt2ORSsElIkDagA7q7bFd1EBvqf71mHKY5m5Q1zS4zi+WMdG/lP3Z06fFbbkHa
         G6VHrAOKeJZDJsMe+L+AQi3H5spIt/RYp4wL/XMEm4FIn4XI5kKfUFY1e/XVeQxH/3zI
         pO8MVFhonmbO4rwmc5zZhEdtCKGMk948Ze30SjNZHfQ58s7E5kUaZtM02g1FKlPPSdLh
         xnX33YzQjb8FldwxsUZQftu7/TSN6Ihdcj4bpF7yaGY4C992wPhlahUdXpW0A/fpgQgm
         j2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jABb93jnf06aFYSZrFeMKGq+pUGDAbmy7wJOT/FLnWI=;
        b=HHTaxAhTNu4MGKopVCxqWSC5htNx9x57EEXL0JWt1Y87o/sUG8PGa9iROWrquaAxvf
         ENR3fSKxPiaUWa8o1poqVql9IKiacvy+HSiqOkplJPlisOuSwuEYjw/oZGT7QlqEaRjw
         NS3wl5sfyYjzRDTDJqxnsyM8waHtxoPWseTDIySGrqfmvrQyEwSonkTxe+fY5MFheXBP
         bCaQr+BksGDsczktfdJRSb0HduxFOnTf05hy0EjItTf7lJO4364Ctu/tlqGCCS8dUX1Z
         dJxSSrwooP0u9O1t9TyKc6EEbgyMx4tB5PVZ0WXG0/9m6xF8VKfv1pacwFFd8vxswAV4
         7Zqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D5grgjS6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id r27si340409qtb.251.2020.05.07.23.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 23:26:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D5grgjS6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWwSa-0006yD-1U
	for alex.bennee@linaro.org; Fri, 08 May 2020 02:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWwRs-0006uS-6Q
 for qemu-devel@nongnu.org; Fri, 08 May 2020 02:25:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47657
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWwRr-00037U-At
 for qemu-devel@nongnu.org; Fri, 08 May 2020 02:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588919126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jABb93jnf06aFYSZrFeMKGq+pUGDAbmy7wJOT/FLnWI=;
 b=D5grgjS6g36SkUJtrhxeOKBhvSCVyqj1TXnOS/yZwwW/l8TIgljzZ7mqknWF/VdKV1pbAg
 hUBPR8t3kzT7qIZpQ45AcxnvF0u8EAjHugd9ygANb79sS+Yy3KGsY3ljX0yge/kvZIOKNI
 RikZo/LeL/2LSUf2lu4ixg/sKHzJ704=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-5lSuAZzfPb6u8V5YQyt7Ww-1; Fri, 08 May 2020 02:25:24 -0400
X-MC-Unique: 5lSuAZzfPb6u8V5YQyt7Ww-1
Received: by mail-wr1-f69.google.com with SMTP id z8so397078wrp.7
 for <qemu-devel@nongnu.org>; Thu, 07 May 2020 23:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TSdVo+LU87TLn9AYvDXpWQkhTwEUTRlE7YuWCo3SWO4=;
 b=SH+Pf6CvkXPFxID99ru1Z+19bbyenaBV2Pnle+yEy4ILVvnAEFfANxT/gd2NQyWips
 H6nWgqV+lOzXR6KIq0dK5ulrrVQXc0AT21u+WjnzHI/LoeotsgQsV5pgTIVLUUuAXbB/
 LT5c6oGWyQ1pEgOB+YSJRJUB3fB2JHb0M9NY6RW9xpradEEkj/IUKCJMo9XpZMlehpLm
 tyXA7RsfQqFQaUX34/b/X71vT0nJ/PPf0W5lC/eVqwBrxp+JURg0p2BmZZMbVk8lcdhd
 GelVy5wjr8HsTE6UY7c97zL/uIHscVNzqUTMsvjMaiw27QQAuZ4tfBTKUeKI/tCWF/jN
 Dtsw==
X-Gm-Message-State: AGi0PuY8gQmP60wLBmIcvJ1HgTLYd4WK1hV/NNv25mCvxffuFCgQY+kY
 7wVgvRn48/soZ1xqCAWv4PWMnPLj0sVfEeA2cmuSvW0s/HfNwCBQ6lPNTdnP7Rzp/edMOd5yzjW
 YbUaIZtI/fQzfUs8=
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr14560639wmj.33.1588919122781; 
 Thu, 07 May 2020 23:25:22 -0700 (PDT)
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr14560612wmj.33.1588919122559; 
 Thu, 07 May 2020 23:25:22 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 2sm1285382wre.25.2020.05.07.23.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:25:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] exec: Rename qemu_ram_writeback() as qemu_ram_msync()
Date: Fri,  8 May 2020 08:24:56 +0200
Message-Id: <20200508062456.23344-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200508062456.23344-1-philmd@redhat.com>
References: <20200508062456.23344-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e7bHJprhIymA

Rename qemu_ram_writeback() as qemu_ram_msync() to better
match what it does.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/exec/ram_addr.h | 4 ++--
 exec.c                  | 2 +-
 memory.c                | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index a94809f89b..84817e19fa 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -136,12 +136,12 @@ void qemu_ram_free(RAMBlock *block);
=20
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
=20
-void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t leng=
th);
+void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length);
=20
 /* Clear whole block of mem */
 static inline void qemu_ram_block_writeback(RAMBlock *block)
 {
-    qemu_ram_writeback(block, 0, block->used_length);
+    qemu_ram_msync(block, 0, block->used_length);
 }
=20
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
diff --git a/exec.c b/exec.c
index 2874bb5088..f5a8cdf370 100644
--- a/exec.c
+++ b/exec.c
@@ -2127,7 +2127,7 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsi=
ze, Error **errp)
  * Otherwise no-op.
  * @Note: this is supposed to be a synchronous op.
  */
-void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t leng=
th)
+void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length)
 {
     /* The requested range should fit in within the block range */
     g_assert((start + length) <=3D block->used_length);
diff --git a/memory.c b/memory.c
index ed26514c89..352b0a3aa8 100644
--- a/memory.c
+++ b/memory.c
@@ -2200,7 +2200,7 @@ void memory_region_ram_resize(MemoryRegion *mr, ram_a=
ddr_t newsize, Error **errp
 void memory_region_msync(MemoryRegion *mr, hwaddr addr, hwaddr size)
 {
     if (mr->ram_block) {
-        qemu_ram_writeback(mr->ram_block, addr, size);
+        qemu_ram_msync(mr->ram_block, addr, size);
     }
 }
=20
--=20
2.21.3

