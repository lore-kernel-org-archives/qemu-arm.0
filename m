Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp926699njk;
        Fri, 24 Jan 2025 08:29:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCbYD1aeAVZNISyErN8Rz5PeRFmg5+aRBAs+S7OW2sPWzP8nIXN5jikayz5zcFAiXgP8LZuy/SBftesw==@linaro.org
X-Google-Smtp-Source: AGHT+IHkNxnI51nsO92/vlhRQV5U8NG4LNuWWioj0Nye+n6BAvQTFOQcoyy2KhCKo1BsDrCsAUQy
X-Received: by 2002:a05:620a:430e:b0:7b6:d4a2:f11d with SMTP id af79cd13be357-7be63276899mr4741940185a.50.1737736175215;
        Fri, 24 Jan 2025 08:29:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736175; cv=none;
        d=google.com; s=arc-20240605;
        b=AlpkOX4Vl8Ndb4MOYcdIEObAlPLLywkjiE9BKM422Q8Z3OCYJEVIiHVQ0fi82EjZe3
         05DUuUDBIM6imMqTvhC/AcB4+7sqH7e5M0tX1uK5xqvu1/5gUUUBhdzbbUZ8TeB6HY9c
         m3j3ZP6cem3aBjrAkricyLzybI+T85Sp0lCb0/cpwr5OM78rBgRhhHBcrxJl3Mg+cE/H
         7RSKgQHBjzgsodE+b2b1jETKoFhF/U5Gthmpujn9vjSIFpF7/vI2tHTvQD8fuQFKW4x5
         beDgSyfDidREhHbzwlHMQJZ9FkyB5Y9f6oQRjissdyMVHoduf2vmosxiQqYkbIixCqBP
         atpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PuY6MWGhC3e5y5qwwUhsJwJ57vpQ+lSQf4tubMQ4Og4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=eWDIGlRfD74gb7IdouM6V6se8bRt5sXucQCDTvNPPs2JScpxEp6MDZALivacUh4qk/
         lCuUlZqXZPRY/xgU3r30pfVMzG6bgXd5HzoQmhdGofw1YP6pJqsoXXpaKPs12bTYSvGc
         bqHI7b+azkcXW83WfjaxAL36VZA089wBt0q42q62wbVrREluMLKQoYIR91oGAMrnuJrz
         kWUVOc9OhTIT/1swYTrk9IrbOt19xpepGR95zWGSnJvVGo/ZpqX0Tjk9ZLwYVqZor+XT
         oILmb/abbd3cZp4SaOFdl8P5kFCwEqS67uEPUjcHqrqZJ/uESc0zIPZE2f/oeYcybdR5
         gwuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZdpMs7wy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aeee215si298020885a.351.2025.01.24.08.29.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:29:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZdpMs7wy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMYO-0003sA-Aa; Fri, 24 Jan 2025 11:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMY6-0003Vn-Rn
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:28:52 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMXz-0005Lu-Ov
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:28:45 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361f796586so24583675e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736122; x=1738340922; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PuY6MWGhC3e5y5qwwUhsJwJ57vpQ+lSQf4tubMQ4Og4=;
 b=ZdpMs7wyNJwDFzy+2Mz+2SB1M3zfBODocyjyOJnrxbuwqsoham171a6h+2hctU8HPg
 eTrvpAIl1JktsOLPq3hj5B9DD+WPApYXG0wmQVp538HmCbU+DAShmc4k+mOvWPDtESUp
 XU8TLOPxIxx0V3jq5Hq1mhp4HsBetnQwFdu03Fy4dOcb5JdFd+6X/6tVGb0ybLYsFZSt
 MbY78l+KpCm863EwcphMSbuDQqz6KsoO5wOBeFzkZGk7LYyf1+XDn/7YsMQF4zjh6Gth
 L7US7JjQZTlWBE/DSTbV0pGXwFIK5qrMLTzHA9/qB0G9+vRtBXGukrm5jOnPKRArxUYH
 nfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736122; x=1738340922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PuY6MWGhC3e5y5qwwUhsJwJ57vpQ+lSQf4tubMQ4Og4=;
 b=EY0/1Avebavbx/WlXFAnAP2ZkDXd/cdLN1C7GDMzekCqU0iG01G/JC93XeFBjHzsPM
 8XwLDTzACd+79244FigtZZJ7XQwGUyWwgwFjfd20owZV3ZOzB2HnDGlx01fsYNDvOwxE
 /nUyHU6er7zdvnyj1IEMvVZVaCVC3AZFOHnhWFTqbBIMvkWjWyrjvVSiLYyZB6VHhhDI
 +qDq361EzswZXRXEbCDTkbkc473GBTGex1/7FKX8fnk8tm8/mgWtHRMTkBfpjN1tV0hW
 xdG2/kpQBi3RQAmHVbEBsanVV0wyOeHl4Phg11RdgQiX5AAhLGt9hCY56o7O2ircSeBQ
 93sQ==
X-Gm-Message-State: AOJu0Ywsk94I3K99vhg+JxNdvdW30DGVTfidAH0keykgZA9nXV6Y0+OU
 8gZ70neDceqqFjyIXeAOpLq4KdsLBNs1n2rDYISXQF/h5ZVGbG53rIl2Yi2fns24RwkBrkVZwgH
 B
X-Gm-Gg: ASbGnctd+BWlYz6EWAuTly6P6hfBa2NMVCZhadplEsLXhKYGXncPqcJ6fz/K3sPpOyS
 hRwMTk/vvaGS3GkFImSerm2hS0RtSi4D8qSwlyFTOa4wmvASbYI1CGDpKE7trTzuVCs82SThUXW
 BplF4YBlnxDsmd7bkS+Bb8BM2SKQiYU7+Vr74gV/b/i5GnP2KjHvd/o4aALkMXlt54binhPY3UI
 UxnVXEiC6FaJn4uvcwiFiPyD/9S5IlihcWeciA23OHsv4Eo8Tq1xJV1kyTFiK6WINZcFfruqCeL
 3RoLBCgMdYA=
X-Received: by 2002:a05:600c:1913:b0:434:f4fa:83c4 with SMTP id
 5b1f17b1804b1-43891453fa7mr312500675e9.29.1737736122162; 
 Fri, 24 Jan 2025 08:28:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:28:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/76] target/arm: arm_reset_sve_state() should set FPSR,
 not FPCR
Date: Fri, 24 Jan 2025 16:27:23 +0000
Message-Id: <20250124162836.2332150-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: CAN76yjj4fFY

The pseudocode ResetSVEState() does:
    FPSR = ZeroExtend(0x0800009f<31:0>, 64);
but QEMU's arm_reset_sve_state() called vfp_set_fpcr() by accident.

Before the advent of FEAT_AFP, this was only setting a collection of
RES0 bits, which vfp_set_fpsr() would then ignore, so the only effect
was that we didn't actually set the FPSR the way we are supposed to
do.  Once FEAT_AFP is implemented, setting the bottom bits of FPSR
will change the floating point behaviour.

Call vfp_set_fpsr(), as we ought to.

(Note for stable backports: commit 7f2a01e7368f9 moved this function
from sme_helper.c to helper.c, but it had the same bug before the
move too.)

Cc: qemu-stable@nongnu.org
Fixes: f84734b87461 ("target/arm: Implement SMSTART, SMSTOP")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 63997678513..40bdfc851a5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6413,7 +6413,7 @@ static void arm_reset_sve_state(CPUARMState *env)
     memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
     /* Recall that FFR is stored as pregs[16]. */
     memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
-    vfp_set_fpcr(env, 0x0800009f);
+    vfp_set_fpsr(env, 0x0800009f);
 }
 
 void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
-- 
2.34.1

