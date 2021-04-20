Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2072280lfb;
        Tue, 20 Apr 2021 05:32:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzltpIvYsBAAPFk5HZlkir4AaT17BHeesqf36YoD1tmLWddZARnISKYCzkpF0lw1b9q8ZsP
X-Received: by 2002:a17:906:5487:: with SMTP id r7mr27484193ejo.550.1618921945004;
        Tue, 20 Apr 2021 05:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618921944; cv=none;
        d=google.com; s=arc-20160816;
        b=kYqwVzizD8meesmbA8lZrOe5LCE5WJhhbMS4O0eF1pwbkYwSYokV+Sx0MTKlnic0fy
         1O5tI62ZJ9CuXthgGo00teC9b4dsy4+9BcRKQjDxodxVcz3Ls6KTsHRArSq61lttaO6b
         XdEYboNYK0A1TeRfw0JKTgJHJdMAhy6Fu+G0iP+XBVKxzayc/k79+3GJVAo7L5GBP9EI
         EOSKVm27od7QY8JXBx++v2XlOB7mohqlfFbg6BbfOBvSnHD0ouzoBCVxticuwT/jvjft
         NmlaEbVmRXvfDYXm0mzAuQLayRJUHo0igNspPmF+7KJbeR3jby4SYXUMNxDwLV3nZMv+
         Xrgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=c2oZS2Tl5B0ndAM3GGIWJ8vO0djFNZfzyu4Gas/2FyI=;
        b=Mk/gsLDUKwOKDj8tFRvmwJ8lgYpIiBWUaAgaHnCrgDOyKwdYyBSH+R4wsKWbNjpwm/
         se6nBjMJJvilPQYD3OQ3jy/sYHVGegleNsnG2ZoUx1qk9ymrSC2ndqVg4UK9DVq/7mDo
         +FTRVXKwrmI4pRJ9rO6sbke5WyC6tyz1dUEMsdTE13eSIv6JqyIIbRDrENzQdRlt63QZ
         Uh/reDx6nrRpdE1zlxu4IG5h1DYwoMtDM8KmN/T58rwlStBNAxkbw0SDCrqW/NGYUsfq
         0xZX0BlGIPhxHdBkSgNh4zLB0JEEdI8AsDTEi+vqBjENeVqQXoVgfTvhkG6NkTDBBB+b
         ZJFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S2umNBC9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si4472233ejj.140.2021.04.20.05.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 05:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S2umNBC9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYpYF-0008JO-UN
	for alex.bennee@linaro.org; Tue, 20 Apr 2021 08:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpX8-0008I7-1G
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 08:31:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpX4-00033q-Ds
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 08:31:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id c15so28481916wro.13
 for <qemu-arm@nongnu.org>; Tue, 20 Apr 2021 05:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2oZS2Tl5B0ndAM3GGIWJ8vO0djFNZfzyu4Gas/2FyI=;
 b=S2umNBC9XacFHKm3V3QsrbOwdrXbwufgH6PBgmH3MRHgq2NLm5aXb9FhRrxa1RasYJ
 T5myZ3lkrkIeiR+4agRm2MGorFptbHIbl0Apcb21ovua4pZQqRkMbJvqDXPNiYuy+C9Z
 CTT4W7qJ73hpkevdgExb7PtY964fB3+Y7chd/bfZIJhuiExtYZFYKc37FMT+glcB2h+W
 xKarRFj8/NhSdH6aRDZMN5kKMW5B4nZC8IZ6b4PpyOC3gthn9M+nUuHtU035yIMZ0rZM
 HCI5nzDSFQ0VAWk0wjuhJeaRiksBNJTEC00hcHU/EQAheROEbHKAziNEGOy4mwUT8Q7G
 jylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2oZS2Tl5B0ndAM3GGIWJ8vO0djFNZfzyu4Gas/2FyI=;
 b=K10C6Xq+VBb1TzGNy+e3+RlbvJQ+j55zVaWxtq+EWqaXdoEEZe8DKbwBiUtFZYQExP
 tA+mRPR5EOEBRr/6VnHqZPMqY61jsIGlSk3TxwxPIZbnH/jdaCYBvk9yj4WiTcEMfAnn
 c8oBl5+eZsvqEaGiQM1MGtNubkSuGVDEK94C+Lh7BPOnyvTdz52wzUCne+4pGlro+tui
 cGsSzcz9le52JAYmRtvTdKgNN5i1QlrljRxoYTvhqUuXQcgLj0F2UECRcAcYkRo+9/i5
 scCTWC0OHHh/4HkkDSXUN+BJ/ublzKrnbPWDLS7PfHpKJhFtYEV7OGS8jh1swMNbs+0E
 x53g==
X-Gm-Message-State: AOAM531xtQy3j7zkgAkTT/Uc2waVBYOJJPX2eRl69kVIKroUb5A/leBF
 VNoFB88SnpdZIGE863ronW0tqh6MUlgdiV0e
X-Received: by 2002:adf:f106:: with SMTP id r6mr20082012wro.214.1618921868757; 
 Tue, 20 Apr 2021 05:31:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a15sm26647252wrr.53.2021.04.20.05.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 05:31:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Flush correct TLBs in tlbi_aa64_vae2is_write()
Date: Tue, 20 Apr 2021 13:31:06 +0100
Message-Id: <20210420123106.10861-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oWMlscNMEgU6

In tlbi_aa64_vae2is_write() the calculation
  bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
                            pageaddr)

has the two arms of the ?: expression reversed. Fix the bug.

Fixes: b6ad6062f1e5
Reported-by: Rebecca Cran <rebecca@nuviainc.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d9220be7c5a..957f4247010 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4742,7 +4742,7 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
     bool secure = arm_is_secure_below_el3(env);
     int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
-    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
+    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
                                   pageaddr);
 
     tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
-- 
2.20.1

