Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F194CD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:30:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlZR-0008AU-RC; Wed, 20 May 2026 14:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlZ9-0007L3-A4
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:47 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYv-0000am-QK
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:45 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-3665b67ed66so3393085a91.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301351; x=1779906151; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4z/S8c2O3c8fRzj3kByIQacIL6SNCt5eRr0Q+G3fOlQ=;
 b=TTGrAftuxBevc332izlKx3CwYWZr7pQz/kHg8OtXWgi+TaH/phj9FeAHJuzTGkzOZY
 6wfeCZnJpmjlXPC309en+J8IVKvHjUK/NFfavXBZT+kNHh9o7HO09bKJ+J3APRUDbL1i
 ax70t3b2MDFrHEKjpb35GtU4F2z7nH4CNCiEbxm57dzskQ2EN9pspT/y1XL4BDnRP+4r
 lNJ4x3J2hzsDhmTDmgM3siUF3UzySeYpoYaQLnJHruSIMOdH9a5OLkMnQfj1MHObj3sc
 tIbuU/tuzDfeyR4DDNPeLTZtA5E5gG0hLUqieNx5oscQ31upiuLLS0Na0Zb+/qyWyQob
 TjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301351; x=1779906151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4z/S8c2O3c8fRzj3kByIQacIL6SNCt5eRr0Q+G3fOlQ=;
 b=AeF0kcoaPJIh1JV1ibiAfrc9S7krcChEtglm6ocMKEAVhP7TQTXNqYybsA6QosqgEc
 MtApLFi6h9NI1VjKjvTW0qYxylPRuVBNyLNOQIBGCEN2n9ZzF/UrPK19WEhuXfb6463m
 +WsUPE7z2O3S1178N04VDGk+yCNmdT7R74+kWavjIK0LmI/5rM5JY839WrYWdgxS3bPR
 VffHEDzHJ5i8cP+GT9MdllQWJRkYmoalyClG5tFPxPe52ikc5GMiHKb9sSB8mgTZq+j5
 dWD7vre1x6wrafK3NID+IoiywTfltAHkSwRfd1tZ4Hrljz33mZCu8h3uQytrqVNt2Iu8
 3wrg==
X-Gm-Message-State: AOJu0YzQddKMBk8AovfWDO+X/SYqatzoPpv07DSFZa6Io/YbAoRC+Min
 g92IHIxw9MCWHefFZTQAl5Jx8+m3IlPtD6zy3M6lyKrSvl6SFb7DMg33cBv6x1BFjD4=
X-Gm-Gg: Acq92OFiMZAFiGi61c6OdHRzNAr+h7mnNXhY1EAssf+uQUiXd7GXvXXsgnT8576mvFg
 5Fy8mjvvmLSq7nYkWcoA2ILsB3Oz+llwcGuXPPp+xcm1ibBdswdiJIQx7ckyjedkdxzyO8NxpEw
 s14ALwltWxDi9hG063P+utC5I6r5u+n0yiAcpcc5B/E0vzaIyDwg88oTvMFLm6Jj51LWr2/JuYB
 GsqVYIL4CzlYMzjY80BqxYPEVh77hedhmsycFkBP16FkdheT2pET/NvYBkd72e4ZcTE8b732Dm5
 sP7mO9UZ3jZA5J35k+4C1MPl5cABGItkb9jQY0mV/JUbX5uyALUW/TILsHKfIqGPOZjzgMNFUGr
 QF1TzbaXdARIs5TiG9PstOnNsP+xipFSPFlMvXfbVnH636MK611t27q+mV0Ut1nar58PoSrY+MI
 1zTfdO1ag33BDc0EFqH16o4n9PnO9VLXVpxHvOG30=
X-Received: by 2002:a17:90b:5290:b0:35c:30a8:32a with SMTP id
 98e67ed59e1d1-369519ffc97mr24984372a91.9.1779301350706; 
 Wed, 20 May 2026 11:22:30 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 23/64] target/arm: Set e4m3_nan_is_snan
Date: Wed, 20 May 2026 11:21:32 -0700
Message-ID: <20260520182213.872945-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

The unique e4m3 nan encoding is SNaN for Arm.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vfp_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index 8d3f6e3a2e..c10b085f08 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -46,6 +46,7 @@ void arm_set_default_fp_behaviours(float_status *s)
     set_float_3nan_prop_rule(float_3nan_prop_s_cab, s);
     set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, s);
     set_float_default_nan_pattern(0b01000000, s);
+    set_float_e4m3_nan_is_snan(true, s);
 }
 
 /*
@@ -67,6 +68,7 @@ void arm_set_ah_fp_behaviours(float_status *s)
     set_float_infzeronan_rule(float_infzeronan_dnan_never |
                               float_infzeronan_suppress_invalid, s);
     set_float_default_nan_pattern(0b11000000, s);
+    set_float_e4m3_nan_is_snan(true, s);
 }
 
 /* Convert host exception flags to vfp form.  */
-- 
2.43.0


