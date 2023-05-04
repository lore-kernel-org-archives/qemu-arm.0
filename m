Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp320587ejq;
        Thu, 4 May 2023 06:58:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VWEQp4+FWtjbdcgG89L8V/Aiu9J5HFOYe+KqN4rvWKI5lLLtQxlt29yhgLMPlslEVIiOs
X-Received: by 2002:ac8:5914:0:b0:3e1:bed2:ff0c with SMTP id 20-20020ac85914000000b003e1bed2ff0cmr5413175qty.55.1683208723015;
        Thu, 04 May 2023 06:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683208723; cv=none;
        d=google.com; s=arc-20160816;
        b=LR4I9ooZGmpyzzTvv/YBawjUHm0OdIhVCLsynZ1y+ToUuYmaEXX4UbLKrRyjhKeEoL
         m6Zwvh+lfXOIf5S/MOjr58Rjt08vPhheQjwrxfN4R515+h8VEVIvz09K7iccLrv9SENe
         VDD48cObnjFpiwAgzEfZNpEzb2nF5CoveSMr5nEZMX42RGs8UH6i0NqVell5lBXc3bwZ
         K/9xMDsv3Sid2AMoWC0kYKllUP9rNy6HIz03pIrZX6SgvxaaqGJIz3Ax4XTKlLP5Ei1q
         a2zlooA33CymSgEU2V440oXnfJmdjcMJAFpypIbvJhRpadkqJSwpBUFfBvB/JYUowDbW
         Iy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cSMeFOVndklcI/jbHH1oIdgkQ1sxHzP52KBybeWL69E=;
        b=0+quM65t0peomL1lf8v9ReLqj5kPe8hpeX+wV9JA9eEt5p3eDbVPCEEwVjrHAVzVu3
         E4M5mT845saHk1XoXHgZCFxy9gT3y7QGtzkFAcfxyYughDI1MT0fNB36jU7AC6uMVrCg
         TiEjO1c+Bm57t38mXL9H8sGy+Lfu1C8i6bWyf3hG17zr8YD0kzfyFzxOhKrd2hRnsDdX
         A/5lLtGj7hcis3SCs4M9we6h4dohBK+4XIdWSNtDOOyttSCgnC2FJw8H0BJtrjSB5G2Y
         N/ulUyeiMU+WGgJlfq1tfvHzMZPq4u/ZdXJz7fCkDZ3Gu/IZgYY0JTsPy3xijhNvf3G7
         cJtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i0iA/4P4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020ac85ac8000000b003e38dc1b3ffsi19983803qtd.211.2023.05.04.06.58.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 May 2023 06:58:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i0iA/4P4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puZTO-0007kC-JU; Thu, 04 May 2023 09:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puZPj-0006t2-3a
 for qemu-arm@nongnu.org; Thu, 04 May 2023 09:54:31 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puZPh-0008Eb-J4
 for qemu-arm@nongnu.org; Thu, 04 May 2023 09:54:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso3973225e9.1
 for <qemu-arm@nongnu.org>; Thu, 04 May 2023 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683208467; x=1685800467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSMeFOVndklcI/jbHH1oIdgkQ1sxHzP52KBybeWL69E=;
 b=i0iA/4P46rEWsS9xSMFcXZknTOQ82igTIXQiWX0tIXrLnwZZPKdd6Rgi3HiMR6RD01
 D4C/GGtTB4DSYFpGCKvq6PS1S/VH3aLcffYh8J40HD75IZW2q/8B+00iohtg6XSd6xSR
 xVopkC4a6iFCXcLmpeMge8EUPgnrX/1LXCvbZauD9o9CvOUBNLtCM/Q+dGQ7p30D1RS7
 TU6xRalBxeLDSdUBu/1GIqWrchVDc+TKjb7iDxs3YlQ2HCYvW9BFhp8tjxa17ZTgRxol
 5KjZVLhcL8I+xZyY6W2FE2i7TTB2HOglJ9NeLLc5Xg5cL/CE+ksYT5ihSqsJDoGJExlX
 +jJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683208467; x=1685800467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSMeFOVndklcI/jbHH1oIdgkQ1sxHzP52KBybeWL69E=;
 b=F18gbJmuyXU12xkDCof96CEenS9u1swZngHZ5f4XHLNMzMAhjYCDh5Xcg6CSRtAuJJ
 5wtmSloySzChxXdHqZ1NmMiYOTdGtFG8u+hyQ5RrG84Ir1p8tp41PSUjbG4eEGVJXFNH
 +clpp+rHygwjtebhEA67vK+LRID6NZMaE8+P0GiKL5wE7iwBBMiStnQ9onOz7Ty5DTzX
 5BFl5gwsvfNzQlgC59297TMuSd3kAyOoerneQQUJ/iL4tZFwovV4KtfnhU1tfGgtYoL/
 gtO8D6MMz/8AEYPQtx1HHZ4LqyvgHBJCskAbh6l6BEUoHCnlO+ZgxhLXCauCl0W8dXBf
 JK9g==
X-Gm-Message-State: AC+VfDyOqSuDqVhidoi3X7Zwp1ycJf501qbbVh7jYcY1f5iJP+WM1j0W
 1sy9WM2JlaDE7cmZvaDx3hNe8aM6gnHrG0kP4W0=
X-Received: by 2002:a7b:cbcb:0:b0:3f0:310c:e3cf with SMTP id
 n11-20020a7bcbcb000000b003f0310ce3cfmr16876356wmi.37.1683208467572; 
 Thu, 04 May 2023 06:54:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c0b5600b003f40049a65bsm3800428wmr.21.2023.05.04.06.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 06:54:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/2] target/arm: Don't allow stage 2 page table walks to
 downgrade to NS
Date: Thu,  4 May 2023 14:54:24 +0100
Message-Id: <20230504135425.2748672-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504135425.2748672-1-peter.maydell@linaro.org>
References: <20230504135425.2748672-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TmyUNYQ0InYl

Bit 63 in a Table descriptor is only the NSTable bit for stage 1
translations; in stage 2 it is RES0.  We were incorrectly looking at
it all the time.

This causes problems if:
 * the stage 2 table descriptor was incorrectly setting the RES0 bit
 * we are doing a stage 2 translation in Secure address space for
   a NonSecure stage 1 regime -- in this case we would incorrectly
   do an immediate downgrade to NonSecure

A bug elsewhere in the code currently prevents us from getting
to the second situation, but when we fix that it will be possible.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/ptw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index bd75da8dbcf..8ac6d9b1d0c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1415,17 +1415,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddrmask &= ~indexmask_grainsize;
 
     /*
-     * Secure accesses start with the page table in secure memory and
+     * Secure stage 1 accesses start with the page table in secure memory and
      * can be downgraded to non-secure at any step. Non-secure accesses
      * remain non-secure. We implement this by just ORing in the NSTable/NS
      * bits at each step.
+     * Stage 2 never gets this kind of downgrade.
      */
     tableattrs = is_secure ? 0 : (1 << 4);
 
  next_level:
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
-    nstable = extract32(tableattrs, 4, 1);
+    nstable = !regime_is_stage2(mmu_idx) && extract32(tableattrs, 4, 1);
     if (nstable) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
-- 
2.34.1

