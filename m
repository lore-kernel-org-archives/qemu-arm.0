Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE965F9EDC9
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 13:04:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFXE5-0001J5-Nj; Wed, 22 Apr 2026 09:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDw-00017M-Bo
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:37 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDu-00018h-Hy
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:36 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so69655945e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 06:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862953; x=1777467753; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1esNeOF5ufpO0cAxHdsE5rjzSjC5Q+4Ajm02teJ1954=;
 b=wN2cFoAdgfV5PPEaxX/8KRcFgz/2E01mNExfCl3hvPxbkX/VPM0tXnwwkwHfc64jsV
 cdsriHsH1ayPUYvzNYhlX2nPwt3zk8pfWCC0wuF0WZjMBYYK6Lp+YbT9M9W+Lw7sYju6
 m7eiGQg/hdfxwvQ5TpO+9VsC83wW1yygr676R52fKiiZ1EITlPwAfGkEbEyA2vskEns1
 o3UxAG6p9BF58gQv2BI90HbI5wjxqstlXmZaPhk/8ZOoYJ68cjBmyVek5oaeV2noHxO6
 xnhopUuFtoCtF5sDTdALms8KlVHZKfUNPMxpBtYf7UJwvAMolEoFma/2pVJy09pI+7xv
 0wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862953; x=1777467753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1esNeOF5ufpO0cAxHdsE5rjzSjC5Q+4Ajm02teJ1954=;
 b=ReIfykv3EiKpzwaMUcwlp3lnyrGWnWm+9d+z2MmUzdNKT2CZojhrP1Qti3olksiQGF
 lKejBNu9B83PSoUQ5gymDVEk2wuvmREbFnaxzdswiLZw9TO/kjtTjVe7gVWMu3igN8yb
 LHZecdyR/QO5ZhxCkyrvEwn+y8aeDAiDhTBXHCEXraFqXbY2rD5oDCRJwxtMrheQcWtZ
 SwNZAC6Uc8LaxgexNpaf/Q0xyeVe1aV34as8EFtHFkk8Ji578jh+9UYBWaSCGob/6i8j
 GumYGcvz0pWiNOcUF1WUnPXSVgHq8qoqq9Cc1v/S1Kb2GXPmEfJHB/FljXUaJrs6OutZ
 r5JQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+QbGxOOocK5R1T7eZVryble593jzxLpA6vV4wLiaQutiPvuDZ7l+4ltynz3PxGFXASO6PGr2oR6g==@nongnu.org
X-Gm-Message-State: AOJu0Ywe5JAqE0gal0Z3QNWA5QI1KiE2P/Z5sxNQby+DV8y8QsOffWEz
 owmoPedxrlt3FbGQdLKljnP5A4syJYB78n/gs3MwYA7NtGY5IOUocgvo+EA0nG5SLh4=
X-Gm-Gg: AeBDiev/428/Nw1d6Lw/0fZpqQlPyw76BdKCNPOhWArkZE7fjUbAOaOMQUabbK1hIay
 WWcI0OrFZ+8UkpwJgUgcRbxSxOxZ7CsSmaUjK5Wx3IpvGic6EgpTWdYKnWXvd63rDo9BE3ODMeM
 XaRcNxtXP9JMj1dtPMU+udA10DYMjCwx0QbWct1BvsfXrpTZk20gMuGNNz0a5nwY4mJaKIxXXtz
 JgxYjFdUwrMn+hJ2eQvMM7TfJvpCg6Osu3JD9Pq7cPlBa0phKAU0Pnj/EdfOrW8KyVIp0DWfj9H
 1PAJ3xf5Y5cChpV6WqdNPdERDnm1sh6Sr44+w7F4Cf+mF+q2qBBWBah4wAHsaX6+6Mm1lJiydQt
 8xlUpy25TnOeyktJvJIog2VSXtXihVO+cVpcPndSiKeY7FniwPyGT8VrpaePCAPFLxKC7B1NXfN
 dRml3OEyOcjECH2uisqSlpx8tcQGaSqvbouw==
X-Received: by 2002:a05:600c:a108:b0:488:a82f:bbb4 with SMTP id
 5b1f17b1804b1-488fb78a0famr276133055e9.26.1776862952883; 
 Wed, 22 Apr 2026 06:02:32 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc10019bsm458543425e9.4.2026.04.22.06.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 06:02:30 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 64AB0611AD;
 Wed, 22 Apr 2026 13:52:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 18/32] target/arm: make whpx use syndrome helpers for decode
Date: Wed, 22 Apr 2026 13:52:35 +0100
Message-ID: <20260422125250.1303100-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

Rather than open coding a bunch of shifts and masks we can use the
syndrome definitions. While we are at it assert it really is a
EC_DATAABORT.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/whpx/whpx-all.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index bbf0f6be961..4cfc7f99698 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -356,15 +356,16 @@ static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     uint64_t syndrome = ctx->Syndrome;
 
-    bool isv = syndrome & ARM_EL_ISV;
-    bool iswrite = (syndrome >> 6) & 1;
-    bool sse = (syndrome >> 21) & 1;
-    uint32_t sas = (syndrome >> 22) & 3;
+    bool isv = FIELD_EX32(syndrome, DABORT_ISS, ISV);
+    bool iswrite = FIELD_EX32(syndrome, DABORT_ISS, WNR);
+    bool sse = FIELD_EX32(syndrome, DABORT_ISS, SSE);
+    uint32_t sas = FIELD_EX32(syndrome, DABORT_ISS, SAS);
     uint32_t len = 1 << sas;
-    uint32_t srt = (syndrome >> 16) & 0x1f;
-    uint32_t cm = (syndrome >> 8) & 0x1;
+    uint32_t srt = FIELD_EX32(syndrome, DABORT_ISS, SRT);
+    uint32_t cm = FIELD_EX32(syndrome, DABORT_ISS, CM);
     uint64_t val = 0;
 
+    assert(syn_get_ec(syndrome) == EC_DATAABORT);
     assert(!cm);
     assert(isv);
 
-- 
2.47.3


