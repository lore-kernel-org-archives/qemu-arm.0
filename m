Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1758847lfm;
        Thu, 23 Apr 2020 04:09:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypLqIpjPXIUvEtgVc2tVrFYKOZrXRJU7ame7NljoqMkVgzI43sEDcx9bpRMqsFW0Sco2uX6l
X-Received: by 2002:ac8:4796:: with SMTP id k22mr3269289qtq.215.1587640170686;
        Thu, 23 Apr 2020 04:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587640170; cv=none;
        d=google.com; s=arc-20160816;
        b=YM0oeRNcIakDABXSAOFU7sB4WgleOeIVFwW4IHmFdwvfSSFq0uLnHLepL/Z02rdnkH
         jv6oQ5+FgUGHOoIOGRtKRUjtzvidGBixh27d+I28HurzM1YYI0+u0GZD+ke52bBV4mpq
         +YNAmSKl/W+8YEMgVERedI+aGCKLa0z6YCHgevketCI6ZrHltQY52ybT3yTzEZbdn5NN
         gYL8KYIKwPwJ6UR7FEl03A58tDOuORLvXK1/DxCzy0rmj6oUhJKO5YbnVSIm75lCY30E
         B6JK6nm+F3mqERyZr3Me3HIosysBk2be27pHyvXKxLpE+KRZDG1ojO5G+x/OL1DOxU5t
         61mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=VlGWIXhjhVMOKcrHBCT24bZUCyJntPMX9y4VK0odchk=;
        b=LKu6Y1hnfQGXtX+QF/4ZHiNSEN58IzVfLfYNJUhf03uyhZfq4A8dZ+qQVDILN7vbvc
         jIgmKo0j0C+iPfBY4QmyqmSJcDMBGnTPqzMQP3X9DVec4Cmnv2F3U0SCPYT3NxP/OIIu
         0LRpfaV2TlMzl6PiPNt4E6GboJ4CFK0L8ixiFudrJGu3erE2LPdvOAkAKwKj2Qs4rS7r
         RHICOe1DoC8mnFT+1ym5+wXk4A00/HU/1QV7GEnsxUrKT1hTrbEBcuNsSY+f+RdD3q5q
         A0yGW/OzSf5ajMGdwX1WwUPPASBkGU+R0wGHv08gwRQeUlHr/faVXsadlQrWf8jRJN/3
         zwBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eum+PiPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si1083653qkj.242.2020.04.23.04.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 04:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eum+PiPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRZjW-0006AC-3r
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 07:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRZjN-00067S-V2
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:09:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRZjM-0007pa-3X
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:09:21 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jRZjL-0007nI-JC
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:09:19 -0400
Received: by mail-wr1-x443.google.com with SMTP id b11so6350004wrs.6
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 04:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VlGWIXhjhVMOKcrHBCT24bZUCyJntPMX9y4VK0odchk=;
 b=Eum+PiPOayqHCiEa/E6PHYxAv7LxkfmO5dNWLfbFQs1Iv7vhwkMWHEZDSL/OhVG6+6
 hKnN/msgEjrRzV15B5RqlSeOxY35THIC+Qhrrisa+SmeyXcKbfwykFN6f3vUoHdo6ZzP
 Cp+KZ0AREbCg/CyMLvZEoQXmrhiMVGMSSiZB1jq0WJUYAVJRy2WgmrTm3ZYWmZIwvdLL
 EYRSGDEv6fCYX5upHAT7z2v0a3fxLsoGf2IyQ5t3VlDciwa+5usMM5UJXCINvtsZtSy5
 JHdJo07u4scwPA1Ol2EblcK1DHlojgK0JS1PT5NLYNxgq4987Niw2I3qgN5HG8b5jkHJ
 SbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VlGWIXhjhVMOKcrHBCT24bZUCyJntPMX9y4VK0odchk=;
 b=g2gwzyyopRrYaFGGb3K9IwAFzl0i53Ual78/cKuSRnvuNacT0ffUuMpoDtkc4xqq8R
 RtoBgzeFZMW2ATzXQlIVxDD9QfNS4J/x5ipf2Op8EVoGd+l304d3p5LYu2MKQiTN+wiX
 EtSYgVJHiatNeN8DtjQkKN2g2HTXdZjtubq1sdbdyC7hhWPR0Xr37dFbHVb+BtOPvHyX
 K+UY44Heb1xc2SjpdISjHcJB6A291MtECU8TQtZFoh8X5B1YBgskutNTfCYh/5gGYlie
 8Eb5mrocj8Q5JB7xkgB9TKgZLg/xaUZWDvEv5Dg7RWY6uV0HHYGNh+lBbsiccqwsKrhs
 ua7g==
X-Gm-Message-State: AGi0PuZdr4ml4r9zJ+KB2FGAY+F4chXTNsC99s+ytlSyahOfTcPyd/qL
 RNDkZtDIY/mZ4wyai3SZbLZ+8GOAXje/5A==
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr4198349wrn.209.1587640157758; 
 Thu, 23 Apr 2020 04:09:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l5sm3222495wrm.66.2020.04.23.04.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 04:09:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Use correct variable for setting 'max' cpu's
 ID_AA64DFR0
Date: Thu, 23 Apr 2020 12:09:15 +0100
Message-Id: <20200423110915.10527-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::443
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
X-TUID: VmR6+e+pT1OK

In aarch64_max_initfn() we update both 32-bit and 64-bit ID
registers.  The intended pattern is that for 64-bit ID registers we
use FIELD_DP64 and the uint64_t 't' register, while 32-bit ID
registers use FIELD_DP32 and the uint32_t 'u' register.  For
ID_AA64DFR0 we accidentally used 'u', meaning that the top 32 bits of
this 64-bit ID register would end up always zero.  Luckily at the
moment that's what they should be anyway, so this bug has no visible
effects.

Use the right-sized variable.

Fixes: 3bec78447a958d481991
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 95d0c8c101a..4c7105ea1a1 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -708,9 +708,9 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
         cpu->isar.id_mmfr4 = u;
 
-        u = cpu->isar.id_aa64dfr0;
-        u = FIELD_DP64(u, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
-        cpu->isar.id_aa64dfr0 = u;
+        t = cpu->isar.id_aa64dfr0;
+        t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
+        cpu->isar.id_aa64dfr0 = t;
 
         u = cpu->isar.id_dfr0;
         u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
-- 
2.20.1

