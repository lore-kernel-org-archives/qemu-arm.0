Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B0CCD98F9
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:15:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa4A5-0005V8-MK; Thu, 18 Jun 2026 00:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4A1-0005SM-QE
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:26 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa49z-0005Zg-Rb
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:25 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2c0b9328c4aso3455095ad.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781756121; x=1782360921; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uPZ+QWhKOCzUvOJFQw8MMBMoO74ds4ZmhhvtP05m4yQ=;
 b=EnfpRirSXRSlFAsp98iE0BYJt0sTweGM/NKQ6q/dh7bzN6WV3qadhpqckEx05Fhhp6
 TCPd4/5E3baWvBrXI+F1DyLU3nxxm3UxtxFSGt1sT+QaOcxKVxFcfJ9Eienj7GzVQSsM
 e6CGNT7r+AMesWGBVotvjo1SS13ffkxupaRvMhJ0yMRyOtb9Ev56OklKn+VIPC67VDCe
 1ZHvnYnXMNwHZ6L1Cv4YrSGavDRPkjDBaxnwipRi5wRzA/05lSc9gt29ixwzbpED2ehw
 0yOjNBB0Ads2o4MxHTYpvvLsv7LlhJMjYbmgSVQqxugHJGkiKVz9GnC9gk050+dlHWP2
 H8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781756121; x=1782360921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uPZ+QWhKOCzUvOJFQw8MMBMoO74ds4ZmhhvtP05m4yQ=;
 b=OnVohC3zMi5HtDklaZI/VCchpYQpj0xsVAQD2ZbVJYetMAQOhD/trymDSAqkKdtvL3
 x3FQdc8wF1P/TiS7Ia9lphP9zkGmc+Setc9CLlBW7sZMCRFXz5p4L2Wo70Yg5gh2Kx86
 FKUTpEh56gvUHFmpSzsVBSXj2ONKWzFrBuTdGNsjHzZQDRqfiVE58sQf/30w0tIFsw/2
 FcnJe0PZ3c0D+z5XPuTGHyH0gQgcOVz2kW6cTlKoF6VafyjfoMgKmWlhPgB5qLfgIFTJ
 nRMSujVIEnKts44V3TFSRMuwwy4e2alZ+eyABtXUzLZ7TI2NPiVosD952s/+k6Bmn6Yw
 rP3Q==
X-Gm-Message-State: AOJu0YyT4uRFWR9rVk6N5u7Y9Bsm38WHs6KrUbQlQS1nAqLibrWAUaZA
 5mUT3iVybmRfWY4DtsoreoqUXk0zvEYznqEM05lFrEfy6bRdPAZQfz2djzqoSeLV6ENvkQchhqk
 LW+yH
X-Gm-Gg: AfdE7ckaNmfhvoonWcTxp+QcLvLhDgfj69ORvL4CMs2PYm/JA/FBw6IIq6JIFeJ/KL3
 qvmUNfz/fFDh2etoC7idebPQMFqf7VAC0MMpBHgnAvmTRfFnnsOrlBA4Sox0ermVPiJtcsyciJa
 fu53dUSMd2AFuFH9w5mAGGJImKPXlln3LLEMnj/H2vGgMbkN1C6tnfwVAB1VsOhDK0dsWiAmZTS
 uj+vsexyWDabSOLRKCF4NJfiFogIAnpD3H3e4IdLT6wxX+sqxxV/4jAnUYPqAws+ajJuL5f5T0o
 LJp3VdcC3QVIenXSFrY27KPBjsha8EjNfiKJGCteYQNserpAgSEyvHWlW3P9VKnGBnRzRi5lXyb
 a7wTMmasEmzLE+ZdloheoU+J5vYqp3kLprs4i9c3HqR7AVv4SR5uXXOuVLx6K9H9eEgQCvvy4QS
 Fncr1hn00Gz+mvJ6SrxZRqzWoQiEJS+WrQw0taCnXgIe/kLBNFzQ==
X-Received: by 2002:a17:902:d543:b0:2c0:c2c7:58ad with SMTP id
 d9443c01a7336-2c6f3427af2mr7728025ad.13.1781756121486; 
 Wed, 17 Jun 2026 21:15:21 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f2e535csm173905935ad.6.2026.06.17.21.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:15:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/10] target/arm: Move tile_vslice_{index,
 offset} to vec_internal.h
Date: Wed, 17 Jun 2026 21:15:08 -0700
Message-ID: <20260618041517.573469-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618041517.573469-1-richard.henderson@linaro.org>
References: <20260618041517.573469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Move in preparation for being used outside sme_helper.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vec_internal.h | 31 +++++++++++++++++++++++++++++++
 target/arm/tcg/sme_helper.c   | 33 ---------------------------------
 2 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 06fef2a209..77e5b01550 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -55,6 +55,37 @@ typedef struct CPUArchState CPUARMState;
 #define H8(x)   (x)
 #define H1_8(x) (x)
 
+/*
+ * When considering the ZA storage as an array of elements of
+ * type T, the index within that array of the Nth element of
+ * a vertical slice of a tile can be calculated like this,
+ * regardless of the size of type T. This is because the tiles
+ * are interleaved, so if type T is size N bytes then row 1 of
+ * the tile is N rows away from row 0. The division by N to
+ * convert a byte offset into an array index and the multiplication
+ * by N to convert from vslice-index-within-the-tile to
+ * the index within the ZA storage cancel out.
+ */
+#define tile_vslice_index(i) ((i) * sizeof(ARMVectorReg))
+
+/*
+ * When doing byte arithmetic on the ZA storage, the element
+ * byteoff bytes away in a tile vertical slice is always this
+ * many bytes away in the ZA storage, regardless of the
+ * size of the tile element, assuming that byteoff is a multiple
+ * of the element size. Again this is because of the interleaving
+ * of the tiles. For instance if we have 1 byte per element then
+ * each row of the ZA storage has one byte of the vslice data,
+ * and (counting from 0) byte 8 goes in row 8 of the storage
+ * at offset (8 * row-size-in-bytes).
+ * If we have 8 bytes per element then each row of the ZA storage
+ * has 8 bytes of the data, but there are 8 interleaved tiles and
+ * so byte 8 of the data goes into row 1 of the tile,
+ * which is again row 8 of the storage, so the offset is still
+ * (8 * row-size-in-bytes). Similarly for other element sizes.
+ */
+#define tile_vslice_offset(byteoff) ((byteoff) * sizeof(ARMVectorReg))
+
 /*
  * Expand active predicate bits to bytes, for byte elements.
  */
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 8e8e6c00ca..685b6b46be 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -64,39 +64,6 @@ void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
     }
 }
 
-
-/*
- * When considering the ZA storage as an array of elements of
- * type T, the index within that array of the Nth element of
- * a vertical slice of a tile can be calculated like this,
- * regardless of the size of type T. This is because the tiles
- * are interleaved, so if type T is size N bytes then row 1 of
- * the tile is N rows away from row 0. The division by N to
- * convert a byte offset into an array index and the multiplication
- * by N to convert from vslice-index-within-the-tile to
- * the index within the ZA storage cancel out.
- */
-#define tile_vslice_index(i) ((i) * sizeof(ARMVectorReg))
-
-/*
- * When doing byte arithmetic on the ZA storage, the element
- * byteoff bytes away in a tile vertical slice is always this
- * many bytes away in the ZA storage, regardless of the
- * size of the tile element, assuming that byteoff is a multiple
- * of the element size. Again this is because of the interleaving
- * of the tiles. For instance if we have 1 byte per element then
- * each row of the ZA storage has one byte of the vslice data,
- * and (counting from 0) byte 8 goes in row 8 of the storage
- * at offset (8 * row-size-in-bytes).
- * If we have 8 bytes per element then each row of the ZA storage
- * has 8 bytes of the data, but there are 8 interleaved tiles and
- * so byte 8 of the data goes into row 1 of the tile,
- * which is again row 8 of the storage, so the offset is still
- * (8 * row-size-in-bytes). Similarly for other element sizes.
- */
-#define tile_vslice_offset(byteoff) ((byteoff) * sizeof(ARMVectorReg))
-
-
 /*
  * Move Zreg vector to ZArray column.
  */
-- 
2.43.0


