Received: by 2002:a17:906:cf8c:b0:9a1:fa4e:495e with SMTP id um12csp434640ejb;
        Thu, 7 Sep 2023 09:04:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJvngmnPSzntf2e7R8jbh39eTag6amDwUXEgy3bObjSjtmRXkIzegs+OvJVplETetf96zF
X-Received: by 2002:a05:6214:4486:b0:63c:f0e2:2b37 with SMTP id on6-20020a056214448600b0063cf0e22b37mr18351663qvb.64.1694102645990;
        Thu, 07 Sep 2023 09:04:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694102645; cv=none;
        d=google.com; s=arc-20160816;
        b=ot295zGvhfB3bpM4WP/Ze7z9Sa4PnJVn6sZ4BwyXOlgRoZh5RsLzeoR+u/yBtUcjEo
         YPMG4BLYH0rbYXCdXyn0R3fLGBCWBOS5zg8CiEArbp2GDysbWtkfiX6QWkeyMiTQMp8Y
         2lbM6THQjz0Ywq4wBNm5QPRw9nCy4NIeYaWixzhNOanTBN+tuj2AMvLgGujECWbssqrH
         YHvWGiINnU7Bxj62en8q4MKMilQDhCw40SEnjhT3Zedy2/nTTL5z1YSlCurp2uOWZrep
         +vWQeDXlN91TybczVx0+CNJSUnOmEwEhThX7uPp1vrTKoBSoZM2wl/YU80g0He4BO9cs
         S2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pr9z6x8cZyDAxlgtwSk5bQrpw1Jw2YIgz6/gNj+f09U=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=uR230d7LNki7glTSC7yorfRy1V6lj2ryz3i89A/0mmiwVqzUDg/LR+CXy3dUd8gzAE
         Q2ld7Up4HFYWPtqQqIElqf26QfslepV4oTpSm05koOBhoPi5wlWOcW8IquESE0HNgwny
         O3DwJvAzXWt66dZ3EPxqBaAt2nt9AqrEffeiSVD97pdY1dpav13MSGse938gacL+5V7G
         Szxr0baTjzNCT4J3XcdsNhzmKWDXSy0N5mb6pSNiIQtNOA99MlenB/ZkCBKWM36pc48B
         7FmUZJTMvNiRrzb2gy3NA1al7hLMtUxUNfoddECx4nYTmWR/btMf49a8aV3/4Z8a+Vqd
         HQbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/tU/eNG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020a0cdb83000000b0063d21173a0csi11851428qvk.589.2023.09.07.09.04.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 09:04:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/tU/eNG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeHTy-0000pI-Mb; Thu, 07 Sep 2023 12:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHTx-0000mR-2q
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHTt-0001zV-6P
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31aeedbb264so1236453f8f.0
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 09:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694102623; x=1694707423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pr9z6x8cZyDAxlgtwSk5bQrpw1Jw2YIgz6/gNj+f09U=;
 b=I/tU/eNG+yKCNorhD4hpCtvCxdUVAljBBSEBprh3QcCLudehgPb8IwoTtUrpoQmLOw
 CXzP0gtJMCXWQYKzXowzbfJ/hzQXYZHKqMnu1RGeVkxKElWWovVkS7pooRuxnr6s8imu
 JFlzsNP/cPKnl/p96Y0Pym5C+LB8dOuM1l8+az7eN1aSCxwpBVrGYNB765tpcvTswMxb
 Vp8LSOZ3rPm6oFVys+nIq+Mqe69aMOXisECwCi1aLURDS3RkIQOTdGSKcL+uCWDIr0jK
 NJFW06RrsLCS8+nxbKvPgq3oE28yLQAlE0AANmnTPRZco9V6A4n8l6RXikwW+4iiVSEi
 Kc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694102623; x=1694707423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pr9z6x8cZyDAxlgtwSk5bQrpw1Jw2YIgz6/gNj+f09U=;
 b=SjRvxXlF/yClVXlERhZ1AWDkQSZu893flyY4aJdNOQ+16LB5Pf5vpPWVJNVGgzuKEC
 6iVgYQbzDUIcjBOqitF6nT0iFngoIFJW4p3QLBHsKTWpe3NOvc44BhhKinJE93TTXD6a
 ci31tsZk3YiMBbSyzSCJCEKypDGaEVLnfZVSIowVQPik5SPZFZ4j5uHVw9AE1yDMnpZ4
 xLTfvKcmb1AYjmQItAJ3WGkpB+uDkunM34oIOr4SejbcgR0wcZOZJju0p8C0xTZ9XdeR
 Vxysrx2xVWmHvs0UIgLWHj9/9QSKRDhbX3PkragXHi1PGze5Pk7PT1UUF/gto7ww6Ebo
 dSBA==
X-Gm-Message-State: AOJu0YyeIbbdHXXxeTwLT5BOl8Y0cjFAJTMFR4IqNgHami0AaXA3A1ZL
 lNRmjQRTmBCylwpRwds+MZIsV69wmr5UkMCVtf8=
X-Received: by 2002:a5d:4ed2:0:b0:315:8a80:329e with SMTP id
 s18-20020a5d4ed2000000b003158a80329emr5302728wrv.40.1694102623485; 
 Thu, 07 Sep 2023 09:03:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfa401000000b0031980294e9fsm20256241wra.116.2023.09.07.09.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 09:03:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/14] target/arm: Don't skip MTE checks for LDRT/STRT at EL0
Date: Thu,  7 Sep 2023 17:03:28 +0100
Message-Id: <20230907160340.260094-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230907160340.260094-1-peter.maydell@linaro.org>
References: <20230907160340.260094-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sYkmecIBAqQl

The LDRT/STRT "unprivileged load/store" instructions behave like
normal ones if executed at EL0. We handle this correctly for
the load/store semantics, but get the MTE checking wrong.

We always look at s->mte_active[is_unpriv] to see whether we should
be doing MTE checks, but in hflags.c when we set the TB flags that
will be used to fill the mte_active[] array we only set the
MTE0_ACTIVE bit if UNPRIV is true (i.e.  we are not at EL0).

This means that a LDRT at EL0 will see s->mte_active[1] as 0,
and will not do MTE checks even when MTE is enabled.

To avoid the translate-time code having to do an explicit check on
s->unpriv to see if it is OK to index into the mte_active[] array,
duplicate MTE_ACTIVE into MTE0_ACTIVE when UNPRIV is false.

(This isn't a very serious bug because generally nobody executes
LDRT/STRT at EL0, because they have no use there.)

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/hflags.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 616c5fa7237..ea642384f5a 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -306,6 +306,15 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                 && !(env->pstate & PSTATE_TCO)
                 && (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))) {
                 DP_TBFLAG_A64(flags, MTE_ACTIVE, 1);
+                if (!EX_TBFLAG_A64(flags, UNPRIV)) {
+                    /*
+                     * In non-unpriv contexts (eg EL0), unpriv load/stores
+                     * act like normal ones; duplicate the MTE info to
+                     * avoid translate-a64.c having to check UNPRIV to see
+                     * whether it is OK to index into MTE_ACTIVE[].
+                     */
+                    DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
+                }
             }
         }
         /* And again for unprivileged accesses, if required.  */
-- 
2.34.1

