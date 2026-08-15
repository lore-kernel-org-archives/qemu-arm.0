Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D94C5CFC1
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 20:37:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvL8S-00084A-Nz; Sat, 15 Aug 2026 16:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8Q-000829-Fs
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:42 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8O-0008AG-Lb
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:42 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-381b831d535so3359561a91.0
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826259; x=1787431059; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=p1tuew/8yZ3WUepEtCLWv5OHi9k/pwAQkc4Skx4oIwo=;
 b=LNzjA/LnIYLGqFRYhQh5V2Qe3RnNvKD1fu/1bp0yoaaGjapKvB3Z+s89K6y58rHEQg
 HVAUdRAfaoHbaSQIyvvKWWyg7AMB7zmBW6+rgUsZvgL9t5zAofrc6nA5z/fOftvL3foU
 NsIBhFIsqdJytK8hb+8A6HXK5liyz2AT08scQNwuC+aTzgcH4gkq1yfyN5QdkwXe3S4V
 UcGZVmDCkhpFXr9NzG8ed12rI+IDZFn4W+IOwmrIXXmvyYKqzdyy+q8Q+WgGDD6q5Ofx
 XnUZyz6smiR9RdelNEVDx3UzFkX0sqxTkF42t+fH2xj5qPjd+WbmkUbF7EISbUfNeNDS
 qWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826259; x=1787431059;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=p1tuew/8yZ3WUepEtCLWv5OHi9k/pwAQkc4Skx4oIwo=;
 b=V6305bfQ7+DqZxyYyZHHAFwTgNvI/wZsn6SRZG/UkTFvf9txeMFsJEK55b8TwLkfWW
 woUtV5iQXVokX5DTTsyjooWOpTUSlhJk30Bx1KPHf6Jw9d+iNUEODNQpoSa37EaNX9bB
 Y5/UXrUyo7mntV44mAO11Zgm1xXCqDRByrxfrBxWo96g/xOPS2iwtbJ938lk0SoAktux
 hEsGJ+Ax8l4kj0buFIeXydHHSj4iZFf0nDOxHWvEU9byREf2kbSsknI9/ZCmtRyHdYV8
 T418OtyF5rFfmGB0OLKtRu4kb+eNerv2/KdTJ3177qcSt0sv+SfAyarQVsfZcac3m9Cu
 ReEg==
X-Gm-Message-State: AOJu0YzfkMBn1F2fdPpoW9gjBUgMRHsSURjO/AxDKzHgV9YHtDKZGk1h
 6rtV98nVqCVH0sDMFtKDfNEZAG3ySl8DFnU/7Nlv5gJrNFcSUnnkveUuhB4EVl0SvDp1o339wDo
 efSXh
X-Gm-Gg: AR+sD11e3KP+gAplGa4Q679GXZxa9BWnrmLeeMF7LGH9nXgll0K7+q5HOp3+LQ4L9OP
 Go1RCWgda9pfpavM1n960bfIUJuERyjSnaS8dYbgTHB6uh8jes+rV9WTO5+OQgaa+6FOnp7QJEC
 jH411UZEQyMPbDnARPsWEaoAVdxPS29jADLKk8ohTdV0pA46w9Hsf3/CtVK8/VT4AeKM4S8go15
 gpYFHUMtOJqWV9qP6mXDMbmIV26CpIOhJ5xiFoUFGffhGaqpAULTW0eh4keoMic4x6wWcPqQSpX
 zHiQmoBczgQ7gV0HgAmLurcmAaj43J632e8IbjhWm67BcgeFUyvz7GdYdoRpA80j/8XAqX0PDQV
 wkRC7RHV6QShhUANip5gYWMlwBA8ZdVbhs3DgGiwWS4pyL8l4Tbzjf7oJXTur+ojsfJrRKfItkc
 HkY9TAs9WQsAB7ejYfjaRJMoo4juQ7GFuzqNOKpvlXD7FPBHFBrF6SfeMLzT1XDuHyInDcc0wYW
 Rhl0PTAjzJmz4eQtRHc
X-Received: by 2002:a17:90b:2b8e:b0:38e:4f41:83df with SMTP id
 98e67ed59e1d1-3933b8aa611mr17329444a91.15.1786826259247; 
 Sat, 15 Aug 2026 13:37:39 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [RFC PATCH 02/18] target/arm: Simplify invalid page test in
 allocation_tag_mem_internal
Date: Sat, 15 Aug 2026 13:37:14 -0700
Message-ID: <20260815203730.1468365-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mte_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index a1d8618ddb..e3952fcabf 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -132,10 +132,10 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
      */
     flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
                               ra == 0, &host, &full, ra);
-    if (probe && (flags & TLB_INVALID_MASK)) {
+    if (unlikely(flags & TLB_INVALID_MASK)) {
+        assert(probe);
         return NULL;
     }
-    assert(!(flags & TLB_INVALID_MASK));
 
     switch (full->extra.arm.pte_attrs) {
     case 0xf0: /* Tagged */
-- 
2.43.0


