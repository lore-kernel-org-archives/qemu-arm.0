Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1366DCA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:10:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4e3-0001bz-57; Tue, 26 Aug 2025 21:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4dr-0000bE-EP
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4di-0007dx-UK
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:59 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-32326e202e0so5535487a91.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256866; x=1756861666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qWwJXhspeKuxTriI/PhOD7a9dZ1dleThFKCakXmp7ro=;
 b=byVT5PDjqlNacq9YrXJfXQ9XI492RacOYwZcxN4kM3d4V4Tws4qS5551E48EM/ZX63
 3DoaijiiPB6Dd3ybncTWRNpwnd8v92Cv2eyDHwbh3VioGuceqCc5/sIOPvCEeMc1wDZl
 8aJVL5HpBhbv+xN32UaH5W8i88veT/jlLwX3SIKGQvkJH1P2T9nPxDD+Bi6NVLya9nIS
 rlHbvaBc7xaGwvIt0kX6XjYbOpWgAllES06VTVeoezA8SvN7bvPu2rQiBkbkozxd3ygZ
 SWdppyKBjftqKOKurqjyEAfyoeIdC8EyUxpPBKeDTKWunGq1ZauqpgrfRmgWMOpsiliE
 2OVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256866; x=1756861666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qWwJXhspeKuxTriI/PhOD7a9dZ1dleThFKCakXmp7ro=;
 b=forYCOQGDh2tB4KA9gclfLJNBo5dDFJQazSMwQrOmLceEO1DidBI9EfnrgHtmL+xwx
 MCO4Te2Az5iumq7stk+EmtHJXUxQH/tiR6nfeMAGrJVljbzooIWzd5h0p/LDIh/NPdxw
 TuCqGOo15Y+BZl40FPdK9RIHb3b9XMDNRLSdHHSXeCa5I4F7609dA2AjQKqEcSvWzykk
 6x8z27/kxMbapau7X7MEr7cXau1ZH18ALT8JQ5x6NIjStuz9EKTOOFzp5HtVRrSTW0j8
 e7XeGszLzwiMLxHo6k7qvVyM1dz7SByJJcL2AA5nbQRIKIn2A9XQ1nqxDMTN2cx3L9la
 rlaA==
X-Gm-Message-State: AOJu0YwNym3fajAVVyI1MKnCY0YdGtFaiE3SMeJZNgLJESqKo3hZOiV1
 kq/bC2KJl3akB/zLcvFUJRoQt7a7vpKz1czuS8VSeu4v+jFmanCXjSSDRKN5DGGdSJc=
X-Gm-Gg: ASbGncuwVlKEZx2CK/+IHgbbQ1Kz9tRVPtIR7IdR9Y/Qxgfxg2eMU1ykRtvd+Pt8ocl
 MUd54R2dMNSOqCT4lPa6WJI4qKTrRgThgDbgUOCfrDed74AJcVYhTVpXobF0NZr+YXF1cTOewAB
 CaimaxtaNXwgNKCNxzJailsVNaJIAEbZikgXVPrD4HXmGx6FH3uKzkT7m7oNJgAIV7NdRHY73I+
 xhQqRof8Co5IgNgAGczMw8WNL3vRhBglGJwymKbDcWDru5pf+Jj/p9Psi5jHts5bwPAypwKRSTl
 MX1YiyZ8d1mn2EZPY/wXZh4eB6NfEaMwT50mLnJxufe/UYqy5Y0SjHiY+THAiIP+TOqNE8w4xFf
 p4/C1WWtbLoJAoXr4EO0+IR9h6MaaEVkiuHv0
X-Google-Smtp-Source: AGHT+IHGnflg6ro0hYLty/fZGol0Lo78iQm3YJ4VpNnKKop0imUGN/zrXAFTav4asa/EaOeVmjsuzg==
X-Received: by 2002:a17:90b:53c8:b0:323:7e82:fcd with SMTP id
 98e67ed59e1d1-32517b2bba5mr24358351a91.37.1756256865662; 
 Tue, 26 Aug 2025 18:07:45 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:07:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 32/61] target/arm: Split out redirect_cpreg
Date: Wed, 27 Aug 2025 11:04:23 +1000
Message-ID: <20250827010453.4059782-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 target/arm/tcg/translate-a64.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 648463f44a..8303f0dac2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2455,6 +2455,19 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
 }
 
+/*
+ * Look up @key, returning the cpreg, which must exist.
+ * Additionally, the new cpreg must also be accessible.
+ */
+static const ARMCPRegInfo *
+redirect_cpreg(DisasContext *s, uint32_t key, bool isread)
+{
+    const ARMCPRegInfo *ri = get_arm_cp_reginfo(s->cp_regs, key);
+    assert(ri);
+    assert(cp_access_ok(s->current_el, ri, isread));
+    return ri;
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2603,9 +2616,7 @@ static void handle_sys(DisasContext *s, bool isread,
          * fine-grained-traps on EL1 also do not apply here.
          */
         key = ENCODE_AA64_CP_REG(op0, 0, crn, crm, op2);
-        ri = get_arm_cp_reginfo(s->cp_regs, key);
-        assert(ri);
-        assert(cp_access_ok(s->current_el, ri, isread));
+        ri = redirect_cpreg(s, key, isread);
         /*
          * We might not have done an update_pc earlier, so check we don't
          * need it. We could support this in future if necessary.
-- 
2.43.0


