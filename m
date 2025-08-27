Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCDDCA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:19:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4j8-0003a5-Ud; Tue, 26 Aug 2025 21:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hY-0001KK-Th
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:49 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hN-00009r-Cz
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:48 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-76e2eb6ce24so4998502b3a.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257093; x=1756861893; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T9UF9kwXsCF9XPGfLIekiKxdaKcYyBFch6OZM4B4BRw=;
 b=xwRGYWv7WQvWnmTf56qyvWEkGlDYhgiX/mnn9pyZRsfdEnd0E+qB8G7NXeEzIn11n0
 7iN2vVuWIVBOQhr4E30qQAMDBwhvBu+vG7dcgh9AL8E4UujIb80ATQJSEhkan1WrRv0v
 YtdKjm4IQ3WxREzZ+msPQe2Ij5WLwTglZ6i/4fUlCVmpP2pM0drbUrupz15AxOt/Xfhk
 bNw14CLP/e6JgwS/E97ll0udphhoiqzszLnOIQqfMiDq7CEloKBIznNFpF6rHN3gjIaG
 zNNDOoa5Za/vzz1bWontdzaiOOkc6Zr+aOsLJD+UVU+rw1MHSMVwLCKjxRTDTIoDLLm+
 41pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257093; x=1756861893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T9UF9kwXsCF9XPGfLIekiKxdaKcYyBFch6OZM4B4BRw=;
 b=PJzREtRFihaOnA3H3cz2ef1tO08C0/rL8oVjm8xppDKbWKph6VSPYRrLLv7bm4LCRH
 Y5IPFCVQrGzxLqaWUBLCGKkX9lIdqj58fPz2n20QitoE7IelwVOpvxY48+Qj2MmvR49U
 KpHqu0ToJKV0CC79Wg2VUWv0qxXikZUdK4VvHGykRCPc/SpNpAohJAKgprTjPmweQCzA
 mUZSr9AQqcGPK05hE5XDWGHLn+c1g3TpSDq/e6TAe31z/1FAhLaKKBVBCSj1tMH1Az3N
 3YRita860xW+rZpxO1ZNnTYofZxY3Z63nwYYGSrQ6aN8iaWjyQ5AF5RID+UFNqt7V8y3
 c9Hw==
X-Gm-Message-State: AOJu0Yx3CbXLtBFVRC9TqDsZ8l2G5XnQXQiGQr/pCX0N9n7LGT6Cu+YJ
 +n4HgYsnQZjourDeYK0G5NlHJG5/zNYMNNf8YbBO19OIf2rDINwhWOQGcNm3SmSagWM=
X-Gm-Gg: ASbGnctFVVmiIJ/bDyk+Rr/zg2uN/6KbbPa2fLC/YEh6t5ry+59bvvw2MFAYh63GJGU
 20bqQS39YU3+oDmMdZqH8w3WN9Ptj67NgPkxV4kkrd6CWT2c1Fzz2UlxKXXlI+pwyXXty7Asbyg
 iHPRDoPtHUnoK5rK0lxhtrFYJTZUZuJQlCtzAul8xtTuw+qDOlcCcgp6Ty3mRWu+/4y4fllTe+A
 ZMR4KpsTyOFQNly1lf0LQyL9syS/xPIuBCQSH3t0uzWj0F3aq5IFCG4igW2EroqsMxBpxthUjrA
 Lf53stX5ftBQKALSgk5R6BHhzHGU2vZxwfy2c9CxprUd86jkiwDU+NiG8wfkl68UXKzs2A6DNbm
 j593nwpWrvVoGHU6gVIXYvk9Nmg==
X-Google-Smtp-Source: AGHT+IF/mzYod4qjdc8jh/cuhqmtw6VGdJ9fnFM/FRHRUt5DojyjaDdxsRaJ55ygP+nmSAO1U+e7iA==
X-Received: by 2002:a05:6a21:99aa:b0:21a:ecf5:ea71 with SMTP id
 adf61e73a8af0-24340b5b4cemr26504217637.15.1756257092735; 
 Tue, 26 Aug 2025 18:11:32 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 47/61] migration: Add vmstate_info_int128
Date: Wed, 27 Aug 2025 11:04:38 +1000
Message-ID: <20250827010453.4059782-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/migration/vmstate.h |  1 +
 migration/vmstate-types.c   | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 1ff7bd9ac4..3b3416c2c9 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -222,6 +222,7 @@ extern const VMStateInfo vmstate_info_int8;
 extern const VMStateInfo vmstate_info_int16;
 extern const VMStateInfo vmstate_info_int32;
 extern const VMStateInfo vmstate_info_int64;
+extern const VMStateInfo vmstate_info_int128;
 
 extern const VMStateInfo vmstate_info_uint8_equal;
 extern const VMStateInfo vmstate_info_uint16_equal;
diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
index 741a588b7e..1476c278e1 100644
--- a/migration/vmstate-types.c
+++ b/migration/vmstate-types.c
@@ -18,6 +18,7 @@
 #include "migration/client-options.h"
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
+#include "qemu/int128.h"
 #include "trace.h"
 
 /* bool */
@@ -193,6 +194,35 @@ const VMStateInfo vmstate_info_int64 = {
     .put  = put_int64,
 };
 
+/* 128 bit int */
+
+static int get_int128(QEMUFile *f, void *pv, size_t size,
+                      const VMStateField *field)
+{
+    Int128 *v = pv;
+    uint64_t hi, lo;
+
+    qemu_get_be64s(f, &hi);
+    qemu_get_be64s(f, &lo);
+    *v = int128_make128(lo, hi);
+    return 0;
+}
+
+static int put_int128(QEMUFile *f, void *pv, size_t size,
+                      const VMStateField *field, JSONWriter *vmdesc)
+{
+    Int128 *v = pv;
+    qemu_put_be64(f, int128_gethi(*v));
+    qemu_put_be64(f, int128_getlo(*v));
+    return 0;
+}
+
+const VMStateInfo vmstate_info_int128 = {
+    .name = "int128",
+    .get  = get_int128,
+    .put  = put_int128,
+};
+
 /* 8 bit unsigned int */
 
 static int get_uint8(QEMUFile *f, void *pv, size_t size,
-- 
2.43.0


