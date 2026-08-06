Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05452C5AC80
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:32:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws1wH-0004kS-9f; Thu, 06 Aug 2026 13:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1wG-0004kC-4u
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:31:28 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1wE-0001dw-Jd
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:31:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-38759bcd877so2682247a91.2
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786037485; x=1786642285; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=07u5YTaFdMyIfjVN9mh6eEqYjKyp9O2lMI/JzkKOJ4Y=;
 b=lg4Rg0YffxBIrJ/8vCLjfGIw6FcXjtNQEKM5g1r/Kog5gijdAk5lJyzDVvDrhSE9id
 lLKeYEeh2/HAsP5GE9C7gtJwLd0aRhsdvvnXsY8muY6a/gmgut/nHuWBvmLgjHsfcxn6
 e+ZfpNSrDtXuqMvYotnD3k+NFXK5lYTSRWQ0PIh3cIiulF9gsn6YCl71x1oZqeeZVjBc
 I5aKbzhbQ0wXkd7DuIHZIsRf3RF9UyJHOpeYulio5q5fqRpSyLlYOrncJ+nxiaOVUEKl
 PFnCshKBQXT/GUbRzM4QpmyRdPATCRengL0DcOZ1rq2jkS8ctPq1+jd/f6DzofC1T8qx
 WQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037485; x=1786642285;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=07u5YTaFdMyIfjVN9mh6eEqYjKyp9O2lMI/JzkKOJ4Y=;
 b=CqIRfo3HcxoOwSvPknYmsbrP3C9l6tv4NjzA0nL18K9pYWl8GpF73J1BjAOVvkvsNe
 0cAACLxeeC7otrMAoQGa65VhTpvVeDOTmnENrsiaU2RT4lZQhm5HYjs3tRo56h1D2wts
 ctYT+S9d9U3YTpKIguvnVnZEaOtzbW3U0ae3BGOYIT/TK1Esq+NSIdTjJW+aScipapX/
 mJODO0pOKptm+L7dYTcwn5uAGg0qAnwV4f+SHMvjKUrB6bD+oJ+Wp5VJE9vVtWkBCXKa
 48MlE492yUERQKSbktVn5S4f0Z58YMM+t8s6u/eUFczU/khbBHfWwwjWTP7mqqV73tPs
 Lbxg==
X-Gm-Message-State: AOJu0Yyh2qJ9VXadDUhYCauJc0n3FMVJaxzY46X2EXSbVhfoiYLujBRb
 NqeLnVCuGzzbHvIb58yh8BrheRG4esc9sDbCGuWzakMhOiR7kQLJNnGg8R7RAPGlyPeQyH4ISfM
 GEdj5
X-Gm-Gg: AR+sD10G9YBL5TREBFPjO1IeS7S/WD6J7a/zk7TXK49zBn+WBqCZr1QlGlb0EiJgTFw
 7UpfvIS7/osapQEFxmZg+zsK47pgkvJDdDr0RLOyyApHcYBYQbl5VXRCX9LGRNTO4OhaqQo1+IM
 lMpr+9vhh5eSLaG1LYSqkEEtRBjY5UjvZHQvxqaAW7q09/Wb1h9+BtRbYLoZqTr2+wbpY6ccqpi
 lJ3rX2JzlwPqjEDUOiAmg7+MiFGRPwzBquc93UvFyOAaSsAfb4r9w30ic92FMiop7KLU/8GZ4fP
 qu2fD6LS301Z/Zh3BO09Re5JsMxAX3b0wNOsTquPCQ4tMv0VsWalvx1cHdgLQLIJbfXAIss7FQI
 PgUUpN8ctnSEwoLz2yjHU6au5jnXFzIWI/tcRJTKR/b9NvpOasR+wEe5mHwj4SEpOemnFqqdc/v
 fHNVf84DAMJEa87QdAE7gaT/VK0C5hsl2TENYDIpjqtD5woz5vZF0TOFHK6LiPQFwlifFGeJIRs
 Vut42ti8dxUYTU/4rnr
X-Received: by 2002:a17:90b:48c9:b0:38e:97f0:aa4b with SMTP id
 98e67ed59e1d1-3903c58f06fmr16477872a91.13.1786037484939; 
 Thu, 06 Aug 2026 10:31:24 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39085e4a2a5sm1983711a91.14.2026.08.06.10.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 10:31:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 0/6] target/arm: Implement FEAT_IDTE3
Date: Thu,  6 Aug 2026 10:31:17 -0700
Message-ID: <20260806173123.333423-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Based-on: 20260806172709.333300-1-richard.henderson@linaro.org
("[PATCH v2 0/6] target/arm: Implement FEAT_FGWTE3")

Changes for v2:
  - Rebase on the max-v9 split.
  - Continue to ignore HCR.TID3 in v7 for undefined ID regs.

r~

Richard Henderson (6):
  target/arm: Rename isar_feature_aa64_idst
  target/arm: Enable writes to SCR_EL3.TID{3,5}
  target/arm: Implement HCR_EL2.TID3 trap on undefined TID3 registers
  target/arm: Implement SCR_EL3.TID3
  target/arm: Implement SCR_EL3.TID5
  target/arm: Enable FEAT_IDTE3 for -cpu max

 target/arm/cpregs.h            |  8 ++++++++
 target/arm/cpu-features.h      |  7 ++++++-
 target/arm/cpu.h               |  2 ++
 target/arm/tcg/helper-defs.h   |  1 +
 target/arm/helper.c            | 37 ++++++++++++++++++++++++++++++----
 target/arm/tcg/cpu64.c         |  4 ++++
 target/arm/tcg/op_helper.c     | 23 ++++++++++++++++++++-
 target/arm/tcg/translate-a64.c | 12 +++++++++--
 target/arm/tcg/translate.c     | 18 +++++++++++++++++
 docs/system/arm/emulation.rst  |  1 +
 10 files changed, 105 insertions(+), 8 deletions(-)

-- 
2.43.0


