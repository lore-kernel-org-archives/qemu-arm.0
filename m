Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B757FEB2711
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 20:16:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpu9c-0008JB-4p; Tue, 10 Feb 2026 15:16:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9J-0007nj-Ei
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:53 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9H-0008AK-9U
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:53 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2aae146b604so19948995ad.3
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 12:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770754550; x=1771359350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VA/qlQJvE8uq8B0wfP8QzURuC1Jx2blScgULUKFJUFo=;
 b=bwHLPgjFbLltWCVfHlygRpU26Pl2NHNSNW3RUNP+7kxYT6wDSyGYsIKB1Z+KuavnT2
 7za3doF9F8xYsSb5aE0B0MLuBQWtcQ3dVEbNlbCi/3RHJiaq4sr/xQCPL1t4Y0xu2V6T
 LHd/TDfATieVn3tQKG2i5Z3SRwCBJRctAdUyi/5zm5DysqwQhlIs7w5TAjCWu4w1dzJR
 6Yq46XqTCP7s61qLfytlM289WXa5hq9sYbGvYg3g7E0ENRDHaqJu/zX9By7cEOIbwT2Z
 DtM7J9BcJox2oOmCUobv0egbwoIq5rS2fBUCg4Rb2wwS4nZaO5THyskYzT0Z171ym9ky
 AWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770754550; x=1771359350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VA/qlQJvE8uq8B0wfP8QzURuC1Jx2blScgULUKFJUFo=;
 b=dgXvAcg2lGhgct5llcC4vrWreRxNlx5njpPGmvdhp2L1lTvtS1CVtin8lp9GCKY/Hb
 ExGHv9MIYKtxmHd//z23iqpi7xmgzYFWyaTs5CiyAo/2kxnnnqd2UgbLR+7Jfd8Dc0QZ
 UwKAKeHATijhoWfvAWHY1T1FWRmZQhIlWydvlyN/5NSOVPltb7CAcdqllLRCigsFeKsS
 +J2eHlmNRZYa6URdGNeWHcT7Mx7vwX31576pc3OQZY1ccIMcZC6Cyxj0zqRRa5YAFVDV
 39KfphRbkNfrcKnnKbTqCdMOq7f6OFNrhKysrAJRXWCy4ryb5h1k5FXNWwop5F2jNfo7
 S6bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7H8cvpDDTYtqkbTTE8KTNgBp2AnIiUK0CNVRLaH8vLmFjb1VTs0Bi5qYmL4Q37xZ6XOT4F8mxhQ==@nongnu.org
X-Gm-Message-State: AOJu0YwMYaQN/bKBhb7oT7zLiAtm/MFKl2lxbns6XiV3ZUU4dIm+GVOD
 ZSl66SiKO2dj2EzNbeuxhF2efviMibNSqbs0aV0aYmjoNzGHTSRbC9V6zjHNgPTZGKQ=
X-Gm-Gg: AZuq6aJDTXwFmx8oScWdIsc33TSjC5mLfyqgq+IHMo7o54LtsYZpgB0+xUuZKX17cso
 a3MZqkNosZQ1a6obUzfSt4hvTYnjZmqLbQ3CNqmFKgYJjhgc2qxUUsUXPSexk93A2Bo63+N4H5k
 T/LL0UzJ509HYJDpMG7UaxQLG0+YICBXQF4BWrRpcNm48QS4dMP0G7Adeec6Yu8CERtivhqq8bS
 58xPUZU9r+cO1rXHv6vqaqhpk64lRAknd+ObOcKLe5w7QH1Oi4S++obFb66mEb6tjrbb77ciZDR
 txsBX/SrnUp3QznWNLLtV44VJ5Xs1lw3HFheD05LV3LRwXBXaop1sWQ9BzhAVwyaQbSgE7fJFmI
 OIF9HrUfPQmouYDFU9BV077tL05JnMRQrs3g4MMkdShlz6O5c0aLaqalSRJ12VXXdv9bUzOyVcI
 HqYmvx53xLZo5RXCpTY4bPdJ+DKBQzIQ4ZUH3bmtqX1O0oqF6Nlqr6IbD+IxyV1EOZqL9C0IB3c
 WR/nMZPmMoThG4=
X-Received: by 2002:a17:902:f601:b0:2a7:5751:5b30 with SMTP id
 d9443c01a7336-2ab10549744mr34280145ad.12.1770754549501; 
 Tue, 10 Feb 2026 12:15:49 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab0b392cb5sm38523225ad.70.2026.02.10.12.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 12:15:49 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 05/12] tcg: move tcg_use_softmmu to tcg/tcg-internal.h
Date: Tue, 10 Feb 2026 12:15:33 -0800
Message-ID: <20260210201540.1405424-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
References: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In next commit, we'll apply same helper pattern for base helpers
remaining.

Our new helper pattern always include helper-*-common.h, which ends up
including include/tcg/tcg.h, which contains one occurrence of
CONFIG_USER_ONLY.
Thus, common files not being duplicated between system and target
relying on helpers will fail to compile. Existing occurrences are:
- target/arm/tcg/arith_helper.c
- target/arm/tcg/crypto_helper.c

This occurrence of CONFIG_USER_ONLY is for defining variable
tcg_use_softmmu, and we rely on dead code elimination with it in various
tcg-target.c.inc.

Thus, move its definition to tcg/tcg-internal.h, so helpers can be
included by common files. Also, change it to a define, as it has fixed
values for now.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/tcg/tcg.h  | 6 ------
 tcg/tcg-internal.h | 6 ++++++
 tcg/tcg.c          | 4 ----
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 60942ce05c2..45c7e118c3d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -445,12 +445,6 @@ static inline bool temp_readonly(TCGTemp *ts)
     return ts->kind >= TEMP_FIXED;
 }
 
-#ifdef CONFIG_USER_ONLY
-extern bool tcg_use_softmmu;
-#else
-#define tcg_use_softmmu  true
-#endif
-
 extern __thread TCGContext *tcg_ctx;
 extern const void *tcg_code_gen_epilogue;
 extern uintptr_t tcg_splitwx_diff;
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 2cbfb5d5caa..26156846120 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -34,6 +34,12 @@ extern TCGContext **tcg_ctxs;
 extern unsigned int tcg_cur_ctxs;
 extern unsigned int tcg_max_ctxs;
 
+#ifdef CONFIG_USER_ONLY
+#define tcg_use_softmmu false
+#else
+#define tcg_use_softmmu true
+#endif
+
 void tcg_region_init(size_t tb_size, int splitwx, unsigned max_threads);
 bool tcg_region_alloc(TCGContext *s);
 void tcg_region_initial_alloc(TCGContext *s);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index e7bf4dad4ee..3111e1f4265 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -236,10 +236,6 @@ static TCGAtomAlign atom_and_align_for_opc(TCGContext *s, MemOp opc,
                                            MemOp host_atom, bool allow_two_ops)
     __attribute__((unused));
 
-#ifdef CONFIG_USER_ONLY
-bool tcg_use_softmmu;
-#endif
-
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
 
-- 
2.47.3


