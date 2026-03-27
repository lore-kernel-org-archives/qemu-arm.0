Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579E410F284F
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:55:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AOf-00068o-2K; Fri, 27 Mar 2026 12:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOc-00066r-CI
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:50:54 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOa-0005EM-42
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:50:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-35c1107d4b7so1944410a91.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774630251; x=1775235051; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2jhG0JdJkpzPMpSo2GG9wEa3WbWFhcOQfxGH9DnApU=;
 b=qsQYPpep2DnEQYrzVKFrtgLV0OW9JJ6lgHZirmk7ns7sWKT28zctfiUGiTFugjH3t9
 NZjNYAJLwVSViKWcFRyH2EGGIDy1sIt7G4VEWCZKvSMtL5KY/8HkJw2f+8x1gS7nY9Lv
 vTchGr6zJNR57NRqxgBuPzQJ7V4OU1zcgGS2Bhvfy80qcWLru8DA4TNTg2OrD3bbJu3T
 EdyI95/xJlR6Y/mbixAHkmijUlNmts31IeoKpf8J7HKDvhh3mTUusdiLZBEh/wa+HWvt
 pzUD4j9thVxfN5Mb315Nce+zaRJsTNKBRbcWojL6CQwrRRS7HEguM2Xxalh8yb0eu5r1
 Dnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774630251; x=1775235051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r2jhG0JdJkpzPMpSo2GG9wEa3WbWFhcOQfxGH9DnApU=;
 b=B4+UUQrD9b9x+YKNUca+8Mu0f/ppnuI+IbB84H6Yuqg5d9GUxr2uvcjcDyW/A2Cedi
 sPJeLZmZvvrclittClr9ve4H9+Y8cukbme0A0gyjstng0zXtgGJH/JbCaDgfcYgRcHUi
 8CKE9rJB6LVFpr/bsGaJorkeiMMDn5SRny7Jb+bNcJYubTWj8vksjnJC5DfyAgQ2MJTa
 T/jmSjat+QrOT82ic1ALSLOZmRGNZcBj4Ixmp2D3m3TqF58j0rt/8Qx6okupk85ONcvf
 qFoLxSmzfCAp7lc/zynN+vLx+cZgu3YXpUwVPvMeXYTjUh0cJqnb1E90JCi1ndlxVUk1
 kGGg==
X-Gm-Message-State: AOJu0Yzy1m/j9KZysr+DRqKPJJN7472kY6k+cTI4RqTbTyAmX80jxX47
 /e9G0lXaQk6eE2LkS+ed6W7VKt1QZQYx9vGWGiLhituswDRg5m/UgXCwbUxgMxXus+w=
X-Gm-Gg: ATEYQzyA1fZfpTlu8p/DGqwLt5wOPuvZKB+qusgS/JkBYP+xzk2dGNk8iUi+7qkJj3Y
 uaL91+FR3rSIjQHXtDOZKlPehHECDNVKk6+FABTkIIsPoTlAqALvnv/TpSZw29GzYJmoux3YlDd
 epnL0Yk9VMKhN3g7bV3dq2qviqoC3/+IchQmsBXd/CpIs/6d9U+1SOtR0xFJrMZV9GOj4j4GZL7
 0satfwaBx7Od5H4L2yXE+aoZoEll+BhzMUKkwXQk6+iN0sXBOh/exrJOhN9YOJXBWE52FsdbwB3
 OyjASMX6NzVos6yQrVKx34uNRYW2RETI9TEa9N1FzDc0F8BvEUft+SZ4AF+WQXE6WeDoqLeiR2M
 vQxZ6NtZGFE8Jn33VSgEg+YG/mGQEIlA61WlUSwnbRVaNJ4J6wEPgWBmNyFzcybFRTxbkkivM6A
 OpJFTjPkd4S36oZkG3WxHYqA7c7sfTYkI4WfhPREEXBMeE2oIpjNJSkq2p6I7wQqAr5CkvMS0vm
 R1Z
X-Received: by 2002:a17:90b:5291:b0:35b:9dba:be26 with SMTP id
 98e67ed59e1d1-35c2ff602demr3046656a91.10.1774630250622; 
 Fri, 27 Mar 2026 09:50:50 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c767399e0casm5514038a12.31.2026.03.27.09.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:50:50 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 03/12] target/arm/tcg/translate.h: remove tcg-op-gvec.h
 include
Date: Fri, 27 Mar 2026 09:50:33 -0700
Message-ID: <20260327165042.604105-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102d.google.com
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

Include tcg-op-gvec-common.h instead.
No target/arm code rely on target specifics for gvec ops.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 6d52606f9b7..e28eac54afb 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -3,7 +3,7 @@
 
 #include "cpu.h"
 #include "tcg/tcg-op-common.h"
-#include "tcg/tcg-op-gvec.h"
+#include "tcg/tcg-op-gvec-common.h"
 #include "exec/translator.h"
 #include "exec/translation-block.h"
 #include "helper.h"
-- 
2.47.3


