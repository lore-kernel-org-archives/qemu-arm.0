Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A1CCD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:20:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZ9-0001UE-Ag; Wed, 20 May 2026 13:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ7-0001SF-AH
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:41 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ1-0001xp-VM
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:41 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3698e34a567so4491565a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297514; x=1779902314; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTV+CLBxiOJvwZGNE9Pre6H8XgUGreJTp6/Amr+aefE=;
 b=vzfMCNw1cOejXQQ9hFqdLpu52Rvb/WaoYpSkDdxxNwLz9i0K3x+45eYbrbSY0e5MDR
 /SwBAEENf0+CFmw8LjndpK3yicorehGOD/aURY43Iv4qWIYGdEYmp2Wr+jnDOJKarhYq
 UYmqdktTtp8BQWynPeeCoIc3nZyB4DZJ3suKr2kyJzEZQSHwtnZ+L5+pcjdJ8WrAii+7
 DLlCBVCoC3vzui87YS4oAEpIcW2MwZJ4YhB71mX/HbU6EL065EOWNEiGMWxyZDiz3ii6
 NK94bRUqoW5HXU6ep6D9lK0rdt95+scjzMqnclPHsCpxCAOfM6HlHO6AlGEXjlJGGaQG
 ECGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297514; x=1779902314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eTV+CLBxiOJvwZGNE9Pre6H8XgUGreJTp6/Amr+aefE=;
 b=ZwtB3uCTqe6dRn2Xyt/6wo4N/7FMfTgvhwWn5s5ycnXik7IZc6P5Iv9h6qzR59Kd/f
 a8+RFMK61ChyLzJurtjldP/7z/zJj5H9GEf0m6fR1xae2uzIO1tvEtffHAtJTRjC0q3H
 AX4wGeQ3boXpe+Y7QTZKvd1+qdHWaybOzQBeMFsc0W6XGShHxgdZS0gTA+S63zg+uB+g
 KpQvkhj4c4h7BxNWm+fqjyKqumVCd0mwAo8F47NYWerivnLkMG1t1NUfK552tmZvwnza
 fDwLHabQAEJTn4P892UJ4G3MgWqFQkGpFuOevh+ttVK6KGcCLQ9GysUPYrM2cnMbtUNE
 MnYA==
X-Gm-Message-State: AOJu0YxHGFE9REInZth1uLNicOUKhG7AUUy4Xxvcl6gRJkl3GnLARQso
 +OzK1fGGkQx0JtMjdiEHjvGPEXZv/MHu08RK+xeqfgwHtJueRXLmwIQDMEYt2HleZUU=
X-Gm-Gg: Acq92OHKEcoPqJjRr993w491L5p9T6OqAUc6OvdZiL137DIeBzQyUjBQ92YNC1HY7an
 8LbrrdDfhRab4+0NQMhgzc7umBqdmj4nSewjsIvUJzdudp1FW2/8QYAOw/wdUSkKQ7ZWRiVT88H
 Y9JNO7//NBNFjj/+lzAFOarE8wEt7DDHkJyqJA2Lvb1e9BUtOlhp8Nruyi5kmUCbaMwPeQ7JgoR
 l/52/dfYVCCovx/x98jdN+CUS/iv15xWpQLLo/qsnrckZmYmH1KbbK9gpijqiCrIOkWIs2RDhWq
 J8RHdhCgZQP2QrJ2Qy28kkS4ztg4KuaItGwfAdcAkAF5K6f016Zv4Dt4n6yVuSfiPiQaz7G8I5Y
 jFc6NEjTuVUARtxCq2N085ZvbTqXUS1JtcoCwDGk77U31YD0NVjAmIlne1qQLTeyQRUEzqtccNh
 R+qy3LvEpamlwJ+HciJNf+KPKjZUoS
X-Received: by 2002:a17:90b:4a87:b0:369:d22:4788 with SMTP id
 98e67ed59e1d1-36951dc3ebemr25948746a91.25.1779297514503; 
 Wed, 20 May 2026 10:18:34 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 17/30] fpu: Use get_float_2nan_prop_rule in partsN_pick_nan
Date: Wed, 20 May 2026 10:18:07 -0700
Message-ID: <20260520171820.848839-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index fd3e79fd3e..f40a950b41 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -53,7 +53,7 @@ FloatPartsN partsN(pick_nan)(const FloatPartsN *a, const FloatPartsN *b,
         return partsN(default_nan)(s);
     }
 
-    switch (s->float_2nan_prop_rule) {
+    switch (get_float_2nan_prop_rule(s)) {
     case float_2nan_prop_s_ab:
         if (have_snan) {
             ret = is_snan(a->cls) ? a : b;
-- 
2.43.0


