Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E39DCD6E4C
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:21:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrY-0000Pq-Ii; Sat, 30 May 2026 19:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrU-0000LX-LY
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:13:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrS-0007aj-QW
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:13:00 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-36d98b74449so77518a91.2
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182777; x=1780787577; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zxaQcX3SsrNf12ryZ3sI2+knj5jWNC9sXQqDHj+8xnE=;
 b=de3uq6qclHN3K+LqU/UX1nQt0gKRil4zfDPf+y6lgIynBaITVLnq9s8I475Xjag5tY
 43G5iZjiKIqbnJ6T5qNQYuP/4jR509KY2OQaGUbdmcL2kKhisRLqtAMvP/29YF2nIaFP
 XMgt0n+ty9rOSf5XW1sHTaGd8f3makadrjGZiu0AHRQB4JoRrdRuCJR32d3lz/5NFs94
 HTJPOmXvV5f34bcoqhWGHgvkzBQiFtvfGiIXBEO9I7+6lIJ8/tWiOtD1bP5dmEJrMjIn
 YZzRbw2G5b1rzoViAJUZTi7MVjDOcH0WzPQkuEynvVtV9ikcm9bao+xuzp3SZsc41tDQ
 2lMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182777; x=1780787577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zxaQcX3SsrNf12ryZ3sI2+knj5jWNC9sXQqDHj+8xnE=;
 b=aWng1fXJB5mR5AaoKVJqt8/B8ihw4Bcj4O96LvIXApWhDBVdrDtS+n62usGcmBwHkc
 usJfBw34dZj+zNDszjVBAdSDAkMAaex+NBzljlSQOJjxEYa2Ho0uw3EUK+yByjweFsYK
 Nwnu7B8xVy4l17aJ0W3ET89yY1XA7CYdS2/O6Rz3C6E77v0qH5746c/Ce7k/r3BMOCz5
 IB9ivU+F8vBMOXL6g5F6FjqGkj9/hK1LZxo1E78JQ0VMikZwDe5sMSvxT5WzbNhwWdjZ
 TIQ5NPnv5wEbMs1HAh6eseAZ6O6v3KgdlqRKBv/fIHuxJSQt8vvI7dz3jYJo0kDEdg50
 p8og==
X-Gm-Message-State: AOJu0YznC14JqYG/EmDWgmSfdUsD1haHj8h0eWsLfdTrpgE9iG/wjice
 zWbXoyECy03zTESiRsE4qeP6EyIIXsL2KiBrJDymlWEtlz7zfz3mlUFpKl+fz8rqrF0=
X-Gm-Gg: Acq92OEOa5eNNRyIdhdtSuUhw7khsZ3yGcYJpCUBO0xIoRD+4aqIBS5HY44+ECQFt8l
 NfmfzdlLb8T8Lj9DPKHlg3m8JA08+Fi7G4fugS/BXYYAdeJpK5+CuANvHQ5pXYymIlahgrHKyRQ
 BAcX6GqS5sqMjdPaHaR23Mew0XeK5/lwmtrwt94hZYwfRsi0I8EF+ahQ3xv3v6jvLGNC4NefrWa
 O0CvI7aoJ2yElDkQe30f5I3KRfcKoSy+30rcy0jIDc9keFlUEfUg7pznTt3CDIhivH4yJeDhh2G
 GIn0WT51+wYGUaRUAOnCLPkqRIcm4V6lDLHEeHblq5iPdKrAqVISO8Z/4k6A73X1nX7WZrJNBLj
 bBTUl2xGK/In7vkKQ5bCQrIttaMPTvoLnKZjHf8kOdF+rR5CBRZpjHGdR9OMUA1IlUnojit/nuE
 URzw7YXdDyMzGH7E6Q7nTx2+RKxYXut4DBPJV+u5A=
X-Received: by 2002:a05:6300:6701:b0:39b:e9e1:699f with SMTP id
 adf61e73a8af0-3b427eab30fmr5355167637.12.1780182777357; 
 Sat, 30 May 2026 16:12:57 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 28/41] target/arm: Implement FMLALL{BB,BT,TB,TT} for SVE
Date: Sat, 30 May 2026 16:12:16 -0700
Message-ID: <20260530231229.400441-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 3 +++
 target/arm/tcg/sve.decode      | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 1044b81c95..95ec3a011e 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8388,3 +8388,6 @@ static bool do_fmla_fp8(DisasContext *s, arg_rxx *a, gen_helper_gvec_3_ptr *fn)
 
 TRANS(FMLAL_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_hb)
 TRANS(FMLAL_idx_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
+
+TRANS(FMLALL_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_sb)
+TRANS(FMLALL_idx_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_sb)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 71ec09393c..06bbd7fa63 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1868,6 +1868,8 @@ BFMLSLT_zzzw    01100100 11 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_ex esz=2
 
 FMLAL_hb        01100100 10 1 rm:5 100 idxn:1 10 rn:5 rd:5 &rxx idxm=0
 
+FMLALL_sb       01100100 00 1 rm:5 10 idxn:2  10 rn:5 rd:5 &rxx idxm=0
+
 ### SVE2 floating-point dot-product
 FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
@@ -1887,6 +1889,9 @@ BFMLSLT_zzxw    01100100 11 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
 FMLAL_idx_hb    01100100 idxn:1 01 .. rm:3 0101 .. rn:5 rd:5 \
                 &rxx idxm=%index4_19_10
 
+FMLALL_idx_sb   01100100 idxn:2  1 .. rm:3 1100 .. rn:5 rd:5 \
+                &rxx idxm=%index4_19_10
+
 ### SVE2 floating-point dot-product (indexed)
 
 FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
-- 
2.43.0


