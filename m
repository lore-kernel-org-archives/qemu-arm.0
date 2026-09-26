Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2603BC9832A
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:09:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMTM-0006dU-Es; Sat, 26 Sep 2026 03:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMQx-0003bX-IK
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:02:55 -0400
Received: from mail-dy2-x1f.google.com ([2607:f8b0:4864:36::1f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMQv-0000ZN-G8
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:02:55 -0400
Received: by mail-dy2-x1f.google.com with SMTP id
 5a478bee46e88-33e62211987so1752335eec.2
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406172; x=1791010972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xi435pN97DW3z7AycQOykLlzIzDdtWj05eM4KODr8Q4=;
 b=Q6gHOW9KDdlqFTVPNXtXGppOAVSSN4FbzteYq261k0XJ+/GsxWFXlsPj19rlNoLcqs
 qD5t5phHn3HcfQ4KQNXnWpIiQrUDsBy/+Bdum0Bq7rLzruwEfKrp0aq8m6lAuX4pA1ng
 pSDbY8QHcDXc+RxwgWpnlE7BCeJ/g4zIwP4+6n/gLstTXPpeSI4P9RfKuS6rUBD2pXiZ
 nX3R+YOa/1IxjVxcE7TY3AJhcFpztZdGrQaA57hILz+0ZKOlGk6osiazZv5JPAo5GksW
 zJgho4as3HjqeYHJjlyp39fSXTxRNfz+EFO3/1r6Dirjkxk8EWjCARyLz275JUrLZj93
 B88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406172; x=1791010972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xi435pN97DW3z7AycQOykLlzIzDdtWj05eM4KODr8Q4=;
 b=i0tcB/tuOcyPJEIIHMx1C9dQFAixKk49s4oH41rIICIFTTAPGnP+1DoQGBMg4+pNQQ
 PPkyUqsFU9ZTihkxR+l8xlUeI/25AsK78EIl23FALIOXduSUt+oosjW9y0ocUaZbVegs
 iajXbq+3sgNTxoyV9+E+Fow5LCicClzoQLgkw8d7o6jmX/MlICvYB9MfC7MwVfz/XIYe
 z6JrJaxaXYp7J9smU7CIcPbbi6BkxmamTZyLfcGW0Qat2/fdTrJFV3/ZutHA7AoiKOzO
 Vi/8lYjJ5d2rLzLFIaiI8fnmP/Wggx02qjsTHZKacTvIeRjkYQfpkdGT9wR6dmn3XTQU
 uTkQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEnrcO1tN+YbfZNgtRKpLTOEKC533BzniZzkqLun3uELw/zYHfFSGegxaeIe4bQvbalgUBGeK96g==@nongnu.org
X-Gm-Message-State: AFuF++nVNsItWAVbYYBK/+vPOJ3ZjwpyFBTC9qsH8StsJ5J8bFQRfOVy
 aNkT46EGxWXGhidBf3/ptzm9k8t2i+YmQZ+vuX6CmxO6Y0xWZs+ceYmi
X-Gm-Gg: AYBFou3xW7Sfq+tiYghn3Qn+nlg7YjIDBdIGecSL+u1smJ7dhkzq8bOigAsYpejKfgT
 KW20m5CsinfkSWy5s0RtkRh4NtBXP3Iq9J9Hbd+tMRuYNL4jIUmjdL9gzMEmhjQdDuidOlUwgKM
 ASL5DtRRVfibcQDbUnjQgrMHS3ryIXhuLS5VzXh69vkFyBlJuE875+lNS87PU9DomHz/sonLAoD
 wsXHxRHCfRi+UR9aeebbYnD4bpGDQUYSWNik5sBAlPy4+1ddFMDEgdARmCbi/OWat4POOpxZwa7
 yOnAIK2/ZcDX1fTfmXAT/NYC/prp8tKavl9aVK/GehFEd8V26lYENvg/nqTE4OTXAwjapkjoqzp
 9RrzB6gxRtR6s6IPTB6FPbFYZtyFgmvOVuvT4JG0/+xhcocEAxLVwOM2ipmD8N0cwi2Fz7BPS8l
 2MS6/rsIYCmYIif8otX+PA+SDHTgZY4Ye8L4UvW8vYC+s3BN2p0QoxXgBYfcOWs9ePhKmx9xYZP
 KJsv1UQYnv7nkwPJxyUn3MTJiXaOj0=
X-Received: by 2002:a05:7301:1f06:b0:33b:fa13:61ca with SMTP id
 5a478bee46e88-3427246bffbmr2590874eec.33.1790406171918; 
 Sat, 26 Sep 2026 00:02:51 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:02:51 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 27/55] tcg: move dup_const into tcg.c
Date: Sat, 26 Sep 2026 15:00:26 +0800
Message-ID: <20260926070057.1234-28-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::1f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x1f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

dup_const replicates a constant by element size. Define it next to
tcg_constant_vec in tcg.c and drop the copy in tcg-op-gvec.c.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 tcg/tcg-op-gvec.c | 17 -----------------
 tcg/tcg.c         | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 0d649cc13b2..c30b9d5d6fc 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -417,23 +417,6 @@ static inline bool check_size_impl(uint32_t oprsz, uint32_t lnsz)
 
 static void expand_clr(TCGv_ptr dbase, uint32_t dofs, uint32_t maxsz);
 
-/* Duplicate C as per VECE.  */
-uint64_t (dup_const)(unsigned vece, uint64_t c)
-{
-    switch (vece) {
-    case MO_8:
-        return 0x0101010101010101ull * (uint8_t)c;
-    case MO_16:
-        return 0x0001000100010001ull * (uint16_t)c;
-    case MO_32:
-        return 0x0000000100000001ull * (uint32_t)c;
-    case MO_64:
-        return c;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 /* Duplicate IN into OUT as per VECE.  */
 void tcg_gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in)
 {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ba2a1127f92..6362eef36bd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2287,6 +2287,23 @@ TCGv_ptr tcg_constant_ptr_int(intptr_t val)
     return temp_tcgv_ptr(tcg_constant_internal(TCG_TYPE_PTR, val));
 }
 
+/* Duplicate C as per VECE.  */
+uint64_t (dup_const)(unsigned vece, uint64_t c)
+{
+    switch (vece) {
+    case MO_8:
+        return 0x0101010101010101ull * (uint8_t)c;
+    case MO_16:
+        return 0x0001000100010001ull * (uint16_t)c;
+    case MO_32:
+        return 0x0000000100000001ull * (uint32_t)c;
+    case MO_64:
+        return c;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val)
 {
     val = dup_const(vece, val);
-- 
2.52.0.windows.1


