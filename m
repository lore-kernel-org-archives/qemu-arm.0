Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2441625njb;
        Tue, 30 Jul 2024 09:03:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEmG1qDgVgahAZdjh1H34KCf7tbarHMDc7oxRwlmIXaH2Y2dYRHKZ1Ln5cneh2dr2kk8wKvj7QcfEktKNYJ2hz2vimSz6b
X-Google-Smtp-Source: AGHT+IH1rgKvbva9xMi2ywWjFmaQEHqyxqmrNwzvOOr7jip0I0IW/aWsoHkY2KtlKF3hrMh876L0
X-Received: by 2002:ac8:5895:0:b0:444:a6ab:4cf8 with SMTP id d75a77b69052e-45004d69210mr145962231cf.8.1722355405357;
        Tue, 30 Jul 2024 09:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722355405; cv=none;
        d=google.com; s=arc-20160816;
        b=DJJZgVtL+M7usyNXc9SJuJ5ybqrxeIAAo45YUltcHDxUNcWnUTZgr+wDlVah8RtaxG
         Z3/ZV3Q3fsRx759mLzsQkFVZsnQhDOGq+X7DbDUA1WP6910LKMaRAHpreQpE9B79HuiX
         VXPvYw6J4KD4TwaTyib5Tnc1Y4hymRrhliyVD/BFsOrCFWvyCJTBWCqUwF7dSHq/XY1T
         y/1PIdvn5JqT1arWgkEJmVj9pjpUm2erJARm81drI+e5il1m5/lslfmmy9+i5k+ZVEt0
         JxvtBvnagr5UmrMaPRyXhnajg9/2fKuIc0hol3RVV6DxmBRoOugMm7ekg3sklFtuoSBP
         5YAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=CTJ3lIzD5J0J/9BRp8dRBhOaBeOhbvt/dIYTSUl24hI=;
        fh=uihdAG22KvJqllszDlSPT1902inY26xLiEVS8YT9kVI=;
        b=njNIDg/IQE3WJq93tlyts9lW3Fxr+NviJN2N7BR828MLiGvsfRwX0YgbMMdY4QSICI
         RNo2Q3/TmGE11ShwAS+si8z4ls2FB7pwo0Q+K3p0Ez0LpI8NmgrK7z0mzjf9zSag7oOE
         Ks98ag9NAf+tUOhiI17vVP1MrU13JviHUfJ8ZW9lnlipzjuBYlvQBNAmE9XjMlTiTnGQ
         mERd9SVvQnxyHS5PA2amwwqa7hZW6fHfgGIQpc+NagaQX+2yuVr7wBf+jyUeWCXyLBnc
         VvqKq+YHjnbY0QrERUrk/rbNyF+dqdCrutJetv0l+GPJcX0z4NHTdR+zWypGFksJ9PoU
         En2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LBafKxqP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe840d500si131991881cf.516.2024.07.30.09.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 09:03:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LBafKxqP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sYpJi-00037R-5M; Tue, 30 Jul 2024 12:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYpJg-0002zN-9m
 for qemu-devel@nongnu.org; Tue, 30 Jul 2024 12:03:12 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYpJe-0000FX-DL
 for qemu-devel@nongnu.org; Tue, 30 Jul 2024 12:03:11 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-428243f928cso7831595e9.3
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2024 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722355388; x=1722960188; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=CTJ3lIzD5J0J/9BRp8dRBhOaBeOhbvt/dIYTSUl24hI=;
 b=LBafKxqPsC3YKwCr9Dp/jMy5Tbl3oC17i9MeuS2sCYxt70UczYnnz+pJg1pZRJja4A
 a/4tAVkaIhd9fL/xMR3NHEwhttp3IfQGenXzaXmTxq5hKPqmg7jE+hRBBqIVdS6bVxr/
 YyD1htG7jyLjRS1B/D49LgwuctAcLzbsAsJ04WOTUP6h4AmZO81Gpd/KGmGC5mQ4sMna
 GwqkeT4VqlS5se/LF6JxkiYO5LSKpOsY88+ECigf3mUac1WxBQ2iPs+idZZBtxj9K39U
 YkO+YjVXwuTiUCHecw9EhfthfGktNfRCIxZxwXNzBbtUk7EsAC+fo5CTkHPjGcyHH2UU
 IpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722355388; x=1722960188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CTJ3lIzD5J0J/9BRp8dRBhOaBeOhbvt/dIYTSUl24hI=;
 b=wVhIVqwAXcte6+PInOt7a5qsNuUj7Bv+Sp+sGBsxIGELDNmU67Dbia7OpTfP/da+7S
 wpPJGVkKVn20qfZ25giSv/RyeXkaX8y2VKedMc2fw4K5R/v/NhhL8yCVnnIBRvPVwoJL
 8PwNXSyUxcHyFyBSEMBKnxkJH63DGwc5W5Sp4yjxPgE2Ej2LM0lgZmq028P53z1gL1F8
 bJ7vW4LrEKYGXhFy3lyvMWR3TJqfwOfWt6MJ3zuYOQU8wpI3zIDxqDEH6KYBgoY74N+S
 12L5UOt12XeAarO0f78PPusXEqKFdXad8XNZsFlyYSJMeLOQcPrut0gbtBbsx6MOgV5s
 SA3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4vnQorDA0+7Lgug4ZXY8NQFTqGFSNmamLf4l/h+GWrzd1QI6u72Gx2pztsMLqTHiu/haWpf3pzmqtTsMIXurPHbMfNtU=
X-Gm-Message-State: AOJu0YxzNlhux6fzCbsVtA28q9A3Qg+Jldhu2zGWjLQzv2HBf5NaW06v
 CFUxIjpr3ctEE7XVmCpT3Zw/W31qB/TPz+B4vKmWBKh5wqsbUdh+am9PIHCeOqs=
X-Received: by 2002:a05:600c:3b07:b0:427:abed:3608 with SMTP id
 5b1f17b1804b1-42811d7ff92mr78410815e9.5.1722355388054; 
 Tue, 30 Jul 2024 09:03:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b3685810csm15001676f8f.71.2024.07.30.09.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 09:03:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/8] target/arm: Implement FEAT_EBF16
Date: Tue, 30 Jul 2024 17:02:58 +0100
Message-Id: <20240730160306.2959745-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Wu9/yO3Pn9sY

This patchset implements the optional FEAT_EBF16 architectural feature.
This feature only does one thing: it adds a new bit FPCR.EBF to the
floating point control register, so that the guest can enable a
slightly different set of semantics for the bfloat16 dot-product
instructions (BFDOT, BFMMLA, BFMOPA, BFMOPS; also BFVDOT when we
eventually implement SME2). When the bit is set:
 * they honour FPCR.RMode to set the rounding mode
 * they honour the FPCR bits controlling flushing of denormals
 * they can generate default NaN and infinity as intermediate
   sum-of-products
 * the intermediate rounding handling changes

In the Arm ARM these changes only affect the pseudocode BFDotAdd
function, which in QEMU we implement in bfdotadd().

A lot of this series is plumbing -- we need the CPU env pointer
now in the helper functions which call bfdotadd(), so we need
to pass it through from the generated code. Once we have it,
we can refactor the callsites in a manner suggested by RTH,
so that we have bfdotadd() specialized for EBF=0 and bfdotadd_ebf()
specialized for EBF=1. This lets us hoist the setup out of the
inner loop:
   float_status fpst, fpst_odd;
   if (is_ebf(env, &fpst, &fpst_odd)) {
       for (...) {
           x = bfdotadd_ebf(..., &fpst, &fpst_odd);
       }
   } else {
       for (...) {
           x = bfdotadd(..., &fpst);
       }
   }

The implementation itself requires a fused paired-multiply-and-add;
we use the same trick we already have in f16_dotadd() to implement
this.

Not intended for 9.1, obviously, but I figured since I'd written
and tested it I might as well send it out to the list.

Based-on: <20240730155819.2958924-1-peter.maydell@linaro.org>
("target/arm: Handle denormals correctly for FMOPA (widening)")
both for textual reasons and because that patch introduces the
do_outprod_env() utility function we use here.

thanks
-- PMM

Peter Maydell (8):
  target/arm: Allow setting the FPCR.EBF bit for FEAT_EBF16
  target/arm: Pass env pointer through to sme_bfmopa helper
  target/arm: Pass env pointer through to gvec_bfdot helper
  target/arm: Pass env pointer through to gvec_bfdot_idx helper
  target/arm: Pass env pointer through to gvec_bfmmla helper
  target/arm: Prepare bfdotadd() callers for FEAT_EBF support
  target/arm: Implement FPCR.EBF=1 semantics for bfdotadd()
  target/arm: Enable FEAT_EBF16 in the "max" CPU

 docs/system/arm/emulation.rst   |   1 +
 target/arm/cpu-features.h       |   5 +
 target/arm/cpu.h                |   1 +
 target/arm/helper.h             |  12 +-
 target/arm/tcg/helper-sme.h     |   4 +-
 target/arm/tcg/vec_internal.h   |  37 +++++-
 target/arm/tcg/cpu64.c          |   4 +-
 target/arm/tcg/sme_helper.c     |  78 ++++++++----
 target/arm/tcg/translate-a64.c  |  40 ++++++-
 target/arm/tcg/translate-neon.c |  43 ++++++-
 target/arm/tcg/translate-sme.c  |   3 +-
 target/arm/tcg/translate-sve.c  |  25 +++-
 target/arm/tcg/vec_helper.c     | 202 +++++++++++++++++++++++++-------
 target/arm/vfp_helper.c         |   8 +-
 14 files changed, 371 insertions(+), 92 deletions(-)

-- 
2.34.1

