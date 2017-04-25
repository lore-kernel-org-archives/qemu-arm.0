Received: by 10.25.0.144 with SMTP id 138csp1748154lfa;
        Tue, 25 Apr 2017 00:54:06 -0700 (PDT)
X-Received: by 10.200.46.157 with SMTP id h29mr32378361qta.39.1493106846066;
        Tue, 25 Apr 2017 00:54:06 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id f25si21160916qte.11.2017.04.25.00.54.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 155F921F26;
	Tue, 25 Apr 2017 03:54:04 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=oIt
	0v33rjciqAFSJM93+0ftvaG8TKg4ll7wOGlGSNZQ=; b=PfraxVjt0UDKcJJ8D35
	JKup4jJAqMjj+g3TDbqKSgk+9PCSqqLLv5i2aNoxQK3q0dJjm/+CxOoR/slJc4XS
	WaKpUFWhLpQu1o4gFTOhAE+tGpeZSgdWHO6aXbwzffLmB6KwSOBdgE1Iy++5dVYp
	jqpK+VcIJcBs4p34HLY8/JOY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=oIt0v33rjciqAFSJM93+0ftvaG8TKg4ll7wOGlGSN
	ZQ=; b=Knyd06QGzGPJNa62VQdYUCw8qedzlhoZDsVntXdoq3yWiRGQU97pj7TVv
	ogdHFZmfMLETVztpbILIlfVi7y236WZHJd98BLKwjY7DNsH9XPaR+qFQuAeiNhFm
	fZ/r+UBdffDlzQQz4Gb19Hp7nA0vYhJwxsBg27Szmk99FuhXXIejCCOslqLat/Ro
	sjXWRb5kTX7BniWx0U2r1PTYI/xnVqjLo5ZWvIkOFCK0IGwG6yWFhuGzCuGESTKF
	hmul+WUVh7IywhQD4asAf5Snhypc4FbWDEoc1kACEIy03C9WIur2qTAtubJDmaQM
	aAGrEemB6MouNcG7d78IfSR5FXiyA==
X-ME-Sender: <xms:nAD_WNBw0wAi23Eamr6pxsybNalOaBv8lc0wDu79uVNDwXnSBUpY-w>
X-Sasl-enc: McDoeZoQNtvikGtwzThR3HgI4wlwRuVbhondrqX23xnS 1493106844
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id EFF7C24813;
	Tue, 25 Apr 2017 03:54:03 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH v2 04/13] tcg: keep TCGContext's read-mostly fields in a separate cache line
Date: Tue, 25 Apr 2017 03:53:50 -0400
Message-Id: <1493106839-10438-5-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: 8o6VqCwKfKhl

Upcoming changes will require reading from TCGContext from a
parallel fast path. Prepare for this by keeping the struct's
read-mostly fields in a separate cache line, thereby preventing
false cache line sharing.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/tcg.h | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index 5fdbfe3..b26f0ef 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -642,6 +642,20 @@ QEMU_BUILD_BUG_ON(OPPARAM_BUF_SIZE > (1 << 14));
 QEMU_BUILD_BUG_ON(sizeof(TCGOp) > 8);
 
 struct TCGContext {
+    /* Read-mostly fields go here to prevent false sharing */
+    struct {
+        GHashTable *helpers;
+
+        void *code_gen_prologue;
+        void *code_gen_buffer;
+        size_t code_gen_buffer_size;
+
+        /* Threshold to flush the translated code buffer.  */
+        void *code_gen_highwater;
+
+        int code_gen_max_blocks;
+    } QEMU_ALIGNED(64);
+
     uint8_t *pool_cur, *pool_end;
     TCGPool *pool_first, *pool_current, *pool_first_large;
     int nb_labels;
@@ -663,8 +677,6 @@ struct TCGContext {
 
     tcg_insn_unit *code_ptr;
 
-    GHashTable *helpers;
-
 #ifdef CONFIG_PROFILER
     /* profiling info */
     int64_t tb_count1;
@@ -697,15 +709,8 @@ struct TCGContext {
        here, because there's too much arithmetic throughout that relies
        on addition and subtraction working on bytes.  Rely on the GCC
        extension that allows arithmetic on void*.  */
-    int code_gen_max_blocks;
-    void *code_gen_prologue;
-    void *code_gen_buffer;
-    size_t code_gen_buffer_size;
     void *code_gen_ptr;
 
-    /* Threshold to flush the translated code buffer.  */
-    void *code_gen_highwater;
-
     TBContext tb_ctx;
 
     /* Track which vCPU triggers events */
-- 
2.7.4
