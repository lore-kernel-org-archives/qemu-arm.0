Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6571862ejq;
        Mon, 15 May 2023 08:00:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4K127+UFd/h+lSVIOHP0Y/2WFmaAQvh7w9OwC3N0l5cjuu7DiOPVvjaYEJ5zrxrJN8xvJ/
X-Received: by 2002:a05:622a:14c9:b0:3f3:99fc:5598 with SMTP id u9-20020a05622a14c900b003f399fc5598mr39674414qtx.14.1684162837491;
        Mon, 15 May 2023 08:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162837; cv=none;
        d=google.com; s=arc-20160816;
        b=FHFSLolGC1G+YOGQSi+EujN+W5NSKdqCeg8weK0Wgva8nEjndihly761ofIWneWlrb
         IMqwsKQSS/IuyngwbFus+qdASBYhC62n6RzROcUWGlwI6zoGzYObPIr0klzSR9be9rKm
         EPutUisI4CbUueXWmeL1Am1VmZVFnl4N0ux7aOQwL9VodtlcM08tQzC+q8Q/DsmpwPtP
         olL+PJ9HlDtqzEFSrk4LF6k/Nz2ZD1MluoNZvUPMpQw+IwoTmJm4CPiMl3shUeI0QJHN
         bZRXPxG2s5yEIakbppwKCLol+m2Q3R0gKScUHqZBokM/LOv0Dni65AEuTFkJ2VTgl/0m
         tdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dp9FxODKTIpcK97erYATVmrCbIv6BXH7ZL9RlqvYq+w=;
        b=0WVcJSuXfqJizeTPGKC5phEQ3YGTidDMTeavuA0CchK8TZtXooPVrwnqueEW24vTBv
         2JrDmrpf2tw7H+4rBp5qj9cGTbr3gj47q0PItoiv3vQgu4S9fhhSA7O8Pu6zAGGVAO+j
         4xgfniJJ3Om5ZNAeRykIrx/bMVGG7aItF/rk1toY58/lLTxWFwAHmPogDemFhIusQVZa
         d28uWrQlMaKat6jW9xo7ZOCinsidDg5f3DdwcfyNGpaOtuFfDJG0GGlOY+v1f5TvlLbe
         hR+psb6Zg6FCspOBb7h4wkdptF6vQVm4DMugDX0vJT2ZF8HcOF7SRhnneCW/Eqm5/yAC
         cq/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N1ObHclI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q27-20020a05620a039b00b0074df9f3ac98si9309362qkm.351.2023.05.15.08.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N1ObHclI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIz-0002Ad-BF; Mon, 15 May 2023 10:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHY-00070s-E2
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:38 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-00053v-Kd
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:33 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aaf706768cso98047235ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161228; x=1686753228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dp9FxODKTIpcK97erYATVmrCbIv6BXH7ZL9RlqvYq+w=;
 b=N1ObHclIYSmQj3x/Tqz0fa6BrVLfTfVc45/xtvmZ2EAv0lp5Pm5BQxEGeRSO7Y1+q+
 ffWh438XbLCblxpar3Km17KOpTWVWqhGBMDZFboaPfTNWb3bUHLsqNjNIupaNLqtxwER
 j3i9OvT1MsL2axuQ9bqWUztSdwZfG2hEcrR8JFruNwf+83P1/LtvKfJ28xNxf/7VJVDn
 cqfbnsDpCkzzXyTRWFcLVtQFzz56o7Gas/xgTR+mkYEtaB0++cFhJkibs+CtYdH71d/N
 60nbKvn1h7sHtJ/1qFvlvpyASBshC8Fc1qST9CfvpROtGsH2AbYuFEY16oNXscE5hs0K
 rRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161228; x=1686753228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dp9FxODKTIpcK97erYATVmrCbIv6BXH7ZL9RlqvYq+w=;
 b=fkfLFoU+4L/44TWoqbzbjG3dpCnioSkZ7Hf40XmU/1GTG8Z6LZiQlw7lleINIsOd+V
 TqysjKoIsDQMdUQ0xMmw1+6kGdIqtriETatSB30sYDrr7oGkGqKDGpivO/cMjgw00QEz
 iLux+P8wTd4/C4/DtCi8HmkDjiaox6Ne/3ZbR8y+hA8S9fWRLALZ2OPYPnj45+DGrspG
 n50D1cJJ5jcQBoPyGaDrZ7iaiXZMMc32dvKp7Mi6VnVsm0Tz9Ef6Ba1fPeFKOjArYrVh
 l+szgODr1I553OHkky281jUyIo2o4oLQKNb1RryTc+ZTpwrx2TKXV0s2e/Zyk6b+zMiL
 AYHg==
X-Gm-Message-State: AC+VfDzadVRfWBFlxhclVhRgcFbj26RBVRIaXXd6wL/H/lmxaEmEcZkz
 5c4ToHKGKRCAG86sl/Elucr9x5tZ2N3FZggKSAk=
X-Received: by 2002:a17:902:ee89:b0:1a6:74f6:fa92 with SMTP id
 a9-20020a170902ee8900b001a674f6fa92mr36555098pld.19.1684161228124; 
 Mon, 15 May 2023 07:33:48 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 39/54] tcg: Introduce atom_and_align_for_opc
Date: Mon, 15 May 2023 07:32:58 -0700
Message-Id: <20230515143313.734053-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: El0+Y2AozKtm

Examine MemOp for atomicity and alignment, adjusting alignment
as required to implement atomicity on the host.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v5: Dropped r-b because of MO_ATOM_* reorg
    Return a struct with the result pair (phil).
---
 tcg/tcg.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 10429be039..279ba2ca6a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -220,6 +220,15 @@ static void * const qemu_st_helpers[MO_SIZE + 1] __attribute__((unused)) = {
 #endif
 };
 
+typedef struct {
+    MemOp atom;   /* lg2 bits of atomicity required */
+    MemOp align;  /* lg2 bits of alignment to use */
+} TCGAtomAlign;
+
+static TCGAtomAlign atom_and_align_for_opc(TCGContext *s, MemOp opc,
+                                           MemOp host_atom, bool allow_two_ops)
+    __attribute__((unused));
+
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
 
@@ -5226,6 +5235,92 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     }
 }
 
+/**
+ * atom_and_align_for_opc:
+ * @s: tcg context
+ * @opc: memory operation code
+ * @host_atom: MO_ATOM_{IFALIGN,WITHIN16,SUBALIGN} for host operations
+ * @allow_two_ops: true if we are prepared to issue two operations
+ *
+ * Return the alignment and atomicity to use for the inline fast path
+ * for the given memory operation.  The alignment may be larger than
+ * that specified in @opc, and the correct alignment will be diagnosed
+ * by the slow path helper.
+ *
+ * If @allow_two_ops, the host is prepared to test for 2x alignment,
+ * and issue two loads or stores for subalignment.
+ */
+static TCGAtomAlign atom_and_align_for_opc(TCGContext *s, MemOp opc,
+                                           MemOp host_atom, bool allow_two_ops)
+{
+    MemOp align = get_alignment_bits(opc);
+    MemOp size = opc & MO_SIZE;
+    MemOp half = size ? size - 1 : 0;
+    MemOp atmax;
+    MemOp atom;
+
+    /* When serialized, no further atomicity required.  */
+    if (s->gen_tb->cflags & CF_PARALLEL) {
+        atom = opc & MO_ATOM_MASK;
+    } else {
+        atom = MO_ATOM_NONE;
+    }
+
+    switch (atom) {
+    case MO_ATOM_NONE:
+        /* The operation requires no specific atomicity. */
+        atmax = MO_8;
+        break;
+
+    case MO_ATOM_IFALIGN:
+        atmax = size;
+        break;
+
+    case MO_ATOM_IFALIGN_PAIR:
+        atmax = half;
+        break;
+
+    case MO_ATOM_WITHIN16:
+        atmax = size;
+        if (size == MO_128) {
+            /* Misalignment implies !within16, and therefore no atomicity. */
+        } else if (host_atom != MO_ATOM_WITHIN16) {
+            /* The host does not implement within16, so require alignment. */
+            align = MAX(align, size);
+        }
+        break;
+
+    case MO_ATOM_WITHIN16_PAIR:
+        atmax = size;
+        /*
+         * Misalignment implies !within16, and therefore half atomicity.
+         * Any host prepared for two operations can implement this with
+         * half alignment.
+         */
+        if (host_atom != MO_ATOM_WITHIN16 && allow_two_ops) {
+            align = MAX(align, half);
+        }
+        break;
+
+    case MO_ATOM_SUBALIGN:
+        atmax = size;
+        if (host_atom != MO_ATOM_SUBALIGN) {
+            /* If unaligned but not odd, there are subobjects up to half. */
+            if (allow_two_ops) {
+                align = MAX(align, half);
+            } else {
+                align = MAX(align, size);
+            }
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+    return (TCGAtomAlign){ .atom = atmax, .align = align };
+}
+
 /*
  * Similarly for qemu_ld/st slow path helpers.
  * We must re-implement tcg_gen_callN and tcg_reg_alloc_call simultaneously,
-- 
2.34.1

