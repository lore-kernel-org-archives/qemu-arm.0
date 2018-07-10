Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3741788wrq;
        Tue, 10 Jul 2018 09:10:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeB8wQ1Op6DehAM6Q5KDAEd6WVgfYTdU9b/Mr6F7Lu5eTgYzgLS4qJuTLhwgFDnI8DODXaU
X-Received: by 2002:a37:7b01:: with SMTP id w1-v6mr22287836qkc.354.1531239034551;
        Tue, 10 Jul 2018 09:10:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531239034; cv=none;
        d=google.com; s=arc-20160816;
        b=CfynqRIFAEBrDXZi5GCpwEvjypRw6rYLG6MOP6fDxA1i194yEui8NUO+8ucHDKolb5
         f0wUr14If2gtLHEUlSjc29fGWmk5BawQ8C4waBdn7bi8CO4sUOlSZ/wsQPHjAvuS5QZv
         bKzmh8JhLjjrMLxYU9YkVKE2DH2o993Blu0LLmVy+jlrYBEnCgKE2Qlwt9ACGru761qH
         8gP5lE53mq+LtYl0lINdINI8GMfQE5+8Cj/yVYPEhaOeJ6d7ENfOO1U57S+nAp35U8P5
         2zQDC6S3fVtQJdgF+C8uWzzSVghrTmyYE/XvvWNbLanwSRRxeURgQLWEXsWUXv4DHp6b
         aOYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=pH9Bfs6OY/k6BErqdPpZTCosVyZSrsXEY7hphkKsk/w=;
        b=RxvMBmzW29dM20Wos8SHI+td3LjI8UeNY8zlP+9OSIUuZiaW81zE2yiP7YhlvUVxih
         cy8I9y5rYEfVY6vifvM9mq7RgpT4doVnMUgp8TJBs+cLCllbCY33OYCBKK5jI5wFqql2
         y/1zp2gEyE5XjDYSJ7T2O63dsQbBLj4HmRsZJtkhmLZtmv105qVFfTrIeOd0jdBd3HGa
         b3+t0wWYffl+uweXu+1rTU9m7QHg8/djC8Js6VXqKKOhmRDI2E2GA9CA23WjWwNp0N8e
         TfAvb5GfAxyxyU0qygQsX2sXsoE9lRKBl4jC6zvhQ7YozMs1x2p/QMMhLvlgqpHmR6qw
         q5ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i46-v6si407118qta.368.2018.07.10.09.10.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 09:10:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcvDl-0003AY-UP
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 12:10:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcv40-0003TP-U0
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:00:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcv40-0002Ia-0S
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:00:28 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fcv3z-0002Aw-Op; Tue, 10 Jul 2018 12:00:27 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fcv3q-0001pJ-2O; Tue, 10 Jul 2018 17:00:18 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Jul 2018 17:00:11 +0100
Message-Id: <20180710160013.26559-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/6] accel/tcg: tb_gen_code(): Create single-insn
 TB for execution from non-RAM
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tECLG9esa2O/

If get_page_addr_code() returns -1, this indicates that there is no RAM
page we can read a full TB from. Instead we must create a TB which
contains a single instruction and which we do not cache, so it is
executed only once.

Since this means we can now have TBs which are not in any page list,
we also need to make tb_phys_invalidate() handle them (by not trying
to remove them from a nonexistent page list).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/translate-all.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index d18018fa99d..4c12d94dd13 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1493,7 +1493,7 @@ static void tb_phys_invalidate__locked(TranslationBlock *tb)
  */
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
 {
-    if (page_addr == -1) {
+    if (page_addr == -1 && tb->page_addr[0] != -1) {
         page_lock_tb(tb);
         do_tb_phys_invalidate(tb, true);
         page_unlock_tb(tb);
@@ -1608,6 +1608,17 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 
     assert_memory_lock();
 
+    if (phys_pc == -1) {
+        /*
+         * If the TB is not associated with a physical RAM page then
+         * it must be a temporary one-insn TB, and we have nothing to do
+         * except fill in the page_addr[] fields.
+         */
+        assert(tb->cflags & CF_NOCACHE);
+        tb->page_addr[0] = tb->page_addr[1] = -1;
+        return tb;
+    }
+
     /*
      * Add the TB to the page list, acquiring first the pages's locks.
      * We keep the locks held until after inserting the TB in the hash table,
@@ -1677,6 +1688,12 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     phys_pc = get_page_addr_code(env, pc);
 
+    if (phys_pc == -1) {
+        /* Generate a temporary TB with 1 insn in it */
+        cflags &= ~CF_COUNT_MASK;
+        cflags |= CF_NOCACHE | 1;
+    }
+
  buffer_overflow:
     tb = tb_alloc(pc);
     if (unlikely(!tb)) {
-- 
2.17.1

