Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2648661lfb;
        Fri, 22 May 2020 07:55:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJQYEoLzh27BGjM8t8CuL1VaENYY7KMkLiiWfqxNX6rsPfgCuE15peGsuNkGPmIReJiRde
X-Received: by 2002:a37:a7c3:: with SMTP id q186mr11462960qke.499.1590159334550;
        Fri, 22 May 2020 07:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590159334; cv=none;
        d=google.com; s=arc-20160816;
        b=p5WY8FOtPeKMEDq+mCDY9I6FncJKZb3SDHj5cZcL0DihVOyb1ea51U5vWmvVFZTSze
         sT7LAaKdx+EqI3TjPR34OayNlPK/kJc7cKVbeiU+PXYBfeRogCUL59wJcgeBh6mdnR1F
         qYmLvTSNWk6uQhfhIZPtDpShDKW8Kaka9+V7LTb3LGjcrNp+KmHoumEFGec7kWcNpU2p
         ZyIvu41CBCer3oe4A6vt/iQenu49HqxyxlbLtHho70AoATqpsn+1CGEu9cDUTtGCLip1
         upKCMQNaO7DGPo7mAPeIR2BIqQdg4a6vOmbQ4w9Di4CWAjwPShiFVJiQ3WHITYZ07/rZ
         NRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=F+XukQGVqGykAC1nJweUZyVkVXMChOdWscCcvUNho9w=;
        b=MfmFNfzRrE69ah1OkNLZMgXMWAuUPTXsenfF5q+X81VmGTwE7JPFabpaoHd4GIw0pv
         NFWsUjlF1eTK/zJ8vKYQV/gkzlzb3jbVvI81iSFYlKkWQsQYQUOB0LYxT2Qz8IiDyHVz
         qY/t805nR0yYFVyNdvxR8R0BI7I6qGpawDb7NYRzSFd1woRvmZdQpFm+XOvDDQ3JW3yy
         YWdP1vAIY6DC25fY+WF4Fab1/BjHbVzfxyGm1BEtQayMIzUCl9cY7ucp3NB3WHJWvCI6
         j1wq1sIOMBgGm5EMO6YNk2hGY7fHk741RUXVJW6JIeiYfFnnaQ+rRtYngcptob66N16U
         f4CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ua/J4A4v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t186si4969965qka.232.2020.05.22.07.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 07:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ua/J4A4v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jc95B-0001sP-Uy
	for alex.bennee@linaro.org; Fri, 22 May 2020 10:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc953-0001qU-9T
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:55:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc952-0006QP-Do
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:55:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id f5so1845246wmh.2
 for <qemu-arm@nongnu.org>; Fri, 22 May 2020 07:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F+XukQGVqGykAC1nJweUZyVkVXMChOdWscCcvUNho9w=;
 b=Ua/J4A4vaHrJ+Wq7rqNCUCRqIeufd5A8X1PNG4SObRbkFuViphkTpGGeLhj9w1W2rf
 0ZaZ8ivajHkFiF6mihONBs0NVSK0CAD23ZVQDm/BdA7AbvIJEu/zFAxvLL8+WuYyGZ2+
 ZjwPGzRxsD7379gw63uHsum3zEKu3F8cNilppOwwUucTKDiym95qOAdyhba41bcXFKoK
 2vUCFHBof5aj2R34nKgT1TSHViZTC9xDEE1vhh2G8YNO2/js49j5bamHIL3FivO9PG4X
 vp+mN5P/nouVxgwI4jhJnjRa+h9Gi8h+6iRdRuzkxjpv7aGcy4GS7ZjaXogOWq0b27O2
 /3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F+XukQGVqGykAC1nJweUZyVkVXMChOdWscCcvUNho9w=;
 b=ZHgwD0guhYEPaDAj0ineuq9yLj+SaC/t8YZQ5rCgVtcGM0mVdC6QDmKbYXScMQI5Tr
 6DyBLsJ8m1Jpr8vMW/41l71/+HlLyDS2xZKyovueo/tCeGLWT3ojaWtwTfTksYBGQeIr
 66y96n+Ghtmn4RwME0TqJ3Q4fFxV5HjEG5HMcLCvSmbqpSaMmUJPoUe89rSU7ljmWVCb
 nctPtBrkNdJ1DMOLZqFfTD5wYVirJTxY6O01vSRq6P/nEMr8uWj7x+4n3gS3oDwmq2pV
 MX3POWkYVcGqh10oIIHssVEPrXdflGSPaP707mFtMOMDCKnAYZwmqhzwMOZgslDg3ZNh
 clRw==
X-Gm-Message-State: AOAM5338sfI5yuSTNo/RtlkZEn144FLktR+TXx03XQpxQQ58TJ0ozs+f
 ELgnYPZMDd1ezYZNkt7IgaCeSSyUpS5I9Q==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr13305515wml.22.1590159322597; 
 Fri, 22 May 2020 07:55:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y8sm1100561wmc.37.2020.05.22.07.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 07:55:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] target/arm: Convert 2-reg-shift and 1-reg-imm Neon
 insns to decodetree
Date: Fri, 22 May 2020 15:55:11 +0100
Message-Id: <20200522145520.6778-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JfIeGKIvPZrT

This patchset converts the Neon insns in the 2-register-and-shift-amount
and 1-register-and-modified-immediate groups to decodetree.

Changes since v1:
 * old patch 1 is now in master
 * patch 1, 2, 3, 4: create and use separate formats for each size of shift
 * patch 5, 6, 7: use new @2reg_shrn_[dsh] formats and keep Q bit in the
   per-insn decode rather than folding it into the format
 * patch 8: use %neon_rshift_i5 in new @2reg_vcvt format
 * patch 9: various changes

Patches still needing review: 1, 5, 9.  (RTH: you might want to look over
2 as well: I didn't use quite the same shift formats you suggested.)

thanks
-- PMM

Peter Maydell (9):
  target/arm: Convert Neon VSHL and VSLI 2-reg-shift insn to decodetree
  target/arm: Convert Neon VSHR 2-reg-shift insns to decodetree
  target/arm: Convert Neon VSRA, VSRI, VRSHR, VRSRA 2-reg-shift insns to
    decodetree
  target/arm: Convert VQSHLU, VQSHL 2-reg-shift insns to decodetree
  target/arm: Convert Neon narrowing shifts with op==8 to decodetree
  target/arm: Convert Neon narrowing shifts with op==9 to decodetree
  target/arm: Convert Neon VSHLL, VMOVL to decodetree
  target/arm: Convert VCVT fixed-point ops to decodetree
  target/arm: Convert Neon one-register-and-immediate insns to
    decodetree

 target/arm/neon-dp.decode       | 196 ++++++++++
 target/arm/translate-neon.inc.c | 625 ++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 488 +------------------------
 3 files changed, 823 insertions(+), 486 deletions(-)

-- 
2.20.1

